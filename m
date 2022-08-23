Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 022F159E3F2
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 14:45:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9054515E5;
	Tue, 23 Aug 2022 14:44:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9054515E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661258737;
	bh=jYV4b6OYBJ3uW2Nj+NTNmh8S3HuxxqbU8PSV6956dJc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a3/jRoWIYHK+nxf8RgKAH86Cz2jfP0E7uvIt6qRanuII35oGNezC6OpxXi1XmAjCA
	 d/4TVYedCJiYS+iTc0E4mE6VWojWcfitecKchec3fOLBE0EpXOV34HL/DJfJqpi2TK
	 YbxirCNHXbzogNtNOfJK308+krxzzozwFGuexcao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C416DF804E7;
	Tue, 23 Aug 2022 14:44:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA175F804E6; Tue, 23 Aug 2022 14:44:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39FB1F8020D
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 14:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39FB1F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UL4TtnQx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661258669; x=1692794669;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jYV4b6OYBJ3uW2Nj+NTNmh8S3HuxxqbU8PSV6956dJc=;
 b=UL4TtnQxqzj0PPfN8RKQl8eLCnLjRxZu0CBXjesSc5XjFzWEAx1aud5c
 QTF97CwE37eEvD+P2dOakyszUdQyGgEDYdqSOD+MnEGx5w9akuj9H9233
 RPWEwQwdzdupr/Yg35Np0SP8uFbUFU8ILe+PiwRJt/OtGy+Nnw7PTWuKx
 D/2PrWIqJj21U/n0eApONM34e8DZU7YOapFN2aR32JBw3EDQRo1c0AeGT
 PP1aJvPvdNB6RjX//hfdoNIvhIXo6w3sOi0F8FzcGXs29q6qZEx2Tkhwp
 LXCROqzlKqh97fsY3wISf1ZsI7Il7Dz97flZ0JpWVhploSqbjThuToo2H g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="319722437"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="319722437"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 05:44:08 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="937447622"
Received: from mjglynn-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.28.206])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 05:44:06 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: hda: Skip IMR boot after a firmware crash
 or boot failure
Date: Tue, 23 Aug 2022 15:43:59 +0300
Message-Id: <20220823124359.24865-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

To make sure that we start from a clean state next time when the DSP is
powered up after a firmware crash or boot failure we must skip the IMR
booting attempt.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index eddfd77ad90f..671c3e02d7df 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -620,8 +620,13 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 	/*
 	 * The memory used for IMR boot loses its content in deeper than S3 state
 	 * We must not try IMR boot on next power up (as it will fail).
+	 *
+	 * In case of firmware crash or boot failure set the skip_imr_boot to true
+	 * as well in order to try to re-load the firmware to do a 'cold' boot.
 	 */
-	if (sdev->system_suspend_target > SOF_SUSPEND_S3)
+	if (sdev->system_suspend_target > SOF_SUSPEND_S3 ||
+	    sdev->fw_state == SOF_FW_CRASHED ||
+	    sdev->fw_state == SOF_FW_BOOT_FAILED)
 		hda->skip_imr_boot = true;
 
 	hda_sdw_int_enable(sdev, false);
-- 
2.37.2

