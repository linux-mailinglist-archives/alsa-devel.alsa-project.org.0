Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C29113DC3
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 10:24:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4B7C166F;
	Thu,  5 Dec 2019 10:23:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4B7C166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575537882;
	bh=lOYQJjhYSIdTJelylqGIChSSL3Ul9JESRtq7hqtAVxk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DZMurFxNrTT1tYuF9Qb50AKOQjT7AbVp+/XH/+5TT6abrq1FklXbDlYvfiK1ZmwQ1
	 Af/9Hs7G3RwxUM6/FLyEGWviNgFIrZH7HcZhf3XD1pOvDVRU+EpTOBWYSSqSEzxP2Z
	 Jr08z8+ICdRVLwUc2C0uY38zb8+R2FrWzJVuO6+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4628F80258;
	Thu,  5 Dec 2019 10:21:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51DF3F80252; Thu,  5 Dec 2019 10:21:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
 by alsa1.perex.cz (Postfix) with ESMTP id 9FDE4F80228
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 10:21:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FDE4F80228
Received: from zenbar.localdomain (unknown [194.162.236.226])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 13F672E4FA3;
 Thu,  5 Dec 2019 09:15:26 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: alsa-devel@alsa-project.org
Date: Thu,  5 Dec 2019 10:21:28 +0100
Message-Id: <20191205092129.692520-1-daniel@zonque.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Mack <daniel@zonque.org>
Subject: [alsa-devel] [PATCH v2 1/2] ALSA: core: add snd_pcm_format_by_name()
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

Add a new function to look up PCM format codes by name. This can be used
by ASoC drivers to look up formats through device-tree properties, for
instance.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 include/sound/pcm.h |  1 +
 sound/core/pcm.c    | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 8a89fa6fdd5e..1bfde6f2f180 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1339,6 +1339,7 @@ static inline void snd_pcm_limit_isa_dma_size(int dma, size_t *max)
 					 (IEC958_AES3_CON_FS_48000<<24))
 
 const char *snd_pcm_format_name(snd_pcm_format_t format);
+int snd_pcm_format_by_name(const char *name, snd_pcm_format_t *format);
 
 /**
  * snd_pcm_stream_str - Get a string naming the direction of a stream
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 9a72d641743d..c02d8df4f92b 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -225,6 +225,29 @@ const char *snd_pcm_format_name(snd_pcm_format_t format)
 }
 EXPORT_SYMBOL_GPL(snd_pcm_format_name);
 
+/**
+ * snd_pcm_format_by_name - Return the PCM format code for the given name
+ * @name: PCM format name ('S16_LE', 'S24_3LE', ...)
+ * @format: Pointer to returned PCM format code
+ *
+ * The string comparison is done in a case-insensitive way.
+ *
+ * Return: 0 on success, or -ENOENT if the given format is not valid.
+ */
+int snd_pcm_format_by_name(const char *name, snd_pcm_format_t *format)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(snd_pcm_format_names); i++)
+		if (strcasecmp(name, snd_pcm_format_names[i]) == 0) {
+			*format = i;
+			return 0;
+		}
+
+	return -ENOENT;
+}
+EXPORT_SYMBOL_GPL(snd_pcm_format_by_name);
+
 #ifdef CONFIG_SND_VERBOSE_PROCFS
 
 #define STATE(v) [SNDRV_PCM_STATE_##v] = #v
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
