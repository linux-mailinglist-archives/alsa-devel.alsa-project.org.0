Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFD8F8CB9
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 11:21:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F493167F;
	Tue, 12 Nov 2019 11:20:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F493167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573554080;
	bh=m5Qal5rkoKhv2cZnc0RPUhouj/5WLfrJsSOOXts0k10=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FIJ64tXem3qhzN71o1Lh6D22nyJpZUGbvCAb26jRvwUnnKUGLxedaDSsCv3DhzvJz
	 aCVs6yJ9qvj3+d49ffRrBXS9gazdjMX1N0hWszBBQfDUdiFgvWoYJoZrdCePvDILdl
	 lJRvQav2LGR8PgzN01bD1w83jG/1pawTlcvleLwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D85BF80671;
	Tue, 12 Nov 2019 11:14:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2EC2F80483; Tue, 12 Nov 2019 07:51:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1328F802E0
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 07:51:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1328F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="cSKBTpCV"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dca56630001>; Mon, 11 Nov 2019 22:51:15 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 22:51:15 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 11 Nov 2019 22:51:15 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 06:51:15 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 12 Nov 2019 06:51:15 +0000
Received: from henryl-tu10x.nvidia.com (Not Verified[10.19.109.97]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dca56610001>; Mon, 11 Nov 2019 22:51:14 -0800
From: Henry Lin <henryl@nvidia.com>
To: 
Date: Tue, 12 Nov 2019 14:51:06 +0800
Message-ID: <20191112065108.7766-1-henryl@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573541475; bh=uaQU/d9YZIhPAFnpZUJ/WgAWpgBHxUlq6+ZdUcJ/2w0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Type;
 b=cSKBTpCVzDDNzjJOZ7Bs2de/FsrJr/iybeyLPt0/Bhxg+ztWxOu2eFJWEeGuvpwwm
 fV4+hrOnpMfYzdYKlMi/7pkPJpxI4gCxF5/ilFNsg9a/YmEAEMXY60m7izlUcMDNlI
 mmx1Y7VQ80UPo7UHJkya+Hq+mUbp3qgHNWb8NnYP1ty3J/nFQkPYa74lBmVO7x8Oih
 bXiBR17J8WI4rRYsM5LUKi8y/2WjNljnYJPiE0QQ8aRi6cMUuJjVS98nrCPi/5mx6w
 R0HpEUVA4YpkkbB/YkI2hADJVLr59tc9jbsubxx1TG6mEA6TWYXojp0giuvFROtfO8
 3CkkHxdUNBT0w==
X-Mailman-Approved-At: Tue, 12 Nov 2019 11:14:25 +0100
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Richard Fontana <rfontana@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Henry Lin <henryl@nvidia.com>, Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH] usb-audio: not submit urb for stopped endpoint
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

While output urb's snd_complete_urb() is executing, calling
prepare_outbound_urb() may cause endpoint stopped before
prepare_outbound_urb() returns and result in next urb submitted
to stopped endpoint. usb-audio driver cannot re-use it afterwards as
the urb is still hold by usb stack.

This change checks EP_FLAG_RUNNING flag after prepare_outbound_urb() again
to let snd_complete_urb() know the endpoint already stopped and does not
submit next urb.

We observed two scenario have this issue:
1. While executing snd_complete_urb() to complete an output urb, calling
   prepare_outbound_urb() let deactive_urbs() get called to unlink all
   active urbs.

[  268.097066] [<ffffffc000af7638>] deactivate_urbs+0xd4/0x108
[  268.102633] [<ffffffc000af87fc>] snd_usb_endpoint_stop+0x30/0x58
[  268.108636] [<ffffffc000b0272c>] snd_usb_substream_playback_trigger+0xa4/0xf4
[  268.115765] [<ffffffc000acdbd0>] snd_pcm_do_stop+0x4c/0x58
[  268.121245] [<ffffffc000acda24>] snd_pcm_action_single+0x40/0x88
[  268.127245] [<ffffffc000ace984>] snd_pcm_action+0x30/0xf0
[  268.132632] [<ffffffc000acea68>] snd_pcm_stop+0x24/0x2c
[  268.137851] [<ffffffc000ad5e14>] xrun+0x60/0x6c
[  268.142374] [<ffffffc000ad7a98>] snd_pcm_update_state+0xa8/0x10c
[  268.148374] [<ffffffc000ad7e24>] snd_pcm_update_hw_ptr0+0x328/0x344
[  268.154635] [<ffffffc000ad7ed8>] snd_pcm_period_elapsed+0x98/0xb0
[  268.160723] [<ffffffc000b02510>] prepare_playback_urb+0x46c/0x488
[  268.166810] [<ffffffc000af7d60>] prepare_outbound_urb+0x60/0x1d4
[  268.172805] [<ffffffc000af8d60>] snd_complete_urb+0x244/0x264
[  268.178548] [<ffffffc00081fb38>] __usb_hcd_giveback_urb+0x94/0x104
[  268.184721] [<ffffffc00081fbe4>] usb_hcd_giveback_urb+0x3c/0x114
[  268.190724] [<ffffffc00084d4b4>] handle_tx_event+0x1304/0x1434
[  268.196552] [<ffffffc00084dbc0>] xhci_handle_event+0x5dc/0x788
[  268.202378] [<ffffffc00084dee4>] xhci_irq+0x178/0x280

2. Userspace application stops playback from sound subsystem with below
   call stack:

[   28.506477] CPU: 5 PID: 1274 Comm: AudioOut_25 Not tainted 4.4.38-tegra #31
[   28.513430] Hardware name: quill (DT)
[   28.517085] Call trace:
[   28.519531] [<ffffffc000089a84>] dump_backtrace+0x0/0xf8
[   28.524837] [<ffffffc000089c44>] show_stack+0x14/0x1c
[   28.529885] [<ffffffc000401c54>] dump_stack+0xac/0xe0
[   28.534931] [<ffffffc000b35f94>] deactivate_urbs+0x148/0x180
[   28.540578] [<ffffffc000b37160>] snd_usb_endpoint_stop+0x30/0x58
[   28.546571] [<ffffffc000b410d8>] snd_usb_substream_playback_trigger+0xa4/0xf4
[   28.553699] [<ffffffc000b0c160>] snd_pcm_do_stop+0x4c/0x58
[   28.559179] [<ffffffc000b0bfb4>] snd_pcm_action_single+0x40/0x88
[   28.565178] [<ffffffc000b0cf14>] snd_pcm_action+0x30/0xf0
[   28.570568] [<ffffffc000b0fbc8>] snd_pcm_drop+0xac/0x140
[   28.575873] [<ffffffc000b0fc84>] snd_pcm_release_substream+0x28/0xb0
[   28.582212] [<ffffffc000b0fd48>] snd_pcm_release+0x3c/0x98
[   28.587686] [<ffffffc0001e3210>] __fput+0xe0/0x1ac
[   28.592469] [<ffffffc0001e3334>] ____fput+0xc/0x14
[   28.597253] [<ffffffc0000c2904>] task_work_run+0xa0/0xc0
[   28.602558] [<ffffffc0000897bc>] do_notify_resume+0x48/0x60
[   28.608123] [<ffffffc000084ee8>] work_pending+0x1c/0x20

In the call path, snd_pcm_stream spinlock has been acquired in
snd_pcm_drop(). If an output urb is completed between the spinlock
acquired and deactivate_urbs() clears EP_FLAG_RUNNING for the endpoint,
its executing of snd_complete_urb() will be blocked for acquiring
snd_pcm_stream spinlock in snd_pcm_period_elapsed() until the lock is
released in snd_pcm_drop(). When snd_complete_urb() continues, all jobs
for deactivate_urbs() are finished.

Signed-off-by: Henry Lin <henryl@nvidia.com>
---
 sound/usb/endpoint.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index a2ab8e8d3a93..4a9a2f6ef5a4 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -388,6 +388,9 @@ static void snd_complete_urb(struct urb *urb)
 		}
 
 		prepare_outbound_urb(ep, ctx);
+		/* can be stopped during prepare callback */
+		if (unlikely(!test_bit(EP_FLAG_RUNNING, &ep->flags)))
+			goto exit_clear;
 	} else {
 		retire_inbound_urb(ep, ctx);
 		/* can be stopped during retire callback */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
