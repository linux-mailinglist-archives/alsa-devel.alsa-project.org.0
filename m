Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 811146D8C91
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 03:13:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44CB31F7;
	Thu,  6 Apr 2023 03:12:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44CB31F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680743580;
	bh=lIsDN+vZaarAesVEmdLPB+1afsw1CyePFQtNGukJ67Y=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nMK5Nadhy9wRra9FpCcq2VpFjVbm7hlUi2OseKKFzVnbgwSNz+tgKgvyXX9x5tMYK
	 237Wh2PZoEwknJa/8xOVu/UzRmQMa948ftKhavHQab0nRfrLQZxew7GzJaJgxfOKFj
	 r7jH3NFlejO7neH50WSbz4WLzIPMN5tvKQ0WHLNY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75384F80171;
	Thu,  6 Apr 2023 03:12:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F740F80246; Thu,  6 Apr 2023 03:12:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A3CFF8013D
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 03:11:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A3CFF8013D
Received: by mail-ot1-f54.google.com with SMTP id
 f19-20020a9d5f13000000b00693ce5a2f3eso19998783oti.8
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Apr 2023 18:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680743516;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ufRr1P5zgDydxR7b/xl15Olfy3++TXWLHdwr3z6Hl80=;
        b=aSx3cnuzhwlk+IH38K3kOSifjs0DYIQEDDMZMLkLepo6bq4KuSNhWdXR989/g4RtjM
         CCSL8icqFHZlCcTDX/oll5rOzLQuTa1mKfzt85yusPJho6XKPXbZ1y+eWtNRqwVDCqpP
         yyKRJzxV2wyrckx0oqVH9m+FxnwGcNZ8LNroEptSr6B2k3n24WhxC1DO8S+GtHFYXXnu
         90HgMEkYljUDjATTXzDPn00ms72QwZQcQEyhG7iMRrfeARPiHM9G3c9LjS4xXuRJ+6hP
         PGl6oTw1TgusuZgCE1qMnj7DvFWEEBotSK1iZcfxb+O6IisWQlrgGw33wc7MBa3xYOZh
         wc5Q==
X-Gm-Message-State: AAQBX9cAPcgNpe3vXgBU5oTNkbs13hOj7/kntH5M2o0WzgXd1xGiDTLG
	LG2CLAEQ83tJQkOdYl8cuQ==
X-Google-Smtp-Source: 
 AKy350bjf3FJ5xVtkh5VmxXCJxAvfdFKyyINw/vI2AsMAiyk9L0BlsBlKjgXXhCYTQPz2uIVnTTHIw==
X-Received: by 2002:a9d:65d1:0:b0:69f:1c2c:8f8c with SMTP id
 z17-20020a9d65d1000000b0069f1c2c8f8cmr3847278oth.25.1680743516609;
        Wed, 05 Apr 2023 18:11:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 y19-20020a056830209300b0069fb749271bsm193458otq.15.2023.04.05.18.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 18:11:56 -0700 (PDT)
Received: (nullmailer pid 1305711 invoked by uid 1000);
	Thu, 06 Apr 2023 01:11:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Saalim Quadri <danascape@gmail.com>
In-Reply-To: <20230405200341.4911-1-danascape@gmail.com>
References: <20230405200341.4911-1-danascape@gmail.com>
Message-Id: <168074344623.1301612.621743725976519280.robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: wm8904: Convert to dtschema
Date: Wed, 05 Apr 2023 20:11:55 -0500
Message-ID-Hash: NXL2Z7W34755TYF3EYCPUUKIWEV2ESO3
X-Message-ID-Hash: NXL2Z7W34755TYF3EYCPUUKIWEV2ESO3
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.baluta@nxp.com, robh+dt@kernel.org, broonie@kernel.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NXL2Z7W34755TYF3EYCPUUKIWEV2ESO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 06 Apr 2023 01:33:41 +0530, Saalim Quadri wrote:
> Convert the WM8904 audio CODEC bindings to DT schema
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---
>  .../devicetree/bindings/sound/wlf,wm8904.yaml | 66 +++++++++++++++++++
>  .../devicetree/bindings/sound/wm8904.txt      | 33 ----------
>  2 files changed, 66 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8904.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/wm8904.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230405200341.4911-1-danascape@gmail.com


audio-codec@1a: Unevaluated properties are not allowed ('AVDD-supply', 'CPVDD-supply', 'DBVDD-supply', 'DCVDD-supply', 'MICVDD-supply' were unexpected)
	arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb

