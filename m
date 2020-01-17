Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E80140E5A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 16:54:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B78AC1759;
	Fri, 17 Jan 2020 16:53:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B78AC1759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579276472;
	bh=6ZegIluii0Y4jFV+lgw06OkxiED4qewT15pmho8Ys0M=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YPWXdNM0agN6sdMr9kzAaQVGb2TJ0jqIwAeR5ODiXN5ucx/K+I5qzj0jU8tlmRoCY
	 3qs4Lol001E0HKr/hNuLhNVYPHLbcL70Vnx3+xPp1VqUcOj2lfSkRVi3hshMY4CqtB
	 im1GsK4nxUTbmCxZm1zm5wiN473XEgrvzlBExJm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 022EEF802EC;
	Fri, 17 Jan 2020 16:45:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7A03F8014B; Fri, 17 Jan 2020 16:44:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE771F8022B
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 16:44:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE771F8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ZK0ptVpi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=jGqngOh+Xf5gmoMJRDS9WQhgl46mcJ/CdI8nQzlJyzA=; b=ZK0ptVpiVb+R
 MOJpsyulSCBAgtbEZKhG0ekOkAK4A4TrmKMZ0WnCc0GMPC7+TrixQzsj+0A1wli1Apyi96iMPn03Q
 DOQdHFuYUj2UfQAwIFloEycEVz7wXmguxG0TbOkDcZ/Dqww1oKuh6z2x6T90x51AWUZn+WwIItXWu
 evCpw=;
Received: from fw-tnat-cam4.arm.com ([217.140.106.52]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1isTn5-0006rX-OA; Fri, 17 Jan 2020 15:44:07 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 35D99D02A2A; Fri, 17 Jan 2020 15:44:07 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Jordy Ubink <jordyubink@hotmail.nl>
In-Reply-To: <20200115164619.101705-4-hdegoede@redhat.com>
Message-Id: <applied-20200115164619.101705-4-hdegoede@redhat.com>
X-Patchwork-Hint: ignore
Date: Fri, 17 Jan 2020 15:44:07 +0000 (GMT)
Cc: Nariman Etemadi <narimantos@gmail.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Damian van Soelen <dj.vsoelen@gmail.com>,
 Erik Bussing <eabbussing@outlook.com>
Subject: [alsa-devel] Applied "ASoC: Intel: bytcr_rt5651: Remove unnecessary
	string buffers and snprintf calls" to the asoc tree
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

   ASoC: Intel: bytcr_rt5651: Remove unnecessary string buffers and snprintf calls

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

From fcce38d85cb865346da9b8f2d87c9427153dc5ca Mon Sep 17 00:00:00 2001
From: Jordy Ubink <jordyubink@hotmail.nl>
Date: Wed, 15 Jan 2020 17:46:18 +0100
Subject: [PATCH] ASoC: Intel: bytcr_rt5651: Remove unnecessary string buffers
 and snprintf calls

The snprintf calls filling byt_rt56*_codec_aif_name/byt_rt56*_cpu_dai_name
always fill them with the same string ("rt56*-aif2" resp. ssp0-port").
So instead of keeping these buffers around and making codecs->dai_name /
cpus->dai_name point to them, simply update the *->dai_name pointers to
directly point to a string constant containing the desired string.

Signed-off-by: Jordy Ubink <jordyubink@hotmail.nl>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20200115164619.101705-4-hdegoede@redhat.com
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5651.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 6d71352ea864..5074bb53f98e 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -787,8 +787,6 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 
 /* SoC card */
 static char byt_rt5651_codec_name[SND_ACPI_I2C_ID_LEN];
-static char byt_rt5651_codec_aif_name[12]; /*  = "rt5651-aif[1|2]" */
-static char byt_rt5651_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
 #if !IS_ENABLED(CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES)
 static char byt_rt5651_long_name[50]; /* = "bytcr-rt5651-*-spk-*-mic[-swapped-hp]" */
 #endif
@@ -1037,26 +1035,12 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	log_quirks(&pdev->dev);
 
 	if ((byt_rt5651_quirk & BYT_RT5651_SSP2_AIF2) ||
-	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2)) {
-		/* fixup codec aif name */
-		snprintf(byt_rt5651_codec_aif_name,
-			sizeof(byt_rt5651_codec_aif_name),
-			"%s", "rt5651-aif2");
-
-		byt_rt5651_dais[dai_index].codecs->dai_name =
-			byt_rt5651_codec_aif_name;
-	}
+	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2))
+		byt_rt5651_dais[dai_index].codecs->dai_name = "rt5651-aif2";
 
 	if ((byt_rt5651_quirk & BYT_RT5651_SSP0_AIF1) ||
-	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2)) {
-		/* fixup cpu dai name name */
-		snprintf(byt_rt5651_cpu_dai_name,
-			sizeof(byt_rt5651_cpu_dai_name),
-			"%s", "ssp0-port");
-
-		byt_rt5651_dais[dai_index].cpus->dai_name =
-			byt_rt5651_cpu_dai_name;
-	}
+	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2))
+		byt_rt5651_dais[dai_index].cpus->dai_name = "ssp0-port";
 
 	if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN) {
 		priv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
