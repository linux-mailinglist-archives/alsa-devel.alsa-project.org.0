Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8194B73B
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 13:41:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC7DD16A1;
	Wed, 19 Jun 2019 13:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC7DD16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560944518;
	bh=tP+k1IUZuC1FO0Oit+F7g9UaxsHQXeIwgfQsW8BXdGc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RaAjxW9nLFyIfcS+/WsnUJu2peorP3xHvCOG+Lxe/mfYX9j4vs4ymu0+QN5LctCTT
	 IlpM2YAEX04ZgezwPOn9wIpgQV1BVq9BxWeGMkKezhadMpl3FEDPJ9otaSBTBuu00e
	 CHZt/oZmGraD6FArQ1hka7k0tn3tJt10tBqjXuKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30BC8F89682;
	Wed, 19 Jun 2019 13:40:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C5D1F896B8; Wed, 19 Jun 2019 13:40:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1138EF808AF
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 13:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1138EF808AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="kFj2Lc1x"
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JBV2Qb027524; Wed, 19 Jun 2019 13:40:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=STywHjeMiZssNI+UTkVh5oLxGP1CkwSOM/Df8W6afIc=;
 b=kFj2Lc1xJjAFkVEonzO/1hpGabemD/IxS2GvtHTU1BMV3Fivl7IpaHhW3INs+YX1kOHN
 Y+XBU6LSjqGikqRXPxjawzWrgXRWjnF1H2ukTZmpFl/r69C7wOJ5NiwxIZqRKbsmA7x9
 ls0Mr4Nt5N922wdRW6QYM7sj+vikuuSl+XQRSnA6nP07iHWeoumOzTwXMKkANWjLANlC
 uz2L0bwNxPVD8y9BtEmpml+1vdz+8wayCToZhD594HDY+y8a3whiMoCgQ/x4BJWSkZre
 77yEGx6wOGouhBmOR7X14GxWNktWodim7UPRef7TG8Qh4uLJLaHE0uTYrwEuO7yaiG+l 4g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813bkt4-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 13:40:06 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F017731;
 Wed, 19 Jun 2019 11:40:05 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF8A826C0;
 Wed, 19 Jun 2019 11:40:05 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 19 Jun
 2019 13:40:05 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 19 Jun 2019 13:40:05
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Date: Wed, 19 Jun 2019 13:40:02 +0200
Message-ID: <1560944402-8115-1-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_07:, , signatures=0
Cc: benjamin.gaignard@st.com
Subject: [alsa-devel] [PATCH] ASoC: stm32: dfsdm: add 16 bits audio record
	support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support of audio 16 bits format record to STM32
DFSDM driver.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_adfsdm.c | 49 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index cc517e007039..3c9a9deec9af 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -45,7 +45,7 @@ struct stm32_adfsdm_priv {
 static const struct snd_pcm_hardware stm32_adfsdm_pcm_hw = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_PAUSE,
-	.formats = SNDRV_PCM_FMTBIT_S32_LE,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE,
 
 	.rate_min = 8000,
 	.rate_max = 32000,
@@ -141,7 +141,8 @@ static const struct snd_soc_dai_driver stm32_adfsdm_dai = {
 	.capture = {
 		    .channels_min = 1,
 		    .channels_max = 1,
-		    .formats = SNDRV_PCM_FMTBIT_S32_LE,
+		    .formats = SNDRV_PCM_FMTBIT_S16_LE |
+			       SNDRV_PCM_FMTBIT_S32_LE,
 		    .rates = (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
 			      SNDRV_PCM_RATE_32000),
 		    },
@@ -152,30 +153,58 @@ static const struct snd_soc_component_driver stm32_adfsdm_dai_component = {
 	.name = "stm32_dfsdm_audio",
 };
 
+static void memcpy_32to16(void *dest, const void *src, size_t n)
+{
+	unsigned int i = 0;
+	u16 *d = (u16 *)dest, *s = (u16 *)src;
+
+	s++;
+	for (i = n; i > 0; i--) {
+		*d++ = *s++;
+		s++;
+	}
+}
+
 static int stm32_afsdm_pcm_cb(const void *data, size_t size, void *private)
 {
 	struct stm32_adfsdm_priv *priv = private;
 	struct snd_soc_pcm_runtime *rtd = priv->substream->private_data;
 	u8 *pcm_buff = priv->pcm_buff;
 	u8 *src_buff = (u8 *)data;
-	unsigned int buff_size = snd_pcm_lib_buffer_bytes(priv->substream);
-	unsigned int period_size = snd_pcm_lib_period_bytes(priv->substream);
 	unsigned int old_pos = priv->pos;
-	unsigned int cur_size = size;
+	size_t buff_size = snd_pcm_lib_buffer_bytes(priv->substream);
+	size_t period_size = snd_pcm_lib_period_bytes(priv->substream);
+	size_t cur_size, src_size = size;
+	snd_pcm_format_t format = priv->substream->runtime->format;
+
+	if (format == SNDRV_PCM_FORMAT_S16_LE)
+		src_size >>= 1;
+	cur_size = src_size;
 
 	dev_dbg(rtd->dev, "%s: buff_add :%pK, pos = %d, size = %zu\n",
-		__func__, &pcm_buff[priv->pos], priv->pos, size);
+		__func__, &pcm_buff[priv->pos], priv->pos, src_size);
 
-	if ((priv->pos + size) > buff_size) {
-		memcpy(&pcm_buff[priv->pos], src_buff, buff_size - priv->pos);
+	if ((priv->pos + src_size) > buff_size) {
+		if (format == SNDRV_PCM_FORMAT_S16_LE)
+			memcpy_32to16(&pcm_buff[priv->pos], src_buff,
+				      buff_size - priv->pos);
+		else
+			memcpy(&pcm_buff[priv->pos], src_buff,
+			       buff_size - priv->pos);
 		cur_size -= buff_size - priv->pos;
 		priv->pos = 0;
 	}
 
-	memcpy(&pcm_buff[priv->pos], &src_buff[size - cur_size], cur_size);
+	if (format == SNDRV_PCM_FORMAT_S16_LE)
+		memcpy_32to16(&pcm_buff[priv->pos],
+			      &src_buff[src_size - cur_size], cur_size);
+	else
+		memcpy(&pcm_buff[priv->pos], &src_buff[src_size - cur_size],
+		       cur_size);
+
 	priv->pos = (priv->pos + cur_size) % buff_size;
 
-	if (cur_size != size || (old_pos && (old_pos % period_size < size)))
+	if (cur_size != src_size || (old_pos && (old_pos % period_size < size)))
 		snd_pcm_period_elapsed(priv->substream);
 
 	return 0;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
