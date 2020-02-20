Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA90166082
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 16:09:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AE8316CE;
	Thu, 20 Feb 2020 16:09:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AE8316CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582211399;
	bh=IsMRCtbeAkobDvJcSJu9wAvgMOS2B90Xx1HZTmWmeIY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aOxKyoEWOJKjfkDKl6rbdKr4KVh1VXQxbfrZxq30oX9e59XS7ilA8yRAPAdRQwNOJ
	 lZaR7XCUcHAwmvDzQgmCh19WgmSaZPpqR7Wp+JVZ6WFCdDTY8RCdqF7GbZP8FPrMwl
	 r+bqhndi7WQZ0iaQvn0nsZ5fVzqaj4T8pqNk/EFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E32BF8014A;
	Thu, 20 Feb 2020 16:08:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA749F80148; Thu, 20 Feb 2020 16:08:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34E31F80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 16:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34E31F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="WdHPV5jT"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4ea0900000>; Thu, 20 Feb 2020 07:06:56 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 20 Feb 2020 07:08:08 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 20 Feb 2020 07:08:08 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Feb
 2020 15:08:05 +0000
Subject: Re: [PATCH v3 05/10] ASoC: tegra: add Tegra210 based AHUB driver
To: Sameer Pujar <spujar@nvidia.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-6-git-send-email-spujar@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d6fec11f-3ea3-6da3-ef96-74e4c0a9293e@nvidia.com>
Date: Thu, 20 Feb 2020 15:08:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582180492-25297-6-git-send-email-spujar@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582211216; bh=1fxGENVsrBJEQvVJW5203qUrMQ2k8GsjvtaSYcWTupg=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=WdHPV5jTvllydXKqWZyKo6EBlgdMZLp/IxTT1Aw7dvi/Fg/i9tcpwbLRgqoFEOiDP
 Ot29wZkYEN0vaVQ//R+yG/uYnD8pOVwRnKpTf17zUsjqVxG/0y7/6WSbfQ1Duca6un
 sLTZS5OdHNpEkncE29OMirsLCGIRJmkGrVQCP76FGGVTHaLXrOupWqivrgoREHb8jw
 R80vLvNjtFaphj5Una7wahQJSgPioMKQ5MZl+hb2LSYQ+w8MKgZj14OBQSovO+3Sya
 dZhjFY/rlY4VugyU/hoFWgXEdNO9u6m3smwK8QwP0BvBdvDEXcahbITGg+Wvn5yLVK
 dYMm4GbS/9g+w==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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


On 20/02/2020 06:34, Sameer Pujar wrote:
> The Audio Hub (AHUB) comprises a collection of hardware accelerators for
> audio pre/post-processing and a programmable full crossbar (XBAR) for
> routing audio data across these accelerators in time and in parallel.
> AHUB supports multiple interfaces to I2S, DSPK, DMIC etc., XBAR is a
> switch used to configure or modify audio routing between HW accelerators
> present inside AHUB.
> 
> This patch registers AHUB component with ASoC framework. The component
> driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
> driver exposes AHUB interfaces, which can be used to connect different
> components in the ASoC layer. Currently the driver takes care of XBAR
> programming to allow audio data flow through various clients of the AHUB.
> Makefile and Kconfig support is added to allow to build the driver. The
> AHUB component can be enabled in the DT via below compatible bindings.
>   - "nvidia,tegra210-ahub" for Tegra210
>   - "nvidia,tegra186-ahub" for Tegra186 and Tegra194
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  sound/soc/tegra/Kconfig         |  10 +
>  sound/soc/tegra/Makefile        |   2 +
>  sound/soc/tegra/tegra210_ahub.c | 651 ++++++++++++++++++++++++++++++++++++++++
>  sound/soc/tegra/tegra210_ahub.h | 125 ++++++++
>  4 files changed, 788 insertions(+)
>  create mode 100644 sound/soc/tegra/tegra210_ahub.c
>  create mode 100644 sound/soc/tegra/tegra210_ahub.h


Aside from Randy's comment ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
