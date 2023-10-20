Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7247D0AE1
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 10:50:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A851836;
	Fri, 20 Oct 2023 10:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A851836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697791825;
	bh=TP1Ph6XHU1zswecYu9MD+HsIL+pR7WkNcRcp6uXUd3o=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YaLAJaqa3hPmhMIBVCu8X7VthYI5FffBZiUX9pRIbsp6mdZORLO2v0vzVY4ldL4jl
	 FdggkvireRNtCHAiQyWtawCNt7hR9PoonYXhJS6WIMJSJ/fERS4FWW6gtqbd3FBgiu
	 YavUQ/A7/U9o568DnOgxCUqrMcvBeq1vVlC9Ci0o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC1DCF80552; Fri, 20 Oct 2023 10:49:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A455AF8019B;
	Fri, 20 Oct 2023 10:49:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFB9DF8025F; Fri, 20 Oct 2023 10:49:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31863F80236
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 10:49:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31863F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HW24wSID
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32db8924201so389921f8f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 20 Oct 2023 01:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697791762; x=1698396562;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GnHiqqVEbl+pDvywkw0tVZ8FisGTMqMuua4/tZ42RoE=;
        b=HW24wSIDB1qmFGIBpcXEZCXHFiOFr4fJJbnSxJsC6SlqXDlEZzR7mr+h0Jl3ozpGOS
         gj6s6Is03DDCcUc6eSNaybK0X879KOgCFTf+/UcFvMiuKQWjYBTwv1iFjUW44nrUZq8t
         9ST7tm47/erGhfcJbI06S7CeqiygErePPKvaoJbAOghQQgGXqEiijdsSYlakFuES4W6V
         AijCC0zUnO/Qiaheb3z6F04FUTdx5VeR0LWraZaMTF0MbYypnifEN0+TIMuNmilJ4319
         YAEFfnf8uIjdfK56ddYR4hJrA3ahCPvqLu19gCr2uMeGb5BhyJwRJhqP2jYJhnqVt8j5
         aA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697791762; x=1698396562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnHiqqVEbl+pDvywkw0tVZ8FisGTMqMuua4/tZ42RoE=;
        b=u6sxdPq840mUqMfYxRracHTeN98jtrP6oa1cWS2tefxqjCDs8u7vy4xWZeLg1ZM7c1
         qFgQ7Vdj2tmuHhxCdNosmG2j/Zvn82J4/tHtz7vUiAm4Cn6KKUPJ5ZLvRkJk8igC7key
         +7y5iAcfN3MP2MbrwDH/6GDuLwP0xgIz/bdXJw1dv2Ffb4lUvMUxKxxEqLlzIOBINCCq
         1UJmlrqm22qK/WJ6oEg//z4jrxFTUlH+O6ZhwYvPweSKGfNzA0uymmtaF0wTf3joaDHE
         qUUhecncgDLQLYhz9g4bvdbmt6UVu/Ps30yCKo1I7yX6iy++IVfE7Uwqf84rDtWjHWuy
         2i2A==
X-Gm-Message-State: AOJu0Yw3zu38s9Aci2+sIhagzntOvJPl8Md6jwDQcREG1YuXmaFxvUNo
	gZyIPOAHE1hN3H5wil7ZHg+x9g==
X-Google-Smtp-Source: 
 AGHT+IFUTyfFp/kwwteBdgtgwlAO6fV9liuEpYs3jx7es/7vKaY8OxYJjz14JfezGlN1sjLOeo3Tmw==
X-Received: by 2002:a5d:4e06:0:b0:329:6e92:8d73 with SMTP id
 p6-20020a5d4e06000000b003296e928d73mr775428wrt.67.1697791762085;
        Fri, 20 Oct 2023 01:49:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 c1-20020adfa301000000b00323287186aasm1231783wrb.32.2023.10.20.01.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 01:49:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: qcom: audioreach: Add 4 channel support
Date: Fri, 20 Oct 2023 10:49:19 +0200
Message-Id: <20231020084919.18628-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M7PXXUEGA3P7BFVYUGN6AN5DECFCABY6
X-Message-ID-Hash: M7PXXUEGA3P7BFVYUGN6AN5DECFCABY6
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M7PXXUEGA3P7BFVYUGN6AN5DECFCABY6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support four channel streams.  Map channel 3 and 4 to left/right
surround ("quad(side)" from ffmpeg standard channel list) to match what
is in qdsp6/q6dsp-common.c driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

quad(side):
https://trac.ffmpeg.org/wiki/AudioChannelManipulation#Listchannelnamesandstandardchannellayouts
---
 sound/soc/qcom/qdsp6/audioreach.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 5974c7929dd3..4dd2a2e261c9 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -833,6 +833,11 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	} else if (num_channels == 2) {
 		media_format->channel_mapping[0] = PCM_CHANNEL_L;
 		media_format->channel_mapping[1] = PCM_CHANNEL_R;
+	} else if (num_channels == 4) {
+		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
+		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
+		media_format->channel_mapping[2] = PCM_CHANNEL_LS;
+		media_format->channel_mapping[3] = PCM_CHANNEL_RS;
 	}
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
@@ -869,6 +874,11 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 		} else if (mcfg->num_channels == 2) {
 			mp3_cfg->channel_mapping[0] =  PCM_CHANNEL_L;
 			mp3_cfg->channel_mapping[1] =  PCM_CHANNEL_R;
+		} else if (mcfg->num_channels == 4) {
+			mp3_cfg->channel_mapping[0] =  PCM_CHANNEL_FL;
+			mp3_cfg->channel_mapping[1] =  PCM_CHANNEL_FR;
+			mp3_cfg->channel_mapping[2] =  PCM_CHANNEL_LS;
+			mp3_cfg->channel_mapping[3] =  PCM_CHANNEL_RS;
 		}
 		break;
 	case SND_AUDIOCODEC_AAC:
@@ -1057,7 +1067,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	int rc, payload_size;
 	struct gpr_pkt *pkt;
 
-	if (num_channels > 2) {
+	if (num_channels > 4) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
@@ -1094,7 +1104,11 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	} else if (num_channels == 2) {
 		media_cfg->channel_mapping[0] = PCM_CHANNEL_L;
 		media_cfg->channel_mapping[1] = PCM_CHANNEL_R;
-
+	} else if (num_channels == 4) {
+		media_cfg->channel_mapping[0] = PCM_CHANNEL_FL;
+		media_cfg->channel_mapping[1] = PCM_CHANNEL_FR;
+		media_cfg->channel_mapping[2] = PCM_CHANNEL_LS;
+		media_cfg->channel_mapping[3] = PCM_CHANNEL_RS;
 	}
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
@@ -1116,7 +1130,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	struct gpr_pkt *pkt;
 	void *p;
 
-	if (num_channels > 2) {
+	if (num_channels > 4) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
@@ -1158,6 +1172,11 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 		else if (num_channels == 2) {
 			cfg->channel_mapping[0] =  PCM_CHANNEL_L;
 			cfg->channel_mapping[1] =  PCM_CHANNEL_R;
+		} else if (num_channels == 4) {
+			cfg->channel_mapping[0] =  PCM_CHANNEL_FL;
+			cfg->channel_mapping[1] =  PCM_CHANNEL_FR;
+			cfg->channel_mapping[2] =  PCM_CHANNEL_LS;
+			cfg->channel_mapping[3] =  PCM_CHANNEL_RS;
 		}
 	} else {
 		rc = audioreach_set_compr_media_format(header, p, mcfg);
-- 
2.34.1

