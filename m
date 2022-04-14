Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76811501323
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 17:16:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B1F616F8;
	Thu, 14 Apr 2022 17:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B1F616F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649949365;
	bh=pBtmS4CNcQ3M1U3j4ZfCOikWC5Aj0zjGDiU1U1DtET0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CLscEQcNr6PXCpO5GoR2LXO1jeMFbkQGSKNqHwp3LiQu/8Mb9D7kmiRnl9/aLp9wp
	 AGIdOspzKvs0n2zvljifULBQE0PufJB1x7Ltujcp7QhqpT4GEl6A4HBMNCsFQeakQw
	 DVqdbGcVGE4PGPsa/ewxQDyminrFyPYB6srNAy+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28F35F801F7;
	Thu, 14 Apr 2022 17:15:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBEDCF80162; Thu, 14 Apr 2022 17:15:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECDB8F80114
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 17:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECDB8F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XKsxq4XN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649949299; x=1681485299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pBtmS4CNcQ3M1U3j4ZfCOikWC5Aj0zjGDiU1U1DtET0=;
 b=XKsxq4XNZkGipEF4X/e8N00RdWLxGhQJbwVrJCskobjPOib0PgMXe/fS
 NKiMCHYCZomHAHtlad1oqVE7HI2AuIsOWCZNNEw4H+hLyJVV8iMj6LFt+
 p6fZqi838ckt71EDEj946k88eBQXthADyyyC33zxrHBoWBltHUudpxMyr
 OPlUzdYjW2/37d7Gc3ScAx6iCE5eZ6k7kqTOEpfJ/2CwV8PN3dLIylaUz
 jzPaaNWIR4VOy/DxTsTqpW7936ECulKqJCAjqN74kUSkE5y2Rgd7OYtYz
 cgOaDMDsuh+a15OGmSavAJ6UnO1EGII380U0CGIkPq0cWr375qlrmNmAa A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="243539913"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="243539913"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="645656451"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2022 08:14:52 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda/hdmi: fix warning about PCM count when used with SOF
Date: Thu, 14 Apr 2022 18:05:16 +0300
Message-Id: <20220414150516.3638283-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mohan Kumar <mkumard@nvidia.com>, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com
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

With commit 13046370c4d1 ("ALSA: hda/hdmi: let new platforms assign the
pcm slot dynamically"), old behaviour to consider the HDA pin number,
when choosing PCM to assign, was dropped.

Build on this change and limit the number of PCMs created to number of
converters (= maximum number of concurrent display/receivers) when
"mst_no_extra_pcms" and "dyn_pcm_no_legacy" quirks are both set.

Fix the check in hdmi_find_pcm_slot() to ensure only spec->pcm_used
entries are considered in the search. Elsewhere in the driver
spec->pcm_used is already checked properly.

Doing this avoids following warning at SOF driver probe for multiple
machine drivers:

[  112.425297] sof_sdw sof_sdw: hda_dsp_hdmi_build_controls: no
PCM in topology for HDMI converter 4
[  112.425298] sof_sdw sof_sdw: hda_dsp_hdmi_build_controls: no
PCM in topology for HDMI converter 5
[  112.425299] sof_sdw sof_sdw: hda_dsp_hdmi_build_controls: no
PCM in topology for HDMI converter 6

BugLink: https://github.com/thesofproject/linux/issues/2573
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 3e086eebf88d..f9d67058d69d 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1395,7 +1395,7 @@ static int hdmi_find_pcm_slot(struct hdmi_spec *spec,
 
  last_try:
 	/* the last try; check the empty slots in pins */
-	for (i = 0; i < spec->num_nids; i++) {
+	for (i = 0; i < spec->pcm_used; i++) {
 		if (!test_bit(i, &spec->pcm_bitmap))
 			return i;
 	}
@@ -2325,7 +2325,9 @@ static int generic_hdmi_build_pcms(struct hda_codec *codec)
 	 * dev_num is the device entry number in a pin
 	 */
 
-	if (codec->mst_no_extra_pcms)
+	if (spec->dyn_pcm_no_legacy && codec->mst_no_extra_pcms)
+		pcm_num = spec->num_cvts;
+	else if (codec->mst_no_extra_pcms)
 		pcm_num = spec->num_nids;
 	else
 		pcm_num = spec->num_nids + spec->dev_num - 1;

base-commit: 4516d04608b40d9ad150df6c2faef4a12d038ff6
-- 
2.35.1

