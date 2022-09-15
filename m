Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ABA5B9B73
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 14:57:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39CE616DF;
	Thu, 15 Sep 2022 14:56:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39CE616DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663246642;
	bh=79nlcIf/ZqHx2TGD34nTWHbIM0KHAryRZOmZSOf4mng=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i8naD/YwQI935ALIuNGoXgVQc/7sRxqnHXUgab4Rd+a0yqZD29FMqvp11L59AhSl5
	 jQVRyRZNWOv+zzC71hl3zWeP+NOUOAwfJdk8S6GZUibiGK8Vp4rqrjkOEvG9vBwwLz
	 tZxLl3gmv/85nSBWFLVnBS5yLaE9BX93xdT1vHsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A429BF8032D;
	Thu, 15 Sep 2022 14:56:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D22DF80238; Thu, 15 Sep 2022 14:56:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6D84F8008E
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 14:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6D84F8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aVuw7Ao9"
Received: by mail-wr1-x430.google.com with SMTP id b5so30718595wrr.5
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 05:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=G2rHbxpP60TFR+zumNeCiSf5mCfJRZI93xLQZOWnmYY=;
 b=aVuw7Ao9bWSdWPOAkXlAvUrgWFm15T6IzL4j33izpIsPodrX+PYSvVVf/rqlm5EoE1
 mq5MEwJQK1Z6sbxzTRTLnSwp6EAI6ZM+5RnT7wjeGdoNJQpGo8RMsuRIntHhbL7NeD95
 JTGroguJ/fNT85NG9v2QXJb6FSJG/pZLnc/xmQAtqkmHHpIFaDMR50b2JQdp0z/atNzY
 QGLz3jEsnW9hc9Sl/JrPYus1AaPo1IU/GNDCB3Nb6gyU5jsrtkxwalvLaaqpy5S1UIj7
 BGt2TTRXaSws+aRn2IdFvkUkFQdRCWRtrnZ1roMj5XlABrefNzvccOPo87IJmjgVjoVx
 xE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=G2rHbxpP60TFR+zumNeCiSf5mCfJRZI93xLQZOWnmYY=;
 b=rQBkRoiPh/5qqWeOe9LgRCKuMRxlPFQ4O7x66BHSI2kT+YG6w9YPVAPFQKyfjDQgR5
 t2G3yclrufozSxHK9UsHrotFhNQAT2ENXwHd+zysqO6lMmMWUT7lNGQ94aWqsxPQYnrc
 CgBk/IVmoaRQHx3vD6iPqowvN/uY2ZOOzYnI5ehi1sJc1BAjmKA1xdLfpwknxuFHzds+
 Aj3skPrIeuamzHuIkEFhsOfwVMxf3JEq2c1fiH1YtnJTQHohy+4UasCPtxES7E0F+YHK
 kLeurnEN5DMCj/0ks6HV/MwiY6pbhKyn3NZf81hayRycznOHiLzAY0M4Z4T6XepHRhO1
 KpeA==
X-Gm-Message-State: ACrzQf24FIc4D76e8MTfZwjX3gT5fdJjJC5m0jDZXctrJ8COw40kpVHV
 ztbIcl35BhvQEv7fCZQODaRbjg==
X-Google-Smtp-Source: AMsMyM76KrIHzxT8CDfHmA6sOIBVAkTVLDe0LL3YIWLSTze54PfuHSmOXH1+RYNH95t9DQIYTSbC3w==
X-Received: by 2002:adf:f509:0:b0:22a:cbe3:3da8 with SMTP id
 q9-20020adff509000000b0022acbe33da8mr4053421wro.532.1663246577950; 
 Thu, 15 Sep 2022 05:56:17 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c510b00b003a845621c5bsm2764776wms.34.2022.09.15.05.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 05:56:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v4 0/4] ASoC: qcom: add support for sc8280xp machine
Date: Thu, 15 Sep 2022 13:56:07 +0100
Message-Id: <20220915125611.22473-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

This patchset adds support for SC8280XP SoC machine driver.

First patch moves some of the commonly used code to common from sm8250 machine driver
and the follow on code adds minimal support for sc8280xp.

Currently this driver is only tested with SmartSpeakers and Headset
on Lenovo Thinkpad X13s.

Support for sm8450 is tested and I will post the patches soon.

Thanks,
Srini

Changes since v3:
	- fixed few spellings in commit log
	- removed build dependency with APR

Srinivas Kandagatla (4):
  ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
  ASoC: dt-bindings: qcom,sm8250: add compatibles for sm8450 and sm8250
  ASoC: qcom: sm8250: move some code to common
  ASoC: qcom: add machine driver for sc8280xp

 .../bindings/sound/qcom,sm8250.yaml           |   2 +
 sound/soc/qcom/Kconfig                        |  12 ++
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/common.c                       | 173 +++++++++++++++++-
 sound/soc/qcom/common.h                       |  35 ++++
 sound/soc/qcom/sc8280xp.c                     | 157 ++++++++++++++++
 sound/soc/qcom/sm8250.c                       | 152 +--------------
 7 files changed, 387 insertions(+), 146 deletions(-)
 create mode 100644 sound/soc/qcom/sc8280xp.c

-- 
2.21.0

