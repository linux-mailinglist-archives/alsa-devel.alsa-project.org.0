Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA24765339A
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 16:44:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAC4D16D2;
	Wed, 21 Dec 2022 16:43:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAC4D16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671637487;
	bh=TtWEpHi67Od3014N5eEWarfcTeFcHd/VvoqL+GUUmiY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XY8ognebS7wH1IJhHG60BiTWJ+CDohVPPu4YiLsgZl0fLvaG9JXxSAW33fWN0YNVA
	 zg8GmRhXQ8Jv/Q59DvabsSqkkomuiRZVmJ/f5udSWvHUJsHe6LampHpI3sMctWAjrF
	 OMVrn/A4lj/txG653aw5vfVNYd4Ige3/Vtbftuo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83B47F801C1;
	Wed, 21 Dec 2022 16:43:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50DE2F8047B; Wed, 21 Dec 2022 16:43:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9F5D5F8024D
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 16:43:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F5D5F8024D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1671637431838706970-webhooks-bot@alsa-project.org>
References: <1671637431838706970-webhooks-bot@alsa-project.org>
Subject: Alsa device
Message-Id: <20221221154354.50DE2F8047B@alsa1.perex.cz>
Date: Wed, 21 Dec 2022 16:43:54 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

alsa-project/alsa-lib issue #288 was opened from andy155:

alsa device disappears completely after a random time usually after about a day

[    2.192815] ALSA device list:
[    2.192818]   #0: HDA ATI SB at 0xfe300000 irq 16
[    2.360481] Freeing unused kernel image (initmem) memory: 1424K
--
[54091.430777] Hardware name: To be filled by O.E.M. To be filled by O.E.M./M5A97 R2.0, BIOS 2603 06/26/2015
[54091.430779] RIP: 0010:snd_dma_vmalloc_get_addr+0x19/0x46
[54091.430787] Code: e9 c3 5a 58 00 48 03 77 18 48 89 f7 e9 0c 16 92 ff 53 48 8b 47 18 48 89 f3 81 e3 ff 0f 00 00 48 01 f0 48 89 c7 e8 f3 15 92 ff <48> 8b 38 48 89 c1 48 c1 ef 2d e8 76 fe ff ff 48 8b 10 48 89 c8 48
--
[54091.430812]  <TASK>
[54091.430814]  snd_dma_sg_fallback_alloc+0x148/0x16e
[54091.430819]  snd_dma_alloc_dir_pages+0x60/0x7e
[54091.430822]  do_alloc_pages+0x47/0x7e
[54091.430826]  snd_pcm_lib_malloc_pages+0xce/0x15a
[54091.430829]  snd_pcm_hw_params+0x175/0x393
[54091.430832]  snd_pcm_common_ioctl+0x355/0xe36
[54091.430835]  ? __seccomp_filter+0x81/0x36b
[54091.430841]  snd_pcm_ioctl+0x2a/0x31
[54091.430844]  vfs_ioctl+0x19/0x2a
--
[54091.430898] ---[ end trace 0000000000000000 ]---
[54091.430900] RIP: 0010:snd_dma_vmalloc_get_addr+0x19/0x46
[54091.430903] Code: e9 c3 5a 58 00 48 03 77 18 48 89 f7 e9 0c 16 92 ff 53 48 8b 47 18 48 89 f3 81 e3 ff 0f 00 00 48 01 f0 48 89 c7 e8 f3 15 92 ff <48> 8b 38 48 89 c1 48 c1 ef 2d e8 76 fe ff ff 48 8b 10 48 89 c8 48
--
[140042.480211] Hardware name: To be filled by O.E.M. To be filled by O.E.M./M5A97 R2.0, BIOS 2603 06/26/2015
[140042.480214] RIP: 0010:snd_dma_vmalloc_get_addr+0x19/0x46
[140042.480222] Code: e9 c3 5a 58 00 48 03 77 18 48 89 f7 e9 0c 16 92 ff 53 48 8b 47 18 48 89 f3 81 e3 ff 0f 00 00 48 01 f0 48 89 c7 e8 f3 15 92 ff <48> 8b 38 48 89 c1 48 c1 ef 2d e8 76 fe ff ff 48 8b 10 48 89 c8 48
--
[140042.480253]  <TASK>
[140042.480255]  snd_dma_sg_fallback_alloc+0x148/0x16e
[140042.480261]  snd_dma_alloc_dir_pages+0x60/0x7e
[140042.480265]  do_alloc_pages+0x47/0x7e
[140042.480269]  snd_pcm_lib_malloc_pages+0xce/0x15a
[140042.480274]  snd_pcm_hw_params+0x175/0x393
[140042.480278]  snd_pcm_common_ioctl+0x355/0xe36
[140042.480282]  ? __seccomp_filter+0x81/0x36b
[140042.480288]  snd_pcm_ioctl+0x2a/0x31
[140042.480291]  vfs_ioctl+0x19/0x2a
--
[140042.480365] ---[ end trace 0000000000000000 ]---
[140042.480367] RIP: 0010:snd_dma_vmalloc_get_addr+0x19/0x46
[140042.480372] Code: e9 c3 5a 58 00 48 03 77 18 48 89 f7 e9 0c 16 92 ff 53 48 8b 47 18 48 89 f3 81 e3 ff 0f 00 00 48 01 f0 48 89 c7 e8 f3 15 92 ff <48> 8b 38 48 89 c1 48 c1 ef 2d e8 76 fe ff ff 48 8b 10 48 89 c8 48

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/288
Repository URL: https://github.com/alsa-project/alsa-lib
