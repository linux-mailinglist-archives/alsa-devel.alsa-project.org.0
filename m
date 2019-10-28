Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2A0E76EE
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 17:44:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BC61205B;
	Mon, 28 Oct 2019 17:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BC61205B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572281090;
	bh=gI7eRnJbZiSZwJVuYAXTNuLLF7BxAEY8coX77zyJMEk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dONiTI7NWJIEIZC/IVPCOU6uCuqo9wmNwEfmQEvSDr1X91yzQCPZL8Rd7BEqZIl2S
	 myys/b267xzd+kQWK2n0/LdQle4VccA+/qu1DAScfi3tH/qmZaUZFGtbPAOENIy8kC
	 4solsuVKNukeOweU6FU97mlarcS+7PP6tI+VOBK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED726F80361;
	Mon, 28 Oct 2019 17:43:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92F91F80361; Mon, 28 Oct 2019 17:43:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBAD1F80145
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 17:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBAD1F80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="klGwHRTL"
Received: by mail-io1-xd41.google.com with SMTP id s17so4323188iol.12
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 09:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T7hboFEeFKyd5NAixP5xiZOuYFeH/C9fhpLKgwRHkUs=;
 b=klGwHRTL5mrKIVtDuSfO99e4sh4sykQEmk1xCfQjQO93WTHqN2jd09J2wI82K7XZv3
 lHFxONAggH6yEFrVcPrsdNnmX+845szwZcXqLaUQd/60yJfww2rxSNhCwyQGDk5hOjO2
 AhktlWElZ7n1NVCMhAxkfoYXhr+doOi0WuQK7WxnWDLl8NVhfxDJR/GJLcY6A7zRF0Es
 8wLHwk+CXeET308GS896cr6zifsPfRJFF6onjNS6w617znys6hy2yZ3LpfmcIk4Zs/g6
 n86RLtYt6t5jcIKe53pGUGqR0Yg91ymfUJ6wAOUtWjftFAWuv7DYdM0UWKIC/YIp7wNc
 QMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T7hboFEeFKyd5NAixP5xiZOuYFeH/C9fhpLKgwRHkUs=;
 b=KN9WCeGEEa36cDYqTY+oFXh5nLMcSXqmH2dPwQOLByS6HMy5mKfwIl808QuBju7hVE
 lDwEcgRuhfAt6+6yYRvB8ve1IHJVNM2P62IKVHCxE4FbdcJqr51M/xdBvcuCSTNXisdC
 GJS8YkGExtVzEHE8KRmpn6Se1iMqGipfGXlSe1flIIrg15mtJImCaO6N9VRLUFuHIRjX
 hDWeN0Cz8Sra81xeiv4ZNwU8UOXi0L/0RJqEfUIf6wU9vcW99kn2IfCUehglnIO/aemd
 m05I+B+TscE2hUmtJa2bsv5+959vfQd8kMh+xzVx/VwwWBRR5g34iEFeyvn4jPSuPE1h
 ITCw==
X-Gm-Message-State: APjAAAWG34QmRtlWLcP5qCGsMxINvSWrfSi0aCuuTQf2wCM7HQyH4Rg1
 pc08TdUzWXPQfBIT6R9MNu2aShjU6uEjwuxdTz8=
X-Google-Smtp-Source: APXvYqxI39T88uTzfIWo1E/+l15lDn1rBKzV5Mm1lUMuD5oaP5IrRMkeMKreID8HOeG0AEElnlLbCSwIpd0X2zWWJ3A=
X-Received: by 2002:a6b:ba44:: with SMTP id k65mr86633iof.190.1572280982021;
 Mon, 28 Oct 2019 09:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191027221007.14317-1-navid.emamdoost@gmail.com>
 <s5hpnihmlk3.wl-tiwai@suse.de>
 <CAEkB2ESwKEQYQx75BnaHf4aUQHObx4jf0hreQx_KTeZ+QCjL4g@mail.gmail.com>
 <s5hy2x4u8oi.wl-tiwai@suse.de>
In-Reply-To: <s5hy2x4u8oi.wl-tiwai@suse.de>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Mon, 28 Oct 2019 11:42:50 -0500
Message-ID: <CAEkB2ERL9GPXWvkPViMp4k1MrZn08v-kTNv8B495hqi4e-TJog@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Kangjie Lu <kjlu@umn.edu>,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Fix memory leak in
	__snd_usbmidi_create
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

On Mon, Oct 28, 2019 at 11:38 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 28 Oct 2019 17:25:41 +0100,
> Navid Emamdoost wrote:
> >
> > Thanks for the explanation,
> >
> > On Mon, Oct 28, 2019 at 1:27 AM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Sun, 27 Oct 2019 23:10:06 +0100,
> > > Navid Emamdoost wrote:
> > > >
> > > > In the implementation of __snd_usbmidi_create() there is a memory leak
> > > > caused by incorrect goto destination. Go to free_midi if
> > > > snd_usbmidi_create_endpoints_midiman() or snd_usbmidi_create_endpoints()
> > > > fail.
> > >
> > > No, this will lead to double-free.  After registering the rawmidi
> > > interface at snd_usbmidi_create_rawmidi(), the common destructor will
> > > be called via rawmidi private_free callback, and this will release the
> > > all resources already.
> > Now I can see how rawmidi private_free is set up to release the
> > resources, but what concerns me is that at the moment of endpoint/port
> > creation umidi is not yet added to the midi_list.
> > In other words, what I see is that we still have just one local
> > pointer to umidi if any of snd_usbmidi_create_endpoint* fail.
> > Am I missing something?
>
> The rawmidi object that is created via snd_rawmidi_new() is managed
> via snd_device list, and it's traversed at snd_card_disconnect() and
> snd_card_free() calls.  It's something like devm-stuff (but
> implemented in a different way).  The midi_list is an explicit list
> for the USB MIDI driver, and it's an individual one from the device
> list.

Thanks for the clarification.

>
>
> Takashi
>
> >
> >
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> > > >
> > > > Fixes: 731209cc0417 ("ALSA: usb-midi: Use common error handling code in __snd_usbmidi_create()")
> > > > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> > > > ---
> > > >  sound/usb/midi.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/sound/usb/midi.c b/sound/usb/midi.c
> > > > index b737f0ec77d0..22db37fbfbbd 100644
> > > > --- a/sound/usb/midi.c
> > > > +++ b/sound/usb/midi.c
> > > > @@ -2476,7 +2476,7 @@ int __snd_usbmidi_create(struct snd_card *card,
> > > >       else
> > > >               err = snd_usbmidi_create_endpoints(umidi, endpoints);
> > > >       if (err < 0)
> > > > -             goto exit;
> > > > +             goto free_midi;
> > > >
> > > >       usb_autopm_get_interface_no_resume(umidi->iface);
> > > >
> > > > --
> > > > 2.17.1
> > > >
> >
> >
> >
> > --
> > Navid.
> >



-- 
Navid.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
