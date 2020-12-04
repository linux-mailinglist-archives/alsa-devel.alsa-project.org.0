Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 220C72CF219
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 17:43:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AADF81890;
	Fri,  4 Dec 2020 17:42:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AADF81890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607100220;
	bh=JZ345UR748ubkGoYcgoORY98Xg4cMLejJzoknnLN0jw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hS68XcnbbjyRPBI5ayC9EVwU/CIPMUwt+g5KG6vAEeZZYBlvEDDo33Q3mffvVhsXB
	 C8g234WzHykbJrddPr1PlFQnJMr0KkcMRaKKFJXOhC+kD/uAZiz9Wu9PFQAEn3CrCz
	 YNr4Fs+uup+YlW55Qi771Tlo2rH4er5LgoQPS0yA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 259ACF804AA;
	Fri,  4 Dec 2020 17:42:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FDDCF804A9; Fri,  4 Dec 2020 17:42:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EAC3F800E8
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 17:42:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EAC3F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DYbfXG/n"
Received: by mail-wr1-x442.google.com with SMTP id g14so5913739wrm.13
 for <alsa-devel@alsa-project.org>; Fri, 04 Dec 2020 08:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=foCoiLT+slgLG3L0w47m6AcbVpAqnmRhNM9NU1juQQM=;
 b=DYbfXG/nueM424ONrCFUHd6ulpon66D0URs3nGOX/ObWhuyxam8eMl5jzNRVTSEAK3
 lWdCy6erUawbbk55ZsqDwuDDXe/HSgV5aAhRGTEEoCtRz4nPvGMjOa/5mXtpgnMvmZQY
 B4hBOHISvNLYDVA0i+2PGF42NXG68niDjaO47Q8A9eFFd0Fz1Jfy6cUFYu7fG9E5MG6F
 pWhIWwO0nV+36kUw3SIKbv2SK7mp0eh+lwx61tkp7OBAnOsdRDoJASpCEGfjvf/GQHjI
 NF851j92Grd1bcwdc4Acn6u5XbBNaUFy0X2tVrDpjd4NdqYDtnv1t0HQxNAGBbyA9wfh
 pTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=foCoiLT+slgLG3L0w47m6AcbVpAqnmRhNM9NU1juQQM=;
 b=K8V/5RylQEmBHqAGkqZuweUZB18E1XDG39zgw2IprgK1nYDOGc86oY/v8EmstP/sC4
 rm6Ybf2K4WcfRwxiAB3UCT1JmL82eJ/gBuTdE4FBTu6uVr4l7NaRxGxUZAYRdj9itMie
 Hp8PHEf8vd8gUvIXyJpBaM6YGXiVsUc90UTpuFt8OqA4G/GchUPwfcoZoSBJIiSH9pSv
 KSbcn25rTUOUKnPMiA06BFJKwTZUHQ+Jvl/VonIelJxXC8djf9m0J/Ub+UjAZsVmYkWI
 C1ojsICpIzkbvR1jlAHHOq1G+V5Q6xrtqxT5l3CzO8WDyM5QAUdquDdCm+L/iLPvSqF4
 /DRQ==
X-Gm-Message-State: AOAM533IoexBfWmf6JpdStmDfCN5p/O+GulAjZk/0a769JkyxgoHMfcR
 S7FiSeaKRRbMPjKFrhO6x/zG0g==
X-Google-Smtp-Source: ABdhPJxAYhVN/ft3fnkyFb8bYQ65F6gu0a4IL7ACH8WXTdLYqnGmeUfo9ae/WbBKPLEDWaEaxJAIWw==
X-Received: by 2002:adf:8b8f:: with SMTP id o15mr5986941wra.311.1607100151872; 
 Fri, 04 Dec 2020 08:42:31 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id d15sm4488923wrx.93.2020.12.04.08.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 08:42:31 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: q6afe-clocks: Add missing parent clock rate
Date: Fri,  4 Dec 2020 16:42:28 +0000
Message-Id: <20201204164228.1826-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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

setting clock rate on child clocks without a parent clock rate will
result in zero clk rate for child. This also means that when audio
is started dsp will attempt to access registers without enabling
clock resulting in board boot up.

Fix this by adding the missing parent clock rate.

Fixes: 520a1c396d196 ("ASoC: q6afe-clocks: add q6afe clock controller")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6afe-clocks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-clocks.c b/sound/soc/qcom/qdsp6/q6afe-clocks.c
index 87e4633afe2c..f0362f061652 100644
--- a/sound/soc/qcom/qdsp6/q6afe-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6afe-clocks.c
@@ -16,6 +16,7 @@
 		.afe_clk_id	= Q6AFE_##id,		\
 		.name = #id,				\
 		.attributes = LPASS_CLK_ATTRIBUTE_COUPLE_NO, \
+		.rate = 19200000,			\
 		.hw.init = &(struct clk_init_data) {	\
 			.ops = &clk_q6afe_ops,		\
 			.name = #id,			\
-- 
2.21.0

