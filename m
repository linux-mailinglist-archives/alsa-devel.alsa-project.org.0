Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A26ACEB0C
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jun 2025 09:45:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B691460210;
	Thu,  5 Jun 2025 09:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B691460210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749109503;
	bh=Co8p/d+IU9AOotXvsogoX7fYbCzHweskajQfFk5mbv8=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Mc0WxDGxgAX89NMFWM8Xycf1kJ1yUFUulTSFJe3B8mWakjoZDX1ZnyrskzJI+EPkK
	 dnfeU3jVmIf2SZyg3r/MpIQnrcahMRo8XByYZw+NopV6eTnr2pe2uZmvaHfssYZyZF
	 umBco+f668hkey309Eynk/AaxgJJcjoB15g6BEC0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A190F805C8; Thu,  5 Jun 2025 09:43:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3690F805C8;
	Thu,  5 Jun 2025 09:43:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F2EFF80424; Tue,  3 Jun 2025 21:03:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE886F8026D
	for <alsa-devel@alsa-project.org>; Tue,  3 Jun 2025 21:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE886F8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kMX1hmfM
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-32ac42bb4e4so7679971fa.0
        for <alsa-devel@alsa-project.org>;
 Tue, 03 Jun 2025 12:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748977423; x=1749582223;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xvb30OSr+rxQ9X095dBsQScasdzQSLVTpZY6b2oM/7A=;
        b=kMX1hmfMNQVXHgwpUlc7ocexj2gLKMImFUUm8pBlPgBOPXu+9SMQqrbgdaMYDOZC6j
         rc5Wntfj1gcEGSCKZbfy+i8CX28+o65TEQ0Ja8lfVP9ggWQNoh7okrFSMi89cCh+e2Vt
         xYR8krs+p9GmvWmoO1gACNrsYbOjxgxdIR004feGVR9+Lx+aToKrS376wn7BlvUybbvl
         eTeBuvMNDeH65zBYRz9KwnQEzvf4p1spqcEwxVnf1XmYAravsC676B+U6cr+EXqjNZ9W
         9m/oR8eSuHdUvQ62MaOMC0NEnjK5JZrW9wVL9+VFlLVnqFYdMTkI8U2ut2gAJkgTiE8M
         gz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748977423; x=1749582223;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xvb30OSr+rxQ9X095dBsQScasdzQSLVTpZY6b2oM/7A=;
        b=kL4zfwsfd8JeODbaxD5wHcITIbo7F/6VblYyrf4bZuGVmXDoInfHBSW/Zygp11RhcM
         mYPU/EOvMifWNXWNAU4wOoR1MLGKVXNblqYX9bmXFBaL8XifZk+D3FshCgZwAZMBFBwo
         N/9kA6q1u2pnCOsgTpTjN9gNhx9+y+0zyqHh2QAULgAjTCues4YYB322sic7ikBYZBVz
         BFM5hQ8IUNPS1ZmmeWbGqYAuSDN8ctaVqVmnMakSCj6RwCaimTodZhrygmBkqzaoDzrV
         eks9Pd4LiNLuwrC/sjwUj8G7Sp9KOUcaok7qwwwK9Fp+76KO0DsHQd0mOvrWIJXsdbON
         mpng==
X-Gm-Message-State: AOJu0YwdKnWOE/Hmwi1Mivhj8Aigx63YZNPJ8yJCElIbi9OkUjERJBQo
	eqoyAa1QRPlw+qlAwG7DzP7rj7XXLBeucC6XUniNFHjGGHV1wYqJuFUnhbcQO+pvAUDnd/2TxeA
	8NkjuNeBQ+kflZXP7d/YRF0CZLuUZbzzZR0dOI4/U7Q==
X-Gm-Gg: ASbGnctwXV0a/2Mm4lsMnUlHQhuRjvGjJu63sWulp3sVHcnc2SRUdX2EGxNEclue3ig
	yI2jr8G2r1n3RgTwshPVLH1W/A+7yKMzPo9RcHlxIv8j5QNa8a8uANvoTzeauBdd1H/OC2TQQPb
	f3++zN00/ZZgRYsSRE3dkj2V7L5gE7VXk=
X-Google-Smtp-Source: 
 AGHT+IHzoT8nVPyNlKCeWVLcyTifpv0kslPPlIiE6Nq9GqInq3qfKwuMLSPE4QCXM6s2Z+xA3hZRquFlxG1fanfQMxU=
X-Received: by 2002:a2e:be25:0:b0:30d:626e:d03a with SMTP id
 38308e7fff4ca-32ac71debf3mr252441fa.34.1748977421691; Tue, 03 Jun 2025
 12:03:41 -0700 (PDT)
MIME-Version: 1.0
From: Anas Muhamad Pauzi <anasmpauzi@gmail.com>
Date: Tue, 3 Jun 2025 20:03:28 +0100
X-Gm-Features: AX0GCFsRNrpYbvJk3BQseADgQluXGuW4SV7C_AOBORInyuv0ZTtnea6kbYgNCdM
Message-ID: 
 <CAEj-Z=nsFFygwGnmb+ZeDu0A0uH2o_artY5fQwk06VZiWv6V8A@mail.gmail.com>
Subject: [Bug] Internal microphone not working on ASUS VivoBook (ALC256,
 Ubuntu 24.04+, kernel 6.x)
To: alsa-devel@alsa-project.org
X-MailFrom: anasmpauzi@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BBGJAH7JW2YFLAAAFIH27QGH5YYZDYV2
X-Message-ID-Hash: BBGJAH7JW2YFLAAAFIH27QGH5YYZDYV2
X-Mailman-Approved-At: Thu, 05 Jun 2025 07:43:40 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBGJAH7JW2YFLAAAFIH27QGH5YYZDYV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RGVhciBBTFNBIERldmVsb3BlcnMsDQoNCkknbSB3cml0aW5nIHRvIHJlcG9ydCBhbiBpc3N1ZSBh
ZmZlY3RpbmcgdGhlIGludGVybmFsIG1pY3JvcGhvbmUgb24gdGhlDQpBU1VTIFZpdm9Cb29rICgx
MXRoIEdlbiBJbnRlbCBpNywgYXVkaW8gY29kZWM6IFJlYWx0ZWsgQUxDMjU2KSB1bmRlciBVYnVu
dHUNCjI0LjA0IExUUyB1c2luZyBrZXJuZWwgNi54Lg0KDQpTdW1tYXJ5Og0KLSBJbnRlcm5hbCBt
aWNyb3Bob25lIGlzIGRldGVjdGVkIGJ5IEFMU0EgYW5kIFBpcGVXaXJlIChpbnB1dCBkZXZpY2Ug
aXMNCmxpc3RlZCwgUlVOTklORyBzdGF0ZSkNCi0gVm9sdW1lIGFuZCBib29zdCBsZXZlbHMgYXJl
IGF0IDEwMCUsIG5vdCBtdXRlZA0KLSBIb3dldmVyLCBubyBzb3VuZCBpcyByZWNvcmRlZCDigJQg
bWljIGlzIGNvbXBsZXRlbHkgc2lsZW50DQotIEV4dGVybmFsIFVTQiBtaWNyb3Bob25lcyB3b3Jr
IGZpbmUgb24gdGhlIHNhbWUgc3lzdGVtDQoNCldoYXQgSeKAmXZlIHRlc3RlZDoNCi0gVWJ1bnR1
IDI0LjA0IGRlZmF1bHQga2VybmVsIDYuMTEg4oaSIGludGVybmFsIG1pYyBub3Qgd29ya2luZw0K
LSBNYWlubGluZSBrZXJuZWwgNi4xNSB2aWEgbWFpbmxpbmUgdG9vbCDihpIgc3RpbGwgbm90IHdv
cmtpbmcNCi0gVWJ1bnR1IDIwLjA0IChrZXJuZWwgNS54LCBsaWtlbHkgNS40IG9yIDUuMTUgSFdF
KSDihpIgKippbnRlcm5hbCBtaWMgd2FzDQp3b3JraW5nIGZpbmUqKg0KDQpUaGlzIHN1Z2dlc3Rz
IGEgcmVncmVzc2lvbiBvciBwaW4gY29uZmlndXJhdGlvbiBpc3N1ZSBpbiByZWNlbnQga2VybmVs
cw0KYWZmZWN0aW5nIEFMQzI1NiBvbiB0aGlzIGxhcHRvcC4NCg0KSGVyZSBpcyB0aGUgZnVsbCBB
TFNBIGluZm8gZHVtcDoNCmh0dHBzOi8vYWxzYS1wcm9qZWN0Lm9yZy9kYi8/Zj02ZDY0NjZiYTkw
M2IyZTA4YjM1MTA0NjU3MWUwZmM1NGRkZDEzOTgxDQoNCkFuZCBoZXJlIGlzIHRoZSByZWxhdGVk
IExhdW5jaHBhZCBidWcgcmVwb3J0Og0KaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1
Lytzb3VyY2UvYWxzYS1kcml2ZXIvK2J1Zy8yMTEyMzMwDQoNCknigJlkIGJlIGhhcHB5IHRvIHRl
c3QgYSBwYXRjaCBvciBwcm92aWRlIGFkZGl0aW9uYWwgbG9ncyBpZiBuZWVkZWQuDQoNCk1hbnkg
dGhhbmtzIGZvciB5b3VyIHN1cHBvcnQgYW5kIHlvdXIgd29yayBvbiBBTFNBIQ0KDQpCZXN0IHJl
Z2FyZHMsDQoqQW5hcyBNdWhhbWFkIFBhdXppICAqDQpBU1VTIFZpdm9Cb29rICgxMXRoIEdlbiBJ
bnRlbCBDb3JlIGk3LCBSZWFsdGVrIEFMQzI1NikNCg==
