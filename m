Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56618605FF9
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:17:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5BECB912;
	Thu, 20 Oct 2022 14:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5BECB912
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268239;
	bh=Xj8w222ACi84RYUXalfRWFmffwg/1MxjQrKP2Ddxr5M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SJYAkzTyk3GCPgDAzghybKJvoWU2U/06DpmKg8WIalkaYKHTS08FyEuywJpPx1bu9
	 FUqGDdnaFvlaylBZ/no99Eqxy1fb5Nu6Z19U46hd88YtWMehotEIEx6mpgRUioH7OC
	 dvwe0/c40wYLXqf7H+IOG8639TOffhTH6BU9umoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ABFAF805C8;
	Thu, 20 Oct 2022 14:13:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF4E0F805BB; Thu, 20 Oct 2022 14:13:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2464F805BB
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2464F805BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Wo70PWQI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267979; x=1697803979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xj8w222ACi84RYUXalfRWFmffwg/1MxjQrKP2Ddxr5M=;
 b=Wo70PWQIngQCOA80Zt9+z9g+IVctUcei+BYx4Dwver+od5fUx/zGOWLe
 73drZ4VyUo5/JmU3tAmnwr2sBlTwjgCNAaBhzKswOqF1SCvIOKYOo9/qa
 AGNbNT9cdOdxFZ0r1uEa8eSh6uG1SkTWxVzLg0ZL/tLLUqkFcqY9+vKVi
 vnA8D+EZk3GX8kHvJx3Iyx02pK0tFS2933H5G8j87foL2ZKW8ty7e889Z
 xIigvxSJvpXH7s4u7QWOAsm2DmeGHuR2cz++C2LlLnuRkS+QPzKYhFp3I
 nxuZeiNeY3aRfkTdDwYPJMMX0UG42O283CleUAZqoQbawSLhCFkVtpbNi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333256407"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333256407"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:56 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="663010112"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="663010112"
Received: from awrynn-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:53 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 14/19] ASoC: SOF: Intel: hda: Add flag to indicate that the
 firmware is IMR booted
Date: Thu, 20 Oct 2022 15:12:33 +0300
Message-Id: <20221020121238.18339-15-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
References: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 chao.song@intel.com
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

Dynamic loading of external libraries should not be done if the firmware
was booted from IMR since in that case the libraries will be restored along
with the basefw.

The booted_from_imr flag is introduced and set to true if the IMR boot was
successful and to false if cold booting is executed.

The reason for the new flag is that guessing from existing flags, used to
decide if we should try booting from IMR or not is not going to be robust
as the IMR boot itself can fail and in that case a full, cold boot is
executed.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 6 +++++-
 sound/soc/sof/intel/hda.h        | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 147ddc5ee932..5ed524e166d2 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -396,12 +396,16 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 		dev_dbg(sdev->dev, "IMR restore supported, booting from IMR directly\n");
 		hda->boot_iteration = 0;
 		ret = hda_dsp_boot_imr(sdev);
-		if (!ret)
+		if (!ret) {
+			hda->booted_from_imr = true;
 			return 0;
+		}
 
 		dev_warn(sdev->dev, "IMR restore failed, trying to cold boot\n");
 	}
 
+	hda->booted_from_imr = false;
+
 	chip_info = desc->chip_info;
 
 	if (sdev->basefw.fw->size <= sdev->basefw.payload_offset) {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 65657d145dc2..4d9eb321a046 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -481,6 +481,7 @@ enum sof_hda_D0_substate {
 struct sof_intel_hda_dev {
 	bool imrboot_supported;
 	bool skip_imr_boot;
+	bool booted_from_imr;
 
 	int boot_iteration;
 
-- 
2.38.1

