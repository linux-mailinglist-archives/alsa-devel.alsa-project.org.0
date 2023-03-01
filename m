Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBF96A7592
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 21:47:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A79B1DA;
	Wed,  1 Mar 2023 21:46:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A79B1DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677703656;
	bh=yZvS6ROtOIPBtI3te25e5BekQneRLwIjSJ41N/SQUF8=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ndDOeOXjRGx02BcvgMzD1y9mYA6VISMCdlAHcJMcSboZLHoUA7/uNK3RDGWM4ZVFK
	 +HYjfJpFUlQrclK+oQOxYs3cMlZSGbKEVLUIiwMb54Fi0MYgDJu4j09by52O4JCxnR
	 hJJVdNu1ObQsaey9yVonQAQusE4nadawCIi/dmow=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3265F80310;
	Wed,  1 Mar 2023 21:46:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F8BDF8049C; Wed,  1 Mar 2023 21:46:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E4B8F800BA
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 21:46:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E4B8F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J0lpY5Bl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677703599; x=1709239599;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yZvS6ROtOIPBtI3te25e5BekQneRLwIjSJ41N/SQUF8=;
  b=J0lpY5BlYEZyWThbTq+5dYnvrWcuIrP0Rs6mEk15ENAlH1ZEdKrVxqTw
   uiqu5SpVVTH9LtYfOtDjL/bfw4vJdpPxeMUuizfq9okLl0B34eD60C2U9
   AvmPg22+88zy00A2Ok8SV+ju186sVPWrGILncF+mKGy+0GkZn0Cu3aoia
   XCuh6M5W0GsSAJJ9XwcXXRF3iteIvToH7gnEp3NyVg70GfMy0XuP0U8F0
   7bINc8vv+2WJa60DbEjCs5secEGF9oL7CEGKk3z6cFVbHyTavay+zuSQ+
   sbIMHjquHcEAx41NnWEn2rOr0eugeae16mD/XEC7jCfEYlDIwEppyULZw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="336808421"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400";
   d="scan'208";a="336808421"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 12:46:34 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="920383141"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400";
   d="scan'208";a="920383141"
Received: from jekeller-desk.amr.corp.intel.com (HELO
 jekeller-desk.jekeller.internal) ([10.166.241.1])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 12:46:33 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] ASoC: Intel: avs: Use struct_size for struct avs_modcfg_ext
 size
Date: Wed,  1 Mar 2023 12:46:28 -0800
Message-Id: <20230301204628.1073819-1-jacob.e.keller@intel.com>
X-Mailer: git-send-email 2.39.1.405.gd4c25cc71f83
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RH6YKS3T7UHNFTZOLMUXUV2WNXDPB6XV
X-Message-ID-Hash: RH6YKS3T7UHNFTZOLMUXUV2WNXDPB6XV
X-MailFrom: jacob.e.keller@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Jacob Keller <jacob.e.keller@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RH6YKS3T7UHNFTZOLMUXUV2WNXDPB6XV/>
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

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
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

