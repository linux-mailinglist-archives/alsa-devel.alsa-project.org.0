Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A93716C446C
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 08:53:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04548850;
	Wed, 22 Mar 2023 08:52:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04548850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679471611;
	bh=aC3PigLA+IFL4gBCBjeho7h/EInMph6X9pee38wswEE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UTltDBhb0xjZaCV0gZjXn7ESN/OkNa8rG4gRlSOeLpvu6GJMH32m8MTZjPCQ+d2QL
	 VGxdVa67eRbUhHSBNedbMmZ9MJRTJrr/vFyVTpmbX/j7dB47b4DnyrlIFfaSUXQGd+
	 qqVa0GEctzQLI0KR4G8ZdP9fgBIESSoEjFw+fLT8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE4C5F804FE;
	Wed, 22 Mar 2023 08:51:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02B38F802E8; Wed, 22 Mar 2023 08:50:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D594F8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 08:50:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D594F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cBpcOTFv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679471413; x=1711007413;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aC3PigLA+IFL4gBCBjeho7h/EInMph6X9pee38wswEE=;
  b=cBpcOTFvIlFeUJrmjFldz6HpWQMumylrVxt0tZZN9a7s2sK0zdlfW02E
   I7B5iwUDp8C5W3oOch5p+RH5syQYextrnjMaTf/n6Dt3T10eKt1YC6wOD
   CLyDJmDR+YnnKDiWb7rCb5axJOX6C5e3eMsiq5RJlKynaHk0ZeqmWtuuA
   6WLfvoTn+H459DajZJARG31sl0Jc0MV8huY8LnO/VZtvCjbKhflyxN6XF
   NuRMn8ZGmvUsqZL69JUuojAONtGMkvWuvfwgSHA/oRdIzYL0Rs389YFL/
   54BnlqxVoq8bIz4doVXxSQycgwDps8oTJZDluawnjYbdjEoj6GCr88aaC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="341507377"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="341507377"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 00:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="631893451"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="631893451"
Received: from gjantea-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.222.2])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 00:48:49 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/2] ASoC: Intel: sof_rt5682: Update BT offload config for Rex
Date: Wed, 22 Mar 2023 09:49:15 +0200
Message-Id: <20230322074916.23225-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230322074916.23225-1-peter.ujfalusi@linux.intel.com>
References: <20230322074916.23225-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LHIC4SYV7MABJLYNUCAQLYT2A6WC7QR3
X-Message-ID-Hash: LHIC4SYV7MABJLYNUCAQLYT2A6WC7QR3
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 uday.m.bhat@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Uday M Bhat <uday.m.bhat@intel.com>

For Rex, SSP1 is used for BT offload. This is enabled
in the sof_rt5682_quirk_table

Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 76ee2e35e1ef..c1891ff00d65 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -234,7 +234,9 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
 					SOF_RT5682_SSP_AMP(0) |
-					SOF_RT5682_NUM_HDMIDEV(4)
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(1) |
+					SOF_SSP_BT_OFFLOAD_PRESENT
 					),
 	},
 	{
@@ -246,7 +248,9 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_RT5682_SSP_CODEC(2) |
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_RT5682_SSP_AMP(0) |
-					SOF_RT5682_NUM_HDMIDEV(4)
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(1) |
+					SOF_SSP_BT_OFFLOAD_PRESENT
 					),
 	},
 	{}
-- 
2.40.0

