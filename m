Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC36B6722B1
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:12:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5676D79B4;
	Wed, 18 Jan 2023 17:12:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5676D79B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674058374;
	bh=hfA2eXgm6COXrjgq0eXTI7FELNoNzfagIjCDGXpAipY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HwejjPItKb6haPfEp4a7V+Mg6HuVtcC1PWxzhQ/DTnqONemyeSnU5H/Z9/BNVHqkm
	 jlP7G+YALHZuozfBcuzKKeb1bsk8QMZ+8Sl0iLTmC7cll7bB6Swa+yEw27Uu914laQ
	 W7l3xvvo7YE2Aak1ONlb52YBj6HF+aZuf01JMsS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2934FF8024C;
	Wed, 18 Jan 2023 17:11:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFD4DF8024C; Wed, 18 Jan 2023 17:11:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E22C5F8024C
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 17:11:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E22C5F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ivc0Sazk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 35B57B81D7D;
 Wed, 18 Jan 2023 16:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180ECC433D2;
 Wed, 18 Jan 2023 16:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674058309;
 bh=hfA2eXgm6COXrjgq0eXTI7FELNoNzfagIjCDGXpAipY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ivc0SazkaMpDaLRHVArm23f6+rwNgRkiIfG9MwhAW7qvfmEaAYeDraa6/XCaDxrJ1
 s42Fqalv3DxyTCHjVmgR8W32HF/qP6/Dx61YFXpEaOP8tn2Gr1Fh7eHREZwxxm7K54
 fZy5Z9xLEZA+VzFAFTeaIIvCY0qkmPpqf6N0sNFbxZhX6PWWIg3LNKLNnP1nLvsw+N
 Zd76G5DoooNgMXU4IQNxTLAIUJwHq/J4RYM3kl2VbBPz7kM5ZNGjaeLYwubohztVLT
 sjXcrSSe5mXmWxmBmUeeg9JSPgB99Eonvxw15xGm4MVLv9Lpi5P+Fa6h+OZ0JZQ6ac
 d0Gdcn5OqDrYw==
From: Arnd Bergmann <arnd@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/5] ASoC: pxa: remove snd_dmaengine_pcm_open_request_chan()
Date: Wed, 18 Jan 2023 17:10:46 +0100
Message-Id: <20230118161110.521504-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118161110.521504-1-arnd@kernel.org>
References: <20230118161110.521504-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Andreas Pape <apape@de.adit-jv.com>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

The last caller was removed, so there is no longer a need for
this function.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/sound/dmaengine_pcm.h |  2 --
 sound/core/pcm_dmaengine.c    | 21 ---------------------
 2 files changed, 23 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index 2df54cf02cb3..a497d1f81cab 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -37,8 +37,6 @@ int snd_dmaengine_pcm_open(struct snd_pcm_substream *substream,
 	struct dma_chan *chan);
 int snd_dmaengine_pcm_close(struct snd_pcm_substream *substream);
 
-int snd_dmaengine_pcm_open_request_chan(struct snd_pcm_substream *substream,
-	dma_filter_fn filter_fn, void *filter_data);
 int snd_dmaengine_pcm_close_release_chan(struct snd_pcm_substream *substream);
 
 struct dma_chan *snd_dmaengine_pcm_request_channel(dma_filter_fn filter_fn,
diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 494ec0c207fa..9f4120f020d8 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -328,27 +328,6 @@ int snd_dmaengine_pcm_open(struct snd_pcm_substream *substream,
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_open);
 
-/**
- * snd_dmaengine_pcm_open_request_chan - Open a dmaengine based PCM substream and request channel
- * @substream: PCM substream
- * @filter_fn: Filter function used to request the DMA channel
- * @filter_data: Data passed to the DMA filter function
- *
- * This function will request a DMA channel using the passed filter function and
- * data. The function should usually be called from the pcm open callback. Note
- * that this function will use private_data field of the substream's runtime. So
- * it is not available to your pcm driver implementation.
- *
- * Return: 0 on success, a negative error code otherwise
- */
-int snd_dmaengine_pcm_open_request_chan(struct snd_pcm_substream *substream,
-	dma_filter_fn filter_fn, void *filter_data)
-{
-	return snd_dmaengine_pcm_open(substream,
-		    snd_dmaengine_pcm_request_channel(filter_fn, filter_data));
-}
-EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_open_request_chan);
-
 /**
  * snd_dmaengine_pcm_close - Close a dmaengine based PCM substream
  * @substream: PCM substream
-- 
2.39.0

