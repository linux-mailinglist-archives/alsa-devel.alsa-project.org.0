Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD28468C732
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 21:00:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FC8C1E7;
	Mon,  6 Feb 2023 20:59:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FC8C1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675713632;
	bh=xfI8+RuQPI7svTS/LlU8USsp9AGFvReGl4lLLRDy1DU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Zx2I+24lXQU5o3IRA6kaOr+irRCbOGx13g/O38+tlzmLl04rZeJqmJ3r24nlqtBkI
	 24sTlzAIpNHw6tfcSu2RlSKtPVGQXRo5OSVr64aJB19XFb0K/ufC987Gu21TGOGM9h
	 BJULLOz+xy2Sfp+qRChdYPL9jurMtApItAoyuca8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8AF2F800F5;
	Mon,  6 Feb 2023 20:59:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDAA3F804F1; Mon,  6 Feb 2023 20:59:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2CDDF800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 20:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2CDDF800E3
Received: by mail-oi1-f172.google.com with SMTP id p185so10744985oif.2
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 11:59:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kfUXbuBiDM9nMlhtgfoicYGOlCIHH58e/8hdvSE8jJ4=;
 b=ZYTG/IE1NPLRsbrli7Wg+XvqCkgQi1m16Jt+tH6uizJNWN0ZPEq/TyusaiAKdtV7GX
 xu2ScneUKpmlAm20bf9oXX9rGruPoRVzxpsWBt0FPkLd9nhUxaVin3v7IPdhZbmynx0P
 TV4zFzD+tEiApiwQ7YQhlrhA4uJDikMIrr2mJ6galHvrnpYDY4qS6DF8KGUQith7nQG7
 BVuytV8Ki/l04yG0wqx9xqPQ4ttW5vt2KNapVTZYbC9mWIPOioJ85ITZvbIPhB/xsJZ1
 RA+s9wRpJ+yUlIPlJ57xjfVcCaBR/e/fs8xEmZ6/XfyzgMRzCb1ef5fGJVj0H5iP1EIJ
 XB9A==
X-Gm-Message-State: AO0yUKUDGoe7L7mFrkaXPIteNy+AwcBKDIhiVJZmJM9v1O9uukoMruQq
 fLOozSx1eWxkP5cc/8AbHQ==
X-Google-Smtp-Source: AK7set/6Imd/3QnF67lbWtxRUQQuY9+VZu9NFwfZLt5/o89SdZ4M12nskxoufA3QrLtMbKAI2XInqA==
X-Received: by 2002:a05:6808:4296:b0:364:e9af:f254 with SMTP id
 dq22-20020a056808429600b00364e9aff254mr254470oib.49.1675713560836; 
 Mon, 06 Feb 2023 11:59:20 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l5-20020a056808020500b0037834b1a20bsm4678259oie.0.2023.02.06.11.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 11:59:20 -0800 (PST)
Received: (nullmailer pid 1217213 invoked by uid 1000);
 Mon, 06 Feb 2023 19:59:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20230206153449.596326-3-jbrunet@baylibre.com>
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-3-jbrunet@baylibre.com>
Message-Id: <167571334291.1212116.1869881432057405431.robh@kernel.org>
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: meson: convert axg tdm
 formatters to schema
Date: Mon, 06 Feb 2023 13:59:19 -0600
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Mon, 06 Feb 2023 16:34:44 +0100, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic tdm formatters to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../sound/amlogic,axg-tdm-formatters.txt      | 36 --------
>  .../sound/amlogic,axg-tdm-formatters.yaml     | 88 +++++++++++++++++++
>  2 files changed, 88 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/sound/component-common.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.example.dtb: audio-controller@500: False schema does not allow {'compatible': ['amlogic,g12a-tdmout'], 'reg': [[1280, 64]], 'resets': [[4294967295, 12]], 'clocks': [[4294967295, 35], [4294967295, 127], [4294967295, 120], [4294967295, 134], [4294967295, 134]], 'clock-names': ['pclk', 'sclk', 'sclk_sel', 'lrclk', 'lrclk_sel'], '$nodename': ['audio-controller@500']}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230206153449.596326-3-jbrunet@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

