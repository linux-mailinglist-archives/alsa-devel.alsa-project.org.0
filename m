Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28384951977
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 12:55:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A98B236A;
	Wed, 14 Aug 2024 12:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A98B236A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723632911;
	bh=4odUtP/AEWZfLJ3vVU3By93GqPTr0OWR8KAXnBFaSXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oarVQfRM2aYKqPnTu01axyMinKFKTlXqb89l46lX24ei9zplA5+tWDiN4FDyte4QC
	 SKTqizrHzqDwDR4Oo9jUP7lYcVz86SWiHF8jAe6zumgFTAg5mfkHGJwZkoata64uMk
	 7z8lO1H4Ej4kCymbrtlkVuYLwWIuDFmYOwuRsA2c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE686F8069F; Wed, 14 Aug 2024 12:53:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 617ABF806A2;
	Wed, 14 Aug 2024 12:53:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68152F80301; Wed, 14 Aug 2024 10:41:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3AFBF8058C
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 10:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3AFBF8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HhnfN8j2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723624848; x=1755160848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4odUtP/AEWZfLJ3vVU3By93GqPTr0OWR8KAXnBFaSXQ=;
  b=HhnfN8j27J8gPwtPFK4LVqsguHKGCxcJTTnrCcpEGRlY350+cBri2NJI
   eACBD4yRhnFV25id30v6hjVdvMrZK+JNijqqPh7VZL1SVd8YEio3KxcRw
   ZNg36l3UnLoSKpYxLx1TvxFxPEh5/JffGZC/mZthgOK33oEw4V17zncM9
   JL+5+i0GdUFPw4+N6G1ldC5jsB+UmRGus0xhkOtdHlVvxBgFLcqcJ5wAF
   Jt9nHPQV55pqmaY/O6XRC7Rjj/pQHf+EY1Z1IL2gjI0sVJRG3bsw0DjOj
   /ZXkhtZLwodVbwtxEg0u17/bafSt+CgT/QWJT6fLbVMAp3KWHDQ1yF6hJ
   A==;
X-CSE-ConnectionGUID: cpTrN2ILS0qa+im5H8GKMg==
X-CSE-MsgGUID: wX2xnpEmT1S0RUfOA5ZaVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="24735342"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="24735342"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 01:40:44 -0700
X-CSE-ConnectionGUID: PI6VbwLZRE6AK+q+Yt4rXg==
X-CSE-MsgGUID: Wf09/Yv2TiaeZySrWhi2kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="63868161"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2024 01:40:41 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	andriy.shevchenko@linux.intel.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 14/14] ASoC: Intel: avs: Enable by default for all SST
 configurations
Date: Wed, 14 Aug 2024 10:39:29 +0200
Message-Id: <20240814083929.1217319-15-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814083929.1217319-1-cezary.rojewski@intel.com>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: COUY5AXRPKVWH67TDNY6KFTQSGLAFHVD
X-Message-ID-Hash: COUY5AXRPKVWH67TDNY6KFTQSGLAFHVD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/COUY5AXRPKVWH67TDNY6KFTQSGLAFHVD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The skylake-driver is deprecated in favour of the avs-driver. As the
latter supports all configurations of its predecessor and more, update
the existing selection mechanism to acknowledge the SST flag.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index f2dc82a2abc7..da7bac09acb4 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -422,8 +422,14 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	int ret;
 
 	ret = snd_intel_dsp_driver_probe(pci);
-	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_AVS)
+	switch (ret) {
+	case SND_INTEL_DSP_DRIVER_ANY:
+	case SND_INTEL_DSP_DRIVER_SST:
+	case SND_INTEL_DSP_DRIVER_AVS:
+		break;
+	default:
 		return -ENODEV;
+	}
 
 	ret = pcim_enable_device(pci);
 	if (ret < 0)
-- 
2.25.1

