Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDDAEE15D
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 14:36:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B92C71756;
	Mon,  4 Nov 2019 14:35:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B92C71756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572874591;
	bh=QVLPf9c6BKWg1uKwkcY1xkfE3cVRGyzdxiXYepU8p3k=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UD34c+4DzW+OXvSpCBYqfGcqYJmWuc3HcupU5A/0SyRY65sekWYWC2U3dWc4zwhPt
	 /ZAQ+NR6MhO95+Z9kvl5WcuDRl7idPEkzptVNsm5uCbpdI8X4aLIjT/qGHYEBylf+I
	 VKVH2Vsxi4yxE2dhL/f+JKlLkH7FYRhjxRYfmy7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34956F80715;
	Mon,  4 Nov 2019 14:27:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A344F8065B; Mon,  4 Nov 2019 14:27:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D6F9F80321
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 14:27:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D6F9F80321
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="t/+f/bT5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=MMuqwozdnh507sczlhP/Y4zrSkwhWkLRckF0hu3yF5A=; b=t/+f/bT5jpm0
 VGFgEa46/w25Fc1kqFOX8fhuCcxj8Lm2DZK1G6Bzo6UxJxRJSD2ceOi4lLdJEjrSuJp1zVe9A9xGF
 AKxsudTys/rXwTOKZzNJCXh5/IyfvJzFb3dt0NXFbYb7byRPOBt0TpagdSO8y4qexm9NKQFIHnqnl
 KNekg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRcO2-0002eh-9y; Mon, 04 Nov 2019 13:27:14 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id AF703274301E; Mon,  4 Nov 2019 13:27:13 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20191101170916.26517-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191104132713.AF703274301E@ypsilon.sirena.org.uk>
Date: Mon,  4 Nov 2019 13:27:13 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: Simplify the
	hda_dsp_wait_d0i3c_done() function" to the asoc tree
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

   ASoC: SOF: Intel: hda: Simplify the hda_dsp_wait_d0i3c_done() function

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

From 65c56f5dccc87ca2993a50672e144c7378189f2c Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Fri, 1 Nov 2019 12:09:16 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: Simplify the hda_dsp_wait_d0i3c_done()
 function

Remove the retry argument for the hda_dsp_wait_d0i3c_done()
function and use the HDA_DSP_REG_POLL_RETRY_COUNT macro
directly.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191101170916.26517-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dsp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index d23573d9e9c4..8cd5ecc01b62 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -307,9 +307,10 @@ void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev)
 			HDA_DSP_REG_HIPCCTL_BUSY | HDA_DSP_REG_HIPCCTL_DONE, 0);
 }
 
-static int hda_dsp_wait_d0i3c_done(struct snd_sof_dev *sdev, int retry)
+static int hda_dsp_wait_d0i3c_done(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
+	int retry = HDA_DSP_REG_POLL_RETRY_COUNT;
 
 	while (snd_hdac_chip_readb(bus, VS_D0I3C) & SOF_HDA_VS_D0I3C_CIP) {
 		if (!retry--)
@@ -346,7 +347,7 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 	u8 value;
 
 	/* Write to D0I3C after Command-In-Progress bit is cleared */
-	ret = hda_dsp_wait_d0i3c_done(sdev, HDA_DSP_REG_POLL_RETRY_COUNT);
+	ret = hda_dsp_wait_d0i3c_done(sdev);
 	if (ret < 0) {
 		dev_err(bus->dev, "CIP timeout before D0I3C update!\n");
 		return ret;
@@ -357,7 +358,7 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 	snd_hdac_chip_updateb(bus, VS_D0I3C, SOF_HDA_VS_D0I3C_I3, value);
 
 	/* Wait for cmd in progress to be cleared before exiting the function */
-	ret = hda_dsp_wait_d0i3c_done(sdev, HDA_DSP_REG_POLL_RETRY_COUNT);
+	ret = hda_dsp_wait_d0i3c_done(sdev);
 	if (ret < 0) {
 		dev_err(bus->dev, "CIP timeout after D0I3C update!\n");
 		return ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
