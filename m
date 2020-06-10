Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AC21F5222
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 12:19:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F17F1950;
	Wed, 10 Jun 2020 12:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F17F1950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591784370;
	bh=12qfjoSLFIyodLbVMzzulIGmWcFqLWhcPR3Up65ETus=;
	h=From:To:Subject:Date:In-Reply-To:References:In-Reply-To:
	 References:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=OElodmhAR8fv93HWBzKwKss/9ap83lPJVkE/kA0dswj/ANgIfKSkUi89ukaUDXDjO
	 wfN4Jd/a/Ra00+F3lmj7lB77OEQv9KQySWoma9ovM2d4P+9oKVMRfp0jnTwCjoGq3U
	 OhTWfksVqT9kNL63Nr2+JgynSuA1pfPh9oCy6BIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0754F802A7;
	Wed, 10 Jun 2020 12:16:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEC39F80252; Wed, 10 Jun 2020 12:16:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5367F800E0
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 12:16:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5367F800E0
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 91C491A0447;
 Wed, 10 Jun 2020 12:16:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AE2F31A046E;
 Wed, 10 Jun 2020 12:16:38 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 4C632402F3;
 Wed, 10 Jun 2020 18:16:32 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lars@metafoo.de, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v2 2/3] ASoC: dmaengine_pcm: export soc_component_to_pcm
Date: Wed, 10 Jun 2020 18:05:48 +0800
Message-Id: <429c6ae1f3c5b47eb893f475d531d71cdcfe34c0.1591783089.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1591783089.git.shengjiu.wang@nxp.com>
References: <cover.1591783089.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1591783089.git.shengjiu.wang@nxp.com>
References: <cover.1591783089.git.shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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

In DPCM case, Front-End needs to get the dma chan which has
been requested by Back-End and reuse it.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 include/sound/dmaengine_pcm.h         | 11 +++++++++++
 sound/soc/soc-generic-dmaengine-pcm.c | 12 ------------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index b65220685920..8c5e38180fb0 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -161,4 +161,15 @@ int snd_dmaengine_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 
 #define SND_DMAENGINE_PCM_DRV_NAME "snd_dmaengine_pcm"
 
+struct dmaengine_pcm {
+	struct dma_chan *chan[SNDRV_PCM_STREAM_LAST + 1];
+	const struct snd_dmaengine_pcm_config *config;
+	struct snd_soc_component component;
+	unsigned int flags;
+};
+
+static inline struct dmaengine_pcm *soc_component_to_pcm(struct snd_soc_component *p)
+{
+	return container_of(p, struct dmaengine_pcm, component);
+}
 #endif
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index f728309a0833..80a4e71f2d95 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -21,18 +21,6 @@
  */
 #define SND_DMAENGINE_PCM_FLAG_NO_RESIDUE BIT(31)
 
-struct dmaengine_pcm {
-	struct dma_chan *chan[SNDRV_PCM_STREAM_LAST + 1];
-	const struct snd_dmaengine_pcm_config *config;
-	struct snd_soc_component component;
-	unsigned int flags;
-};
-
-static struct dmaengine_pcm *soc_component_to_pcm(struct snd_soc_component *p)
-{
-	return container_of(p, struct dmaengine_pcm, component);
-}
-
 static struct device *dmaengine_dma_dev(struct dmaengine_pcm *pcm,
 	struct snd_pcm_substream *substream)
 {
-- 
2.21.0

