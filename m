Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98562664075
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 13:29:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DE55B138;
	Tue, 10 Jan 2023 13:28:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DE55B138
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673353741;
	bh=zwxBsdOxXbT/o7p0/efrqT/Nkwrd77eV/+pSV4XqXNc=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DTCbYKxYxQwkZ9V+lzLnhGKN2ApAWOTBc80exgUlVOBSGK3SwKVxM1j4E1BvpWkyW
	 gg0e+3+sCCRLn+lDp2o7YGefB/B27jnAN4dIRgPrdYah90m9AkM/uDa3j+c99wRdAh
	 rCAmUM4JHORKhd0XXuzw3N/lUxI3yEUP/aNuUXN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08084F800C7;
	Tue, 10 Jan 2023 13:28:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06E3CF804BD; Tue, 10 Jan 2023 13:28:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 397F3F8019B
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 13:27:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 397F3F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=GXfR+1I7
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 4495C16C0004;
 Tue, 10 Jan 2023 14:27:58 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lj3SrLoA6jRB; Tue, 10 Jan 2023 14:27:57 +0200 (EET)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1673353677; bh=zwxBsdOxXbT/o7p0/efrqT/Nkwrd77eV/+pSV4XqXNc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GXfR+1I7gu3qzNDklinm7snHOlgQA4uHRyNRiZsLPalOWYpcS83pNHtyV464bxRHB
 PkFCcfqxFLEcHJsjpEK7nmqKqfMUh/EoBwCv5SYwdu5Fvz+8HeLnz9RaQSUBMyvSt3
 EPaPycjIEJj00BgUXiQcOUwaK+5W3COTEDrU3gP8=
To: "Limonciello, Mario" <mario.limonciello@amd.com>, "Reddy, V sujith
 kumar" <vsujithkumar.reddy@amd.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC] Sound support for Huawei line of AMD laptops using ACP
 and ES8336 codec
In-Reply-To: <8349cf5f-1e26-f605-4404-978dbef9cee3@amd.com>
References: <871qo7fqjp.fsf@mutex.one>
 <598ca0a8-8aef-a030-7060-f76ba4700bbf@amd.com>
 <8349cf5f-1e26-f605-4404-978dbef9cee3@amd.com>
Date: Tue, 10 Jan 2023 14:27:54 +0200
Message-ID: <871qo2bmlx.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, syed sabakareem <Syed.SabaKareem@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello V sujith kumar, Mario,

Thanks for the replies to my email.

"Limonciello, Mario" <mario.limonciello@amd.com> writes:

> On 1/7/2023 00:58, Reddy, V sujith kumar wrote:
>>=20
>> Could you please send=C2=A0 the error, we will check and let you know wh=
at is=20
>> missing.
>
> Just a guess here without seeing the error.  Is this perhaps because the=
=20
> SOF F/W binary that was loaded was not signed with signature trusted by=20
> the platform and the platform required validation?
>
> SOF on AMD was first introduced for Chromebooks which don't use the same=
=20
> authority for firmware binary verification that general purpose UEFI=20
> notebooks would use.


So I compiled the latest sof firmware from main branch commit
90c14e56cb, and now it seems I get additional errors that I didn't get a
few months ago when I last tried:
[   38.251393] snd_sof_amd_renoir 0000:03:00.5: enabling device (0000 -> 00=
02)
[   38.252944] snd_sof_amd_renoir 0000:03:00.5: unknown sof_ext_man header =
type 3 size 0x30
[   38.252955] snd_sof_amd_renoir 0000:03:00.5: Firmware info: version 2:0:=
0-90c14
[   38.252957] snd_sof_amd_renoir 0000:03:00.5: Firmware: ABI 3:26:0 Kernel=
 ABI 3:23:0
[   41.345068] snd_sof_amd_renoir 0000:03:00.5: ------------[ DSP dump star=
t ]------------
[   41.345080] snd_sof_amd_renoir 0000:03:00.5: Firmware boot failure due t=
o timeout
[   41.345085] snd_sof_amd_renoir 0000:03:00.5: fw_state: SOF_FW_BOOT_IN_PR=
OGRESS (2)
[   41.345137] snd_sof_amd_renoir 0000:03:00.5: invalid header size 0x7f841=
000. FW oops is bogus
[   41.345142] snd_sof_amd_renoir 0000:03:00.5: unexpected fault 0x7f840000=
 trace 0x7f840000
[   41.345146] snd_sof_amd_renoir 0000:03:00.5: ------------[ DSP dump end =
]------------
[   41.345150] snd_sof_amd_renoir 0000:03:00.5: error: failed to boot DSP f=
irmware -5
[   41.345266] snd_sof_amd_renoir 0000:03:00.5: error: sof_probe_work faile=
d err: -5

The kernel I'm running on is based on the asoc tree from Mark Brown:
git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git

commit f8778e910cab179f5835386a0a70847921a8fbec (sound/for-next)
Merge: cdfa92eb90f5 b11845893678
Author: Mark Brown <broonie@kernel.org>
Date:   Fri Jan 6 17:04:36 2023 +0000

    Merge remote-tracking branch 'asoc/for-6.3' into asoc-next

Let me know what other information you need in order to debug this.


