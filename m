Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7B22D22F8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 06:19:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 234161703;
	Tue,  8 Dec 2020 06:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 234161703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607404791;
	bh=2+yR3yuo4D7zMCR8NK9mW5qO7VOsix8sqbs+j4+m0Gg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y9WAA9B6iJWxm5nygK66BcCYiiyoWVwDB33aSXMxduhhD85gDH+V0YvxwBb5cigx5
	 yjUdhz/2C46d+eJjfkWs4vRMTXmCm/UUStFUgCGmpDrk2SQFgrncKEUlP05j8vJIXj
	 x/pSiquni2lctLzEl7ZAlAdiUhn3/5AeWsNZgDGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EC42F80218;
	Tue,  8 Dec 2020 06:18:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7E9AF8019D; Tue,  8 Dec 2020 06:18:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17B17F80130
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 06:18:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17B17F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="MxvmroRx"
Received: by mail-pg1-x543.google.com with SMTP id g18so11159323pgk.1
 for <alsa-devel@alsa-project.org>; Mon, 07 Dec 2020 21:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6B27MjfiQVy0rXuqasBw27ufwoC3xQGBEn2nziAxKKw=;
 b=MxvmroRxK7TMgJsiKckqSSoIB1O+g9Hvlhy4w/byUGZUDIJ6Jg1CBBkjd8zwI+Uc4T
 8OrBN1jwckJQo+Xuo17WQmP+SiKRlvKZY9ux9srN+/s3vucDJ0/32U43b2mz13WU5/k+
 K6oArXu2qDuUK1hGbaOmAokFYwVPGvmt5B1/uCbXhVK0r4JgsxzIEdgaHStnW4pG/4p3
 XHHtaKke6fFEMUTOLi4eVH5LfFj1OSW8ucnYpAO0LM9fIUSpnnsmdCypbtWGcBpM2a2f
 OXmAQ7tp4kwE39Lvfxs9DEfDO3udXI5o0T6joSdPWXuN4rWa49yuH/i14tGxVCbC79lw
 ic2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6B27MjfiQVy0rXuqasBw27ufwoC3xQGBEn2nziAxKKw=;
 b=RBfFjVYmz6TiB9qAF1gLZc8IMXbFVx1+RcPJGUVrwdTqCxKZMyXVwCXQf5dvFNpsim
 mYXnEXkJEkXlzTYSPx5SHOKeBJ+CLs5nvSAm6XYHRXsIlL51mC/s2fg3QkqqeRVaHql4
 cGLmEdxyScMAWyXFHYv3y4QWCmX8RCtpTRf9Kjrpn6fGRXEOMvNXc5S2BaYtT9GmSYgQ
 CN7FrSIbCJAKGZZ2dEoP/jq9Qkzwqf5ujYTyoyRhil3NKCz2r4kfRdn7w0au9P1qKmHU
 PvBtYHofqMfP4i9AEcnQPmdsqF5Epxm/GDzNzc4TYRjdKJ7aW+AYGyFWtTHbvXCP8z2t
 s5Nw==
X-Gm-Message-State: AOAM530JevjLRRDX3G65vt5gSgFHJYiUez1pKhDAa1F7WXlTfn81nd0r
 sjq5PmbwOmjFZKTyZJpJO7FmCrm5FDr4LnldAocz2A==
X-Google-Smtp-Source: ABdhPJxAyat6w/s5kIrYWRiG8fkEEx0Fy4ugnBvg0BiPnvUvHJ9D+f7afjLBBjveFnwE5uOkVGTPnEKZr1qNWQiKdYw=
X-Received: by 2002:a62:1dd5:0:b029:19d:fc87:5f45 with SMTP id
 d204-20020a621dd50000b029019dfc875f45mr9281048pfd.63.1607404679429; Mon, 07
 Dec 2020 21:17:59 -0800 (PST)
MIME-Version: 1.0
References: <20201207073346.16571-1-chiu@endlessos.org>
 <s5h360i2eov.wl-tiwai@suse.de>
In-Reply-To: <s5h360i2eov.wl-tiwai@suse.de>
From: Chris Chiu <chiu@endlessos.org>
Date: Tue, 8 Dec 2020 13:17:48 +0800
Message-ID: <CAB4CAwcuZxz260Q=7VntkZnit_x0K4Pthcdnv1xD=NgmcRCDew@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek - Add support for Memeza EDL03 headset
 mic
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Kailang <kailang@realtek.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Jian-Hong Pan <jhp@endlessos.org>,
 tiwai@suse.com, linux@endlessos.org
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

On Mon, Dec 7, 2020 at 4:38 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 07 Dec 2020 08:33:46 +0100,
> Chris Chiu wrote:
> >
> > The Memeza laptop EDL03 with codec ALC256 can't detect the headset
> > microphone. The headphone jack sensing works after we add a pin
> > definition for it by ALC256_FIXUP_ASUS_MIC_NO_PRESENCE.
> >
> > Signed-off-by: Chris Chiu <chiu@endlessos.org>
> > Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
> > ---
> >  sound/pci/hda/patch_realtek.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> > index d5e4d0ba1008..8b9b94cfc67e 100644
> > --- a/sound/pci/hda/patch_realtek.c
> > +++ b/sound/pci/hda/patch_realtek.c
> > @@ -7871,6 +7871,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
> >       SND_PCI_QUIRK(0x10cf, 0x1629, "Lifebook U7x7", ALC255_FIXUP_LIFEBOOK_U7x7_HEADSET_MIC),
> >       SND_PCI_QUIRK(0x10cf, 0x1845, "Lifebook U904", ALC269_FIXUP_LIFEBOOK_EXTMIC),
> >       SND_PCI_QUIRK(0x10ec, 0x10f2, "Intel Reference board", ALC700_FIXUP_INTEL_REFERENCE),
> > +     SND_PCI_QUIRK(0x10ec, 0x115a, "Memeza EDL03", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
>
> This looks suspicious.  10ec is the vendor ID for Realtek, i.e. it
> implies that the BIOS on this machine didn't give the proper unique
> ID.  As you can see, the other entries with 10ec are only reference
> boards.
>
> If the newer BIOS still doesn't fix the PCI SSID, you can check the
> codec SSID instead.
>
>
> thanks,
>
> Takashi

Thanks for the feedback. This is a special case that the ODM didn't
flash the DMI information
and assign a formal SSID. They simply ship with the current status w/o
any BIOS customization.

I agree that we should push the vendor for a BIOS fix or figure out a
generic solution for this
instead of a pin quirk. Please ignore this. Thanks

Chris
