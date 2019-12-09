Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3AA117536
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:09:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320DD16A0;
	Mon,  9 Dec 2019 20:08:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320DD16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575918567;
	bh=Nj1SvI4KlFjxLuzkGrcekd/L18VB1XGTzNSmNn28084=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FkpXgZ3sgfpKjhnx13Ev2RV7wleJNFdSyk7FASpAgR42GpNZvA86cRaQXFah8EAOw
	 E6aYXE8JfotWFL+S/n+DmPFYhjlxUaEvUyA0wCP9eTP2DNBbrPSQyH5Lgj/9RI1bjX
	 D9ZZ7Zt4hR+gRbE5bKjIUBdJNBzfOuNYlHNStyRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D52CF80308;
	Mon,  9 Dec 2019 19:59:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35DADF802C3; Mon,  9 Dec 2019 19:59:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id DD70AF802A0
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:59:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD70AF802A0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B4B311D4;
 Mon,  9 Dec 2019 10:59:08 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B7B63F6CF;
 Mon,  9 Dec 2019 10:59:07 -0800 (PST)
Date: Mon, 09 Dec 2019 18:59:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20191206103542.485224-1-jbrunet@baylibre.com>
Message-Id: <applied-20191206103542.485224-1-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: hdmi-codec: re-introduce mutex locking
	again" to the asoc tree
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

   ASoC: hdmi-codec: re-introduce mutex locking again

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 1442842952ccfe4178602c7a8459ac2ecb9d9e1a Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 6 Dec 2019 11:35:42 +0100
Subject: [PATCH] ASoC: hdmi-codec: re-introduce mutex locking again

The dai codec needs to ensure that on one dai is used at any time.
This is currently protected by bit atomic operation. With this change,
it done with a mutex instead.

This change is not about functionality or efficiency. It is done with
the hope that it help maintainability in the future.

Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20191206103542.485224-1-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/hdmi-codec.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index f8b5b960e597..543363102d03 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -274,7 +274,8 @@ struct hdmi_codec_priv {
 	uint8_t eld[MAX_ELD_BYTES];
 	struct snd_pcm_chmap *chmap_info;
 	unsigned int chmap_idx;
-	unsigned long busy;
+	struct mutex lock;
+	bool busy;
 	struct snd_soc_jack *jack;
 	unsigned int jack_status;
 };
@@ -390,9 +391,10 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
 	int ret = 0;
 
-	ret = test_and_set_bit(0, &hcp->busy);
-	if (ret) {
+	mutex_lock(&hcp->lock);
+	if (hcp->busy) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
+		mutex_unlock(&hcp->lock);
 		return -EINVAL;
 	}
 
@@ -405,21 +407,21 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	if (hcp->hcd.ops->get_eld) {
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
+		if (ret)
+			goto err;
+
+		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
+		if (ret)
+			goto err;
 
-		if (!ret) {
-			ret = snd_pcm_hw_constraint_eld(substream->runtime,
-							hcp->eld);
-			if (ret)
-				goto err;
-		}
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
 	}
-	return 0;
+
+	hcp->busy = true;
 
 err:
-	/* Release the exclusive lock on error */
-	clear_bit(0, &hcp->busy);
+	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -431,7 +433,9 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	clear_bit(0, &hcp->busy);
+	mutex_lock(&hcp->lock);
+	hcp->busy = false;
+	mutex_unlock(&hcp->lock);
 }
 
 static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
@@ -811,6 +815,8 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hcp->hcd = *hcd;
+	mutex_init(&hcp->lock);
+
 	daidrv = devm_kcalloc(dev, dai_count, sizeof(*daidrv), GFP_KERNEL);
 	if (!daidrv)
 		return -ENOMEM;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
