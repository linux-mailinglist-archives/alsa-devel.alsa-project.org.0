Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 828F8562DDE
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 10:24:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E40C416A1;
	Fri,  1 Jul 2022 10:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E40C416A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656663848;
	bh=KQT2Js8BSZVnKoLQyDVtKNHzugCIZ6dztQGR4wapsqs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BzxvEpsqrhd42L636aMP94lummf/cBVBr+ml4dppy5RIYx50s5mjheVkTwEve6c30
	 mT6bsxsEF1CrE3PfvdwQ0xPu+lSBYVbChups8NWpFit7VZPYBYFcxurT1IzrpBEc4x
	 Wqm+Zny9mzeRvhDfdf5ibOa6iXbZPi4S2VWNezHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BE88F800E8;
	Fri,  1 Jul 2022 10:23:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C3E3F80155; Fri,  1 Jul 2022 10:23:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 218EFF80107
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 10:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 218EFF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AzsTRo03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656663782; x=1688199782;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KQT2Js8BSZVnKoLQyDVtKNHzugCIZ6dztQGR4wapsqs=;
 b=AzsTRo03Q5VhRY3ds/UtgjEQcOv2ndxc/BdVLZO+KtXpJdFK66GU+Ux8
 0uyV7KQzc19wpGGufsVTuDf34lebPDNLidDdOP5Ae/IJ7U85GcYdDwWqW
 RLbqnHe62SR4LvDKnzxjoO+fmXQE66sb1t17U6WspwZPU+d4n53Uaopkb
 dVyVCcv/XFGo3tDjx5XXCpbXS6K2rA15M7HNgcw9p4E2gATnj+vxbzKeJ
 hVQSkOOiF0vTh17rfLjkB9CHiPFHi993GGAi5Vm93kxDWv6ZdQg8J3qCS
 p+peiVI4FttpBBb65pK7xEac+sJJey7E6T7YifgOAxxK3yuUn8nCIeJHr g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="262388436"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="262388436"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 01:22:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="694423047"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.25])
 by fmsmga002.fm.intel.com with ESMTP; 01 Jul 2022 01:22:54 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: sof_rt5682: fix out-of-bounds array access
Date: Fri,  1 Jul 2022 16:19:08 +0800
Message-Id: <20220701081908.248239-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ajye Huang <ajye.huang@gmail.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, linux-kernel@vger.kernel.org,
 Yong Zhi <yong.zhi@intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Starting from ADL platform we have four HDMI PCM devices which exceeds
the size of sof_hdmi array. Since each sof_hdmi_pcm structure
represents one HDMI PCM device, we remove the sof_hdmi array and add a
new member hdmi_jack to the snd_soc_jack structure to fix the
out-of-bounds problem.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index a24fb71d5ff3..1384716c6360 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -69,11 +69,10 @@ static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
 
 static int is_legacy_cpu;
 
-static struct snd_soc_jack sof_hdmi[3];
-
 struct sof_hdmi_pcm {
 	struct list_head head;
 	struct snd_soc_dai *codec_dai;
+	struct snd_soc_jack hdmi_jack;
 	int device;
 };
 
@@ -447,7 +446,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	char jack_name[NAME_SIZE];
 	struct sof_hdmi_pcm *pcm;
 	int err;
-	int i = 0;
 
 	/* HDMI is not supported by SOF on Baytrail/CherryTrail */
 	if (is_legacy_cpu || !ctx->idisp_codec)
@@ -468,17 +466,15 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 		snprintf(jack_name, sizeof(jack_name),
 			 "HDMI/DP, pcm=%d Jack", pcm->device);
 		err = snd_soc_card_jack_new(card, jack_name,
-					    SND_JACK_AVOUT, &sof_hdmi[i]);
+					    SND_JACK_AVOUT, &pcm->hdmi_jack);
 
 		if (err)
 			return err;
 
 		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
-					  &sof_hdmi[i]);
+					  &pcm->hdmi_jack);
 		if (err < 0)
 			return err;
-
-		i++;
 	}
 
 	if (sof_rt5682_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT) {
-- 
2.25.1

