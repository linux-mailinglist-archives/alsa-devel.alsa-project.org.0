Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B94565656F
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Dec 2022 23:36:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C927663CD;
	Mon, 26 Dec 2022 23:36:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C927663CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672094216;
	bh=btT00mhezy9HTF1lIp7RKA+PUTUm+XbEB3t4kOpzlXE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=n8QstjfJZHBlkvrG2ulhCFRbuYUkJRdzULEOXKQBQS+dZS5Yu+iAcDopGB1j+dBZO
	 pPGtjmsf5Wrew7wEgN/UcaRMW4UUGjtK2NL9hA62UiKiD+9aqqjP2xoPJ4rjGvg64t
	 aLpxByloS4183WNIMNXZqcRIdSWfbSQF/H0/JSwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12AB1F800F0;
	Mon, 26 Dec 2022 23:35:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBB1BF800F0; Mon, 26 Dec 2022 23:35:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E11FF800F0
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 23:35:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E11FF800F0
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-1433ef3b61fso13785920fac.10
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 14:35:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lt+gzNImgwQhawSy/zX0NqMABwqGJ4OMHwRZPC2+ROw=;
 b=HC28hdmjer7AZGvNcTS1WZT086q23ifxJULGSB6KXJu9TqyyXxlAGwhlJttYmI3AvM
 cNCuwN55vGipaos+CF1vb4u1YRS/OE5KzgRB5qjKfnVPhouPHGfnNSV6A5fxXosGjcjw
 nMmpjcpOpvV+hc/dwjDJ86IW4RxhedgQvjthu5ax680zKI+H4zQ6Eku5rm09+g6qokqk
 FbB1kornV+/7T6Gbf7j0Z5mcw4qb2iraekGElv8+kAnWZnNuzCmTpRYa+qaSmMrxcfJL
 q/2V8oBPmqpL5cMbIGG0x/3MYRufIyexFYa5BHBSfQlt+5WkMLIznywj1SuDIjrS7xm/
 Kquw==
X-Gm-Message-State: AFqh2krjEQn8tlOwrfkXNOeT6zN3KcUDpw/UUL6OPVrF+bXUlx2m1lOe
 4qYrdLN8e9Fr/r/QtWxq3g==
X-Google-Smtp-Source: AMrXdXtoyYNVc/HfF7b8ZQ6awqmxZtHIAJA8GEEc6ASnXnLJU/vSgfPTQp95w57GfWXniFD8o9Moww==
X-Received: by 2002:a05:6871:4595:b0:143:95b0:26e7 with SMTP id
 nl21-20020a056871459500b0014395b026e7mr8961672oab.54.1672094146950; 
 Mon, 26 Dec 2022 14:35:46 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80e8:2792:eb0e:539f:f657:547b])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056870738c00b00143065d3e99sm5461116oam.5.2022.12.26.14.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 14:35:46 -0800 (PST)
Received: (nullmailer pid 375419 invoked by uid 1000);
 Fri, 23 Dec 2022 19:26:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
In-Reply-To: <20221223170404.210603-2-francesco@dolcini.it>
References: <20221223170404.210603-1-francesco@dolcini.it>
 <20221223170404.210603-2-francesco@dolcini.it>
Message-Id: <167182349408.373865.10339766752503211557.robh@kernel.org>
Subject: Re: [PATCH v1 1/3] ASoC: dt-bindings: nau8822: convert to the dtschema
Date: Fri, 23 Dec 2022 13:26:02 -0600
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, wtli@nuvoton.com,
 Takashi Iwai <tiwai@suse.com>, kchsu0@nuvoton.com,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Marty <info@benjaminmarty.ch>, Mark Brown <broonie@kernel.org>,
 David Lin <CTLIN0@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Fri, 23 Dec 2022 18:04:02 +0100, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Convert nau8822 devicetree binding to dtschema.
> Change file name to match dtschema naming.
> 
> Cc: David Lin <CTLIN0@nuvoton.com>
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  .../devicetree/bindings/sound/nau8822.txt     | 16 --------
>  .../bindings/sound/nuvoton,nau8822.yaml       | 40 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nau8822.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221223170404.210603-2-francesco@dolcini.it


audio-codec@1a: '#sound-dai-cells', 'AVDD-supply', 'CPVDD-supply', 'DBVDD-supply', 'DCVDD-supply', 'MICVDD-supply', 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb

