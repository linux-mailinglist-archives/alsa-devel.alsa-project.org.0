Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 502322418A4
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 10:58:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D25A71667;
	Tue, 11 Aug 2020 10:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D25A71667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597136288;
	bh=+7qICEn6hIJ1S0a7q7noyogpBLApkDzMeZlj1V29JOk=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FU/4sYiAK6ZBwhsbgnIckkfwZCdN6v9mpnYaUjnpHdVxLGQU/6+Px49qVy4eAdCTU
	 teoq62LT30cf9IkKDzdBl3B5YsT14mY7z4BENC1Un8NWeDAj5w5G4yi0FNlui31/cT
	 +vHNufvMni92KncAD0YBTel8zj7AaWBUBHM8pYtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AEA4F80118;
	Tue, 11 Aug 2020 10:56:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A470FF8015B; Tue, 11 Aug 2020 10:56:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C92E1F800BC
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 10:56:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C92E1F800BC
Received: from mail-pj1-f69.google.com ([209.85.216.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1k5Q4p-0002Sb-CL
 for alsa-devel@alsa-project.org; Tue, 11 Aug 2020 08:56:11 +0000
Received: by mail-pj1-f69.google.com with SMTP id k103so1684785pje.2
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 01:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=u21NqTiGBaO3K/btYj1Wn3aQqEJu/JKT9VndsfXZEPI=;
 b=V4APy3uILXuJxVGiA67TI4ifKUtQOPgquLhhiNM1hJ6IU3yf34OPAL6q3dBYNLNXyE
 oT53j/MeBPjCNb6edrqBGbLQ26DLnbbafHgfh//i4J0tNe40TcEgqQBrF3T128s4/vSH
 5AvsIkFJREFWSty0SrUFGAPZFGaBEzPx26zboI5Ihi7STafXMzwUaLdb7rCmJF3bE/Kz
 nEQ2i/+t2sndHjJhxN/jMTBZO34zMn1d/H/Up3/Czxmsn9isV/ElIoDUuBLMZUrXKDNb
 OcKfDWk3zdYz3kmCc4CmW9SwgFsuqEn/uiF26f0eUWgdH9i9RFg/Puo/qrspejjcNCri
 SRvA==
X-Gm-Message-State: AOAM533qrNikFUXGyPxC1Q0jadSGGRvnhByxLiZ4EZ65KN/4b2UFVW0k
 tQk080A7XDd32Aziybmk0H4jn8JcUNBFa9RS6/IoXm3g04PExMR00glkc/nRnczZKeXD/uZKiMa
 9s+ynnU5wJiRYxhcNam/DCWN8oVXiaJcFRFivyEdE
X-Received: by 2002:a17:90a:c781:: with SMTP id
 gn1mr12984pjb.151.1597136169993; 
 Tue, 11 Aug 2020 01:56:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7PvV/m+33ro9dfryiIo4G78TwNxgylekeGjGa/1zQVw9IhU/vDyVlS84kqG1cPozrtHHlww==
X-Received: by 2002:a17:90a:c781:: with SMTP id
 gn1mr12945pjb.151.1597136169437; 
 Tue, 11 Aug 2020 01:56:09 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id w23sm20160621pgj.5.2020.08.11.01.56.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Aug 2020 01:56:08 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] ALSA: hda - fix the micmute led status for Lenovo
 ThinkCentre AIO
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5ha6z36lk8.wl-tiwai@suse.de>
Date: Tue, 11 Aug 2020 16:56:06 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <01D08974-C4EB-4820-9870-42B633DC19B3@canonical.com>
References: <20200810021659.7429-1-hui.wang@canonical.com>
 <s5hd03z6min.wl-tiwai@suse.de>
 <c8ca5bd3-d9a1-6269-e088-6bc6e3936876@canonical.com>
 <s5ha6z36lk8.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Cc: Hui Wang <hui.wang@canonical.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>, stable@vger.kernel.org
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

Hi,

> On Aug 10, 2020, at 14:51, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Mon, 10 Aug 2020 08:34:36 +0200,
> Hui Wang wrote:
>>=20
>>=20
>> On 2020/8/10 =E4=B8=8B=E5=8D=882:30, Takashi Iwai wrote:
>>> On Mon, 10 Aug 2020 04:16:59 +0200,
>>> Hui Wang wrote:
>>>> After installing the Ubuntu Linux, the micmute led status is not
>>>> correct. Users expect that the led is on if the capture is =
disabled,
>>>> but with the current kernel, the led is off with the capture =
disabled.
>>>>=20
>>>> We tried the old linux kernel like linux-4.15, there is no this =
issue.
>>>> It looks like we introduced this issue when switching to the =
led_cdev.
>>> The behavior can be controlled via "Mic Mute-LED Mode" enum =
kcontrol.
>>> Which value does it have now?  If it's "Follow Capture", that's the
>>> correct behavior.  OTOH, if it's "Follow Mute", the LED polarity is
>>> indeed wrong.
>>=20
>> It is "Follow Mute",  if I change it to "Follow Capture" manually, =
the
>> led status becomes correct.
>=20
> OK, thanks for confirmation.  Applied now.

I wonder if it's because how brightness value passed to =
gpio_mute_led_set() and micmute_led_set():

static int gpio_mute_led_set(struct led_classdev *led_cdev,
                             enum led_brightness brightness)
{
        struct hda_codec *codec =3D =
dev_to_hda_codec(led_cdev->dev->parent);
        struct alc_spec *spec =3D codec->spec;

        alc_update_gpio_led(codec, spec->gpio_mute_led_mask,
                            spec->mute_led_polarity, !brightness);
        return 0;
}

static int micmute_led_set(struct led_classdev *led_cdev,
                           enum led_brightness brightness)
{
        struct hda_codec *codec =3D =
dev_to_hda_codec(led_cdev->dev->parent);
        struct alc_spec *spec =3D codec->spec;

        alc_update_gpio_led(codec, spec->gpio_mic_led_mask,
                            spec->micmute_led_polarity, !!brightness);   =
  =20
        return 0;
}

Maybe we should let micmute_led_set() match gpio_mute_led_set() so the =
micmute polarity can be removed?

Kai-Heng

>=20
>=20
> Takashi

