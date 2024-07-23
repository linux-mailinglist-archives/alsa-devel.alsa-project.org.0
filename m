Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B38893A33F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2024 16:52:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A4CB1D7;
	Tue, 23 Jul 2024 16:52:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A4CB1D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721746347;
	bh=f4nFfrVFsoZlAw2TqgkIjPVPxb5PG9oafUyuaGzF2hc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XdbFAeJiOErWVlsVzJmqa/gMFohqCPbpq/IVVwFcvwgAtDXyT1CDKSU39xTCCBYAD
	 uoUrhmGoQA6Pd0vuc/NpF2boWjH9FU3D2lQr6OzCDL1T6SJryyR6Tdamik8+9ZpLZn
	 x4dAopE/8PrfZR03bmNlBvgYyWmADsOVimmiEYs4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6EBFF805B1; Tue, 23 Jul 2024 16:51:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 003E3F805B1;
	Tue, 23 Jul 2024 16:51:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D79F8F801F5; Tue, 23 Jul 2024 16:48:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF03AF8007E
	for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2024 16:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF03AF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XBYa/6uG
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5a10835480bso4955980a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jul 2024 07:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721745971; x=1722350771;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TGhe5Ex1bPFfV1vlOFlhgJUy/23nt8E3XkBUwt2fp5w=;
        b=XBYa/6uGVMRsX1Yt5Fkqd8K/M/WT6Vt/dCvrYhkpaQ4Ruz6p9zq5qwFTgqbpAi7BHf
         RWlPuSYbB2dTrchDzcadIgDBZqxHcPpC6docxAAnqkMhkcUy94mEAj8HHGCv2QbjFBfg
         BQ8/dBdxqGoo0ZQ+oq+t9SlG5gmmak/Pus02QDcAcrBizKRCL6qXCCku/j3hANTAk+Fh
         4J1AiXC2UsyytMgmSRrqMhePE/xWl6bgHtXgc6KF2m1xd4ldH6Nfy++DSlzY47Hf4lzS
         XPJV1FjneYMH7OgS0/xaQyLx8gfM8PNZkqUZjT6PtOP95izQ842iyE+d3YLnPgg9bCQI
         renQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721745971; x=1722350771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGhe5Ex1bPFfV1vlOFlhgJUy/23nt8E3XkBUwt2fp5w=;
        b=WJ7GPgzU3dYAAFNGlK7OfXhRNNwe/jIkPhcOCrA5keLlFXWE3+sCLal1x6uuoB5jpo
         MRQ6A9oVCCcLlurlYg19CaNyZBnKmOQFwkfI5LlCKlKCvQBzcG18ZxsWs0jt0XNFpeiz
         Qh0tvVoeNj0sBzfBU2KsJqzZjak0R4X/O+0FrYcGxNU3jisv1Zc+iFspkPOyBxoV4nAF
         dBxVs9AFP8vzVnIe27NrunZr9tQAjv+GqjvSMkaRh+zdBCaz1+8Mz28GLB6s6fbNzKgN
         aLTGjJnGKvzbuF5sYqvrwOKtJLxmQn8maXvw4uuQGECJDWfWj2rx2u+2uinTcjjqJSfx
         GzAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX0vDn1wQ8ImMFHmcGJbHGokibq6b/9d5DtV5VhTW027SIm0n8rU6rT0PnvpWxPNUtlVmlXcQz+EJ5dC75BlXOIddeznAkItRHM6U=
X-Gm-Message-State: AOJu0Yy/car6TGDAdRnDH+XT3PcWHYePZWNd6hXpzLgx8/y3MAf0cI67
	BTDe/VsoApps4texH5jw97J8ElZ4cO6tvf74knhCnKqUeUCJgYMYJIicPOLGcg8=
X-Google-Smtp-Source: 
 AGHT+IE6FPRxaRZAelP7XYoRe2kh2fF3fU2NbulOmAczM715i/eTYrmwCoGSdVXZHnXFZX+KM1NhGg==
X-Received: by 2002:a50:a6ce:0:b0:57d:2659:9141 with SMTP id
 4fb4d7f45d1cf-5a47b0e7da1mr5752175a12.24.1721745971395;
        Tue, 23 Jul 2024 07:46:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30c2f88a5sm7592422a12.77.2024.07.23.07.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 07:46:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: codecs: lpass-wsa-macro: Do not hard-code dai in VI
 mixer
Date: Tue, 23 Jul 2024 16:46:07 +0200
Message-ID: <20240723144607.123240-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VW6RUWRD5UVAONW4F3KL5X2DSDAE3WLY
X-Message-ID-Hash: VW6RUWRD5UVAONW4F3KL5X2DSDAE3WLY
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VW6RUWRD5UVAONW4F3KL5X2DSDAE3WLY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The wsa_macro_vi_feed_mixer_put() callback for setting VI feedback mixer
value could be used for different DAIs (planned in the future CPS DAI),
so make the code a bit more generic by using DAI ID from widget->shift,
instead of hard-coding it.  The get() callback already follows such
convention.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 8351f0974e6a..4158657914fb 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2296,36 +2296,37 @@ static int wsa_macro_vi_feed_mixer_put(struct snd_kcontrol *kcontrol,
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 	u32 enable = ucontrol->value.integer.value[0];
 	u32 spk_tx_id = mixer->shift;
+	u32 dai_id = widget->shift;
 
 	if (enable) {
 		if (spk_tx_id == WSA_MACRO_TX0 &&
 			!test_bit(WSA_MACRO_TX0,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+				&wsa->active_ch_mask[dai_id])) {
 			set_bit(WSA_MACRO_TX0,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI]);
-			wsa->active_ch_cnt[WSA_MACRO_AIF_VI]++;
+				&wsa->active_ch_mask[dai_id]);
+			wsa->active_ch_cnt[dai_id]++;
 		}
 		if (spk_tx_id == WSA_MACRO_TX1 &&
 			!test_bit(WSA_MACRO_TX1,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+				&wsa->active_ch_mask[dai_id])) {
 			set_bit(WSA_MACRO_TX1,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI]);
-			wsa->active_ch_cnt[WSA_MACRO_AIF_VI]++;
+				&wsa->active_ch_mask[dai_id]);
+			wsa->active_ch_cnt[dai_id]++;
 		}
 	} else {
 		if (spk_tx_id == WSA_MACRO_TX0 &&
 			test_bit(WSA_MACRO_TX0,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+				&wsa->active_ch_mask[dai_id])) {
 			clear_bit(WSA_MACRO_TX0,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI]);
-			wsa->active_ch_cnt[WSA_MACRO_AIF_VI]--;
+				&wsa->active_ch_mask[dai_id]);
+			wsa->active_ch_cnt[dai_id]--;
 		}
 		if (spk_tx_id == WSA_MACRO_TX1 &&
 			test_bit(WSA_MACRO_TX1,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+				&wsa->active_ch_mask[dai_id])) {
 			clear_bit(WSA_MACRO_TX1,
-				&wsa->active_ch_mask[WSA_MACRO_AIF_VI]);
-			wsa->active_ch_cnt[WSA_MACRO_AIF_VI]--;
+				&wsa->active_ch_mask[dai_id]);
+			wsa->active_ch_cnt[dai_id]--;
 		}
 	}
 	snd_soc_dapm_mixer_update_power(widget->dapm, kcontrol, enable, NULL);
-- 
2.43.0

