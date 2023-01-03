Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B69E65BB55
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 08:42:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81348CB52;
	Tue,  3 Jan 2023 08:41:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81348CB52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672731753;
	bh=KxhstbNSuFJ+RInMZSQu3SmUKm5bWQPMvSyQYhXUpk8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=dAP1+juzusHvobTsxI0rNXvONcdDNRCT0gwF8B5HFx3Q4B5XHiYAjoKqqqMmWZRs1
	 MWIy+EAy6VWywvhjgQx677nXzHUh/x2De0rcLvuH+Q0o0fyt9WKxd33uCky/bW7b/a
	 5LiuvwzNj8XmDrRBjZAtLgOAjuqhvpdOuFXVzPqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3283F800F8;
	Tue,  3 Jan 2023 08:41:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B25CCF804CB; Tue,  3 Jan 2023 08:41:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1CAAF800F8
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 08:41:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1CAAF800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iWHZ8wBa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672731689; x=1704267689;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KxhstbNSuFJ+RInMZSQu3SmUKm5bWQPMvSyQYhXUpk8=;
 b=iWHZ8wBaY9nFR63enkjeckHsMNZjINN2T0QmQIM6PAVAFp/VcYaqqt9E
 RzPk91Z7K6ZjhjwXzu0VL1jfJM9nu8/cud5zQ/kGYoMZ8qSPOaawvxPmE
 MdRATUkq1NhiWmvKmEW1Zgz63APclN28kLDzBwDFeTVh7tKmfzGBlImNU
 OE2TEbU7vQNqd+ef61mFtsy1EZVR4NpS/X+XseO/U8bUrhW4EV+E0n0+g
 Ljr0zrNkUQryby04OMsltiExvvQaO3AUtp5je2SN5TUeJ8EXi3RNOkrwv
 7RToJxdr16iBxIccawxp1/0ju7fIxiglpUdaWAFm4NFfe45UE7jiNAjLW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="348822892"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; d="scan'208";a="348822892"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2023 23:41:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="723174876"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; d="scan'208";a="723174876"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.25])
 by fmsmga004.fm.intel.com with ESMTP; 02 Jan 2023 23:41:20 -0800
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: sof_ssp_amp: remove unused variable
Date: Tue,  3 Jan 2023 15:37:04 +0800
Message-Id: <20230103073704.722027-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The variable becomes useless since we moved the snd_soc_jack
structure from a static array to sof_hdmi_pcm structure.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 94d25aeb6e7c..f75800d9d6de 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -105,7 +105,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	char jack_name[NAME_SIZE];
 	struct sof_hdmi_pcm *pcm;
 	int err;
-	int i;
 
 	if (!(sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT))
 		return 0;
@@ -124,7 +123,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 		return hda_dsp_hdmi_build_controls(card, component);
 	}
 
-	i = 0;
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
@@ -139,8 +137,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 					  &pcm->sof_hdmi);
 		if (err < 0)
 			return err;
-
-		i++;
 	}
 
 	return hdac_hdmi_jack_port_init(component, &card->dapm);
-- 
2.25.1

