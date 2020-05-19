Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC591D8FB7
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 08:04:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A88E17D6;
	Tue, 19 May 2020 08:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A88E17D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589868251;
	bh=OqIBWNSJHlNsv0sqsxzj+TzAyCFQDlux8lm+RJdyWdY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CR0pDd3hoT8P5n15EnsPGkM7nX1Yn2qpLF1bxNCg1Xl2xeyIbsuQ5I5pdETGoUD4/
	 cMLse26BZ/Qe/5BqYI2PW28oMO9zKd9Yqjjg4NY5W9De4Babatqq7d7q/bMeXOdlBq
	 2l9hzEIfjW0axARLb1Fl5Cl3yoU+micDfXYxfxDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7315DF80110;
	Tue, 19 May 2020 08:02:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E9A8F801A3; Tue, 19 May 2020 08:02:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53C2CF80110
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 08:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53C2CF80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="gjsfYuTu"
Received: by mail-pl1-x641.google.com with SMTP id t7so5192807plr.0
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 23:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=phw+ielG3h+twIh3+qC+uo7yVbqWNCPg00mlIiD4UHs=;
 b=gjsfYuTu8PAT+FvT1/83g1h42fMsJePfLqLBnkLkj0T9JkS9Z69yuMASMs4XFZ6aRZ
 VWraKaQS4fXUFWkbCKKLA6S7cYa5ZFfhJd6dEaYOrB7uxth9GpaeNzO/kgJjmJINUED4
 4+FmCdDnz2NjHnGdMwG2WDHaKDwUgGMzSZmFaMsbnKItpGZonzv0c3FUFFlLN9FjTQ67
 CGYe7lcQv8yCKbdswXtcPL3FgUg6yZxr+d6OeVFVno5w9gTRNB2giB9hRyUuZrEqYedI
 bpPcPLTcAeDyFqDROev80HriN6ME9WGn8j9+JWEbHJZOpF8qOqbcC78EX+tyVmhJbDkv
 0LJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=phw+ielG3h+twIh3+qC+uo7yVbqWNCPg00mlIiD4UHs=;
 b=UpY1YnbVIva+GbFEg7YBkZSBcNxQi34WoXyM0oqvok+HlqB8fpfYg6SRevhKZHQdvo
 1upn5i1YmFqRcBH0bZ6C26rha1F9Ws239GK6g28l6yJ3MfX4L802cqb596HjZ/M6kqmT
 O3QM8/oXvbKU84gAWJUm6jLfFr7V7walpeNAn10VOqAx2TBt7dE5UOftrf9Ee7/397I5
 nbuMSrAqQtUi9MaX5r8tzAspP/FeUF04hG7RKcpvsXDc0kO2HsSp1BFzowqQzLqy0T2O
 FzCH26D3jVXXI/MWTw3G6zHGylp14N7jxXI06HLNLHq4QkPIccNGIfkKK7JYr03fKB2S
 KMtA==
X-Gm-Message-State: AOAM533g7RBopKvF7kovCoKRlDnO5wNGEB2vTVtz4HQLewUbQjqqbkUq
 jtLv7uqYJPCvtdgCfHKq643N4g==
X-Google-Smtp-Source: ABdhPJyzQ2VvmOCBqhr8snFJgOcvnVL3Uvm9uz3bv/va427vuT/JWSbCDVgucf/Vlf0BFjwLeZCOuQ==
X-Received: by 2002:a17:902:aa8c:: with SMTP id
 d12mr19440179plr.265.1589868137670; 
 Mon, 18 May 2020 23:02:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 ce21sm1112650pjb.51.2020.05.18.23.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 23:02:17 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH] sound: qcom: Kconfig: Tweak dependencies on
 SND_SOC_SDM845
Date: Tue, 19 May 2020 06:02:11 +0000
Message-Id: <20200519060211.83491-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 John Stultz <john.stultz@linaro.org>, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rohit kumar <rohitkr@codeaurora.org>
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

CROS_EC isn't strictly required for audio to work
on other SDM845 platforms (like the Dragonboard 845c).

So lets remove the dependency and select the related
CROS_EC options if CROS_EC is already enabled.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rohit kumar <rohitkr@codeaurora.org>
Cc: Patrick Lai <plai@codeaurora.org>
Cc: Banajit Goswami <bgoswami@codeaurora.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 sound/soc/qcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index f51b28d1b94d..0434f2c7d746 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -99,12 +99,12 @@ config SND_SOC_MSM8996
 
 config SND_SOC_SDM845
 	tristate "SoC Machine driver for SDM845 boards"
-	depends on QCOM_APR && CROS_EC && I2C && SOUNDWIRE
+	depends on QCOM_APR && I2C && SOUNDWIRE
 	select SND_SOC_QDSP6
 	select SND_SOC_QCOM_COMMON
 	select SND_SOC_RT5663
 	select SND_SOC_MAX98927
-	select SND_SOC_CROS_EC_CODEC
+	select SND_SOC_CROS_EC_CODEC if CROS_EC
 	help
 	  To add support for audio on Qualcomm Technologies Inc.
 	  SDM845 SoC-based systems.
-- 
2.17.1

