Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FE0977E38
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:11:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CD34E80;
	Fri, 13 Sep 2024 13:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CD34E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726225887;
	bh=HhFHAkcIkSLH9d0maMPyRChdvunG8qAN1QPbL49mMfw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=elfJ+3IZ4hmXhDs4M+DS+qUoAgYE6ZdxPV734nsaNrZqk+yiYQJ/vs8PGM2aBzq5N
	 YwcndCkMnfRTEwCTTfbYoNB9qCsBZF7nzyR2DDkVmpidxOwHODqQQ5c9PpmCxOS3YV
	 iJGp/nI1K7+xuOtL/48smidzUWc7V1LczhcHLhzI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54140F805B3; Fri, 13 Sep 2024 13:11:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F943F805B3;
	Fri, 13 Sep 2024 13:11:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EBF4F801F5; Mon,  9 Sep 2024 04:04:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B72D1F8010B
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 04:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B72D1F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=EAkdU5vN
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42cb417182bso235e9.1
        for <alsa-devel@alsa-project.org>;
 Sun, 08 Sep 2024 19:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725847454; x=1726452254;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMyPt7AhPbkwJLr/QUbCyAauSRNgXD7xB86A6jpKbvI=;
        b=EAkdU5vNwh0uK/44YmOXGEyPjuC1cD77o5U1mgkNys0qRKPCQImOei9nnhYhiJsZrK
         ikCo6MWHgiyWbx0WhEipC8z7y49RUoi0rq0KUz95oEM2aEu96j/3uLLIPXWq9O19sAS1
         79viGsbFpJ9CafTELZ0u1DZLeMEU4X8gaM5D/CvHdJseOpPnfOXDlOU21aeqJykHcRLe
         NFo/8bM0cSelgub+ZqNauWMcI0ZusgelyLyEbRYOPYVycDT7AmyvBEyuO6tqUFW5evvi
         9mdrTWdDF/g+IGqupvg/Ov1ATpCCUvx5zvLbBIvxVeyhfPuSWa+3qiBkpA4TFGnnsYop
         LMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725847454; x=1726452254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMyPt7AhPbkwJLr/QUbCyAauSRNgXD7xB86A6jpKbvI=;
        b=DY5qgcAJmDhLVosHHUiaXJ6yQ/jJ2BXj5jPtTbQ37AnGh+/c1VNj+3C5hJZzGaozzT
         mYxKfSDuEXAw4jxnGwSeUpuq71ObRP933HSwdR1dOpSK95sS9u2RjIuvxOTHrAZ4uKDm
         yYj235/M81FrOQ36/IIF9MnUZ1qtkGD7Cv3DSwd3VhhRQMmeJnJaDdTq1qj4m7fz1Gne
         93dvwlA2OOmKcYMI3sD3x93F0BQ9iHOUHocWS4lfHVlGiCZlfAgQk4CqSZTCM0djmix3
         brY4p+c0PKQm0/QqCipi2YYziQDLZybiJJ9ngW47I3/N2IFuoLTkklGrBUsFDh1OiNvv
         D7UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN2b2XtpcKotAUpaBHA0Mv62fqyP3XI41qwhkd5K+g/C7106KDCWbj9FEZo09EQ3WZEy2jKvji9KQI@alsa-project.org
X-Gm-Message-State: AOJu0YxZD/JHoeSnkvHGBhZRVOAIXQkKyBVAmsznNRzfLhP8BQVDmoCH
	Y+fei0XCpjrO84uIlS5YEV0moon6STdADEmx2OE/nc4+bMG1P197FprZPZqbtVwULbn6zLJy7Qk
	txIIoXz7weufiJhoDJBMOxF/nW15yc/1Y9CI=
X-Gm-Gg: ASbGncu7eOs43WUV2eM4va3YR4qXLkpmeP/NNKnM1UAAhcm3xFuERDdoIREDlDWV5OK
	TBipwp7V8kOMY6eu/1y53cYzAR/Hpuayxqh5ku9UenNc3MX06H+YFDsHs55fqpApr
X-Google-Smtp-Source: 
 AGHT+IHBuiIVx/1GaXcuzHos7shtGEUjI71oFo8vaT0N0MHIstJosoRZ+W29ygUeClp98PfK53cU1PezpJckObMmvS0=
X-Received: by 2002:a05:600c:1c13:b0:424:a2ae:8d1d with SMTP id
 5b1f17b1804b1-42cb9d53133mr3975e9.2.1725847453147; Sun, 08 Sep 2024 19:04:13
 -0700 (PDT)
MIME-Version: 1.0
References: <20240906211445.3924724-1-joshuapius@google.com>
 <878qw2d1ry.wl-tiwai@suse.de>
In-Reply-To: <878qw2d1ry.wl-tiwai@suse.de>
From: Joshua Pius <joshuapius@google.com>
Date: Sun, 8 Sep 2024 22:03:36 -0400
Message-ID: 
 <CAFs7P=g8Pqk2-WH8kX6spNSjJ8x80GnDur0ny2CvpzTKb7oa+Q@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Add logitech Audio profile quirk
To: Takashi Iwai <tiwai@suse.de>
Cc: Joshua Pius <joshuapius@chromium.org>, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Steven 'Steve' Kendall" <skend@chromium.org>,
 Karol Kosik <k.kosik@outlook.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: joshuapius@google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MWUEDSZB4QLP5B4WJJZX2CYDMFDSX4OH
X-Message-ID-Hash: MWUEDSZB4QLP5B4WJJZX2CYDMFDSX4OH
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:11:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MWUEDSZB4QLP5B4WJJZX2CYDMFDSX4OH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Yes, this change is for UCM profiles.

Yes this should be a one time occurrence as afterwards effort is being
made to migrate over to UCM v2.

Thanks,

Joshua P





On Sun, Sep 8, 2024 at 3:47=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 06 Sep 2024 23:14:38 +0200,
> Joshua Pius wrote:
> >
> > Specify shortnames for the following Logitech Devices: Rally bar, Rally
> > bar mini, Tap, MeetUp and Huddle.
> >
> > Signed-off-by: Joshua Pius <joshuapius@google.com>
>
> Is this change needed only for UCM profiles?  UCM v2 should be able to
> handle better to identify models, and such short name updates aren't
> needed for them.
>
> OTOH, I don't mind much to take this kind of small harmless changes
> (unless it happens too frequently).  So I'll likely take this, but
> just for verifying the situation.
>
>
> thanks,
>
> Takashi
>
>
> > ---
> >  sound/usb/card.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > index 778de9244f1e..9c411b82a218 100644
> > --- a/sound/usb/card.c
> > +++ b/sound/usb/card.c
> > @@ -384,6 +384,12 @@ static const struct usb_audio_device_name usb_audi=
o_names[] =3D {
> >       /* Creative/Toshiba Multimedia Center SB-0500 */
> >       DEVICE_NAME(0x041e, 0x3048, "Toshiba", "SB-0500"),
> >
> > +     /* Logitech Audio Devices */
> > +     DEVICE_NAME(0x046d, 0x0867, "Logitech, Inc.", "Logi-MeetUp"),
> > +     DEVICE_NAME(0x046d, 0x0874, "Logitech, Inc.", "Logi-Tap-Audio"),
> > +     DEVICE_NAME(0x046d, 0x087c, "Logitech, Inc.", "Logi-Huddle"),
> > +     DEVICE_NAME(0x046d, 0x0898, "Logitech, Inc.", "Logi-RB-Audio"),
> > +     DEVICE_NAME(0x046d, 0x08d2, "Logitech, Inc.", "Logi-RBM-Audio"),
> >       DEVICE_NAME(0x046d, 0x0990, "Logitech, Inc.", "QuickCam Pro 9000"=
),
> >
> >       DEVICE_NAME(0x05e1, 0x0408, "Syntek", "STK1160"),
> > --
> > 2.46.0.598.g6f2099f65c-goog
> >
