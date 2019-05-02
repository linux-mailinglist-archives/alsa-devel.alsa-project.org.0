Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DAC1116C
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:22:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 824151740;
	Thu,  2 May 2019 04:21:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 824151740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556763756;
	bh=OXum3rOfjqTf3q7KBgLyAHknYwf+2YdCIwrs/+z+ZWU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=QX8UCuhAjn3/9UnxnWDza42jLgvVUE3AP6WX6bST30XHv7SpPsFvneyrpFTAX6+fl
	 MpxuxNYsImccYUH2Q8ydRm3/Tt+nclrMBNV3lcox22TdgB9Cc8fptljzxG2Jfc06WJ
	 E4gi9oU3XWGznGjy64rfyZtRsbMmS5lw4rWQU2dQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E6B4F89742;
	Thu,  2 May 2019 04:18:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD0E4F89729; Thu,  2 May 2019 04:18:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 706EEF8971A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 706EEF8971A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="TeiwuLrw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=/WZe54ra2XqFdangOLiX00Z92PAeriqAJdzr7Z/b+/s=; b=TeiwuLrwP5f6
 d/7VHhfFOldfXqYBZ35LspYPgSwTtnNZNJIJktSM3qyyM2ZGb0vwYaM1L/rezzHhfCinkArV2RoVs
 dxBKfRVx1625r3ixlQXPxDGpptGvrAw3z3NNWJ0/S1/5FzRgK1QAmBQHBgH0B2vxQX6njMz1UzFlW
 +Ckps=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1IV-0005pv-PH; Thu, 02 May 2019 02:18:08 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 22810441D3B; Thu,  2 May 2019 03:18:04 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
In-Reply-To: <20190430231134.4471-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021804.22810441D3B@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:04 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: dapm: fix kcontrols for effect widgets"
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

   ASoC: dapm: fix kcontrols for effect widgets

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.1

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

From 882c8b4af315bf921431142c1e9f5f69df99da34 Mon Sep 17 00:00:00 2001
From: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Date: Tue, 30 Apr 2019 18:11:34 -0500
Subject: [PATCH] ASoC: dapm: fix kcontrols for effect widgets

This patch adds the handling of snd_soc_dapm_effect that was missing.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-dapm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 0382a47b30bd..29cdfbf4c888 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -883,6 +883,7 @@ static int dapm_create_or_share_kcontrol(struct snd_soc_dapm_widget *w,
 			case snd_soc_dapm_switch:
 			case snd_soc_dapm_mixer:
 			case snd_soc_dapm_pga:
+			case snd_soc_dapm_effect:
 			case snd_soc_dapm_out_drv:
 				wname_in_long_name = true;
 				kcname_in_long_name = true;
@@ -2370,6 +2371,7 @@ static ssize_t dapm_widget_show_component(struct snd_soc_component *cmpnt,
 		case snd_soc_dapm_dac:
 		case snd_soc_dapm_adc:
 		case snd_soc_dapm_pga:
+		case snd_soc_dapm_effect:
 		case snd_soc_dapm_out_drv:
 		case snd_soc_dapm_mixer:
 		case snd_soc_dapm_mixer_named_ctl:
@@ -3197,6 +3199,7 @@ int snd_soc_dapm_new_widgets(struct snd_soc_card *card)
 			dapm_new_mux(w);
 			break;
 		case snd_soc_dapm_pga:
+		case snd_soc_dapm_effect:
 		case snd_soc_dapm_out_drv:
 			dapm_new_pga(w);
 			break;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
