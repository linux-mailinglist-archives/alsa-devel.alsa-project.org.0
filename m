Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8516023E050
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 20:28:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B85D1662;
	Thu,  6 Aug 2020 20:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B85D1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596738538;
	bh=T6JIJMZkWYuxSyqtNLjEezMBSHJjR4L9jWNfDNzVXIo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qpQzIl7dZnE+kpQ0p9nO0YWak/UJW4WlpqrpxARrC3AqFdyDl+TFZr6XxW5NREOst
	 rz6JK+d/RY7hTm9Q4uZQsJMeGheUwqSuYjBlOB5oEefMMo0WNgwzSizXLjePwiR6nL
	 3t5XaqbzCJiCowoQOSHfS/KAv5YRACXN3VcVxNCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC6F1F80308;
	Thu,  6 Aug 2020 20:24:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67426F80307; Thu,  6 Aug 2020 20:24:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC070F800B7
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 20:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC070F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="UXnpUM3b"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f2c4abf0001>; Thu, 06 Aug 2020 11:24:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 06 Aug 2020 11:24:13 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 06 Aug 2020 11:24:13 -0700
Received: from [10.26.73.183] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Aug
 2020 18:24:07 +0000
Subject: Re: [PATCH v5 09/11] arm64: defconfig: Build ADMA and ACONNECT driver
To: Sameer Pujar <spujar@nvidia.com>, <broonie@kernel.org>, <perex@perex.cz>, 
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
References: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
 <1595134890-16470-10-git-send-email-spujar@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <86606b00-8ec8-608e-4b94-eff3e6ad2723@nvidia.com>
Date: Thu, 6 Aug 2020 19:24:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595134890-16470-10-git-send-email-spujar@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596738240; bh=cTftzqwrcOCcgqbdPCuAeNHtGbe/8tzV0BRaVzfY7L0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=UXnpUM3bOKlamWewcwTU7jrr8O+fpdIHdPil6rIITe74wWhK8MxNAeF6W612FQ9vu
 Rt865JY8RIwKW2kYND7ndjYPgp4o5S3Rngy6jAY+iFLxkotNI8IEu2eKOJxfsJP5LH
 hTjjrL12auCb+M6VlbOwTPaw7h8WX9gzrp/++lrfe0bcdZGH4shJ7TOm5aYm5DpK5X
 u8+MDuaR0uEcuVzGRDIgTEi1FSUQgMO3ry5ZxonAqulla0irV2tlZeG78ChNyJNyJv
 qKAIY0O1b+46+uIs4UV1Mb6o+QmR/wOF0qidaZyvmF9GIVXDYej13ZOYfv8+ChYlgs
 XaXnFdu+uADRg==
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 nwartikar@nvidia.com, linux-kernel@vger.kernel.org, atalambedu@nvidia.com,
 viswanathl@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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


On 19/07/2020 06:01, Sameer Pujar wrote:
> This commit builds ADMA and ACONNECT drivers which can be used on
> Tegra210 and later platforms to transfer audio data to/from AHUB
> (Audio Hub).
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 4976e1a..7bc093a 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -219,6 +219,7 @@ CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
>  CONFIG_HISILICON_LPC=y
>  CONFIG_SIMPLE_PM_BUS=y
>  CONFIG_FSL_MC_BUS=y
> +CONFIG_TEGRA_ACONNECT=m
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_CFI=y
> @@ -788,6 +789,7 @@ CONFIG_MV_XOR_V2=y
>  CONFIG_OWL_DMA=y
>  CONFIG_PL330_DMA=y
>  CONFIG_TEGRA20_APB_DMA=y
> +CONFIG_TEGRA210_ADMA=m
>  CONFIG_QCOM_BAM_DMA=y
>  CONFIG_QCOM_HIDMA_MGMT=y
>  CONFIG_QCOM_HIDMA=y

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
