class Institution < ApplicationRecord
    belongs_to  :user
   
    
    has_one_attached :image
    
    enum area: { ho:0, ao:1, iw:2, mi:3, ak:4, ym:5, hk:6, ib:7, to:8, gu:9, sa:10, ti:11, to:12, ka:13, ni:14, to:15, is:16, hu:17, ya:18, na:19, gi:20, si:21, ai:22, mi:23, si:24, ky:25, oo:26, hy:27, na:28, wa:29, to:30, si:31, ok:32, hi:33, ya:34, to:35, ka:36, eh:37, ko:38, hu:39, sa:40, na:41, ku:42, oo:43, mi:44, ka:45, ok:46 } 
end
