Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E4A32AC6D
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:57:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D52EF1AEB;
	Tue,  2 Mar 2021 22:56:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D52EF1AEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614722251;
	bh=Bm8j14YIoBgSpvdrcvUM7PoQCyFJAq8BG4s/PDx2eK0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YO0A0bh/9bJQBkfPHjb9uQH1M62SAShfLIrzldX0yUh4eeyWhdIVUmCmdRWckF4bw
	 RB1JK9I0Q2+35+g4mJIc552ExCGAdhqW/KOjn/KDoPtMghzuMFjFsHbvUzRZ4iyrg6
	 euvHLOZ9DEHJsWYZj1GfefmQ/VEsO349q0Zoy/zI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9FADF80475;
	Tue,  2 Mar 2021 22:55:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45173F8025B; Tue,  2 Mar 2021 22:55:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15EC5F80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:54:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15EC5F80227
IronPort-SDR: Kf/kR9Q2jx7uvYh8ahN/3nRanTJJVpAV7+OWmpHHLUmggTMLNw16Ha6FmL8MfPIv/X16SooNA/
 mdM9PjJFyXEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="166248703"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="166248703"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:54:46 -0800
IronPort-SDR: TbgzaU/ZztdCxnVeJAl+CSwAfGGUgGVrtKWrQzkCCbmuUW8LpwW+50LjTidQmNaGjJG1MBDS86
 pCffQJkDHzXw==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="518014314"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:54:45 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ALSA: pci: vx222: fix kernel-doc warning
Date: Tue,  2 Mar 2021 15:54:30 -0600
Message-Id: <20210302215430.87309-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302215430.87309-1-pierre-louis.bossart@linux.intel.com>
References: <20210302215430.87309-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

make W=1 warnings:

sound/pci/vx222/vx222_ops.c:86: warning: expecting prototype for
snd_vx_inb(). Prototype was for vx2_inb() instead

sound/pci/vx222/vx222_ops.c:97: warning: expecting prototype for
snd_vx_outb(). Prototype was for vx2_outb() instead

sound/pci/vx222/vx222_ops.c:110: warning: expecting prototype for
snd_vx_inl(). Prototype was for vx2_inl() instead

sound/pci/vx222/vx222_ops.c:121: warning: expecting prototype for
snd_vx_outl(). Prototype was for vx2_outl() instead

sound/pci/vx222/vx222_ops.c:221: warning: expecting prototype for
vx_setup_pseudo_dma(). Prototype was for vx2_setup_pseudo_dma()
instead

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/vx222/vx222_ops.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/pci/vx222/vx222_ops.c b/sound/pci/vx222/vx222_ops.c
index 23d4338dc553..a05537202738 100644
--- a/sound/pci/vx222/vx222_ops.c
+++ b/sound/pci/vx222/vx222_ops.c
@@ -78,7 +78,7 @@ static inline unsigned long vx2_reg_addr(struct vx_core *_chip, int reg)
 }
 
 /**
- * snd_vx_inb - read a byte from the register
+ * vx2_inb - read a byte from the register
  * @chip: VX core instance
  * @offset: register enum
  */
@@ -88,7 +88,7 @@ static unsigned char vx2_inb(struct vx_core *chip, int offset)
 }
 
 /**
- * snd_vx_outb - write a byte on the register
+ * vx2_outb - write a byte on the register
  * @chip: VX core instance
  * @offset: the register offset
  * @val: the value to write
@@ -102,7 +102,7 @@ static void vx2_outb(struct vx_core *chip, int offset, unsigned char val)
 }
 
 /**
- * snd_vx_inl - read a 32bit word from the register
+ * vx2_inl - read a 32bit word from the register
  * @chip: VX core instance
  * @offset: register enum
  */
@@ -112,7 +112,7 @@ static unsigned int vx2_inl(struct vx_core *chip, int offset)
 }
 
 /**
- * snd_vx_outl - write a 32bit word on the register
+ * vx2_outl - write a 32bit word on the register
  * @chip: VX core instance
  * @offset: the register enum
  * @val: the value to write
@@ -213,7 +213,7 @@ static int vx2_test_xilinx(struct vx_core *_chip)
 
 
 /**
- * vx_setup_pseudo_dma - set up the pseudo dma read/write mode.
+ * vx2_setup_pseudo_dma - set up the pseudo dma read/write mode.
  * @chip: VX core instance
  * @do_write: 0 = read, 1 = set up for DMA write
  */
-- 
2.25.1

