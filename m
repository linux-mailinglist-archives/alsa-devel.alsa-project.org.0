Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC6D82C3AB
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jan 2024 17:37:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF02BEAB;
	Fri, 12 Jan 2024 17:36:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF02BEAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705077429;
	bh=DhV6YAbJFgjBvCViOZnbT3tPK3OwPDvPpLENE0lD1/c=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gQUzrglHkYFytHMkF1Q2W9uBrmHWrW6pU8JPBJA8Eli/7DZ1IDD7CVoBclQhjiRWv
	 NAmoPIz4mXCJLlLdW8/UNhgKh+59sMjqy3lL2dAXsAWHje4E7Ar3YWO94F4Yu0h2DM
	 WFt5W9vTzchy5AdACALsgYhoahvK1veH4N5rCvS0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85093F80580; Fri, 12 Jan 2024 17:36:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDC39F80580;
	Fri, 12 Jan 2024 17:36:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6D7BF80520; Fri, 12 Jan 2024 17:36:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8ABBF8003A
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 17:36:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8ABBF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XtaC2yer
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e60e135a7so16362925e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 12 Jan 2024 08:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705077380; x=1705682180;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hn+LSFeIE6cgmvG+tEU3s1iTtjUkavz0Czg37/bP5gM=;
        b=XtaC2yer361PYDRG6utxebE0hOxRJq3fLNCwFsxkeFJmn7glEbP23up+3dQwQhrtB7
         L3T/a466ucR8/C0pyTnJBl4OL0fA8uvyV5aXse/P7Ei82Bv58+omjHl2M3tONC6v7I50
         EQxf0+TyGU3lhXlcXi7U/OwxaKhRUp7i/+Xq3EXRqYpvnTGXy4vO+aLkRTGKE94B5WTd
         KnycOtSGxH+GgyuMNYVe0TeBid6TT/+sICxGS7GWzRrYJgqHLq/dTTRQcoW09CEJwI4q
         SYbZrao6A2+ki88kWxodz+GqerDsjMvgv5U6bSKF5woQ6svuVgYjvCmLl2E2Wwl6YbUV
         TZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705077380; x=1705682180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hn+LSFeIE6cgmvG+tEU3s1iTtjUkavz0Czg37/bP5gM=;
        b=uPWbefrBb22Ggq/8awXq3QHobtBomuo4Xm8nVHbVPD/gOpDKHdni5mlxOsOu+/yRG4
         59vUsCngunbMPsJdL9Q87e3oytoCpyL7SSrsDw5WtHj3Ec4D3a5YZIEx6Fy4NmYvso0U
         HgrTgwOwaJqO9GWGREWootgtP3eFHjNweF6HtlKmKi1g/mUf1b/HzQJbHSsTGUFXn+Tt
         bFYw/udVMhtUUsjR8miICz02O1TQx/FIv49EJI3mJzjB+xIr4EtTloONeogLxJ5BtRjB
         Y+3ULyHuUfkkRQ04zaDI7sG9ivBE0Cz73baUISUHOhSoksj+nRo+SC4pJ9XevHwhkv6S
         cW4g==
X-Gm-Message-State: AOJu0YxpQ+9Kb92S3aOLLaVR9F2mYbE9A+sGEgm30cR2s/H4Ip1Hxjfh
	/bSltJ4gxJ79D3OIHBmMVq+v6vKJnYqURw==
X-Google-Smtp-Source: 
 AGHT+IH+yRgfFBXEytnUKCD59ok3rbCy/JtVfxvi0S39fF9MOsVDbm+3HUJ7eJuXjsGI344nf1LKPg==
X-Received: by 2002:a05:600c:1c92:b0:40e:532c:7cb1 with SMTP id
 k18-20020a05600c1c9200b0040e532c7cb1mr1056935wms.125.1705077380618;
        Fri, 12 Jan 2024 08:36:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id
 bd16-20020a05600c1f1000b0040e5a93ae53sm6573195wmb.22.2024.01.12.08.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 08:36:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v3 0/5] reset: gpio: ASoC: shared GPIO resets
Date: Fri, 12 Jan 2024 17:36:03 +0100
Message-Id: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TFVAFZTMDC7XA5AWOIECZCDLZ2JTKQHG
X-Message-ID-Hash: TFVAFZTMDC7XA5AWOIECZCDLZ2JTKQHG
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFVAFZTMDC7XA5AWOIECZCDLZ2JTKQHG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Changes in v3
=============
1. reset-gpio.c:
  - Add reset_gpio_of_xlate (Philipp).
  - reset_gpio_of_args_put->reset_gpio_of_node_put (Philipp).
  - Expect via platdata of_phandle_args.
  - Do not call device_set_node() to attach itself to reset consumer
    (the final device).  This was questionable idea in the first place.
    Bartosz suggested to use GPIO_LOOKUP to solve this.

2. reset/core.c, implement Philipp's feedback. That was a lot:
  - Commit msg fixes.
  - Add new platform_device earlier, when reset core found "reset-gpios" but
    not "resets".
  - Do not overwrite of_phandle_args.
  - Expect matching .of_reset_n_cells.
  - Pass of_phandle_args as platdata to reset-gpio.
  - Rename reset_gpio_device->reset_gpio_lookup and others. Fix few comments
    and code cleanup pointed on review.
  - From Bartosz:
    Use GPIO_LOOKUP and a lot of cleanup.h in __reset_add_reset_gpio_lookup().

3. Include here Chris' patch: "i2c: muxes: pca954x: Allow sharing reset GPIO".

Changes in v2
=============
1. wsa884x.c: add missing return in wsa884x_get_reset(), correct comment.
2. qcom,wsa8840.yaml: fix oneOf syntax.
3. reset-gpio.c:
   - Fix smatch warning on platdata evaluation.
   - Parse GPIO args and store them in rc.of_args.
4. reset/core.c:
   - Revise approach based on Bartosz comments: parse the reset-gpios phandle
     with arguments, do not use deprecated API and do not rely on gpio_desc
     pointer.
   - Create a list of instantiated platform devices to avoid any duplicates.
   - After creating reset-gpio platform device, try to get new reset controller
     or return EPROBE_DEFER.
   - Drop the "cookie" member and add new "of_args" to "struct
     reset_controller_dev".

Description
===========

We have at least few cases where hardware engineers decided to use one
powerdown/shutdown/reset GPIO line for multiple devices:

1. WSA884x (this and previous patch):
https://lore.kernel.org/all/b7aeda24-d638-45b7-8e30-80d287f498f8@sirena.org.uk/
2. https://lore.kernel.org/all/20231027033104.1348921-1-chris.packham@alliedtelesis.co.nz/
3. https://lore.kernel.org/lkml/20191030120440.3699-1-peter.ujfalusi@ti.com/
4. https://lore.kernel.org/all/20211018234923.1769028-1-sean.anderson@seco.com/
5. https://social.treehouse.systems/@marcan/111268780311634160

I try to solve my case, hopefuly Chris' (2), partially Sean's (4) and maybe
Hectors (5), using Rob's suggestion:

https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/

Best regards,
Krzysztof

Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>

Chris Packham (1):
  i2c: muxes: pca954x: Allow sharing reset GPIO

Krzysztof Kozlowski (4):
  reset: gpio: Add GPIO-based reset controller
  reset: Instantiate reset GPIO controller for shared reset-gpios
  ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for shared line
  ASoC: codecs: wsa884x: Allow sharing reset GPIO

 .../bindings/sound/qcom,wsa8840.yaml          |  11 +-
 MAINTAINERS                                   |   5 +
 drivers/i2c/muxes/i2c-mux-pca954x.c           |  46 +++-
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/core.c                          | 227 ++++++++++++++++--
 drivers/reset/reset-gpio.c                    | 121 ++++++++++
 include/linux/reset-controller.h              |   4 +
 sound/soc/codecs/wsa884x.c                    |  53 +++-
 9 files changed, 444 insertions(+), 33 deletions(-)
 create mode 100644 drivers/reset/reset-gpio.c

-- 
2.34.1

