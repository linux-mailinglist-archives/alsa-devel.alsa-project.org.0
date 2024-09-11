Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D9D977E58
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:16:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35E7D1933;
	Fri, 13 Sep 2024 13:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35E7D1933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726226190;
	bh=28VQxxTcF6zriSW//kiDBloDgrUWMiPf3s4r6H2DoeU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oyyrsTTJ543CntLZQgdIZxqKKIQibwsCNifE54Vi8ryfy/noxvv4bgKsZHKmiaTWB
	 ZPPgtRyGOgSSIXWWeSH0Dj9mNvEhV1ZypZqUJ8iSyw6oSdMrW/xwvJqzNbHOT4f6hM
	 Vk28v+JmhuAO3Whsnr3Srp5Wul3qnh+RRFRoGEJ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F283F8085B; Fri, 13 Sep 2024 13:13:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 810CCF80857;
	Fri, 13 Sep 2024 13:13:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79868F801F5; Wed, 11 Sep 2024 21:27:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6ABFF80107
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 21:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6ABFF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Ct8Fy3A0
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso216627e87.0
        for <alsa-devel@alsa-project.org>;
 Wed, 11 Sep 2024 12:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726082865; x=1726687665;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVNn2ed2GBXRXi1IS2byeByLJGlVq8ZELsiy66KEkNM=;
        b=Ct8Fy3A0CmRSz+w4vTQIEqevGVDjcEOLVmvqfBqa/fTLY78QFq78XhIfmkdEy+YAqx
         xOWdax9wIr1phhREY3RN8yA8qxj+NeKzxzG//Rz9RKpnE+aUIe6A+wpfM3hjeNKZhRuJ
         uZU0V2yD8RXvf14Ln1sYGhNJzOrJbmTs4rl4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726082865; x=1726687665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVNn2ed2GBXRXi1IS2byeByLJGlVq8ZELsiy66KEkNM=;
        b=jAOBh6UEQoyRIpsNkyeebxZWWPGVoSBEpWm/Uk6pZ/MT03akzpQLINGis7guHSdx21
         KTl5ArUa4I/1RkEn2L2uhKC7c+rzMluibgSBqOdxz5PRHebh6xW2o/au54crpJSzEn1d
         FhnLl5t0/gyc6O3GrDaTEaOuidf2kb/K/F1qyP4VHq/Mhj7yfThy4Qy8Yw1zyJBlVTEo
         BGsZKjdlMBNIGLI1WXdwNozZOQtjB297tfI8/prh36Trr7utp2RIhSnXJpEJonG4I1XP
         bgBkBC94l5w8GD7UpO76v4Ej2Xk9WtAzIgmIXLLWTZ3vzmSFOArDawQU+/JNyKw/hS7b
         oK4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP0ghcW8xpzPDsJEEVrN6OQM9sm53GHl5ZIS90x87RFXbNsW6EMbSeJxFTWSq22/ypC0lwclSp4tq8@alsa-project.org
X-Gm-Message-State: AOJu0YyR9nclbl3L6+4KdtVp8l28ZgVy+f326oNsVEW98qI5mrc1U93W
	VGhBp4igEM44U5RvHeDLGXUhDf9BXy3MWCuBmKbzqPTLqjbIFlvbVVWQA8ylC0SR1Z3uTih86xi
	d7fkNFF02BD029f6oHjZbeGPol+5zLf6Dwx2p
X-Google-Smtp-Source: 
 AGHT+IEW2bxQx2PeMhxbvntpzjVnkkvCp2gCzaOGUyXEwbimgXH5Avs6JFBqhKxW4Eh2kobLxWBwS7SfV7odLAGzdEE=
X-Received: by 2002:a05:6512:ac9:b0:52e:932d:88ab with SMTP id
 2adb3069b0e04-53678fb7165mr370248e87.23.1726082865014; Wed, 11 Sep 2024
 12:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240906211445.3924724-1-joshuapius@google.com>
 <878qw2d1ry.wl-tiwai@suse.de>
 <CAFs7P=g8Pqk2-WH8kX6spNSjJ8x80GnDur0ny2CvpzTKb7oa+Q@mail.gmail.com>
 <87o74v7w43.wl-tiwai@suse.de>
In-Reply-To: <87o74v7w43.wl-tiwai@suse.de>
From: Joshua Pius <joshuapius@chromium.org>
Date: Wed, 11 Sep 2024 15:27:34 -0400
Message-ID: 
 <CAPUqXZAabm2xCK_H9bf=JBZk25BXKzsCUtcGEv0dHsMCyUTcZQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Add logitech Audio profile quirk
To: Takashi Iwai <tiwai@suse.de>
Cc: Joshua Pius <joshuapius@google.com>, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Steven 'Steve' Kendall" <skend@chromium.org>,
 Karol Kosik <k.kosik@outlook.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: joshuapius@chromium.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SPA6ZHIYYD3IFFSFW3RI7SSMOP65RQEC
X-Message-ID-Hash: SPA6ZHIYYD3IFFSFW3RI7SSMOP65RQEC
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:12:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SPA6ZHIYYD3IFFSFW3RI7SSMOP65RQEC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Done.


On Tue, Sep 10, 2024 at 4:25=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 09 Sep 2024 04:03:36 +0200,
> Joshua Pius wrote:
> >
> > Yes, this change is for UCM profiles.
> >
> > Yes this should be a one time occurrence as afterwards effort is being
> > made to migrate over to UCM v2.
>
> OK, then I'll take it.  But, I noticed that your Signed-off-by tag was
> with google.com address while you submitted from chromium.org.
> Could you align those?
>
>
> thanks,
>
> Takashi
>
> >
> > Thanks,
> >
> > Joshua P
> >
> >
> >
> >
> >
> > On Sun, Sep 8, 2024 at 3:47=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wro=
te:
> > >
> > > On Fri, 06 Sep 2024 23:14:38 +0200,
> > > Joshua Pius wrote:
> > > >
> > > > Specify shortnames for the following Logitech Devices: Rally bar, R=
ally
> > > > bar mini, Tap, MeetUp and Huddle.
> > > >
> > > > Signed-off-by: Joshua Pius <joshuapius@chromium.org>
> > >
> > > Is this change needed only for UCM profiles?  UCM v2 should be able t=
o
> > > handle better to identify models, and such short name updates aren't
> > > needed for them.
> > >
> > > OTOH, I don't mind much to take this kind of small harmless changes
> > > (unless it happens too frequently).  So I'll likely take this, but
> > > just for verifying the situation.
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> > >
> > > > ---
> > > >  sound/usb/card.c | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > > > index 778de9244f1e..9c411b82a218 100644
> > > > --- a/sound/usb/card.c
> > > > +++ b/sound/usb/card.c
> > > > @@ -384,6 +384,12 @@ static const struct usb_audio_device_name usb_=
audio_names[] =3D {
> > > >       /* Creative/Toshiba Multimedia Center SB-0500 */
> > > >       DEVICE_NAME(0x041e, 0x3048, "Toshiba", "SB-0500"),
> > > >
> > > > +     /* Logitech Audio Devices */
> > > > +     DEVICE_NAME(0x046d, 0x0867, "Logitech, Inc.", "Logi-MeetUp"),
> > > > +     DEVICE_NAME(0x046d, 0x0874, "Logitech, Inc.", "Logi-Tap-Audio=
"),
> > > > +     DEVICE_NAME(0x046d, 0x087c, "Logitech, Inc.", "Logi-Huddle"),
> > > > +     DEVICE_NAME(0x046d, 0x0898, "Logitech, Inc.", "Logi-RB-Audio"=
),
> > > > +     DEVICE_NAME(0x046d, 0x08d2, "Logitech, Inc.", "Logi-RBM-Audio=
"),
> > > >       DEVICE_NAME(0x046d, 0x0990, "Logitech, Inc.", "QuickCam Pro 9=
000"),
> > > >
> > > >       DEVICE_NAME(0x05e1, 0x0408, "Syntek", "STK1160"),
> > > > --
> > > > 2.46.0.598.g6f2099f65c-goog
> > > >
