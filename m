Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF31C42D91
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:31:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 366A817D5;
	Wed, 12 Jun 2019 19:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 366A817D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560360704;
	bh=Go1sTdh8Hx/axDT1scOGOhu3F+GcRgF2au0kVki6hv0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l1D1G+7UkU9mr2fW8pl7SzhNKCv94WUOFuaiqzIaPbZGUbdk1CJ5fA2Q6taHcIxuJ
	 UYY6JgI9qX2y5WRDNweXpR4BweliYw+w74iaP7VFr5xkImclvheWwSJdl/mbY7YfP1
	 MKrJYSBj/GP+i6q1uEvqjOV8dFhKRgVY8iX6XXnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58E29F89759;
	Wed, 12 Jun 2019 19:24:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4D11F8973C; Wed, 12 Jun 2019 19:24:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5903F89731
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5903F89731
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:23:57 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2019 10:23:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:23:41 -0500
Message-Id: <20190612172347.22338-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
References: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Xun Zhang <xun2.zhang@intel.com>, broonie@kernel.org,
 Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 09/15] ASoC: SOF: Intel: hda-stream: fix a
	deadlock with bus->reg_lock
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Keyon Jie <yang.jie@linux.intel.com>

We should use irq disabled mode when read/write hda registers from
thread context, as we need to hold the same bus->reg_lock in interrupt
context hda_dsp_stream_interrupt(), otherwise, when we are holding the
lock in hda_dsp_stream_hw_free() and the interrupt arrives, we will get
deadlock in the interrupt handler.

Error logs like this:

[    5.603606]        CPU0
[    5.603606]        ----
[    5.603607]   lock(&(&bus->reg_lock)->rlock);
[    5.603608]   <Interrupt>
[    5.603609]     lock(&(&bus->reg_lock)->rlock);
[    5.603610]
                *** DEADLOCK ***

[    5.603611] 2 locks held by pulseaudio/2329:
[    5.603612]  #0: 000000005fcf26c6 (&card->mutex/1){+.+.}, at: dpcm_fe_dai_hw_free+0x2b/0x110 [snd_soc_core]
[    5.603619]  #1: 00000000ef369faf (&rtd->pcm_mutex){+.+.}, at: soc_pcm_hw_free+0x2e/0x1c0 [snd_soc_core]

The fix is simple, let's switch to use spin_lock/unlock_irq().

Reported-by: Xun Zhang <xun2.zhang@intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index d44318040948..23cff5aca007 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -448,12 +448,12 @@ int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	u32 mask = 0x1 << stream->index;
 
-	spin_lock(&bus->reg_lock);
+	spin_lock_irq(&bus->reg_lock);
 	/* couple host and link DMA if link DMA channel is idle */
 	if (!link_dev->link_locked)
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR,
 					SOF_HDA_REG_PP_PPCTL, mask, 0);
-	spin_unlock(&bus->reg_lock);
+	spin_unlock_irq(&bus->reg_lock);
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
