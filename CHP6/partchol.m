function[L,B,perm,n1] = partchol(H)
    n = length(H);
    perm = 1 : n;
    B = H;
    L = zeros(n);
    v = 0.5;
    k = 1;
    n1 = 0;

while k <= n
    
    [ur,r] = max([zeros(1,k-1) diag(B(k:n,k:n))']);

    if k < n

        upr = max(abs(B(r,[1:r-1 r+1:n])));

    else
        
        upr = 0;

    end
    
    if ((ur > 0) & (ur>= v*upr))

        n1 = k;
        perm([k r]) = perm([r k]);
        B([k r],:) = B([r k],:);
        B(:,[k r]) = B(:,[r k]);
        L(perm(k:n),k) = (B(k:n,k)/B(k,k));

        if k < n
        
            B(k+1:n,k+1:n) = B(k+1:n,k+1:n)-L(perm(k+1:n),k)*B(k,k+1:n);
            B(k+1:n,k) = zeros(n-k,1);
            B(k,k+1:n) = zeros(1,n-k);
        end
        
        k = k+1;
       
    else
        
        L(perm(k:n),k:n) = eye(n-k+1);
        k = n+1;
    end
end 