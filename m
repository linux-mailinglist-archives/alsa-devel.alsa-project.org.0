Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A9943F89
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 17:58:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 407E017F6;
	Thu, 13 Jun 2019 17:57:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 407E017F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560441510;
	bh=U2+BM68D57eoDo3jldf8SkfrHvXbaTVRloZ9H/fiKTM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=X94Ak8A4XpadrgXUXpJzEOvLHBuWDjKfYi/+21dZfnbg5V6fOtyGD83s3986hKMJ3
	 UueK/fNO+7e57veLCnwVM28XIL892s97T04YtGQpNRqAoueS6mvu0Jnc+Iz8Cl/l9D
	 6YHpgutLd7Yj+PzWXwYDvpzfcymiIH7h98Pgn0m8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC7CDF8970F;
	Thu, 13 Jun 2019 17:56:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCB1DF8970F; Thu, 13 Jun 2019 17:56:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 464E5F80794
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 17:56:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 464E5F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="XJcckipD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=nAFc25kUtYG0NCGhYgq5P5W/mNezHsZLyaTwyKYQopw=; b=XJcckipDkKWX
 f08gc2o7uxamNlghkqo1Z2KN/1QH67FN9GaIgYZH2pHHDMQoEVvgNmh4lpWVgn556HWwV2JC+OlT8
 0Vd8qWeM/IQICukg6mBR5CYrfzE3TyoviUIJfklV2ZvFbQcLFqmDu40YUc0j0PcSUbFrwPRJgK4ZL
 uUcCE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbS5e-0005H5-MP; Thu, 13 Jun 2019 15:56:38 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id C2742440046; Thu, 13 Jun 2019 16:56:37 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20190612163958.17068-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190613155637.C2742440046@finisterre.sirena.org.uk>
Date: Thu, 13 Jun 2019 16:56:37 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: bxt-da7219-max98357a: add BE
	dailink for dmic16k" to the asoc tree
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

   ASoC: Intel: bxt-da7219-max98357a: add BE dailink for dmic16k

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From fc30f2adb621aa6d6c59f0276d06004dcb204a56 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Wed, 12 Jun 2019 11:39:58 -0500
Subject: [PATCH] ASoC: Intel: bxt-da7219-max98357a: add BE dailink for dmic16k

We need dmic16k BE(and FE, in tplg file) dailink for keyword detection
feature on bxt-da7219-max98357a machine, here add it in driver side.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index d712623854a3..0f7610c5fd53 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -412,6 +412,10 @@ SND_SOC_DAILINK_DEF(ssp1_codec,
 
 SND_SOC_DAILINK_DEF(dmic_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
+
+SND_SOC_DAILINK_DEF(dmic16k_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC16k Pin")));
+
 SND_SOC_DAILINK_DEF(dmic_codec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
 
@@ -586,6 +590,14 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
+	{
+		.name = "dmic16k",
+		.id = 6,
+		.be_hw_params_fixup = broxton_dmic_fixup,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic16k_pin, dmic_codec, platform),
+	},
 };
 
 #define NAME_SIZE	32
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
