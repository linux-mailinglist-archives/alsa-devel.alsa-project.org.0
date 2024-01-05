Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B70A825763
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jan 2024 17:00:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2F49E9A;
	Fri,  5 Jan 2024 17:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2F49E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704470413;
	bh=4DTqm92eIMpZxY2Ov5Fyz7puPbQQgRR1Zr7Bytv1RN0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IXkEvGmTunvfdHQjWhqjn292a9tp+pEWh0ZCrq/T70MGwTU9buCgOibSdL9qN+pls
	 MH8uJs50At/QL8F4K5ChzGGx/6St/iPAs0Qmv1WAkOy+u6k+0upvJD9QhvuD64lNx2
	 GV8uEIhqi7FGKUmY43UE0wUqsFa8EYZI4i1k0Sf0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6880F805AB; Fri,  5 Jan 2024 16:59:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7B2DF80567;
	Fri,  5 Jan 2024 16:59:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DF9EF804F1; Fri,  5 Jan 2024 16:59:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 438B2F8011B
	for <alsa-devel@alsa-project.org>; Fri,  5 Jan 2024 16:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 438B2F8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yGA/c7oM
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d8909a6feso18149695e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Jan 2024 07:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704470363; x=1705075163;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ojBQKqXKo4lu+tyGs931tVbnWS1sxtV4aoVa4f902n4=;
        b=yGA/c7oM5ZW8+zh9f0ukXLA+Gjriu3tg5NKE4EMqFYVz0AIHguXPGLBnLiIeXSIi76
         BgtQ3yc3n6P0+9w1nhYh49BRxjqkgehe9yOWclZFPnUvR8Lj3Hvs8AacApn3+cr2HAPS
         fsX/H6ByM+nbgZIYuErL5SB/AjMjCe5ihIZnYSJLIjbLoHVapXb61i3neF4rCM6MccS9
         1YGzHBYxnwAdGudFGwc5AAqURcG/fUMFaaRBQuwDyOwJkZbg3Lh7FfOpVQeoDV3zsor6
         hwDznax9VTOZk/6NEUZX7iBYXZ+BgUB84CwW7XSPrE+t5D43HffJCW3KguASruyfYVtj
         Fxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704470363; x=1705075163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojBQKqXKo4lu+tyGs931tVbnWS1sxtV4aoVa4f902n4=;
        b=f7hy6QChFLWmoHHEEPlGjRlGbbLseQ/b8NGHCyfA/P8BmizhoLMyY+yEYTqKLJiQYf
         5Rx/VK+xVdG5ZvmgtZzxO3l5ikQvNCvWNegn/tCOHH3YfZBdY/mwDMX48xh3DSmdF6z3
         /YbomRT4JyaKN4k80ebkEsiOL2F70owiRoTbeWJqJ++3MllIPCcY8SJwjDaedpouePmp
         NTyZPhLJs+E8r6GdSo1TSK09z50o/XzxIWrOI42XRwy8RYwYY4uZjnwhai9THzpepXZr
         aaLs8a0Ilr43G8rXuJ1eAoVe4Noc64ahFwUumOV37tEqWCXPjw7uq0rUi72w2ST7mwsd
         fHzg==
X-Gm-Message-State: AOJu0Yx7ovKO94jNyTB0L49kmY9IKIJFeLLhbUBtsvhTc2+KwAwODhdc
	MJrotAS8eV673AU9WK38kcWQBkqUDzL8NQ==
X-Google-Smtp-Source: 
 AGHT+IGwV4OwKKATavp8Q64GytM17HdFfAv5ZKYAelGrsoZCfrrWxmUv3Kzk+4KdvDrMFQQkbNmewA==
X-Received: by 2002:a05:600c:45c7:b0:40d:5f86:cef4 with SMTP id
 s7-20020a05600c45c700b0040d5f86cef4mr875290wmo.235.1704470363063;
        Fri, 05 Jan 2024 07:59:23 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id
 su8-20020a17090703c800b00a29910a9366sm326024ejb.8.2024.01.05.07.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 07:59:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v2 0/4] reset: gpio: ASoC: shared GPIO resets
Date: Fri,  5 Jan 2024 16:59:14 +0100
Message-Id: <20240105155918.279657-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H3ESPKTYJBPR72SMKMS2TIUHMIXVMUKI
X-Message-ID-Hash: H3ESPKTYJBPR72SMKMS2TIUHMIXVMUKI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3ESPKTYJBPR72SMKMS2TIUHMIXVMUKI/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Changes in v2
=============
1. wsa884x.c: add missing return in wsa884x_get_reset(), correct comment.
2. qcom,wsa8840.yaml: fix oneOf syntax.
3. reset/core.c:
   - Revise approach based on Bartosz comments: parse the reset-gpios phandle
     with arguments, do not use deprecated API and do not rely on gpio_desc
     pointer.
   - Create a list of instantiated platform devices to avoid any duplicates.
   - After creating reset-gpio platform device, try to get new reset controller
     or return EPROBE_DEFER.
   - Drop the "cookie" member and add new "of_args" to "struct
     reset_controller_dev".
4. reset-gpio.c:
   - Fix smatch warning on platdata evaluation.
   - Parse GPIO args and store them in rc.of_args.

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

Krzysztof Kozlowski (4):
  reset: gpio: Add GPIO-based reset controller
  reset: Instantiate reset GPIO controller for shared reset-gpios
  ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for shared line
  ASoC: codecs: wsa884x: Allow sharing reset GPIO

 .../bindings/sound/qcom,wsa8840.yaml          |  11 +-
 MAINTAINERS                                   |   5 +
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/core.c                          | 176 ++++++++++++++++--
 drivers/reset/reset-gpio.c                    | 121 ++++++++++++
 include/linux/reset-controller.h              |   4 +
 sound/soc/codecs/wsa884x.c                    |  53 +++++-
 8 files changed, 356 insertions(+), 24 deletions(-)
 create mode 100644 drivers/reset/reset-gpio.c

-- 
2.34.1

