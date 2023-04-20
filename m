Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EE76E8FD6
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 12:17:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42096200;
	Thu, 20 Apr 2023 12:16:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42096200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681985848;
	bh=iy2y/NX87bXKB7eB49sbs/udvRz5ZddxKZQatcguXJo=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oi1/cEYh8cW3hDaY14wTqMKbU0ig1+z3GzshZuqyNC8jnslwapWmKoVf/zAzBg/Y7
	 L5x0sBwlV1SHZVqWluNFf5XArg3VGs4pn+Eupmc5+FletbJTed0eMWXiEzTgkscEsM
	 +AdzyPtOvgbrppRpbIlggbhYE+xfQcbxnVh93AiQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B12FF80053;
	Thu, 20 Apr 2023 12:16:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F34CF80528; Thu, 20 Apr 2023 12:16:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B127F80053
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 12:16:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B127F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Y0mOhXZT
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94f32588c13so50304366b.2
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Apr 2023 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681985782; x=1684577782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4BKaB6wmdSC39nGuq4uVk57d3AR6NoTUK0psnv39YEI=;
        b=Y0mOhXZTuZ4nez1P8JdLmChICVL4d7Or6M64/LwQUOcN0zHXwwCzyywmyjVJQAd9+q
         myAr0408kLXfNmkXbD4i/RWKw8/Me0snlbCFKbxRK8NIvwx0PZGC1xfUUeFUZ/jqfAVk
         0J3ptix/C21PHgzNRaDoM5+rAMeYGc6CTV+UiZBKboppIgnHkgxfvYTlrC1nfXzRaQ7i
         jW1JHRt7NARXOXvTk+ny+M4JDpJFet4B35ePM+X6SF9WpP/lNy13GVhqkfMa7RHAfPWx
         YUHuvrfj/aoyu/45D8OVWxnIBF9VJsoqGLEaPe4nRRfj99qxJVWgZIOzwcWk66lLVv8C
         7vAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681985782; x=1684577782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BKaB6wmdSC39nGuq4uVk57d3AR6NoTUK0psnv39YEI=;
        b=g04QZjIcl2wFWDISes4T4Tp4VhHO/BKM07ipwEOYngu+EBOUWb0eXHzYs2gCOUr/ge
         pD8H00EMoNFxnaJc3MmHSdxaS3dbbozu/nuWFCrMzVndqlqhT2gwlYhCArvHjv1VURbu
         z8BzjuaVsv9GLqm2596FGAVwnQpLq7IEjJGGgwfLmeUI3kQ8cz4QkXaMWmTuCEYXX+hW
         v5WV9s28RVEhXKm/9OpOJh2bFiZGgw3yyZD88wmHXQa070A5RLH1DtF3NAvkPVuwfX5a
         vYbfoJ2DZuUWw+XXVbZeMyCQlXDWDZRvTP1pMQaaA6uPdZv3tv0TkfT/3572katkKFJD
         vpNQ==
X-Gm-Message-State: AAQBX9fQN5DQjRVWJU/b3cnZJRaAcNDuGdbBQUFJnHOzTRhhdM0R61fC
	z8gasgHIxNCkrbTsgLLMBpBPIQ==
X-Google-Smtp-Source: 
 AKy350bcrkmc6o+TztYUElI7htTmgFNkAH4v60w5elbqDvjghZiRFJts/+OXkM9ieyGeYORp6EoZ5g==
X-Received: by 2002:a05:6402:48e:b0:506:bc26:d6a9 with SMTP id
 k14-20020a056402048e00b00506bc26d6a9mr1563945edv.8.1681985782601;
        Thu, 20 Apr 2023 03:16:22 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id
 l22-20020aa7c3d6000000b00506be898998sm588954edr.29.2023.04.20.03.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 03:16:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/6] ASoC/soundwire: qcom: correctly probe devices after link
 init
Date: Thu, 20 Apr 2023 12:16:11 +0200
Message-Id: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NGI23ZBP2ZUTFDFKEIJGONVJLSSGRDFX
X-Message-ID-Hash: NGI23ZBP2ZUTFDFKEIJGONVJLSSGRDFX
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NGI23ZBP2ZUTFDFKEIJGONVJLSSGRDFX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Dependencies
============
1. ASoC codec: changes are independent, however they should rather come the same
   cycle as Soundwire changes, to avoid new warning and small delay.

2. Soundwire: changes (context) depend on:
   https://lore.kernel.org/r/20230209131336.18252-3-srinivas.kandagatla@linaro.org
   https://lore.kernel.org/all/20230418095447.577001-1-krzysztof.kozlowski@linaro.org/

Problems solved
===============
Soundwire devices are supposed to be kept in reset state (powered off)
till their probe() or component bind() callbacks.  However if they are
already powered on, then they might enumerate before the master
initializes bus in qcom_swrm_init() leading to occasional errors like:

  qcom-soundwire 6d30000.soundwire-controller: Qualcomm Soundwire controller v2.0.0 Registered
  wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:4 (ops wcd938x_sdw_component_ops)
  wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:3 (ops wcd938x_sdw_component_ops)
  qcom-soundwire 6ad0000.soundwire-controller: swrm_wait_for_wr_fifo_avail err write overflow

The problem primarily lies in Qualcomm Soundwire controller probe() sequence:
1. request_threaded_irq()
2. sdw_bus_master_add() - which will cause probe() and component bind()
   of Soundwire devices, e.g. WCD938x codec drivers.  Device drivers
   might already start accessing their registers.
3. qcom_swrm_init() - which initializes the link/bus and enables
   interrupts.

Any access to device registers at (2) above, will fail because link/bus
is not yet initialized.

Cc: Patrick Lai <quic_plai@quicinc.com>

Best regards,
Krzysztof

Dmitry Torokhov (1):
  ASoC: wcd938x: switch to using gpiod API

Krzysztof Kozlowski (5):
  ASoC: codecs: wcd938x: Keep device in reset till bind
  ASoC: codecs: wcd938x: Check for enumeration before using TX device
  soundwire: qcom: drop unused struct qcom_swrm_ctrl members
  soudnwire: master: protect concurrecnt check for bus->md
  soundwire: qcom: do not probe devices before bus/link init

 drivers/soundwire/master.c |  7 ++-
 drivers/soundwire/qcom.c   | 92 +++++++++++++++++++++++++++++---------
 sound/soc/codecs/wcd938x.c | 44 +++++++++++-------
 3 files changed, 107 insertions(+), 36 deletions(-)

-- 
2.34.1

