Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3758E69C639
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 09:02:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84060EA7;
	Mon, 20 Feb 2023 09:01:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84060EA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676880115;
	bh=EBtP6HpSmy7anHv9dfJ3RWHfs6zgDkNnOIH5LGDGv4g=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ooQg0g1Jqxyj73020sCtxklsj9Q86GKfUEUbEemeAIJRMj60BWnKvZD7DcFoAY2eK
	 YfloDpY2VBEX59n4m7lqL46nG2MW12GPeRzjHOfwYJHIaMlfSUUOY7KtNtmvhkW86U
	 YwwrOK0KsgT1cIL5QZethTW96RdQWHRhbPUL9hXI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C07B7F8025A;
	Mon, 20 Feb 2023 09:01:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 164F8F8047C; Mon, 20 Feb 2023 08:58:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE68CF80266
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 08:58:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE68CF80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=i0O0cJua
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676879882; x=1708415882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EBtP6HpSmy7anHv9dfJ3RWHfs6zgDkNnOIH5LGDGv4g=;
  b=i0O0cJuaR2uPCmnWEhvH6H6DM+0vg8N+lUbiKnjoK6ylHxsQnUjacT3O
   9zjiRQHrMahzNAkEn5RnvZTDCvgpVeVCnVVlPAPdoui2JD2PXEj2n+ByI
   k5JZB2N5Y3i6F+ob3Wh88f/lRw9EicHbrYuT4c6nn0S2JxYWh4x1K5pRW
   Aq3J9dCI+mQjgdAIw4orhCEzc3m6jLba30HqpQgK97AwNMU3kQbMdOaUk
   hvhxcPam4OaZ9ioSambiq6v18wCUmvXe2EO6gjJ/5b2sd4giLb0tm74L1
   8+v60LuRWBHtAdjRTY9tKgmia8Wr5uGdLKBVFftTDUUUENRq+kcYcDnOa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="394827749"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000";
   d="scan'208";a="394827749"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2023 23:57:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="845239747"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000";
   d="scan'208";a="845239747"
Received: from mmocanu-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.33])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2023 23:57:55 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/3] ASoC: SOF: Intel: hda: Restrict DMI L1 disable workaround
Date: Mon, 20 Feb 2023 09:58:03 +0200
Message-Id: <20230220075804.4829-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230220075804.4829-1-peter.ujfalusi@linux.intel.com>
References: <20230220075804.4829-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FVNCJSYFFNIMBQB7UTQEHQQKQUZOSV6A
X-Message-ID-Hash: FVNCJSYFFNIMBQB7UTQEHQQKQUZOSV6A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVNCJSYFFNIMBQB7UTQEHQQKQUZOSV6A/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The workaround to disable DMI L1 should be restricted to only the CAVS
IP's.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index d96d9cd9e62f..c37ef581637f 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -182,6 +182,7 @@ int hda_dsp_stream_spib_config(struct snd_sof_dev *sdev,
 struct hdac_ext_stream *
 hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 {
+	const struct sof_intel_dsp_desc *chip_info =  get_chip_info(sdev->pdata);
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct sof_intel_hda_stream *hda_stream;
@@ -221,9 +222,10 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 	/*
 	 * Prevent DMI Link L1 entry for streams that don't support it.
 	 * Workaround to address a known issue with host DMA that results
-	 * in xruns during pause/release in capture scenarios.
+	 * in xruns during pause/release in capture scenarios. This is not needed for the ACE IP.
 	 */
-	if (!(flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE)) {
+	if (chip_info->hw_ip_version < SOF_INTEL_ACE_1_0 &&
+	    !(flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE)) {
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 					HDA_VS_INTEL_EM2,
 					HDA_VS_INTEL_EM2_L1SEN, 0);
@@ -236,6 +238,7 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 /* free a stream */
 int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag)
 {
+	const struct sof_intel_dsp_desc *chip_info =  get_chip_info(sdev->pdata);
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct sof_intel_hda_stream *hda_stream;
@@ -268,7 +271,7 @@ int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag)
 	spin_unlock_irq(&bus->reg_lock);
 
 	/* Enable DMI L1 if permitted */
-	if (dmi_l1_enable) {
+	if (chip_info->hw_ip_version < SOF_INTEL_ACE_1_0 && dmi_l1_enable) {
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_EM2,
 					HDA_VS_INTEL_EM2_L1SEN, HDA_VS_INTEL_EM2_L1SEN);
 		hda->l1_disabled = false;
-- 
2.39.2

