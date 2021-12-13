Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E138473609
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 21:36:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0EAF18D9;
	Mon, 13 Dec 2021 21:35:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0EAF18D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639427808;
	bh=6Sw1p8wzJ08Ene/IiYcUH0rXDNbE9IlhWP28cW1U1fQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FPP6VthpLNWSxUsTeCqEzNY6JBNXWHH3xzaiCHi0/Po7CzoK4Gc0DlUtugUwBb1Wx
	 rNUAJwTjS+VC++d7e/A01k/IqhO0ngjKnU8O795iw16tXtDlzoktdlTFXAdugncrUs
	 yW0ThIqAsl1/XTtlpXLsXDJAu+uZarTAsmUsrYyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DA5DF8016A;
	Mon, 13 Dec 2021 21:35:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 536C4F8025D; Mon, 13 Dec 2021 21:35:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B49DF80161
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 21:35:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B49DF80161
Received: by mail-ot1-f47.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso18691945otf.12
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 12:35:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UjShsLmpN0SZM+m8SUUiNDWjd+SPX71KTwqzkwvysM0=;
 b=113QCb+tNk2SR6Eq8AYjtRfKhsTHElw05gFejOsPYuyZ3WvHsDgRLE/FuR9tRey8D7
 DBU9zZBnPAY9Ooa8Tg0ucSE6RZK3+pGI4PAN1xdpXYmWRGurEZwjl+1LfhjB+aslLaZX
 xZDG7ixsGUJfLSwzBdi0L8CnRNSjwJX1dWq2MpydChprCOIhL8cJFwpUM+1aJ2U6U2eg
 +fFwn5AjRagcSaftix5yb+q5TlTHbck37ShFo7QB15s0DWCNY6RG2T+HGXwptgPKKTOr
 gd7p9zSIoIMEDIHGy0rm33114oM+piHlCYl0tEf4Rgwmidg2yAxPeYF8hWcQBVWOua4T
 t9JA==
X-Gm-Message-State: AOAM532lz47dBIGXU1am85X9E4Ox60+MpKzNpISeLLgQl2+o3+hUqNJZ
 5j5eApOSGXidzE881FC++A==
X-Google-Smtp-Source: ABdhPJy3T03Lv6DYRee0EAteJwqi9P/4wzvwMoGsPqpWTMFq+yupuVXKZwoG097ja4/X7OvByWI01w==
X-Received: by 2002:a9d:6190:: with SMTP id g16mr742838otk.54.1639427731541;
 Mon, 13 Dec 2021 12:35:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p10sm2340679otp.53.2021.12.13.12.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 12:35:30 -0800 (PST)
Received: (nullmailer pid 1526504 invoked by uid 1000);
 Mon, 13 Dec 2021 20:35:29 -0000
Date: Mon, 13 Dec 2021 14:35:29 -0600
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [PATCH 0/4] fsl-asoc-card: Add optional dt property for setting
 mclk-id
Message-ID: <YbeukcwXQueEquJZ@robh.at.kernel.org>
References: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 michael@amarulasolutions.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, broonie@kernel.org,
 bcousson@baylibre.com, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
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

On Fri, Dec 03, 2021 at 10:49:26AM -0300, Ariel D'Alessandro wrote:
> This is a follow up of patchset:
> 
>     [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx

Link?

> Sound cards may allow using different main clock inputs. In the generic
> fsl-asoc-card driver, these values are hardcoded for each specific card
> configuration.
> 
> Let's make it more flexible, allowing setting mclk-id from the
> device-tree node.
> 
> Ariel D'Alessandro (4):
>   dt-bindings: sound: Rename tlv320aic31xx-micbias as tlv320aic31xx
>   dt-bindings: tlv320aic31xx: Define PLL clock inputs
>   ASoC: fsl-asoc-card: Add optional dt property for setting mclk-id

'mclk-id' is not documented.

>   ASoC: fsl-asoc-card: Remove BCLK default value for tlv320aic31xx card
> 
>  .../devicetree/bindings/sound/fsl-asoc-card.txt    |  1 +
>  .../devicetree/bindings/sound/tlv320aic31xx.txt    |  2 +-
>  arch/arm/boot/dts/am43x-epos-evm.dts               |  2 +-
>  include/dt-bindings/sound/tlv320aic31xx-micbias.h  |  9 ---------
>  include/dt-bindings/sound/tlv320aic31xx.h          | 14 ++++++++++++++
>  sound/soc/codecs/tlv320aic31xx.c                   |  2 +-
>  sound/soc/fsl/fsl-asoc-card.c                      |  7 ++++++-
>  7 files changed, 24 insertions(+), 13 deletions(-)
>  delete mode 100644 include/dt-bindings/sound/tlv320aic31xx-micbias.h
>  create mode 100644 include/dt-bindings/sound/tlv320aic31xx.h
> 
> -- 
> 2.30.2
> 
> 
