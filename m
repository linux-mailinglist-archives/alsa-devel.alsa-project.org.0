Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9B750E04A
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 14:29:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 446A016F3;
	Mon, 25 Apr 2022 14:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 446A016F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650889742;
	bh=WKhcnxQ8X38lAKqCeWDogDZnUATsgztYcQbAfONXp30=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=reK7etGx1sgrTWQjYYaKEcL8LsL4zwKGvTIoZYFOVZyXrHorRcU8WDX0q09D1HWEk
	 XJus+o9QMdr2JnItv9HvfPtbTlvlELjzrGQpYeOX1lXQ1HARP6ptLK5VfRSh9KvBs5
	 KPOBJ2tQXtUUOP1WWO0yU1d1r0zs9Jll9GCtTx28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D87CDF8016A;
	Mon, 25 Apr 2022 14:28:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FEB7F8016A; Mon, 25 Apr 2022 14:28:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D460F800CB
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 14:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D460F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="V6S9Anz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650889678; x=1682425678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WKhcnxQ8X38lAKqCeWDogDZnUATsgztYcQbAfONXp30=;
 b=V6S9Anz5QGjcOxV/cb9d94C2VxEYnQ3aDABUG8nc6Z4Vw6c+9Tkz43zP
 w19OV4UbKkxrKjI9zHRjKBTGhXKF9zHphkZGH/xuRb/t+PRkg1SRZfuQv
 qBetAP/JLnDSRIzaKi0hTUKwgjlCIBARzTm8nhi7if7o6U6RJCmqOwep3
 qo002wVcfKuOdQ+5si/dlIt5vAmT5AJ1+KZzLFUzH+K2Iah7tDTF3G8BG
 96zj5nHOCNlQVYHw57IC+vKYwDUMzmZCppHPnbL1g0d26l6FeA9F03yAU
 zGxBCodcvHomU56w2YbHxScne8he0qlB9RFEK2P9DVWK2kC2gNcXyfhYa A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="265397560"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="265397560"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 05:27:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="557706729"
Received: from mylinen-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.32.111])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 05:27:50 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.de
Subject: [PATCH] ALSA: memalloc: Add fallback SG-buffer free if fallback is
 used for noncontig
Date: Mon, 25 Apr 2022 15:28:14 +0300
Message-Id: <20220425122814.751-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
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

From: Peter Ujfalusi <peter.ujfalusi@gmail.com>

If the dma_alloc_noncontiguous() fails in snd_dma_noncontig_alloc() we are
taking a fallback path which should be taken into account on the free path
since the way to free the two type of allocations are not the same.

Fixes: 925ca893b4a6 ("ALSA: memalloc: Add fallback SG-buffer allocations for x86")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
Hi Takashi,

I'm not sure about thisa as I can not get my systems to use the fallback, but in
theory this shiuld be done, no?

Since you have introduced the fallback, I believe there are cases when it is
taken and it might be related to some strange memory allocation errors happening
in SOF during firmware loading, like:
https://github.com/thesofproject/linux/issues/3609
https://github.com/thesofproject/linux/issues/3584
https://github.com/thesofproject/linux/issues/3530

Regards,
Peter

 sound/core/memalloc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 15dc7160ba34..475fd38a4a48 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -537,6 +537,13 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 
 static void snd_dma_noncontig_free(struct snd_dma_buffer *dmab)
 {
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK ||
+	    dmab->dev.type == SNDRV_DMA_TYPE_DEV_SG_FALLBACK) {
+		/* The allocation is done with a fallback, use the matching free */
+		snd_dma_sg_fallback_free(dmab);
+		return;
+	}
+
 	dma_vunmap_noncontiguous(dmab->dev.dev, dmab->area);
 	dma_free_noncontiguous(dmab->dev.dev, dmab->bytes, dmab->private_data,
 			       dmab->dev.dir);
-- 
2.36.0

