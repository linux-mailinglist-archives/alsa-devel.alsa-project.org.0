Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D233D66C8
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 20:31:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 438551B10;
	Mon, 26 Jul 2021 20:30:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 438551B10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627324292;
	bh=fVCQL1HkioV7UzC1dkra9iR65lMDKu58kNKweYkYPN4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F+9QG/824Fj7UhjL4j5EpbLuN7tsJw5vTTKBnbyOLkTS9jISzIU3AERhiXqPSJUq1
	 rVpjKqUDSZzJWH1xexZHuprOTq5+0T58vrth5eq8Ko7nx+6OY5EjU9p6DslHV/r4rH
	 WJ/qdEqdTRjhOzE4bcxYiOCMONRg5tjwW2lv1f8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33F60F8028B;
	Mon, 26 Jul 2021 20:30:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4B57F8025A; Mon, 26 Jul 2021 20:29:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EA24F8020D
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 20:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EA24F8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="191889279"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="191889279"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 11:29:07 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="455853557"
Received: from tskelley-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.14.236])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 11:29:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Intel: hda: enforce exclusion between HDaudio and
 SoundWire
Date: Mon, 26 Jul 2021 13:28:55 -0500
Message-Id: <20210726182855.179943-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard Liao <bard.liao@intel.com>
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

On some platforms with an external HDaudio codec, the DSDT reports the
presence of SoundWire devices. Pin-mux restrictions and board reworks
usually prevent coexistence between the two types of links, let's
prevent unnecessary operations from starting.

In the case of a single iDISP codec being detected, we still start the
links even if no SoundWire machine configuration was detected, so that
we can double-check what the hardware is and add the missing
configuration if applicable.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
---
 sound/soc/sof/intel/hda.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index e1e368ff2b12..891e6e1b9121 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -187,12 +187,16 @@ static int hda_sdw_probe(struct snd_sof_dev *sdev)
 int hda_sdw_startup(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hdev;
+	struct snd_sof_pdata *pdata = sdev->pdata;
 
 	hdev = sdev->pdata->hw_pdata;
 
 	if (!hdev->sdw)
 		return 0;
 
+	if (pdata->machine && !pdata->machine->mach_params.link_mask)
+		return 0;
+
 	return sdw_intel_startup(hdev->sdw);
 }
 
@@ -1002,6 +1006,14 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 			hda_mach->mach_params.dmic_num = dmic_num;
 			pdata->machine = hda_mach;
 			pdata->tplg_filename = tplg_filename;
+
+			if (codec_num == 2) {
+				/*
+				 * Prevent SoundWire links from starting when an external
+				 * HDaudio codec is used
+				 */
+				hda_mach->mach_params.link_mask = 0;
+			}
 		}
 	}
 
-- 
2.25.1

