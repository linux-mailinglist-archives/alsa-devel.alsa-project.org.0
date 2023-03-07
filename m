Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F34C46ADB06
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 10:53:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9947E1406;
	Tue,  7 Mar 2023 10:52:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9947E1406
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678182812;
	bh=9P0TWaHkxGRXEmcC/CAjaoe2z8FzNzLHerd2ccyEQkI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=b0vBUoWFzL17JrBWF0cB6q4pyqeo49ZtzVmd2tQOqvw7BLl6r8Yov8ExIbUxzxSl0
	 Wd23PvxImm6Vi1uqPEXWO3m3PMhRYGy+9JUagbaaYUV0W0nD9oGp5tBEApR9WtB+Lf
	 t2oUqaCgymnroMXYZVBnYiTrz+cz2cDjwRC9tzU8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 026E5F804B1;
	Tue,  7 Mar 2023 10:52:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8E0DF80527; Tue,  7 Mar 2023 10:52:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4145F804FE
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 10:52:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4145F804FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MA7QJ0as
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678182755; x=1709718755;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9P0TWaHkxGRXEmcC/CAjaoe2z8FzNzLHerd2ccyEQkI=;
  b=MA7QJ0asJa+/+lXFOt+/lnITd2FoRlNTBpZ/20Mhlmg4PRxnWJJHn8NH
   EEB+ebqyypGD/QdkIkme3M5tPLx/ZOzKJDwnC7n31zWfGbCX6VCfEd6+2
   V5O5qGUZSIeSuwQYZ0h3bulA/qqXi6eVYsfoGCb3Fh7YDtzUc1odmcdYH
   1kDjbY3lwcvHS8atJ7b+dg8g/JQayMi+O6hwM5QDYOD0V6i9ile4sH2JP
   zAwivj9Yy+NUHy1NQKDYy2B9DTHEYdNtG5l1SdV978hvLEUOY27cHerXr
   tRMLeBqRplBmraHY3LunBSK96jw+Zk2ZFErhTltCup5KxJmtQG+X+jbXN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="334526786"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="334526786"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:52:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819699597"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="819699597"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:52:29 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: mtl: Access MTL_HFPWRCTL from HDA_DSP_BAR
Date: Tue,  7 Mar 2023 11:52:51 +0200
Message-Id: <20230307095251.3058-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3EJE3UU7CG2BT2TUKVPC7CSS6WFUXX32
X-Message-ID-Hash: 3EJE3UU7CG2BT2TUKVPC7CSS6WFUXX32
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, yong.zhi@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3EJE3UU7CG2BT2TUKVPC7CSS6WFUXX32/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Yong Zhi <yong.zhi@intel.com>

The Host Power Management/Clock Control (ULP) Registers in
the HDA BAR shadow the values of the same registers in the DSP BAR,
so let's modify the latter - as done already for other accesses.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 216fd07a3a93..8f0ed1cbf3b5 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -256,7 +256,7 @@ static int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 		dev_err(sdev->dev, "failed to power up gated DSP domain\n");
 
 	/* make sure SoundWire is not power-gated */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, MTL_HFPWRCTL,
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_HFPWRCTL,
 				MTL_HfPWRCTL_WPIOXPG(1), MTL_HfPWRCTL_WPIOXPG(1));
 	return ret;
 }
-- 
2.39.2

