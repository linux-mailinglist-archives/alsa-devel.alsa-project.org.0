Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F376B23EB9F
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 12:37:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9540715F2;
	Fri,  7 Aug 2020 12:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9540715F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596796649;
	bh=bOq48I3pMWe/wg0j4YBpYeOzskafEDL4ZPh6aPpcCxU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S5Oy9wur9h7cd8NU+KcDgn6BjMm7Pem3hVYDFeZCydS4BteY9ubPlQXkOwH8uS8S0
	 tq5PUbh7YvnAegu4ayoA22t5YLu58fFmDKZQUJck7K7IUBLscr4Z+pI4L3AWwABxpC
	 U3kcF8Mkv/Z4prhSHraiazrdb3dTzS0SvE7WoCfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9D68F800AB;
	Fri,  7 Aug 2020 12:35:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57E2BF80218; Fri,  7 Aug 2020 12:35:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A4BFF800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 12:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A4BFF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="d2ullFlR"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f2d2e110001>; Fri, 07 Aug 2020 03:33:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 07 Aug 2020 03:35:34 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 07 Aug 2020 03:35:34 -0700
Received: from [10.26.73.183] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Aug
 2020 10:35:29 +0000
Subject: Re: [PATCH v5 10/11] arm64: tegra: Enable ACONNECT, ADMA and AGIC on
 Jetson Nano
To: Sameer Pujar <spujar@nvidia.com>, <broonie@kernel.org>, <perex@perex.cz>, 
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
References: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
 <1595134890-16470-11-git-send-email-spujar@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <09d7a726-6340-b2cc-ab0f-65be9e3cf625@nvidia.com>
Date: Fri, 7 Aug 2020 11:35:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595134890-16470-11-git-send-email-spujar@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596796433; bh=1t9Lg31PNb6XgN83QFj6fug+yIbeZ1/mCbboRHs0D18=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=d2ullFlRAfwSJMzTLBl0fmRpQzeBryodd0uxwMZQZxggiuX1Qd25tesr8vm+CYakN
 GrxJlNDqvSjTGXz4C8eu61Cn5irFxTWpmeUVhV3VfG7UyOvQcDrQ1IihrtclsxqeCU
 8Df17oWERLpRorPP/GMG6t0b8ottL3gos6p5bWUktrJN7zI6EqX0P6O4/l5J68Ar/c
 5PPFLKP5pU3lW33vPiNXARF/b9mMR4uaueqOY+x6PG4L340RqMB06J4izfS/D9qi1m
 xC0hk5hbOyvhEG7aZ+hHvQLsgYob9cFtI5Y4LAxx9puzswneEVm8DoTKBP4P57stwY
 RtRnmmA85U3zg==
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
> These devices are required for audio sub system and current patch
> ensures probe path of these devices gets tested. Later sound card
> support would be added which can use these devices at runtime.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> index 9b63469..0325fc0 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> @@ -806,4 +806,16 @@
>  
>  		vin-supply = <&avdd_1v05_pll>;
>  	};
> +
> +	aconnect@702c0000 {
> +		status = "okay";
> +
> +		dma@702e2000 {
> +			status = "okay";
> +		};
> +
> +		interrupt-controller@702f9000 {
> +			status = "okay";
> +		};
> +	};
>  };
> 

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
