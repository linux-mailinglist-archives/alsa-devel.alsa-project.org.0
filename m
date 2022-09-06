Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7F25AF184
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 19:04:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DA5BE11;
	Tue,  6 Sep 2022 19:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DA5BE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483864;
	bh=4wsof5esc4xjCoSTludTGq7KOh6L3q3nKg97YMn8vYI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gqlWzIoVzSnHQtlaklWvW7PgIBAKOPHCd455YvTSL+vVFRGSftos6oEdmWjdrzf/t
	 igbCLZFB7Asl6DpBVBGgh0KXHYPrjRESfCUaSl6JI6+QzOqYJno1LnMOQvO/nReqcA
	 Z8I8Fj4xH9TOgMPBXDravBNJzu96+UQaLtr75fNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36F4EF8054A;
	Tue,  6 Sep 2022 19:02:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A54A6F804AB; Tue,  6 Sep 2022 19:02:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32F04F804AB
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 19:02:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32F04F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MIypjnmi"
Received: by mail-wm1-x32e.google.com with SMTP id
 c131-20020a1c3589000000b003a84b160addso9302050wma.2
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 10:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5cXkyzv8fGyxrlD42mVszMI8M5/gZNk4Pc54ztLL6XQ=;
 b=MIypjnmic7JjPeUDi5grO0kTunNZ+1CKPlsw8KWEfg2IsJdqr61ZK/XmyZkSV89YTD
 q2Li5pwWDDsZ39AUrVQ7wOOLn1tzukC55jQVmD32FhagZCr4eVR6et8HyZBOs0h5yd8c
 i25cTO43+vk3PPcwhIK5egBjLcVRsEi9ELgSF/00iauT3rfOXKI8sbYnWEA2pIeIMQQ+
 qtZVqcW5C9YL2w2CLsaenUap+8YHjPnwJVbAIWV5aWamc3OpQVDASzBvCRK9zKjYUiWv
 2YOaw6vx9BtpeaHnbHgVjcJzepS+nmFPuf3dxzaEqhY7z4cs8sM7es3eg2LcmSlxIXaC
 78Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5cXkyzv8fGyxrlD42mVszMI8M5/gZNk4Pc54ztLL6XQ=;
 b=ubBGJmxYDm0I0J08cKs04h5qyV8dYmTL/RNC7/gVjnGhWYY2NZcDmuE8cMW7vEGhlx
 lY0Eo6724j8D0pi4MuvL70xJi+cxB8xnK8llktbAUDJJ4daYaM32nZNIHm3ueVa0CXvM
 Vaxa+uSPkiVkMh8eByL/zjIWN4rWZCZwrTV5tm+vAsoJqvF4k3+zk0BtkyoPEgiDHRVF
 ZDceI/rDW47eshaJNMAPJI2sJ3LpqQuoSFnzct6or0tTwZrUJQ4VrWOIGW9Ir/6+fCYK
 jAuyJu6ZkVvySJGJEgnTX5HPjnxQ67OBJzr9j0HnP5InNUZboGAcPFTLnJnkE52TgBvZ
 KLHA==
X-Gm-Message-State: ACgBeo3XBCB/hEz9vhksw108tmqYYoR7sFMP7TQUcV6PhirYo9CEP2P7
 fyao4CgtK+4mK2kowF0vRqE76Q==
X-Google-Smtp-Source: AA6agR4oCi3/Szpkd6bJCLAvjnsfXNZbwqML0O3tyhV9OOOUyXpqw2CscuFoHZJy6PtC8wG+yAnuNg==
X-Received: by 2002:a05:600c:3d05:b0:3a5:dd21:e201 with SMTP id
 bh5-20020a05600c3d0500b003a5dd21e201mr14384871wmb.132.1662483732330; 
 Tue, 06 Sep 2022 10:02:12 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:02:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 05/12] ASoC: codecs: tx-macro: fix kcontrol put
Date: Tue,  6 Sep 2022 18:01:05 +0100
Message-Id: <20220906170112.1984-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
References: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
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

tx_macro_tx_mixer_put() and tx_macro_dec_mode_put() currently returns zero
eventhough it changes the value.
Fix this, so that change notifications are sent correctly.

Fixes: d207bdea0ca9 ("ASoC: codecs: lpass-tx-macro: add dapm widgets and route")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 5c03ef8d88b3..7f9370ed126f 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -822,17 +822,23 @@ static int tx_macro_tx_mixer_put(struct snd_kcontrol *kcontrol,
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
 
 	if (enable) {
+		if (tx->active_decimator[dai_id] == dec_id)
+			return 0;
+
 		set_bit(dec_id, &tx->active_ch_mask[dai_id]);
 		tx->active_ch_cnt[dai_id]++;
 		tx->active_decimator[dai_id] = dec_id;
 	} else {
+		if (tx->active_decimator[dai_id] == -1)
+			return 0;
+
 		tx->active_ch_cnt[dai_id]--;
 		clear_bit(dec_id, &tx->active_ch_mask[dai_id]);
 		tx->active_decimator[dai_id] = -1;
 	}
 	snd_soc_dapm_mixer_update_power(widget->dapm, kcontrol, enable, update);
 
-	return 0;
+	return 1;
 }
 
 static int tx_macro_enable_dec(struct snd_soc_dapm_widget *w,
@@ -1018,9 +1024,12 @@ static int tx_macro_dec_mode_put(struct snd_kcontrol *kcontrol,
 	int path = e->shift_l;
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
 
+	if (tx->dec_mode[path] == value)
+		return 0;
+
 	tx->dec_mode[path] = value;
 
-	return 0;
+	return 1;
 }
 
 static int tx_macro_get_bcs(struct snd_kcontrol *kcontrol,
-- 
2.21.0

