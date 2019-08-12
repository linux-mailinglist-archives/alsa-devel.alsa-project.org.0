Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C15F389F6D
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 15:17:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C54AF166F;
	Mon, 12 Aug 2019 15:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C54AF166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565615830;
	bh=NlvuvxxqV/DbgfdNidoZS1EmGr6kBC94DVJym8Plav8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=W4oiYaizBXVWjVMfVdZB+N96xY6zwutFqAQIQElQ1t6gxm7OPiLepb+rFzXLAh5ps
	 srjGC07WxWBqT1vndZw/rv6dl5IdBQjVhlFMVY4aPYDyOHSoOSEnlorEZ9WUPKFyvA
	 P9/N7vceHmUfOxQemkFTuyqnzSQEZrCtOZBVxeiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EBD2F8015B;
	Mon, 12 Aug 2019 15:15:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88FE7F80213; Mon, 12 Aug 2019 15:10:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C840F805E1
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 15:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C840F805E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YocxDcWl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=F+a7jX4CFuDFf1JUHLAfu1liKuh5ET2Ys9C+/4tYQ5Q=; b=YocxDcWlOIvw
 mIBXHUl/tbT6U9r1hoz5dxer+EbX5Fa6feNwjG7sPvPOhtHnlT7+nwUO2TP/8tYBMrPj1oc73+IT/
 B5/1zL8A7pEp6B1+7SrX9iToEIGDifWFFslNsz6dJyGAr/Cmw62i5cyowzAAy9gm8nmP7ctKED8v/
 olFAQ=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxA58-0001Lp-8k; Mon, 12 Aug 2019 13:09:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A1E202740CBD; Mon, 12 Aug 2019 14:09:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20190809232236.21182-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190812130949.A1E202740CBD@ypsilon.sirena.org.uk>
Date: Mon, 12 Aug 2019 14:09:49 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: skl-hda-dsp-generic: add dmic
	dapm widget and route" to the asoc tree
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

   ASoC: Intel: skl-hda-dsp-generic: add dmic dapm widget and route

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 79631210fc413546d0ed73632ff904ded5192cc9 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 9 Aug 2019 18:22:36 -0500
Subject: [PATCH] ASoC: Intel: skl-hda-dsp-generic: add dmic dapm widget and
 route

Adding DAPM MIC endpoint widget "SoC DMIC" and route, to enable
DMIC DAPM support with hda generic machine.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190809232236.21182-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 9ed68eb4f058..1778acdc367c 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -23,6 +23,7 @@ static const struct snd_soc_dapm_widget skl_hda_widgets[] = {
 	SND_SOC_DAPM_MIC("Alt Analog In", NULL),
 	SND_SOC_DAPM_SPK("Digital Out", NULL),
 	SND_SOC_DAPM_MIC("Digital In", NULL),
+	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 };
 
 static const struct snd_soc_dapm_route skl_hda_map[] = {
@@ -41,6 +42,9 @@ static const struct snd_soc_dapm_route skl_hda_map[] = {
 	{ "Codec Input Pin2", NULL, "Digital In" },
 	{ "Codec Input Pin3", NULL, "Alt Analog In" },
 
+	/* digital mics */
+	{"DMic", NULL, "SoC DMIC"},
+
 	/* CODEC BE connections */
 	{ "Analog Codec Playback", NULL, "Analog CPU Playback" },
 	{ "Analog CPU Playback", NULL, "codec0_out" },
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
