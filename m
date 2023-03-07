Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BC16ADB22
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 10:55:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A69CF13FD;
	Tue,  7 Mar 2023 10:54:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A69CF13FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678182932;
	bh=Qv38IFxwAFLesWr5zFsfMPUdiQUnfXLHCapIFS7q7Qc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oPPFxa164voTJqK1aoFhSoPYvRQozrmUdK8HFpWsMv9O72jdUL1XPzUSexcYsjd/a
	 rslojeumzl5hIoznY/PJ8ZnM8/evW00j6d3M6ElR8Vx0tXrhFn+5kLsGle8qLqOkZ8
	 6qVy/EEYbkbhdwxLCkMC2+adh8MFy86fUeINmNUw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BBE7F800C9;
	Tue,  7 Mar 2023 10:54:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DACC7F80431; Tue,  7 Mar 2023 10:54:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D78F8F800C9
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 10:54:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D78F8F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kZLmHd9w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678182877; x=1709718877;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qv38IFxwAFLesWr5zFsfMPUdiQUnfXLHCapIFS7q7Qc=;
  b=kZLmHd9wfmN/iK6YJvB9hoaKkvaW4PK/eJicSSndqjy0B4aQphnktcgL
   GN8UnWcgDPmRKUYTX7Dw1nYmY3swlUnmBydWgnZgeO019WShpfV3mTxD1
   mOt1SVctu8ghbxOxMAmEaAnMuODaH2R7IanIe0kzpZ3HUw2/BBUxs1yx6
   /23Cw+VpxNaHrUsRcyJKaqcX/9cP73rK7uS81XjhI7PDnzV0qAZGAv6NS
   uK2EC/s3aqi2fTtSWTL+h54qRC5j9aPEdXqUnbzwz8fssq+kaxqs84t3z
   gm4VYIOMlbLxIpEsUFGlay+90LBsYD/DEd1EzQKAECPcWxPVXTt4xNOmH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="319641688"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="319641688"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="678857562"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="678857562"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:54:31 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: hda-dsp: harden D0i3 programming sequence
Date: Tue,  7 Mar 2023 11:54:52 +0200
Message-Id: <20230307095453.3719-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 25V7HHMJKD3LWX5O6AQVLM2W5PPNQOO6
X-Message-ID-Hash: 25V7HHMJKD3LWX5O6AQVLM2W5PPNQOO6
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/25V7HHMJKD3LWX5O6AQVLM2W5PPNQOO6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Add delay between set and wait command according to hardware programming
sequence. Also add debug log to detect error.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index e3b69dbc1308..c9231aeacc53 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -392,6 +392,12 @@ static int hda_dsp_update_d0i3c_register(struct snd_sof_dev *sdev, u8 value)
 	snd_sof_dsp_update8(sdev, HDA_DSP_HDA_BAR, chip->d0i3_offset,
 			    SOF_HDA_VS_D0I3C_I3, value);
 
+	/*
+	 * The value written to the D0I3C::I3 bit may not be taken into account immediately.
+	 * A delay is recommended before checking if D0I3C::CIP is cleared
+	 */
+	usleep_range(30, 40);
+
 	/* Wait for cmd in progress to be cleared before exiting the function */
 	ret = hda_dsp_wait_d0i3c_done(sdev);
 	if (ret < 0) {
@@ -400,6 +406,12 @@ static int hda_dsp_update_d0i3c_register(struct snd_sof_dev *sdev, u8 value)
 	}
 
 	reg = snd_sof_dsp_read8(sdev, HDA_DSP_HDA_BAR, chip->d0i3_offset);
+	/* Confirm d0i3 state changed with paranoia check */
+	if ((reg ^ value) & SOF_HDA_VS_D0I3C_I3) {
+		dev_err(sdev->dev, "failed to update D0I3C!\n");
+		return -EIO;
+	}
+
 	trace_sof_intel_D0I3C_updated(sdev, reg);
 
 	return 0;
-- 
2.39.2

