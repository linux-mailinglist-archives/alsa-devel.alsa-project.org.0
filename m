Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF7047628A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 21:02:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E1771B36;
	Wed, 15 Dec 2021 21:01:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E1771B36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639598542;
	bh=7uIk7xxV3l5vB1ppv1ONzq7K/HXmnyE7EB2qGFKl3ws=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UXLaVBkCpBOcx0rnM3koaNfmc9CoHmmOj0EXs9SmkB4M6vAPKJtrcqI5eWDpWRyZR
	 79FngmLRFFkPpuipNEoqqHQkA3oSE/oOqMAIiXwkR9VkxDYH7RxASEvEwpzfwWpRPH
	 +BE7OZ/IIouiP6v/cEIBiCZ/mmTlP8ftDZJLaeJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADCBDF801F5;
	Wed, 15 Dec 2021 21:01:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5FA9F8019D; Wed, 15 Dec 2021 21:01:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83165F80157
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 21:01:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83165F80157
Received: by mail-oi1-f174.google.com with SMTP id bk14so33211525oib.7
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 12:01:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l+xFFfLKiEhkrb+S6WEQGs0sRTxxdeIwUbUb4lHfegA=;
 b=fLUctX2DPp/uy01d3QeIBzzYmlzrVGbtE0CHVBVPiCGX7XKPZt8o2KFo310L5iiDkd
 f1rcdEuEkWOb3ODRH2HMKpg9Wo5c4Fs2wNQsbuUnpzm2dflY9NVVQdaGUgl3S1fi+HgC
 o4yUJJpwM6vzHnTWH0zOsGO2cJZ8zNfyZfBrZEfmx++kzMOt10a94eQ0f8jSzt3UQMjc
 /GOKHt05EQs7aN7SCU3NSQ5jPZHf6bskjZs+/ofhMtEmDiu+bHxZPk5g/H5yol/ymNWI
 cJGcHw3Whmn7WkSk69VBtzvWzcb7K1gwBGJd9sMqewbTmbtHwpc4E9MyGC9xz13uQEVA
 qpVA==
X-Gm-Message-State: AOAM531Xt5pVZJdU7fyb0FHu+xNGl0iwYelR33n1Gms3T/qAWe5f3LhF
 jJYXsYseNmmo4u5u007Mpg==
X-Google-Smtp-Source: ABdhPJxU2SELg23Wszu5aa+Iw/ImO+xlHwegqhlZfMXLPwQKMl+VsUMi/yrDwMV249upMHcpSYQ0hA==
X-Received: by 2002:aca:2b02:: with SMTP id i2mr1350825oik.140.1639598464509; 
 Wed, 15 Dec 2021 12:01:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e4sm531117oiy.12.2021.12.15.12.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:01:03 -0800 (PST)
Received: (nullmailer pid 1740176 invoked by uid 1000);
 Wed, 15 Dec 2021 20:01:02 -0000
Date: Wed, 15 Dec 2021 14:01:02 -0600
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v2] dt-bindings: sound: nvidia,tegra-audio: Convert
 multiple txt bindings to yaml
Message-ID: <YbpJflKptK3f0EqZ@robh.at.kernel.org>
References: <20211211224946.79875-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211211224946.79875-1-david@ixit.cz>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 ~okias/devicetree@lists.sr.ht
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

On Sat, 11 Dec 2021 23:49:44 +0100, David Heidelberg wrote:
> Convert Tegra audio complex with the
>   * ALC5632
>   * MAX98090
>   * RT5640
>   * RT5677
>   * SGTL5000
>   * TrimSlice
>   * WM8753
>   * WM8903
>   * WM9712
> codec to the YAML format.
> 
> Additional changes:
>  - added missing HPOUTL to the WM9712 codec.
>  - extended rt5677 codec with multiple pins
> 
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> v2:
>  - converted from one big schema into the common properties and then references to it
>  - few additional changes mentioned in commit message
>  .../sound/nvidia,tegra-audio-alc5632.txt      |  48 --------
>  .../sound/nvidia,tegra-audio-alc5632.yaml     |  74 +++++++++++++
>  .../sound/nvidia,tegra-audio-common.yaml      |  83 ++++++++++++++
>  .../sound/nvidia,tegra-audio-max98090.txt     |  53 ---------
>  .../sound/nvidia,tegra-audio-max98090.yaml    |  97 +++++++++++++++++
>  .../sound/nvidia,tegra-audio-rt5640.txt       |  52 ---------
>  .../sound/nvidia,tegra-audio-rt5640.yaml      |  85 +++++++++++++++
>  .../sound/nvidia,tegra-audio-rt5677.txt       |  67 ------------
>  .../sound/nvidia,tegra-audio-rt5677.yaml      | 103 ++++++++++++++++++
>  .../sound/nvidia,tegra-audio-sgtl5000.txt     |  42 -------
>  .../sound/nvidia,tegra-audio-sgtl5000.yaml    |  67 ++++++++++++
>  .../sound/nvidia,tegra-audio-trimslice.txt    |  21 ----
>  .../sound/nvidia,tegra-audio-trimslice.yaml   |  33 ++++++
>  .../sound/nvidia,tegra-audio-wm8753.txt       |  40 -------
>  .../sound/nvidia,tegra-audio-wm8753.yaml      |  79 ++++++++++++++
>  .../sound/nvidia,tegra-audio-wm8903.txt       |  62 -----------
>  .../sound/nvidia,tegra-audio-wm8903.yaml      |  93 ++++++++++++++++
>  .../sound/nvidia,tegra-audio-wm9712.txt       |  60 ----------
>  .../sound/nvidia,tegra-audio-wm9712.yaml      |  76 +++++++++++++
>  19 files changed, 790 insertions(+), 445 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
