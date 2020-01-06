Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B65AB1319E5
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jan 2020 21:52:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B0DF17C0;
	Mon,  6 Jan 2020 21:51:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B0DF17C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578343968;
	bh=8npJVtXPXuVpEzAO/+g1pOE/K8bnHKTuGf1GAEcUEfo=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mRKJ0x1zjbAQxmPQREnZ5OEX4eNFEd7Zf6WJZndlZn9t7H4UaOyYNUKWnkJfcWOtA
	 qHo21WPCWu3oxAbgbdI+Idc1jh6aO60X3OlYIZ4a8MIcQBPnyCyLwr1vgdO5mKvOQd
	 VbtUSRMlbFF/pohbNQxe1WuSePtkqqHGkJwJHzHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5443BF80159;
	Mon,  6 Jan 2020 21:51:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E86FF801DA; Mon,  6 Jan 2020 21:51:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 3A0AEF8010C
 for <alsa-devel@alsa-project.org>; Mon,  6 Jan 2020 21:50:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A0AEF8010C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F26CA328;
 Mon,  6 Jan 2020 12:50:55 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 797643F534;
 Mon,  6 Jan 2020 12:50:55 -0800 (PST)
Date: Mon, 06 Jan 2020 20:50:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Sam McNally <sammc@chromium.org>
In-Reply-To: <20200103124921.v3.1.Ib87c4a7fbb3fc818ea12198e291b87dc2d5bc8c2@changeid>
Message-Id: <applied-20200103124921.v3.1.Ib87c4a7fbb3fc818ea12198e291b87dc2d5bc8c2@changeid>
X-Patchwork-Hint: ignore
Cc: Xun Zhang <xun2.zhang@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: sof_rt5682: Ignore the speaker
	amp when there isn't one." to the asoc tree
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

   ASoC: Intel: sof_rt5682: Ignore the speaker amp when there isn't one.

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

From d4b74e218a8d0d6cf58e546627ab9d4d4f2645ab Mon Sep 17 00:00:00 2001
From: Sam McNally <sammc@chromium.org>
Date: Fri, 3 Jan 2020 12:50:19 +1100
Subject: [PATCH] ASoC: Intel: sof_rt5682: Ignore the speaker amp when there
 isn't one.

Some members of the Google_Hatch family include a rt5682 jack codec, but
no speaker amplifier. This uses the same driver (sof_rt5682) as a
combination of rt5682 jack codec and max98357a speaker amplifier. Within
the sof_rt5682 driver, these cases are not currently distinguishable,
relying on a DMI quirk to decide the configuration. This causes an
incorrect configuration when only the rt5682 is present on a
Google_Hatch device.

For CML, the jack codec is used as the primary key when matching,
with a possible speaker amplifier described in quirk_data. The two cases
of interest are the second and third 10EC5682 entries in
snd_soc_acpi_intel_cml_machines[]. The second entry matches the
combination of rt5682 and max98357a, resulting in the quirk_data field
in the snd_soc_acpi_mach being non-null, pointing at
max98357a_spk_codecs, the snd_soc_acpi_codecs for the matched speaker
amplifier. The third entry matches just the rt5682, resulting in a null
quirk_data.

The sof_rt5682 driver's DMI data matching identifies that a speaker
amplifier is present for all Google_Hatch family devices. Detect cases
where there is no speaker amplifier by checking for a null quirk_data in
the snd_soc_acpi_mach and remove the speaker amplifier bit in that case.

Signed-off-by: Sam McNally <sammc@chromium.org>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200103124921.v3.1.Ib87c4a7fbb3fc818ea12198e291b87dc2d5bc8c2@changeid
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/sof_rt5682.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index ad8a2b4bc709..8a13231dee15 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -603,6 +603,14 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dmi_check_system(sof_rt5682_quirk_table);
 
+	mach = (&pdev->dev)->platform_data;
+
+	/* A speaker amp might not be present when the quirk claims one is.
+	 * Detect this via whether the machine driver match includes quirk_data.
+	 */
+	if ((sof_rt5682_quirk & SOF_SPEAKER_AMP_PRESENT) && !mach->quirk_data)
+		sof_rt5682_quirk &= ~SOF_SPEAKER_AMP_PRESENT;
+
 	if (soc_intel_is_byt() || soc_intel_is_cht()) {
 		is_legacy_cpu = 1;
 		dmic_be_num = 0;
@@ -663,7 +671,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
 
 	sof_audio_card_rt5682.dev = &pdev->dev;
-	mach = (&pdev->dev)->platform_data;
 
 	/* set platform name for each dailink */
 	ret = snd_soc_fixup_dai_links_platform_name(&sof_audio_card_rt5682,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
