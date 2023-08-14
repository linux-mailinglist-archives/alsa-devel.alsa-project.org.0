Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 398F777B82D
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 14:04:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 863CDEB4;
	Mon, 14 Aug 2023 14:03:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 863CDEB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692014688;
	bh=QrIbT7Rvgg/9V/tCoBYfGp4RznHN325hpqzqTCdxAUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iaSC/TQwIQf4NC7fNiSI2G6A+V1CBepBCidBqkiysvGB1KO1fEDZJWpGb8qsOvzqb
	 ADKSiE2Rp4D960TjSPaVMB220yC/qPvniExhxW7AfvZG1PQbE+wMfdHUb4znU3o3kY
	 EIs6ocaHd5fD5jSX4zCYXOXKJ0rTFWTWnbxrmUzw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90F84F80695; Mon, 14 Aug 2023 13:57:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B312AF80553;
	Mon, 14 Aug 2023 13:57:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EA98F80254; Mon, 14 Aug 2023 13:56:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B00EF80568
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 13:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B00EF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=f4jVwNPq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TYKQwET7
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 16CF521992;
	Mon, 14 Aug 2023 11:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692014156;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n808a4+xHQ7QkYnImdaOPO/XS9ZeoOuNos6MXCLoDQg=;
	b=f4jVwNPqaSekTafzEYgKqT65O+6RetjgJUK/t8pTxehTDjvAouzBbiJcJjqEcoED79mdMA
	oPPqjmJuZYuvz09pH2JVIII5OyA2nDVAInDLMqj6FMD3+ncErg3MaNog3mNmQUN25ImbXB
	eCmbUlx6HL1rEe7CyK2xfYtuPXvD6jA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692014156;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n808a4+xHQ7QkYnImdaOPO/XS9ZeoOuNos6MXCLoDQg=;
	b=TYKQwET7QkFMKpdj3Q/o4fIEg9X3IfQ0X/VNEY/WWBVS1u1t4ymCNdD83xPQqYdgLerIrj
	iJaYIGpiJDfvHGAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D2EDC138EE;
	Mon, 14 Aug 2023 11:55:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cJaeMksW2mRnMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 11:55:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 22/25] ASoC: dmaengine: Use iov_iter for process callback, too
Date: Mon, 14 Aug 2023 13:55:20 +0200
Message-Id: <20230814115523.15279-23-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814115523.15279-1-tiwai@suse.de>
References: <20230814115523.15279-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AGC3OPXRQ5VG7HQFCRKKJTJ7VZ5ZGQD7
X-Message-ID-Hash: AGC3OPXRQ5VG7HQFCRKKJTJ7VZ5ZGQD7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGC3OPXRQ5VG7HQFCRKKJTJ7VZ5ZGQD7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Along with the conversion to PCM copy ops, use the iov_iter for the
pointer to be passed to the dmaengine process callback, too.  It
avoids the direct reference of iter_iov_addr(), and it can potentially
help for the drivers to access memory properly (although both atmel
and stm drivers don't use the given buffer address at all for now).

Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/dmaengine_pcm.h         | 2 +-
 sound/soc/atmel/mchp-pdmc.c           | 2 +-
 sound/soc/soc-generic-dmaengine-pcm.c | 5 ++---
 sound/soc/stm/stm32_sai_sub.c         | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index 2df54cf02cb3..c9a8bce9a785 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -142,7 +142,7 @@ struct snd_dmaengine_pcm_config {
 			struct snd_pcm_substream *substream);
 	int (*process)(struct snd_pcm_substream *substream,
 		       int channel, unsigned long hwoff,
-		       void *buf, unsigned long bytes);
+		       struct iov_iter *buf, unsigned long bytes);
 	dma_filter_fn compat_filter_fn;
 	struct device *dma_dev;
 	const char *chan_names[SNDRV_PCM_STREAM_LAST + 1];
diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index c79c73e6791e..b3afcf25b4a9 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -962,7 +962,7 @@ static int mchp_pdmc_dt_init(struct mchp_pdmc *dd)
 /* used to clean the channel index found on RHR's MSB */
 static int mchp_pdmc_process(struct snd_pcm_substream *substream,
 			     int channel, unsigned long hwoff,
-			     void *buf, unsigned long bytes)
+			     struct iov_iter *buf, unsigned long bytes)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	u8 *dma_ptr = runtime->dma_area + hwoff +
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 1a4f000fddb9..6dee033ab9b9 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -296,18 +296,17 @@ static int dmaengine_copy(struct snd_soc_component *component,
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
 	int (*process)(struct snd_pcm_substream *substream,
 		       int channel, unsigned long hwoff,
-		       void *buf, unsigned long bytes) = pcm->config->process;
+		       struct iov_iter *buf, unsigned long bytes) = pcm->config->process;
 	bool is_playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	void *dma_ptr = runtime->dma_area + hwoff +
 			channel * (runtime->dma_bytes / runtime->channels);
-	void *ptr = (void __force *)iter_iov_addr(buf);
 
 	if (is_playback)
 		if (!copy_from_iter(dma_ptr, bytes, buf))
 			return -EFAULT;
 
 	if (process) {
-		int ret = process(substream, channel, hwoff, ptr, bytes);
+		int ret = process(substream, channel, hwoff, buf, bytes);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 271ec5b3378d..39f9b4654fa2 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1233,7 +1233,7 @@ static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops = {
 
 static int stm32_sai_pcm_process_spdif(struct snd_pcm_substream *substream,
 				       int channel, unsigned long hwoff,
-				       void *buf, unsigned long bytes)
+				       struct iov_iter *buf, unsigned long bytes)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-- 
2.35.3

