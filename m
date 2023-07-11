Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D2174EFA4
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 14:59:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF85484D;
	Tue, 11 Jul 2023 14:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF85484D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689080347;
	bh=cqzG/YH5kuutolTR1cOIZEsbX/zwe6Apecdzhtfj8uI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D10chSneHyvuUz0XHsaU3AXjzS3heA58CY2IgP6L2RpUaUAcbPBf2PLREgr1yoGKv
	 Xdt5Iq6pX9dJNJNFypIz/Du55lN4+IDXubkVWWbk4X5MO9bthSBweA15N6XpbLRn/s
	 p7QmqV1iqRuom3qe+T9JYAvj15idxTWimpsTfiSE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A767FF80579; Tue, 11 Jul 2023 14:57:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6779AF80564;
	Tue, 11 Jul 2023 14:57:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B0D6F8053B; Tue, 11 Jul 2023 14:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A95BF800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 14:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A95BF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KNL8NvJa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689080238; x=1720616238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cqzG/YH5kuutolTR1cOIZEsbX/zwe6Apecdzhtfj8uI=;
  b=KNL8NvJacPANx++Hi7y4fm3eoMNrKNA4yInSYyOc+SY54BMjO3aM6f1w
   j6Fp8oXizlr3RwFcIAmuPTCZlFbxtlDcAFMAgMjlk85i0eogJaYMyeLDS
   8zVT782vmSSWk/Luivpxk4S+ihbngZ3HXMaQIr4Y9nkeGWJBUgiryLox8
   6gfL3+yqVUAkEMHd9fwE0mNOyw937ILuUtAb4mf59dpGWAsJb3XKijE0Y
   XmFs65c8CvODJIBpvR/aIrv5IS7AEf0sLHF4Lhr2PnasXGTkEPOyZXLM1
   NyDOTnu0Hx2kRQJsNGPIB339R7EYbL5fVN/7K3d3qkI8Uw2x7JTAf+N7J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="367187373"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="367187373"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 05:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="834666531"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="834666531"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2023 05:57:13 -0700
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
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 03/13] ALSA: hda: Add controller matching macros
Date: Tue, 11 Jul 2023 14:57:16 +0200
Message-Id: <20230711125726.3509391-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WT3LGAR7D73TWIV5JXMOBVWZ3U5C23SQ
X-Message-ID-Hash: WT3LGAR7D73TWIV5JXMOBVWZ3U5C23SQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WT3LGAR7D73TWIV5JXMOBVWZ3U5C23SQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some HDA controllers require additional handling, so there are macros to
match them, however those are spread across multiple files. Add them all
in one place, so they can be reused.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/hdaudio.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 2ffdf58bd6d4..aacacca456d5 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/iopoll.h>
+#include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/timecounter.h>
 #include <sound/core.h>
@@ -704,4 +705,30 @@ static inline unsigned int snd_array_index(struct snd_array *array, void *ptr)
 	for ((idx) = 0, (ptr) = (array)->list; (idx) < (array)->used; \
 	     (ptr) = snd_array_elem(array, ++(idx)))
 
+/*
+ * Device matching
+ */
+
+#define HDA_CONTROLLER_IS_HSW(pci) (pci_match_id((struct pci_device_id []){ \
+			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_HSW_0) }, \
+			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_HSW_2) }, \
+			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_HSW_3) }, \
+			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_BDW) }, \
+			{ } \
+		}, pci))
+
+#define HDA_CONTROLLER_IS_APL(pci) (pci_match_id((struct pci_device_id []){ \
+			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_APL) }, \
+			{ } \
+		}, pci))
+
+#define HDA_CONTROLLER_IN_GPU(pci) (HDA_CONTROLLER_IS_HSW(pci) || \
+		pci_match_id((struct pci_device_id []){ \
+			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_DG1) }, \
+			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_DG2_0) }, \
+			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_DG2_1) }, \
+			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_DG2_2) }, \
+			{ } \
+		}, pci))
+
 #endif /* __SOUND_HDAUDIO_H */
-- 
2.34.1

