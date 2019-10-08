Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B8CFAE1
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:04:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60FF61686;
	Tue,  8 Oct 2019 15:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60FF61686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570539896;
	bh=LdaG8VZbzdKXd0Ode+HtRloqPENFISG8J1H7Pgp0qiU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Tjkg8HmYz4OYr0zZv0VzRkP6mdUM1Xf1tSgDy728EdrIqnlb7B8U+IsOvLeZ7IKW1
	 pv7TFHklm9Fc4ZDZwzUNpzE6L/EvUuPKqPChZkU10WCNj9Le8o3qPOVpHcRBqHgvSQ
	 hH7mPORkgx9VEvmYmYYiakvEsceOUxDJ9KFBxM7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B298EF8063E;
	Tue,  8 Oct 2019 14:54:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E64BCF806E9; Tue,  8 Oct 2019 14:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC837F805FF
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC837F805FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GIH9Y2Y3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=C+Qk/CFuJzUDtVjTz5g9HG1KoD3pOnH274iLnc6+uXk=; b=GIH9Y2Y3bAJq
 J+BWc/JSCyQfZxvJJ+NUH/asvGUuepiYhy/agr7ocBM6JigtqqRNWnzbadyKVwiHw6OyssgX78NAy
 g7MUAOje45kov3pdaEmrrl3v1xdILnYXjy8dkPczC02+q66E7WF+1HUocdFaG7ZWbLaIUH9nni13v
 OaJes=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozY-0008N4-Bo; Tue, 08 Oct 2019 12:53:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DAC9C2740D4A; Tue,  8 Oct 2019 13:53:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87muej90e4.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125327.DAC9C2740D4A@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:27 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: meson: remove snd_pcm_ops" to the asoc
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

   ASoC: meson: remove snd_pcm_ops

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

From bb4ba744b1701caf6148ff3b4e8656bf4f6b4758 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:33:55 +0900
Subject: [PATCH] ASoC: meson: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87muej90e4.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-fifo.c  | 56 ++++++++++++++++---------------------
 sound/soc/meson/axg-fifo.h  | 20 +++++++++++--
 sound/soc/meson/axg-frddr.c | 24 ++++++++++++++--
 sound/soc/meson/axg-toddr.c | 24 ++++++++++++++--
 4 files changed, 83 insertions(+), 41 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 5a3749938900..d6f3eefb8f09 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -70,7 +70,8 @@ static void __dma_enable(struct axg_fifo *fifo,  bool enable)
 			   enable ? CTRL0_DMA_EN : 0);
 }
 
-static int axg_fifo_pcm_trigger(struct snd_pcm_substream *ss, int cmd)
+int axg_fifo_pcm_trigger(struct snd_soc_component *component,
+			 struct snd_pcm_substream *ss, int cmd)
 {
 	struct axg_fifo *fifo = axg_fifo_data(ss);
 
@@ -91,8 +92,10 @@ static int axg_fifo_pcm_trigger(struct snd_pcm_substream *ss, int cmd)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(axg_fifo_pcm_trigger);
 
-static snd_pcm_uframes_t axg_fifo_pcm_pointer(struct snd_pcm_substream *ss)
+snd_pcm_uframes_t axg_fifo_pcm_pointer(struct snd_soc_component *component,
+				       struct snd_pcm_substream *ss)
 {
 	struct axg_fifo *fifo = axg_fifo_data(ss);
 	struct snd_pcm_runtime *runtime = ss->runtime;
@@ -102,9 +105,11 @@ static snd_pcm_uframes_t axg_fifo_pcm_pointer(struct snd_pcm_substream *ss)
 
 	return bytes_to_frames(runtime, addr - (unsigned int)runtime->dma_addr);
 }
+EXPORT_SYMBOL_GPL(axg_fifo_pcm_pointer);
 
-static int axg_fifo_pcm_hw_params(struct snd_pcm_substream *ss,
-				  struct snd_pcm_hw_params *params)
+int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
+			   struct snd_pcm_substream *ss,
+			   struct snd_pcm_hw_params *params)
 {
 	struct snd_pcm_runtime *runtime = ss->runtime;
 	struct axg_fifo *fifo = axg_fifo_data(ss);
@@ -132,15 +137,17 @@ static int axg_fifo_pcm_hw_params(struct snd_pcm_substream *ss,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(axg_fifo_pcm_hw_params);
 
-static int g12a_fifo_pcm_hw_params(struct snd_pcm_substream *ss,
-				   struct snd_pcm_hw_params *params)
+int g12a_fifo_pcm_hw_params(struct snd_soc_component *component,
+			    struct snd_pcm_substream *ss,
+			    struct snd_pcm_hw_params *params)
 {
 	struct axg_fifo *fifo = axg_fifo_data(ss);
 	struct snd_pcm_runtime *runtime = ss->runtime;
 	int ret;
 
-	ret = axg_fifo_pcm_hw_params(ss, params);
+	ret = axg_fifo_pcm_hw_params(component, ss, params);
 	if (ret)
 		return ret;
 
@@ -149,8 +156,10 @@ static int g12a_fifo_pcm_hw_params(struct snd_pcm_substream *ss,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(g12a_fifo_pcm_hw_params);
 
-static int axg_fifo_pcm_hw_free(struct snd_pcm_substream *ss)
+int axg_fifo_pcm_hw_free(struct snd_soc_component *component,
+			 struct snd_pcm_substream *ss)
 {
 	struct axg_fifo *fifo = axg_fifo_data(ss);
 
@@ -160,6 +169,7 @@ static int axg_fifo_pcm_hw_free(struct snd_pcm_substream *ss)
 
 	return snd_pcm_lib_free_pages(ss);
 }
+EXPORT_SYMBOL_GPL(axg_fifo_pcm_hw_free);
 
 static void axg_fifo_ack_irq(struct axg_fifo *fifo, u8 mask)
 {
@@ -194,7 +204,8 @@ static irqreturn_t axg_fifo_pcm_irq_block(int irq, void *dev_id)
 	return IRQ_RETVAL(status);
 }
 
-static int axg_fifo_pcm_open(struct snd_pcm_substream *ss)
+int axg_fifo_pcm_open(struct snd_soc_component *component,
+		      struct snd_pcm_substream *ss)
 {
 	struct axg_fifo *fifo = axg_fifo_data(ss);
 	struct device *dev = axg_fifo_dev(ss);
@@ -250,8 +261,10 @@ static int axg_fifo_pcm_open(struct snd_pcm_substream *ss)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(axg_fifo_pcm_open);
 
-static int axg_fifo_pcm_close(struct snd_pcm_substream *ss)
+int axg_fifo_pcm_close(struct snd_soc_component *component,
+		       struct snd_pcm_substream *ss)
 {
 	struct axg_fifo *fifo = axg_fifo_data(ss);
 	int ret;
@@ -267,28 +280,7 @@ static int axg_fifo_pcm_close(struct snd_pcm_substream *ss)
 
 	return ret;
 }
-
-const struct snd_pcm_ops axg_fifo_pcm_ops = {
-	.open =		axg_fifo_pcm_open,
-	.close =        axg_fifo_pcm_close,
-	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	axg_fifo_pcm_hw_params,
-	.hw_free =      axg_fifo_pcm_hw_free,
-	.pointer =	axg_fifo_pcm_pointer,
-	.trigger =	axg_fifo_pcm_trigger,
-};
-EXPORT_SYMBOL_GPL(axg_fifo_pcm_ops);
-
-const struct snd_pcm_ops g12a_fifo_pcm_ops = {
-	.open =		axg_fifo_pcm_open,
-	.close =        axg_fifo_pcm_close,
-	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	g12a_fifo_pcm_hw_params,
-	.hw_free =      axg_fifo_pcm_hw_free,
-	.pointer =	axg_fifo_pcm_pointer,
-	.trigger =	axg_fifo_pcm_trigger,
-};
-EXPORT_SYMBOL_GPL(g12a_fifo_pcm_ops);
+EXPORT_SYMBOL_GPL(axg_fifo_pcm_close);
 
 int axg_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd, unsigned int type)
 {
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index bb1e2ce50256..cf928d43b558 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -15,7 +15,7 @@ struct reset_control;
 struct snd_soc_component_driver;
 struct snd_soc_dai;
 struct snd_soc_dai_driver;
-struct snd_pcm_ops;
+
 struct snd_soc_pcm_runtime;
 
 #define AXG_FIFO_CH_MAX			128
@@ -75,8 +75,22 @@ struct axg_fifo_match_data {
 	struct snd_soc_dai_driver *dai_drv;
 };
 
-extern const struct snd_pcm_ops axg_fifo_pcm_ops;
-extern const struct snd_pcm_ops g12a_fifo_pcm_ops;
+int axg_fifo_pcm_open(struct snd_soc_component *component,
+		      struct snd_pcm_substream *ss);
+int axg_fifo_pcm_close(struct snd_soc_component *component,
+		       struct snd_pcm_substream *ss);
+int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
+			   struct snd_pcm_substream *ss,
+			   struct snd_pcm_hw_params *params);
+int g12a_fifo_pcm_hw_params(struct snd_soc_component *component,
+			    struct snd_pcm_substream *ss,
+			    struct snd_pcm_hw_params *params);
+int axg_fifo_pcm_hw_free(struct snd_soc_component *component,
+			 struct snd_pcm_substream *ss);
+snd_pcm_uframes_t axg_fifo_pcm_pointer(struct snd_soc_component *component,
+				       struct snd_pcm_substream *ss);
+int axg_fifo_pcm_trigger(struct snd_soc_component *component,
+			 struct snd_pcm_substream *ss, int cmd);
 
 int axg_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd, unsigned int type);
 int axg_fifo_probe(struct platform_device *pdev);
diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 6ab111c31b28..665d75d49d7b 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -149,7 +149,13 @@ static const struct snd_soc_component_driver axg_frddr_component_drv = {
 	.num_dapm_widgets	= ARRAY_SIZE(axg_frddr_dapm_widgets),
 	.dapm_routes		= axg_frddr_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(axg_frddr_dapm_routes),
-	.ops			= &axg_fifo_pcm_ops
+	.open			= axg_fifo_pcm_open,
+	.close			= axg_fifo_pcm_close,
+	.ioctl			= snd_soc_pcm_lib_ioctl,
+	.hw_params		= axg_fifo_pcm_hw_params,
+	.hw_free		= axg_fifo_pcm_hw_free,
+	.pointer		= axg_fifo_pcm_pointer,
+	.trigger		= axg_fifo_pcm_trigger,
 };
 
 static const struct axg_fifo_match_data axg_frddr_match_data = {
@@ -267,7 +273,13 @@ static const struct snd_soc_component_driver g12a_frddr_component_drv = {
 	.num_dapm_widgets	= ARRAY_SIZE(g12a_frddr_dapm_widgets),
 	.dapm_routes		= g12a_frddr_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(g12a_frddr_dapm_routes),
-	.ops			= &g12a_fifo_pcm_ops
+	.open			= axg_fifo_pcm_open,
+	.close			= axg_fifo_pcm_close,
+	.ioctl			= snd_soc_pcm_lib_ioctl,
+	.hw_params		= g12a_fifo_pcm_hw_params,
+	.hw_free		= axg_fifo_pcm_hw_free,
+	.pointer		= axg_fifo_pcm_pointer,
+	.trigger		= axg_fifo_pcm_trigger,
 };
 
 static const struct axg_fifo_match_data g12a_frddr_match_data = {
@@ -331,7 +343,13 @@ static const struct snd_soc_component_driver sm1_frddr_component_drv = {
 	.num_dapm_widgets	= ARRAY_SIZE(sm1_frddr_dapm_widgets),
 	.dapm_routes		= g12a_frddr_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(g12a_frddr_dapm_routes),
-	.ops			= &g12a_fifo_pcm_ops
+	.open			= axg_fifo_pcm_open,
+	.close			= axg_fifo_pcm_close,
+	.ioctl			= snd_soc_pcm_lib_ioctl,
+	.hw_params		= g12a_fifo_pcm_hw_params,
+	.hw_free		= axg_fifo_pcm_hw_free,
+	.pointer		= axg_fifo_pcm_pointer,
+	.trigger		= axg_fifo_pcm_trigger,
 };
 
 static const struct axg_fifo_match_data sm1_frddr_match_data = {
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index c8ea2145f576..7fef0b961496 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -181,7 +181,13 @@ static const struct snd_soc_component_driver axg_toddr_component_drv = {
 	.num_dapm_widgets	= ARRAY_SIZE(axg_toddr_dapm_widgets),
 	.dapm_routes		= axg_toddr_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(axg_toddr_dapm_routes),
-	.ops			= &axg_fifo_pcm_ops
+	.open			= axg_fifo_pcm_open,
+	.close			= axg_fifo_pcm_close,
+	.ioctl			= snd_soc_pcm_lib_ioctl,
+	.hw_params		= axg_fifo_pcm_hw_params,
+	.hw_free		= axg_fifo_pcm_hw_free,
+	.pointer		= axg_fifo_pcm_pointer,
+	.trigger		= axg_fifo_pcm_trigger,
 };
 
 static const struct axg_fifo_match_data axg_toddr_match_data = {
@@ -214,7 +220,13 @@ static const struct snd_soc_component_driver g12a_toddr_component_drv = {
 	.num_dapm_widgets	= ARRAY_SIZE(axg_toddr_dapm_widgets),
 	.dapm_routes		= axg_toddr_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(axg_toddr_dapm_routes),
-	.ops			= &g12a_fifo_pcm_ops
+	.open			= axg_fifo_pcm_open,
+	.close			= axg_fifo_pcm_close,
+	.ioctl			= snd_soc_pcm_lib_ioctl,
+	.hw_params		= g12a_fifo_pcm_hw_params,
+	.hw_free		= axg_fifo_pcm_hw_free,
+	.pointer		= axg_fifo_pcm_pointer,
+	.trigger		= axg_fifo_pcm_trigger,
 };
 
 static const struct axg_fifo_match_data g12a_toddr_match_data = {
@@ -278,7 +290,13 @@ static const struct snd_soc_component_driver sm1_toddr_component_drv = {
 	.num_dapm_widgets	= ARRAY_SIZE(sm1_toddr_dapm_widgets),
 	.dapm_routes		= sm1_toddr_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(sm1_toddr_dapm_routes),
-	.ops			= &g12a_fifo_pcm_ops
+	.open			= axg_fifo_pcm_open,
+	.close			= axg_fifo_pcm_close,
+	.ioctl			= snd_soc_pcm_lib_ioctl,
+	.hw_params		= g12a_fifo_pcm_hw_params,
+	.hw_free		= axg_fifo_pcm_hw_free,
+	.pointer		= axg_fifo_pcm_pointer,
+	.trigger		= axg_fifo_pcm_trigger,
 };
 
 static const struct axg_fifo_match_data sm1_toddr_match_data = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
