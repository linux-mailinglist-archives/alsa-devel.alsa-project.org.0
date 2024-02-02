Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8F2846F5F
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 12:48:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 953E2210;
	Fri,  2 Feb 2024 12:47:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 953E2210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706874479;
	bh=DqACfi5Nm+Z5Vvu/yy4geSACSkUjfZsO8nMA65QjZFI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=frWt8mheQXu/OA0CbyTk6Vt46+qKYIp6IXYxG8+Pk61Tg6Mkim9JgebUkigvTZhVf
	 TiNWlyf0Frc6Ld4aFUo0EuFMNOy5SyfhQ0KTbn8XcGoYcOldkwbZ+wfzSCFIexLF1v
	 YMMh7UgPicoDdLmzynZ2qU57KtTogUB4ZH6h2AZw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA5F8F8057D; Fri,  2 Feb 2024 12:47:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E564F805A8;
	Fri,  2 Feb 2024 12:47:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B7B5F8055C; Fri,  2 Feb 2024 12:47:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B987DF80149
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 12:47:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B987DF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Lw2KbLLB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706874433; x=1738410433;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DqACfi5Nm+Z5Vvu/yy4geSACSkUjfZsO8nMA65QjZFI=;
  b=Lw2KbLLBdQMelChTcnEYIPGL2QyinfbFZOv91mzhxuz+hDDLmNE6rOn9
   4JssJlBN0NlOw4RNbtAcnDG3zDJTKT6qd3//plt72/mWWUxCy/e+F/Agp
   KHC2JbQFvWvLMaZH9Zz1yXEFvDzd1L/VN8vuplqds6XLe3KbqJT7L0hiC
   bU1eMziNgd3wp9E8Lp9Sqa0ypCdwhZnZBG6lG6YjPx6NoKJsKaAedyQ3T
   uHbFpJkBpjnLX6/MkyvIdpIACLUkjJP0WGcIJ2qsGgYGzId1+FtqvoGB/
   LdQOfGqCxTV+kkDozrDt9O10qc0mQo6i62+hpl9D91nwZBLD/d7u4ghB9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="56745"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400";
   d="scan'208";a="56745"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 03:47:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400";
   d="scan'208";a="4652485"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 02 Feb 2024 03:47:05 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] ASoC: Intel: avs: Fix pci_probe() error path
Date: Fri,  2 Feb 2024 12:49:01 +0100
Message-Id: <20240202114901.1002127-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L27XJNI6AIGFD4NA67RVGNDASGTWVDPB
X-Message-ID-Hash: L27XJNI6AIGFD4NA67RVGNDASGTWVDPB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L27XJNI6AIGFD4NA67RVGNDASGTWVDPB/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Recent changes modified operation-order in the probe() function without
updating its error path accordingly. If snd_hdac_i915_init() exists with
status EPROBE_DEFER the error path must cleanup allocated IRQs before
leaving the scope.

Fixes: 2dddc514b6e4 ("ASoC: Intel: avs: Move snd_hdac_i915_init to before probe_work.")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 59c3793f65df..db78eb2f0108 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -477,6 +477,9 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	return 0;
 
 err_i915_init:
+	pci_free_irq(pci, 0, adev);
+	pci_free_irq(pci, 0, bus);
+	pci_free_irq_vectors(pci);
 	pci_clear_master(pci);
 	pci_set_drvdata(pci, NULL);
 err_acquire_irq:
-- 
2.25.1

