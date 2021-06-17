Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C643AB0D8
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 12:03:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD2C016FC;
	Thu, 17 Jun 2021 12:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD2C016FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623924207;
	bh=0V+4kRflPQJmizbh1Oz4IE9lq6JaMbOIMHE95y8AQJY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cj2XFwRYBlV7NNWcLrrCb9C6vIpaWGflHMzq6TNWleoIPYdMxsunhqQVrzjwalOU0
	 PszraD6MLsPdDAd/KUWwLdbXlMXgM9mPZeAQV80EYDV94vC+vBwnN/S/U9TpcNo/hC
	 wGQB+JTFamcA82OzPTwt6mNUZdo1+0onj8HcGDws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28D8EF8049E;
	Thu, 17 Jun 2021 12:01:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41CC3F80171; Thu, 17 Jun 2021 12:01:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A5FFF8025A
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 12:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A5FFF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="QdwHZjos"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Dv3EROj5"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id EBA8121AFC
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 10:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623924094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AI46nADYvl+R+3UoHZj4hNUe7cY5/uVUWQVUr+7xxas=;
 b=QdwHZjosoO1SBH53zNFWcxBdj9LONMbjwXncqsGhqlqPE92g5qxJGQPA++tiqpqS5SIv4Y
 yQjlVO/gbcbW8k0rp1lE9CZtTw1TXVSe80jhje47TsovTMgAlzTZ9XyNaY1i5dTR6CyDwB
 vS5qKj7NlDQw3VJny6QFXUQQBv9fCfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623924094;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AI46nADYvl+R+3UoHZj4hNUe7cY5/uVUWQVUr+7xxas=;
 b=Dv3EROj5C+pPDG2Tk08YXfWw+Oai5ygeEKB9DiY4BurvwoCE7Ouz2kE+qZ0DT77j/72Lsf
 ixFB2AmDd5UeB2Dw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id DCB66A3BB8;
 Thu, 17 Jun 2021 10:01:34 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 1/2] pcm: rate: Refactoring temporary buffer
 allocations
Date: Thu, 17 Jun 2021 12:01:26 +0200
Message-Id: <20210617100127.12068-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210617100127.12068-1-tiwai@suse.de>
References: <20210617100127.12068-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Introduce common helpers to allocate and release the temporary buffers
and the associated snd_pcm_channel.  Now two allocated objects are
used instead of one malloc to be split.

Also, change the snd_pcm_channel set up to be in interleaved mode.
This will be necessary in the following change in the rate plugin.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/pcm/pcm_rate.c | 80 ++++++++++++++++++++++++++++------------------
 1 file changed, 49 insertions(+), 31 deletions(-)

diff --git a/src/pcm/pcm_rate.c b/src/pcm/pcm_rate.c
index 770aafea567d..1e9961346a7c 100644
--- a/src/pcm/pcm_rate.c
+++ b/src/pcm/pcm_rate.c
@@ -76,6 +76,45 @@ struct _snd_pcm_rate {
 
 #endif /* DOC_HIDDEN */
 
+/* allocate a channel area and a temporary buffer for the given size */
+static snd_pcm_channel_area_t *
+rate_alloc_tmp_buf(snd_pcm_rate_t *rate, snd_pcm_format_t format,
+		   unsigned int channels, unsigned int frames)
+{
+	snd_pcm_channel_area_t *ap;
+	int width = snd_pcm_format_physical_width(format);
+	int i;
+
+	ap = malloc(sizeof(*ap) * channels);
+	if (!ap)
+		return NULL;
+	ap->addr = malloc(frames * channels * width / 8);
+	if (!ap->addr) {
+		free(ap);
+		return NULL;
+	}
+
+	/* set up in interleaved format */
+	for (i = 0; i < channels; i++) {
+		ap[i].addr = ap[0].addr + (i * width) / 8;
+		ap[i].first = 0;
+		ap[i].step = width * channels;
+	}
+
+	return ap;
+}
+
+static void rate_free_tmp_buf(snd_pcm_channel_area_t **ptr)
+{
+	snd_pcm_channel_area_t *c = *ptr;
+
+	if (c) {
+		free(c->addr);
+		free(c);
+		*ptr = NULL;
+	}
+}
+
 static int snd_pcm_rate_hw_refine_cprepare(snd_pcm_t *pcm ATTRIBUTE_UNUSED, snd_pcm_hw_params_t *params)
 {
 	snd_pcm_rate_t *rate = pcm->private_data;
@@ -286,28 +325,13 @@ static int snd_pcm_rate_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
 	if (err < 0)
 		return err;
 
-	rate->pareas = malloc(2 * channels * sizeof(*rate->pareas));
-	if (rate->pareas == NULL)
+	rate->pareas = rate_alloc_tmp_buf(rate, cinfo->format, channels,
+					  cinfo->period_size);
+	rate->sareas = rate_alloc_tmp_buf(rate, sinfo->format, channels,
+					  sinfo->period_size);
+	if (!rate->pareas || !rate->sareas)
 		goto error;
 
-	cwidth = snd_pcm_format_physical_width(cinfo->format);
-	swidth = snd_pcm_format_physical_width(sinfo->format);
-	rate->pareas[0].addr = malloc(((cwidth * channels * cinfo->period_size) / 8) +
-				      ((swidth * channels * sinfo->period_size) / 8));
-	if (rate->pareas[0].addr == NULL)
-		goto error;
-
-	rate->sareas = rate->pareas + channels;
-	rate->sareas[0].addr = (char *)rate->pareas[0].addr + ((cwidth * channels * cinfo->period_size) / 8);
-	for (chn = 0; chn < channels; chn++) {
-		rate->pareas[chn].addr = (char *)rate->pareas[0].addr + (cwidth * chn * cinfo->period_size) / 8;
-		rate->pareas[chn].first = 0;
-		rate->pareas[chn].step = cwidth;
-		rate->sareas[chn].addr = (char *)rate->sareas[0].addr + (swidth * chn * sinfo->period_size) / 8;
-		rate->sareas[chn].first = 0;
-		rate->sareas[chn].step = swidth;
-	}
-
 	if (rate->ops.convert_s16) {
 		rate->get_idx = snd_pcm_linear_get_index(rate->info.in.format, SND_PCM_FORMAT_S16);
 		rate->put_idx = snd_pcm_linear_put_index(SND_PCM_FORMAT_S16, rate->info.out.format);
@@ -322,11 +346,8 @@ static int snd_pcm_rate_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
 	return 0;
 
  error:
-	if (rate->pareas) {
-		free(rate->pareas[0].addr);
-		free(rate->pareas);
-		rate->pareas = NULL;
-	}
+	rate_free_tmp_buf(&rate->pareas);
+	rate_free_tmp_buf(&rate->sareas);
 	if (rate->ops.free)
 		rate->ops.free(rate->obj);
 	return -ENOMEM;
@@ -335,12 +356,9 @@ static int snd_pcm_rate_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
 static int snd_pcm_rate_hw_free(snd_pcm_t *pcm)
 {
 	snd_pcm_rate_t *rate = pcm->private_data;
-	if (rate->pareas) {
-		free(rate->pareas[0].addr);
-		free(rate->pareas);
-		rate->pareas = NULL;
-		rate->sareas = NULL;
-	}
+
+	rate_free_tmp_buf(&rate->pareas);
+	rate_free_tmp_buf(&rate->sareas);
 	if (rate->ops.free)
 		rate->ops.free(rate->obj);
 	free(rate->src_buf);
-- 
2.26.2

