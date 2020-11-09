Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 449B02AC6B2
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Nov 2020 22:11:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD4A71673;
	Mon,  9 Nov 2020 22:11:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD4A71673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604956310;
	bh=2PFQhqRqq3zp9ZjhDYc6iEnDWLtbHTD/+WUlvCBjCZs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EQWV70ZnAq9/C9Nb+OlFQkzRTqm0Csmdi1R4/wd/wigyWGEf6XTPVk2O7IZJwRf54
	 Qedi0Bi6JvMmatDzuQTqagumwYxhqVYFRRrqDXpK5li48oz4Jz5YQMxHatR2aCA5Rg
	 kb4+Wxh2H+bwFttqqPduetx3V95n7XadVPxnnvn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00A67F8022B;
	Mon,  9 Nov 2020 22:10:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA431F8020C; Mon,  9 Nov 2020 22:10:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72DB1F800BA
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 22:10:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72DB1F800BA
IronPort-SDR: aXy2ojnpr3shLb0SoeCz1PVF3DKadrKpXpOi1ljbYl+Bs9DQUsK9cl2QqRC5c7S6HPswj3LKTB
 6EM6mYtl6JsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="169087538"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; d="scan'208";a="169087538"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 13:10:04 -0800
IronPort-SDR: iv4hMx76HayE5tM/GIO3TmS1v4jqz150h1MMVV55Abt/e+DmlTIAfoJsPBHL7jYsGTxuA4GDXy
 tg4hzapcWTDw==
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; d="scan'208";a="322585237"
Received: from xvera-mobl.amr.corp.intel.com (HELO rsridh-mobl1.localdomain)
 ([10.209.52.116])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 13:10:03 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: Boards: tgl_max98373: add dpcm_capture flag for
 speaker_smart_amp
Date: Mon,  9 Nov 2020 13:09:58 -0800
Message-Id: <20201109210958.84198-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Dharageswari R <dharageswari.r@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Dharageswari R <dharageswari.r@intel.com>

Smart_amp_speaker device has the playback stream and capture stream
associated to it. Hence add the dpcm_capture = 1 flag while dailink
creation.
This patches fixes:
ERR kernel [timestamp] SSP1-Codec: ASoC: no backend capture stream

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Dharageswari R <dharageswari.r@intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index e7d9a82ca70d..891f908659f5 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -734,6 +734,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			links[id].num_codecs = ARRAY_SIZE(max_98373_components);
 			links[id].init = max98373_spk_codec_init;
 			links[id].ops = &max_98373_ops;
+			/* feedback stream */
+			links[id].dpcm_capture = 1;
 		} else if (sof_rt5682_quirk &
 				SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
 			links[id].codecs = max98360a_component;
-- 
2.25.1

