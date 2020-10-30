Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E341C29FE06
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 07:50:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83F281660;
	Fri, 30 Oct 2020 07:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83F281660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604040643;
	bh=9s78C3WTsH7Lp9NPGJtt/tKUOme5oARiTKKPAxXnSSg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gv/gm8xm8i7SVoCyp0m/Wvixc7QydwF9689PZJfdf0npe918iFyuhBwpNYjreC4K+
	 eIiGc1L6WGtFesub+Xg6uqhCl9I+spsQ2Fo+MMi43iwoOApKIoHDI8Z1qKFri2EAZD
	 t0C8GJuQvTiI3/244/UYUEaclZQK9Rqx8J7p+3MQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24453F804B3;
	Fri, 30 Oct 2020 07:48:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 559C3F8026D; Fri, 30 Oct 2020 07:48:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52E57F80212
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 07:48:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52E57F80212
IronPort-SDR: 5u7b5agwilRp3yX0OOIQkfQndsYZ/VdEy1tqxXPsufr5ZTxN5cKuscMWnySTgNXR2MgciVOVKu
 OFWTKTSFcTCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="168697920"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="168697920"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 23:48:11 -0700
IronPort-SDR: Qq9gARc4X2zMgLQ0L96Y7TirGTSTIOtacl3mchzb6Zf8ea2f1jMuXyQkmfmmGCwPskjVa38Pwo
 PecHiCIonBsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="361760847"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2020 23:48:08 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: intel: sof_rt5682: Add quirk for Dooly
Date: Fri, 30 Oct 2020 14:36:54 +0800
Message-Id: <20201030063654.25877-3-brent.lu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201030063654.25877-1-brent.lu@intel.com>
References: <20201030063654.25877-1-brent.lu@intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jason Yan <yanaijie@huawei.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

This DMI product family string of this board is "Google_Hatch" so the
DMI quirk will take place. However, this board is using rt1015 speaker
amp instead of max98357a specified in the quirk. Therefore, we need an
new DMI quirk for this board.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 7701957e0eb7..dfcdf6d4b6c8 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -100,6 +100,20 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(1)),
 	},
+	{
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dooly"),
+		},
+		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_MCLK_24MHZ |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT1015_SPEAKER_AMP_PRESENT |
+					SOF_RT1015_SPEAKER_AMP_100FS |
+					SOF_RT5682_SSP_AMP(1)),
+	},
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
-- 
2.17.1

