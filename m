Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E754B344797
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 15:44:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F8B115DC;
	Mon, 22 Mar 2021 15:43:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F8B115DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616424252;
	bh=OnZwwsjicXbPxrnDfqxneFa7HbQhz2isO8W/Ce2c/E4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lvZZ8Trwa4SFy/ygiBRHb+cak9pcJq0hJxljzrxI7WDxmE69CyktrJcUUe3gHukoF
	 EtBYLkUB/yD1xzvAQTRMH8YSiWxuVFiHhjHJY5SxVP3AAmYXIRPdR8NK839lNz1XLZ
	 Vi0k/XpGXYaMV/PrSNzsFJmKymBd1FrYGvI81WUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A813BF80107;
	Mon, 22 Mar 2021 15:42:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8164F8016B; Mon, 22 Mar 2021 15:42:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6B32F80155
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 15:42:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6B32F80155
IronPort-SDR: whkCFiIeCdNR1++rSOVjGcAy7bMgdk4fSVWeQ+P4fbfkFGdXjqGpqg4sTpuaUkt0eyCYj1Nfd9
 i/9Hz7K5UqFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="189685359"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="189685359"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 07:42:32 -0700
IronPort-SDR: 42waDhGS7euAc9bzydNIgyQJgn2c//Tgfw+kBfXj+AuyNlvaHv2Z1eTmqfIxU6OAG1l7c5eXMV
 /YJeZJcDfoVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="607376510"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga005.fm.intel.com with ESMTP; 22 Mar 2021 07:42:30 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: hda: drop display power on/off in D0i3 flows
Date: Mon, 22 Mar 2021 16:38:30 +0200
Message-Id: <20210322143830.3880293-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

Controller needs to ensure display power is enabled only for
HDA controller reset. Drop the display power-up/down calls from
D0i3 entry/exit paths.

This was previously not possible as codec drivers could not resume the
links, and instead controller kept the reference to display power. The
state of display power had be maintained in the D0i3 entry/exit code.
With commit 87fc20e4a0cb ("ASoC: SOF: Intel: hda: use hdac_ext
fine-grained link management"), this is no longer needed and the code
can be cleaned up.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Keyon Jie <yang.jie@intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 6e24e1cb13f9..df4cb29b9a1b 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -727,8 +727,6 @@ int hda_dsp_resume(struct snd_sof_dev *sdev)
 
 	/* resume from D0I3 */
 	if (sdev->dsp_power_state.state == SOF_DSP_PM_D0) {
-		hda_codec_i915_display_power(sdev, true);
-
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 		/* power up links that were active before suspend */
 		list_for_each_entry(hlink, &bus->hlink_list, list) {
@@ -839,9 +837,6 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 	cancel_delayed_work_sync(&hda->d0i3_work);
 
 	if (target_state == SOF_DSP_PM_D0) {
-		/* we can't keep a wakeref to display driver at suspend */
-		hda_codec_i915_display_power(sdev, false);
-
 		/* Set DSP power state */
 		ret = snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
 		if (ret < 0) {

base-commit: bf939446c357242b3306e88c5f48976940d29679
-- 
2.29.2

