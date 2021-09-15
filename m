Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8165140C527
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 14:24:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 171F2184C;
	Wed, 15 Sep 2021 14:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 171F2184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631708660;
	bh=6A6OKQxehdrbUtvrRAyuBlvT1pOFxq/fqgDLUIzfoHw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k9EJ1sq+A5QsVMm9ndg8pyshw6dTmdOu4xRm6Nug1PwkfueyrECBe2EQovTAmh58I
	 rHqdJpMgM8zVt+T6YeaTtnunAcznn1WxyQ8VsEFXOuy0fRJxw3XUxlyJ/I91PuAh/+
	 wRmstT+eClIyXl2Vmetc19ByOpJXRcrmHgj/dRlU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2202F804FE;
	Wed, 15 Sep 2021 14:21:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6019F804ED; Wed, 15 Sep 2021 14:21:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FDB2F80227
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 14:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FDB2F80227
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="219117497"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="219117497"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:29 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="544901590"
Received: from msavu-mobl1.ti.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:27 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 04/12] ASoC: SOF: imx: imx8: Bar index is only valid for IRAM
 and SRAM types
Date: Wed, 15 Sep 2021 15:21:08 +0300
Message-Id: <20210915122116.18317-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
References: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 daniel.baluta@gmail.com, ranjani.sridharan@linux.intel.com,
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

i.MX8 only uses SOF_FW_BLK_TYPE_IRAM (1) and SOF_FW_BLK_TYPE_SRAM (3)
bars, everything else is left as 0 in sdev->bar[] array.

If a broken or purposefully crafted firmware image is loaded with other
types of FW_BLK_TYPE then a kernel crash can be triggered.

Make sure that only IRAM/SRAM type is converted to bar index.
Fixes: 202acc565a1f0 ("ASoC: SOF: imx: Add i.MX8 HW support")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 326aa65166c2..150f1bc3fb95 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -365,7 +365,14 @@ static int imx8_remove(struct snd_sof_dev *sdev)
 /* on i.MX8 there is 1 to 1 match between type and BAR idx */
 static int imx8_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 {
-	return type;
+	/* Only IRAM and SRAM bars are valid */
+	switch (type) {
+	case SOF_FW_BLK_TYPE_IRAM:
+	case SOF_FW_BLK_TYPE_SRAM:
+		return type;
+	default:
+		return -EINVAL;
+	}
 }
 
 static void imx8_ipc_msg_data(struct snd_sof_dev *sdev,
-- 
2.33.0

