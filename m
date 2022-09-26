Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7EA5EB196
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 21:49:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4F3F827;
	Mon, 26 Sep 2022 21:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4F3F827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664221788;
	bh=IcmmOyA1c0JuJRvFFMtXoL5VOQ4dw2vatEVPNqdGLzk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uYhE+CkzHR1nQbdV7ual8KEM6tCOP9MbDQehdH4/hToiLUaddJUDHT1RryKsJEvLm
	 wnL4Zb0vSrpxVbZkjahDSvsDzwNOjzsaaP7Dozd+Xz9T+hYbaiuorkH+F49TY6vXPZ
	 zZiXe2NFWDvQTemEnMbRHDIVNbqI2HsfGZvbz4y8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07E43F802BE;
	Mon, 26 Sep 2022 21:48:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49F5CF80134; Mon, 26 Sep 2022 21:48:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B082F80134
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 21:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B082F80134
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-127dca21a7dso10613949fac.12
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 12:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=M50FI7LNj1aukpmOfyVHjUDvsfAXsOHY9FPlj/V6CBo=;
 b=i1jHcj0rvPRh9kTFzDhFyrFX3IZjI+Sv3la2cUMG0vKS2cmbZx/Q8mDVO9oorVEAl9
 +SkHAKTl7sNvOwL3UGuOCHeYbWa6OnnRVcoV8g7wBkkcqXU/Z/BlfvA00wKMPAsMGcYN
 E4Isst1EJZC9jaJrEoB+JWsF6efloKWGEORClB83ro7RdyCGnbY5Yo3/MwS0eQyLY3L7
 cHP/GRY7nnNV+LH15Sq6AHv3UxpivnzzVs2cUHii+HNyUKTL0Xq0sDnApA4JywQkyUBb
 Nof/AWzeOruyvKArg+taob95s0uyrC1IyzHf7An9QUdOpy+E9c/A0W+z95YLVuNTSJpH
 L5UA==
X-Gm-Message-State: ACrzQf0Fwl37w8hnYHF6tQfPSK8IRyiGQF4p6xk7BhGLFVK6nvH8Dlhs
 UkKqRS523l1s0BAG9ZXycg==
X-Google-Smtp-Source: AMsMyM6Br1/MAg6GDzGavnanJLMgJ/Uf+HWn8UkUSSrF2UjAIQWyzkfE3qsANrovvBLiJVEF2w+YjA==
X-Received: by 2002:a05:6871:b26:b0:127:7d57:9e28 with SMTP id
 fq38-20020a0568710b2600b001277d579e28mr188586oab.141.1664221713866; 
 Mon, 26 Sep 2022 12:48:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k23-20020a056870959700b000f5e89a9c60sm10413556oao.3.2022.09.26.12.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 12:48:33 -0700 (PDT)
Received: (nullmailer pid 2677686 invoked by uid 1000);
 Mon, 26 Sep 2022 19:48:32 -0000
Date: Mon, 26 Sep 2022 14:48:32 -0500
From: Rob Herring <robh@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH 1/5] ASoC: kirkwood: enable Kirkwood driver for Armada
 38x platforms
Message-ID: <20220926194832.GA2668987-robh@kernel.org>
References: <20220920132648.2008-1-pali@kernel.org>
 <20220920132648.2008-2-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220920132648.2008-2-pali@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marcin Wojtas <mw@semihalf.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
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

On Tue, Sep 20, 2022 at 03:26:44PM +0200, Pali Rohár wrote:
> From: Marcin Wojtas <mw@semihalf.com>
> 
> The audio unit of Marvell Armada38x SoC is similar to the ones comprised by
> other Marvell SoCs (Kirkwood, Dove and Armada 370). Therefore KW audio
> driver can be used to support it and this commit adds new compatible string
> to identify Armada 38x variant.
> 
> Two new memory regions are added: first one for PLL configuration and
> the second one for choosing one of audio I/O modes (I2S or S/PDIF).
> For the latter purpose a new optional DT property is added ('spdif-mode').
> 
> kirkwood-i2s driver is extended by adding a new init function for Armada
> 38x flavor and also a routine that enables PLL output (i.e. MCLK)
> configuration.
> 
> Signed-off-by: Marcin Wojtas <mw@semihalf.com>
> Tested-by: Star_Automation <star@marvell.com>
> Reviewed-by: Nadav Haklai <nadavh@marvell.com>
> Reviewed-by: Lior Amsalem <alior@marvell.com>
> Tested-by: Lior Amsalem <alior@marvell.com>
> Signed-off-by: Hezi Shahmoon <hezi@marvell.com>
> Reviewed-by: Neta Zur Hershkovits <neta@marvell.com>
> [pali: Fix support for pre-38x SoCs]
> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
>  .../devicetree/bindings/sound/mvebu-audio.txt |  14 +-
>  sound/soc/kirkwood/kirkwood-i2s.c             | 136 +++++++++++++++++-
>  sound/soc/kirkwood/kirkwood.h                 |   2 +
>  3 files changed, 149 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mvebu-audio.txt b/Documentation/devicetree/bindings/sound/mvebu-audio.txt
> index cb8c07c81ce4..4f5dec5cb3c2 100644
> --- a/Documentation/devicetree/bindings/sound/mvebu-audio.txt
> +++ b/Documentation/devicetree/bindings/sound/mvebu-audio.txt
> @@ -6,9 +6,14 @@ Required properties:
>    "marvell,kirkwood-audio" for Kirkwood platforms
>    "marvell,dove-audio" for Dove platforms
>    "marvell,armada370-audio" for Armada 370 platforms
> +  "marvell,armada-380-audio" for Armada 38x platforms

Perhaps be consistent with the 370 string above it.

>  
>  - reg: physical base address of the controller and length of memory mapped
> -  region.
> +  region (named "i2s_regs").

So you are adding 'reg-names'? The values belong under 'reg-names' then. 
'_regs' is also redundant.


> +  With "marvell,armada-380-audio" two other regions are required:
> +  first of those is dedicated for Audio PLL Configuration registers
> +  (named "pll_regs") and the second one ("soc_ctrl") - for register
> +  where one of exceptive I/O types (I2S or S/PDIF) is set.
>  
>  - interrupts:
>    with "marvell,kirkwood-audio", the audio interrupt
> @@ -23,6 +28,13 @@ Required properties:
>  	"internal" for the internal clock
>  	"extclk" for the external clock
>  
> +Optional properties:
> +
> +- spdif-mode:
> +  Enable S/PDIF mode on Armada 38x SoC. Using this property
> +  disables standard I2S I/O. Valid only with "marvell,armada-380-audio"
> +  compatible string.

So boolean?

> +
>  Example:
>  
>  i2s1: audio-controller@b4000 {

DT changes should be separate patch. It would also be nice to see this 
converted to schema first.

Rob
