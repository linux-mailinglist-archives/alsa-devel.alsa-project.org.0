Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A05C5E74FA
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:22:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 366CE2070;
	Mon, 28 Oct 2019 16:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 366CE2070
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572276141;
	bh=Qq7MPWVq7rdPGcUZs7oYUIoiuwKolwIVRTPKkuAmQZc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=e6dNc1DrXOt7WYJXUUTYw8tCr04u1KCzkRfdxmMNyq7EXeMgIsur/zSiAfkUAe252
	 R41Aewsv6Tx91lpXCaRH2DZbQbOfECGjihICUTBXE92gh2FUFLZAPWdzFmzljDayhJ
	 JzP6NOxsq0RqpdgblFGNxDeN+KQkgv0JMLevF73U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 620E4F8961A;
	Mon, 28 Oct 2019 15:57:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B551F8071F; Mon, 28 Oct 2019 15:57:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55391F8065C
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55391F8065C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FvTMo9Uv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=98Wb18Z1bfDrggU/frWLJljlHC7bBA1FwQu15wzNfsM=; b=FvTMo9UvCNm1
 kRODwfl8BAGCnM1dE27xnXnJ+0Lkm0cVGnwnxx640GA/VaWeAWyoeZmHNA5S1MOs59kFNmk6uweHk
 rD997CIut7eJXQIJ0PAxlfJSrPnJ7WE4a/5c+3h3fTTmNEzRtN2hwxJfr6uVy2abx6AOcqgFylOeY
 ycDuk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rj-0008Rk-3j; Mon, 28 Oct 2019 14:56:39 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1D0F62740409; Mon, 28 Oct 2019 14:56:37 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Brent Lu <brent.lu@intel.com>
In-Reply-To: <1571994691-20199-1-git-send-email-brent.lu@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145637.1D0F62740409@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:37 +0000 (GMT)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Tzung-Bi Shih <tzungbi@google.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fontana <rfontana@redhat.com>, Mark Brown <broonie@kernel.org>,
 Naveen M <naveen.m@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>
Subject: [alsa-devel] Applied "ASoC: eve: implement set_bias_level function
	for rt5514" to the asoc tree
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

   ASoC: eve: implement set_bias_level function for rt5514

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

From 15747a80207585fe942416025540c0ff34e2aef8 Mon Sep 17 00:00:00 2001
From: Brent Lu <brent.lu@intel.com>
Date: Fri, 25 Oct 2019 17:11:31 +0800
Subject: [PATCH] ASoC: eve: implement set_bias_level function for rt5514

The first DMIC capture always fail (zero sequence data from PCM port)
after using DSP hotwording function (i.e. Google assistant).

This rt5514 codec requires to control mclk directly in the set_bias_level
function. Implement this function in machine driver to control the
ssp1_mclk clock explicitly could fix this issue.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/1571994691-20199-1-git-send-email-brent.lu@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index dc09a85e4c74..b546de8ba1e3 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -653,6 +653,55 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	},
 };
 
+static int kabylake_set_bias_level(struct snd_soc_card *card,
+	struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level)
+{
+	struct snd_soc_component *component = dapm->component;
+	struct kbl_codec_private *priv = snd_soc_card_get_drvdata(card);
+	int ret = 0;
+
+	if (!component || strcmp(component->name, RT5514_DEV_NAME))
+		return 0;
+
+	if (IS_ERR(priv->mclk))
+		return 0;
+
+	/*
+	 * It's required to control mclk directly in the set_bias_level
+	 * function for rt5514 codec or the recording function could
+	 * break.
+	 */
+	switch (level) {
+	case SND_SOC_BIAS_PREPARE:
+		if (dapm->bias_level == SND_SOC_BIAS_ON) {
+			dev_dbg(card->dev, "Disable mclk");
+			clk_disable_unprepare(priv->mclk);
+		} else {
+			dev_dbg(card->dev, "Enable mclk");
+			ret = clk_set_rate(priv->mclk, 24000000);
+			if (ret) {
+				dev_err(card->dev, "Can't set rate for mclk, err: %d\n",
+					ret);
+				return ret;
+			}
+
+			ret = clk_prepare_enable(priv->mclk);
+			if (ret) {
+				dev_err(card->dev, "Can't enable mclk, err: %d\n",
+					ret);
+
+				/* mclk is already enabled in FW */
+				ret = 0;
+			}
+		}
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 static int kabylake_card_late_probe(struct snd_soc_card *card)
 {
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(card);
@@ -692,6 +741,7 @@ static struct snd_soc_card kabylake_audio_card = {
 	.owner = THIS_MODULE,
 	.dai_link = kabylake_dais,
 	.num_links = ARRAY_SIZE(kabylake_dais),
+	.set_bias_level = kabylake_set_bias_level,
 	.controls = kabylake_controls,
 	.num_controls = ARRAY_SIZE(kabylake_controls),
 	.dapm_widgets = kabylake_widgets,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
