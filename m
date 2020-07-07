Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BB121743C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 18:41:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E3E91614;
	Tue,  7 Jul 2020 18:40:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E3E91614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594140092;
	bh=fWpoU5o8U7Li4nBR+hHnPTIvIDkunHMtFGRGX8794x0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CGGsKlWJLnPGtYE1B3ekdioFEy7iazoDfjhcb1D+ZxYSCqvUvk8zD0FAmLX1gMCC2
	 6FXMyVCHcJ/J2iJSjBeo7Y3sVlHH1V5jmettHKi1DK+BI70lr14zFtfy4AdYToffdW
	 VskKdsyQe7qWFw2qeYbWtSd1OSljXwvbxmDu0W7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CEEEF802E2;
	Tue,  7 Jul 2020 18:37:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA57FF8025A; Tue,  7 Jul 2020 18:37:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A35B1F80216
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 18:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A35B1F80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xS8L96oE"
Received: by mail-wr1-x443.google.com with SMTP id j4so43477314wrp.10
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 09:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aqC1GVKNBxwbTAHfrch1E7G6kmkKXb4B2JeJjwNmHx8=;
 b=xS8L96oEXeI86sWVuc0O449/wvjjlvYUNfzYFvZbWU1KdlDCf73pK3R6rAaAMdKXFF
 vQrpyuNTqmFb8g42twiRoeOr1/VfMPWe8tHv3UNdV7sE13W1+g/aybLy2ahMyS4Cqv7I
 zpcdnxcune+hY29+MHgPSKYSXdLNrFpt4cqP9rAuZbNazJy47cf0a5poWQ4bQItE8gwt
 wJaLxX8+Vd710UUhoY7Ai7vzT81a5BJ8pQrxILGmVrOG62ML2ttJ2TcX6XZG9MT4uVcH
 Ayi777FwFQ06sVY4YiLMWKgQR4ORL1kW1Y4lHTVSTWi9KL6rgcCF89XyfXfha4zCOeLH
 fVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aqC1GVKNBxwbTAHfrch1E7G6kmkKXb4B2JeJjwNmHx8=;
 b=Y9oQxXVDKD80mJqUY6rtL9bc2s3S64qDw/KVbbgmOvgj+h+wcLDaWAnj6WzG6xX5so
 6S2ECmmeesLdu3sfOBbskbM1A/bieiPgnuWRRYDPJzx1Orc6i1zM0bhGIX5NYKg4qqUH
 3vnBNPQj/POaHiloj3meh/FGamrYdLg2hgp5WPsgqUmH9Zs7VahdcThkD5Pk+tMjyVVB
 1nKsVuWm6aVsn0ZjweImXRHdMEEsD5himjx2hr6EWfs1SK1+kYrZdLmvIiGA62RtpWVr
 gJVNA8Fgn2Mz9GsvzPqo/KM8fBqIzjrozaQ2P0O6BUnVlO3PetVygUAk7uFfTQkqEV/E
 STSA==
X-Gm-Message-State: AOAM531d5cyJxlcrzDXkdYwUrZW8hRY1eSM7sFm/GQdTRO/Ig6JyfnFk
 3L6FgSTsietTqJ+pO8mntp+dCw==
X-Google-Smtp-Source: ABdhPJw30nD04p+v8bnjgowIavj9hjHP2G9Of6hWZgHJ31R63BLoam5M5XzFHpG83bNNOc/h1/SuMA==
X-Received: by 2002:a5d:4e8e:: with SMTP id e14mr51870308wru.134.1594139817378; 
 Tue, 07 Jul 2020 09:36:57 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p14sm1925874wrj.14.2020.07.07.09.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 09:36:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 06/11] ASoC: q6asm: add support to remove intial and trailing
 silence
Date: Tue,  7 Jul 2020 17:36:36 +0100
Message-Id: <20200707163641.17113-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

This patch adds support to ASM_DATA_CMD_REMOVE_INITIAL_SILENCE
and ASM_DATA_CMD_REMOVE_TRAILING_SILENCE asm command to support
compressed metadata for gapless playback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm.c | 53 ++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6asm.h |  6 ++++
 2 files changed, 59 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 205453d1c1fc..14ec7dad5b65 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -51,6 +51,8 @@
 #define ASM_STREAM_CMD_OPEN_READWRITE_V2        0x00010D8D
 #define ASM_MEDIA_FMT_ALAC			0x00012f31
 #define ASM_MEDIA_FMT_APE			0x00012f32
+#define ASM_DATA_CMD_REMOVE_INITIAL_SILENCE	0x00010D67
+#define ASM_DATA_CMD_REMOVE_TRAILING_SILENCE	0x00010D68
 
 
 #define ASM_LEGACY_STREAM_SESSION	0
@@ -639,6 +641,8 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 		case ASM_STREAM_CMD_OPEN_READWRITE_V2:
 		case ASM_STREAM_CMD_SET_ENCDEC_PARAM:
 		case ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2:
+		case ASM_DATA_CMD_REMOVE_INITIAL_SILENCE:
+		case ASM_DATA_CMD_REMOVE_TRAILING_SILENCE:
 			if (result->status != 0) {
 				dev_err(ac->dev,
 					"cmd = 0x%x returned error = 0x%x\n",
@@ -1324,6 +1328,55 @@ int q6asm_stream_media_format_block_ape(struct audio_client *ac,
 }
 EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_ape);
 
+static int q6asm_stream_remove_silence(struct audio_client *ac, uint32_t stream_id,
+				       uint32_t cmd,
+				       uint32_t num_samples)
+{
+	uint32_t *samples;
+	struct apr_pkt *pkt;
+	void *p;
+	int rc, pkt_size;
+
+	pkt_size = APR_HDR_SIZE + sizeof(uint32_t);
+	p = kzalloc(pkt_size, GFP_ATOMIC);
+	if (!p)
+		return -ENOMEM;
+
+	pkt = p;
+	samples = p + APR_HDR_SIZE;
+
+	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, stream_id);
+
+	pkt->hdr.opcode = cmd;
+	*samples = num_samples;
+	rc = apr_send_pkt(ac->adev, pkt);
+	if (rc == pkt_size)
+		rc = 0;
+
+	kfree(pkt);
+
+	return rc;
+}
+
+int q6asm_stream_remove_initial_silence(struct audio_client *ac,
+					uint32_t stream_id,
+					uint32_t initial_samples)
+{
+	return q6asm_stream_remove_silence(ac, stream_id,
+					   ASM_DATA_CMD_REMOVE_INITIAL_SILENCE,
+					   initial_samples);
+}
+EXPORT_SYMBOL_GPL(q6asm_stream_remove_initial_silence);
+
+int q6asm_stream_remove_trailing_silence(struct audio_client *ac, uint32_t stream_id,
+					 uint32_t trailing_samples)
+{
+	return q6asm_stream_remove_silence(ac, stream_id,
+				   ASM_DATA_CMD_REMOVE_TRAILING_SILENCE,
+				   trailing_samples);
+}
+EXPORT_SYMBOL_GPL(q6asm_stream_remove_trailing_silence);
+
 /**
  * q6asm_enc_cfg_blk_pcm_format_support() - setup pcm configuration for capture
  *
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 0379580f0742..e315f7ff5e54 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -135,6 +135,12 @@ int q6asm_run(struct audio_client *ac, uint32_t stream_id, uint32_t flags,
 	      uint32_t msw_ts, uint32_t lsw_ts);
 int q6asm_run_nowait(struct audio_client *ac, uint32_t stream_id,
 		     uint32_t flags, uint32_t msw_ts, uint32_t lsw_ts);
+int q6asm_stream_remove_initial_silence(struct audio_client *ac,
+					uint32_t stream_id,
+					uint32_t initial_samples);
+int q6asm_stream_remove_trailing_silence(struct audio_client *ac,
+					 uint32_t stream_id,
+					 uint32_t trailing_samples);
 int q6asm_cmd(struct audio_client *ac, uint32_t stream_id,  int cmd);
 int q6asm_cmd_nowait(struct audio_client *ac, uint32_t stream_id,  int cmd);
 int q6asm_get_session_id(struct audio_client *ac);
-- 
2.21.0

