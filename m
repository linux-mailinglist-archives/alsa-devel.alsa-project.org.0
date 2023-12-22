Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A5D81CB9D
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 16:02:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3851ADEC;
	Fri, 22 Dec 2023 16:02:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3851ADEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703257354;
	bh=4s9smf/RCgwD+JD7P5WN65k34eyM5Ua7SKx8OcpjyNI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=crHN83lZIsCxcnif5vaLdpTpNn9OGKsj1HgncQJWjj8v50tlbE8WMzdaoeaYN5z1w
	 AYUnMnrE2u+wF9BCWyeRWqDC//ItrrBNiS8YVEgFyZEsrcVx/r6Zo2IkXNtQo3YEvR
	 hxO7s18Hir92ZpH2ZEPdwN+4cYPxFW9J7YWYvu3Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF240F80564; Fri, 22 Dec 2023 16:02:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B609FF80580;
	Fri, 22 Dec 2023 16:02:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACD38F80425; Fri, 22 Dec 2023 16:01:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67C87F800F5
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 16:01:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67C87F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pOW0E8H4
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a2339262835so216223866b.3
        for <alsa-devel@alsa-project.org>;
 Fri, 22 Dec 2023 07:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703257303; x=1703862103;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4lx9wwE1i9du74XL1yxBGJ3vsI1REncsFrgYBE3k74=;
        b=pOW0E8H4DHIqjznwVWLK8Y1Z21cBUHqNTSQFZRVh0Orpn1kgslQIfV8C9NI4yU6su3
         x6I3vZa7wecQNL3jQqLTJceqm97wG053ZbWO657ecgskJyAzCMPvzmcY2avU3BFVvhdg
         O0czhvnALwGovdnOdfNZPfXGhqpBj60PIKpFGQaxae1l2gVfKYtXI0wDlfXv4POirSQt
         DSrjCbZsuCylTjitseKiCf3lHklDFr5TuxSmv4pAxAw60iebEAXp+fWSAjtZ1h9Kk+UT
         FrVeLeDGuiorK/1aYTQXiAqj4/SARi8wy2QWSenwrayJMEDZckfnN37lrTRhelCtGrNU
         JkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703257303; x=1703862103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4lx9wwE1i9du74XL1yxBGJ3vsI1REncsFrgYBE3k74=;
        b=L0yIe0Z9B5XqPSpHx8Ra111233wGIaimYRFdS/47wxPlez36aLlVEqZ13gUJsLFdau
         2HlQpx00bHiLNSl5hlZhOOeqK9vp3f5KWhFoSujb+4jbwwVwV6hT5/IfeBpdxkZCZFf4
         ctICKz08YB5yfSslWTnoVoLgSWC1kucE3lI4LJGYvE5O2cqmrsY9uBmfis1NkldJQf3O
         9rbr2jWs8SyBsTMLfTQXwg1hbcHjtP3oDGJU4Xv4zei0LOmNAkzeMao4A/D3ifl9uQXi
         T0kqtgQfS00r/IsYvVIu0C6RrOCfr228dEPikDaqL1XdZVkvfImOZSvxDPq+tLuuT4M5
         HPTg==
X-Gm-Message-State: AOJu0YwmMis38u9WTST8Qc11hrTUMXBuWkHy+X2NSz9sBXAjI9DM9Pjo
	7iX77A/Ol9JYu7rgr8+OZiOWLhZcfhP6hw==
X-Google-Smtp-Source: 
 AGHT+IHRKrti1VwxIc09jY0oOuJy9YPs+JgtifApCY/xsD7vtw0cq160pet+7Cxzey11G3sc5FPgzg==
X-Received: by 2002:a17:906:278e:b0:a23:577f:5fbc with SMTP id
 j14-20020a170906278e00b00a23577f5fbcmr849058ejc.79.1703257303016;
        Fri, 22 Dec 2023 07:01:43 -0800 (PST)
Received: from krzk-bin.. ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id
 h1-20020a17090791c100b00a26af35c171sm1275671ejz.0.2023.12.22.07.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 07:01:42 -0800 (PST)
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH 0/4] reset: gpio: ASoC: shared GPIO resets
Date: Fri, 22 Dec 2023 16:01:29 +0100
Message-Id: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HJK6JLK6PMPP5MOPMZ2DJWTBO2GFZKY6
X-Message-ID-Hash: HJK6JLK6PMPP5MOPMZ2DJWTBO2GFZKY6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJK6JLK6PMPP5MOPMZ2DJWTBO2GFZKY6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

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
  reset: instantiate reset GPIO controller for shared reset-gpios
  reset: add GPIO-based reset controller
  ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for shared line
  ASoC: codecs: wsa884x: Allow sharing reset GPIO

 .../bindings/sound/qcom,wsa8840.yaml          |   9 +-
 MAINTAINERS                                   |   5 +
 drivers/reset/Kconfig                         |   9 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/core.c                          |  70 ++++++++++--
 drivers/reset/reset-gpio.c                    | 105 ++++++++++++++++++
 include/linux/reset-controller.h              |   2 +
 sound/soc/codecs/wsa884x.c                    |  52 +++++++--
 8 files changed, 231 insertions(+), 22 deletions(-)
 create mode 100644 drivers/reset/reset-gpio.c

-- 
2.34.1

