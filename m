Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9426722B8
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:13:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F82B79D5;
	Wed, 18 Jan 2023 17:12:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F82B79D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674058425;
	bh=8cChsv74pYJOfcjtONuonGjh4UJndDRCDERVcmwltLQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=igUrmsiFQUYQDnbW4G519L8DEPfBcQ2y7P+7rn6NIrYgCa5rSRUMEZDejCRCBIBf3
	 NQwHGD3YDBy5C9+camn9ZJWWtot5xMaC5/HtD9bEQnYVfxAB5vcjkOC9pkb82nxd54
	 SI9FH02G67gvQsPigmtL3lXpw4RkjbG9TYOInWCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A92ACF80482;
	Wed, 18 Jan 2023 17:12:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F573F80482; Wed, 18 Jan 2023 17:12:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9EEEF8024D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 17:12:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9EEEF8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VJ5KtuAX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8EEE0B81D8E;
 Wed, 18 Jan 2023 16:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702BBC433D2;
 Wed, 18 Jan 2023 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674058365;
 bh=8cChsv74pYJOfcjtONuonGjh4UJndDRCDERVcmwltLQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VJ5KtuAXOH316tSrgSNn6b8gq5MCYj0z0J+xThfFP72otWnHh0r1VmuOApvAXoCUr
 PG1a0KG4zAl6fL6MXUTy9rJseNw+H6F24mjOf9BaROeVSCRIZ0u7Ds8RkPN+vDTUyT
 hLVgDtHV91FGhg9LcpprKNIVDAAc9tvrak0cCtVY3GzdP7ED1RbEVREzIG1s/bmEuk
 GBzzeR2QxsxddC9iLeSD9YIEN7/n+rWo0nbCj+GKMVN/Ccky+Pq/cUI2MqlT+XKJW+
 NNlyht4DtVDNa4UD2mRlpj1l4kgAkfxnITqqTkV5U7LV7J7NoruaTnsgWGm4iKhO3Z
 T/9cwCxSiavPQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/5] ASoC: remove
 snd_dmaengine_pcm_config->compat_request_channel
Date: Wed, 18 Jan 2023 17:10:49 +0100
Message-Id: <20230118161110.521504-5-arnd@kernel.org>
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

The last reference to this struct member is gone, so the caller
can be removed as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/sound/dmaengine_pcm.h         | 13 ++-----------
 sound/soc/soc-generic-dmaengine-pcm.c |  3 ---
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index a497d1f81cab..9965d59ff8f0 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -93,8 +93,8 @@ int snd_dmaengine_pcm_refine_runtime_hwparams(
 	struct dma_chan *chan);
 
 /*
- * Try to request the DMA channel using compat_request_channel or
- * compat_filter_fn if it couldn't be requested through devicetree.
+ * Try to request the DMA channel using compat_filter_fn if it
+ * couldn't be requested through devicetree.
  */
 #define SND_DMAENGINE_PCM_FLAG_COMPAT BIT(0)
 /*
@@ -112,8 +112,6 @@ int snd_dmaengine_pcm_refine_runtime_hwparams(
  * struct snd_dmaengine_pcm_config - Configuration data for dmaengine based PCM
  * @prepare_slave_config: Callback used to fill in the DMA slave_config for a
  *   PCM substream. Will be called from the PCM drivers hwparams callback.
- * @compat_request_channel: Callback to request a DMA channel for platforms
- *   which do not use devicetree.
  * @process: Callback used to apply processing on samples transferred from/to
  *   user space.
  * @compat_filter_fn: Will be used as the filter function when requesting a
@@ -126,18 +124,11 @@ int snd_dmaengine_pcm_refine_runtime_hwparams(
  * @pcm_hardware: snd_pcm_hardware struct to be used for the PCM.
  * @prealloc_buffer_size: Size of the preallocated audio buffer.
  *
- * Note: If both compat_request_channel and compat_filter_fn are set
- * compat_request_channel will be used to request the channel and
- * compat_filter_fn will be ignored. Otherwise the channel will be requested
- * using dma_request_channel with compat_filter_fn as the filter function.
  */
 struct snd_dmaengine_pcm_config {
 	int (*prepare_slave_config)(struct snd_pcm_substream *substream,
 			struct snd_pcm_hw_params *params,
 			struct dma_slave_config *slave_config);
-	struct dma_chan *(*compat_request_channel)(
-			struct snd_soc_pcm_runtime *rtd,
-			struct snd_pcm_substream *substream);
 	int (*process)(struct snd_pcm_substream *substream,
 		       int channel, unsigned long hwoff,
 		       void *buf, unsigned long bytes);
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 3b99f619e37e..a3d92eb645f2 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -190,9 +190,6 @@ static struct dma_chan *dmaengine_pcm_compat_request_channel(
 	if ((pcm->flags & SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX) && pcm->chan[0])
 		return pcm->chan[0];
 
-	if (pcm->config->compat_request_channel)
-		return pcm->config->compat_request_channel(rtd, substream);
-
 	return snd_dmaengine_pcm_request_channel(pcm->config->compat_filter_fn,
 						 dma_data->filter_data);
 }
-- 
2.39.0

