Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A2F25247C
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 01:55:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE7F116E1;
	Wed, 26 Aug 2020 01:54:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE7F116E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598399712;
	bh=lizs6/J9VnVb2j99ByY/5YgdCFmC17CcWkTyJgu6KRY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eZELLFmHSgMKcQzrqrZrE4/ef8HU9/Yvg6mOZDC2Y3NcUDQqg+baFwJiDMHrT3LGW
	 JenvSHHK746Ss5jJpOVwupC3bzAXPkqLXkeFVoh0j62dEgQinCd0NqHoOC/AfeLKZR
	 AKZ/wjjGVu8jwUmZ4296rGNG0G2D3s6tljHlk/60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0047DF802DD;
	Wed, 26 Aug 2020 01:51:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34476F8026A; Wed, 26 Aug 2020 01:51:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63603F800D1
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 01:51:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63603F800D1
IronPort-SDR: k/hcguLKsqX0TT4pQdhBG5VXKOnk7uTVXOVutBCxs/lMWvGtEU13pkcodTk8326xaxUbZqMqDY
 ZlmBP3FlCWBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="157253463"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="157253463"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:50:58 -0700
IronPort-SDR: NJwWx7HxiP8K266kApjWLB2mV2ka4pOXCLnlPKufl6R6gPE2ztNpe2yBSfcK+rjw3xrt32x2Pz
 pKMO0dv6xSgg==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="443818992"
Received: from cdurvasu-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.42.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:50:57 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/7] ASoC: SOF: intel: hda: support also devices with 1 and 3
 dmics
Date: Tue, 25 Aug 2020 16:50:36 -0700
Message-Id: <20200825235040.1586478-4-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
References: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>,
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

From: Jaska Uimonen <jaska.uimonen@linux.intel.com>

Currently the dmic check code supports only devices with 2 or 4 dmics.
With other dmic counts the function will return 0. Lately we've seen
devices with only 1 dmic thus enable also configurations with 1, and
possibly 3, dmics. Add also topology postfix -1ch and -3ch for new dmic
configuration.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b8157c1f37f3..0e8285b34a7d 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -544,7 +544,7 @@ static int check_nhlt_dmic(struct snd_sof_dev *sdev)
 	if (nhlt) {
 		dmic_num = intel_nhlt_get_dmic_geo(sdev->dev, nhlt);
 		intel_nhlt_free(nhlt);
-		if (dmic_num == 2 || dmic_num == 4)
+		if (dmic_num >= 1 && dmic_num <= 4)
 			return dmic_num;
 	}
 
@@ -992,9 +992,15 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 				dmic_num = hda_dmic_num;
 
 			switch (dmic_num) {
+			case 1:
+				dmic_str = "-1ch";
+				break;
 			case 2:
 				dmic_str = "-2ch";
 				break;
+			case 3:
+				dmic_str = "-3ch";
+				break;
 			case 4:
 				dmic_str = "-4ch";
 				break;
-- 
2.25.1

