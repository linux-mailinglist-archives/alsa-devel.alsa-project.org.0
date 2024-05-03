Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 173508BAE73
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 16:06:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90A17DF9;
	Fri,  3 May 2024 16:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90A17DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714745212;
	bh=+AJnVax2NKzC9XlJ/59ix8YgGvBsB3TV+IL9bfNoAkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MFd21S/ZZwQhFTTkALPHsRMjIcieGY9K74dUxqTeKVaDv3uN+Lji1yZz/G1oqyXvG
	 hNSUqeNg0Zz1ZB7xM0nmUhgFPtC1OWwe2w2C1zCFiEEtJsiF/EH2B5JNtELedUurPw
	 MbZeKoezXYlS9srsO1lemnyPZF+BkS8zubb1Z4uo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19FD9F806B0; Fri,  3 May 2024 16:04:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CAAEF806A5;
	Fri,  3 May 2024 16:04:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D0C9F8063D; Fri,  3 May 2024 16:04:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4830F80570
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 16:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4830F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gPfh8e59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745074; x=1746281074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+AJnVax2NKzC9XlJ/59ix8YgGvBsB3TV+IL9bfNoAkY=;
  b=gPfh8e59gwbk36kmXdIeGn5Zf5+vOkr044J8hsmrcDC0PKAyFjkRY2DS
   T9MWYHP85TUjK7mMiTzJMpWrpzI3TjenQ/sQ0oNK3s90uGkydVehCGbOB
   sD6VMH3BBHKlEWfbH1Fj+2mxdcwh5IyUutcKAwL1xkwscfVEaXD8mE8wb
   kKfJdvOm90MSZaFTxX8GjrsanUrZBFrX4gpesrFQIF0uOS1xSP7rJUo6V
   kghVwb30f1B13bdh1AicwGCxhJRp9m2gTI1lXVg6RkYHSKmLIbYxo87Ov
   lgagN6dCKoamYBLYvDIf9R4dv+EC3x4VwI4sTbxMzdGVeL6oVx8fFXhKd
   w==;
X-CSE-ConnectionGUID: Yeg3gCLmSSWdEv1/vHuBaQ==
X-CSE-MsgGUID: fpV5Dq1MTrGZzonb3PJepw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369538"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="14369538"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:23 -0700
X-CSE-ConnectionGUID: HU2pu+xvSKuUDVyMCLSw3A==
X-CSE-MsgGUID: OGdlV8/YTiem2YAJXvn1KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="64908120"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 8/9] ALSA: hda: clarify Copyright information
Date: Fri,  3 May 2024 09:03:58 -0500
Message-Id: <20240503140359.259762-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
References: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5LGIJGKYZTTFWAWHARZJCJ6LT4PGM4KX
X-Message-ID-Hash: 5LGIJGKYZTTFWAWHARZJCJ6LT4PGM4KX
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5LGIJGKYZTTFWAWHARZJCJ6LT4PGM4KX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For some reason a number of files included the "All rights reserved"
statement. Good old copy-paste made sure this mistake proliferated.

Remove the "All rights reserved" in all Intel-copyright to align with
internal guidance.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/pci/hda/hda_controller.c | 2 +-
 sound/pci/hda/hda_intel.c      | 2 +-
 sound/pci/hda/patch_hdmi.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 8af5ee1b0ea8..a16fb764f779 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -3,7 +3,7 @@
  *
  *  Implementation of primary alsa driver code base for Intel HD Audio.
  *
- *  Copyright(c) 2004 Intel Corporation. All rights reserved.
+ *  Copyright(c) 2004 Intel Corporation
  *
  *  Copyright (c) 2004 Takashi Iwai <tiwai@suse.de>
  *                     PeiSen Hou <pshou@realtek.com.tw>
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 6a3022a87245..82fc57b2e326 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -4,7 +4,7 @@
  *  hda_intel.c - Implementation of primary alsa driver code base
  *                for Intel HD Audio.
  *
- *  Copyright(c) 2004 Intel Corporation. All rights reserved.
+ *  Copyright(c) 2004 Intel Corporation
  *
  *  Copyright (c) 2004 Takashi Iwai <tiwai@suse.de>
  *                     PeiSen Hou <pshou@realtek.com.tw>
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 495d63101186..b68a1db0f7d9 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -3,7 +3,7 @@
  *
  *  patch_hdmi.c - routines for HDMI/DisplayPort codecs
  *
- *  Copyright(c) 2008-2010 Intel Corporation. All rights reserved.
+ *  Copyright(c) 2008-2010 Intel Corporation
  *  Copyright (c) 2006 ATI Technologies Inc.
  *  Copyright (c) 2008 NVIDIA Corp.  All rights reserved.
  *  Copyright (c) 2008 Wei Ni <wni@nvidia.com>
-- 
2.40.1

