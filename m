Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C52A7411B0
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 14:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04DAC845;
	Wed, 28 Jun 2023 14:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04DAC845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687956761;
	bh=qw8SQWQmPr/qqJ342TGeRW3bHoN4vBc/1sq6ZWaCaDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=idLbUcf8fZLZ80nkimy+NuAyZRCa4Baheacn+viPbW8VgYVz3YoB0zeNCse4M0GAi
	 NGgivVep7wxU5OqoblXNO9+VJd2rCKtZaQaIevSPwMpkOfL0r/TV2ncYP21cSnmp6M
	 lYc7P5LDHXe81UFWHzv0oOJhehZ2if3FN0hFJbeg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EA77F80570; Wed, 28 Jun 2023 14:51:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5AFBF80570;
	Wed, 28 Jun 2023 14:51:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A2A9F8055A; Wed, 28 Jun 2023 14:51:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 645DAF8051E
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 14:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 645DAF8051E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ls0+lnTz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687956654; x=1719492654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qw8SQWQmPr/qqJ342TGeRW3bHoN4vBc/1sq6ZWaCaDQ=;
  b=Ls0+lnTz4TvrH+iP4NzRnLWJLx0iOLuQhgEpv+sIycCQH4rIeL/ijTKU
   NXRmx+F2+bUfZzhgXW27IuURQz2YgPII8pn+7G2aGRdSQPFj5/p2gMb2w
   g0Fkz08EY2zlQiWpMivygq4tQL9tDKWDY5Zlp1vcLST/hVM+TE18Yxevd
   EX/rWj0t/nr9BfhwB6KPHB0rdmTeuBdzcZBdum6tc7tjtiUSeKBGL9B6t
   YLUFagJEcHycqMs4hAxcvzXTKpA3CivqGfxWBSXm/RlXZp6bcni9mUf5w
   bbx7ACixY5qFS8wTGd7SCbLtv6s7FUj5pvWo3C4+VIAvknzbxjL7D60kO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361875582"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="361875582"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 05:50:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="891035097"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="891035097"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga005.jf.intel.com with ESMTP; 28 Jun 2023 05:50:28 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [RFC PATCH 4/8] ALSA: hda/i915: Update PCI IDs
Date: Wed, 28 Jun 2023 22:51:31 +0200
Message-Id: <20230628205135.517241-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PNPK5JNDAJ77F6FFSEWDICWXA6VL467M
X-Message-ID-Hash: PNPK5JNDAJ77F6FFSEWDICWXA6VL467M
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PNPK5JNDAJ77F6FFSEWDICWXA6VL467M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use PCI device IDs from pci_ids.h header

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/hda/hdac_i915.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 161a9711cd63..e9342e74b739 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -11,10 +11,10 @@
 #include <sound/hda_i915.h>
 #include <sound/hda_register.h>
 
-#define IS_HSW_CONTROLLER(pci) (((pci)->device == 0x0a0c) || \
-				((pci)->device == 0x0c0c) || \
-				((pci)->device == 0x0d0c) || \
-				((pci)->device == 0x160c))
+#define IS_HSW_CONTROLLER(pci) (((pci)->device == PCI_DEVICE_ID_INTEL_HDA_HSW_0) || \
+				((pci)->device == PCI_DEVICE_ID_INTEL_HDA_HSW_2) || \
+				((pci)->device == PCI_DEVICE_ID_INTEL_HDA_HSW_3) || \
+				((pci)->device == PCI_DEVICE_ID_INTEL_HDA_BDW))
 
 /**
  * snd_hdac_i915_set_bclk - Reprogram BCLK for HSW/BDW
-- 
2.34.1

