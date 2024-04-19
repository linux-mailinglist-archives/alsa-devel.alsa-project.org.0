Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 808E18AB138
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 17:02:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22CC6E0F;
	Fri, 19 Apr 2024 17:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22CC6E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713538973;
	bh=6VfB2MxnfpwxDajfB1IcH+LrSDMjCd5/ucMZhFDOGNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ap4SOpkMPiGwBxCwUeDtB2Ro8WC1DCcngisPg89BhV05kgUBLFn59k7WNERYnq/j/
	 njZxJS2f7B/KWAKjbT1EKh/xMLNfQnOD4N4qDaS8AuIFV0omZsdS6bDUlCeHn1UT80
	 txgyY5uIbxLSLmSIiEAv50rxHFLIfQluVntmxO38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BCB8F805D3; Fri, 19 Apr 2024 17:02:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39322F805CA;
	Fri, 19 Apr 2024 17:02:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CDABF80494; Fri, 19 Apr 2024 17:02:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1CB5F8025A
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 17:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1CB5F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jQz6cDsa
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-418c1920313so17338645e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Apr 2024 08:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713538910; x=1714143710;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMUP+wlhZ8g+tuzLPiwn3mBsR+LeHm7xmSWj9q3JJJ4=;
        b=jQz6cDsadRkWKcipI7DCwiYAuX2xeTQrBZ6e/F3X6Sb5f/vcw0bKk5RvA+iI8/+g6Q
         XGKNYD7wsN1H43dBXgNgXwlo2fKjMq70UBiAiSsraqEz+9tNtzsOzptNNBowWUBb+JFk
         7MZ49t04odLE+i5yALSat0wdhBoKmkZB1jyaW6TGzbH82l3SQz43PaPo16TljMtCjeXp
         KrjjNDHIr6qGxuRjZB/p9iw8s6f9LhN5EerYjd0tTs8bygeqORbHbqk+onezMpj5sO/R
         oQtgHcY4F26NRLKro2wbEGrowhXp+6/1+2KyCD4garsyMwPwFhufCa1Wiu4fNQktQhnz
         pBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713538910; x=1714143710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMUP+wlhZ8g+tuzLPiwn3mBsR+LeHm7xmSWj9q3JJJ4=;
        b=lI3pXKEKAymxBILwJUOLBswNtpRKMs3RFdZfkS6laTiTTfthv7ZWr5u1LQr1Ijy8zD
         0cmLdLByncqaRsaXeGGw9SLh08C5/5gVePZDTaEaLW4u3djWjw4EuL5ToQzWj5aH16OQ
         48V22C51Ezf+cNIlCevRanjtJhOHJa1cCr/e+v/8RS78AAXyC3AntlSTiDq1+PheVrUG
         HZxOm+/RVmgKRf6i7/JoOpir0i4FPRKDr+f6MJ5P711bXUrwhSY4BVAtfc7xQX1UVn5R
         n3TANmX8CE0RXvAB/TCv3SY5w4uOKY/2A/1L2gCfqOXgFNgk1Z2bb8zKwNDjbEkgSHqr
         upaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4zEFiusbzbtDmp7KWrxd3igvgLmeWbKCq2B1ffNx755wV6fJ6XqepW8h5gvqR/wZtuJ7OkkY/m224Hjr3TmUJFiCBGtiz0vrgbzU=
X-Gm-Message-State: AOJu0Yxmq+UJvQ9DP0tnLf81KBSID+iR1/I+LH8qZ6S2AygIqIOpI1bk
	Cimfg6CCeCGG6P3Zp5v3Hp91PRYCv+wYm/MqH6brRgiIzbfyz8RUJ1hc1R1dwUg=
X-Google-Smtp-Source: 
 AGHT+IHpuWndHVKKKBXkjzI7oYy1jjgdAKfsoS5fJeCifW0YVwRYgaH5UckN0SgJC5ZFGU4MLWkuGQ==
X-Received: by 2002:a05:600c:1d01:b0:419:96:965 with SMTP id
 l1-20020a05600c1d0100b0041900960965mr1874240wms.37.1713538910674;
        Fri, 19 Apr 2024 08:01:50 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b00417ee886977sm10660462wmq.4.2024.04.19.08.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:01:49 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	steev@kali.org,
	jenneron@postmarketos.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 3/4] ASoC: qcom: sc8280xp: add Display port Jack
Date: Fri, 19 Apr 2024 16:01:39 +0100
Message-Id: <20240419150140.92527-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419150140.92527-1-srinivas.kandagatla@linaro.org>
References: <20240419150140.92527-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MOLBFGVM5EOZO7W6XJ45RX43PDL2WKSC
X-Message-ID-Hash: MOLBFGVM5EOZO7W6XJ45RX43PDL2WKSC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOLBFGVM5EOZO7W6XJ45RX43PDL2WKSC/>
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
 sound/soc/qcom/sc8280xp.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index b7fd503a1666..ced89cf65b5b 100644
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
@@ -41,10 +44,20 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
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
 	default:
 		break;
 	}
 
+	if (hdmi_jack)
+		return qcom_snd_dp_jack_setup(rtd, hdmi_jack, hdmi_pcm_id);
+
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
-- 
2.43.0

