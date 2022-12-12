Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A3C64A5F2
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 18:33:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B424B29EB;
	Mon, 12 Dec 2022 18:32:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B424B29EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670866429;
	bh=JSpsPaWjY3eudbST0PRmDeg8KHtXvxdVDtalyWk5bF4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PuMTRM4aoOlAiLngDe0MuMKQCrtgjFwY5/zfN72+Uom79NIFIXKL5dYWmeLOzIxwo
	 g3PRFQcypooXsxe8uhIJrQUOW1irG1yYqmftAOrXuwcf7H2j+pExNd4vG7pr9MfJIq
	 KWUAG08nmVVnmQtxmbfVrT0K2I4m56zOrRZoR8Go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C8A6F800F8;
	Mon, 12 Dec 2022 18:32:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1168EF8042F; Mon, 12 Dec 2022 18:32:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8B9BF800F8
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 18:32:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8B9BF800F8
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-144b21f5e5fso9218910fac.12
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 09:32:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4c0Q/vD5iPPOpm9+SZu8G9CtEcI/+Ys6P4p1qjE2xVw=;
 b=4Hab7JgaoDabWEiBc9tYayjARpaZifpOcK5w5B2pl0w09ZrZwGnEUIizLwoTZuXoWm
 vKyeHB3qSlTjvPcsLiUF+XJw9lJ8Bj4NXWDkOGCBdYfdWkQ5qapQqn1VY/CWrLKtpZZp
 iv3aZFbVWi0NCaFeQwgJe4D73W16nEy67LWmqrnJEyk+e7h4w7P/de0/WoUdyIfxuFuz
 oMKiUW3Ip25Y6sSX07RBPAxkJEvHgRlm+ZzxDRMh61iC8wC7F682jFwk/7kWGuEVIquC
 2V5A3Kj187jn1cJmd8BeSNC0upmyKAXpUVBLd+VgYoQeizNzvwRdqOauXv8F2xle/yGU
 Y+XQ==
X-Gm-Message-State: ANoB5pmGPhKtSuHI3CJ1UZRVf1S9lH1M+MJT4MLXtvaqM4BGGbvn7i+i
 oBW1L8wa/X5r46w7JFk7bg==
X-Google-Smtp-Source: AA0mqf5PsnRpjqPKGdBWGgDCZdAgNhbyqlTcPwwBpTvVw9k5vDQwoMoTIyNNqsRM0T5EzRgviQXaIQ==
X-Received: by 2002:a05:6870:7985:b0:143:ffca:a9de with SMTP id
 he5-20020a056870798500b00143ffcaa9demr7920858oab.9.1670866367008; 
 Mon, 12 Dec 2022 09:32:47 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a22-20020a4ab796000000b004a0a7b08d9asm156388oop.19.2022.12.12.09.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 09:32:46 -0800 (PST)
Received: (nullmailer pid 1173504 invoked by uid 1000);
 Mon, 12 Dec 2022 17:32:45 -0000
Date: Mon, 12 Dec 2022 11:32:45 -0600
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: microchip: use proper naming
 syntax
Message-ID: <20221212173245.GA1171311-robh@kernel.org>
References: <20221212164153.78677-1-claudiu.beznea@microchip.com>
 <20221212164153.78677-2-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212164153.78677-2-claudiu.beznea@microchip.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 nicolas.ferre@microchip.com, tiwai@suse.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Dec 12, 2022 at 06:41:50PM +0200, Claudiu Beznea wrote:
> Use the following syntax for Microchip ASoC YAML files:
> vendor,device.yaml
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  .../bindings/sound/mchp,i2s-mcc.yaml          | 108 ------------------

Deleting? Why? That's not what the commit message says.

>  ...,pdmc.yaml => microchip,sama7g5-pdmc.yaml} |   0
>  ...rx.yaml => microchip,sama7g5-spdifrx.yaml} |   0
>  ...tx.yaml => microchip,sama7g5-spdiftx.yaml} |   0
>  4 files changed, 108 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
>  rename Documentation/devicetree/bindings/sound/{microchip,pdmc.yaml => microchip,sama7g5-pdmc.yaml} (100%)
>  rename Documentation/devicetree/bindings/sound/{mchp,spdifrx.yaml => microchip,sama7g5-spdifrx.yaml} (100%)
>  rename Documentation/devicetree/bindings/sound/{mchp,spdiftx.yaml => microchip,sama7g5-spdiftx.yaml} (100%)

These will all fail binding checks. You need to update the $id values.

Rob
