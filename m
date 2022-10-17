Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4112F601A80
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Oct 2022 22:43:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6369511F;
	Mon, 17 Oct 2022 22:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6369511F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666039411;
	bh=o9dp0Ptq/gD60/ZH1buZj5nTrvln923G4TEBO1b/ZQo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q8kHwEDlLEuqhse5Nox4PP2BICKF+fjQ1IC+JjTXi/qvrsxk2Pk+3PmIbN7gg+TzW
	 aI2BD+cKIGWVq435mq+nd9XzxJdflLqzTxgIj368CMNktxsj6nWGpliJuF1e1FcgBZ
	 aYeLsmcJ9rT/1TJZCZiTUD0NHZHmirc8ocxg5o24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF1C4F804AD;
	Mon, 17 Oct 2022 22:42:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 030D9F80533; Mon, 17 Oct 2022 22:42:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0841CF80535
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 22:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0841CF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gruZi4wy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666039344; x=1697575344;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o9dp0Ptq/gD60/ZH1buZj5nTrvln923G4TEBO1b/ZQo=;
 b=gruZi4wyrnoz5N5jh/6dC0qnBDym1rtMpllBKld/JwkLBrK3HQtex2dM
 0d288djVP3Aj/uz6LvIzAvqynLp8FGeK1BtLs4tHroZvagNep/kO0BeMl
 mceiF3Q1CzYd1pY8DIvqR4UDl+vw6zzSfJ6gBeHZJgBoFO5UIVzyPFiQR
 oQ4qixqG5RyijP4jch2QFsne87NfQ0HtKpgJmJXZLcplkOgu3foq3jO21
 slhx2+vumM2Zc3Ou/5fLsthu2mpU4NkhO0ZXIJLpnUUvpR+2nU2Zvm4fS
 X/IX+PTy7NmuSSlZ9bK5Uwf6dkjVvhWT8zBKl2Y4IRvIZSpYGOUg14wzI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="285635848"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="285635848"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:42:20 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="628439419"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="628439419"
Received: from cmontgom-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.54.140])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:42:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: sof_rt5682: Add quirk for Rex board
Date: Mon, 17 Oct 2022 15:42:07 -0500
Message-Id: <20221017204207.207608-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

Add mtl_mx98357_rt5682 driver data for Chrome Rex board support.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/intel/boards/sof_rt5682.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 1bf9455eaf935..adc964d363a29 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -225,6 +225,18 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_RT5682_SSP_AMP(2) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
+	{
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Rex"),
+		},
+		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(2) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(0) |
+					SOF_RT5682_NUM_HDMIDEV(4)
+					),
+	},
 	{}
 };
 
-- 
2.34.1

