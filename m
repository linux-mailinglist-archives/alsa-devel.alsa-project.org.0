Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B0E243EAC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 20:03:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 364611677;
	Thu, 13 Aug 2020 20:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 364611677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597341832;
	bh=ONtg5Gktcy/A4f2isI9pOJMHEhB3VoTI+lwwgatSnx0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ka2Sx8/TmniYKB+w+DU+wDxXCIvWAaQDiOghDP1LvLEOIu0jkzQcRoMQAVXfU563J
	 t8vCtFsVb3T0stLJR4LeLy/lpGSxnnSxtVY21UZveedLwgVIZ0jVEKEGTFqkhohKZ1
	 +k1SFWCOv8sP572i+7ZvZ3xHJ19OIhvmmhPzLNMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38C49F802EA;
	Thu, 13 Aug 2020 19:59:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEA98F802A1; Thu, 13 Aug 2020 19:59:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08ED4F8015B
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 19:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08ED4F8015B
IronPort-SDR: 2YIX+g9YPJW/UEDGaD3ni/paFtaTxvP4M0tDhtVYZaMnbAlUpUhFWyjP/+FJ/UBS1lpWy9mGNb
 1riErHU8lGnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="239124830"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="239124830"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 10:58:57 -0700
IronPort-SDR: x506urM7VtlLHheLJdx0D/OQCOeidm67mj99BJqJLRgT7w03a/fofprKDkqENI0OQq9sPXrZlD
 d2hWKw7xqdEQ==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="295510759"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 10:58:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ASoC: Intel: sof_sdw: clarify operator precedence
Date: Thu, 13 Aug 2020 12:58:39 -0500
Message-Id: <20200813175839.59422-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200813175839.59422-1-pierre-louis.bossart@linux.intel.com>
References: <20200813175839.59422-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

Fix cppcheck warning:

sound/soc/intel/boards/sof_sdw.c:739:46: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
 hdmi_num = sof_sdw_quirk & SOF_SDW_TGL_HDMI ?
                                             ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 2463d432bf4d..baff9e99f626 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -728,7 +728,7 @@ static int sof_card_dai_links_create(struct device *dev,
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
 		codec_info_list[i].amp_num = 0;
 
-	hdmi_num = sof_sdw_quirk & SOF_SDW_TGL_HDMI ?
+	hdmi_num = (sof_sdw_quirk & SOF_SDW_TGL_HDMI) ?
 				SOF_TGL_HDMI_COUNT : SOF_PRE_TGL_HDMI_COUNT;
 
 	ssp_mask = SOF_SSP_GET_PORT(sof_sdw_quirk);
-- 
2.25.1

