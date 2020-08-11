Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B32B3241AC1
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 14:04:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 253601667;
	Tue, 11 Aug 2020 14:03:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 253601667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597147448;
	bh=wKSLUKjFakEL/Up+F+4Pub7EF7FnW7ik3qZjGNYcG+g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=izAeJ3Y2t238iVZjXy8ZcJInz9fsRACmcnXSmStgIo+KvrgVL3lvH3ctMRTVsvB36
	 e5QbA897cvG6Ky8vwCbSie3nEEKYo2/HBG2dkEMaFl7x1hhWahK8NGxqKoCYn59ZK8
	 vUbnKjSyVOKI9B1WTGiDh5sZq5R0an6hFgnXl3fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D825F8014C;
	Tue, 11 Aug 2020 14:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F62AF80161; Tue, 11 Aug 2020 14:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11CEBF80118
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 14:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11CEBF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Xl+yas4m"
Received: by mail-ej1-x643.google.com with SMTP id o23so12809887ejr.1
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 05:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DS3knjmf2olzwbjqVSue9NVEfHLC1OBzOt29LxllL1c=;
 b=Xl+yas4maK8tO3TyP2eIj43TYiIap9CJVgInBiAO/ufnS9q09r3dqM0tJR8OxMon3E
 /1V6RWtGpbrFc6dFiqoaTNArUoLubtx/PdV0aYUc8DT5+ewWMBp3HUqyN/w6DO0+ZjXJ
 Y2WM/JFZfBoYSVeRPpRWoH72meYJ4MOM9nG2wYxWvM462BDxl7O0Hvb/Nac6H8hR90M3
 AkyRjS62snE1EoY0Set0lApjhAHxBn0sMAXeQtiher/Hoap4OoeVWgZQYutlqf7z85Ga
 jgrTfZ820/XZ5aOB/F4PVTO/6tJL6SBKUZvgOSjKZJ9jCkZInkpeeHryyQ4npVrlLyf5
 Ftdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DS3knjmf2olzwbjqVSue9NVEfHLC1OBzOt29LxllL1c=;
 b=ZqtV7aIxCPybl4KjTwrRbat3xqbtT8zx/QACbCAXLjiFyLkoNTeh2OYm7CJWrakn8j
 Ax3Cr6WvJrLBJsg6/9bGyIx9ZzR3mZIli7lk8fjLJv1DDB6L/8/GhLoI9jgu3np+969D
 q0aZL80w8QTwjUVgTyaSKShdKPK2Dq1bo01fvM4S9NMzz4X6WJvnWPASwRtomcI1msli
 /R9Omh7erCBfohVMcSuHh4Lkbo57ypMe6LrsocMaREoj8lden+9daic3FOD5vKZsLDqg
 8cmSh3qBS5Do9LlMUjHS0lfw7pZcRwqDrPlPEsc4RaxnvP0kXkbucRDqz5t/nWX8oMOI
 dSTg==
X-Gm-Message-State: AOAM533oXqMEUe1CCWq4YLDE/TEsCKMrkh9SjoAm9rK2Q5wIt/ux7d5Y
 GklV/Ji8QcwV4GeXykTKVxrgyQ==
X-Google-Smtp-Source: ABdhPJw884vjrIRU0UMP1f+MNUj5qRAYw98YTvDZoecYpYw8d8inavVt2Ur1URHilmqIadhxLZMtCg==
X-Received: by 2002:a17:906:cc48:: with SMTP id
 mm8mr10484703ejb.292.1597147333305; 
 Tue, 11 Aug 2020 05:02:13 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f21sm14238363edv.66.2020.08.11.05.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 05:02:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 1/2] ASoC: q6afe-dai: mark all widgets registers as
 SND_SOC_NOPM
Date: Tue, 11 Aug 2020 13:02:04 +0100
Message-Id: <20200811120205.21805-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, stephan@gerhold.net,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 john.stultz@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Looks like the q6afe-dai dapm widget registers are set as "0",
which is a not correct.

As this registers will be read by ASoC core during startup
which will throw up errors, Fix this by making the registers
as SND_SOC_NOPM as these should be never used.

With recent changes to ASoC core, every register read/write
failures are reported very verbosely. Prior to this fails to reads
are totally ignored, so we never saw any error messages.

Reported-by: John Stultz <john.stultz@linaro.org>
Fixes: 24c4cbcfac09 ("ASoC: qdsp6: q6afe: Add q6afe dai driver")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
	- replaced reg 0 with SND_SOC_NOPM and removed read callback

 sound/soc/qcom/qdsp6/q6afe-dai.c | 210 +++++++++++++++----------------
 1 file changed, 105 insertions(+), 105 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 2a5302f1db98..0168af849272 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -1150,206 +1150,206 @@ static int q6afe_of_xlate_dai_name(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
-	SND_SOC_DAPM_AIF_IN("HDMI_RX", NULL, 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_IN("SLIMBUS_0_RX", NULL, 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_IN("SLIMBUS_1_RX", NULL, 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_IN("SLIMBUS_2_RX", NULL, 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_IN("SLIMBUS_3_RX", NULL, 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_IN("SLIMBUS_4_RX", NULL, 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_IN("SLIMBUS_5_RX", NULL, 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_IN("SLIMBUS_6_RX", NULL, 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("SLIMBUS_0_TX", NULL, 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("SLIMBUS_1_TX", NULL, 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("SLIMBUS_2_TX", NULL, 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("SLIMBUS_3_TX", NULL, 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("SLIMBUS_4_TX", NULL, 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("SLIMBUS_5_TX", NULL, 0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("SLIMBUS_6_TX", NULL, 0, 0, 0, 0),
+	SND_SOC_DAPM_AIF_IN("HDMI_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SLIMBUS_0_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SLIMBUS_1_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SLIMBUS_2_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SLIMBUS_3_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SLIMBUS_4_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SLIMBUS_5_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SLIMBUS_6_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SLIMBUS_0_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SLIMBUS_1_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SLIMBUS_2_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SLIMBUS_3_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SLIMBUS_4_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SLIMBUS_5_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SLIMBUS_6_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUAT_MI2S_RX", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUAT_MI2S_TX", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("TERT_MI2S_RX", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("TERT_MI2S_TX", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SEC_MI2S_RX", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SEC_MI2S_TX", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SEC_MI2S_RX_SD1",
 			"Secondary MI2S Playback SD1",
-			0, 0, 0, 0),
+			0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("PRI_MI2S_RX", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("PRI_MI2S_TX", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_AIF_IN("PRIMARY_TDM_RX_0", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("PRIMARY_TDM_RX_1", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("PRIMARY_TDM_RX_2", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("PRIMARY_TDM_RX_3", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("PRIMARY_TDM_RX_4", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("PRIMARY_TDM_RX_5", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("PRIMARY_TDM_RX_6", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("PRIMARY_TDM_RX_7", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("PRIMARY_TDM_TX_0", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("PRIMARY_TDM_TX_1", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("PRIMARY_TDM_TX_2", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("PRIMARY_TDM_TX_3", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("PRIMARY_TDM_TX_4", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("PRIMARY_TDM_TX_5", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("PRIMARY_TDM_TX_6", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("PRIMARY_TDM_TX_7", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_AIF_IN("SEC_TDM_RX_0", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SEC_TDM_RX_1", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SEC_TDM_RX_2", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SEC_TDM_RX_3", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SEC_TDM_RX_4", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SEC_TDM_RX_5", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SEC_TDM_RX_6", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SEC_TDM_RX_7", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SEC_TDM_TX_0", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SEC_TDM_TX_1", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SEC_TDM_TX_2", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SEC_TDM_TX_3", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SEC_TDM_TX_4", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SEC_TDM_TX_5", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SEC_TDM_TX_6", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SEC_TDM_TX_7", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_AIF_IN("TERT_TDM_RX_0", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("TERT_TDM_RX_1", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("TERT_TDM_RX_2", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("TERT_TDM_RX_3", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("TERT_TDM_RX_4", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("TERT_TDM_RX_5", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("TERT_TDM_RX_6", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("TERT_TDM_RX_7", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("TERT_TDM_TX_0", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("TERT_TDM_TX_1", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("TERT_TDM_TX_2", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("TERT_TDM_TX_3", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("TERT_TDM_TX_4", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("TERT_TDM_TX_5", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("TERT_TDM_TX_6", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("TERT_TDM_TX_7", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_AIF_IN("QUAT_TDM_RX_0", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUAT_TDM_RX_1", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUAT_TDM_RX_2", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUAT_TDM_RX_3", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUAT_TDM_RX_4", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUAT_TDM_RX_5", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUAT_TDM_RX_6", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUAT_TDM_RX_7", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUAT_TDM_TX_0", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUAT_TDM_TX_1", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUAT_TDM_TX_2", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUAT_TDM_TX_3", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUAT_TDM_TX_4", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUAT_TDM_TX_5", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUAT_TDM_TX_6", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUAT_TDM_TX_7", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_AIF_IN("QUIN_TDM_RX_0", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUIN_TDM_RX_1", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUIN_TDM_RX_2", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUIN_TDM_RX_3", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUIN_TDM_RX_4", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUIN_TDM_RX_5", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUIN_TDM_RX_6", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUIN_TDM_RX_7", NULL,
-			     0, 0, 0, 0),
+			     0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUIN_TDM_TX_0", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUIN_TDM_TX_1", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUIN_TDM_TX_2", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUIN_TDM_TX_3", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUIN_TDM_TX_4", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUIN_TDM_TX_5", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUIN_TDM_TX_6", NULL,
-						0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUIN_TDM_TX_7", NULL,
-						0, 0, 0, 0),
-	SND_SOC_DAPM_AIF_OUT("DISPLAY_PORT_RX", "NULL", 0, 0, 0, 0),
+						0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DISPLAY_PORT_RX", "NULL", 0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_component_driver q6afe_dai_component = {
-- 
2.21.0

