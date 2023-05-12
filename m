Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B8C700DFF
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 19:37:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B08A1E7C;
	Fri, 12 May 2023 19:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B08A1E7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683913041;
	bh=7rvsQggI1vzNPh1sASp9TWcZniMmY6ecWFuBW3kdHtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QpDu8s+z8pIMwWXXrQeMyvXtBg+6Ms6K341eHW6B6HRvx5eMM/Lz+SbMqP4bQppZE
	 LdQrYAvOm9c00qVbemxgOyI7zOfvF1LAFrptHSSbhDhi2n2pGBwSnUi1fz+EUjzMAt
	 2NBhCsMpLIMlJ+enovRM+qBJdfHAFqdqAjvalZH0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95041F805DF; Fri, 12 May 2023 19:34:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EED86F805D8;
	Fri, 12 May 2023 19:34:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98CD7F805C1; Fri, 12 May 2023 19:34:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76908F8053D
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 19:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76908F8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Bj7F0g6p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683912827; x=1715448827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7rvsQggI1vzNPh1sASp9TWcZniMmY6ecWFuBW3kdHtU=;
  b=Bj7F0g6pyjyIP52jS4oiHXvsaU8tGTsWKItSmIkRFE5EEWFZErTsiV57
   P/3+tvIPbLrENRIYEWFN/WXVWTfGN4zJB2ePlFhtAYBQ8gsViUvCTRQ5N
   4IfdvLhdhXdcY1aSb75ECRpnQFJ/FNC7uhGYFsK8gj1YVvmpHL1hWZXPY
   j74AqN5CoP5OC2FmyYtZiC9xsmEaidZRJivQR6Zsu52cjURMNqPQOBXvd
   ZHo4JJRMq3XfeaxtJAY80HIVxN2idWEuhV20etgRl67cc69GWN9b0UIYy
   md3SVMrcqSpev8jAYHySeHWl6+bK6YODL3fmmgi6XzdlX9S2ta4uzQeqY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="340164713"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="340164713"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="1030160309"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="1030160309"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:33:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 3/8] ASoC: Intel: sof_sdw: add quirk for MTL RVP
Date: Fri, 12 May 2023 12:33:00 -0500
Message-Id: <20230512173305.65399-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512173305.65399-1-pierre-louis.bossart@linux.intel.com>
References: <20230512173305.65399-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NOYE2NJE6S5BEOOYS4FRFXNJ67A5KQ2S
X-Message-ID-Hash: NOYE2NJE6S5BEOOYS4FRFXNJ67A5KQ2S
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NOYE2NJE6S5BEOOYS4FRFXNJ67A5KQ2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We should use RT711_JD2_100K for on board rt711.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 5ab1df4cc927..0841e28d1256 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -415,6 +415,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(RT711_JD1),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Meteor Lake Client Platform"),
+		},
+		.driver_data = (void *)(RT711_JD2_100K),
+	},
 	{}
 };
 
-- 
2.37.2

