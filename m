Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A471079208A
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 08:26:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 170921FA;
	Tue,  5 Sep 2023 08:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 170921FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693895183;
	bh=y5mPr7hVbkfcFsO9lMJ0mIiETX6vmlwQobjUJxW/2tE=;
	h=Date:To:Cc:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OgRAAcFZIyOIZZhWKPIErIqjLpAU0bBzQpqJYee69gqwQa3/bpo67bJo5iJLiDf3L
	 hvDJ7ksul5IyXwmYhoWj2JB612VK7E46vTD5Cn1PuiuPiDDNl9oHV0T9Zybg4p5hzk
	 FML7VeKjV4EA00Dy52QNFWBE2iN2DWV/kODPjZ18=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 637D4F80567; Tue,  5 Sep 2023 08:24:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C319F80567;
	Tue,  5 Sep 2023 08:24:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C511F8047D; Mon,  4 Sep 2023 20:11:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com
 [IPv6:2a00:1098:0:86:1000:0:2:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 743B4F800AA
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 20:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 743B4F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sorrel.sh header.i=@sorrel.sh header.a=rsa-sha256
 header.s=mythic-beasts-k1 header.b=GZNHKEml
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sorrel.sh;
	s=mythic-beasts-k1; h=Subject:From:To:Date;
	bh=WzxnFchl8xWAhqYfGkql0WuLJUGC5JQrV7aNieQuIMQ=; b=GZNHKEmlbuCZD06Er7ZR/h3vhc
	C2x/eLLBtc1UAnMbq6jNplUqDf2HnqQ6Zg6EoFJu/1/IgVIIEJ8gZoXgC0a5RLOZPhq9KHLwwnw2T
	JGCn4NRR1faKHKr6RqnPOgh+iYEmsWT5TtrEnmvmiznsuPY1L2kH5WV3axLWmgdnqgIxJs+7Wvuhv
	8tN1XzD3uXXq88rDtpMLgvDK0eiiqcX4ENKKbSldKf+Grufj8JSv51VK+aUKxNvsrOUN3lPbJkQNC
	sSoLc062zCRubBE8c9rbUrnSXcnnoOPt2JUwMVDtT1OaQ/wGlGaOHBo17QttyG4ilrPWq0B7RDpRN
	bpn5yqiQ==;
Received: by mailhub-cam-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ash@sorrel.sh>)
	id 1qdE2M-001a0p-69; Mon, 04 Sep 2023 19:10:58 +0100
Message-ID: <8a555319-9f31-4ea2-878f-adc338bc40d4@sorrel.sh>
Date: Mon, 4 Sep 2023 19:10:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: alsa-devel@alsa-project.org
Cc: regressions@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
From: Ash Holland <ash@sorrel.sh>
Subject: [REGRESSION] rust midir MIDI library causes kernel oops
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BlackCat-Spam-Score: 0
X-MailFrom: ash@sorrel.sh
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7YSCZE7UAC45W4Y3WY372JXZFLJT2XJE
X-Message-ID-Hash: 7YSCZE7UAC45W4Y3WY372JXZFLJT2XJE
X-Mailman-Approved-At: Tue, 05 Sep 2023 06:24:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7YSCZE7UAC45W4Y3WY372JXZFLJT2XJE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

I upgraded to Linux 6.5 and found that my MIDI-input application no longer
works, and causes an oops when I launch it.

The application can be found at https://github.com/sersorrel/lp; `cargo run` is
enough to cause the oops, though it has many undocumented dependencies, sorry
(including a Novation Launchpad Mini Mk3). Once the oops occurs, it seems like
it can still send MIDI to the Launchpad (i.e. display things on it), but input
from the Launchpad doesn't work. I use NixOS with minimally-altered kernel
configuration (blacklisted r8152 module and `amdgpu.reset_method=4` parameter),
and was happily using kernel 6.4.9 or so before upgrading to 6.5.

I bisected this to:

commit f80e6d60d677be1d4dbbcdbf97379b8fbcf97ff0
Author: Takashi Iwai <tiwai@suse.de>
Date:   2023-05-23 09:53:38 +0200

     ALSA: seq: Clear padded bytes at expanding events

     There can be a small memory hole that may not be cleared at expanding
     an event with the variable length type.  Make sure to clear it.

     Reviewed-by: Jaroslav Kysela <perex@perex.cz>
     Link: https://lore.kernel.org/r/20230523075358.9672-18-tiwai@suse.de
     Signed-off-by: Takashi Iwai <tiwai@suse.de>

#regzbot introduced: f80e6d60d677be1d4dbbcdbf97379b8fbcf97ff0

I guess the problematic part is the `memset(buf + len, 0, newlen - len)`, which
tries to memset a buffer that can be allocated in userspace.

The oops:

Sep 02 13:40:35 kernel: BUG: unable to handle page fault for address: 000055efb39dffb5
Sep 02 13:40:35 kernel: #PF: supervisor write access in kernel mode
Sep 02 13:40:36 kernel: #PF: error_code(0x0003) - permissions violation
Sep 02 13:40:36 kernel: PGD 1aff38067 P4D 1aff38067 PUD 1aff37067 PMD 1a975f067 PTE 80000001b315b067
Sep 02 13:40:36 kernel: Oops: 0003 [#1] PREEMPT SMP NOPTI
Sep 02 13:40:36 kernel: CPU: 3 PID: 4441 Comm: midir ALSA inpu Not tainted 6.5.0 #1-NixOS
Sep 02 13:40:36 kernel: Hardware name: To Be Filled By O.E.M. X570S PG Riptide/X570S PG Riptide, BIOS P5.01 01/17/2023
Sep 02 13:40:36 kernel: RIP: 0010:memset+0xf/0x20
Sep 02 13:40:36 kernel: Code: 44 88 1f e9 83 69 01 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 49 89 f9 40 88 f0 48 89 d1 <f3> aa 4c 89 c8 e9 57 69 01 00 0f 1f 80 00 00 00 00 90 90 90 90 90
Sep 02 13:40:36 kernel: RSP: 0018:ffffa699c3607dd0 EFLAGS: 00010202
Sep 02 13:40:36 kernel: RAX: 0000000000000000 RBX: 0000000000000009 RCX: 0000000000000013
Sep 02 13:40:36 kernel: RDX: 0000000000000013 RSI: 0000000000000000 RDI: 000055efb39dffb5
Sep 02 13:40:36 kernel: RBP: 000000000000001c R08: 0000000000000009 R09: 000055efb39dffb5
Sep 02 13:40:36 kernel: R10: ffffa699c3607e68 R11: 0000000000000000 R12: 000055efb39dffac
Sep 02 13:40:36 kernel: R13: 000055efb39dff00 R14: ffff9d2a2bd671e0 R15: ffff9d2aa2b36d00
Sep 02 13:40:36 kernel: FS:  00007fe33e2d86c0(0000) GS:ffff9d38feac0000(0000) knlGS:0000000000000000
Sep 02 13:40:36 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Sep 02 13:40:36 kernel: CR2: 000055efb39dffb5 CR3: 000000018e25c000 CR4: 0000000000750ee0
Sep 02 13:40:36 kernel: PKRU: 55555554
Sep 02 13:40:36 kernel: Call Trace:
Sep 02 13:40:36 kernel:  <TASK>
Sep 02 13:40:36 kernel:  ? __die+0x23/0x70
Sep 02 13:40:36 kernel:  ? page_fault_oops+0x17d/0x4b0
Sep 02 13:40:36 kernel:  ? exc_page_fault+0x6d/0x150
Sep 02 13:40:36 kernel:  ? asm_exc_page_fault+0x26/0x30
Sep 02 13:40:36 kernel:  ? memset+0xf/0x20
Sep 02 13:40:36 kernel:  snd_seq_expand_var_event+0x6b/0xa0 [snd_seq]
Sep 02 13:40:36 kernel:  snd_seq_read+0x1b5/0x270 [snd_seq]
Sep 02 13:40:36 kernel:  vfs_read+0xaf/0x350
Sep 02 13:40:36 kernel:  ? srso_alias_return_thunk+0x5/0x7f
Sep 02 13:40:36 kernel:  ? __fget_light+0x9d/0x100
Sep 02 13:40:36 kernel:  ksys_read+0xbb/0xf0
Sep 02 13:40:36 kernel:  do_syscall_64+0x3e/0x90
Sep 02 13:40:36 kernel:  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
Sep 02 13:40:36 kernel: RIP: 0033:0x7fe33ebf074c
Sep 02 13:40:36 kernel: Code: ec 28 48 89 54 24 18 48 89 74 24 10 89 7c 24 08 e8 59 bb f8 ff 48 8b 54 24 18 48 8b 74 24 10 41 89 c0 8b 7c 24 08 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 34 44 89 c7 48 89 44 24 08 e8 af bb f8 ff 48
Sep 02 13:40:36 kernel: RSP: 002b:00007fe33e2d7a70 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
Sep 02 13:40:36 kernel: RAX: ffffffffffffffda RBX: 000055efb39d9440 RCX: 00007fe33ebf074c
Sep 02 13:40:36 kernel: RDX: 00000000000036b0 RSI: 000055efb39dff90 RDI: 0000000000000005
Sep 02 13:40:36 kernel: RBP: 0000000000000002 R08: 0000000000000000 R09: 0000000000000020
Sep 02 13:40:36 kernel: R10: 2b7b3401fd8f65e7 R11: 0000000000000246 R12: 00007fe33e2d7d01
Sep 02 13:40:36 kernel: R13: 00007fe33e2d7b80 R14: 00007fe32c000cd0 R15: 0000000000000001
Sep 02 13:40:36 kernel:  </TASK>
Sep 02 13:40:36 kernel: Modules linked in: snd_hrtimer snd_seq_midi snd_seq_dummy snd_seq_midi_event snd_seq xt_MASQUERADE xt_mark nft_chain_nat nf_nat af_packet rfkill amdgpu snd_hda_codec_realtek snd_hda_codec_generic nls_iso8859_1 nls_cp437 ledtrig_audio vfat fat amdxcp snd_hda_codec_hdmi iommu_v2 drm_buddy gpu_sc>
Sep 02 13:40:36 kernel:  xt_tcpudp nft_compat nf_tables sch_fq_codel nfnetlink uinput i2c_piix4 i2c_dev ctr atkbd libps2 serio vivaldi_fmap loop tun tap macvlan bridge stp llc kvm_amd ccp kvm drm irqbypass fuse deflate efi_pstore backlight configfs efivarfs dmi_sysfs ip_tables x_tables autofs4 dm_crypt cbc encrypted_>
Sep 02 13:40:36 kernel: CR2: 000055efb39dffb5
Sep 02 13:40:36 kernel: ---[ end trace 0000000000000000 ]---

thanks,
Ash
-- 
Ash Holland, she/her
