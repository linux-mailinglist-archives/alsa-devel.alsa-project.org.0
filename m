Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5FC7A5FE1
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:44:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D6D8E80;
	Tue, 19 Sep 2023 12:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D6D8E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695120251;
	bh=XeM5jYckyNPNZtwb/IMsh7m3Ugxqvetbv3NndgCDPe4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kxaxy0ES6rORbgPalpCyb8MDeGVfW88NxygbVYbPdxB6QrP9Odrk/B8biUV0cdQXe
	 3tDdfpNwSQpUHLW23smMra3XlHgrjchWqeZisbrlzfyZjnTW35hNX2PChjRhrrmmXs
	 H+U/VF8k7ZtYcYEmyWrn1mnEXW3TnhdwHX/Flu2I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB58BF80578; Tue, 19 Sep 2023 12:42:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DB15F8055C;
	Tue, 19 Sep 2023 12:42:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 817E2F8025A; Tue, 19 Sep 2023 12:42:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26A00F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26A00F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JRW1wIYu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695120146; x=1726656146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XeM5jYckyNPNZtwb/IMsh7m3Ugxqvetbv3NndgCDPe4=;
  b=JRW1wIYuuytXaEiCFdki6LH7FpiQ4IqgHFSlMoa+h+R42j6DS8p3GN4J
   LkbBsOF0z6Vw7fgNQC4po2iYWnoYRatPROO3yTTkvM6xiGom38OkNgL3K
   0cdjI6zvFeAZBJbcPrH23Yny/48cMSOyHCZNxWO6UlQZy6DCru6yRAIwG
   E0ZHNCoTBiWhrvxVxrf0M+od/iN5/N7LnE4pxsfysYOB916m4DLjO3XJU
   vvoCiQYmGSkwHVq1DPJp34S3nPUOVS+3GuhGhilcJ5kg7MH5tgsGAVtew
   Msm8QjXyLKmnrqzk/yKws4/nHkuD39354JAODkSJTWCgkiTCQIx7PM8CC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382658443"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="382658443"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722823187"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="722823187"
Received: from mokashi-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.50.26])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:21 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	rander.wang@intel.com
Subject: [PATCH 1/9] ASoC: SOF: Introduce generic names for IPC types
Date: Tue, 19 Sep 2023 13:42:18 +0300
Message-ID: <20230919104226.32239-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
References: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DUZ47GO43PGORCIJE3ZPDL2QYD4ANZE6
X-Message-ID-Hash: DUZ47GO43PGORCIJE3ZPDL2QYD4ANZE6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUZ47GO43PGORCIJE3ZPDL2QYD4ANZE6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change the enum names for the IPC types to be more descriptive and drop
tying the IPC4 to Intel SoCs.

Add defines to avoid build breakage while the related code is
modified to use the new enum names.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 51294f2ba302..31121c6df027 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -52,11 +52,14 @@ enum sof_dsp_power_states {
 
 /* Definitions for multiple IPCs */
 enum sof_ipc_type {
-	SOF_IPC,
-	SOF_INTEL_IPC4,
+	SOF_IPC_TYPE_3,
+	SOF_IPC_TYPE_4,
 	SOF_IPC_TYPE_COUNT
 };
 
+#define SOF_IPC		SOF_IPC_TYPE_3
+#define SOF_INTEL_IPC4	SOF_IPC_TYPE_4
+
 /*
  * SOF Platform data.
  */
-- 
2.42.0

