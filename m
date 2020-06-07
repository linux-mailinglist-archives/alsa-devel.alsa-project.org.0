Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE621F0D2D
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jun 2020 18:39:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 366B015E2;
	Sun,  7 Jun 2020 18:39:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 366B015E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591547996;
	bh=L3JCSq7qeCWleV/aV15xU16dWheoo4EHDIQFizePKVs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H+TYcNEMd3k/6iydguz5rX0TOJJAvrSrGaczZGh+ED71ByQoaMW9692DrZCpA/uyF
	 XhG5sYOvV5AYScemi2S8t7FG/8j2PsFMiJ++USN+0c0U7eBSlKgmTCdHHnv+8ZPaR6
	 1v44gXm0Vk/Jwfo76DdRuuOEoaKrmsGxBdFSwSuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43297F80131;
	Sun,  7 Jun 2020 18:38:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0306CF80140; Sun,  7 Jun 2020 18:38:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07ED2F80122
 for <alsa-devel@alsa-project.org>; Sun,  7 Jun 2020 18:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07ED2F80122
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 4BFA81C0BD2; Sun,  7 Jun 2020 18:38:04 +0200 (CEST)
Date: Sun, 7 Jun 2020 18:38:03 +0200
From: Pavel Machek <pavel@ucw.cz>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: 82fef0ad811f "x86/mm: unencrypted non-blocking DMA allocations use
 coherent pools" was Re: next-0519 on thinkpad x60: sound related? window
 manager crash
Message-ID: <20200607163803.GA10303@duo.ucw.cz>
References: <20200520111136.GA3802@amd> <1591545088.74ii116nf2.none@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <1591545088.74ii116nf2.none@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, x86@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, hch@infradead.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, rientjes@google.com, tglx@linutronix.de,
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


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I have a similar issue, caused between aaa2faab4ed8 and b170290c2836.
>=20
> [   20.263098] BUG: unable to handle page fault for address: ffffb2b582cc=
2000
> [   20.263104] #PF: supervisor write access in kernel mode
> [   20.263105] #PF: error_code(0x000b) - reserved bit violation
> [   20.263107] PGD 3fd03b067 P4D 3fd03b067 PUD 3fd03c067 PMD 3f8822067 PT=
E 8000273942ab2163
> [   20.263113] Oops: 000b [#1] PREEMPT SMP
> [   20.263117] CPU: 3 PID: 691 Comm: mpv Not tainted 5.7.0-11262-gb170290=
c2836 #1
> [   20.263119] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.=
M./B450 Pro4, BIOS P4.10 03/05/2020
> [   20.263125] RIP: 0010:__memset+0x24/0x30
> [   20.263128] Code: cc cc cc cc cc cc 0f 1f 44 00 00 49 89 f9 48 89 d1 8=
3 e2 07 48 c1 e9 03 40 0f b6 f6 48 b8 01 01 01 01 01 01 01 01 48 0f af c6 <=
f3> 48 ab 89 d1 f3 aa 4c 89 c8 c3 90 49 89 f9 40 88 f0 48 89 d1 f3
> [   20.263131] RSP: 0018:ffffb2b583d07e10 EFLAGS: 00010216
> [   20.263133] RAX: 0000000000000000 RBX: ffff8b8000102c00 RCX: 000000000=
0004000
> [   20.263134] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffb2b58=
2cc2000
> [   20.263136] RBP: ffff8b8000101000 R08: 0000000000000000 R09: ffffb2b58=
2cc2000
> [   20.263137] R10: 0000000000005356 R11: ffff8b8000102c18 R12: 000000000=
0000000
> [   20.263139] R13: 0000000000000000 R14: ffff8b8039944200 R15: ffffffff9=
794daa0
> [   20.263141] FS:  00007f41aa4b4200(0000) GS:ffff8b803ecc0000(0000) knlG=
S:0000000000000000
> [   20.263143] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   20.263144] CR2: ffffb2b582cc2000 CR3: 00000003b6731000 CR4: 000000000=
03406e0
> [   20.263146] Call Trace:
> [   20.263151]  ? snd_pcm_hw_params+0x3f3/0x47a
> [   20.263154]  ? snd_pcm_common_ioctl+0xf2/0xf73
> [   20.263158]  ? snd_pcm_ioctl+0x1e/0x29
> [   20.263161]  ? ksys_ioctl+0x77/0x91
> [   20.263163]  ? __x64_sys_ioctl+0x11/0x14
> [   20.263166]  ? do_syscall_64+0x3d/0xf5
> [   20.263170]  ? entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   20.263173] Modules linked in: uvcvideo videobuf2_vmalloc videobuf2_me=
mops videobuf2_v4l2 videodev snd_usb_audio videobuf2_common snd_hwdep snd_u=
sbmidi_lib input_leds snd_rawmidi led_class
> [   20.263182] CR2: ffffb2b582cc2000
> [   20.263184] ---[ end trace c6b47a774b91f0a0 ]---
> [   20.263187] RIP: 0010:__memset+0x24/0x30
> [   20.263190] Code: cc cc cc cc cc cc 0f 1f 44 00 00 49 89 f9 48 89 d1 8=
3 e2 07 48 c1 e9 03 40 0f b6 f6 48 b8 01 01 01 01 01 01 01 01 48 0f af c6 <=
f3> 48 ab 89 d1 f3 aa 4c 89 c8 c3 90 49 89 f9 40 88 f0 48 89 d1 f3
> [   20.263192] RSP: 0018:ffffb2b583d07e10 EFLAGS: 00010216
> [   20.263193] RAX: 0000000000000000 RBX: ffff8b8000102c00 RCX: 000000000=
0004000
> [   20.263195] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffb2b58=
2cc2000
> [   20.263196] RBP: ffff8b8000101000 R08: 0000000000000000 R09: ffffb2b58=
2cc2000
> [   20.263197] R10: 0000000000005356 R11: ffff8b8000102c18 R12: 000000000=
0000000
> [   20.263199] R13: 0000000000000000 R14: ffff8b8039944200 R15: ffffffff9=
794daa0
> [   20.263201] FS:  00007f41aa4b4200(0000) GS:ffff8b803ecc0000(0000) knlG=
S:0000000000000000
> [   20.263202] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   20.263204] CR2: ffffb2b582cc2000 CR3: 00000003b6731000 CR4: 000000000=
03406e0
>=20
> I bisected this to 82fef0ad811f "x86/mm: unencrypted non-blocking DMA=20
> allocations use coherent pools". Reverting 1ee18de92927 resolves the=20
> issue.
>=20
> Looks like Thinkpad X60 doesn't have VT-d, but could still be DMA=20
> related.

Note that newer -next releases seem to behave okay for me. The commit
pointed out by siection is really simple:

AFAIK you could verify it is responsible by turning off
CONFIG_AMD_MEM_ENCRYPT on latest kernel...

Best regards,
								Pavel

index 1d6104ea8af0..2bf2222819d3 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1520,6 +1520,7 @@ config X86_CPA_STATISTICS
 config AMD_MEM_ENCRYPT
        bool "AMD Secure Memory Encryption (SME) support"
        depends on X86_64 && CPU_SUP_AMD
+       select DMA_COHERENT_POOL
        select DYNAMIC_PHYSICAL_MASK
        select ARCH_USE_MEMREMAP_PROT
        select ARCH_HAS_FORCE_DMA_UNENCRYPTED


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXt0X6wAKCRAw5/Bqldv6
8nR9AKCEQ5c2R1u4+cXEO0PCRlvn6BRgQwCeLIGOijUJZFuQ4aVPjBCzO69tKp8=
=cYie
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
