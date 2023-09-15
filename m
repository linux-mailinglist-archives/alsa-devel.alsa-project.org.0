Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA1F7A1AA9
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 11:37:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2787CAE8;
	Fri, 15 Sep 2023 11:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2787CAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694770620;
	bh=Q+hahibHbwgzp+lGnGoJY6IndzI48i4k/24AitZ4qI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IrnVr/04ih5oL8Q/owX8urSAC/VvhRQMmF/bhDX3OhAZv2w34VAqM3WfOygjtjcJ2
	 FCp9UoXbpzK5VQKw7PXERygoGcwLBGMc3WMHROgF40oNsRSmbkWtSSnFeg+lVf5axL
	 i2jAX50iPAryT68P5uUp4A1am38G6MyF4elqc6is=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B97A2F80568; Fri, 15 Sep 2023 11:35:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62CE7F80558;
	Fri, 15 Sep 2023 11:35:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 855B8F80431; Fri, 15 Sep 2023 11:35:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E06C5F80141
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 11:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E06C5F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fxF2eTFY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694770515; x=1726306515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q+hahibHbwgzp+lGnGoJY6IndzI48i4k/24AitZ4qI8=;
  b=fxF2eTFYk5H3IirePMztY2UJa5j/UQqol0VzNmKOnXI2uOm4szVs1lPI
   gL35XX2YfrwqMA5FoyWhJVeWghNgD74US4P/1Q2AZpyZIjyflFKRJzMOa
   5eQ1+32Grftid3+mt/3faEz29tllb2+Rnlc3nwXC4emq/52ftkJ3kSQFR
   +/jFYl2tcAyir97hLKsbDO9ddP6aPgQRdteEzixptJLSmLvdogGrWU4pA
   6q4cpXEt7Yp0LCK7Vu7xu6FxyY8AOX6vV8Q4MIHaS2x7Y3M5Vg2wBkC+n
   aY3m/DP+TO0GZZCTXyl+7IbrWR0zVtvzjEh+xFnMWWUd3iPt1fS2k6F60
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="445666674"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="445666674"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 02:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="868646128"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="868646128"
Received: from brhacker-mobl26.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.34])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 02:35:04 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: ipc4-topology: export
 sof_ipc4_copier_is_single_format
Date: Fri, 15 Sep 2023 12:35:06 +0300
Message-ID: <20230915093507.7242-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230915093507.7242-1-peter.ujfalusi@linux.intel.com>
References: <20230915093507.7242-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H4Q5CIYL7THHUAT6R7M63TZGRSUZQIW6
X-Message-ID-Hash: H4Q5CIYL7THHUAT6R7M63TZGRSUZQIW6
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4Q5CIYL7THHUAT6R7M63TZGRSUZQIW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We will use the sof_ipc4_copier_is_single_format() function to check if a
ipc4 copier has single format available in ipc4-pcm.c in the next patch.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 8 ++++----
 sound/soc/sof/ipc4-topology.h | 3 +++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index f2a30cd31378..21fae27eb67c 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1369,9 +1369,9 @@ static int snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_s
 }
 #endif
 
-static bool sof_ipc4_copier_is_single_format(struct snd_sof_dev *sdev,
-					     struct sof_ipc4_pin_format *pin_fmts,
-					     u32 pin_fmts_size)
+bool sof_ipc4_copier_is_single_format(struct snd_sof_dev *sdev,
+				      struct sof_ipc4_pin_format *pin_fmts,
+				      u32 pin_fmts_size)
 {
 	struct sof_ipc4_audio_format *fmt;
 	u32 valid_bits;
@@ -1380,7 +1380,7 @@ static bool sof_ipc4_copier_is_single_format(struct snd_sof_dev *sdev,
 	fmt = &pin_fmts[0].audio_fmt;
 	valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
 
-	/* check if all output formats in topology are the same */
+	/* check if all formats in topology are the same */
 	for (i = 1; i < pin_fmts_size; i++) {
 		u32 _valid_bits;
 
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index d75f17f4749c..d94f0ab4aee3 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -442,4 +442,7 @@ struct sof_ipc4_process {
 	u32 init_config;
 };
 
+bool sof_ipc4_copier_is_single_format(struct snd_sof_dev *sdev,
+				      struct sof_ipc4_pin_format *pin_fmts,
+				      u32 pin_fmts_size);
 #endif
-- 
2.42.0

