Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7420369C63F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 09:02:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 853A4EB8;
	Mon, 20 Feb 2023 09:02:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 853A4EB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676880176;
	bh=JxafiItEfcTcDcbRYIShfU1fdPbgtWIqshsfc6urePw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B9P7LIVHd2tMRiZ4avpJaQ+nLbMer4sVYZqC6w+tO+BYTkv/hmxCAmYAvsH9vQwTu
	 qonOIuj20GQFtuh8qzHcxu3gmLqc54KUnZPVFo/NHvoIuFN9rgOgryeIE6UXrQsARb
	 lOO9e58bDjt6nXq5s0hbVxeaSfg1OigkDcr7j1dg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0947FF80525;
	Mon, 20 Feb 2023 09:01:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C17FCF80266; Mon, 20 Feb 2023 08:59:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	TVD_PH_BODY_ACCOUNTS_PRE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B76EFF800B6
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 08:58:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B76EFF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EsuQ7H+i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676879881; x=1708415881;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JxafiItEfcTcDcbRYIShfU1fdPbgtWIqshsfc6urePw=;
  b=EsuQ7H+i28JCVYE6eARHh6vnFmiFckJMXbNisLwvziZPN1fSA2Pgw3w8
   WwmOS+9mJXPmsYuxFjgrO5vLsTDI4c1wMQcGGI4bKY+JCnr+/9bzIjJmv
   UkZYB04rPxrelx7uigJN7u4u9abVhMTr1UKpUCg91CIZYFkhm2aCjTv8g
   6mAZKSpME2gMrufb5MjFmgvEnKFyDvBJcUEFe9BgPviQWOFBuUP8xED1r
   Mr7/8wCmugsrYpLhvouO4YrGDx7cuoE6sQqYbBa8H0T3Z+eqJJMvvz5gY
   FXNOb5faBzy/b7KowkdQXO3kiPyVOTIN/xMCkaOvhYUP27DpsBjwZIO7e
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="394827739"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000";
   d="scan'208";a="394827739"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2023 23:57:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="845239714"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000";
   d="scan'208";a="845239714"
Received: from mmocanu-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.33])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2023 23:57:52 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/3] ASoC: SOF: Intel: hda: Do not re-enable L1 if disabled
 before suspend
Date: Mon, 20 Feb 2023 09:58:02 +0200
Message-Id: <20230220075804.4829-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230220075804.4829-1-peter.ujfalusi@linux.intel.com>
References: <20230220075804.4829-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TKQ2IY6MUBUBJ2B2VG4E4Z5M3QMFVBH7
X-Message-ID-Hash: TKQ2IY6MUBUBJ2B2VG4E4Z5M3QMFVBH7
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKQ2IY6MUBUBJ2B2VG4E4Z5M3QMFVBH7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

We have a workaround in place to address a known issue with host DMA
running into xruns when capture streams are running. But when resuming
from Sx, we unconditionally re-enable DMI L1 without taking the
workaround into account and this could lead to xruns when a suspended
capture stream is restarted.

To fix this rename the flag l1_support_enabled to l1_disabled in struct
sof_intel_hda_dev to save the L1 disabled status which can be
set/cleared when we get/put a stream and use the flag to determine if DMI
L1 should enabled or not during the post_fw_run op.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c   |  8 +++++---
 sound/soc/sof/intel/hda-dsp.c    | 10 ++++------
 sound/soc/sof/intel/hda-stream.c | 10 ++++++++--
 sound/soc/sof/intel/hda.h        |  2 +-
 4 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 3aea36c077c9..a1037512da1f 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -158,16 +158,18 @@ void hda_dsp_ctrl_misc_clock_gating(struct snd_sof_dev *sdev, bool enable)
  */
 int hda_dsp_ctrl_clock_power_gating(struct snd_sof_dev *sdev, bool enable)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	u32 val;
 
 	/* enable/disable audio dsp clock gating */
 	val = enable ? PCI_CGCTL_ADSPDCGE : 0;
 	snd_sof_pci_update_bits(sdev, PCI_CGCTL, PCI_CGCTL_ADSPDCGE, val);
 
-	/* enable/disable DMI Link L1 support */
+	/* disable the DMI link when requested. But enable only if it wasn't disabled previously */
 	val = enable ? HDA_VS_INTEL_EM2_L1SEN : 0;
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_EM2,
-				HDA_VS_INTEL_EM2_L1SEN, val);
+	if (!enable || !hda->l1_disabled)
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_EM2,
+					HDA_VS_INTEL_EM2_L1SEN, val);
 
 	/* enable/disable audio dsp power gating */
 	val = enable ? 0 : PCI_PGCTL_ADSPPGD;
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 68eb06f13a1f..e3b69dbc1308 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -776,7 +776,7 @@ int hda_dsp_resume(struct snd_sof_dev *sdev)
 		}
 
 		/* restore L1SEN bit */
-		if (hda->l1_support_changed)
+		if (hda->l1_disabled)
 			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 						HDA_VS_INTEL_EM2,
 						HDA_VS_INTEL_EM2_L1SEN, 0);
@@ -868,11 +868,9 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 		}
 
 		/* enable L1SEN to make sure the system can enter S0Ix */
-		hda->l1_support_changed =
-			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
-						HDA_VS_INTEL_EM2,
-						HDA_VS_INTEL_EM2_L1SEN,
-						HDA_VS_INTEL_EM2_L1SEN);
+		if (hda->l1_disabled)
+			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_EM2,
+						HDA_VS_INTEL_EM2_L1SEN, HDA_VS_INTEL_EM2_L1SEN);
 
 		/* stop the CORB/RIRB DMA if it is On */
 		hda_codec_suspend_cmd_io(sdev);
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 7f0fd05a96e6..d96d9cd9e62f 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -182,6 +182,7 @@ int hda_dsp_stream_spib_config(struct snd_sof_dev *sdev,
 struct hdac_ext_stream *
 hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct sof_intel_hda_stream *hda_stream;
 	struct hdac_ext_stream *hext_stream = NULL;
@@ -222,10 +223,12 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 	 * Workaround to address a known issue with host DMA that results
 	 * in xruns during pause/release in capture scenarios.
 	 */
-	if (!(flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE))
+	if (!(flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE)) {
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 					HDA_VS_INTEL_EM2,
 					HDA_VS_INTEL_EM2_L1SEN, 0);
+		hda->l1_disabled = true;
+	}
 
 	return hext_stream;
 }
@@ -233,6 +236,7 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 /* free a stream */
 int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct sof_intel_hda_stream *hda_stream;
 	struct hdac_ext_stream *hext_stream;
@@ -264,9 +268,11 @@ int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag)
 	spin_unlock_irq(&bus->reg_lock);
 
 	/* Enable DMI L1 if permitted */
-	if (dmi_l1_enable)
+	if (dmi_l1_enable) {
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_EM2,
 					HDA_VS_INTEL_EM2_L1SEN, HDA_VS_INTEL_EM2_L1SEN);
+		hda->l1_disabled = false;
+	}
 
 	if (!found) {
 		dev_err(sdev->dev, "%s: stream_tag %d not opened!\n",
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 45f9d4248f14..0679bebe4ad7 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -502,7 +502,7 @@ struct sof_intel_hda_dev {
 	u32 stream_max;
 
 	/* PM related */
-	bool l1_support_changed;/* during suspend, is L1SEN changed or not */
+	bool l1_disabled;/* is DMI link L1 disabled? */
 
 	/* DMIC device */
 	struct platform_device *dmic_dev;
-- 
2.39.2

