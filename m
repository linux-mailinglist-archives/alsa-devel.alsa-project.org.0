Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B77769B49
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAC3986E;
	Mon, 31 Jul 2023 17:51:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAC3986E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818740;
	bh=2X79iAoOgFy4mOygLK7cO1hbSvgxe1q+5UL2JN7Gt8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nH85dOTAiNhjCvjAvyfCNxMMpX6Xmx5EjYVjHO1TNwElmK4/vEQBmRL2QGPoimI6E
	 0sipJOe7vuII4IQAspk6/K5aYmmwO6gdAJ4q2hAJrg8oxPewHVG7BXc9+AT6rHa8nW
	 sN7ZfUyQFWnkaUl/PKtgRN8AV9AZrG9JjElvgpJ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54EF0F80609; Mon, 31 Jul 2023 17:48:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62111F80608;
	Mon, 31 Jul 2023 17:48:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C1DAF8060B; Mon, 31 Jul 2023 17:48:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A05AF80568
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A05AF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TteI47ZC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=KFIuPw1G
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F20211F897;
	Mon, 31 Jul 2023 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4b5rywHR7eXPAe70JDh36VHY43bOiEMHWMgdgUsPrgY=;
	b=TteI47ZCPXMYqja8PO41fWAnGztwfBLaeHEnuVDxwC7Rs25HmzOuyJdkBt1Yvd4ODl9Znn
	cN5DVCsUy61D7FuWfTWsRYFquSPX1upT7NKDcxQ9YU+lJ6plMqUdHfk4yHTujH+xxADlnq
	prijQG2GcdqiP1NNUHfhPycEHCymU7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4b5rywHR7eXPAe70JDh36VHY43bOiEMHWMgdgUsPrgY=;
	b=KFIuPw1GCZc5KqiMYG3BytgN0j2otJBLZARZZSXeSPAVe6yeJgoJls3Mjs0Co2iBCR9GOm
	oxlp4/lX0BM7GyBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF8551322C;
	Mon, 31 Jul 2023 15:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GALlLY7Xx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 21/24] ASoC: dmaengine: Use sockptr_t for process callback,
 too
Date: Mon, 31 Jul 2023 17:47:15 +0200
Message-Id: <20230731154718.31048-22-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HDL6ROMOZ262EYY5BABFFJSNT3WVAOOH
X-Message-ID-Hash: HDL6ROMOZ262EYY5BABFFJSNT3WVAOOH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDL6ROMOZ262EYY5BABFFJSNT3WVAOOH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Along with the conversion to PCM copy ops, use the sockptr_t for the
pointer to be passed to the dmaengine process callback, too.  It
avoids the direct reference of sockptr.kernel field, and it can
potentially help for the drivers to access memory properly (although
both atmel and stm drivers don't use the given buffer address at
all for now).

Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/dmaengine_pcm.h         | 2 +-
 sound/soc/atmel/mchp-pdmc.c           | 2 +-
 sound/soc/soc-generic-dmaengine-pcm.c | 4 ++--
 sound/soc/stm/stm32_sai_sub.c         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index 2df54cf02cb3..86af624f3aea 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -142,7 +142,7 @@ struct snd_dmaengine_pcm_config {
 			struct snd_pcm_substream *substream);
 	int (*process)(struct snd_pcm_substream *substream,
 		       int channel, unsigned long hwoff,
-		       void *buf, unsigned long bytes);
+		       sockptr_t buf, unsigned long bytes);
 	dma_filter_fn compat_filter_fn;
 	struct device *dma_dev;
 	const char *chan_names[SNDRV_PCM_STREAM_LAST + 1];
diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 1a069f4cdcda..0e12be712996 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -954,7 +954,7 @@ static int mchp_pdmc_dt_init(struct mchp_pdmc *dd)
 /* used to clean the channel index found on RHR's MSB */
 static int mchp_pdmc_process(struct snd_pcm_substream *substream,
 			     int channel, unsigned long hwoff,
-			     void *buf, unsigned long bytes)
+			     sockptr_t buf, unsigned long bytes)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	u8 *dma_ptr = runtime->dma_area + hwoff +
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 25b8de7e9bb2..a68029d16ccd 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -296,7 +296,7 @@ static int dmaengine_copy(struct snd_soc_component *component,
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
 	int (*process)(struct snd_pcm_substream *substream,
 		       int channel, unsigned long hwoff,
-		       void *buf, unsigned long bytes) = pcm->config->process;
+		       sockptr_t buf, unsigned long bytes) = pcm->config->process;
 	bool is_playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	void *dma_ptr = runtime->dma_area + hwoff +
 			channel * (runtime->dma_bytes / runtime->channels);
@@ -306,7 +306,7 @@ static int dmaengine_copy(struct snd_soc_component *component,
 			return -EFAULT;
 
 	if (process) {
-		int ret = process(substream, channel, hwoff, buf.kernel, bytes);
+		int ret = process(substream, channel, hwoff, buf, bytes);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 271ec5b3378d..a61cca86ee31 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1233,7 +1233,7 @@ static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops = {
 
 static int stm32_sai_pcm_process_spdif(struct snd_pcm_substream *substream,
 				       int channel, unsigned long hwoff,
-				       void *buf, unsigned long bytes)
+				       sockptr_t buf, unsigned long bytes)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-- 
2.35.3

