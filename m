Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B400B113CEC
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 09:17:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 404291674;
	Thu,  5 Dec 2019 09:16:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 404291674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575533833;
	bh=/nFp4VuI2UZOxw/NnL/eDe8Zb/L4OPHAuF+ppQ54Ioo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jnalYVYzc5AheA1OBng4uzv7FsySp6eLZzPk9h+knnxpR/moPDYHBhnewYTRGcSxv
	 AbhzUNdagJB3SBjMmSnsxO2JetQiUtD2ouxjp4mnwr0uZz3gNrOwIW+0kyQpvWn8/b
	 jZSoUNwVperedYJajTa2k+sA2I4RKz1PymNg1lFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26D4DF801F8;
	Thu,  5 Dec 2019 09:14:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FB66F801F8; Thu,  5 Dec 2019 09:14:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
 by alsa1.perex.cz (Postfix) with ESMTP id CCE80F800B4
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 09:14:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCE80F800B4
Received: from zenbar.localdomain (unknown [194.162.236.226])
 by mail.bugwerft.de (Postfix) with ESMTPSA id EA5762E4F74;
 Thu,  5 Dec 2019 08:08:26 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: alsa-devel@alsa-project.org
Date: Thu,  5 Dec 2019 09:14:27 +0100
Message-Id: <20191205081428.611572-1-daniel@zonque.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Mack <daniel@zonque.org>
Subject: [alsa-devel] [PATCH 1/2] ALSA: core: add snd_pcm_format_by_name()
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
 sound/core/pcm.c    | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index bbe6eb1ff5d2..ce398caf12ba 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1339,6 +1339,7 @@ static inline void snd_pcm_limit_isa_dma_size(int dma, size_t *max)
 #define PCM_RUNTIME_CHECK(sub) snd_BUG_ON(!(sub) || !(sub)->runtime)
 
 const char *snd_pcm_format_name(snd_pcm_format_t format);
+snd_pcm_format_t snd_pcm_format_by_name(const char *name);
 
 /**
  * snd_pcm_stream_str - Get a string naming the direction of a stream
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 9a72d641743d..248f2dca7a12 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -225,6 +225,18 @@ const char *snd_pcm_format_name(snd_pcm_format_t format)
 }
 EXPORT_SYMBOL_GPL(snd_pcm_format_name);
 
+snd_pcm_format_t snd_pcm_format_by_name(const char *name)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(snd_pcm_format_names); i++)
+		if (strcasecmp(name, snd_pcm_format_names[i]) == 0)
+			return i;
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
