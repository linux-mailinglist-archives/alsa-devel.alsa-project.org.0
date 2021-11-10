Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EF744CB29
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Nov 2021 22:18:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 269C81657;
	Wed, 10 Nov 2021 22:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 269C81657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636579114;
	bh=hAfqW5rT3L4o31Bhgwvb/xZOEgAdyWGm6TwRPo+O/uM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KVZxhNvBy2dUtjmKh4xbIx4TKpVfRwd0+0mdLxe4gSN9X+OJKTErltnkZy9nLMFb7
	 gaQCKjNtxdOrX5ST9bSZv5HnAy+S3UGQqAny+PGSdjJVvOTI0jbx6OYpABElpHzJnZ
	 QdD49J1ao+ujKgnP00zJrbyB/fbcph72jrVO62Iw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8008AF804B1;
	Wed, 10 Nov 2021 22:17:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7AAFF8049E; Wed, 10 Nov 2021 22:17:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B88FF800C9
 for <alsa-devel@alsa-project.org>; Wed, 10 Nov 2021 22:17:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B88FF800C9
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="231503322"
X-IronPort-AV: E=Sophos;i="5.87,224,1631602800"; d="scan'208";a="231503322"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 13:10:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,224,1631602800"; d="scan'208";a="452455843"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003.jf.intel.com with ESMTP; 10 Nov 2021 13:10:39 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda: fix general protection fault in azx_runtime_idle
Date: Wed, 10 Nov 2021 23:03:07 +0200
Message-Id: <20211110210307.1172004-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: intel-gfx@lists.freedesktop.org, kai.vehmanen@linux.intel.com,
 mahesh.meena@intel.com
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

Fix a corner case between PCI device driver remove callback and
runtime PM idle callback.

Following sequence of events can happen:
  - at azx_create, context is allocated with devm_kzalloc() and
    stored as pci_set_drvdata()
  - user-space requests to unbind audio driver
  - dd.c:__device_release_driver() calls PCI remove
  - pci-driver.c:pci_device_remove() calls the audio
    driver azx_remove() callback and this is completed
  - pci-driver.c:pm_runtime_put_sync() leads to a call
    to rpm_idle() which again calls azx_runtime_idle()
  - the azx context object, as returned by dev_get_drvdata(),
    is no longer valid
  -> access fault in azx_runtime_idle when executing
	struct snd_card *card = dev_get_drvdata(dev);
	chip = card->private_data;
	if (chip->disabled || hda->init_failed)

This was discovered by i915_module_load test with 5.15.0 based
linux-next tree.

Example log caught by i915_module_load test with linux-next
https://intel-gfx-ci.01.org/tree/linux-next/

<4> [264.038232] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b73f0: 0000 [#1] PREEMPT SMP NOPTI
<4> [264.038248] CPU: 0 PID: 5374 Comm: i915_module_loa Not tainted 5.15.0-next-20211109-gc8109c2ba35e-next-20211109 #1
[...]
<4> [264.038267] RIP: 0010:azx_runtime_idle+0x12/0x60 [snd_hda_intel]
[...]
<4> [264.038355] Call Trace:
<4> [264.038359]  <TASK>
<4> [264.038362]  __rpm_callback+0x3d/0x110
<4> [264.038371]  rpm_idle+0x27f/0x380
<4> [264.038376]  __pm_runtime_idle+0x3b/0x100
<4> [264.038382]  pci_device_remove+0x6d/0xa0
<4> [264.038388]  device_release_driver_internal+0xef/0x1e0
<4> [264.038395]  unbind_store+0xeb/0x120
<4> [264.038400]  kernfs_fop_write_iter+0x11a/0x1c0

Fix the issue by setting drvdata to NULL at end of azx_remove().

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/hda_intel.c | 1 +
 1 file changed, 1 insertion(+)

Some non-persistent direct links showing the bug trigger on
different platforms with linux-next 20211109:
 - https://intel-gfx-ci.01.org/tree/linux-next/next-20211109/fi-tgl-1115g4/igt@i915_module_load@reload.html
 - https://intel-gfx-ci.01.org/tree/linux-next/next-20211109/fi-jsl-1/igt@i915_module_load@reload.html

Notably with 20211110 linux-next, the bug does not trigger:
 - https://intel-gfx-ci.01.org/tree/linux-next/next-20211110/fi-tgl-1115g4/igt@i915_module_load@reload.html

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 7762718cf429..b90c817e3f6f 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2364,6 +2364,7 @@ static void azx_remove(struct pci_dev *pci)
 		cancel_delayed_work_sync(&hda->probe_work);
 		device_lock(&pci->dev);
 
+		pci_set_drvdata(pci, NULL);
 		snd_card_free(card);
 	}
 }

base-commit: 6322ec8d0de924cf9672b23c1b5052afafc2f03b
-- 
2.33.0

