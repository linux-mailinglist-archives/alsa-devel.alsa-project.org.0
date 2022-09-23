Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FAE5E7E83
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 17:35:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4533C210;
	Fri, 23 Sep 2022 17:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4533C210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663947347;
	bh=fC1gFTYs2lFiyZXA+dPl9iA5tQgV0M0F4lSM6HBIXHU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JaV7ic4DqqC3c50RNZvmcbZuLQX8SFyjJ4hsvRwcBtuvI6brOX0rH7v/MjCeOcexa
	 qyn1s2MzkxI9Oz4xryRop69RAr16r+TMheA/2/RV/zxIup3lFxClMqoS9GaS4V5fUs
	 xDFSh6L7sVsq6OB7sU/yZNo/Y/26NwOqZPAyDGzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99526F80124;
	Fri, 23 Sep 2022 17:34:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8688F80269; Fri, 23 Sep 2022 17:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEC51F80124
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 17:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEC51F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dfKBlaZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663947282; x=1695483282;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fC1gFTYs2lFiyZXA+dPl9iA5tQgV0M0F4lSM6HBIXHU=;
 b=dfKBlaZxxGc5+udBzph3ZoBqe0BORf3DzUmiKPZmroGC/D2DjTWQjaQT
 MkLQKskngEzMbG2HGT+MkILBOWj0bpReMohtgWrZDc3/+2B7tAeKZlAiT
 XeHhwa8IoM39SNYQ/PmVZtjd6XKvYJXbUGNJ6T8MEGRWplpsXOLZbdt3w
 oZYSHqatRYMT59HsfCE6gAOAvVzOLPI/OVlozyMG4rJZrYSUGd7TgrGPx
 D3f6lHRoAnQXb7lbkY8QbonCjeUuxXWrC4dktrGVPzmvWera5fxwlvOsc
 pW9evfMgrvWRIGzBwUQxZbHVr081rsKwBBrzyTupybwBUnSmykAkndCE4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="298215462"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="298215462"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 08:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="688750561"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2022 08:34:27 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: memalloc: use __GFP_RETRY_MAYFAIL for DMA mem allocs
Date: Fri, 23 Sep 2022 18:35:01 +0300
Message-Id: <20220923153501.3326041-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: peter.ujfalusi@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 kai.vehmanen@linux.intel.com
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

Use __GFP_RETRY_MAYFAIL instead of __GFP__NORETRY in
snd_dma_dev_alloc(), snd_dma_wc_alloc() and friends, to allocate pages
for device memory. The MAYFAIL flag retains the semantics of not
triggering the OOM killer, but lowers the risk of alloc failure.

MAYFAIL flag was added in commit dcda9b04713c3 ("mm, tree wide: replace
__GFP_REPEAT by __GFP_RETRY_MAYFAIL with more useful semantic").

This change addresses recurring failures with SOF audio driver in test
cases where a system suspend-resume stress test is run, combined with an
active high memory-load use-case. The failure typically shows up as:

[ 379.480229] sof-audio-pci-intel-tgl 0000:00:1f.3: booting DSP firmware
[ 379.484803] sof-audio-pci-intel-tgl 0000:00:1f.3: error: memory alloc failed: -12
[ 379.484810] sof-audio-pci-intel-tgl 0000:00:1f.3: error: dma prepare for ICCMAX stream failed

Multiple fixes to reduce the memory usage of DSP boot have been
identified in SOF driver, but even with those fixes, debug on affected
systems has shown that even a single page alloc may fail with
__GFP_NORETRY. When this occurs, system is under significant load on
physical memory, but a lot of reclaimable pages are available, so the
system has not run out of memory. With __GFP_RETRY_MAYFAIL, the errors
are not hit in these stress tests.

The alloc failure is severe as audio capability is completely lost if
alloc failure is hit at system resume.

An alternative solution was considered where the resources for DSP boot
would be kept allocated until driver is unbound. This would avoid the
allocation failure, but consume memory that is only needed temporarily
at probe and resume time. It seems better to not hang on to the memory,
but rather work a bit harder for allocating the pages at resume.

BugLink: https://github.com/thesofproject/linux/issues/3844
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/core/memalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 2c11413bea61..03cffe771366 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -21,7 +21,7 @@
 #define DEFAULT_GFP \
 	(GFP_KERNEL | \
 	 __GFP_COMP |    /* compound page lets parts be mapped */ \
-	 __GFP_NORETRY | /* don't trigger OOM-killer */ \
+	 __GFP_RETRY_MAYFAIL | /* don't trigger OOM-killer */ \
 	 __GFP_NOWARN)   /* no stack trace print - this call is non-critical */
 
 static const struct snd_malloc_ops *snd_dma_get_ops(struct snd_dma_buffer *dmab);

base-commit: db3ffa8e4f3ce1f910e337b4d8a8518c69420b65
-- 
2.37.3

