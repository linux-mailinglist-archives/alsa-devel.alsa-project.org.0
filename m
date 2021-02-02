Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A97C630BF41
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 14:24:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC8AE1770;
	Tue,  2 Feb 2021 14:23:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC8AE1770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612272287;
	bh=zItDC036GaiQEg8bQdScp8O6DuMNkw9B0eEqTGkMZ2w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hyI+unhQ2gfaFDzoCO3VgIakGXkEisBGtyuU8UrQfx4GBkSs9/twKBOZGcn/3d5br
	 JsZ4S5P9KwZJd90Cz82q/CJfdnqFHLZyNsUmrv6uC4qqEh+n3YH/HZUai0GIe5jr9I
	 RjpjWSF/D2RQBNk3McsncH+pLT35xArj/bbD68fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C1B4F8023C;
	Tue,  2 Feb 2021 14:23:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 734E4F8023B; Tue,  2 Feb 2021 14:23:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20335F801F7
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 14:23:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20335F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="rTpIJ/g2"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601952590001>; Tue, 02 Feb 2021 05:23:40 -0800
Received: from [10.26.73.224] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Feb
 2021 13:23:33 +0000
Subject: Re: [PATCH v1 0/2] ASoC: tegra: Add RT5631 machine driver
To: Ion Agorria <AG0RRIA@yahoo.com>, Thierry Reding
 <thierry.reding@gmail.com>, Stephen Warren <swarren@nvidia.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Rob Herring
 <robh+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria
 <ion@agorria.com>, Dmitry Osipenko <digetx@gmail.com>
References: <20210131184101.651486-1-AG0RRIA.ref@yahoo.com>
 <20210131184101.651486-1-AG0RRIA@yahoo.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <82a3375e-6105-875c-3332-33fcf2c0f785@nvidia.com>
Date: Tue, 2 Feb 2021 13:23:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210131184101.651486-1-AG0RRIA@yahoo.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612272220; bh=JyikfCz92yVxYA1vOLWUM2dzdGU1IyM4ZHB619+pRO0=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=rTpIJ/g2VXPd3nMwrYy0HW85u5vFpktSaNiXq7yTpUMKl4wrPtV2PlwXgnHHNqrNc
 UYYYdfBH2gzCGkBwKPMNkE5w4kZBbqfVXWOOEy2C9BIEHdhhb+u3AO0uV5hCWzQE0K
 eqwV5HZGToPMGLHjX3pPeCXFw5gSyVPHgbTNfLD0iGSu3lrfpHhgU5ukYBAhjvb0i3
 Y0v25eJ4onjXonF0ABo6aUqktZye5+z6YPxSLkgsSaJc/sl+lq33Hr+s69uVN6iaoK
 EQAXpeZVhub2Didns7ImYnwoMG28lV0u/Of5SwlTek4k8MmBV0qEeQcLdZVvXcHfd7
 juLI4hxRI0/mw==
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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


On 31/01/2021 18:40, Ion Agorria wrote:
> From: Ion Agorria <ion@agorria.com>
> 
> Adds support for Tegra SoC devices with RT5631 sound codec.
> Playback to speakers, headphones and internal mic recording works.
> 
> This driver is used for ASUS Transformer TF201, TF700T and others
> Tegra based devices containing RT5631.
> 
> Svyatoslav Ryhel (2):
>   ASoC: dt-bindings: tegra: Add binding for RT5631
>   ASoC: tegra: Add RT5631 machine driver
> 
>  .../sound/nvidia,tegra-audio-rt5631.yaml      | 134 +++++++++
>  sound/soc/tegra/Kconfig                       |   8 +
>  sound/soc/tegra/Makefile                      |   2 +
>  sound/soc/tegra/tegra_rt5631.c                | 261 ++++++++++++++++++
>  4 files changed, 405 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
>  create mode 100644 sound/soc/tegra/tegra_rt5631.c


I don't see any user of this driver included. Any reason why?

Jon

-- 
nvpublic
