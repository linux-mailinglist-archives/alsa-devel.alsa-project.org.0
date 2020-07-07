Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96628217454
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 18:44:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43D0184D;
	Tue,  7 Jul 2020 18:43:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43D0184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594140279;
	bh=vrX/9mpR853DyzUU7JAO5WkUUNLsFpO091g1tXHRa7w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mM9UOu3O65BBdoWYlL/n3zNKLqPZ1MlaOmjc39bvNlOGwkUxjYRmwdA0o9ucpYWWK
	 AWtlzrVhvEcC9EU+qaHiE65LHGGq3EUGITHZwK6WFKLcBsAbnVRbQFgASKXDpw/G94
	 6115Sx3ZN95fIh7BD7Bwzy+oe9wxeXzbfcMfXZE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC96DF80332;
	Tue,  7 Jul 2020 18:37:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC296F80264; Tue,  7 Jul 2020 18:37:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1380F80264
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 18:36:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1380F80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SKVb4Y4z"
Received: by mail-wm1-x32d.google.com with SMTP id j18so43980335wmi.3
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 09:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iRN6o+p1itojHcaFRxgrGSWCOSGdr0VVMo4vP6TgjyY=;
 b=SKVb4Y4zeIMHe89fvsXsPpFJsJcmEzKqZ1ZHx33ll+/weS64aNM9lL4Wqc8GBgqZxu
 f2cP2S8NBDtvjsl3mV0NDVQAn/Oefjui/Zgzbufq07Gtg3ry02CXMZh8VKDzFuEBl2vP
 omGCEX9CRpP6WjmfIBiGCGZ5VwpmGC9bLJpf9ALpf2OLPuo5RvK32oy51UWwUtwB3V/A
 v4uAMWZJ+yg9cHGagNW7Qe89fDqM3CmMi9yhRlEMmA6+yIF0xR2DRe1RjB4eDfPRdPXG
 kGUiyUDbOApN6JAlzR6d5qKfO7t4z/2Ewb/JFLXc7UrE42X+XajwaqrMg+5LpOyWpTMQ
 VY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iRN6o+p1itojHcaFRxgrGSWCOSGdr0VVMo4vP6TgjyY=;
 b=GwXw2QhArZuDmtWB3Gnlt705EsHlQEt6JkZozuh2hPwNUOVzv1zPYVIcwpRIznSRba
 hw+AwJ3a4xHOM8Jbokfd7Y69WgQHRCLgfwxME/8hIJetV8vkoaCU6Ka7d+jfzH0EP37M
 FkJhC/Q42G+/ZXwH4NINDMxObD1wSN1TD01aevgLUAgXtJHwtbIHZb5gGWlrrGISJV6h
 lN08M1ng9kV2iNQpSfnkRg6fYyuh10fxtIE7jmbaqOYHtcA+MwrHSSLYdSeXumjUm/vY
 a5TzhoElARlsM9Yw45LM/sMBUROlPvQR25T+ZcqA2AdadxwWkfYpj7Y7xJv8FybNt53c
 STwQ==
X-Gm-Message-State: AOAM533InzuBQNvZnuls8Ik1mTRvu6XMJvZOrwuVuV+NXRQ5aO2CMMUp
 sxw27wpOkuZ5tPZvDGvwAPMQeQ==
X-Google-Smtp-Source: ABdhPJy4mbomuMOkS1d2J9pyuA5Z5IB6RG1GuMns4Yyo/F1FjtOkvcfPRFh7nkmb4NTOriF0JVuiJw==
X-Received: by 2002:a1c:7d55:: with SMTP id y82mr4883519wmc.72.1594139818805; 
 Tue, 07 Jul 2020 09:36:58 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p14sm1925874wrj.14.2020.07.07.09.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 09:36:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 07/11] ASoC: q6asm: add support to gapless flag in asm open
Date: Tue,  7 Jul 2020 17:36:37 +0100
Message-Id: <20200707163641.17113-8-srinivas.kandagatla@linaro.org>
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

This patch adds support to gapless flag to q6asm_open_write().

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 4 ++--
 sound/soc/qcom/qdsp6/q6asm.c     | 4 +++-
 sound/soc/qcom/qdsp6/q6asm.h     | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index c3558288242a..8c214436a2c2 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -258,7 +258,7 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		ret = q6asm_open_write(prtd->audio_client, prtd->stream_id,
 				       FORMAT_LINEAR_PCM,
-				       0, prtd->bits_per_sample);
+				       0, prtd->bits_per_sample, false);
 	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		ret = q6asm_open_read(prtd->audio_client, prtd->stream_id,
 				      FORMAT_LINEAR_PCM,
@@ -685,7 +685,7 @@ static int q6asm_dai_compr_set_params(struct snd_soc_component *component,
 	if (dir == SND_COMPRESS_PLAYBACK) {
 		ret = q6asm_open_write(prtd->audio_client, prtd->stream_id,
 				       params->codec.id, params->codec.profile,
-				       prtd->bits_per_sample);
+				       prtd->bits_per_sample, true);
 
 		if (ret < 0) {
 			dev_err(dev, "q6asm_open_write failed\n");
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 14ec7dad5b65..22ac99029e56 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -923,7 +923,7 @@ static int q6asm_ac_send_cmd_sync(struct audio_client *ac, struct apr_pkt *pkt)
  */
 int q6asm_open_write(struct audio_client *ac, uint32_t stream_id,
 		     uint32_t format, u32 codec_profile,
-		     uint16_t bits_per_sample)
+		     uint16_t bits_per_sample, bool is_gapless)
 {
 	struct asm_stream_cmd_open_write_v3 *open;
 	struct apr_pkt *pkt;
@@ -943,6 +943,8 @@ int q6asm_open_write(struct audio_client *ac, uint32_t stream_id,
 	pkt->hdr.opcode = ASM_STREAM_CMD_OPEN_WRITE_V3;
 	open->mode_flags = 0x00;
 	open->mode_flags |= ASM_LEGACY_STREAM_SESSION;
+	if (is_gapless)
+		open->mode_flags |= BIT(ASM_SHIFT_GAPLESS_MODE_FLAG);
 
 	/* source endpoint : matrix */
 	open->sink_endpointype = ASM_END_POINT_DEVICE_MATRIX;
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index e315f7ff5e54..69513ac1fa55 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -100,7 +100,7 @@ int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
 		      uint32_t msw_ts, uint32_t lsw_ts, uint32_t flags);
 int q6asm_open_write(struct audio_client *ac, uint32_t stream_id,
 		     uint32_t format, u32 codec_profile,
-		     uint16_t bits_per_sample);
+		     uint16_t bits_per_sample, bool is_gapless);
 
 int q6asm_open_read(struct audio_client *ac, uint32_t stream_id,
 		    uint32_t format, uint16_t bits_per_sample);
-- 
2.21.0

