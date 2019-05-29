Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F96C2E8A3
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 01:00:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F3531607;
	Thu, 30 May 2019 01:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F3531607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559170853;
	bh=ckhYPZRHlpgXeUlaIgnj8capH5aMIY7m+uR17k4zDYA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fbh6YB9l29l5X7V0WahohCszvOehyU5/J32ZXQVpK+hYiP3kUa2oLEwJlds4urDqz
	 0B0E9PuE0roWPvYv4nUhkxFm9VjliwL84AodmnK0JCUX2wyY040GlzitoijmgrAE+/
	 dJfPDyhE90CcmL669LM8NLH/dr33gaCsS211e1z0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 148EBF896E8;
	Thu, 30 May 2019 00:59:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD24EF896E4; Thu, 30 May 2019 00:59:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1715BF8072E
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 00:59:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1715BF8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="stSrV1RE"
Received: by mail-pl1-x644.google.com with SMTP id g69so1683337plb.7
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 15:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iRXiq08eonK9BxjJjymdgHQ4qGSvRUxD96bZCDtUMV8=;
 b=stSrV1REP7r/iO0UySmKgfFQfgnoSywv5NEtp+3mDh+GJouFI80ivyUakPvqig8Azk
 YgB10Lri9r0RC0ld01sWyFm0/h8uTiv14UMm9g9A5G5CsmRxkOYkpXzsBxF+Q17278tr
 Px91blXo6+fUgF+HLBAuoi2qy4+OyklLJPHr9DZt3StO0PqO4rhu88kqA9lQuNlnPgvN
 yn07ols/kBnUXU7GcG4++x6XMFl1njQt5KNlxr6O8HGncwNDZXgKxrpK6qctCadJc6WV
 PlenhQY9FKgMHji+69msD05gr+N6JwIZ2G+9zzgd1/be20BaLEw4xZLahuoCFZPzkVjy
 dljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iRXiq08eonK9BxjJjymdgHQ4qGSvRUxD96bZCDtUMV8=;
 b=NH4RIk7odjW53OFv9jYAVKNY3E+dXiTW8bxefrRyahLvMjVc2m4aRXk1AFsHF2z+tW
 42t5pGiozJVAlzIN/V4tqCWnNvo5nc0qtdxomkedGtZrnUtuo8aYGLyz2qu+nSlmeO8/
 VtvCoBAkRYpzGhSyih2V2RM1Yl9TKB3aYbrdsYqwpS8Rf7X1Va6rxGANbtYT4i0w/i1A
 Qzxskxh/n7fwg/Id3dN5bP7Q1528ig32XUyDVBsEGs/MDqYH1z8XTonyGMX438c/Y0lL
 WQgbflE4NZiVDEf23BHA5ewWtrXefo6EKs8IwBzdof0QhDQrjFf6bRYV70bguSzwJDwE
 ywPw==
X-Gm-Message-State: APjAAAURqIvhvXydRvzpDBlUGf+dAeivFxwRFVfVRQzDQwId+KnpmHfZ
 8NAmxO41ND63yg7yluVadzE=
X-Google-Smtp-Source: APXvYqx96A2IXwPpSqyQ4BjLhdKAVqBGtW28Z6W8F3//efV2DHQ3i/2tcwUQ5QxYVU6xOHShEZbpJA==
X-Received: by 2002:a17:902:b601:: with SMTP id
 b1mr458014pls.117.1559170740954; 
 Wed, 29 May 2019 15:59:00 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id s66sm822586pfb.37.2019.05.29.15.58.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 May 2019 15:59:00 -0700 (PDT)
Date: Wed, 29 May 2019 15:57:48 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190529225742.GA17556@Asurada-Nvidia.nvidia.com>
References: <20190528132034.3908-1-daniel.baluta@nxp.com>
 <20190528132034.3908-2-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528132034.3908-2-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 1/3] ARM: dts: imx: Add mclk0 clock for SAI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, May 28, 2019 at 01:21:00PM +0000, Daniel Baluta wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Audio MCLK source option is selected with a 4:1 MUX
> controller using MCLK Select bits in SAI xCR2 register.
> 
> On imx6/7 mclk0 and mclk1 always point to the same clock
> source. Anyhow, this is no longer true for imx8.
> 
> For this reason, we need to add mclk0 and handle it
> in a generic way in SAI driver.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  arch/arm/boot/dts/imx6sx.dtsi | 6 ++++--
>  arch/arm/boot/dts/imx6ul.dtsi | 9 ++++++---
>  arch/arm/boot/dts/imx7s.dtsi  | 9 ++++++---

These are dtsi/dts files that have SAI missing mclk0:
arch/arm/boot/dts/imx6ul.dtsi
arch/arm/boot/dts/imx6sx.dtsi
arch/arm/boot/dts/ls1021a.dtsi
arch/arm/boot/dts/imx7s.dtsi
arch/arm/boot/dts/vfxxx.dtsi
arch/arm64/boot/dts/freescale/imx8mq.dtsi
arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi

Would it be possible for you to update the others also?

Thanks
Nicolin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
