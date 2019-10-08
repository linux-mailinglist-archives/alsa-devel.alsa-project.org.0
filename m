Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DB1CFB17
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:15:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 464831695;
	Tue,  8 Oct 2019 15:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 464831695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540522;
	bh=YYL6RV65Yq+2B7HzpZRwmzNL7cUWRmFNwaACxne6uUo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dxc0Dj8PbA4qlmDaI2zaDRIGQuGgnVdNxdHl4RAubj/3b1Bov9KB3K4farkoDr6Wz
	 rcLqy14JxMQRAAyHvcBtMvHMzVS/fl2jDw8eaPUfmQF8Nvx36vLCaukkGPrkBmbsn+
	 T5eE55FEZ9QMmKx90nc71/hjh9UXAdOd6FtimsVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54992F80C32;
	Tue,  8 Oct 2019 14:54:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97556F80766; Tue,  8 Oct 2019 14:54:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D995FF80642
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D995FF80642
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BVFn2Pvt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=W8Rt0C0H/cXKhpn2dvncDNcowUfK0I/rNO3VLxzCVTA=; b=BVFn2PvtmLdD
 PhjxNVg8iJtSz24JYnqPb8vpkSEQo2IJgOtp95eN7INlYyjtde0kXA8SIyrjFy9iSckMfnMYLKD6K
 CIViSqGJ/wCxiBhAYA7UfP7apDMqtyMLNkBz1hGPU9v7i3uAaz5D4SjSKEqR43ZqNt3MoqjIUTs3r
 MEl74=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozc-0008Oj-EG; Tue, 08 Oct 2019 12:53:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E20722740D48; Tue,  8 Oct 2019 13:53:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87d0ffaf14.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125331.E20722740D48@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:31 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: xtensa: xtfpga-i2s: remove snd_pcm_ops"
	to the asoc tree
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

   ASoC: xtensa: xtfpga-i2s: remove snd_pcm_ops

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

From 17d48a3186bd7433c3cccabd767c7d7a19b76362 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:32:23 +0900
Subject: [PATCH] ASoC: xtensa: xtfpga-i2s: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87d0ffaf14.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/xtensa/xtfpga-i2s.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index efd374f114a0..e08f4fee932a 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -365,7 +365,8 @@ static const struct snd_pcm_hardware xtfpga_pcm_hardware = {
 	.fifo_size		= 16,
 };
 
-static int xtfpga_pcm_open(struct snd_pcm_substream *substream)
+static int xtfpga_pcm_open(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -378,13 +379,15 @@ static int xtfpga_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int xtfpga_pcm_close(struct snd_pcm_substream *substream)
+static int xtfpga_pcm_close(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream)
 {
 	synchronize_rcu();
 	return 0;
 }
 
-static int xtfpga_pcm_hw_params(struct snd_pcm_substream *substream,
+static int xtfpga_pcm_hw_params(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *hw_params)
 {
 	int ret;
@@ -424,7 +427,8 @@ static int xtfpga_pcm_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static int xtfpga_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+static int xtfpga_pcm_trigger(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream, int cmd)
 {
 	int ret = 0;
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -452,7 +456,8 @@ static int xtfpga_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	return ret;
 }
 
-static snd_pcm_uframes_t xtfpga_pcm_pointer(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t xtfpga_pcm_pointer(struct snd_soc_component *component,
+					    struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct xtfpga_i2s *i2s = runtime->private_data;
@@ -461,7 +466,8 @@ static snd_pcm_uframes_t xtfpga_pcm_pointer(struct snd_pcm_substream *substream)
 	return pos < runtime->buffer_size ? pos : 0;
 }
 
-static int xtfpga_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int xtfpga_pcm_new(struct snd_soc_component *component,
+			  struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
 	size_t size = xtfpga_pcm_hardware.buffer_bytes_max;
@@ -471,19 +477,15 @@ static int xtfpga_pcm_new(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static const struct snd_pcm_ops xtfpga_pcm_ops = {
+static const struct snd_soc_component_driver xtfpga_i2s_component = {
+	.name		= DRV_NAME,
 	.open		= xtfpga_pcm_open,
 	.close		= xtfpga_pcm_close,
-	.ioctl		= snd_pcm_lib_ioctl,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= xtfpga_pcm_hw_params,
 	.trigger	= xtfpga_pcm_trigger,
 	.pointer	= xtfpga_pcm_pointer,
-};
-
-static const struct snd_soc_component_driver xtfpga_i2s_component = {
-	.name		= DRV_NAME,
-	.pcm_new	= xtfpga_pcm_new,
-	.ops		= &xtfpga_pcm_ops,
+	.pcm_construct	= xtfpga_pcm_new,
 };
 
 static const struct snd_soc_dai_ops xtfpga_i2s_dai_ops = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
