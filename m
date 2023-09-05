Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F127931CB
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Sep 2023 00:08:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE927200;
	Wed,  6 Sep 2023 00:07:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE927200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693951717;
	bh=+WZKP7hnu+ieebZFf4eiSGITIcbjjKC7nzlvylMmwVk=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OGzrDgfvJbDwnto199Zt5UIq+NwgXhuKifiFxoxMA6io/ABEWWNcRWIn/zvX1Pd8s
	 BjHRgTVxyPd/5Hh50C9idoyOu+2LlUGgHu+70sQhHIeDWSPCIm5QUjCKw2dbLjOkLZ
	 8dvummzFCvWYdrcoBjJpRf9yird2Q1dyJewHmySk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 302A9F8047D; Wed,  6 Sep 2023 00:07:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0310F8047D;
	Wed,  6 Sep 2023 00:07:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EBAAF80494; Wed,  6 Sep 2023 00:07:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D2C3F80431
	for <alsa-devel@alsa-project.org>; Wed,  6 Sep 2023 00:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D2C3F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=iPepFpKY
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52e5900cf77so2372362a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 05 Sep 2023 15:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1693951655; x=1694556455;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iNuefXuFab5oebQ/fiIEG0xX+d8eGYFWRXQdVBxe5QU=;
        b=iPepFpKYQMW0xaIQZf9bx5efylO28mnGOIxG6/IvKLvPO4wsZdc9uzIb2rv175qRiL
         uNsu07x+Qf7tNr6HOC3WjKmNmgjQlpRBE/9d8IrvPkYkwQCuqEoidyEQiKIPVrU6Cpwm
         OBdUmYmXEDTv6Eg9G3nI7gXjbB6+27XU4vsYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693951655; x=1694556455;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iNuefXuFab5oebQ/fiIEG0xX+d8eGYFWRXQdVBxe5QU=;
        b=DGKVByrye6ySWrDIt3E48RhrP9qb0Yxj+TAy/98cQlNIKLVq+xdGfL2+q9MPLlJhMp
         r43BDC2ARZ9wXLv3Jrhxs//qXOMx89DDs5haIUNX3UBZz7uoCvOTGLhvmQk5f5zxZyi4
         Q0i75MK8xYLvf4RxkI7btBmYMm5IiHA4RdmDDZuTOH2CkXy/JDpUzvu+n3V3h8Y3idDl
         bQ2n8h53ZKtZBWW36EsaOlqXmQBNayJVWFGkHj06Gwxq32bkWlzEqSiH7KhgqTk+YwdI
         MO7IcC9fjir2CFmskR5xvOB5B5VEnxll8zDVwYec9XBa7xJvYpXATPmSPe/PyefbUKae
         5Wiw==
X-Gm-Message-State: AOJu0YzrxP4IbS+VHGHQ+rkFWyPSno2hGaCxn0QETqAjIaTyVHW0CznY
	wBvVC8SjrzsWdpG3KzqHWwKcw2pk67izbxwekgm1JRUQbBB7I4JaGvY+MH+Iu49yD133Rxml4Et
	voiZ3B0IpndzOuUjvCxuCKLwHp3uIhgFdmsdMWNDU+VOWqw==
X-Google-Smtp-Source: 
 AGHT+IGGF5btW/RoVMEERNFePQT08khWGqLYd5DTeOStO1wucXBpT5Dx9RjlWI17wN0OYGMbkxrsCv/ZCOBMw6qpms8=
X-Received: by 2002:a50:ee8d:0:b0:51b:d567:cfed with SMTP id
 f13-20020a50ee8d000000b0051bd567cfedmr888420edr.5.1693951655035; Tue, 05 Sep
 2023 15:07:35 -0700 (PDT)
MIME-Version: 1.0
From: Michael Wang <michael-mw.wang@broadcom.com>
Date: Tue, 5 Sep 2023 15:07:17 -0700
Message-ID: 
 <CANAqB7KEsqLniX1V31Wr=KSjFbaqcqogsnwTMPpBO1kU4QOtUw@mail.gmail.com>
Subject: removing COPYING.GPL from alsa-plugins?
To: alsa-devel@alsa-project.org
Cc: Abdul Khan <abdul.khan@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256;
	boundary="000000000000af9a4e0604a3da1a"
Message-ID-Hash: Q35KJJFZDU7IAQLSOKIGMOKBLXZX6WAA
X-Message-ID-Hash: Q35KJJFZDU7IAQLSOKIGMOKBLXZX6WAA
X-MailFrom: michael-mw.wang@broadcom.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q35KJJFZDU7IAQLSOKIGMOKBLXZX6WAA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--000000000000af9a4e0604a3da1a
Content-Type: text/plain; charset="UTF-8"

Hi Alsa-devel,

While reviewing the license for alsa-plugins-1.2.7.1, I noticed that it has
both a COPYING and a COPYING.GPL file.  The only plugin that possibly has a
GPLv2 license is rate/rate_samplerate.c, which has this at the top of the
file:

 * Rate converter plugin using libsamplerate
 *
 * Copyright (c) 2006 by Takashi Iwai <tiwai@suse.de>
 *
 * This plugin code is supposed to be used and distributed primarily
 * under GPL v2 or later, in order to follow the license of libsamplerate.
 * However, if you already own a commercial license to use libsamplerate
 * for dynamic linking, this plugin code can be used and distributed also
 * under LGPL v2.1 or later.

So it seems like rate_samplerate.c is licensed as GPLv2 in order to be
consistent with libsamplerate.  But in 2016, libsamplerate dropped its
commercial license requirement and was released with the 2-Clause BSD
license.   (See http://libsndfile.github.io/libsamplerate//license.html)

So I was wondering if the license for rate_samplerate.c can be updated to
remove the GPLv2, which means the COPYING.GPL file can also be removed from
the package?

Thank you!
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

--000000000000af9a4e0604a3da1a
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
HfRV1AAwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEICgpQfLW/FR1ec/k6xVj4sil
qpxOnhXNyDgF2I5mX9feMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8X
DTIzMDkwNTIyMDczNVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEW
MAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCjrFEWEm81MguQk3fTtu72GBV9EuPY8ZwUjF8zpKKG
ZX/B9MCTnLFBRhRf3/a/dcw5XBWL6CGjJD1RPeF1NFR/+afngktq3NGm3vHID3WJGR4wBhrrxk4h
+qoDVOlnl6ycN7uQbngHF+fEKQzNIcrsEVdbhWlVWjHmF1k1d0tOqLCYpvuSKMpVPInRs8YDphE/
tNADacBQ/z1tp64ybJB5Lot+WRFR2/MpyX+JkL+fhNfzMEg4MEXBv9YjJZR9nPKQ+6OanF7ACccz
Sbv3/DWY3Y6VmHwqWenZgQfl8ntKzszcA31bz/RFQ5NsUnyQY1PFzFZSQTKnXPbmeLDsjJkJ
--000000000000af9a4e0604a3da1a--
