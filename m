Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE4D3143B6
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 00:26:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E021886;
	Tue,  9 Feb 2021 00:25:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E021886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612826809;
	bh=15kD3DoDgI1a+I7FMY06AmFCIEqM8+brab7CxtvUB00=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NA48GjdegXfUtwuHOD9Q79TqRHcq+67GOgRAUFxlR0PedrVAQnKecQm2g/+W5qy+a
	 OQd+BHThVQsmJnfIB+cwu8QG8z7ECOuR2fcIGOtWTdYr15qne3cJvesIUaUXBP/z80
	 sikc8DZlgHcmcLmrPgHX6zkvUsTnlkmEzOmUjXNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D9FCF802C9;
	Tue,  9 Feb 2021 00:23:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4882F802A0; Tue,  9 Feb 2021 00:23:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A825F80277
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 00:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A825F80277
IronPort-SDR: emD0Sx/kVW4K5D8sP5lTzix0/o+8LAdRaDRtknHpYobVFPjJx7Hxa1SAWSRwLkUPRcPC3Iu+zB
 bjOTLui8ULSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="243295600"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="243295600"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:22:18 -0800
IronPort-SDR: HmwjYmzDEilhioakjr52Qt39/48t6RNU9+a3kLfLgUIauzchfjZMCk7RKvIgWnGlHZ/5+WSqyF
 MoTx180zlVBA==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="585854683"
Received: from pmane-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.145.183])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:22:17 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ASoC: SOF: HDA: (cosmetic) simplify hda_dsp_d0i3_work()
Date: Mon,  8 Feb 2021 17:21:48 -0600
Message-Id: <20210208232149.58899-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208232149.58899-1-pierre-louis.bossart@linux.intel.com>
References: <20210208232149.58899-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

Simplify hda_dsp_d0i3_work() by returning immediately from it
if D0i3 cannot be set.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Keyon Jie <yang.jie@intel.com>
Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 72c0b8e9a196..5788fe356960 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -934,19 +934,15 @@ void hda_dsp_d0i3_work(struct work_struct *work)
 						      d0i3_work.work);
 	struct hdac_bus *bus = &hdev->hbus.core;
 	struct snd_sof_dev *sdev = dev_get_drvdata(bus->dev);
-	struct sof_dsp_power_state target_state;
+	struct sof_dsp_power_state target_state = {
+		.state = SOF_DSP_PM_D0,
+		.substate = SOF_HDA_DSP_PM_D0I3,
+	};
 	int ret;
 
-	target_state.state = SOF_DSP_PM_D0;
-
 	/* DSP can enter D0I3 iff only D0I3-compatible streams are active */
-	if (snd_sof_dsp_only_d0i3_compatible_stream_active(sdev))
-		target_state.substate = SOF_HDA_DSP_PM_D0I3;
-	else
-		target_state.substate = SOF_HDA_DSP_PM_D0I0;
-
-	/* remain in D0I0 */
-	if (target_state.substate == SOF_HDA_DSP_PM_D0I0)
+	if (!snd_sof_dsp_only_d0i3_compatible_stream_active(sdev))
+		/* remain in D0I0 */
 		return;
 
 	/* This can fail but error cannot be propagated */
-- 
2.25.1

