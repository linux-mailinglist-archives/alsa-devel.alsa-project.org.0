Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1324878EE0D
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 15:06:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28A901E8;
	Thu, 31 Aug 2023 15:05:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28A901E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693487166;
	bh=9TPTVrvf5oJfIFAtD84vXyMvdXZhVNCUt8XaY9DtmMg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qBQZvRjuSvacZWDyPxjkdBOeYwsbubWJ7qviX4Wan4kzKbptyn9XU8nKmNR9A7KPk
	 OJs4sZXl7TfZLDWBfPt59uL3HdkM/+g3e02h5FmCU/S+b0raTp0otVUZiPoLaiTSNJ
	 nsxBVr8tU/+RBfvnx8uAlj7GRB5h/UndusnlMxZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88F8DF8032D; Thu, 31 Aug 2023 15:05:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C3D4F800F5;
	Thu, 31 Aug 2023 15:05:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27F16F80158; Thu, 31 Aug 2023 15:05:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48AB2F800D1
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 15:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48AB2F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=vor/rmXo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dkLSiPfw
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A271321832;
	Thu, 31 Aug 2023 13:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693487105;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=ywAn5IpUhFxcBWMzJHwUvO0Fk6A9p1uI5LIseKcYdyk=;
	b=vor/rmXoUDMAvn+QJu3nMyWEnYBTFjF27wL2nCHVNc5VSr+Wu4FpAENnBRKf0bqGRyr9Tq
	T/qMdH1LTJv2VFG7R2YTSTdkTV1gBWx/EH8D4XGR9+OZbRqrwVxTJnfyxHkDX+e9P4u5ct
	zuCoqPf7xhxEkp9AEwubkDGlPlxnWWE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693487105;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=ywAn5IpUhFxcBWMzJHwUvO0Fk6A9p1uI5LIseKcYdyk=;
	b=dkLSiPfwqPhBes+XBXOjkdGkJBz4GJdeiUVu7FX4ZGLQVg124DzIPHyOIpPV6uWExyGaux
	dDJunQN1/CT5+XCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8046B13587;
	Thu, 31 Aug 2023 13:05:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id TzM+HgGQ8GSLEgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 31 Aug 2023 13:05:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 1/2] ASoC: dmaengine: Drop unused iov_iter for process
 callback
Date: Thu, 31 Aug 2023 15:04:56 +0200
Message-Id: <20230831130457.8180-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZBBU5OVONQU6UQMJL6C3HE4DVZBTADO6
X-Message-ID-Hash: ZBBU5OVONQU6UQMJL6C3HE4DVZBTADO6
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZBBU5OVONQU6UQMJL6C3HE4DVZBTADO6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Passing the iov_iter to the process callback is rather buggy, as the
iterator has been already processed for playback.  Similarly, it makes
the copy for capture buggy after the process callback reading the
iterator out.  Moreover, all existing process callbacks don't refer to
the passed iterator at all.  So, it's better to drop the argument from
the process callback.

Fixes: 9bebd65443c1 ("ASoC: dmaengine: Use iov_iter for process callback, too")
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/r/CAHk-=wje+VkXjjfVTmK-uJdG_M5=ar14QxAwK+XDiq07k_pzBg@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/dmaengine_pcm.h         | 2 +-
 sound/soc/atmel/mchp-pdmc.c           | 2 +-
 sound/soc/soc-generic-dmaengine-pcm.c | 4 ++--
 sound/soc/stm/stm32_sai_sub.c         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index c9a8bce9a785..d70c55f17df7 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -142,7 +142,7 @@ struct snd_dmaengine_pcm_config {
 			struct snd_pcm_substream *substream);
 	int (*process)(struct snd_pcm_substream *substream,
 		       int channel, unsigned long hwoff,
-		       struct iov_iter *buf, unsigned long bytes);
+		       unsigned long bytes);
 	dma_filter_fn compat_filter_fn;
 	struct device *dma_dev;
 	const char *chan_names[SNDRV_PCM_STREAM_LAST + 1];
diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index afe213a71212..dcc4e14b3dde 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -954,7 +954,7 @@ static int mchp_pdmc_dt_init(struct mchp_pdmc *dd)
 /* used to clean the channel index found on RHR's MSB */
 static int mchp_pdmc_process(struct snd_pcm_substream *substream,
 			     int channel, unsigned long hwoff,
-			     struct iov_iter *buf, unsigned long bytes)
+			     unsigned long bytes)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	u8 *dma_ptr = runtime->dma_area + hwoff +
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index ff2166525dbc..7a07fbf98e2e 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -296,7 +296,7 @@ static int dmaengine_copy(struct snd_soc_component *component,
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
 	int (*process)(struct snd_pcm_substream *substream,
 		       int channel, unsigned long hwoff,
-		       struct iov_iter *buf, unsigned long bytes) = pcm->config->process;
+		       unsigned long bytes) = pcm->config->process;
 	bool is_playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	void *dma_ptr = runtime->dma_area + hwoff +
 			channel * (runtime->dma_bytes / runtime->channels);
@@ -306,7 +306,7 @@ static int dmaengine_copy(struct snd_soc_component *component,
 			return -EFAULT;
 
 	if (process) {
-		int ret = process(substream, channel, hwoff, buf, bytes);
+		int ret = process(substream, channel, hwoff, bytes);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index f9b5d5969155..0acc848c1f00 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1246,7 +1246,7 @@ static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops2 = {
 
 static int stm32_sai_pcm_process_spdif(struct snd_pcm_substream *substream,
 				       int channel, unsigned long hwoff,
-				       struct iov_iter *buf, unsigned long bytes)
+				       unsigned long bytes)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-- 
2.35.3

