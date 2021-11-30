Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7808E463AF9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 17:05:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09405229C;
	Tue, 30 Nov 2021 17:05:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09405229C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638288352;
	bh=OKzRNChQjgjpyfMefQcDD3cNZLje//8soBMt5/ezeFU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q7aeVZhHf373lyTXiROhMhIWzIZwPKI3W4CEG4RjF/lnUQstk+YiHbZNpMSg2FpaQ
	 5W9yvyZgeYWa7ERW8PqZFEChDNooQvtXAU5iDqkSPSdfD1JrIBsD1kRH/uELBIhm47
	 zXear9ZG0cPqRedoUrpl5HAaXQofOS9Lm1G0npbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39356F800EE;
	Tue, 30 Nov 2021 17:04:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0674DF80290; Tue, 30 Nov 2021 17:04:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18963F8020D
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 17:04:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18963F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kXrSWYSe"
Received: by mail-wm1-x32a.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so15134511wms.3
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 08:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IBqKZOVerJy7pcVyrJJrQZ25FBoDm1K0Bq5fYG0ijLA=;
 b=kXrSWYSesneu2dOdRsX/77bitmMhu4G8ptXAtC8ILtscF+oY54VkX24FdrXMWQ2QFm
 HaWBeeWU/BnocmPDxjFq6uOOh47F+RH150CSNkwUPn2iiCPidY+DTeCb0QmKHalxilp9
 Z4Tj08BqYxHNaEf0NN4N1QbYtdCjROPmB5b7nJr9Jbvv1kUZmh0DfxKHVJwc5Lk6r78m
 D6flTjbGV405zK/5cCvyeLUMQuszHMNI3KAaXhrObdL/6uHWpJJYEAtVTFKSgRu13V4v
 wgXaUAY289x89C816KF4hdHbyKNITPfxkfrRLPZ5RxPwa3bf5R1YpSgGPwi6iXa04Pcr
 cADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IBqKZOVerJy7pcVyrJJrQZ25FBoDm1K0Bq5fYG0ijLA=;
 b=xNal1Gghed6V6AvmJeWCmXkp8X5XTZ3n9x+2IGmjl8N26Apn8wEIXQEaEUAoHiWi0X
 ckC6QWpjQvPcHz2aISP55+U+hyylX3ZwHKc4gpBRyi07blH5w7281elxWlHih8Vn7KKb
 vDJB/UrdkMscTMK0h0YoacoP90vsNTrhQbMYhY/Uot6pbHCaP3lP7+iPLtHtbCP8LuqO
 e7m9jJ0u1IF/d1PKcBKexeUtqbCAN0QCJ90LieF9EqV65tJM4+lmBYbMFcgkSPzTNqBx
 5XleuFWLEvwHJ2Ji0P5N0QOf16xa4TE1DPhTiTCvTIsoFwvU4S2JpRzaAs09CFOuaxHV
 R4gg==
X-Gm-Message-State: AOAM532NjZToRGejiRaZJE23xxx/p0H4UJhHX9rpyxdgJvhF+/3kXHEi
 OUHE6LjandggIOgLeZMH/wWTVQ==
X-Google-Smtp-Source: ABdhPJzH1M+SjpU9Vy+aHmc/yVN/loWXQPV7DkHX3N5YUeLFM1Y1Cn70yiQQDhW77cHNXV7lTr0H+w==
X-Received: by 2002:a05:600c:b46:: with SMTP id k6mr343605wmr.45.1638288261355; 
 Tue, 30 Nov 2021 08:04:21 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id m20sm3097575wmq.11.2021.11.30.08.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 08:04:20 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: qdsp6: q6routing: Fix return value from
 msm_routing_put_audio_mixer
Date: Tue, 30 Nov 2021 16:04:14 +0000
Message-Id: <20211130160414.21616-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

msm_routing_put_audio_mixer() can return incorrect value in various scenarios.
Fix this, so that change notifications are sent correctly.

Fixes: e3a33673e845 ("ASoC: qdsp6: q6routing: Add q6routing driver")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6routing.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index cd74681e811e..928fd23e2c27 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -498,14 +498,16 @@ static int msm_routing_put_audio_mixer(struct snd_kcontrol *kcontrol,
 	struct session_data *session = &data->sessions[session_id];
 
 	if (ucontrol->value.integer.value[0]) {
+		if (session->port_id == be_id)
+			return 0;
+
 		session->port_id = be_id;
 		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 1, update);
 	} else {
-		if (session->port_id == be_id) {
-			session->port_id = -1;
+		if (session->port_id == -1 || session->port_id != be_id)
 			return 0;
-		}
 
+		session->port_id = -1;
 		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 0, update);
 	}
 
-- 
2.21.0

