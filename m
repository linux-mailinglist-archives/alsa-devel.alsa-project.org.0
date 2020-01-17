Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB44140E31
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 16:47:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8974317E3;
	Fri, 17 Jan 2020 16:46:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8974317E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579276035;
	bh=uln8dGm1KldZytpJOm9jwnrqxZt7tnXZl6/uARjjXtg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lbOEprEPJgAG7bF6BYqI62JgBzm9YBrJBQwGCyHXeitgP1mSOPmdosaJ5xSisXwv3
	 FCWnQ8GP0IVNNX4ZennqIzidH8hNF/ouq+T9ERbwcUvEsAg/ycOZaus7bVR4FoIhga
	 kyGLjPp9sHnTwH/t2rj3BeO/X3EAJ/WbtZM6vs9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACF34F801F8;
	Fri, 17 Jan 2020 16:45:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4E21F801F7; Fri, 17 Jan 2020 16:44:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D804F800AA
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 16:44:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D804F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="spE3q8AH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=2yzoAALneiFLsc2J9ePxVhLixhVbVsR363I/k1l+xK0=; b=spE3q8AHOsie
 q8mxmdAwPVyl7oOQYJ6n8ww5t+Io/GANxmVAD32AUdxUPBfrsTmwQH48FvdW1qdWrEzXXM8LnYQ7G
 i95o7UBqkH8LmH7sLKBYbhlXRkixQDzj9evUg4U5XjQR9iEssue/YfPpg4o8S210IBhYOigXhlfeQ
 TGnBg=;
Received: from fw-tnat-cam4.arm.com ([217.140.106.52]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1isTn3-0006rU-HV; Fri, 17 Jan 2020 15:44:05 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 3250ED02A2A; Fri, 17 Jan 2020 15:44:05 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Damian van Soelen <dj.vsoelen@gmail.com>
In-Reply-To: <20200115164619.101705-5-hdegoede@redhat.com>
Message-Id: <applied-20200115164619.101705-5-hdegoede@redhat.com>
X-Patchwork-Hint: ignore
Date: Fri, 17 Jan 2020 15:44:05 +0000 (GMT)
Cc: Nariman Etemadi <narimantos@gmail.com>, alsa-devel@alsa-project.org,
 Jordy Ubink <jordyubink@hotmail.nl>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Erik Bussing <eabbussing@outlook.com>
Subject: [alsa-devel] Applied "ASoC: Intel: cht_bsw_rt5645: Remove
	unnecessary string buffers and snprintf calls" to the asoc tree
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

   ASoC: Intel: cht_bsw_rt5645: Remove unnecessary string buffers and snprintf calls

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 791a0059e2585c094c2b8ff61983074c657dabf8 Mon Sep 17 00:00:00 2001
From: Damian van Soelen <dj.vsoelen@gmail.com>
Date: Wed, 15 Jan 2020 17:46:19 +0100
Subject: [PATCH] ASoC: Intel: cht_bsw_rt5645: Remove unnecessary string
 buffers and snprintf calls

The snprintf calls filling cht_rt5645_cpu_dai_name /
cht_rt5645_codec_aif_name always fill them with the same string
("ssp0-port" resp "rt5645-aif2") so instead of keeping these buffers
around and making cpus->dai_name / codecs->dai_name point to this,
simply update the *->dai_name pointers to directly point to a string
constant containing the desired string.

Signed-off-by: Damian van Soelen <dj.vsoelen@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20200115164619.101705-5-hdegoede@redhat.com
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/cht_bsw_rt5645.c | 26 ++++---------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index c68a5b85a4a0..b5b016d493f1 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -515,8 +515,6 @@ static struct cht_acpi_card snd_soc_cards[] = {
 };
 
 static char cht_rt5645_codec_name[SND_ACPI_I2C_ID_LEN];
-static char cht_rt5645_codec_aif_name[12]; /*  = "rt5645-aif[1|2]" */
-static char cht_rt5645_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
 
 struct acpi_chan_package {   /* ACPICA seems to require 64 bit integers */
 	u64 aif_value;       /* 1: AIF1, 2: AIF2 */
@@ -641,28 +639,12 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	log_quirks(&pdev->dev);
 
 	if ((cht_rt5645_quirk & CHT_RT5645_SSP2_AIF2) ||
-		(cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2)) {
-
-		/* fixup codec aif name */
-		snprintf(cht_rt5645_codec_aif_name,
-			sizeof(cht_rt5645_codec_aif_name),
-			"%s", "rt5645-aif2");
-
-		cht_dailink[dai_index].codecs->dai_name =
-			cht_rt5645_codec_aif_name;
-	}
+	    (cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2))
+		cht_dailink[dai_index].codecs->dai_name = "rt5645-aif2";
 
 	if ((cht_rt5645_quirk & CHT_RT5645_SSP0_AIF1) ||
-		(cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2)) {
-
-		/* fixup cpu dai name name */
-		snprintf(cht_rt5645_cpu_dai_name,
-			sizeof(cht_rt5645_cpu_dai_name),
-			"%s", "ssp0-port");
-
-		cht_dailink[dai_index].cpus->dai_name =
-			cht_rt5645_cpu_dai_name;
-	}
+	    (cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2))
+		cht_dailink[dai_index].cpus->dai_name = "ssp0-port";
 
 	/* override plaform name, if required */
 	platform_name = mach->mach_params.platform;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
