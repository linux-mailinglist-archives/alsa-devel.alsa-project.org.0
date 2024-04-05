Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E035899913
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 11:12:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 282F22D2B;
	Fri,  5 Apr 2024 11:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 282F22D2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712308330;
	bh=8IPnmYlyD9UIlHOOUBWMwrj2iTulN0YzLI+v4m5ePr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DJOO2BjlP8e9GdF4ojtaTEWh9ACsnLHn40eWy0edQGdiP/3b4a1+ubIwU41kTfB3J
	 chhPh0KfPhc6+i1+g6m1qLBi1j7YV6nwWD8sh+SqlXO4IVCtuaSGE+oEvUxNE6CfBA
	 8uBdgjbwrCpaN0Zt+wMuK9w5PNcbQQ8k4tKA86fo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6C35F80655; Fri,  5 Apr 2024 11:10:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD900F80621;
	Fri,  5 Apr 2024 11:10:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 306C3F80579; Fri,  5 Apr 2024 11:08:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B936F80130
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 11:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B936F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=a6MdlsqU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308099; x=1743844099;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8IPnmYlyD9UIlHOOUBWMwrj2iTulN0YzLI+v4m5ePr8=;
  b=a6MdlsqUz9w8Hv/SHDcnNDM+q6YpnItsHMY9oOSoE5QnOW8dczYPy4ui
   gLxYA3KiGsuZC7qdWcjMJr2xDB7Na7pgZBAbqt3b2DjuQTaReFGaXrJwT
   5Vs5ZYmLdPQAp5L8pDmYV9Ug9M2ijlJPHEWz/Viw6fxX7UbswY+nYUMRi
   TG8B6ig6CIL9EPIHzWHb4LmzmtQg8tV7dQgBjBfhIgQZzTRftcjkg36L4
   5Zt62KQJskk6KUPw7vL+rqo9lQqpvHUii9FhpWwLMHv1yPjXepcmvVK2F
   Fm73BfPd7viSpZlcAi22tV0zVFGreBdfPswgHJmGcU6m/6QhaLjIpTbI2
   Q==;
X-CSE-ConnectionGUID: 9t7qyDTATweout5leXKgHQ==
X-CSE-MsgGUID: nufaCOzBR1GG2TW+FHdDoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787435"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="7787435"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:08:16 -0700
X-CSE-ConnectionGUID: I/Z/6ZVZRxi/zlU0Dn1bIg==
X-CSE-MsgGUID: 2SClKS10TI+qMFEtok2pOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="19042427"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 05/13] ASoC: Intel: avs: Fix ASRC module initialization
Date: Fri,  5 Apr 2024 11:09:21 +0200
Message-Id: <20240405090929.1184068-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2SVZNKJJWK2T574FY2HUA6U4ZWONDYFU
X-Message-ID-Hash: 2SVZNKJJWK2T574FY2HUA6U4ZWONDYFU
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SVZNKJJWK2T574FY2HUA6U4ZWONDYFU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The ASRC module configuration consists of several reserved fields. Zero
them out when initializing the module to avoid sending invalid data.

Fixes: 274d79e51875 ("ASoC: Intel: avs: Configure modules according to their type")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 9bd03a44fcb9..8dfd90587427 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -365,6 +365,7 @@ static int avs_asrc_create(struct avs_dev *adev, struct avs_path_module *mod)
 	struct avs_tplg_module *t = mod->template;
 	struct avs_asrc_cfg cfg;
 
+	memset(&cfg, 0, sizeof(cfg));
 	cfg.base.cpc = t->cfg_base->cpc;
 	cfg.base.ibs = t->cfg_base->ibs;
 	cfg.base.obs = t->cfg_base->obs;
-- 
2.25.1

