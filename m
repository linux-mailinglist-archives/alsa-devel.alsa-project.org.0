Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A18D75C3F7
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 12:02:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AB86210;
	Fri, 21 Jul 2023 12:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AB86210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689933772;
	bh=QaVZwz5XHSqcKeGym1qUE63N5ps7pz4p8nRkFtr4PR8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=u1T6A5sxloVSOcpw22fTdTjpTQIEGAVWFaZD+0P6J/u5VfSRJN2O80VtzDmBUJNMc
	 /c6lI7cBIizgBabjGoJoPvulAWJ9RE/C7qTldbBoC8MgyprhOKMxiXRYD9yX2J/sAP
	 URXKgwcR7ktvoeAYaOK/d4ISTVOefVlwIFGdNBK4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E187AF8032D; Fri, 21 Jul 2023 12:01:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64A2AF8032D;
	Fri, 21 Jul 2023 12:01:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E707CF8047D; Fri, 21 Jul 2023 12:01:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9068F8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 12:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9068F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iKdw1USi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689933710; x=1721469710;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QaVZwz5XHSqcKeGym1qUE63N5ps7pz4p8nRkFtr4PR8=;
  b=iKdw1USiS0tYyKjxbdEkHFsWG1ZaDa/GieC7B9aWbAbiX327HGhvPDx8
   2Lcj6pkWKXj7GKKClzkaGw05iqfALKIet8RgwASfHywZPQNg/RU3DBJes
   +hI7skUCkUNOrqEbOMluxalAPyCF63mis2+QIRff+YbyCDATTxs21Sm1R
   6K6zJSLysi/8sI2OcKMr5IFFsDJPjSPIZx46W15OA5LTOAJjLKJshbKZZ
   2L9RAocxr8GZRvrQi4ChJigmdGywtfUc9MN0pDhGl0C+qaJxWQdGJ9RB7
   Uu/ijC+M6VdxY5AAilUDRjnLR8aLc2OKrtBlAsN5J2bjMOYE07fsf3dXW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="370586973"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="370586973"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="724816792"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="724816792"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 21 Jul 2023 03:01:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AF70442D; Fri, 21 Jul 2023 13:01:48 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v1 1/1] ALSA: korg1212: Re-use sockptr_t and respective APIs
Date: Fri, 21 Jul 2023 13:01:46 +0300
Message-Id: <20230721100146.67293-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QNORPGJCUIIHSUUHS6MYVRGZAVFD7YNB
X-Message-ID-Hash: QNORPGJCUIIHSUUHS6MYVRGZAVFD7YNB
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QNORPGJCUIIHSUUHS6MYVRGZAVFD7YNB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The sockptr_t (despite the naming) is a generic type to hold kernel
or user pointer and there are respective APIs to copy data to or
from it. Replace open coded variants in the driver by them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/pci/korg1212/korg1212.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 33b4f95d65b3..92c3eab4d12c 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -10,6 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/sockptr.h>
 #include <linux/wait.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -1285,8 +1286,7 @@ static int snd_korg1212_silence(struct snd_korg1212 *korg1212, int pos, int coun
 }
 
 static int snd_korg1212_copy_to(struct snd_pcm_substream *substream,
-				void __user *dst, int pos, int count,
-				bool in_kernel)
+				sockptr_t dst, int pos, int count)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
         struct snd_korg1212 *korg1212 = snd_pcm_substream_chip(substream);
@@ -1306,24 +1306,21 @@ static int snd_korg1212_copy_to(struct snd_pcm_substream *substream,
 #if K1212_DEBUG_LEVEL > 0
 		if ( (void *) src < (void *) korg1212->recordDataBufsPtr ||
 		     (void *) src > (void *) korg1212->recordDataBufsPtr[8].bufferData ) {
-			printk(KERN_DEBUG "K1212_DEBUG: snd_korg1212_copy_to KERNEL EFAULT, src=%p dst=%p iter=%d\n", src, dst, i);
+			printk(KERN_DEBUG "K1212_DEBUG: %s KERNEL EFAULT, src=%p dst=%p iter=%d\n",
+			       __func__, src, sockptr_is_kernel(dst) ? dst.kernel : dst.user, i);
 			return -EFAULT;
 		}
 #endif
-		if (in_kernel)
-			memcpy((__force void *)dst, src, size);
-		else if (copy_to_user(dst, src, size))
+		if (copy_to_sockptr_offset(dst, i * size, src, size))
 			return -EFAULT;
 		src++;
-		dst += size;
 	}
 
 	return 0;
 }
 
 static int snd_korg1212_copy_from(struct snd_pcm_substream *substream,
-				  void __user *src, int pos, int count,
-				  bool in_kernel)
+				  sockptr_t src, int pos, int count)
 {
         struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_korg1212 *korg1212 = snd_pcm_substream_chip(substream);
@@ -1345,16 +1342,14 @@ static int snd_korg1212_copy_from(struct snd_pcm_substream *substream,
 #if K1212_DEBUG_LEVEL > 0
 		if ( (void *) dst < (void *) korg1212->playDataBufsPtr ||
 		     (void *) dst > (void *) korg1212->playDataBufsPtr[8].bufferData ) {
-			printk(KERN_DEBUG "K1212_DEBUG: snd_korg1212_copy_from KERNEL EFAULT, src=%p dst=%p iter=%d\n", src, dst, i);
+			printk(KERN_DEBUG "K1212_DEBUG: %s KERNEL EFAULT, src=%p dst=%p iter=%d\n",
+			       __func__, sockptr_is_kernel(src) ? src.kernel : src.user, dst, i);
 			return -EFAULT;
 		}
 #endif
-		if (in_kernel)
-			memcpy(dst, (__force void *)src, size);
-		else if (copy_from_user(dst, src, size))
+		if (copy_from_sockptr_offset(dst, src, i * size, size))
 			return -EFAULT;
 		dst++;
-		src += size;
 	}
 
 	return 0;
@@ -1644,15 +1639,14 @@ static int snd_korg1212_playback_copy(struct snd_pcm_substream *substream,
 				      int channel, unsigned long pos,
 				      void __user *src, unsigned long count)
 {
-	return snd_korg1212_copy_from(substream, src, pos, count, false);
+	return snd_korg1212_copy_from(substream, USER_SOCKPTR(src), pos, count);
 }
 
 static int snd_korg1212_playback_copy_kernel(struct snd_pcm_substream *substream,
 				      int channel, unsigned long pos,
 				      void *src, unsigned long count)
 {
-	return snd_korg1212_copy_from(substream, (void __user *)src,
-				      pos, count, true);
+	return snd_korg1212_copy_from(substream, KERNEL_SOCKPTR(src), pos, count);
 }
 
 static int snd_korg1212_playback_silence(struct snd_pcm_substream *substream,
@@ -1672,15 +1666,14 @@ static int snd_korg1212_capture_copy(struct snd_pcm_substream *substream,
 				     int channel, unsigned long pos,
 				     void __user *dst, unsigned long count)
 {
-	return snd_korg1212_copy_to(substream, dst, pos, count, false);
+	return snd_korg1212_copy_to(substream, USER_SOCKPTR(dst), pos, count);
 }
 
 static int snd_korg1212_capture_copy_kernel(struct snd_pcm_substream *substream,
 				     int channel, unsigned long pos,
 				     void *dst, unsigned long count)
 {
-	return snd_korg1212_copy_to(substream, (void __user *)dst,
-				    pos, count, true);
+	return snd_korg1212_copy_to(substream, KERNEL_SOCKPTR(dst), pos, count);
 }
 
 static const struct snd_pcm_ops snd_korg1212_playback_ops = {
-- 
2.40.0.1.gaa8946217a0b

