Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC43B7B0BEB
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 20:28:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09271A4B;
	Wed, 27 Sep 2023 20:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09271A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695839282;
	bh=Y3hOgVMJ+4Q+iDUVJbujfFzzR0ISox49bem5t2Jvhb4=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oH0kVmzacCIKxSHihCG4/6Gz2h0zc8Rcueok4EXn1RK91ugsIapk++53hiF3xcxcw
	 AwhFKRa6spDMoVGQFdtyedabXp8HOhkB8cQIXnMBeAUc5lhkb7yWTFzwGwFpBNmFnG
	 FDTDOviAwZNmdAeETTAwzvTt/uYvrL21H20BgZ+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8287CF8016A; Wed, 27 Sep 2023 20:27:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5982F80166;
	Wed, 27 Sep 2023 20:27:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3A14F8016A; Wed, 27 Sep 2023 20:27:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A9F1F800AA
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 20:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A9F1F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=TBhKtiwa
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-69101d33315so9871573b3a.3
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 11:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1695839210; x=1696444010;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NW2JxzBC8gpOwTWtmG0n5K7koxBCNg/x7KacwIYK9rQ=;
        b=TBhKtiwaAaKmMfGk1zVgB2QQZG1fjDKpnkbDu8k9gSIRYPd9VEdesq03nIBmlZ5+cA
         kyh77M4wdnLJuelbSwhmIUj6ZhscvwEq4iJOJKUu4QpE6wosghuwBiCHolaBmgw07QXJ
         /Ltz7/WLOAkqTB8wHq6R8aRteG+oCXzrjYVRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695839210; x=1696444010;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NW2JxzBC8gpOwTWtmG0n5K7koxBCNg/x7KacwIYK9rQ=;
        b=wGl8KBpNRwc05XIe8KR3T7GuWOuCNM2KaJoGgEKuMhy68EQf4ArYXa6MnvsX/f+RcZ
         7wKKdW5FacHVG7Vu6llGwmqSa/DOD+37dlIRrKdbLHoxXOSXeA24dvrz0wWYQAh+Lkdb
         5qP3nhPQkPtmlv2JnQbZSIic5iLJNWvbQEBfohVreZPOZ8UH872MWG7ASE7PR6b9fB4a
         taG10Q408evpt+/mbJ46qjt2IVFPeKPD1v9KnhV9/uV99UErU0NvqNLvM+jV5JPUPlIb
         WxdGR7k5bSUNFkZVPLx8DNrf0NNtQ2olPpTtX19tBmZDm6Z2jNJuIsLY6ZuqGxC8EqvX
         h5HQ==
X-Gm-Message-State: AOJu0YyFq3HPmgHjb+X4cAJsPVDCpIdwl2+M/ZNLFP5qZLvRTruWOauD
	cA8ityHCZx+vPGhy9pD9WB2pSA/5OYIoic2S/tbEMZ7o4W5D56zQPZYXBCoNJ5VTyXuw4Fijq6S
	tZyYPMT+uOR8dzvTZSJEDA1Vrmv8wyONpeD2tSdr+laE=
X-Google-Smtp-Source: 
 AGHT+IHGOP4rsUvWcgQCR0kvpFuYl/Qk0H+4CofkutswzGJPXmZc4gjotDxr69F6ZdKDr+FzIi9nI6e52XYGSdsvwYg=
X-Received: by 2002:a05:6a20:3d29:b0:153:7978:4faa with SMTP id
 y41-20020a056a203d2900b0015379784faamr3109177pzi.37.1695839209842; Wed, 27
 Sep 2023 11:26:49 -0700 (PDT)
MIME-Version: 1.0
From: Michael Wang <michael-mw.wang@broadcom.com>
Date: Wed, 27 Sep 2023 11:26:31 -0700
Message-ID: 
 <CANAqB7JFnNbbd0+zEKrSW6mSnVrGr8MPJ9ESnsNc3uXQdkFEZw@mail.gmail.com>
Subject: time to remove COPYING.GPL from alsa-plugins? (issue #45)
To: alsa-devel@alsa-project.org, tiwai@suse.de
Cc: Abdul Khan <abdul.khan@broadcom.com>, Yuming Wen <yuming.wen@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256;
	boundary="000000000000baf12a06065b55e2"
Message-ID-Hash: FZNKFD3XI7VTKLWZ6WR6TRNJEUOO5LEP
X-Message-ID-Hash: FZNKFD3XI7VTKLWZ6WR6TRNJEUOO5LEP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FZNKFD3XI7VTKLWZ6WR6TRNJEUOO5LEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--000000000000baf12a06065b55e2
Content-Type: text/plain; charset="UTF-8"

Hi Alsa-devs and Mr Iwai,

Sorry for the spam, I am resending this in plain text mode this time.

It seems the only thing in alsa-plugins that has a GPL license is
rate/rate_samplerate.c, and that is due to the license of
libsamplerate.  But in 2016, libsamplerate dropped the commercial/GPL
part of its license and was released with the 2-Clause BSD license.
So I was wondering if the license for rate_samplerate.c can be updated
to remove the GPL license, which means the COPYING.GPL file can also
be removed from the alsa-plugins package?

I have created issue #54 in github.com/alsa-project/alsa-plugins, but
so far, no action.

Should I submit a pull request?

Thanks,
Michael

-- 
This electronic communication and the information and any files transmitted 
with it, or attached to it, are confidential and are intended solely for 
the use of the individual or entity to whom it is addressed and may contain 
information that is confidential, legally privileged, protected by privacy 
laws, or otherwise restricted from disclosure to anyone else. If you are 
not the intended recipient or the person responsible for delivering the 
e-mail to the intended recipient, you are hereby notified that any use, 
copying, distributing, dissemination, forwarding, printing, or copying of 
this e-mail is strictly prohibited. If you received this e-mail in error, 
please return the e-mail to the sender, delete it from your computer, and 
destroy any printed copy of it.

--000000000000baf12a06065b55e2
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
HfRV1AAwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIKo/N+SScxW2LQHHN28M+cir
s8OO/BWlIjqEW5GrGVFgMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8X
DTIzMDkyNzE4MjY1MFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEW
MAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAseSSGirRwbi1Z/Z2bdfJd3Zh5nV5eac/tHAm9MEKT
V9TQzdEnxNN17P5TXnz7mHxw0LwnyBZvbdf41LyPoh/weIeuJParRjxeqyeL6CM5qhU4kCWNvmTk
hsQoUpCMXF+hxX9gkmWuGZXPsrZAWwH3TgXzh9SQUlo47E8b4rKx5wlH2PDgnSHxPhpsCxvgh4EM
nJ8PyTPEFum7RM51mmTUAeXFcV8yyzdHRhUCORs7uiYv/QkqUj/uYioGkR9tUEjhTDyGA5wRZOiy
C3UL7E+ql9NiLFnmG8ep2GJrnQNT1jRVprMWDFuSRuuvhXUwQhNOmBcRxGsNtnCtmwOPiHlX
--000000000000baf12a06065b55e2--
