Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F225EE88EB
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 13:58:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8070C21D6;
	Tue, 29 Oct 2019 13:57:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8070C21D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572353929;
	bh=UbTeBN4LQ8tfpbzuzOCXnTmHkVKxZAXY0fMYjGev7YE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=T6VHFxsOwZ4L0bZ0a/IzDdHM0yCPCLPpLbAhh9IrMYE9RWiCm05Y57bfeG1mTe7hL
	 XKE3YRkiK/o+H3yIN3SbujasZ0iEicC29YsSGwEJ9+yjrc4kcajHwcpQKMDVmV/UHf
	 n9Y8blgnMBlXTX1okpfh9dNgRHrSRUUzshjU0SjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6809CF8044B;
	Tue, 29 Oct 2019 13:57:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C6FBF8045D; Tue, 29 Oct 2019 13:57:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F594F8015A
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 13:57:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F594F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KpLgEs92"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=6bBEXMhnRCMkhOJtyh3NeGL/yxApYoAeD1NAbx1DX/Q=; b=KpLgEs92MAQF
 duC8pBs+KO42Jwo3vQEIrxZs509AeL9xBLrEEidxCUk5n9EoRmK74/mEd4QIPuwKuZABLQvGtV5m/
 I6D83vd87ZCVAvzyFwr0dY+EqlZc92bJK3iw8RDWozU7ec0/QJcT6g+DZI0I6NRU1Hea3lnz4D65e
 dDpn0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iPR3U-0002DR-Pj; Tue, 29 Oct 2019 12:57:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5215227428D8; Tue, 29 Oct 2019 12:57:00 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20191028164624.14334-1-perex@perex.cz>
X-Patchwork-Hint: ignore
Message-Id: <20191029125700.5215227428D8@ypsilon.sirena.org.uk>
Date: Tue, 29 Oct 2019 12:57:00 +0000 (GMT)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: intel - fix the card names" to the asoc
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

   ASoC: intel - fix the card names

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

From d745cc1ab65945b2d17ec9c5652f38299c054649 Mon Sep 17 00:00:00 2001
From: Jaroslav Kysela <perex@perex.cz>
Date: Mon, 28 Oct 2019 17:46:24 +0100
Subject: [PATCH] ASoC: intel - fix the card names

Those strings are exposed to the user space as the
card name thus used in the GUIs. The common
standard is to avoid '_' here. The worst case
is 'sof-skl_hda_card' string.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191028164624.14334-1-perex@perex.cz
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 2 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c        | 2 +-
 sound/soc/intel/boards/sof_rt5682.c                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index b546de8ba1e3..a1056cda3dd7 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -737,7 +737,7 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
  * kabylake audio machine driver for  MAX98927 + RT5514 + RT5663
  */
 static struct snd_soc_card kabylake_audio_card = {
-	.name = "kbl_r5514_5663_max",
+	.name = "kbl-r5514-5663-max",
 	.owner = THIS_MODULE,
 	.dai_link = kabylake_dais,
 	.num_links = ARRAY_SIZE(kabylake_dais),
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 1778acdc367c..e8d676c192f6 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -90,7 +90,7 @@ skl_hda_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
 }
 
 static struct snd_soc_card hda_soc_card = {
-	.name = "skl_hda_card",
+	.name = "hda-dsp",
 	.owner = THIS_MODULE,
 	.dai_link = skl_hda_be_dai_links,
 	.dapm_widgets = skl_hda_widgets,
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 5ce643d62faf..2caebc77fdb5 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -370,7 +370,7 @@ static int dmic_init(struct snd_soc_pcm_runtime *rtd)
 
 /* sof audio machine driver for rt5682 codec */
 static struct snd_soc_card sof_audio_card_rt5682 = {
-	.name = "sof_rt5682",
+	.name = "rt5682", /* the sof- prefix is added by the core */
 	.owner = THIS_MODULE,
 	.controls = sof_controls,
 	.num_controls = ARRAY_SIZE(sof_controls),
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
