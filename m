Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E311E364672
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 16:50:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54A04167B;
	Mon, 19 Apr 2021 16:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54A04167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618843858;
	bh=BSP4XczJ3Fsu6E6RoLkIpch3e6igP6WK4D9/wctjXQM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f9zGSOwDG05Y/OMfCrU6iCZjG99bafOFEaQyzdYAd/uj3j0wuDOh4b2Z5Z8NIK9BW
	 JGBoR/Zzzi3YujYV0TOzLSgvSJtmqwBQF/5KghoKSfO3QiQ4tXgj3tDlVpqs/UJW3j
	 I4TWy2QFEbGYnQwKVOraBlbTDZ7hydyzdKx1MbTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C96EF80256;
	Mon, 19 Apr 2021 16:49:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02623F80227; Mon, 19 Apr 2021 16:49:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3052F8014D
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 16:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3052F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="iImHQM3m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1618843766;
 x=1650379766;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F30/4eiH7brWbI8t9xr+MZ7JMcUC/A1wIc2/IxYEU2A=;
 b=iImHQM3mJcp3BBJ1TOIm1jmQS8yJxHHt7NwsNnR11gYkklTq4RtEoGLX
 rHMir2RakdWmzHuCq85srfReXL3s26ho8zFE1XoTNdOnLdzHe20gyUF+S
 k++yxr99A553KjMulYj6sZXn43FR7V5rPdWWIww6WKlfzYDPa+QdY+5Zm
 yGqTfW+QOY8kQvFxg4yML2sv+vwCAcWIW3W31UJb1K62AJdgSsMZ1Q6vb
 P4mS8RVXP924TwmZE7RrPKXRRexokf85qCfRADm6OyEmDGBunp01ot/Q5
 Xhvj3OBPiNuL+DdMXKcJrguaeXp3QbXKHDJYBSuV1zZsN/JnMSpKL433S A==;
From: Niklas Carlsson <Niklas.Carlsson@axis.com>
To: Lars-Peter Clausen <lars@metafoo.de>, =?UTF-8?q?Nuno=20S=C3=A1?=
 <nuno.sa@analog.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH] ASoC: sigmadsp: Disable cache mechanism for readbacks
Date: Mon, 19 Apr 2021 16:49:01 +0200
Message-ID: <20210419144901.9441-1-Niklas.Carlsson@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: Niklas Carlsson <niklasc@axis.com>, alsa-devel@alsa-project.org,
 kernel@axis.com, linux-kernel@vger.kernel.org
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

From: Niklas Carlsson <niklasc@axis.com>

The ALSA control readback functionality only works for non-volatile
controls, i.e. control values that does not change on their own without
driver interaction.

This doesn't work for readbacks since the DSP firmware updates the
control value. Disable the cache mechanism in the driver if the control
name matches the prefix used for readbacks to ensure that the control
value is valid.

Signed-off-by: Niklas Carlsson <niklasc@axis.com>
---
 sound/soc/codecs/sigmadsp.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index 76c77dc8ecf7..b992216aee55 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -24,6 +24,8 @@
 #define SIGMA_FW_CHUNK_TYPE_CONTROL 1
 #define SIGMA_FW_CHUNK_TYPE_SAMPLERATES 2
 
+#define READBACK_CTRL_NAME "ReadBack"
+
 struct sigmadsp_control {
 	struct list_head head;
 	uint32_t samplerates;
@@ -31,6 +33,7 @@ struct sigmadsp_control {
 	unsigned int num_bytes;
 	const char *name;
 	struct snd_kcontrol *kcontrol;
+	bool is_readback;
 	bool cached;
 	uint8_t cache[];
 };
@@ -141,7 +144,8 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 
 	if (ret == 0) {
 		memcpy(ctrl->cache, data, ctrl->num_bytes);
-		ctrl->cached = true;
+		if (!ctrl->is_readback)
+			ctrl->cached = true;
 	}
 
 	mutex_unlock(&sigmadsp->lock);
@@ -164,7 +168,8 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 	}
 
 	if (ret == 0) {
-		ctrl->cached = true;
+		if (!ctrl->is_readback)
+			ctrl->cached = true;
 		memcpy(ucontrol->value.bytes.data, ctrl->cache,
 			ctrl->num_bytes);
 	}
@@ -231,6 +236,15 @@ static int sigma_fw_load_control(struct sigmadsp *sigmadsp,
 	name[name_len] = '\0';
 	ctrl->name = name;
 
+	/*
+	 * Readbacks doesn't work with non-volatile controls, since the
+	 * firmware updates the control value without driver interaction. Mark
+	 * the readbacks to ensure that the values are not cached.
+	 */
+	if (ctrl->name && strncmp(ctrl->name, READBACK_CTRL_NAME,
+				  (sizeof(READBACK_CTRL_NAME) - 1)) == 0)
+		ctrl->is_readback = true;
+
 	ctrl->addr = le16_to_cpu(ctrl_chunk->addr);
 	ctrl->num_bytes = num_bytes;
 	ctrl->samplerates = le32_to_cpu(chunk->samplerates);
-- 
2.20.1

