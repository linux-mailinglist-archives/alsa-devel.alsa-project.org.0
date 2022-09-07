Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B82CC5AFC08
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 07:54:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20FCA950;
	Wed,  7 Sep 2022 07:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20FCA950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662530085;
	bh=lVZdGItHyUy3HBM+gA9ehpOh4ieVKRxUtDHsoJaeBj8=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WwBhaGnxZ/77Lv0ch5M3wvDdupAjbXupqoy0JMt2zLsovH5BrSdSgYGXlVWeefjJg
	 gXiYDnRkUOBaqDnwcQmq5ocI+64dDK3yAR7GOvNglwsiC3DBUwo2I9srUP/U6Nkq8x
	 asChCU65SGtetJOPJjpp+7geAN5xWokv8adQJ2Sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 668C7F80118;
	Wed,  7 Sep 2022 07:53:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64400F800E9; Wed,  7 Sep 2022 03:18:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from devnull.tasossah.com (devnull.tasossah.com
 [IPv6:2001:41d0:1:e60e::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18D92F800E9
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 03:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18D92F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=devnull.tasossah.com
 header.i=@devnull.tasossah.com header.b="qmFw51LA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:Content-Type:
 Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q71WqvWLWUjrI5AqinecaUm3s2cTcuSNcpFo9Nx2+Yw=; b=qmFw51LAEwU4aImcBHMDhnqmEY
 pXJJrRPLqzij7UntBfcQL0OMYsZ7p2YjzGCFwV1lQs2vPGXyslK0IzHcpe3I0fm3j6jw3Q4oby3Qs
 E4nJ3IZ6zKU/l3RTddv60wjQrLCA0qvTeF2sZOhUwfKYXw54ohXgK3Dq6QeDCZdMelyk=;
Received: from [2a02:587:6a02:2200::298]
 by devnull.tasossah.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <tasos@tasossah.com>)
 id 1oVjhZ-000P0y-7A; Wed, 07 Sep 2022 04:18:01 +0300
Message-ID: <3707dcab-320a-62ff-63c0-73fc201ef756@tasossah.com>
Date: Wed, 7 Sep 2022 04:18:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: alsa-devel@alsa-project.org
From: Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH] ALSA: emu10k1: Fix out of bounds access in
 snd_emu10k1_pcm_channel_alloc()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 07 Sep 2022 07:53:00 +0200
Cc: tasos@tasossah.com, tiwai@suse.com
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

The voice allocator sometimes begins allocating from near the end of the
array and then wraps around, however snd_emu10k1_pcm_channel_alloc()
accesses the newly allocated voices as if it never wrapped around.

This results in out of bounds access if the first voice has a high enough
index so that first_voice + requested_voice_count > NUM_G (64).
The more voices are requested, the more likely it is for this to occur.

This was initially discovered using PipeWire, however it can be reproduced
by calling aplay multiple times with 16 channels:
aplay -r 48000 -D plughw:CARD=Live,DEV=3 -c 16 /dev/zero

UBSAN: array-index-out-of-bounds in sound/pci/emu10k1/emupcm.c:127:40
index 65 is out of range for type 'snd_emu10k1_voice [64]'
CPU: 1 PID: 31977 Comm: aplay Tainted: G        W IOE      6.0.0-rc2-emu10k1+ #7
Hardware name: ASUSTEK COMPUTER INC P5W DH Deluxe/P5W DH Deluxe, BIOS 3002    07/22/2010
Call Trace:
<TASK>
dump_stack_lvl+0x49/0x63
dump_stack+0x10/0x16
ubsan_epilogue+0x9/0x3f
__ubsan_handle_out_of_bounds.cold+0x44/0x49
snd_emu10k1_playback_hw_params+0x3bc/0x420 [snd_emu10k1]
snd_pcm_hw_params+0x29f/0x600 [snd_pcm]
snd_pcm_common_ioctl+0x188/0x1410 [snd_pcm]
? exit_to_user_mode_prepare+0x35/0x170
? do_syscall_64+0x69/0x90
? syscall_exit_to_user_mode+0x26/0x50
? do_syscall_64+0x69/0x90
? exit_to_user_mode_prepare+0x35/0x170
snd_pcm_ioctl+0x27/0x40 [snd_pcm]
__x64_sys_ioctl+0x95/0xd0
do_syscall_64+0x5c/0x90
? do_syscall_64+0x69/0x90
? do_syscall_64+0x69/0x90
entry_SYSCALL_64_after_hwframe+0x63/0xcd

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 sound/pci/emu10k1/emupcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index b2701a4452d8..48af77ae8020 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -124,7 +124,7 @@ static int snd_emu10k1_pcm_channel_alloc(struct snd_emu10k1_pcm * epcm, int voic
 	epcm->voices[0]->epcm = epcm;
 	if (voices > 1) {
 		for (i = 1; i < voices; i++) {
-			epcm->voices[i] = &epcm->emu->voices[epcm->voices[0]->number + i];
+			epcm->voices[i] = &epcm->emu->voices[(epcm->voices[0]->number + i) % NUM_G];
 			epcm->voices[i]->epcm = epcm;
 		}
 	}
-- 
2.25.1

