Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C103C563500
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 16:19:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 616A616C0;
	Fri,  1 Jul 2022 16:19:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 616A616C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656685195;
	bh=3wzRj5NJlP7HHnjC6iFDXafrek+CylxTqxEu0SV+jSg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dLfsMagEQvM+ELzPGkCpNJWCfbNExaeg8l0QSamPLdyD2Yqmez+9khrpN5vLpzqPP
	 g62u3+lI3LZVm5XUrWLp54uo/ijqx0ToJb2yJZcvtH5mHRbEb06D5rMl2/CSYGFHkY
	 e+CpsCtREiITFD4v4MvFYsBRNe5rKhzCAYwZolFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10E4DF804F3;
	Fri,  1 Jul 2022 16:18:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80431F80152; Fri,  1 Jul 2022 16:18:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE172F80152
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 16:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE172F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Zwk+TJ/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656685120; x=1688221120;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3wzRj5NJlP7HHnjC6iFDXafrek+CylxTqxEu0SV+jSg=;
 b=Zwk+TJ/A6sUIuLNSgX29MjJgFNBC4RPKvbA5bqVdIOQqJZe+fE18nb9B
 kVC9rq4CNnwuZRSMKNJ5a/DrkYCgmc/6sKcayIOPOjT/MbWK//xDlNfM0
 rHatpIMV1suyV33ZZYvT1t1dzJ4shZ1gpwiZ0zYgSAltaP3sbWgHXUT2A
 1xRCpcv68PT03ZxZ0Z0DLNULGmsceQk1FtGumLPT0FQvOgieZgP/F/7kS
 alPjMqQDcJ21b2WMT7o0OQg0nQbA67/YhZHIK6cH7AvFYHvQowBL8bE0I
 xypLF1wY0kMtqSUAHAV4Ggrs6urH3Q9lBZs1eIpFLcSOGML6QWEtkl+eS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="282690818"
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="282690818"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 07:18:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="838058898"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.25])
 by fmsmga006.fm.intel.com with ESMTP; 01 Jul 2022 07:18:33 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: Intel: sof_rt5682: fix out-of-bounds array access
Date: Fri,  1 Jul 2022 22:15:17 +0800
Message-Id: <20220701141517.264070-1-brent.lu@intel.com>
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
new member hdmi_jack to the sof_hdmi_pcm structure to fix the
out-of-bounds problem.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

