Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 642387424C3
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 13:10:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D09384A;
	Thu, 29 Jun 2023 13:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D09384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688037003;
	bh=RDLpi6abEvkX2UG3ppHFT8zwrpNUaqIPIDudDv+YrTI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KdlhLS7lqshkgPMM2KMfHJ1JKhDnJNwStEa8cPOKKCz+y3W8GIcEVlmlPqc8ydzSy
	 u9hkma73F3Ci6CC2QWMMCWKVi/SDwEI71LlXkmnJIbhBuFFzoolnxCyjcmJhL2a0lM
	 IpkfS4j3sNDIK+FOrS2uZw+aap+Yg7ep1nnS6zeY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17351F805BE; Thu, 29 Jun 2023 13:07:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74503F805B4;
	Thu, 29 Jun 2023 13:07:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E084F8057B; Thu, 29 Jun 2023 13:07:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38633F80567
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 13:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38633F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=axvs2+BQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688036829; x=1719572829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RDLpi6abEvkX2UG3ppHFT8zwrpNUaqIPIDudDv+YrTI=;
  b=axvs2+BQ3ZgP2FXVUbC1jzkDAkLqHOZVVOSm1zOWx3vrETOG6IJ43XL6
   i+UjJxq9HUp0dnz0pBYHovsBoB+Vv4KqXOCKyNYG7fqFHh7lyeSYvU/Da
   FVHqzy9kJLV2PgEh54b45kMAUK1chVo8luowPfhiGR6GIQDTxci/4pzmC
   xg5x7TKbB2IXy0R29KIDvy9B6ujqJ/WzFXcIJjv7HfCzesbDa8y+dQfIj
   E8KJZZmjM7F5+QCRRrZLnxAq5Ow5VFKqytb+y/IURJTnP+FHrxQRGthZY
   esR2fZQYR1cvimQvNXqGP5NiYrKjsz4EzkLUBmeRnAHXN+5a8jVLWsWNM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="365543650"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="365543650"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 04:07:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="1047732737"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="1047732737"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jun 2023 04:07:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	zhuning@everest-semi.com,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 6/8] ASoC: Intel: avs: Load rt5663 board on KBL-based
 platforms
Date: Thu, 29 Jun 2023 13:24:47 +0200
Message-Id: <20230629112449.1755928-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230629112449.1755928-1-cezary.rojewski@intel.com>
References: <20230629112449.1755928-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U27PJLE7U4UATQNTFTGWEQYBZAOR2SXO
X-Message-ID-Hash: U27PJLE7U4UATQNTFTGWEQYBZAOR2SXO
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U27PJLE7U4UATQNTFTGWEQYBZAOR2SXO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Update board-selection tables to account for rt5663 on KBL-based
platforms.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/board_selection.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 5dc55f14b5a3..f91ef6c9612f 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -135,6 +135,14 @@ static struct snd_soc_acpi_mach avs_kbl_i2s_machines[] = {
 		},
 		.tplg_filename = "max98927-tplg.bin",
 	},
+	{
+		.id = "10EC5663",
+		.drv_name = "avs_rt5663",
+		.mach_params = {
+			.i2s_link_mask = AVS_SSP(1),
+		},
+		.tplg_filename = "rt5663-tplg.bin",
+	},
 	{
 		.id = "MX98373",
 		.drv_name = "avs_max98373",
-- 
2.25.1

