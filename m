Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E33F1C6
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 10:07:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA7E71662;
	Tue, 30 Apr 2019 10:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA7E71662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556611660;
	bh=bw7dd9rUB4ZyVZJGNYan/WtaSJCehoMXbda6dsRcf0I=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ytcu/MiVd4bdCtJ/KdbGQUyTehSo362fiJ1Fu6fRxHHw+4wnorEGcYfLn2jNqZqyh
	 hNJbHKvvL6iDSgOdeaPu8qgGTP1bAtH6QH/k2PcLPXuLywhL06slT8EyIU464lFEM/
	 JXp3VJe9x4geLwBLgn2gdceEnpx+yNRCcRUXrrt4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0240FF896AA;
	Tue, 30 Apr 2019 10:05:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBEC1F896AA; Tue, 30 Apr 2019 08:12:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45886F80759
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 08:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45886F80759
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3U6CAK5017535
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Mon, 29 Apr 2019 23:12:10 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
 Mon, 29 Apr 2019 23:12:09 -0700
From: Song liwei <liwei.song@windriver.com>
To: <alsa-devel@alsa-project.org>
Date: Tue, 30 Apr 2019 02:10:53 -0400
Message-ID: <1556604653-47363-1-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Apr 2019 10:05:53 +0200
Cc: Yu Zhao <yuzhao@google.com>, LiweiSong <liwei.song@windriver.com>,
 Keyon Jie <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH] ALSA: hda: check RIRB to avoid use NULL pointer
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

From: Liwei Song <liwei.song@windriver.com>

Fix the following BUG:

BUG: unable to handle kernel NULL pointer dereference at 000000000000000c
Workqueue: events azx_probe_work [snd_hda_intel]
RIP: 0010:snd_hdac_bus_update_rirb+0x80/0x160 [snd_hda_core]
Call Trace:
 <IRQ>
 azx_interrupt+0x78/0x140 [snd_hda_codec]
 __handle_irq_event_percpu+0x49/0x300
 handle_irq_event_percpu+0x23/0x60
 handle_irq_event+0x3c/0x60
 handle_edge_irq+0xdb/0x180
 handle_irq+0x23/0x30
 do_IRQ+0x6a/0x140
 common_interrupt+0xf/0xf

The Call Trace happened when run kdump on a NFS rootfs system.
Exist the following calling sequence when boot the second kernel:

azx_first_init()
   --> azx_acquire_irq()
                      <-- interrupt come in, azx_interrupt() was called
   --> hda_intel_init_chip()
      --> azx_init_chip()
         --> snd_hdac_bus_init_chip()
              --> snd_hdac_bus_init_cmd_io();
                    --> init rirb.buf and corb.buf

Interrupt happened after azx_acquire_irq() while RIRB still didn't got
initialized, then NULL pointer will be used when process the interrupt.

Check the value of RIRB to ensure it is not NULL, to aviod some special
case may hang the system.

Fixes: 14752412721c ("ALSA: hda - Add the controller helper codes to hda-core module")
Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 sound/hda/hdac_controller.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index 74244d8e2909..2f0fa5353361 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -195,6 +195,9 @@ void snd_hdac_bus_update_rirb(struct hdac_bus *bus)
 		return;
 	bus->rirb.wp = wp;
 
+	if (!bus->rirb.buf)
+		return;
+
 	while (bus->rirb.rp != wp) {
 		bus->rirb.rp++;
 		bus->rirb.rp %= AZX_MAX_RIRB_ENTRIES;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
