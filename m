Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE009374311
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:50:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85BE716DB;
	Wed,  5 May 2021 18:49:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85BE716DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620233408;
	bh=DYCwvdfLD7LR2Dz4MH24dVpMBkMYt0XhPDPfZL94W7Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UJjw4V1UXQn3OSSsLlKGS/6nPXbxoKzRbfyUVUF3bNsm2+kczRJ8mVx0eiO3XJ6gM
	 Gnr+MKet5Tvr42qybA0TFju7OB2es6hM9TJVnj/wu01Xikc4xFRwWmsI9v88y47ZLw
	 fePKouZnn0h4744LYS2Sid/pzswuiWLVr+DvBZ94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74099F805DF;
	Wed,  5 May 2021 18:37:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1383F805AD; Wed,  5 May 2021 18:37:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 249CFF805A0
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 249CFF805A0
IronPort-SDR: P7DWIglXvWDPotXLNfVbGrKQLQTxh+guj8y9+uHC9C/Gye2yoP3M5MXmnDcFq3/+nQLqPWdJZO
 dpvKSYb8lCUQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="196219199"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="196219199"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:25 -0700
IronPort-SDR: l5oPjxZ+ZsB/dLaQj2tasDdqSZWPARovrYQ8t1C9t9wCsFx6MoXWFA9DWklxKQrCYOxqX94cKC
 M58uFTPuhBQA==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="458800046"
Received: from rtsagpan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.51.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/13] ASoC: Intel: sof_rt5682: Enable Bluetooth offload on
 tgl and adl
Date: Wed,  5 May 2021 11:37:01 -0500
Message-Id: <20210505163705.305616-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
References: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jaska Uimonen <jaska.uimonen@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Yong Zhi <yong.zhi@intel.com>
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

Enable BT audio offload for TGL/ADL drivers with the following
board configs specifically:

SSP0 - Headsets
SSP1 - Speaker amps
SSP2 - Bluetooth audio

Reviewed-by: Jaska Uimonen <jaska.uimonen@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 7eecfe1b4404..6be78a206242 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -949,7 +949,9 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4)),
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.name = "jsl_rt5682_rt1015",
@@ -967,7 +969,9 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_MAX98373_SPEAKER_AMP_PRESENT |
 					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4)),
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.name = "jsl_rt5682_max98360a",
@@ -995,7 +999,9 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_RT1011_SPEAKER_AMP_PRESENT |
 					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4)),
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.name = "jsl_rt5682_rt1015p",
@@ -1013,7 +1019,9 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_MAX98373_SPEAKER_AMP_PRESENT |
 					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4)),
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.name = "adl_max98357a_rt5682",
-- 
2.25.1

