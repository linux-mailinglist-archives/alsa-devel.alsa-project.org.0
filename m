Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF7922868B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 18:58:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E35D015F2;
	Tue, 21 Jul 2020 18:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E35D015F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595350696;
	bh=9fs74iRco12j8hO5Gp8+cxEesGwe2VxdYSm+jzTxgzM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zqj89vacAj2HedKevYpRdC0iClRSKbxHWTutvb9OhTatttQlNlf26LpYCkna7RSoN
	 jdOl4mEtln8fLODNgrF72Dh9xROTQo+5yYBAkKLlW2Had4+tB/H9tQWG8VW1CMk/y2
	 VOsNAZtNbhn9ENeaD5y7nKwRAnqgNaxSshzlNlfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8340DF802BD;
	Tue, 21 Jul 2020 18:53:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65680F802DB; Tue, 21 Jul 2020 18:53:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F193F8028B
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 18:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F193F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="upiA6fr7"
Received: by mail-wr1-x442.google.com with SMTP id b6so21865044wrs.11
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 09:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fdPCJ0r4pAFvhKy/aJH+HSqNEzc4ORQDPhTx4mOph9I=;
 b=upiA6fr7fWef4eXwE0+hK7HGl2gIyiAo2pzkBvVMmS3W+Vh0yJOrvKJdPgo/CAPQVh
 QRYYdyXrB6w9XSMCkMkD93XcqWGYrUo0YWrETPuCibOge0b9sLFCh1MLXBYWTlAltCEr
 W4xW6522EOvZ0ibsQXbR5rCqxNRWIvfX/d26kBZslpOZeJOpBfxv4Z0bQDdKHKOvsccj
 haJ/CMHj0h7cUbQNTxJA2C8BlUjM3Huk/4+PWNy7vmkbnxEklYhjnJH1lXI+z93c6cna
 /FtW3yvq5njXyJ6SMl+BKzAuYDo2MnOYxL59ObNTUJJOrHiDircHJY2G9y/6n2Nz6YuJ
 sFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fdPCJ0r4pAFvhKy/aJH+HSqNEzc4ORQDPhTx4mOph9I=;
 b=Zt3rdugvswZwhwz2Vv2ns11drZKLWXo3WfkMmkujWMw5x8Ucf4v+OpRGYqaXWhepJB
 f8H8hD23sVlKVATDYtxaJW7G48rrJVvfMBnMjh9BLvF5tDCACQsVEABbnCSWsFvfwWhM
 IRATV2bdkD28v/rk0KGbppSUSH3P18oG3KgG4NutWal/a0zFKoGjUaesJ0VUhLNVnqBG
 wFPUeXpGzwNtsv/v5GBeVPAYKLjoT7CEIQrHrRDgDHB39TMuUk4xTFUPPYr7wvJig8xJ
 LVOwZurMaFaGjIHperTst7dQpTSj+ftIdgMiG1xl1qapK9fSw5cbDKLOE9ukNTr4YcHz
 7gkw==
X-Gm-Message-State: AOAM531eQC7ioGWIE7nHr1868fMZhFLNm+WUtQmTRjE9ogNOKS36xY6v
 wTOBP/VWazmyX6NUOzAzrr/xhw==
X-Google-Smtp-Source: ABdhPJyJvLH6PEqLYBgiHJM7NLc5orRiT+DOc60Cybemhzgdpex54JO59l//QKyViOBHoN3EJql2jA==
X-Received: by 2002:adf:f784:: with SMTP id q4mr27300836wrp.397.1595350408516; 
 Tue, 21 Jul 2020 09:53:28 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id c25sm4058648wml.18.2020.07.21.09.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:53:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 5/9] ASoC: q6asm: add support to remove intial and trailing
 silence
Date: Tue, 21 Jul 2020 17:53:02 +0100
Message-Id: <20200721165306.29082-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200721165306.29082-1-srinivas.kandagatla@linaro.org>
References: <20200721165306.29082-1-srinivas.kandagatla@linaro.org>
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
and ASM_DATA_CMD_REMOVE_TRAILING_SILENCE q6asm command to support
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

