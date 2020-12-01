Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C13862CAE15
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 22:13:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42D861799;
	Tue,  1 Dec 2020 22:12:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42D861799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606857223;
	bh=NTSQHldAc3+7G+n2aEec0AoxJV69eXrRc/W9hbnDxZ0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sfmRrkBRDoeShVESCOMKF8RxbrzIe1IkM2uAS8r+MxWqnUNdIx3i2tNrHAkrr6zDd
	 Qu5uDvzN9U3y2s/GQA2yISY0DFm4HqxFdpegJIZ1DclVPxT8LKdRElMZmN4W8WVr8E
	 ER57ODgNDxQtAY5aC0OVY0gsknx4/uFbNLW7YSUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76178F80254;
	Tue,  1 Dec 2020 22:12:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FC3AF8016D; Tue,  1 Dec 2020 22:12:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C5C6F80168
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 22:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C5C6F80168
IronPort-SDR: zfYiXjfhiwiQhnJusBlCVBl97eKk9HvNGEaN3yQTme6nCp+owQOti7w5KXvEw2l+Zax2QqMss3
 3UxlQL0hnN4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="173067740"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="173067740"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 13:11:54 -0800
IronPort-SDR: N+KbXpWeq8sinVd/44lVk9SrnoN6ptrwMiyNPZg3IYGwWKmUv+aHWYb/o/Si/MX7RiVnO7aVLZ
 NRGd590GMaXA==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="372908446"
Received: from ndchoksi-mobl3.amr.corp.intel.com (HELO
 rsridh-mobl1.localdomain) ([10.212.117.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 13:11:54 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: Boards: tgl_max98373: update TDM slot_width
Date: Tue,  1 Dec 2020 13:11:50 -0800
Message-Id: <20201201211150.433472-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
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

From: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>

Speaker amp's SSP bclk configuration was changed in the topology file to be
based on 12.288MHz and dai_ops->hw_params is based on s32le format.
But, the TDM slot size remained set to 24 bits.
This inconsistency created audible noises and needs to be corrected.
This patch updates TDM slot width to 32.

Fixes: bc7477fc2ab4 ("ASoC: Intel: Boards: tgl_max98373: Update TDM configuration in hw_params")

Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index b6e63ea13d64..c2a9757181fe 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -49,11 +49,11 @@ static int max98373_hw_params(struct snd_pcm_substream *substream,
 	for_each_rtd_codec_dais(rtd, j, codec_dai) {
 		if (!strcmp(codec_dai->component->name, MAX_98373_DEV0_NAME)) {
 			/* DEV0 tdm slot configuration */
-			snd_soc_dai_set_tdm_slot(codec_dai, 0x03, 3, 8, 24);
+			snd_soc_dai_set_tdm_slot(codec_dai, 0x03, 3, 8, 32);
 		}
 		if (!strcmp(codec_dai->component->name, MAX_98373_DEV1_NAME)) {
 			/* DEV1 tdm slot configuration */
-			snd_soc_dai_set_tdm_slot(codec_dai, 0x0C, 3, 8, 24);
+			snd_soc_dai_set_tdm_slot(codec_dai, 0x0C, 3, 8, 32);
 		}
 	}
 	return 0;
-- 
2.25.1

