Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDD39FDEDE
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Dec 2024 13:58:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F49F6056D;
	Sun, 29 Dec 2024 13:58:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F49F6056D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735477091;
	bh=UnArMA/fGfArM6oTypl+dq5ZOo0yd+Q1EvViV6j0xgY=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bcca1Om2AQpFHrNzIOu8V2Ut4AB5dBt4VrWJO5UGBxoBIhQRwfxG1iZEQchruzAQn
	 R7Y0o1QWPQcsQPK5Aul6ZyR2LRRe3KdWymW83A7H8mJJAeuumYY9VXrB5KE22GGuJJ
	 FkrdzJOnJabyC2ajwpk4m7BoTn3UINQZGB83/b1o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9938F805C6; Sun, 29 Dec 2024 13:56:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 256BBF805BA;
	Sun, 29 Dec 2024 13:56:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57355F804CC; Thu, 26 Dec 2024 07:08:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FBB3F800B0
	for <alsa-devel@alsa-project.org>; Thu, 26 Dec 2024 07:08:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FBB3F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn
 header.a=rsa-sha256 header.s=sorc2401 header.b=nRKuUy4b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1735193306;
	bh=RewUZwc/fweWU9IO3sqfsaJV2JhPK3JYS/iQLUZBALs=;
	h=Mime-Version:Subject:From:Date:Message-Id:To;
	b=nRKuUy4beC/g6w/WczcFA+kQQlZp0/DYE3YmA7u+20Jdu8TcK6F+WjB5HuvLegXba
	 Tj67u4WSBmBjXJF2RhAVDCZBrdDHNWj63JP2Tr9ngn4Qh8MwqJFlRF2wH9HZCkkKzR
	 Heca2fRoPNOEOsXL4Zl66cOIIaH7bY185a3VteGY=
X-QQ-mid: bizesmtpsz5t1735193304tm22dr0
X-QQ-Originating-IP: tSGkTe2Sd26OU+7JdOuv+mZQ1zoORz5PJRzDsxP1DFc=
Received: from smtpclient.apple ( [202.120.235.170])
	by bizesmtp.qq.com (ESMTP) with
	id ; Thu, 26 Dec 2024 14:08:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2540630981220103529
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: Bug: slab-out-of-bounds in snd_seq_oss_synth_sysex
From: Kun Hu <huk23@m.fudan.edu.cn>
In-Reply-To: <B1CA9370-9EFE-4854-B8F7-435E0B9276C6@m.fudan.edu.cn>
Date: Thu, 26 Dec 2024 14:08:11 +0800
Cc: linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "jjtan24@m.fudan.edu.cn" <jjtan24@m.fudan.edu.cn>,
 alsa-devel@alsa-project.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A2D50A73-EF90-486F-9F5C-FFC4F0906A01@m.fudan.edu.cn>
References: <2B7E93E4-B13A-4AE4-8E87-306A8EE9BBB7@m.fudan.edu.cn>
 <B1CA9370-9EFE-4854-B8F7-435E0B9276C6@m.fudan.edu.cn>
To: perex@perex.cz,
 tiwai@suse.com,
 vkoul@kernel.org,
 lars@metafoo.de,
 broonie@kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:m.fudan.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M59Ywtx0bkALgCg/C1sl9moKuT9DPNdTDbKng4UGmta8iPCjQfAyKbvc
	OOPV/QmTXsLOZN1vT5by35vTiQYm0v/FnJ8U+ZNStHoFSMlxmTRutwZVOdRi0WCKsYTl+Xk
	wLn04lFng8wsjXMRwa1t+cPmClmU8kQDStygajrX2Y246WTvVe0ztTKW4gc14jsjkvYF6ta
	+28OQbg/wrcvh5r2JRUnjLUQL7SMcM+erNNyDEw3fry2xN9f00d2XqSwg0mgDTuEK0/RIQe
	6OQMtXEFBHrBJDKjKntFwgfoQeHe8RUQ1Pe0q3aa6DFtftJ2yUQS63SQp32djz0uoRxhBW8
	gG/9MMOuRvOhakMfLHueifUgZ3eReh0a8qy6pYcbM5jEIx2OETKTKSr3D2SFIGQZu6QjUi5
	AV9mtM7ZTd+XGd8tPUOhFSISVlVXAPyvt+w98jKpZYCdJbIKuFfi/DV94Mc606/0xAvznrj
	Ob/eoS6p7wH6UIfhjo8UOPFoNj1zGnNbwKyIFDGBU9Nm7MhsskWxAyUUnAoVpDu2WU2JD1+
	WJnTeeSr486eWkBkmURv5HqgjiHEegrWB1Hy4nB4zGMtUnBjYStGixXISrjYOodTlK4Z6u8
	H21fkkbXTiKmPFz8pjh+it4y+7qDInmAm3tt/AuFl07nu/KRFRVfrBQKOYEyFkYZ6f3qxPN
	5WXRYgcYHcZGnTAT+t8WIZC76Ea/WZoW/RVx+kTObgtH0OjytMB7LxKhkYPs0hAW+7gb7sY
	s+ubLQwjkJAhZ3Y8dG3WBs4+HIEDP5fpvePa5Hkh96KrzPbHYUHkWM/0fclwaA8+neDj2hg
	CcFCvzviWVEw0d55Ghm+AZjeFi1CqP01goyWsMud1DcG7TtCeOlZqCnPAr/loWGX8frNjnS
	qJJG9OMBGxc/M07N+8qQUq+uTbV9ekuFyRIm9PZ9o1lVEhEPx3PhldvE/bYv5N3+N5miQ5e
	vSyvutJymoUbVU+964ityiiHAXLs00/pWD5bnOU/kasVuFw==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-MailFrom: huk23@m.fudan.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5J5OVKK4UIHWA4ADERRH2HUCS7T3FJWF
X-Message-ID-Hash: 5J5OVKK4UIHWA4ADERRH2HUCS7T3FJWF
X-Mailman-Approved-At: Sun, 29 Dec 2024 12:56:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5J5OVKK4UIHWA4ADERRH2HUCS7T3FJWF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>> BUG: KASAN: slab-out-of-bounds in snd_seq_oss_synth_sysex+0x5d1/0x6c0 =
sound/core/seq/oss/seq_oss_synth.c:516

>=20
> We further analyzed the issue at line 516 in =
./sound/core/seq/oss/seq_oss_synth.c.=20
> The slab-out-of-bounds crash occurs in line 509, when sysex->len =3D =
128. Specifically, the write operation to dest[0] accesses memory beyond =
the bounds of sysex->buf (128 byte).
> To resolve this issue, we suggest adding 6 lines of code to validate =
the legality of the address write to sysex->buf before entering the =
loop:
>=20
> if (sysex->len >=3D MAX_SYSEX_BUFLEN) {=20
>   sysex->len =3D 0;=20
>   sysex->skip =3D 1;=20
>   return -EINVAL;  /* Exit early if sysex->len is out of bounds */=20
> }

If you need any more information, please don't hesitate to let me know.

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
Best regards,
Kun Hu


> 2024=E5=B9=B412=E6=9C=8825=E6=97=A5 13:37=EF=BC=8CKun Hu =
<huk23@m.fudan.edu.cn> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hello,
>=20
>> BUG: KASAN: slab-out-of-bounds in snd_seq_oss_synth_sysex+0x5d1/0x6c0 =
sound/core/seq/oss/seq_oss_synth.c:516
>=20
> We further analyzed the issue at line 516 in =
./sound/core/seq/oss/seq_oss_synth.c.=20
> The slab-out-of-bounds crash occurs in line 509, when sysex->len =3D =
128. Specifically, the write operation to dest[0] accesses memory beyond =
the bounds of sysex->buf (128 byte).
> To resolve this issue, we suggest adding 6 lines of code to validate =
the legality of the address write to sysex->buf before entering the =
loop:
>=20
> if (sysex->len >=3D MAX_SYSEX_BUFLEN) {=20
>   sysex->len =3D 0;=20
>   sysex->skip =3D 1;=20
>   return -EINVAL;  /* Exit early if sysex->len is out of bounds */=20
> }
>=20
> If you fix this issue, please add the following tag to the commit:
> Reported-by: Kun Hu <huk23@m.fudan.edu.cn>
>=20
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
> Thanks,
> Kun Hu
>=20
>> 2024=E5=B9=B412=E6=9C=8824=E6=97=A5 19:16=EF=BC=8CKun Hu =
<huk23@m.fudan.edu.cn> =E5=86=99=E9=81=93=EF=BC=9A
>>=20
>> Hello,
>>=20
>> When using fuzzer tool to fuzz the latest Linux kernel, the following =
crash
>> was triggered.
>>=20
>> HEAD commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
>> git tree: upstream
>> Console =
output:https://drive.google.com/file/d/17oCyKDW_kNhSW5Bbvm23vnpD1eo0MHFi/v=
iew?usp=3Dsharing
>> Kernel config: =
https://drive.google.com/file/d/1RhT5dFTs6Vx1U71PbpenN7TPtnPoa3NI/view?usp=
=3Dsharing
>> C reproducer: =
https://drive.google.com/file/d/177HJht6a7-6F3YLudKb_d4kiPGd1VA_i/view?usp=
=3Dsharing
>> Syzlang reproducer: =
https://drive.google.com/file/d/1AuP5UGGc47rEXXPuvjmCKgJ3d0U1P84j/view?usp=
=3Dsharing
>>=20
>>=20
>> If you fix this issue, please add the following tag to the commit:
>> Reported-by: Kun Hu <huk23@m.fudan.edu.cn>
>>=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> BUG: KASAN: slab-out-of-bounds in snd_seq_oss_synth_sysex+0x5d1/0x6c0 =
sound/core/seq/oss/seq_oss_synth.c:516
>> Write of size 1 at addr ff1100000588e288 by task syz-executor411/824
>>=20
>> CPU: 2 UID: 0 PID: 824 Comm: syz-executor411 Not tainted 6.13.0-rc3 =
#5
>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.13.0-1ubuntu1.1 04/01/2014
>> Call Trace:
>> <TASK>
>> __dump_stack lib/dump_stack.c:94 [inline]
>> dump_stack_lvl+0x116/0x1b0 lib/dump_stack.c:120
>> print_address_description mm/kasan/report.c:378 [inline]
>> print_report+0xcf/0x5f0 mm/kasan/report.c:489
>> kasan_report+0x93/0xc0 mm/kasan/report.c:602
>> snd_seq_oss_synth_sysex+0x5d1/0x6c0 =
sound/core/seq/oss/seq_oss_synth.c:516
>> snd_seq_oss_process_event+0x46a/0x2620 =
sound/core/seq/oss/seq_oss_event.c:61
>> insert_queue sound/core/seq/oss/seq_oss_rw.c:167 [inline]
>> snd_seq_oss_write+0x261/0x7f0 sound/core/seq/oss/seq_oss_rw.c:135
>> odev_write+0x53/0xa0 sound/core/seq/oss/seq_oss.c:168
>> vfs_write fs/read_write.c:677 [inline]
>> vfs_write+0x2e3/0x10f0 fs/read_write.c:659
>> ksys_write+0x122/0x240 fs/read_write.c:731
>> do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>> do_syscall_64+0xc3/0x1d0 arch/x86/entry/common.c:83
>> entry_SYSCALL_64_after_hwframe+0x77/0x7f
>> RIP: 0033:0x7f69b379994d
>> Code: c3 e8 97 2a 00 00 0f 1f 80 00 00 00 00 f3 0f 1e fa 48 89 f8 48 =
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d =
01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
>> RSP: 002b:00007f69b3718d78 EFLAGS: 00000246 ORIG_RAX: =
0000000000000001
>> RAX: ffffffffffffffda RBX: 00007f69b382d2d0 RCX: 00007f69b379994d
>> RDX: 0000000000000008 RSI: 0000000020000140 RDI: 0000000000000003
>> RBP: 00007f69b382d2d8 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f69b382d2dc
>> R13: 0000000020000140 R14: 00007f69b37fa008 R15: 000000000000000d
>> </TASK>
>>=20
>> Allocated by task 823:
>> kasan_save_stack+0x24/0x50 mm/kasan/common.c:47
>> kasan_save_track+0x14/0x30 mm/kasan/common.c:68
>> poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
>> __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
>> kmalloc_noprof include/linux/slab.h:901 [inline]
>> kzalloc_noprof include/linux/slab.h:1037 [inline]
>> snd_seq_oss_synth_sysex+0x1d9/0x6c0 =
sound/core/seq/oss/seq_oss_synth.c:502
>> snd_seq_oss_process_event+0x46a/0x2620 =
sound/core/seq/oss/seq_oss_event.c:61
>> insert_queue sound/core/seq/oss/seq_oss_rw.c:167 [inline]
>> snd_seq_oss_write+0x261/0x7f0 sound/core/seq/oss/seq_oss_rw.c:135
>> odev_write+0x53/0xa0 sound/core/seq/oss/seq_oss.c:168
>> vfs_write fs/read_write.c:677 [inline]
>> vfs_write+0x2e3/0x10f0 fs/read_write.c:659
>> ksys_write+0x122/0x240 fs/read_write.c:731
>> do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>> do_syscall_64+0xc3/0x1d0 arch/x86/entry/common.c:83
>> entry_SYSCALL_64_after_hwframe+0x77/0x7f
>>=20
>> The buggy address belongs to the object at ff1100000588e200
>> which belongs to the cache kmalloc-192 of size 192
>> The buggy address is located 0 bytes to the right of
>> allocated 136-byte region [ff1100000588e200, ff1100000588e288)
>>=20
>> The buggy address belongs to the physical page:
>> page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 =
pfn:0x588e
>> anon flags: 0x100000000000000(node=3D0|zone=3D1)
>> page_type: f5(slab)
>> raw: 0100000000000000 ff1100000103c3c0 ffd4000000162340 =
dead000000000003
>> raw: 0000000000000000 0000000080100010 00000001f5000000 =
0000000000000000
>> page dumped because: kasan: bad access detected
>>=20
>> Memory state around the buggy address:
>> ff1100000588e180: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>> ff1100000588e200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> ff1100000588e280: 00 fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>>                     ^
>> ff1100000588e300: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> ff1100000588e380: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>> ---------------
>> thanks,
>> Kun Hu
>=20
>=20

