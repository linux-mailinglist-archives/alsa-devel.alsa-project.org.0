Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BCC22E94F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 11:41:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05B5316A1;
	Mon, 27 Jul 2020 11:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05B5316A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595842902;
	bh=gLWAWpjd5L6TTxlnlxC6MpA2Wv8UFIGdfcYOcaAynZ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VQ/Ig+ob2Di+bqMdPC13SgjTnLK+xvLOEfuBWc++j0HcngUZk7ZJ9jtylyUZTJQy7
	 Z9Ew34iJS4KZ2jLj62FNZuzbxOI5oMB6bByjbPXvoS6IjrAQ3JMp/oPnR5OViZaXHP
	 obuHvqQiV35s/+/4q/giXoafbfnvGu917vmbEAik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2B28F8029B;
	Mon, 27 Jul 2020 11:38:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7288BF802DC; Mon, 27 Jul 2020 11:38:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2BF9F80232
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 11:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2BF9F80232
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ltxkpA9i"
Received: by mail-wr1-x443.google.com with SMTP id r4so11196662wrx.9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 02:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BGEGYiZyCfPzP/WgV+vYnmOQ/dOVXNWBzQ8hq5Z41ko=;
 b=ltxkpA9ir5ZOEwoGWUBGf8shaPDTwgYkI7Suv2aMjHin7DHFcAByud8XWneDNcjuOS
 H9OVjgbnUP4LV1sLt4AP9WtGTukJ9/sQtMM4DaHjzJTD6xd7UTyc4nyaQbj5ZcBQPNIg
 Tnd9vXt3eBY/K41w3R3KIUmUQvOtbZxqbAkDRQpx5W4aonKTp9FFsTGHDaF2DLTn1yAK
 Ez4dhdKa5ihdkku7MbNWBv57Wvcqov/t+Fmrs7t5/bjjHmfY+VS/LASxSxHWfE5Yh5yY
 ORwwrUtm3crGbH5INu4krR+09BUnLziT2/I7c2bosdomjhoVVJQdjwMcWGOH9qrbIUC7
 9NmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BGEGYiZyCfPzP/WgV+vYnmOQ/dOVXNWBzQ8hq5Z41ko=;
 b=rAmIJ39VmsyUgQE1u9fWBWS6fHxr/jTQu0FNeQ52hiRz3Zn3JMR9sqjGdDAOdedgXO
 aYkkD5RtVVzqUJ+0ABot1GffqmYXNJBnLtXOKaAeq1eoZh1Nkc/kAknukmxWH/AU5ZUQ
 zO9F9I4ilu0kYwlWr8llTABlLO3eU4JuiNJ0WU++c/saQVHhQ575NJoHYhghpDfnPZhN
 nzBKuzhmM5le4HO2Gm2kIeR6HhPYGlfQydbm9WaI3dI7CTTb0+EhnturDaW5DnSfaYf6
 dxxaQPydeDci2rprCIdDMU1vuTizrAe4fTDgYnbfev3XyPFIrGC3hqLtxwhX3SGa/KLS
 1Y5g==
X-Gm-Message-State: AOAM5337IYTLQV5caBeRMym9acTH0HeabCUr6uLN+58tMWi0iC+22T/K
 v/GgiB8dEuZj/Jq4KdtMmELojA==
X-Google-Smtp-Source: ABdhPJyRhmnUtPua5J4n3aoS3uN4PK6KuvPMmIUlBFDqDftLzkly2DB7Wb/ZyqoEISkgcAEl97RUag==
X-Received: by 2002:a5d:55c9:: with SMTP id i9mr18964490wrw.31.1595842698519; 
 Mon, 27 Jul 2020 02:38:18 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id y189sm20566099wmd.27.2020.07.27.02.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 02:38:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 04/10] ASoC: q6asm: add length to write command token
Date: Mon, 27 Jul 2020 10:38:00 +0100
Message-Id: <20200727093806.17089-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200727093806.17089-1-srinivas.kandagatla@linaro.org>
References: <20200727093806.17089-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org,
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

Add length to write command packet token so that we can track exactly
how many bytes are consumed by DSP in the command reply.

This is useful in some use-cases where the end of the file/stream
is not aligned with period size.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +++-
 sound/soc/qcom/qdsp6/q6asm.c     | 7 ++++---
 sound/soc/qcom/qdsp6/q6asm.h     | 3 +++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 466383b8c20c..5f0e36e23ef3 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -509,6 +509,7 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 	struct snd_compr_stream *substream = prtd->cstream;
 	unsigned long flags;
 	uint64_t avail;
+	uint32_t bytes_written;
 
 	switch (opcode) {
 	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
@@ -529,7 +530,8 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 	case ASM_CLIENT_EVENT_DATA_WRITE_DONE:
 		spin_lock_irqsave(&prtd->lock, flags);
 
-		prtd->copied_total += prtd->pcm_count;
+		bytes_written = token >> ASM_WRITE_TOKEN_LEN_SHIFT;
+		prtd->copied_total += bytes_written;
 		snd_compr_fragment_elapsed(substream);
 
 		if (prtd->state != Q6ASM_STREAM_RUNNING) {
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index d6728304ce6a..205453d1c1fc 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -670,6 +670,7 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 		if (ac->io_mode & ASM_SYNC_IO_MODE) {
 			phys_addr_t phys;
 			unsigned long flags;
+			int token = hdr->token & ASM_WRITE_TOKEN_MASK;
 
 			spin_lock_irqsave(&ac->lock, flags);
 
@@ -681,12 +682,12 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 				goto done;
 			}
 
-			phys = port->buf[hdr->token].phys;
+			phys = port->buf[token].phys;
 
 			if (lower_32_bits(phys) != result->opcode ||
 			    upper_32_bits(phys) != result->status) {
 				dev_err(ac->dev, "Expected addr %pa\n",
-					&port->buf[hdr->token].phys);
+					&port->buf[token].phys);
 				spin_unlock_irqrestore(&ac->lock, flags);
 				ret = -EINVAL;
 				goto done;
@@ -1535,7 +1536,7 @@ int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
 	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, false, stream_id);
 
 	ab = &port->buf[port->dsp_buf];
-	pkt->hdr.token = port->dsp_buf;
+	pkt->hdr.token = port->dsp_buf | (len << ASM_WRITE_TOKEN_LEN_SHIFT);
 	pkt->hdr.opcode = ASM_DATA_CMD_WRITE_V2;
 	write->buf_addr_lsw = lower_32_bits(ab->phys);
 	write->buf_addr_msw = upper_32_bits(ab->phys);
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 9ac020c609c6..312a0452dcdf 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -20,6 +20,9 @@
 #define ASM_CLIENT_EVENT_CMD_RUN_DONE		0x1008
 #define ASM_CLIENT_EVENT_DATA_WRITE_DONE	0x1009
 #define ASM_CLIENT_EVENT_DATA_READ_DONE		0x100a
+#define ASM_WRITE_TOKEN_MASK			GENMASK(15, 0)
+#define ASM_WRITE_TOKEN_LEN_MASK		GENMASK(31, 16)
+#define ASM_WRITE_TOKEN_LEN_SHIFT		16
 
 enum {
 	LEGACY_PCM_MODE = 0,
-- 
2.21.0

