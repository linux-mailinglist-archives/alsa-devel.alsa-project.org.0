Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD87E86BC4
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 22:42:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50D9C1677;
	Thu,  8 Aug 2019 22:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50D9C1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565296929;
	bh=zmimOjHB8QLGVteQAlWQa7JK9/wjKueiU6N4eU/hMUY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TeWS2e5TQiGSbn4fFtTkwJfL9F9dOos19H395ghOa7eOSWZmd2LCk3Rhq1XJ0chgX
	 3d3TMihYyej5drkSN+IxS/sRL2vDigvqCJA5Oc33ipR6s0dUonCCER33SHvsRRV2m2
	 CXm9Gst9ho0T2V10z6J32ldiMmEyZRTOlLUExSrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47BF6F80671;
	Thu,  8 Aug 2019 22:34:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69263F805A1; Thu,  8 Aug 2019 22:33:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E6E5F805A8
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 22:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E6E5F805A8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LdZsyu5B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=OKbvQiSdwYkFam6LubEP6Mroq0f9wpLfLNZRGfFthfw=; b=LdZsyu5BayQ2
 Ow6HxzZdDS8JccHBi1hDNRLPy66VC9SrnoXHNtZFbtqkl5m7pb9KHOL3Fty0IelNq8FsYzp7t96lv
 pGuJUP7+QfUKTr43X5lcjlATWjzKk9vdHcoAKKXueySOHu/crql0rUkeU9CQIsbT4xO8bSzU2hdip
 u/GLM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvp6R-000417-Gs; Thu, 08 Aug 2019 20:33:39 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 095C32742BE9; Thu,  8 Aug 2019 21:33:38 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Libin Yang <libin.yang@intel.com>
In-Reply-To: <20190808192734.18286-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190808203339.095C32742BE9@ypsilon.sirena.org.uk>
Date: Thu,  8 Aug 2019 21:33:38 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: intel: skl_hda_dsp_common: create HDMI
	jack kctl" to the asoc tree
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

   ASoC: intel: skl_hda_dsp_common: create HDMI jack kctl

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

From 0e4cc44f5066b22938f384cd57db99d66311de90 Mon Sep 17 00:00:00 2001
From: Libin Yang <libin.yang@intel.com>
Date: Thu, 8 Aug 2019 14:27:34 -0500
Subject: [PATCH] ASoC: intel: skl_hda_dsp_common: create HDMI jack kctl

This patch call snd_jack_add_new_kctl() to create the HDMI jack kctls.
Userspace needs these kctls to detect the hdmi monitor hotplug.

In /usr/share/alsa/ucm, the config file needs to assign a jack kctl to
"JackControl" to let PA get the jack hotplug status.

Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190808192734.18286-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/skl_hda_dsp_common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index 55fd82e05e2c..58409b6e476e 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -147,6 +147,11 @@ int skl_hda_hdmi_jack_init(struct snd_soc_card *card)
 		if (err)
 			return err;
 
+		err = snd_jack_add_new_kctl(pcm->hdmi_jack.jack,
+					    jack_name, SND_JACK_AVOUT);
+		if (err)
+			dev_warn(component->dev, "failed creating Jack kctl\n");
+
 		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
 					  &pcm->hdmi_jack);
 		if (err < 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
