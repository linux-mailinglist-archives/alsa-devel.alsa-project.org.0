Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 610808FE821
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 15:46:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E48C684D;
	Thu,  6 Jun 2024 15:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E48C684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717681592;
	bh=I+6UZi7puKUhYGtPeWzvnTaY52v4RHJIizpINfnLSYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WQmmTGnK57CWQ1PMG3s60Qa6ZR0WxaIA3QUMWTIzOw7VzW1c8Ii4HJK6ikwPqsZ4r
	 iLQP3sD9YdLHqfD4P6WaoZQPoKbUgAqhxgPh6XvHeplozG0mSWWWLqCH5G3wG6TYOi
	 P1SUO1N8ziJ+2N1ngrpPo60wEL3AYWXnLd+tx8Bo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAF15F8051F; Thu,  6 Jun 2024 15:46:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C55BF805A9;
	Thu,  6 Jun 2024 15:46:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74849F804E5; Thu,  6 Jun 2024 15:45:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C897AF80171
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 15:45:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C897AF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LleEPhyx
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-354b722fe81so986806f8f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jun 2024 06:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717681555; x=1718286355;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KotxQBLtmDzRH6QGny55WAgb9csIi+0GRil2s7zETak=;
        b=LleEPhyxYIjSkn7f7yz88N0581EG/8QACzNy1hCt5rr+TejAxy+OIFIknwmhgSAjAX
         w6BiwrW+y9ByUnf8nU1ZszerXlM4o8rpCugFSwO2FK5krZ2VCjHngNPdeIvNr1rYxOx0
         LBnEmckXGUnd6zEJbFkO9K+m5ba3RLakhyvfSHqS+3sTCAA2dnaiMUI/aFRG6XoDWJYt
         9GAT5rm3D1tk9Ptz4UXzxM8UXKl+LPNpFmNUInP5/85jhHZDAbpJi35nbR6OHtOBT/md
         pPEUhuQ+na3xs1KuXyrByehLe8dS2iJLWZJL0JgL3PrLCB023t6Tph2mRqJHQA/jbdQB
         qxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717681555; x=1718286355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KotxQBLtmDzRH6QGny55WAgb9csIi+0GRil2s7zETak=;
        b=QtkK7EQvNOtoxNvxp73xAeZB8VIm98rLQ/JWz2CfHlF/a1O14iPmMVAxDDV4GH4oLy
         5emlVva5VjKExBEIECA+yb8pBIDOYci9JyvTRameig4pwGrERHCH7PnBfdrWabpI/U6s
         Mk8sUQ/zJK1mWzAEnK49tJqsSBRCQOSfob65jalFdSgYo+H/qu7x3kwS0m2QxzjLIVh9
         CHxs7Qg6IDWW4Lz43czC7nH0UL43xiaeJQr2hBF3+Y1/62+Y9I4sNQZLyfpxj2dT20X4
         /wYbn/av5leG5su3siiiXTihJLOmvN8ZAcHl0K2JpxnwpTNqnNNTHamlIhDXZ4J9r4bY
         r8Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWINGkqZWIqb15swpeUvw1cRwSi2PObUj4RRe0cKVJ/LilR2/xnShH4zLOvD4KFtIajuqjes0+cNsDZqDT6BvVUrkmcOLCwssdg4uc=
X-Gm-Message-State: AOJu0YzaL48r18m6r1vij/SCrgTC/Ivn0rgbZ/DyDO1TECMbZAW1Zfwy
	EuGLAR/G6dEMcm6I+10iAt8CJIUFIvV2zTsYCHirTKMg66dMPb8Q3mnvpt3UOM9P683xLiHMLGi
	+
X-Google-Smtp-Source: 
 AGHT+IGSCQvrfLW6lE08ifHKvN4Un/+EhdFM2F5Aprg72ymHaQ2v3OqZe8dulDUIdlz+hHyK3pMwDg==
X-Received: by 2002:a05:6000:2aa:b0:355:161:b7e3 with SMTP id
 ffacd0b85a97d-35e8ef7ea4dmr4949893f8f.48.1717670972249;
        Thu, 06 Jun 2024 03:49:32 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e95bcesm1223185f8f.77.2024.06.06.03.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:49:31 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 3/4] ASoC: qcom: sc8280xp: add Display port Jack
Date: Thu,  6 Jun 2024 11:49:21 +0100
Message-Id: <20240606104922.114229-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694;
 i=srinivas.kandagatla@linaro.org; h=from:subject;
 bh=TUQWW37BE+q1mcU0pxnwMPllf5GS98Hiri3+qX4bwus=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmYZQxDaK2PB42LioKGSzptd4+OTAK4jxQS4jwi
 DlhPDmFu/eJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmGUMQAKCRB6of1ZxzRV
 NxfBCACAAfrzfsr30IYlz/hLdxCQonofqYtWX6I8ONji38oi22ss31ptXN0pbuEYDSPe2RdSqiC
 DAlRv6829tTjTaalLZXL7aKaxgFqo1stJ17dLbmJ+Z+m7ZJ4rIN1ZWobe29FG+OcI8T2ibz/DHN
 of4UIqGvxRS3xZYLu1bPelt/PvKB/x+7j+NB23W4815+wDLqkbOaS475xslL6hbrHSVXnLtI0c2
 lRrFAMR5Y4LGVfqjipp8sMtL7yLUZhV2v/n/TATY3GssQ91wgO6UZ4xdERIEPZddcInsNtS72Ag
 xrXug3OgfXaAwYh+J8kaPIUVct08OZ6SqhacKTVtryk9NwaC
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O64J65VOSFTJEMUJ7FMTJ3NXVJ4XV3H7
X-Message-ID-Hash: O64J65VOSFTJEMUJ7FMTJ3NXVJ4XV3H7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O64J65VOSFTJEMUJ7FMTJ3NXVJ4XV3H7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Add support for Display Port Jack events.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 06fd47c4178f..922ecada1cd8 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -19,6 +19,7 @@ struct sc8280xp_snd_data {
 	struct snd_soc_card *card;
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 	struct snd_soc_jack jack;
+	struct snd_soc_jack dp_jack[8];
 	bool jack_setup;
 };
 
@@ -27,6 +28,8 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_jack *dp_jack  = NULL;
+	int dp_pcm_id = 0;
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
@@ -41,10 +44,22 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 17);
 		snd_soc_limit_volume(card, "SpkrRight PA Volume", 17);
 		break;
+	case DISPLAY_PORT_RX_0:
+		/* DISPLAY_PORT dai ids are not contiguous */
+		dp_pcm_id = 0;
+		dp_jack = &data->dp_jack[dp_pcm_id];
+		break;
+	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
+		dp_pcm_id = cpu_dai->id - DISPLAY_PORT_RX_1 + 1;
+		dp_jack = &data->dp_jack[dp_pcm_id];
+		break;
 	default:
 		break;
 	}
 
+	if (dp_jack)
+		return qcom_snd_dp_jack_setup(rtd, dp_jack, dp_pcm_id);
+
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
-- 
2.43.0

