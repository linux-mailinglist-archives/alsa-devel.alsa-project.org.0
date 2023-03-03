Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A41C6A9E26
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 19:07:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE766A4F;
	Fri,  3 Mar 2023 19:07:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE766A4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677866872;
	bh=ZTXIbGPkTGNK/2+lsQ6jqCe7/vd0YMD7ToZtYNiFvkE=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZzvGchQejvzQK6BGceT0JJhc3aVAlRCQsdIgCprRuH5f0LaNHJwzdMD026FuTC69L
	 yPIgLF24/Jdkeqw+/2HCdsz9GXzMFS5wQqQXUsu3w/W9cHQQEs4aSL1rYo+fNbePHW
	 +MY0p3vwDmNRYaojptINTJxxTr7jmSAGzGp6ez0o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 234EAF8025A;
	Fri,  3 Mar 2023 19:07:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB7D1F80266; Fri,  3 Mar 2023 19:06:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E870F800BA
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 19:06:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E870F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XvIkXRaC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677866814; x=1709402814;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZTXIbGPkTGNK/2+lsQ6jqCe7/vd0YMD7ToZtYNiFvkE=;
  b=XvIkXRaCpALEg3Kc3jE3npJyklv7G0gqLsBBVMoex5/OXdYUmsAtnP6M
   wwt1isl3pKQh1TFK93PCO/Ezh4Rtamm3TiazEOoHqDjJCWmeLhTmugnGP
   JRNTWFn9tCYYgoyqxzThIf1qarg94lKoGteSOEM+swhGR9oHqWt+hH723
   VUHEx/JMAwfkjBKksLJVcAtLKx3M2jpfjBJUghq+cfOsQnddVcnHVUNZq
   JBqDEOQKg8MwRsmThFI2/YV1I9FVU0BgWoUNTESkQ6wzY2d6R30Roh+It
   FBhcmBC/JGCnHzjROF5K6mZtqZShW7nAEgofHSKnVzq5WSgORHlA56z1Y
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="421382219"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400";
   d="scan'208";a="421382219"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 10:05:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="652876168"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400";
   d="scan'208";a="652876168"
Received: from jekeller-desk.amr.corp.intel.com (HELO
 jekeller-desk.jekeller.internal) ([10.166.241.1])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 10:05:02 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] ASoC: Intel: avs: Use struct_size for struct
 avs_modcfg_ext size
Date: Fri,  3 Mar 2023 10:04:57 -0800
Message-Id: <20230303180457.2457069-1-jacob.e.keller@intel.com>
X-Mailer: git-send-email 2.39.1.405.gd4c25cc71f83
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GLKI6DIVVHK57B6Y72RZ45LN5XU7OLZ3
X-Message-ID-Hash: GLKI6DIVVHK57B6Y72RZ45LN5XU7OLZ3
X-MailFrom: jacob.e.keller@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jacob Keller <jacob.e.keller@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

The struct avs_modcfg_ext structure has a flexible array member for the
pin_fmts array, and the size should be calculated using struct_size to
prevent the potential for overflow with the allocation.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
 sound/soc/intel/avs/path.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 05302ab705ae..adbe23a47847 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -478,7 +478,7 @@ static int avs_modext_create(struct avs_dev *adev, struct avs_path_module *mod)
 	int ret, i;
 
 	num_pins = tcfg->generic.num_input_pins + tcfg->generic.num_output_pins;
-	cfg_size = sizeof(*cfg) + sizeof(*cfg->pin_fmts) * num_pins;
+	cfg_size = struct_size(cfg, pin_fmts, num_pins);
 
 	cfg = kzalloc(cfg_size, GFP_KERNEL);
 	if (!cfg)

base-commit: ee3f96b164688dae21e2466a57f2e806b64e8a37
-- 
2.39.1.405.gd4c25cc71f83

