Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8C83409B6
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 17:10:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3015916AA;
	Thu, 18 Mar 2021 17:09:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3015916AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616083835;
	bh=K15/u2IZEo5ny/u4YD+Vx8Fh3TIIDcMZpEhXaoU6Fk0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JiGg4BFWC0eef38AnZ7erka4OrctK01iEGYbg18jHujcG58vn+UOB1AVx3Iti3Hck
	 BCTcVQ+osYrxA82tYxTQAPLuq6EwTPVtODULRqVoIz584UrjPmvESPaMqnQDkXZm7i
	 BGSAv+R88lRemM0b1spS0w+osAxzXqMLfHA7gRTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06F6BF8032C;
	Thu, 18 Mar 2021 17:08:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B7D3F802E3; Thu, 18 Mar 2021 17:08:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49A87F80163
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 17:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49A87F80163
IronPort-SDR: +cFJc66K+5frK22PeCZGks4j0hDx78HAG7PaS31L+6T65Fbw5RDbX2furgMc8oWhc5bytsCY9z
 ysDPmANHwpJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="186360163"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="186360163"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 09:08:01 -0700
IronPort-SDR: 0cq4J7ABMrjPNIo7YeuB3udWfkENPgXQL35Qa0W9Qly0vasZWdXYWnHIrD4VhKje9xv4WjGJMw
 2GRkr/cNwqpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="413142119"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga008.jf.intel.com with ESMTP; 18 Mar 2021 09:07:59 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 3/3] ALSA: hda: Revert "ALSA: hda: Allow setting
 preallocation again for x86"
Date: Thu, 18 Mar 2021 17:06:18 +0100
Message-Id: <20210318160618.2504068-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318160618.2504068-1-amadeuszx.slawinski@linux.intel.com>
References: <20210318160618.2504068-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Cezary Rojewski <cezary.rojewski@intel.com>,
 alsa-devel@alsa-project.org, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This reverts commit f8e4ae10de43 ("ALSA: hda: Allow setting
preallocation again for x86").

The reverted commit itself is a revert of c31427d0d21e ("ALSA: hda: No
preallocation on x86 platforms"). It was needed because HDA allowed very
big allocations, up to 1GB per stream. However as previous commit in
this series changes maximum allowed allocation per stream to 4MB, we can
safely revert it back.

On systems where there are a lot of FrontEnds, when
CONFIG_SND_HDA_PREALLOC_SIZE != 0  ALSA core allocates memory for each
FE, which may cause out of memory problems due to per card limit. Force
config to 0 on X86, so memory will be allocated on as needed basis.

Bug: https://bugzilla.kernel.org/show_bug.cgi?id=201251#c322
Suggested-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---

Changes:

v2: improve commit message as requested to explain, why it is safe to
revert

---
 sound/hda/Kconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
index 57595f1552c9..741179ccbd4e 100644
--- a/sound/hda/Kconfig
+++ b/sound/hda/Kconfig
@@ -21,17 +21,16 @@ config SND_HDA_EXT_CORE
        select SND_HDA_CORE
 
 config SND_HDA_PREALLOC_SIZE
-	int "Pre-allocated buffer size for HD-audio driver"
+	int "Pre-allocated buffer size for HD-audio driver" if !SND_DMA_SGBUF
 	range 0 32768
-	default 2048 if SND_DMA_SGBUF
+	default 0 if SND_DMA_SGBUF
 	default 64 if !SND_DMA_SGBUF
 	help
 	  Specifies the default pre-allocated buffer-size in kB for the
 	  HD-audio driver.  A larger buffer (e.g. 2048) is preferred
 	  for systems using PulseAudio.  The default 64 is chosen just
 	  for compatibility reasons.
-	  On x86 systems, the default is 2048 as a reasonable value for
-	  most of modern systems.
+	  On x86 systems, the default is zero as we need no preallocation.
 
 	  Note that the pre-allocation size can be changed dynamically
 	  via a proc file (/proc/asound/card*/pcm*/sub*/prealloc), too.
-- 
2.25.1

