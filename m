Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 717CDE46E2
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 11:16:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBA8C1786;
	Fri, 25 Oct 2019 11:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBA8C1786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571995006;
	bh=Z//MErb4SBY6jQetgwwDVQsUMddmeBCEvEbti+s+Wao=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GF77q9+cuXojbr8jxP8yB/75o/VudPa0F6TCUvZy1pIryIgn6XcgUXE3rw75A9dE9
	 2I7W53pMPhLTP69Kl9WR67QQ81aH84cbCuX0CY4iXa+fCwlH+BnX8m7lbqd6gO+wCC
	 nU/GpWVsVdx+3y8Xi357BQswkTZEYRiiWQn9LXnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75345F80368;
	Fri, 25 Oct 2019 11:15:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CAF5F8036F; Fri, 25 Oct 2019 11:14:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82114F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 11:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82114F802A0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 02:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; d="scan'208";a="400050841"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by fmsmga006.fm.intel.com with ESMTP; 25 Oct 2019 02:14:50 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 25 Oct 2019 17:11:31 +0800
Message-Id: <1571994691-20199-1-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Tzung-Bi Shih <tzungbi@google.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fontana <rfontana@redhat.com>, Mark Brown <broonie@kernel.org>,
 Naveen M <naveen.m@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>,
 Brent Lu <brent.lu@intel.com>
Subject: [alsa-devel] [PATCH] ASoC: eve: implement set_bias_level function
	for rt5514
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

The first DMIC capture always fail (zero sequence data from PCM port)
after using DSP hotwording function (i.e. Google assistant).

This rt5514 codec requires to control mclk directly in the set_bias_level
function. Implement this function in machine driver to control the
ssp1_mclk clock explicitly could fix this issue.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index dc09a85..b546de8 100644
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
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
