Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4129B7BE74D
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 19:03:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E4EDEC0;
	Mon,  9 Oct 2023 19:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E4EDEC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696871020;
	bh=pQ8B1yXJ/CVGuZQYMYmEczbXc/rO3lGzIHuyiNsphy8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xk16Fkik0n9ETkQHkS3xB8xx/k/oH+V5vJvwf8vv9oF2n0937fathU4SqQxr8tXBJ
	 dsxNw9hd+8MbBnqvLuR6RInLZfJkhmJN9z9+PUpfcd7MD9b0HxcjfSu14Jn9bQLezT
	 oyHu9F9lRwWZDNM7za6TNiSQsCWIh6c5YDbDHDXI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA1DFF80558; Mon,  9 Oct 2023 19:02:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B718F8027B;
	Mon,  9 Oct 2023 19:02:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31C59F802BE; Mon,  9 Oct 2023 19:02:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B849DF8015B
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 19:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B849DF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=DSrtP71h
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-69101022969so4203349b3a.3
        for <alsa-devel@alsa-project.org>;
 Mon, 09 Oct 2023 10:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1696870923; x=1697475723;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SPOg1UWk0J0zQQ+TDslX4bIes3k2msNlhX1T/YF10Ic=;
        b=DSrtP71hIhab4dEbWjRYkMYE71jyPCXrXT/mq5hqNaKOFzf17b5VroM0wukbEZQHW/
         bkFHu0AF8e4YE+ZkpDMJYMOYllsjOffQx8QpiRhAPje5noaIYSRa+USMwxmBtYmq+eJ5
         +iqdybCCIDr7NQLzF84SXJXs9Hvvkev0A2sRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696870923; x=1697475723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPOg1UWk0J0zQQ+TDslX4bIes3k2msNlhX1T/YF10Ic=;
        b=UkhCb3706JUjrwn8O7LZUNpW8lKs+VLEwsFEUxD+UzUhAArmlvqmdOHVPaBOx0ZG5o
         eKlINDl3E9dGWeXI5SpknzfO2hwthSnXfdHQd5TW7S0/p2wMGxOLZ4mzeS/eRaq92NxT
         4yKdPg/0v1ORjtjBYTFwhrm4s3vCPgyWLRUpnNi0jFQmTjDH6vqMsxux3Y8lQRG6J/zm
         rDUdu9QBjI+YBp5GwUX8JoRpmcF6V1g1t/qHvyW0WuEv6BH5xkRWRr+GvXQT1pryeEem
         0BZ380PmwBmWA+ugVmvM01HCVc/IVV+BR+z3okVi2WPlXnCpTtMvz2wqTDYYkKB1h2eB
         1PAA==
X-Gm-Message-State: AOJu0Yyk4R3L6YP3EKX0HeIuPaWJHsd2U0TwRenUQ+NBm46TFU3cgXcK
	4fdyEbWs+OkcqSEz/I+wMyega4Rb0Z6w2cOaTPMDdcoekdT/Rk2o5ucxmsdyyAvD348MBtFoZXm
	zBLmeS6aPDF/pHx/ztjvPfoLOJ/0HiQ==
X-Google-Smtp-Source: 
 AGHT+IGT6su5YG5fy8noVVPFu2jPMrwAJLef5lfW1wDJAPX3ZikQvoRLHVxZBX5TeK3jpvAc2fXj2vpAS01OrJFk5ZQ=
X-Received: by 2002:a05:6a20:4287:b0:141:69d:8041 with SMTP id
 o7-20020a056a20428700b00141069d8041mr19741760pzj.48.1696870922693; Mon, 09
 Oct 2023 10:02:02 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CANAqB7JFnNbbd0+zEKrSW6mSnVrGr8MPJ9ESnsNc3uXQdkFEZw@mail.gmail.com>
 <87r0m8w2nf.wl-tiwai@suse.de>
 <CANAqB7LBRjAH1UOwA5AtoVjw7veoPBzH_HkoPv3bogmgBgaZAA@mail.gmail.com>
 <87y1geucur.wl-tiwai@suse.de>
In-Reply-To: <87y1geucur.wl-tiwai@suse.de>
From: Michael Wang <michael-mw.wang@broadcom.com>
Date: Mon, 9 Oct 2023 10:01:45 -0700
Message-ID: 
 <CANAqB7J0V6n-eVkRwT1jctX4-4t=4-ivZhvuTWuGG7iEx+d=Eg@mail.gmail.com>
Subject: Re: time to remove COPYING.GPL from alsa-plugins? (issue #45)
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Abdul Khan <abdul.khan@broadcom.com>,
	Yuming Wen <yuming.wen@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256;
	boundary="0000000000009c2c2906074b8c16"
Message-ID-Hash: YFI6AL663JPHWGSOYNTREJTDDQJEKSXZ
X-Message-ID-Hash: YFI6AL663JPHWGSOYNTREJTDDQJEKSXZ
X-MailFrom: michael-mw.wang@broadcom.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YFI6AL663JPHWGSOYNTREJTDDQJEKSXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--0000000000009c2c2906074b8c16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

That is great news!  Thank you for taking care of this!

Michael

On Sat, Oct 7, 2023 at 12:10=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sat, 07 Oct 2023 02:12:20 +0200,
> Michael Wang wrote:
> >
> > Hi Takashi,
> >
> > Thanks for taking time to address this issue.
> >
> > Yes, rate_samplerate.c is dual licensed (LGPL or GPLv2).   However,
> > depending on one's interpretation, someone MAY conclude that the
> > rate_samplerate plugin is licensed as GPLv2 for a commercial entity
> > such as Broadcom.
> >
> > The first line in the license is:
> >
> > "This plugin code is supposed to be used and distributed primarily
> > under GPL v2 or later..."
> >
> > The second line says:
> >
> > "However, if you already own a commercial license to use libsamplerate
> > for dynamic linking, this plugin code can be used and distributed also
> > under LGPL v2.1 or later."
> >
> > But Broadcom does not own a "commercial license to use libsamplerate"
> > since libsamplerate basically eliminated the need for a commercial
> > license in 2016 when it was released with the 2-Clause BSD license.
> > So it is not clear whether the first sentence (GPLv2) or the second
> > sentence (LGPLv2) applies to Broadcom.
> >
> > So I am trying to eliminate any possibility of different
> > interpretations by requesting that the license in rate_samplerate.c
> > and the alsa-plugins be updated to reflect the current license status
> > of libsamplerate.
>
> OK, then I think we can simply move to LGPL-only for that plugin.
> Luckily, I'm the sole author of that piece of code, so it's legally OK
> to relicense.
>
>
> Takashi
>
> >
> >
> > Thank you,
> > Michael
> >
> >
> >
> >
> > On Fri, Oct 6, 2023 at 1:55=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wro=
te:
> > >
> > > On Wed, 27 Sep 2023 20:26:31 +0200,
> > > Michael Wang wrote:
> > > >
> > > > Hi Alsa-devs and Mr Iwai,
> > > >
> > > > Sorry for the spam, I am resending this in plain text mode this tim=
e.
> > > >
> > > > It seems the only thing in alsa-plugins that has a GPL license is
> > > > rate/rate_samplerate.c, and that is due to the license of
> > > > libsamplerate.  But in 2016, libsamplerate dropped the commercial/G=
PL
> > > > part of its license and was released with the 2-Clause BSD license.
> > > > So I was wondering if the license for rate_samplerate.c can be upda=
ted
> > > > to remove the GPL license, which means the COPYING.GPL file can als=
o
> > > > be removed from the alsa-plugins package?
> > > >
> > > > I have created issue #54 in github.com/alsa-project/alsa-plugins, b=
ut
> > > > so far, no action.
> > > >
> > > > Should I submit a pull request?
> > >
> > > The code allows LGPL, too.  What's the problem with it?
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> >
> > --
> > This electronic communication and the information and any files transmi=
tted
> > with it, or attached to it, are confidential and are intended solely fo=
r
> > the use of the individual or entity to whom it is addressed and may con=
tain
> > information that is confidential, legally privileged, protected by priv=
acy
> > laws, or otherwise restricted from disclosure to anyone else. If you ar=
e
> > not the intended recipient or the person responsible for delivering the
> > e-mail to the intended recipient, you are hereby notified that any use,
> > copying, distributing, dissemination, forwarding, printing, or copying =
of
> > this e-mail is strictly prohibited. If you received this e-mail in erro=
r,
> > please return the e-mail to the sender, delete it from your computer, a=
nd
> > destroy any printed copy of it.
> > Verifying...

--=20
This electronic communication and the information and any files transmitted=
=20
with it, or attached to it, are confidential and are intended solely for=20
the use of the individual or entity to whom it is addressed and may contain=
=20
information that is confidential, legally privileged, protected by privacy=
=20
laws, or otherwise restricted from disclosure to anyone else. If you are=20
not the intended recipient or the person responsible for delivering the=20
e-mail to the intended recipient, you are hereby notified that any use,=20
copying, distributing, dissemination, forwarding, printing, or copying of=
=20
this e-mail is strictly prohibited. If you received this e-mail in error,=
=20
please return the e-mail to the sender, delete it from your computer, and=
=20
destroy any printed copy of it.

--0000000000009c2c2906074b8c16
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
apNRdNdkVONsz3e8Hho+matwsuAIVFXLpynJvXm7Q68qzcgRSHkZn2gFMURm3Kx9yTjvsXNRkPkf
gYg/HX13LKrofI5gaIXRlu0W2Ipi/a4J3L0e8w9VvwjqRu8CAwEAAaOCAd0wggHZMA4GA1UdDwEB
/wQEAwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xv
YmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEF
BQcwAYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIw
MjAwTQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmds
b2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0
cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJwYD
VR0RBCAwHoEcbWljaGFlbC1tdy53YW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcD
BDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUvUd1nm9uBop42RoO
/xQH7Hfjbf4wDQYJKoZIhvcNAQELBQADggEBADT96mHlyTvP/IyzpAITwkvQDEBjGkx4V5MWOz/J
7IM/EstA914gLj5R/8l8M26OVcvxIC0mAOn66K2dxb8tMm8bqxDz9yUfVZEiWpRbud+Uk6B07YwF
lNkfWKDvd5eVOgW24uBt+G1wI2F5Dd/22uUGsQtWYskiHfdb99Mu+heYrCKwUygkeXkV3rt2G02q
wUVlTYSVqEbepi6xOOHWx/DrXPRd5AWjyQ5Ka4xQ5uqClDemi02AcH0esl9tp1M7z4hDqQQWLlZ0
uLY8T7LJs9i07pxOoJP7aUAY/MW7oAeuQPwpdco3FFRtg7zQEs4kwkycZaBvQatZ0fr1LLZ10sEx
ggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEw
LwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgxN6NuFSYif
HfRV1AAwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIBvF9+dKL2SWGMDS6+Pv3azH
i+REa5FmozUTk3mutK7UMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8X
DTIzMTAwOTE3MDIwM1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEW
MAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBL8Hkl/maUMe+/C9kgXWUzFyKJG9nM7GC5DxSPbjDz
ATPjMIyExObvHiYYpuMKBtEnvEhboQnMGhdwlTyyyaxPXh78ho1jlQZRmI4BM9RbUqZzMsQysb59
d3Pv1aQlsQRkHCBGBpfUqXz3rtvlNYPATIn61LXdnVCQr3Hx/QiObU087RsSQg+Boza38RUjCL0Y
/PaoBuNCwoO5liGY2+Acvh2NDN2p084wZMVLi4IhE7oAt6IZHTtimyoGgkdgFz8aSYcCjih4UF+3
iJwWhXQLKbQOlrjheiC248ZFR6DpcLn7hQvMA0QyjKugNK8ve857rY+oSqyA6hDkG0o3JgNV
--0000000000009c2c2906074b8c16--
