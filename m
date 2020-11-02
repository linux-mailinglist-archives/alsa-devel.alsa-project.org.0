Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A87392A3E00
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:49:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3839F1767;
	Tue,  3 Nov 2020 08:48:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3839F1767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604389783;
	bh=llDcnr0CynY2GBGor2yC3OzSEAGF2hJkiTa9LN/BldE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BuYb9gmppdhDWbS1cY1AnPqupqtESD4JszISOFQZKYIbSpmI4qtbNN9oYjHPWffvy
	 XIa8ix0qKRSKTH6A1ppHpB801ksrb8XeS9GAhs4kmNYLKq8ngtuUT6n0dXTWR+UUq6
	 XYzYzqXjN3TE00u+FmXwg47JFoKKlcIPCydtIRDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C966EF804F1;
	Tue,  3 Nov 2020 08:45:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6690F80232; Mon,  2 Nov 2020 15:47:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A133DF8015A
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 15:47:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A133DF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="GQGMTbEl"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa01c190001>; Mon, 02 Nov 2020 06:47:53 -0800
Received: from [172.27.13.219] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Nov
 2020 14:47:39 +0000
Subject: Re: [PATCH mlx5-next v1 02/11] net/mlx5: Properly convey driver
 version to firmware
To: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, gregkh <gregkh@linuxfoundation.org>
References: <20201101201542.2027568-1-leon@kernel.org>
 <20201101201542.2027568-3-leon@kernel.org>
From: Roi Dayan <roid@nvidia.com>
Message-ID: <67ff0c7b-d111-9e8f-76d5-858ecf4ba692@nvidia.com>
Date: Mon, 2 Nov 2020 16:47:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201101201542.2027568-3-leon@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604328473; bh=8Ups38YJuQ+UfstT0esti7tM74Cc7GXxoMtke6CiT2s=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=GQGMTbElQGFFPjgRGdF7N1IK6iE/aXb6Jrl/qA2b839r/fv3l5hbzRjO/9ZEYnlRR
 dq2AD6G/KJzN3NjAoVeRYUtS+M0bNkgF1VS4sjStSMS/cmgiEUYY35MaDgi4ldDnsY
 Yz1E198i97yHS4kopwrYJd7kVMwj4YrVFNiOwiryHB5toEjt61g3DL+3vj794icIoN
 bz6roc98IvYgNaVd2E49fmBBySriSEanlWaDQ4lbG+jjX3WKsD3HoMR0npBeeBvSOT
 UHetBjOSaDHOE0X9W4smdCtKZGdEaYaq57b1Pjtt6JhtJWqZZSZZjjBnEs2j5O8hWw
 S5ysyN/kqw0bg==
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:45:22 +0100
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kiran.patil@intel.com, "Michael S.
 Tsirkin" <mst@redhat.com>, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, ranjani.sridharan@linux.intel.com,
 virtualization@lists.linux-foundation.org, fred.oh@linux.intel.com,
 tiwai@suse.de, broonie@kernel.org, Parav Pandit <parav@nvidia.com>,
 shiraz.saleem@intel.com, Jakub Kicinski <kuba@kernel.org>,
 dan.j.williams@intel.com, Leon Romanovsky <leonro@nvidia.com>,
 Saeed Mahameed <saeedm@nvidia.com>, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 2020-11-01 10:15 PM, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> mlx5 firmware expects driver version in specific format X.X.X, so
> make it always correct and based on real kernel version aligned with
> the driver.
> 
> Fixes: 012e50e109fd ("net/mlx5: Set driver version into firmware")
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>   drivers/net/ethernet/mellanox/mlx5/core/main.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net/ethernet/mellanox/mlx5/core/main.c
> index 8ff207aa1479..71e210f22f69 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
> @@ -50,6 +50,7 @@
>   #ifdef CONFIG_RFS_ACCEL
>   #include <linux/cpu_rmap.h>
>   #endif
> +#include <linux/version.h>
>   #include <net/devlink.h>
>   #include "mlx5_core.h"
>   #include "lib/eq.h"
> @@ -233,7 +234,10 @@ static void mlx5_set_driver_version(struct mlx5_core_dev *dev)
>   	strncat(string, ",", remaining_size);
> 
>   	remaining_size = max_t(int, 0, driver_ver_sz - strlen(string));
> -	strncat(string, DRIVER_VERSION, remaining_size);
> +
> +	snprintf(string + strlen(string), remaining_size, "%u.%u.%u",
> +		 (u8)(LINUX_VERSION_CODE >> 16), (u8)(LINUX_VERSION_CODE >> 8),
> +		 (u16)(LINUX_VERSION_CODE & 0xff));
> 
>   	/*Send the command*/
>   	MLX5_SET(set_driver_version_in, in, opcode,
> --
> 2.28.0
> 

Reviewed-by: Roi Dayan <roid@nvidia.com>
