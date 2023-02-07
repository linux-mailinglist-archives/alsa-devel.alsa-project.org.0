Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F05EA68D2E7
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Feb 2023 10:34:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65075204;
	Tue,  7 Feb 2023 10:34:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65075204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675762495;
	bh=Pb4mYLwJtr/GXDFMeMsCqDOBszCV8Z+hDJzSfsTRjTk=;
	h=References:From:To:Subject:Date:In-reply-to:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iOuHOyYyw0N+ts+HG2NzBnLKLMhSecuVLYeVKPHMxygCeaQdzlfmals9F2QrhM99X
	 X+FH2O4MPduLcrlxnZpzg1n6yIGB8X0OdU1WhyRUGb0JAC0p27W6VE5FaJK53KvSys
	 6xa2ADOAnhbduDVfbdVJGthRz4rp23vBwREB+uBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22C96F8014C;
	Tue,  7 Feb 2023 10:33:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97F4BF8045D; Tue,  7 Feb 2023 10:33:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8349BF8014E
 for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 10:33:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8349BF8014E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=nseoynKl
Received: by mail-wm1-x336.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so752559wms.0
 for <alsa-devel@alsa-project.org>; Tue, 07 Feb 2023 01:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=8PxGYDQ7050hUgTLYscGuzXllbJKzPjPKyLOB6Wlrjo=;
 b=nseoynKl6Jy2ScxAfRj0HrX7qUwIqGb7zjc0T/2N+jzmisGjIBhcZe8qX/r3oVew9m
 mgJL4de/kMuVjooR8M1HCLyjb/2XN8Q8rSyM5d8ZD/Zd1uBdBDXsdPvhGppXPdc2a9ad
 QH4TAJDrSM0nmaOc4bDruO2gCEe3gjaJNv/2dOik3H51S9XcFV2w+7gLFrQFpGX9Ypmk
 ahPzZsZyUToaSmcOF/lIPrU5fYksdDze985GVR4bEw0NVhHgfpr8GSAhqIvXBUWIeEnz
 ACl01bAYJz5NUWcKdW4XrxzPSkFvr8T8spCFCRcy5LufICxWpWBGq1Husqvlsu9b4TW3
 D85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8PxGYDQ7050hUgTLYscGuzXllbJKzPjPKyLOB6Wlrjo=;
 b=vvbKoD9QOriXsAVQOP/c9G4/utcT302GDfP1AvngknCMLXA90B0zXjuPEyzJt7ziFQ
 n+Nkhv4KWl2I52TbkKzsaTK/fXl6DQ1JVJp0d9CGjPzf+zKE6F+4/Sz879a6BGW2hku1
 sgq1lSA+cJy2w9AEg9DhGFYd+A20Ne8yx3v9KjdVz0civ/LXBZk2TY/TDCQI+Sd5eEMK
 /GjUCue+Qfr2buWFT5tght1/ihbRmdxLCnNcA5cT2PhHzFIp5Q9IUcbG4AZrLDfgQumJ
 MBjmXQBpJLYD4T00S7nYKNS2cGONMEzxlQRxapljaD2Yev8zV9OwjsSzNOk3CNErG5it
 dl0g==
X-Gm-Message-State: AO0yUKV1a1MxP6WOiLrO8H0wvIJSrsl8BZjeyVNQwjk1kFL+zyrA2Cdq
 urs1TebA1odlhiX7mYBKXUyyKjQq+btvC9va
X-Google-Smtp-Source: AK7set9PZDReFALR1aMtqwOzve4hwOZf9PGErxwjDd/BKVseEzEILgyBlESqGUn3B5zmiP3nYCTErA==
X-Received: by 2002:a05:600c:1817:b0:3df:e54a:4ac5 with SMTP id
 n23-20020a05600c181700b003dfe54a4ac5mr2468276wmp.27.1675762423657; 
 Tue, 07 Feb 2023 01:33:43 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c450600b003dc433bb5e1sm14240200wmo.9.2023.02.07.01.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 01:33:43 -0800 (PST)
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-3-jbrunet@baylibre.com>
 <167571334291.1212116.1869881432057405431.robh@kernel.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: meson: convert axg tdm
 formatters to schema
Date: Tue, 07 Feb 2023 10:29:51 +0100
In-reply-to: <167571334291.1212116.1869881432057405431.robh@kernel.org>
Message-ID: <1j7cwt3jm1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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


On Mon 06 Feb 2023 at 13:59, Rob Herring <robh@kernel.org> wrote:

> On Mon, 06 Feb 2023 16:34:44 +0100, Jerome Brunet wrote:
>> Convert the DT binding documentation for the Amlogic tdm formatters to
>> schema.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  .../sound/amlogic,axg-tdm-formatters.txt      | 36 --------
>>  .../sound/amlogic,axg-tdm-formatters.yaml     | 88 +++++++++++++++++++
>>  2 files changed, 88 insertions(+), 36 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
>>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
>> 
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml:
> Unable to find schema file matching $id:
> http://devicetree.org/schemas/sound/component-common.yaml

This is a false error because the bot does not have the patch applied
by Mark from v1 here [0]

[0]: https://lore.kernel.org/all/167543616131.928818.17902040818579023398.b4-ty@kernel.org/

> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.example.dtb:
> audio-controller@500: False schema does not allow {'compatible':
> ['amlogic,g12a-tdmout'], 'reg': [[1280, 64]], 'resets': [[4294967295, 12]],
> 'clocks': [[4294967295, 35], [4294967295, 127], [4294967295, 120],
> [4294967295, 134], [4294967295, 134]], 'clock-names': ['pclk', 'sclk',
> 'sclk_sel', 'lrclk', 'lrclk_sel'], '$nodename': ['audio-controller@500']}
> 	From schema:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230206153449.596326-3-jbrunet@baylibre.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

