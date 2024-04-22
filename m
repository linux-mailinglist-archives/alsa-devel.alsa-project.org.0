Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3F68ACE9A
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 15:45:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97CBF10BE;
	Mon, 22 Apr 2024 15:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97CBF10BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713793530;
	bh=RSqYj9fLODqyWDFm63AWBPUaIjp1sUJoSIUJRQbfYkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m7hOy/C6TTsDwgZNtqSRArtrSkAHATWG+btocRNdNt6DZP5+iy0x5jbAJ3q/vI23I
	 9g0i+Pkx6KnlaoO77P8IBzx8Kgd5Iit6BIieU99ZdsOkRmpKIfXe4ZsUZzTJaq2vcX
	 9VXoPiIzidMz4nnQG/Ej/R9amYvYLBGAjRYi06a8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 519D6F80616; Mon, 22 Apr 2024 15:44:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F836F8060C;
	Mon, 22 Apr 2024 15:44:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 192ADF802E8; Mon, 22 Apr 2024 15:44:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 593F2F8003C
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 15:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 593F2F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rHz802VM
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41a4f291f9dso7393815e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Apr 2024 06:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713793444; x=1714398244;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ooDB6P5Kmg8yEzYGOGc1KNPluwmb/df6YvlokaERTg=;
        b=rHz802VMhTGCa6IN/ukJtOmm+Mb9//1ZfpCnJAatGLjPDfUjCHiBEMRe8YSKKk6Ozp
         k81Kylq9v6G6NqLnCMxXTQcGxTe3zJ6lQyRzFR0uhowBR30g8AmH4g3iqST9Yk0+4TPk
         t0QCaRVdYIIG+Ux5wpdbMeEEydiXem7Xk6OWrbdn+Gf80XBNIwW6RJNrYUbYkHeC3k4I
         3kVqVh8A2NlwXLRsTJkG8wlHmr+1quk5tuj9FD6IS33buNS2kiYbWYD9hcma4/ECO2YX
         e2XakkYwrQrH+3Vh6qffMnP0cf0oOgucyHcLBbRZatbWmfEony0EWkgJE1WzOPoVU8H7
         Y4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713793444; x=1714398244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ooDB6P5Kmg8yEzYGOGc1KNPluwmb/df6YvlokaERTg=;
        b=rSJAJKjdlbY+k5Mz1yu6Yu3O/dy6w/qlq6XsztF+3RuelL34I+kkqhsfNG4HWvAVq+
         KnvVYJ+Y5T4iEE9OX8GHOMOgHdmhrYVRLFRlL/2OuSTBNYvi+mfKz1v+os8tiFP2DIaR
         GeL1sKTcNeazoH/9jwE1foiTtSKcP/C4YeeqFWMvDdpyKsKAy4u/4cYbyPcM+EY/wmDL
         YkIo5uHIGk7EqQb0W6AorkzqcWe/onO0yDrr8uW85Ut81lc5bLbAKO0keoDMNMis4Mqx
         Z2FrBf6vs8Q2qnhjsCvQSlBkJQ1bemEN7jh6DjTrzW4VYrRTIF3PHbBWRl7BKpt3MIow
         q+PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlj0cqzspaWg1TYdwJGYS/i1wpCnmsLQLqZPclUd1zrDSAH83r43fnP55F/2Lxq/wkP1StaBc1YnTWUl0w9/TlV4Q+/e3mYdDglDs=
X-Gm-Message-State: AOJu0Yxhxw+lYkL+TsPGlkuECT3ep6bbqQIgznkK4pu/xWsro55e7MqL
	JOTe/LDYnjlnaGzot+NLk2RURENWt44x0bxuyfsMgZmbPPiNFhVlqcB3MgEN/aY=
X-Google-Smtp-Source: 
 AGHT+IHnK3xm7CMZ4D7teNrVAR475tu+8odtu8N0waL9N53OtCwv49PY4AtgG8UEQNcltk7ayCBSBg==
X-Received: by 2002:a05:600c:46cb:b0:418:a786:3760 with SMTP id
 q11-20020a05600c46cb00b00418a7863760mr6722875wmo.15.1713793443690;
        Mon, 22 Apr 2024 06:44:03 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c4ed200b00417d624cffbsm20731069wmq.6.2024.04.22.06.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 06:44:02 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 3/4] ASoC: qcom: sc8280xp: add Display port Jack
Date: Mon, 22 Apr 2024 14:43:53 +0100
Message-Id: <20240422134354.89291-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VOWVEBX7TNKWTJN5C5WFWDQAHVRSYSFO
X-Message-ID-Hash: VOWVEBX7TNKWTJN5C5WFWDQAHVRSYSFO
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOWVEBX7TNKWTJN5C5WFWDQAHVRSYSFO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Add support to Display Port Jack events, by making use of common helper
function.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 878bd50ad4a7..38f97f19add9 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -19,6 +19,7 @@ struct sc8280xp_snd_data {
 	struct snd_soc_card *card;
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 	struct snd_soc_jack jack;
+	struct snd_soc_jack hdmi_jack[8];
 	bool jack_setup;
 };
 
@@ -27,6 +28,8 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_jack *hdmi_jack  = NULL;
+	int hdmi_pcm_id = 0;
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
@@ -41,10 +44,21 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 17);
 		snd_soc_limit_volume(card, "SpkrRight PA Volume", 17);
 		break;
+	case DISPLAY_PORT_RX_0:
+		hdmi_pcm_id = 0;
+		hdmi_jack = &data->hdmi_jack[hdmi_pcm_id];
+		break;
+	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
+		hdmi_pcm_id = cpu_dai->id - DISPLAY_PORT_RX_1 + 1;
+		hdmi_jack = &data->hdmi_jack[hdmi_pcm_id];
+		break;
 	default:
 		break;
 	}
 
+	if (hdmi_jack)
+		return qcom_snd_dp_jack_setup(rtd, hdmi_jack, hdmi_pcm_id);
+
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
-- 
2.25.1

