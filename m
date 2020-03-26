Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC11194933
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 21:30:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4C0E166D;
	Thu, 26 Mar 2020 21:29:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4C0E166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585254630;
	bh=yc0/XdCuOi31xBjkcz74QPi22ILmFy4TF0Axd44RWs0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fii5Q+VW83G0DlJb+PP3z1jYK+yUh1YWypdmS1K4poqk5Gt34WiWPcQoVRiUfb/fY
	 s9Qm6s/dIJuKZ+dlyrnLdoMDj2ZRLS0zmc2z1I+7QqpGLfiK+Q8DZmU2z6BhSP2bSo
	 O9e41hm/BYOwFgznZepCeYVrJAIViFEiBAR2oOxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B36CDF80234;
	Thu, 26 Mar 2020 21:28:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA412F80227; Thu, 26 Mar 2020 21:28:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B268F8011E
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 21:28:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B268F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MLPuirHG"
Received: by mail-pl1-x643.google.com with SMTP id g6so2609583plt.2
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=Xte6JTYhfOTcgtkbBUqBG8iaUvqvtXol2sJNIPpD2qg=;
 b=MLPuirHGxydXDBDRZ/xS5K6PiE7OSPGqDuv1UUixk/NsNG4Ms77hhxCR1N5IgaN+VZ
 Uzk4cKJmgTNuS9TWCy8yHKM3yq8mkwR9mjDjNfaBHz4qjmU1tUABlldm9arG+HGnpfVQ
 CwgIs1L8aV4hlb4nve2gu76drB5ebHn2GNqqJ2P8CVMdb7hho7tXSYlTnwcoGNO/Gge6
 0V69tqDwVk0mr31mszkfpb2xsleKtpCXA4Rcv/hqq6nl2C3kYwZ69OWx/Cqwv09d9Q7E
 w3jFhjx/V9eOXuaCdSKdK9DDOJiI21QW1ceJfqo6PALNdD7aD7ebxv2vxyVWCPFRx7U3
 weoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Xte6JTYhfOTcgtkbBUqBG8iaUvqvtXol2sJNIPpD2qg=;
 b=kzh/nZ23qkAaFCUldRhsu7VuSB2aGt1u4WAAKGIqV8OJa54sD7y7dDyR0aakmLCYaR
 VC0oJQUffkppe6FVD0bj9GUu6YMdKuE9sKSRMmyJMjb6sf4M2YJ9eslodJQEqoKHJ+3v
 c8StM6n2opngOt+UuFf6vMS/LIlIZIOXjDQYZVx3nqVnR6auq7XGiVr3QFRkv1i8Ygqo
 FLhL2qixehrlF5MZkTCy9nN+EEdhrkUNtl2ZhTSYqPFfNH37zyjsstvs00VAh723ICS4
 3X/DZ8unJXrD7NILJAQ8fI1VqvpnuvE5XbZkeb2y/yMgfmWM5bjK2JwA3AwCqx0PLPNk
 HJEg==
X-Gm-Message-State: ANhLgQ0YIkXiPuJT/ky7vomr2JDeFDekf24NsxHGhXTzjXdP/TWYNkIC
 KDktRg1sNFPP+1azc7tYW1+jZA==
X-Google-Smtp-Source: ADFU+vv8mMJ10BJLLfBfuu/iGF6cLP8/TyK5cqm4Nq49tE0IEbuHt6E21hY4YyuZiM/BTEDTCXZFNA==
X-Received: by 2002:a17:90a:eb0f:: with SMTP id
 j15mr1891679pjz.139.1585254509470; 
 Thu, 26 Mar 2020 13:28:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 r186sm2428879pfc.181.2020.03.26.13.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 13:28:28 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH] sound: qcom: Kconfig: Tweak dependencies on
 SND_SOC_SDM845
Date: Thu, 26 Mar 2020 20:28:25 +0000
Message-Id: <20200326202825.80627-1-john.stultz@linaro.org>
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
index 6530d2462a9e..6f1bc6ea130e 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -99,12 +99,12 @@ config SND_SOC_MSM8996
 
 config SND_SOC_SDM845
 	tristate "SoC Machine driver for SDM845 boards"
-	depends on QCOM_APR && CROS_EC && I2C
+	depends on QCOM_APR && I2C
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

