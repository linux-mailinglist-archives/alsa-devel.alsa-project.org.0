Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E79C7AB5AD
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 18:16:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 681D8206;
	Fri, 22 Sep 2023 18:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 681D8206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695399413;
	bh=B1sH7+3vRYFzRVaMdsVmbEfQcWNWgaY6px0R4gSYS6Q=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qhjqTHpAUQFJiBJHKFFydBlyeR+z0yqTaGcgPXz8RKWURynmoBtDjLnacZo6vlRBQ
	 Wk5MUk+BPVXVcl6vPfM2AWr5VHgiO9AITByGwQPJyrROJZAJkYSyB+4CAmwi4EWNsq
	 xQmc9yTE2FZ76jYuCA5G1v6+shCVr26wn6HOtzBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0553F80494; Fri, 22 Sep 2023 18:16:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 922A4F80124;
	Fri, 22 Sep 2023 18:16:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25813F80125; Fri, 22 Sep 2023 18:15:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F315F80005
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 18:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F315F80005
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nNugMsjk
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38C2440006;
	Fri, 22 Sep 2023 16:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695399351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GCLnsJGsiyoluV0LAjwd+krd3tUOX8QFfVoMfa2/x2E=;
	b=nNugMsjkisAEpoGJ1vCq7u95JGywuac3AVRG5NOLykEuGwB+jcI4wl/uRBERONxM1GNZG3
	N5kJtUTYztmoL7p+HYRUP2NDNFygReLyucbKtvrcWkdt+5TCAxBx76NvFARlyNVCV19vV1
	wxFemZeMlX191fzco3/NVW37d8v49W3Lr5EsrNYNPb1RmIzUxgYfIuQ0QvZN/lqp4T9YNa
	QVr5q6uabkh0zVnC4X6Q+15gx/GX+XS1kMZ801au15NeN3o9j5lfTdjzHKq0bSAESZ418M
	/d48JP1Q49wV3rJjX+EqebmUSiyx+cSqJXlLAPKRvdBAjslgYUUFoaRDvZ7uqg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] ASoC: soc-generic-dmaengine-pcm: Fix function name in comment
Date: Fri, 22 Sep 2023 18:15:47 +0200
Message-Id: <20230922161547.594484-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: BOS7RT2Y6HTXGBIIUHKCU7ARWVF6IVLZ
X-Message-ID-Hash: BOS7RT2Y6HTXGBIIUHKCU7ARWVF6IVLZ
X-MailFrom: miquel.raynal@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOS7RT2Y6HTXGBIIUHKCU7ARWVF6IVLZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

While browsing/grepping in the sound core, I found that
snd_dmaengine_set_config_from_dai_data() did not exist, in favor of
snd_dmaengine_pcm_set_config_from_dai_data(). Fix the typo.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index d0653d775c87..cad222eb9a29 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -44,8 +44,8 @@ static struct device *dmaengine_dma_dev(struct dmaengine_pcm *pcm,
  * platforms which make use of the snd_dmaengine_dai_dma_data struct for their
  * DAI DMA data. Internally the function will first call
  * snd_hwparams_to_dma_slave_config to fill in the slave config based on the
- * hw_params, followed by snd_dmaengine_set_config_from_dai_data to fill in the
- * remaining fields based on the DAI DMA data.
+ * hw_params, followed by snd_dmaengine_pcm_set_config_from_dai_data to fill in
+ * the remaining fields based on the DAI DMA data.
  */
 int snd_dmaengine_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params, struct dma_slave_config *slave_config)
-- 
2.34.1

