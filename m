Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F01AB7F9F3F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 13:07:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EABF482B;
	Mon, 27 Nov 2023 13:07:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EABF482B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701086838;
	bh=JNxAhFhfV59tZwezM3pRBKq1Yh/nncfhSJlbVm+Ksak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YOyLDzxACKvHn9QAhbeCtY0GHIWLh3rElIaGDaUHvZVcgcwbVRhQL4g86/SGtaWV8
	 RobJ4Vn+fgTPvpkAFy7OyTEavVsDv2EfI2S7TnFGF9Ly3ur64NC2tJnyoQ5oG6nkPs
	 iUYIudd4lig2SSbRE1aWpSv/DD8GwQ1+WyCSF9CY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BD1DF805A0; Mon, 27 Nov 2023 13:06:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 062FFF805C7;
	Mon, 27 Nov 2023 13:06:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28838F80236; Mon, 27 Nov 2023 13:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0A63F800F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 13:06:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0A63F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RK95Y9kj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701086796; x=1732622796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JNxAhFhfV59tZwezM3pRBKq1Yh/nncfhSJlbVm+Ksak=;
  b=RK95Y9kjRLG9tlWdbuQw5o86fN67ZRtU/hKcY4MqcTfm+c1a7xgSb9IK
   e0KPjuDnvy6SPsQgKiAcJPOhikBHkfD7730wy/NslxN+ieCYC1vu20S5y
   6Sa8bMVYLhxeRifR8k1tvodyTH8BHR0jyj7nWuHqskd5PfxPIQn0zNqX9
   H8AyVYvVhuGOUPC0ChhuzOOptCsxUS80wr06eM4ME3jVrMmKP5749ZJe0
   /wpnViPUybPfBqynQUpekxL+2H70Oexk8DN/Dx9UUdKPkE8GRBU1NOP/r
   H4awe+U8PIo7BL3zZZLDwa0E2LzkR4pfQ42dWec/IQyLvjpxx8kmq5wpO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="14249617"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="14249617"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 04:06:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="859035578"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="859035578"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 04:06:28 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	brent.lu@intel.com
Subject: [PATCH 2/2] ASoC: SOF: ipc4-topology: support NHLT device type
Date: Mon, 27 Nov 2023 14:06:57 +0200
Message-ID: <20231127120657.19764-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
References: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X32XSOONN6UOPB3SV3LYQSP24IQVURWG
X-Message-ID-Hash: X32XSOONN6UOPB3SV3LYQSP24IQVURWG
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X32XSOONN6UOPB3SV3LYQSP24IQVURWG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

The endpoint in NHLT table for a SSP port could have the device type
NHLT_DEVICE_BT or NHLT_DEVICE_I2S. Use intel_nhlt_ssp_device_type()
function to retrieve the device type before querying the endpoint
blob to make sure we are always using correct device type parameter.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b89065abb511..f034fed06669 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1348,6 +1348,7 @@ static int snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_s
 	int sample_rate, channel_count;
 	int bit_depth, ret;
 	u32 nhlt_type;
+	int dev_type = 0;
 
 	/* convert to NHLT type */
 	switch (linktype) {
@@ -1363,18 +1364,30 @@ static int snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_s
 						   &bit_depth);
 		if (ret < 0)
 			return ret;
+
+		/*
+		 * We need to know the type of the external device attached to a SSP
+		 * port to retrieve the blob from NHLT. However, device type is not
+		 * specified in topology.
+		 * Query the type for the port and then pass that information back
+		 * to the blob lookup function.
+		 */
+		dev_type = intel_nhlt_ssp_device_type(sdev->dev, ipc4_data->nhlt,
+						      dai_index);
+		if (dev_type < 0)
+			return dev_type;
 		break;
 	default:
 		return 0;
 	}
 
-	dev_dbg(sdev->dev, "dai index %d nhlt type %d direction %d\n",
-		dai_index, nhlt_type, dir);
+	dev_dbg(sdev->dev, "dai index %d nhlt type %d direction %d dev type %d\n",
+		dai_index, nhlt_type, dir, dev_type);
 
 	/* find NHLT blob with matching params */
 	cfg = intel_nhlt_get_endpoint_blob(sdev->dev, ipc4_data->nhlt, dai_index, nhlt_type,
 					   bit_depth, bit_depth, channel_count, sample_rate,
-					   dir, 0);
+					   dir, dev_type);
 
 	if (!cfg) {
 		dev_err(sdev->dev,
-- 
2.43.0

