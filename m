Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F39166090
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 16:12:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF95C16D5;
	Thu, 20 Feb 2020 16:11:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF95C16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582211525;
	bh=4dpaNDCNECG6zSKvNOmZjPU/aUyF9SRvNXqLuUEXYo4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BrWL26Vhy0B7AtyBoufDEHXOqrvWX/O19RHGsSQFpuQ/lQnHMRsYsJ2cmS5VsAC06
	 JVJAsNGJjJQX16DmB5PJ3fIQ8u3/FhA0WJOA3aCaB5RCPs7XtgXs1mLGD1VTDwyEQB
	 tYqSoU3kU9Nc0tImF1ABbcVawO+X3Zz3b39xR/c0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2904F80148;
	Thu, 20 Feb 2020 16:10:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4996CF80148; Thu, 20 Feb 2020 16:10:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45887F80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 16:10:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45887F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="iJiqZm/8"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4ea14a0000>; Thu, 20 Feb 2020 07:10:02 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 20 Feb 2020 07:10:15 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 20 Feb 2020 07:10:15 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Feb
 2020 15:10:12 +0000
Subject: Re: [PATCH v3 06/10] ASoC: tegra: add Tegra186 based DSPK driver
To: Sameer Pujar <spujar@nvidia.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-7-git-send-email-spujar@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <21f89564-2e04-7d06-bb07-5fa488d9ee8f@nvidia.com>
Date: Thu, 20 Feb 2020 15:10:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582180492-25297-7-git-send-email-spujar@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582211402; bh=DqhgkJnHxUcz8diUkAKKorYICLcz915PBRp2VzGuspI=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=iJiqZm/8CmQ+plBvUef6JAzfIwThPCK7ELdBLATXQ1HHnhpPGcC6AMs5eGG50IHC/
 qZyeHfJ4KuLem1QhEnqfHr6Tw/j4PStoRmi5VYIWKizvoGMfNxm3Q/qALQygxJgU1j
 DMUp3OoK8kZFgspILqGleRn4nDu9vdFkWMH33SQdG5n2KpGXM9uOxXhGu5Z8yeOO5U
 mLp06zsH2VCH/z3sfEieQ+gQ+CVLPvzCQekA0fqtYrFUnw+txu0u2KTUzLzE6Ita7k
 sJqSWo/Wj6KwwDfuuQKSBG3TIfVF0QYsr9Pm4Ka69rKw75EcrftJ/J+mX1c/Wd/HTz
 mwFQxuse41eKw==
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
> The Digital Speaker Controller (DSPK) converts the multi-bit Pulse Code
> Modulation (PCM) audio input to oversampled 1-bit Pulse Density Modulation
> (PDM) output. From the signal flow perpsective, the DSPK can be viewed as
> a PDM transmitter that up-samples the input to the desired sampling rate
> by interpolation then converts the oversampled PCM input to the desired
> 1-bit output via Delta Sigma Modulation (DSM).
> 
> This patch registers DSPK component with ASoC framework. The component
> driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
> driver exposes DSPK interfaces, which can be used to connect different
> components in the ASoC layer. Makefile and Kconfig support is added to
> allow to build the driver. The DSPK devices can be enabled in the DT via
> "nvidia,tegra186-dspk" compatible binding. This driver can be used
> on Tegra194 chip as well.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  sound/soc/tegra/Kconfig         |  13 +
>  sound/soc/tegra/Makefile        |   2 +
>  sound/soc/tegra/tegra186_dspk.c | 510 ++++++++++++++++++++++++++++++++++++++++
>  sound/soc/tegra/tegra186_dspk.h |  73 ++++++
>  4 files changed, 598 insertions(+)
>  create mode 100644 sound/soc/tegra/tegra186_dspk.c
>  create mode 100644 sound/soc/tegra/tegra186_dspk.h

Aside from Randy's comment ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
