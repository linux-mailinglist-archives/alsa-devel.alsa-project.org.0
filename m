Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 055A3151E6D
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 17:42:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78F0D1689;
	Tue,  4 Feb 2020 17:41:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78F0D1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580834529;
	bh=yvQlNErwNtHo0eSDg5j8xbuN+OVVG38VF8xj1hn8bxY=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RWtxkAeWmY3TdBrjoaUE7wUgO1iXyp9iDgZO3DTQAdzFHp3ut9yzjVGB1SJ+GfxlR
	 FL2L4g10gqZIlq59XC6L9Cy/Z2VGCWKVDWH9+u6dkctNvF+VFykVS/ygbxpcrXO+CW
	 DEz+vgvGHqiwWENY2Q2a1DgoWQKS1EL88EO/c9OU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79FA5F800AB;
	Tue,  4 Feb 2020 17:40:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E134F80162; Tue,  4 Feb 2020 17:40:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6451F800F4
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 17:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6451F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VDGCo9zy"
Received: by mail-ed1-x535.google.com with SMTP id g19so20400090eds.11
 for <alsa-devel@alsa-project.org>; Tue, 04 Feb 2020 08:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=oIkI8EEKCMl+EIPg+CUSQH5BoqhJ5xwNGtnw6/FU7QY=;
 b=VDGCo9zywu7GlJPsOdfmTArjJLo1nuWWNS7LWdYAfKltO30ptK90KrMCML3wceLQaM
 0NVm/EptvWuADRNuhoTZn/pnzPSE6oRpzLF6FGFgyGTdf5SribFqCfiD3Hr9P6+1x5Qu
 kYf9hc14Vxul3qK2x7tSJpbh0DLw0G+bJcWnwoi6kB0Tr+6Znw5nHRn5LyohwpaerkqJ
 l+CuPlj1fVf4Cl5n6fc8NaWn0H5C+eVEuuNPvzV1Ps8oDx/9II2lAGpxxGcrtYVQuPFQ
 x2kARLvZwB1sHoswROkyf4tNdjk7YMhF9kbbuhtEoPbJAWpofj8JsDkd8RCw09p+iaCT
 4wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=oIkI8EEKCMl+EIPg+CUSQH5BoqhJ5xwNGtnw6/FU7QY=;
 b=kyMm3k2nbZTi9SRXqtgDr39H2Ai9vLWaVsMmPluRCcMdCzRbyEZbSo8NPGiOjPpVhj
 v9he/ZbnRd299OTdEwfSmnoqqZbxM+E3Dtt73emyxFehur0vgHJlNrnMtalukAkf6tUe
 eo6DZuBerV0yJ/QFDBVm1iKy8f0M3awEy7SHFN5TpgUYN4Q/MqMpQTc3thvZLWAQGOJN
 obwsYQrIG+J89VskcPn3Y3DGDh+OxEruvG8EyJ94bdh4V8qy0nn4Gs4A4JOKsxwt7d58
 3gKDyRGD/WR1JytKhflgYtKTYsNRzn0Ui1RgSDf2GTBIqFVB/uC/UixzgBPSKh1RSFRe
 TGCg==
X-Gm-Message-State: APjAAAXpQCocuSf1haEWPd5dQ92u01kRoC9xyDFD2s/tlV+Ffh7xXhPb
 ObQFnF+qRELj/fm3Q+AAE1krycfBVcy0sH4uoqk=
X-Google-Smtp-Source: APXvYqxOPDsC5vLi5eb+QDK1n7sy40MDGb0aGiMRWIjxit96qegwy9+zMZtEJ+J/HHUs+Cbrx/C0dG4r44sDiIAPJ6U=
X-Received: by 2002:a17:906:40a:: with SMTP id
 d10mr26570341eja.65.1580834416756; 
 Tue, 04 Feb 2020 08:40:16 -0800 (PST)
MIME-Version: 1.0
References: <CAK5Eu=tVQjBn+YvsHOLqSEir5aV8Q0hA1OgFiJZYdqnspdMz-Q@mail.gmail.com>
 <CAK5Eu=snx3s9r9hoeF4Th0V0YXJYa=7PKUqDn3W4NdWZben-zg@mail.gmail.com>
 <CAK5Eu=v2x+zFhCygKq8DPWd+CH5JTpZEayg=k2NvaTY7DUNA9g@mail.gmail.com>
 <CAK5Eu=ucuW6Pp=+j7afPoYgPUdFXjh+PZ-PK6mc+m61M80ZndA@mail.gmail.com>
 <20200119164335.GA11974@workstation>
 <CAK5Eu=sS8kMe5hCPgTx+V6AjzcCo3vN73tEQ1f=kY03Y2_CcJQ@mail.gmail.com>
 <20200120141901.GA32472@workstation>
 <CAK5Eu=tX=87xD0xt-UdrDWTsxw9Y4xOrvAV8pHKyYC7tau==XA@mail.gmail.com>
 <20200125031801.GA5554@workstation>
 <CAK5Eu=tV+T4OupWNToLE8nfG00Y68kiTRcUGia9YOFtzYQNSRg@mail.gmail.com>
 <20200129031652.GA2629@workstation>
In-Reply-To: <20200129031652.GA2629@workstation>
From: Daniel Jozsef <daniel.jozsef@gmail.com>
Date: Tue, 4 Feb 2020 17:40:05 +0100
Message-ID: <CAK5Eu=sQFzQe45CyHzEmEe1bs3xwdfH0HeZpHErGJqsqtF3XQg@mail.gmail.com>
To: Daniel Jozsef <daniel.jozsef@gmail.com>, ffado-user@lists.sourceforge.net, 
 alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: Re: [alsa-devel] Toneweal / Trigaudio FW66 device
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

Hey,

Thanks a lot. That does sound pretty strange. Thankfully, I'm in no hurry
as I'm still mainly using an older Mac for audio stuff, but I'd like to
replace it sooner or later, and getting an upgradable Linux machine sounds
better than paying 1.5 to 2 times as much for a Mac with the same specs
(and no extensibility).

I'll try to do some testing around on my current Linux box. Unfortunately
it's an old machine with a "known problematic" Firewire implementation,
though I doubt that should play a part in device discovery.

Daniel

On Wed, Jan 29, 2020 at 4:16 AM Takashi Sakamoto <o-takashi@sakamocchi.jp>
wrote:

> Hi,
>
> On Tue, Jan 28, 2020 at 10:28:20PM +0000, Daniel Jozsef wrote:
> > I'm a little baffled by what my device just did. :P
> >
> > $ ./firewire-request /dev/fw1 fcp 0x016002c0000100ffff00
> > response: 000: 0c 60 02 c0 00 01 00 ff ff 00 00
> .`.........
> > $ ./firewire-request /dev/fw1 fcp 0x016002c0000101ffff00
> > response: 000: 0c 60 02 c0 00 01 01 ff ff 00 00
> .`.........
> > (<- didn't fail)
> > $ ./firewire-request /dev/fw1 fcp 0x016002c0000102ffff00
> > response: 000: 0c 60 02 c0 00 01 02 ff ff 00 00
> .`.........
> > $ ./firewire-request /dev/fw1 fcp 0x016002c0000103ffff00
> > response: 000: 0c 60 02 c0 00 01 03 ff ff 00 00
> .`.........
> > $ ./firewire-request /dev/fw1 fcp 0x016002c0000104ffff00
> > response: 000: 0c 60 02 c0 00 01 04 ff ff 00 02
> .`.........
> > (<- didn't fail)
> >
> > In fact...
> >
> > $ ./firewire-request /dev/fw1 fcp 0x016002c0000105ffff00
> > response: 000: 0c 60 02 c0 00 01 05 ff ff 00 03
> .`.........
> > $ ./firewire-request /dev/fw1 fcp 0x016002c0000106ffff00
> > response: 000: 08 60 02 c0 00 01 06 ff ff 00                   .`........
> > (<- shorter)
> > $ ./firewire-request /dev/fw1 fcp 0x016002c0000107ffff00
> > response: 000: 08 60 02 c0 00 01 07 ff ff 00                   .`........
> > $ ./firewire-request /dev/fw1 fcp 0x016002c00001ffffff00
> > response: 000: 08 60 02 c0 00 01 ff ff ff 00                   .`........
> > (<-srsly?)
> >
> > As for the second batch:
> >
> > $ ./firewire-request /dev/fw1 fcp 0x016002c0010100ffff00
> > response: 000: 0c 60 02 c0 01 01 00 ff ff 00 00
> .`.........
> > $ ./firewire-request /dev/fw1 fcp 0x016002c0010101ffff00
> > response: 000: 0c 60 02 c0 01 01 01 ff ff 00 00
> .`.........
> > (<- didn't fail)
> >
> > So again...
> >
> > $ ./firewire-request /dev/fw1 fcp 0x016002c0010102ffff00
> > response: 000: 0c 60 02 c0 01 01 02 ff ff 00 00
> .`.........
> > $ ./firewire-request /dev/fw1 fcp 0x016002c0010103ffff00
> > response: 000: 0c 60 02 c0 01 01 03 ff ff 00 02
> .`.........
> > $ ./firewire-request /dev/fw1 fcp 0x016002c0010104ffff00
> > response: 000: 0c 60 02 c0 01 01 04 ff ff 00 03
> .`.........
> > $ ./firewire-request /dev/fw1 fcp 0x016002c0010105ffff00
> > response: 000: 08 60 02 c0 01 01 05 ff ff 00                   .`........
> > (<- shorter)
> > $ ./firewire-request /dev/fw1 fcp 0x016002c0010106ffff00
> > response: 000: 08 60 02 c0 01 01 06 ff ff 00                   .`........
> > $ ./firewire-request /dev/fw1 fcp 0x016002c001010fffff00
> > response: 000: 08 60 02 c0 01 01 0f ff ff 00                   .`........
> >
> > Honestly I have no idea what is going on. :D
>
> It looks to work well.
>
> You tried for input plugs of audio subunit, thus the shorter
> response with 0x08 in the first byte (=NOT IMPLEMENTED) is
> expected for inquiry to 6th input plug.
>
> Hm. I guess your issue is a kind of Heisenbugs[1]. It seems to
> depend on case. To drill down the case in which the issue
> appears, I'd like you to investigate whether you can see the
> same log every time you run with libffado (jackd with Firewire
> backend, or ffado-dbus-server) or not:
>
> > Error (bebob_avplug.cpp)[ 237] discoverPlugType: Plug does not implement
> extended plug info plug type info command
> > Error (bebob_avplug.cpp)[ 120] discover: discover: Could not discover
> plug type (1,1,0,0,1)
>
>
> Additionally, I write a patch for ALSA bebob driver to support
> your device[2]. If you need a prompt solution to use the device in
> Linux-based system, it's available in topic branch of my remote
> repository. But it's required for you to study the way to update
> installed driver modules...
>
> I note that ALSA bebob driver supports transmission of audio frames
> and MIDI messages, thus it's not available to control internal DSP.
>
> [1] https://en.wikipedia.org/wiki/Heisenbug
> [2]
> https://github.com/takaswie/snd-firewire-improve/commit/1c9fabb7dd9de36ea829700df7eb13a40393a679
> [3] https://github.com/takaswie/snd-firewire-improve/tree/topic/fw66
>
>
> Regards
>
> Takashi Sakamoto
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
