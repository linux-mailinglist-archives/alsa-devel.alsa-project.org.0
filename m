Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C82811FA8D4
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 08:36:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3286E168D;
	Tue, 16 Jun 2020 08:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3286E168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592289378;
	bh=OqIBWNSJHlNsv0sqsxzj+TzAyCFQDlux8lm+RJdyWdY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pbQJeZlRYvDrLpFjSA39n+Tk04ckTde2lQWJCGX/vRH0qRaxTQc+J5OW+MA2ZKSHb
	 ck5QhBv6pW5SLcpNgvYJyIwfoU5DQVs5B2GGhddOBu9d7/s9UXwTeCFhUkbbkywrL+
	 mhreCK8KDjLGaX1uFaHq/OkuxppX5F9F1czLSbe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58FCFF80101;
	Tue, 16 Jun 2020 08:34:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E301F8022B; Tue, 16 Jun 2020 08:34:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71A0DF80114
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 08:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71A0DF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vQmypwTz"
Received: by mail-pf1-x442.google.com with SMTP id 23so9006763pfw.10
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 23:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=phw+ielG3h+twIh3+qC+uo7yVbqWNCPg00mlIiD4UHs=;
 b=vQmypwTz1N5KmBRHLqcs8qJQ06YTIDRJr7maPiBvnEkOWhJZPp0zfiqeL6HOEpqQNf
 1MJU4hciQzY2ovFdqGaxK8Fa/WqTYmMtL9BjmVzoZZNnugzjFkItw2zkqBKT62ano/sO
 oaCFtSuqV5ocWkJDIe0fNdo2lsPR6W3Y8+SoC00l/zqH5fcO7weVu5CtBH/FAq8p1tkr
 EvT1tw68stOx22zgily2gFfuLzXKHq1yx6w0onzrEiGDLjnNhldCrORr5aWea9Bq+Wzh
 IoIKUEgazeEDMHJDVFUbmDvQADRoFLKNetJ2/YIq9HA2Hiaeqhxp3Rq/ai0t3+m7eQFJ
 /LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=phw+ielG3h+twIh3+qC+uo7yVbqWNCPg00mlIiD4UHs=;
 b=Vqt0tbe2ufGq8mECdpo4mx8BpOAxZh33gtv5BIEBHIa1vOAr50fw21E8or7TXzQQO/
 K1jKdtexsd2EwEfoXwUi8xLEufUjOsaFkJP5cRg6f/uvJo9Sa9sBzPElrMorkBkIzjRF
 E61Gl2/98xGuES6nAVDRrq6ox0TKEeER9Ugpe6bnKwfWcGUodXb+JtKNwUecUJELqU9W
 vTlwKra3d6HIPE9F3WzgxYDTOY9UBR6iHH0/ne/9mKIiykHh83h40u1lYPenlOA077Cv
 9RqqOpayVN/Tr+9MW29HGL0Of6j9z0PrOxZBQ6vJyQ63GWce1VBjftzDOJ5xQZaKwZjh
 3hKw==
X-Gm-Message-State: AOAM53106ixd4twiYBUSr4gfbf4RHZ+WBHklYw+rwd5kvMbp1lUeesNY
 GXI/+JcNC3qeCHQbNTnYA24kzw==
X-Google-Smtp-Source: ABdhPJwJBjn1wnHCWxLt8DOUjJGyDw0cq4C6RGxPSk5rHOAL1keX+nJqqTHahQfFmugYWCjhrUTPtQ==
X-Received: by 2002:a63:e804:: with SMTP id s4mr1010573pgh.260.1592289260811; 
 Mon, 15 Jun 2020 23:34:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 140sm15669950pfy.95.2020.06.15.23.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 23:34:20 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESENDx2][PATCH] sound: qcom: Kconfig: Tweak dependencies on
 SND_SOC_SDM845
Date: Tue, 16 Jun 2020 06:34:17 +0000
Message-Id: <20200616063417.110263-1-john.stultz@linaro.org>
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

