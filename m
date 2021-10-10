Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A8E428064
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 12:12:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E754168A;
	Sun, 10 Oct 2021 12:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E754168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633860756;
	bh=lO1f+rkh/ZItx+ywxGwtMYQzLXAJn/DDBB3aLyk6AfE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TrF/Cq+Vrp+ZV3Mje9PTuUJ7MNAcwpe/y+dsBt14a1zM56yYn2jhpQRT9qvqkaIFP
	 Y/m6ZJfncykLgSpuzclacjkxuUYcBnfuluCvaioi9fx6Fh5juH9NlVmbg7kGFnol9n
	 DfYrhS7lL29+462sX04PnGj51oe+cfcgGRntRgHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2A3AF801D5;
	Sun, 10 Oct 2021 12:11:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14D50F801F7; Sun, 10 Oct 2021 12:11:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 479BEF800F0
 for <alsa-devel@alsa-project.org>; Sun, 10 Oct 2021 12:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 479BEF800F0
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MGhds-1mUVqB2em2-00DnI7 for <alsa-devel@alsa-project.org>; Sun, 10 Oct
 2021 12:11:09 +0200
Received: by mail-wr1-f54.google.com with SMTP id r10so45333165wra.12
 for <alsa-devel@alsa-project.org>; Sun, 10 Oct 2021 03:11:09 -0700 (PDT)
X-Gm-Message-State: AOAM533U+IjCvJdOifi8XZPNhlu7JxMdjBRP2ODHY8ukHcak2KkoYq9v
 IRkOFn5iXyGhzJ8GlWYFbmwMVCFL09hBc6ENCgU=
X-Google-Smtp-Source: ABdhPJx5SZgl2XRk9qsI/11XgfpHQ7R5Y1XDXpXgmJBrrMs9kOGy3pF6kUMXlskqNxfYAcPFTWEX/fWf7HqUx8gJwlg=
X-Received: by 2002:a1c:4b08:: with SMTP id y8mr4066005wma.98.1633860669268;
 Sun, 10 Oct 2021 03:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211010075546.23220-1-tiwai@suse.de>
In-Reply-To: <20211010075546.23220-1-tiwai@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 10 Oct 2021 12:10:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0HYw_pO=EdsYBxPRXk8mv3gxUoch5ba_o2Q58wBrm4iA@mail.gmail.com>
Message-ID: <CAK8P3a0HYw_pO=EdsYBxPRXk8mv3gxUoch5ba_o2Q58wBrm4iA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcm: Workaround for a wrong offset in SYNC_PTR
 compat ioctl
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:plM6AY+/PleJESIzHhR6+GN389dCsfRZ96Lt70QYj4Bxl5Ao6oE
 clRQrcNt6FCMWG5bA3bju9BZzHjT6CUoeSz6tXxE6A3u4Eumg4uL6wbOGCLzN20W1LvrIoq
 SLgYz6IEU7cZX6yEkruRd15exemVZbZbkZX3iGQPv3tgHB19xcgFHFZRAW4eJjBL6DW+3XI
 FswUWde9hu9ak/pvB1cJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q+mHrTKy3oE=:SIMr0Z/hvUqaA5pPZq96pv
 jfIukuz7EPTAvpa3GniZ94aU06/zwSKszyGPKAnpIsvazWyZXk+h1iQbOaVh97V3UlZmUIZtG
 39HwcGNB9bYQ5Clka913o2m1GBuSwnG84CUwrXHv7e3LBZZssfNKYy3sxzAxrT3V7/l1xE/RG
 SKnx33dxYEuy92B6lS6+o/3wuWC8XC37a3Er2xved9NN3wD53QvpQr/EIChXJ4Qbiw+lEE0VY
 xFRemCOx0netRANzmz1fzRdNSrM4GP1eXBBUo1YoHsR7AhBU+FW9GJ0gshaCzWbX9bve3ARu0
 iHRCPyEfIYLSuLeMNnv0/1L+lldu7I3V2P4acHi9kzfNh7CBT9IrybEJU3lreOhyyF1QQkFIp
 PwMLvZ5W2io8cYZvhjKTvERb+yLdGwKd6kQ10Vk417RXqonUvzBfji69cvPHgYXc3Yx8Q2Ln7
 yCo3eTJhe16GBZVgj8NYCeEBKUjqJCj9k1TqZVTc6xNtczvCA11aQ2PotmDOHu4kBf0ytvxCk
 BDaCYfxwJbBkCnubxC6OqbwTADycckPe5QNYjQTFoE/bx/23CsvYzOH/kotokrI9v4a/efO3M
 BslVY2z7sZTneAa15glbKjhDha8Ypx3i6GUxK0+B4r/DlETJ32+vD6tVWYpEubNimN3beyHcL
 fuxToqkWRbybuHTlAO+h9a7L+U/zXoA2bffH5HMDnfXgi1TAXf2ylYvSeJXW24ghOtMiS+e3a
 Lp6R9RiCOKcTQYYRzCt7pmuF7TlI69V4QGdyUQ==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Forney <mforney@mforney.org>
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

On Sun, Oct 10, 2021 at 9:55 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> Michael Forney reported an incorrect padding type that was defined in
> the commit 80fe7430c708 ("ALSA: add new 32-bit layout for
> snd_pcm_mmap_status/control") for PCM control mmap data.
> His analysis is correct, and this caused the misplacements of PCM
> control data on 32bit arch and 32bit compat mode.
>
> The bug is that the __pad2 definition in __snd_pcm_mmap_control64
> struct was wrongly with __pad_before_uframe, which should have been
> __pad_after_uframe instead.  This struct is used in SYNC_PTR ioctl and
> control mmap.  Basically this bug leads to two problems:
>
> - The offset of avail_min field becomes wrong, it's placed right after
>   appl_ptr without padding on little-endian
>
> - When appl_ptr and avail_min are read as 64bit values in kernel side,
>   the values become either zero or corrupted (mixed up)
>
> One good news is that, because both user-space and kernel
> misunderstand the wrong offset, at least, 32bit application running on
> 32bit kernel works as is.  Also, 64bit applications are unaffected
> because the padding size is zero.  The remaining problem is the 32bit
> compat mode; as mentioned in the above, avail_min is placed right
> after appl_ptr on little-endian archs, 64bit kernel reads bogus values
> for appl_ptr updates, which may lead to streaming bugs like jumping,
> XRUN or whatever unexpected.
> (However, we haven't heard any serious bug reports due to this over
> years, so practically seen, it's fairly safe to assume that the impact
> by this bug is limited.)
>
> Ideally speaking, we should correct the wrong mmap status control
> definition.  But this would cause again incompatibility with the
> existing binaries, and fixing it (e.g. by renumbering ioctls) would be
> really messy.
>
> So, as of this patch, we only correct the behavior of 32bit compat
> mode and keep the rest as is.  Namely, the SYNC_PTR ioctl is now
> handled differently in compat mode to read/write the 32bit values at
> the right offsets.  The control mmap of 32bit apps on 64bit kernels
> has been already disabled (which is likely rather an overlook, but
> this worked fine at this time :), so covering SYNC_PTR ioctl should
> suffice as a fallback.
>
> Fixes: 80fe7430c708 ("ALSA: add new 32-bit layout for snd_pcm_mmap_status/control")
> Reported-by: Michael Forney <mforney@mforney.org>
> Cc: <stable@vger.kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Rich Felker <dalias@libc.org>
> Link: https://lore.kernel.org/r/29QBMJU8DE71E.2YZSH8IHT5HMH@mforney.org
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

This does look like it's the best way we can get out of the mess we're
in for the kernel interface.

Do you have any ideas for how to test this properly to ensure that
there are no further problems in these ioctls? Is there a testsuite
for ALSA that can be run on a musl-enabled distro in both native
and compat mode to exercise the ioctl and mmap interfaces?

       Arnd
