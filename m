Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF3ACFAE3
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:05:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA22E165D;
	Tue,  8 Oct 2019 15:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA22E165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570539932;
	bh=x7gT9ivEKLXzkdzrku448rp0TZ7z3r8E9g6wqm1n9LY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mbXTWa1We2Xmg3B4iJEMiIlUmDap8SDyuwhsd5lSldNu1w1jwpBe/YpKVUa+qvWkO
	 q9xyZpTkWUNLVEeLnumkSPVB64EeHOfFR70J9u+WQt+/sHSYKcRmXqvF6jfnqZobj0
	 FvSwwqWIDniOibg4OWPrA9W+WvUrK5OwMj9TTYkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56FFFF80769;
	Tue,  8 Oct 2019 14:54:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0615F806FA; Tue,  8 Oct 2019 14:53:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A3AEF80135
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A3AEF80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jDkfnvyL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=5cjxPNSxnRQv9dLyP982ZfFO50IFMkpt1P/wlhG9nxc=; b=jDkfnvyL9juH
 +gC8clYlg9mZpU98JiQ/Jdziq8jRYOsrqtyukE/5Ia28p6swxBGR/zvRrdF6KWM0n58ayvcOTFjOq
 mrfkDwB0WWLGejOMyutFuu3+1m3QWXbxwCxiEIqE19OOA9PdgzaDAWkQm+VnhPtFaEDBvOlUM4g4a
 Y0bpg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozY-0008NE-Nf; Tue, 08 Oct 2019 12:53:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 29F642740D4B; Tue,  8 Oct 2019 13:53:28 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o8yz90e9.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125328.29F642740D4B@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:28 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: pxa: remove snd_pcm_ops" to the asoc
	tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: pxa: remove snd_pcm_ops

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From f8772e17def20470f94bd1d6e1cf24badb2611de Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:33:50 +0900
Subject: [PATCH] ASoC: pxa: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87o8yz90e9.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/pxa2xx-lib.h  | 26 +++++++++++-
 sound/arm/pxa2xx-pcm-lib.c  | 80 +++++++++++++++++++++++++++++++------
 sound/soc/pxa/pxa-ssp.c     | 14 +++++--
 sound/soc/pxa/pxa2xx-ac97.c | 14 +++++--
 sound/soc/pxa/pxa2xx-i2s.c  | 14 +++++--
 sound/soc/pxa/pxa2xx-pcm.c  | 14 +++++--
 6 files changed, 135 insertions(+), 27 deletions(-)

diff --git a/include/sound/pxa2xx-lib.h b/include/sound/pxa2xx-lib.h
index 6758fc12fa84..0feaf16e6ac0 100644
--- a/include/sound/pxa2xx-lib.h
+++ b/include/sound/pxa2xx-lib.h
@@ -10,6 +10,7 @@ struct snd_pcm_substream;
 struct snd_pcm_hw_params;
 struct snd_soc_pcm_runtime;
 struct snd_pcm;
+struct snd_soc_component;
 
 extern int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params);
@@ -23,8 +24,29 @@ extern int pxa2xx_pcm_mmap(struct snd_pcm_substream *substream,
 	struct vm_area_struct *vma);
 extern int pxa2xx_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream);
 extern void pxa2xx_pcm_free_dma_buffers(struct snd_pcm *pcm);
-extern int pxa2xx_soc_pcm_new(struct snd_soc_pcm_runtime *rtd);
-extern const struct snd_pcm_ops pxa2xx_pcm_ops;
+extern void pxa2xx_soc_pcm_free(struct snd_soc_component *component,
+				struct snd_pcm *pcm);
+extern int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
+			      struct snd_soc_pcm_runtime *rtd);
+extern int pxa2xx_soc_pcm_open(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream);
+extern int pxa2xx_soc_pcm_close(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream);
+extern int pxa2xx_soc_pcm_hw_params(struct snd_soc_component *component,
+				    struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params);
+extern int pxa2xx_soc_pcm_hw_free(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream);
+extern int pxa2xx_soc_pcm_prepare(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream);
+extern int pxa2xx_soc_pcm_trigger(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream, int cmd);
+extern snd_pcm_uframes_t
+pxa2xx_soc_pcm_pointer(struct snd_soc_component *component,
+		       struct snd_pcm_substream *substream);
+extern int pxa2xx_soc_pcm_mmap(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream,
+			       struct vm_area_struct *vma);
 
 /* AC97 */
 
diff --git a/sound/arm/pxa2xx-pcm-lib.c b/sound/arm/pxa2xx-pcm-lib.c
index 54500bd098f9..a86c95d89824 100644
--- a/sound/arm/pxa2xx-pcm-lib.c
+++ b/sound/arm/pxa2xx-pcm-lib.c
@@ -175,7 +175,15 @@ void pxa2xx_pcm_free_dma_buffers(struct snd_pcm *pcm)
 }
 EXPORT_SYMBOL(pxa2xx_pcm_free_dma_buffers);
 
-int pxa2xx_soc_pcm_new(struct snd_soc_pcm_runtime *rtd)
+void pxa2xx_soc_pcm_free(struct snd_soc_component *component,
+			 struct snd_pcm *pcm)
+{
+	pxa2xx_pcm_free_dma_buffers(pcm);
+}
+EXPORT_SYMBOL(pxa2xx_soc_pcm_free);
+
+int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
+		       struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm *pcm = rtd->pcm;
@@ -203,18 +211,64 @@ int pxa2xx_soc_pcm_new(struct snd_soc_pcm_runtime *rtd)
 }
 EXPORT_SYMBOL(pxa2xx_soc_pcm_new);
 
-const struct snd_pcm_ops pxa2xx_pcm_ops = {
-	.open		= pxa2xx_pcm_open,
-	.close		= pxa2xx_pcm_close,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= pxa2xx_pcm_hw_params,
-	.hw_free	= pxa2xx_pcm_hw_free,
-	.prepare	= pxa2xx_pcm_prepare,
-	.trigger	= pxa2xx_pcm_trigger,
-	.pointer	= pxa2xx_pcm_pointer,
-	.mmap		= pxa2xx_pcm_mmap,
-};
-EXPORT_SYMBOL(pxa2xx_pcm_ops);
+int pxa2xx_soc_pcm_open(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
+{
+	return pxa2xx_pcm_open(substream);
+}
+EXPORT_SYMBOL(pxa2xx_soc_pcm_open);
+
+int pxa2xx_soc_pcm_close(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream)
+{
+	return pxa2xx_pcm_close(substream);
+}
+EXPORT_SYMBOL(pxa2xx_soc_pcm_close);
+
+int pxa2xx_soc_pcm_hw_params(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params)
+{
+	return pxa2xx_pcm_hw_params(substream, params);
+}
+EXPORT_SYMBOL(pxa2xx_soc_pcm_hw_params);
+
+int pxa2xx_soc_pcm_hw_free(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
+{
+	return pxa2xx_pcm_hw_free(substream);
+}
+EXPORT_SYMBOL(pxa2xx_soc_pcm_hw_free);
+
+int pxa2xx_soc_pcm_prepare(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
+{
+	return pxa2xx_pcm_prepare(substream);
+}
+EXPORT_SYMBOL(pxa2xx_soc_pcm_prepare);
+
+int pxa2xx_soc_pcm_trigger(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream, int cmd)
+{
+	return pxa2xx_pcm_trigger(substream, cmd);
+}
+EXPORT_SYMBOL(pxa2xx_soc_pcm_trigger);
+
+snd_pcm_uframes_t
+pxa2xx_soc_pcm_pointer(struct snd_soc_component *component,
+		       struct snd_pcm_substream *substream)
+{
+	return pxa2xx_pcm_pointer(substream);
+}
+EXPORT_SYMBOL(pxa2xx_soc_pcm_pointer);
+
+int pxa2xx_soc_pcm_mmap(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream,
+			struct vm_area_struct *vma)
+{
+	return pxa2xx_pcm_mmap(substream, vma);
+}
+EXPORT_SYMBOL(pxa2xx_soc_pcm_mmap);
 
 MODULE_AUTHOR("Nicolas Pitre");
 MODULE_DESCRIPTION("Intel PXA2xx sound library");
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 5fdd1a24c232..49cb3ba1519f 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -869,9 +869,17 @@ static struct snd_soc_dai_driver pxa_ssp_dai = {
 
 static const struct snd_soc_component_driver pxa_ssp_component = {
 	.name		= "pxa-ssp",
-	.ops		= &pxa2xx_pcm_ops,
-	.pcm_new	= pxa2xx_soc_pcm_new,
-	.pcm_free	= pxa2xx_pcm_free_dma_buffers,
+	.pcm_construct	= pxa2xx_soc_pcm_new,
+	.pcm_destruct	= pxa2xx_soc_pcm_free,
+	.open		= pxa2xx_soc_pcm_open,
+	.close		= pxa2xx_soc_pcm_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= pxa2xx_soc_pcm_hw_params,
+	.hw_free	= pxa2xx_soc_pcm_hw_free,
+	.prepare	= pxa2xx_soc_pcm_prepare,
+	.trigger	= pxa2xx_soc_pcm_trigger,
+	.pointer	= pxa2xx_soc_pcm_pointer,
+	.mmap		= pxa2xx_soc_pcm_mmap,
 };
 
 #ifdef CONFIG_OF
diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index bf28187315db..31e81a6f616f 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -204,9 +204,17 @@ static struct snd_soc_dai_driver pxa_ac97_dai_driver[] = {
 
 static const struct snd_soc_component_driver pxa_ac97_component = {
 	.name		= "pxa-ac97",
-	.ops		= &pxa2xx_pcm_ops,
-	.pcm_new	= pxa2xx_soc_pcm_new,
-	.pcm_free	= pxa2xx_pcm_free_dma_buffers,
+	.pcm_construct	= pxa2xx_soc_pcm_new,
+	.pcm_destruct	= pxa2xx_soc_pcm_free,
+	.open		= pxa2xx_soc_pcm_open,
+	.close		= pxa2xx_soc_pcm_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= pxa2xx_soc_pcm_hw_params,
+	.hw_free	= pxa2xx_soc_pcm_hw_free,
+	.prepare	= pxa2xx_soc_pcm_prepare,
+	.trigger	= pxa2xx_soc_pcm_trigger,
+	.pointer	= pxa2xx_soc_pcm_pointer,
+	.mmap		= pxa2xx_soc_pcm_mmap,
 };
 
 #ifdef CONFIG_OF
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index 9f7fb7335ac0..e77d707efde7 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -360,9 +360,17 @@ static struct snd_soc_dai_driver pxa_i2s_dai = {
 
 static const struct snd_soc_component_driver pxa_i2s_component = {
 	.name		= "pxa-i2s",
-	.ops		= &pxa2xx_pcm_ops,
-	.pcm_new	= pxa2xx_soc_pcm_new,
-	.pcm_free	= pxa2xx_pcm_free_dma_buffers,
+	.pcm_construct	= pxa2xx_soc_pcm_new,
+	.pcm_destruct	= pxa2xx_soc_pcm_free,
+	.open		= pxa2xx_soc_pcm_open,
+	.close		= pxa2xx_soc_pcm_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= pxa2xx_soc_pcm_hw_params,
+	.hw_free	= pxa2xx_soc_pcm_hw_free,
+	.prepare	= pxa2xx_soc_pcm_prepare,
+	.trigger	= pxa2xx_soc_pcm_trigger,
+	.pointer	= pxa2xx_soc_pcm_pointer,
+	.mmap		= pxa2xx_soc_pcm_mmap,
 };
 
 static int pxa2xx_i2s_drv_probe(struct platform_device *pdev)
diff --git a/sound/soc/pxa/pxa2xx-pcm.c b/sound/soc/pxa/pxa2xx-pcm.c
index 74b56fa0870f..07b3455a6f23 100644
--- a/sound/soc/pxa/pxa2xx-pcm.c
+++ b/sound/soc/pxa/pxa2xx-pcm.c
@@ -18,9 +18,17 @@
 #include <sound/dmaengine_pcm.h>
 
 static const struct snd_soc_component_driver pxa2xx_soc_platform = {
-	.ops		= &pxa2xx_pcm_ops,
-	.pcm_new	= pxa2xx_soc_pcm_new,
-	.pcm_free	= pxa2xx_pcm_free_dma_buffers,
+	.pcm_construct	= pxa2xx_soc_pcm_new,
+	.pcm_destruct	= pxa2xx_soc_pcm_free,
+	.open		= pxa2xx_soc_pcm_open,
+	.close		= pxa2xx_soc_pcm_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= pxa2xx_soc_pcm_hw_params,
+	.hw_free	= pxa2xx_soc_pcm_hw_free,
+	.prepare	= pxa2xx_soc_pcm_prepare,
+	.trigger	= pxa2xx_soc_pcm_trigger,
+	.pointer	= pxa2xx_soc_pcm_pointer,
+	.mmap		= pxa2xx_soc_pcm_mmap,
 };
 
 static int pxa2xx_soc_platform_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
