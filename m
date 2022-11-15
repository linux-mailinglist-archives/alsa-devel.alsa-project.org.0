Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D4262967D
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 11:56:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A7E31679;
	Tue, 15 Nov 2022 11:56:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A7E31679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668509817;
	bh=VDGTdTHjuBpQArbSKrq81C6S2OoPh4Xz11gxM1u7q30=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lnRHA0Km2XjCKwI8Z92iZIX2KcbosizQ4SBGUhAg1hJhw+kXQL23pSI8nEG4QHDue
	 Z0bdCTK+Mcm8U2AfTGNZDkzFp08qds/jMuKkT+QGN6x7JmQkeD0LUE0GuDdZQIeQJg
	 vUpGTYl/0mPQUlGO+0l0bH0ibJQzTvOou90EelNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B925DF8016D;
	Tue, 15 Nov 2022 11:56:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2643EF80171; Tue, 15 Nov 2022 11:56:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A567FF800B5
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 11:55:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A567FF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JiWctmm2"
Received: by mail-wr1-x42a.google.com with SMTP id j15so23607807wrq.3
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 02:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7Os696b+9zkVS6lz3wwEWnLE1KxIJPKzpMEH3bahfyE=;
 b=JiWctmm26IesWn9v52lXd+9stVyKBduqAE3Rig0nnvhzGYTGVluffpEgZmNhNVBSis
 26BbjDcWfsAE+kLpccx9VLSB25WJBkVHSRbfL3Z6l2A/65jVgmHiEMpRClwe93CypaTP
 bUIYzfJ0pU0tUt/lTnGhz/i/OD4VH8Y4qNksN3I+hDJrOEB2BoOQPrzga97s5kzxwMKn
 f24YpA4ib8405CtdjX9WTrmtNCtqgcpFOzpWGCaB9JNt77fw2LjvUDbBtfMBXjFDaSrX
 gzW5rnd2gQWdT8Q1HgLJEltr29mfIS3B35/SJeEGcQsE4jBFE9lSFCwTPwvqTGveqpUb
 dzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Os696b+9zkVS6lz3wwEWnLE1KxIJPKzpMEH3bahfyE=;
 b=drFYJIXNsXAWa6OAk+ixxeuw4yiIi7ZFKQuYkU9O21eNlvO2CUT0SY98NNSdkJM4qd
 /OJL2BMxOGKUUnnQNsJoRW8HiDyQcAWBQgonrS6+5g2+rvKbahsov+PclfHN/2M8zMJA
 Q7ZJtqGrcWSi+vG5sssUycGTkAMae4UjQYjH1JN9NLyF0MybS/XxWnFT6R3f5SftAwgj
 5pwHb1Krt+cKQ4yO6vOAd7C9BTWUHPjDGwsHHdrNigJP16Bj725lZvuf4xB2PrV5a7zh
 nFnRxXQG0L82e6sYmXsn0t1/04ISVzpfcSvZcuhIFQ3JHUxzqER59AV4aepACAKHbMYB
 oBDA==
X-Gm-Message-State: ANoB5pkIxRvpyBbd9fwFPyiqhXsBKTFV15dP9tY/NyK5+82MqSf+3/01
 aacISpoVrT3i1EU7T44hCwR1Uw==
X-Google-Smtp-Source: AA0mqf5CKMgNkTiCStyQMUE9zELmueYgW4bfgK1N2t93kQ1edF0KYrFc0oZ/oMvfPzr3cBEMDijUmw==
X-Received: by 2002:a5d:58c3:0:b0:238:8896:7876 with SMTP id
 o3-20020a5d58c3000000b0023888967876mr10351481wrf.645.1668509755874; 
 Tue, 15 Nov 2022 02:55:55 -0800 (PST)
Received: from localhost.localdomain ([185.201.60.217])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfe692000000b00238df11940fsm12185046wrm.16.2022.11.15.02.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 02:55:55 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/2] ASoC: codec: lpass-va: add npl clock support
Date: Tue, 15 Nov 2022 10:55:39 +0000
Message-Id: <20221115105541.16322-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org
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

New versions of VA Macro has soundwire integrated, so handle the soundwire npl
clock correctly in the codec driver and add related bindings.

Srinivas Kandagatla (2):
  ASoC: dt-bindings: lpass-va: add npl clock for new VA macro
  ASoC: codecs: va-macro: add npl clk

 .../bindings/sound/qcom,lpass-va-macro.yaml   | 72 ++++++++++++++++---
 sound/soc/codecs/lpass-va-macro.c             | 41 +++++++++++
 2 files changed, 105 insertions(+), 8 deletions(-)

-- 
2.25.1

