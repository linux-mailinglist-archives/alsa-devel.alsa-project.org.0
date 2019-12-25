Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 278D212A52A
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2019 01:12:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 155F716BE;
	Wed, 25 Dec 2019 01:11:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 155F716BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577232739;
	bh=Wr9zQ9eyLa0OmKGfqp8VskBoCWuSEak05bavkRf2rZM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=R2HV/cSZmmd/XhchAMlxmmOiPskQL4MKvqESmUvnlFqWPTAJSqyV3OF55moyb14pl
	 1/XM94ejEnJCUktPOICSBzkN9mSRFFcQp4uboTkct9sDhfHBIh3grVoK12qEKL/WaM
	 nup8K1ZPh6JztiWfSiOY2yEbOB//drsDSovNs4oM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCDA2F8014C;
	Wed, 25 Dec 2019 01:09:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4540F80272; Wed, 25 Dec 2019 01:09:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE17BF80138
 for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2019 01:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE17BF80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="py+1SUIs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=07LWZQqPpBm02wk7zR9ZNRj8WHeLdLUMcjrqS5EvbdM=; b=py+1SUIs0xtV
 2g1jgd3iTjPQbsFrGx5zwyzNruYNHolkR9LDm0HZsSiJZGlt30Sauj9/n8aGLT/PE63Yi7v4rtnsi
 NFxKyR5cbhRzkWdnJR64hRYtAQkxq6MC+jMFpp0PRXYWWexaoF4cihygV6kzNnil6Dwqbw/AvFwAR
 cENMk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ijuEU-0007Ka-2B; Wed, 25 Dec 2019 00:08:58 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 882EBD01A22; Wed, 25 Dec 2019 00:08:57 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
In-Reply-To: <20191220171037.10689-3-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191220171037.10689-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Date: Wed, 25 Dec 2019 00:08:57 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Jairaj Arava <jairaj.arava@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: hdac_hda: Update hdac hda dai table to
	include intel-hdmi-hifi4" to the asoc tree
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

   ASoC: hdac_hda: Update hdac hda dai table to include intel-hdmi-hifi4

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

From 4bb16cd82773ee2e73d6201e6e7271f75312144c Mon Sep 17 00:00:00 2001
From: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Date: Fri, 20 Dec 2019 11:10:37 -0600
Subject: [PATCH] ASoC: hdac_hda: Update hdac hda dai table to include
 intel-hdmi-hifi4

TGL supports more than three HDMI Dai's. So, update hdac_hda_dais table
to include 4th DAI.

Without this patch, we saw the below error in TGL DUT:
 sof_rt5682 tgl_max98357a_rt5682: ASoC: CODEC DAI intel-hdmi-hifi4 not

Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191220171037.10689-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/hdac_hda.c | 16 ++++++++++++++++
 sound/soc/codecs/hdac_hda.h |  3 ++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 6803d39e09a5..4e0f4afe6ddc 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -164,6 +164,19 @@ static struct snd_soc_dai_driver hdac_hda_dais[] = {
 		.sig_bits = 24,
 	},
 },
+{
+	.id = HDAC_HDMI_3_DAI_ID,
+	.name = "intel-hdmi-hifi4",
+	.ops = &hdac_hda_dai_ops,
+	.playback = {
+		.stream_name    = "hifi4",
+		.channels_min   = 1,
+		.channels_max   = 32,
+		.rates          = STUB_HDMI_RATES,
+		.formats        = STUB_FORMATS,
+		.sig_bits = 24,
+	},
+},
 
 };
 
@@ -346,6 +359,9 @@ static struct hda_pcm *snd_soc_find_pcm_from_dai(struct hdac_hda_priv *hda_pvt,
 	case HDAC_HDMI_2_DAI_ID:
 		pcm_name = "HDMI 2";
 		break;
+	case HDAC_HDMI_3_DAI_ID:
+		pcm_name = "HDMI 3";
+		break;
 	default:
 		dev_err(&hcodec->core.dev, "invalid dai id %d\n", dai->id);
 		return NULL;
diff --git a/sound/soc/codecs/hdac_hda.h b/sound/soc/codecs/hdac_hda.h
index e145cec085b8..598b07d9b6fe 100644
--- a/sound/soc/codecs/hdac_hda.h
+++ b/sound/soc/codecs/hdac_hda.h
@@ -13,7 +13,8 @@ enum {
 	HDAC_HDMI_0_DAI_ID,
 	HDAC_HDMI_1_DAI_ID,
 	HDAC_HDMI_2_DAI_ID,
-	HDAC_LAST_DAI_ID = HDAC_HDMI_2_DAI_ID,
+	HDAC_HDMI_3_DAI_ID,
+	HDAC_LAST_DAI_ID = HDAC_HDMI_3_DAI_ID,
 };
 
 struct hdac_hda_pcm {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
