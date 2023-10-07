Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E53187BC33D
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Oct 2023 02:13:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9E311E4;
	Sat,  7 Oct 2023 02:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9E311E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696637627;
	bh=VCTqxMNvttUp4Z2H01A+GT0JhLDMe0EDa3VvQFxSehc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kJPEVGRcGjr3i3vuEI0AnplDrQ22hvsKOd0knCsbRHAvLZgW4NoeavF5vRHnXRlUS
	 x1p3Rn+x5H0/+jjs6E+UZZdTCE5+ZqjxePuF9ZQZyAa5aTM7D61JzLjdVrHrCAFbGA
	 nZwVWGHA2m1UnNFC3f7hAySnZX5QTwca+e2KDxgI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20933F80557; Sat,  7 Oct 2023 02:12:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEBF5F80310;
	Sat,  7 Oct 2023 02:12:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E19EDF8047D; Sat,  7 Oct 2023 02:12:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2F61F800C1
	for <alsa-devel@alsa-project.org>; Sat,  7 Oct 2023 02:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2F61F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=eMCC9PmH
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-578b4997decso2027817a12.0
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Oct 2023 17:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1696637562; x=1697242362;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q77m1Jw37wHMVwRV/6Iezn7zzTFl+LegI0ZbVJAaVVw=;
        b=eMCC9PmHPr8loAuKIhnUPahOCB6NVqwiGufxQS890iPgXnT3e/ioDDRDZYSi6LTdlh
         LfDfl6TQhEZpIUsWKZXtRdWWRX0g2d2JSl7Ggbcc3vYdAMT9w40jkSAH9cA1U/T1HGOC
         n7aQKvbCNoaHK3KCkNcKmqP0HoryKeQNUC6Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696637562; x=1697242362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q77m1Jw37wHMVwRV/6Iezn7zzTFl+LegI0ZbVJAaVVw=;
        b=a4zWupTJl37LhKuE9qcxbGjpul3TTEZJkT4Pql7/DKDJjvk50V8SVCVxFDNNM2jJZ+
         1MW0rxhCm+Jg/KRRcZm6PzNpl1AW849euegEKEkv7IPejvi6CzRbvno1QEGRdLpF850g
         rT150paHImdgUoDvKdKax2CmDP2tPmfna1CMlym9cZNrxJuZFwO6Tv1j+mLlV/jdE5D+
         zFY3paD+oTwf+djZ8KjIrrKr0obvbx6RQvjYponNzgxIeb9RU813+ydsKaUXhJzH76b7
         dzL0LnIfaJ4IabX73HbKTK7pbEzXiYFRqKkBhK3bZom63dvqVRUbR/YrJGCD46+jeAvE
         VbSg==
X-Gm-Message-State: AOJu0Yz6yDNWPLdMJYdqRQ1xMHMPn6TYgTaToJ9f+d286PSoL7gHmX+B
	u4KgAFjZhDRPWwwYlo0ORC8lh5lhyYh+v4lG/ZYQuWgwz0W832xdUlPmCo0He5rfvWbYlEBWYkR
	itEW2LSgVZuxnH+SrYht67zOgrjuyUg==
X-Google-Smtp-Source: 
 AGHT+IFN1I9rcNMJiS9J0Ic+LAVF0PGRWJfZQzkdPJ1UqJPmQK9v7cebFd0Xo4U5bKEaUiDjj+fXPXI3Ea3lgfbpglk=
X-Received: by 2002:a05:6a20:2447:b0:160:57a6:7eea with SMTP id
 t7-20020a056a20244700b0016057a67eeamr10491633pzc.37.1696637558616; Fri, 06
 Oct 2023 17:12:38 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CANAqB7JFnNbbd0+zEKrSW6mSnVrGr8MPJ9ESnsNc3uXQdkFEZw@mail.gmail.com>
 <87r0m8w2nf.wl-tiwai@suse.de>
In-Reply-To: <87r0m8w2nf.wl-tiwai@suse.de>
From: Michael Wang <michael-mw.wang@broadcom.com>
Date: Fri, 6 Oct 2023 17:12:20 -0700
Message-ID: 
 <CANAqB7LBRjAH1UOwA5AtoVjw7veoPBzH_HkoPv3bogmgBgaZAA@mail.gmail.com>
Subject: Re: time to remove COPYING.GPL from alsa-plugins? (issue #45)
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Abdul Khan <abdul.khan@broadcom.com>,
	Yuming Wen <yuming.wen@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256;
	boundary="0000000000003253cd06071537ea"
Message-ID-Hash: N52X455MAUDB7R3TD2YALI3Y4NLHVX2R
X-Message-ID-Hash: N52X455MAUDB7R3TD2YALI3Y4NLHVX2R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N52X455MAUDB7R3TD2YALI3Y4NLHVX2R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--0000000000003253cd06071537ea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Thanks for taking time to address this issue.

Yes, rate_samplerate.c is dual licensed (LGPL or GPLv2).   However,
depending on one's interpretation, someone MAY conclude that the
rate_samplerate plugin is licensed as GPLv2 for a commercial entity
such as Broadcom.

The first line in the license is:

"This plugin code is supposed to be used and distributed primarily
under GPL v2 or later..."

The second line says:

"However, if you already own a commercial license to use libsamplerate
for dynamic linking, this plugin code can be used and distributed also
under LGPL v2.1 or later."

But Broadcom does not own a "commercial license to use libsamplerate"
since libsamplerate basically eliminated the need for a commercial
license in 2016 when it was released with the 2-Clause BSD license.
So it is not clear whether the first sentence (GPLv2) or the second
sentence (LGPLv2) applies to Broadcom.

So I am trying to eliminate any possibility of different
interpretations by requesting that the license in rate_samplerate.c
and the alsa-plugins be updated to reflect the current license status
of libsamplerate.


Thank you,
Michael




On Fri, Oct 6, 2023 at 1:55=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 27 Sep 2023 20:26:31 +0200,
> Michael Wang wrote:
> >
> > Hi Alsa-devs and Mr Iwai,
> >
> > Sorry for the spam, I am resending this in plain text mode this time.
> >
> > It seems the only thing in alsa-plugins that has a GPL license is
> > rate/rate_samplerate.c, and that is due to the license of
> > libsamplerate.  But in 2016, libsamplerate dropped the commercial/GPL
> > part of its license and was released with the 2-Clause BSD license.
> > So I was wondering if the license for rate_samplerate.c can be updated
> > to remove the GPL license, which means the COPYING.GPL file can also
> > be removed from the alsa-plugins package?
> >
> > I have created issue #54 in github.com/alsa-project/alsa-plugins, but
> > so far, no action.
> >
> > Should I submit a pull request?
>
> The code allows LGPL, too.  What's the problem with it?
>
>
> thanks,
>
> Takashi

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

--0000000000003253cd06071537ea
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
HfRV1AAwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIDa+XaLBmvZN37bfYCOP2X94
FUyqDVDffctDa5MpeeNxMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8X
DTIzMTAwNzAwMTI0MlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEW
MAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBOqfAYOuNgQU3Pzsqz+xEadFeFtXll8WP9iV3EAOqk
DaxW13p4GwJfowQagy1VargeIhmB8iZTCQtXRrOUT4znNesrOYZIX1NK++tqDNftJHnTb2udfkZs
Vk6rWU7XaRnv2xUc2kj3S5+1t9NhDi5gDEQbYcZX6d30czKgx+1SblKGUOhT6sBQiNoRYUopDJf5
Iz9qhmgTMg+U8dTh1DtiZsh+ID0zDN5WkhmQ6qusOd+6UhohaevD1gDFMqAhBo8IdDi7WmPsiDo1
hnjRIdz06woRRjuU5L7HCyzKdaMNUYaVod7TVVkMNYOGG0VxyAjm6oo3rjOPnuixGXMNZ4gy
--0000000000003253cd06071537ea--
