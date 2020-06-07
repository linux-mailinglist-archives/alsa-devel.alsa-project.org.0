Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7AC1F104D
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 00:55:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F9C415E2;
	Mon,  8 Jun 2020 00:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F9C415E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591570537;
	bh=ynNZ3Uc4nTAYhpBqlpqiJ7XbOwv0dU0yCPMPZpQSR6E=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u1OxgvBCRavRmqZb6uLaCEnEFOHCWdQmJR9SsmNyB8txrMAN4a77wnaC7om0nh0sR
	 LUa+tWzDQG7kGzyz9uibqhjrEG2ZqNI4y0am5xc4fFDokfHO6YPsqZ/tENbrheoeOx
	 RAPnJ6mJ2cVHmtZ/Kjm2N+76+q7+v3T4ELqNVZL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 334ADF800F4;
	Mon,  8 Jun 2020 00:53:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86EBEF8028D; Mon,  8 Jun 2020 00:53:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from sonic302-22.consmr.mail.gq1.yahoo.com
 (sonic302-22.consmr.mail.gq1.yahoo.com [98.137.68.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1AC6F8021E
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 00:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1AC6F8021E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca
 header.b="JvS/cP/Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1591570417; bh=OVgJpBhhhhk5NwW2tudXI5m0eiQU8G4TUKDcix9LmsY=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject;
 b=JvS/cP/QAY94+2UYF1anFgfmEPAkfPx8Q7+0fDcUkUPKK9avDW+BUjDy4YaEEskeNrmveiUbJSQ6pi7VkoSUNES5W1ArYIi6z6kL1Aj3Gu7EcT0aq5EkeGzQ0FkAoTp6vhzk4uBJLS9mFDlp113ouMUPtiM9cc67som0lc0PiqICCWjy4Zu70niYUox7oGCEt4gd2RiRMEgGqBripUow9TEy3jDYFbm5UCfFIg9Q6Z3nkeXaD3UfoIb/G0HOW8zudnAHfHoT56SFUz+MWMxqOhpnR3BLXk4s44IDj7Vq2OlXuxaJZyO1ggGqtTVnxd9jS6ya5N1DGJfTAsSBOHeHcw==
X-YMail-OSG: Qymo6RcVM1n2O9WHY3Yfpsyc1gmeSUzg2OFgrfiZKyjRrwHhpveFhWF4SsWU_7L
 6IfOXTVScc2CtR1JZ1mV7Z3hkEjVE3dvG_6XCYHXGUogQ8DZBrGBbOtVD2_nYJJu95XEKJMfWu4w
 ved5kqIt5G0NCRgF9lNtEdFJsOgqioq.feXZX6A1rQhxgIvpC8PZ9_WC4TR23l_sO6uoK7cVLfLm
 1S7XS6u3gHJ5GS.OL8OBbGg5Y713Gq7f2aF..1gECptNvlc0j5PAmfb9mgYj4Gi57Iv0eSFBvpF7
 LZCyULVkJtpDcD4YKTmMVUhJLo52twf9nxHZHBEv4o4lka11J7t417IMdSKBISpoMoDVDBR.bCFE
 c5w1HwxCH7Stujk97nZKx6WtvwSQ3rSXiN9WcU2qZm66zSbVjKZOJ0xxZtHh9_wX2oYgRWqlL4xp
 fxfeY2kQmM7VZL6wrWZWs49X1G5TVgFspbZlimFK9yNuD6mTkLnqqbMvSpRMjc0DbmyO_yxfjTIb
 hsUPFNixrXwCfaAGDvD7YxomX3UfcPJeG6aFo00oZrJrzbgxOaTzMVfKl.XbNsNYhe6h6VCKuGE4
 uEjTsUmkgyOCJSmlVI4bTU1F_T8r7ktyAsADhMEJbvgzV6YXSZLgT93Iz4isESZyd4FAlGTXNqlj
 XpopHWGzSUpcnPhX4om8ikVQuv.SAyikUOn7OilC9xviTmydLhbxQhOSrwsQAKLompBQAlh1NT5N
 qoAe4MuuVIqDSw15_tiqvSAsrb6ZDaEWAjFEt18Iei0cawqvOnNmgbBHXylk8SdC6.qR4moTrnA3
 5RBJ_n6rXNn2vb6Fbjs5JZttjYQyvjvDljpcoZYS7WaMhxwJNpqkPhTIQvDkYMAP0_zDC.kLv.JT
 O16MfDFOhSP_wDcIgFGs3Zg_9Qdk8VS1Iisdz3CWqoGQCJ5zTSG85FFPOr8kBti6aHZKQEn024Yt
 3twmbQtNfk.WFYJrEukQCrRDq4CSw1u9PAEb80O8ouX3nIuH.CL3wsRNquu9MRfiz3IK2seoM9Xa
 f9xNIjW76MCpJmyABW9ydtiCWJ8gUBi3Fx8FMAiwanA_IFzW90A7mVPWCD0rO1gvdQY0aOw8_hmb
 a0jN5wMi5hXtO3XVlj7CHbGin6EcRZW2IJnprFsyB_qVqxsXtkHQ0lnse6jb5731sGLhokRIsGUq
 .pAOc8C_qFEt3Wx_pIFf3oaoecZFcUlc082CY7spy8E3Qt5.7IRBQUNvVCuadbrvu3zte.9z1My0
 6dA18TT32QtIhxB5sTW8IOldctvr7doFGvhi_BROtN.PWwbm7xti0bTqhee7rxZZv2b.k8ZAdew9
 R8qk.cGXlW6DpLXZTh3D2r2I4mDTCHg7dL4hAJVbKoNtVOWZF6kU03QqAbnXWs5rAz2mZ37tvRWB
 eVURHxYRHLzSMRlhh
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.gq1.yahoo.com with HTTP; Sun, 7 Jun 2020 22:53:37 +0000
Received: by smtp423.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID fcfa050da610cf30279390720f9d5e2e; 
 Sun, 07 Jun 2020 22:53:35 +0000 (UTC)
Date: Sun, 07 Jun 2020 18:53:32 -0400
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: 82fef0ad811f "x86/mm: unencrypted non-blocking DMA allocations
 use coherent pools" was Re: next-0519 on thinkpad x60: sound related? window
 manager crash
To: David Rientjes <rientjes@google.com>
References: <20200520111136.GA3802@amd>
 <1591545088.74ii116nf2.none@localhost> <20200607163803.GA10303@duo.ucw.cz>
 <alpine.DEB.2.22.394.2006071209470.84952@chino.kir.corp.google.com>
In-Reply-To: <alpine.DEB.2.22.394.2006071209470.84952@chino.kir.corp.google.com>
MIME-Version: 1.0
Message-Id: <1591570155.2tn9o40h95.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.16072 hermes_yahoo Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
Cc: alsa-devel@alsa-project.org, x86@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, hch@infradead.org, mingo@redhat.com,
 bp@alien8.de, Pavel Machek <pavel@ucw.cz>, hpa@zytor.com, tglx@linutronix.de,
 hch@lst.de
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

Excerpts from David Rientjes's message of June 7, 2020 3:41 pm:
> On Sun, 7 Jun 2020, Pavel Machek wrote:
>=20
>> > I have a similar issue, caused between aaa2faab4ed8 and b170290c2836.
>> >=20
>> > [   20.263098] BUG: unable to handle page fault for address: ffffb2b58=
2cc2000
>> > [   20.263104] #PF: supervisor write access in kernel mode
>> > [   20.263105] #PF: error_code(0x000b) - reserved bit violation
>> > [   20.263107] PGD 3fd03b067 P4D 3fd03b067 PUD 3fd03c067 PMD 3f8822067=
 PTE 8000273942ab2163
>> > [   20.263113] Oops: 000b [#1] PREEMPT SMP
>> > [   20.263117] CPU: 3 PID: 691 Comm: mpv Not tainted 5.7.0-11262-gb170=
290c2836 #1
>> > [   20.263119] Hardware name: To Be Filled By O.E.M. To Be Filled By O=
.E.M./B450 Pro4, BIOS P4.10 03/05/2020
>> > [   20.263125] RIP: 0010:__memset+0x24/0x30
>> > [   20.263128] Code: cc cc cc cc cc cc 0f 1f 44 00 00 49 89 f9 48 89 d=
1 83 e2 07 48 c1 e9 03 40 0f b6 f6 48 b8 01 01 01 01 01 01 01 01 48 0f af c=
6 <f3> 48 ab 89 d1 f3 aa 4c 89 c8 c3 90 49 89 f9 40 88 f0 48 89 d1 f3
>> > [   20.263131] RSP: 0018:ffffb2b583d07e10 EFLAGS: 00010216
>> > [   20.263133] RAX: 0000000000000000 RBX: ffff8b8000102c00 RCX: 000000=
0000004000
>> > [   20.263134] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffb2=
b582cc2000
>> > [   20.263136] RBP: ffff8b8000101000 R08: 0000000000000000 R09: ffffb2=
b582cc2000
>> > [   20.263137] R10: 0000000000005356 R11: ffff8b8000102c18 R12: 000000=
0000000000
>> > [   20.263139] R13: 0000000000000000 R14: ffff8b8039944200 R15: ffffff=
ff9794daa0
>> > [   20.263141] FS:  00007f41aa4b4200(0000) GS:ffff8b803ecc0000(0000) k=
nlGS:0000000000000000
>> > [   20.263143] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> > [   20.263144] CR2: ffffb2b582cc2000 CR3: 00000003b6731000 CR4: 000000=
00003406e0
>> > [   20.263146] Call Trace:
>> > [   20.263151]  ? snd_pcm_hw_params+0x3f3/0x47a
>> > [   20.263154]  ? snd_pcm_common_ioctl+0xf2/0xf73
>> > [   20.263158]  ? snd_pcm_ioctl+0x1e/0x29
>> > [   20.263161]  ? ksys_ioctl+0x77/0x91
>> > [   20.263163]  ? __x64_sys_ioctl+0x11/0x14
>> > [   20.263166]  ? do_syscall_64+0x3d/0xf5
>> > [   20.263170]  ? entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> > [   20.263173] Modules linked in: uvcvideo videobuf2_vmalloc videobuf2=
_memops videobuf2_v4l2 videodev snd_usb_audio videobuf2_common snd_hwdep sn=
d_usbmidi_lib input_leds snd_rawmidi led_class
>> > [   20.263182] CR2: ffffb2b582cc2000
>> > [   20.263184] ---[ end trace c6b47a774b91f0a0 ]---
>> > [   20.263187] RIP: 0010:__memset+0x24/0x30
>> > [   20.263190] Code: cc cc cc cc cc cc 0f 1f 44 00 00 49 89 f9 48 89 d=
1 83 e2 07 48 c1 e9 03 40 0f b6 f6 48 b8 01 01 01 01 01 01 01 01 48 0f af c=
6 <f3> 48 ab 89 d1 f3 aa 4c 89 c8 c3 90 49 89 f9 40 88 f0 48 89 d1 f3
>> > [   20.263192] RSP: 0018:ffffb2b583d07e10 EFLAGS: 00010216
>> > [   20.263193] RAX: 0000000000000000 RBX: ffff8b8000102c00 RCX: 000000=
0000004000
>> > [   20.263195] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffb2=
b582cc2000
>> > [   20.263196] RBP: ffff8b8000101000 R08: 0000000000000000 R09: ffffb2=
b582cc2000
>> > [   20.263197] R10: 0000000000005356 R11: ffff8b8000102c18 R12: 000000=
0000000000
>> > [   20.263199] R13: 0000000000000000 R14: ffff8b8039944200 R15: ffffff=
ff9794daa0
>> > [   20.263201] FS:  00007f41aa4b4200(0000) GS:ffff8b803ecc0000(0000) k=
nlGS:0000000000000000
>> > [   20.263202] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> > [   20.263204] CR2: ffffb2b582cc2000 CR3: 00000003b6731000 CR4: 000000=
00003406e0
>> >=20
>> > I bisected this to 82fef0ad811f "x86/mm: unencrypted non-blocking DMA=20
>> > allocations use coherent pools". Reverting 1ee18de92927 resolves the=20
>> > issue.
>> >=20
>> > Looks like Thinkpad X60 doesn't have VT-d, but could still be DMA=20
>> > related.
>>=20
>> Note that newer -next releases seem to behave okay for me. The commit
>> pointed out by siection is really simple:
>>=20
>> AFAIK you could verify it is responsible by turning off
>> CONFIG_AMD_MEM_ENCRYPT on latest kernel...
>>=20
>> Best regards,
>> 								Pavel
>>=20
>> index 1d6104ea8af0..2bf2222819d3 100644
>> --- a/arch/x86/Kconfig
>> +++ b/arch/x86/Kconfig
>> @@ -1520,6 +1520,7 @@ config X86_CPA_STATISTICS
>>  config AMD_MEM_ENCRYPT
>>         bool "AMD Secure Memory Encryption (SME) support"
>>         depends on X86_64 && CPU_SUP_AMD
>> +       select DMA_COHERENT_POOL
>>         select DYNAMIC_PHYSICAL_MASK
>>         select ARCH_USE_MEMREMAP_PROT
>>         select ARCH_HAS_FORCE_DMA_UNENCRYPTED
>=20
> Thanks for the report!
>=20
> Besides CONFIG_AMD_MEM_ENCRYPT, do you have CONFIG_DMA_DIRECT_REMAP=20
> enabled?  If so, it may be caused by the virtual address passed to the=20
> set_memory_{decrypted,encrypted}() functions.
>=20
> And I assume you are enabling SME by using mem_encrypt=3Don on the kernel=
=20
> command line or CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is enabled.
>=20
> We likely need an atomic pool for devices that support DMA to addresses i=
n=20
> sme_me_mask as well.  I can test this tomorrow, but wanted to get it out=20
> early to see if it helps?

This patch doesn't seem to help. I have the same problem (kernel page=20
fault, __memset, snd_pcm_hw_params...).

I don't have CONFIG_DMA_DIRECT_REMAP enabled, and AFAICT it doesn't seem=20
to be selectable currently on x86, unless there are some patches=20
floating around for that.
