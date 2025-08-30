Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3438B4F4D5
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Sep 2025 14:11:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4786C6023F;
	Tue,  9 Sep 2025 14:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4786C6023F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757419908;
	bh=xDgRCiKniaebTiq7rNP8KOVfb8jibs9ht16PEIBWK3A=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=X24RPRMoHsYvgC2gaz7pZRTY+PyAs0xuVDlb0LtJOmhZNB4lumkDd7iJkpmsD261q
	 SJdPykOEuiPtUjzAuAg69VNLRhVUpxSeqWyA/FpMFEz6mGuCOtdsGm9p105p8loXKa
	 ji05c6UQ3Je6L7vzEdk+YP0cQLawB+q9N+nNTlGk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 571ACF8060B; Tue,  9 Sep 2025 14:10:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2710AF80619;
	Tue,  9 Sep 2025 14:10:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCEA3F8027B; Sat, 30 Aug 2025 09:01:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7438FF80134
	for <alsa-devel@alsa-project.org>; Sat, 30 Aug 2025 09:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7438FF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cfGxz7mg
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3280264a6e8so709168a91.3
        for <alsa-devel@alsa-project.org>;
 Sat, 30 Aug 2025 00:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756537310; x=1757142110;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DUEw253wvzPX1uxeJuCosw4/ZlysOTpWbyGZ+cXPuaU=;
        b=cfGxz7mgEqOTUO4LM3k4YL8pGOLFLsNdffyl1dWvqCHmuinzGr0sppxd5YlYB8xYuU
         AbvhaD/cjQldoUP/uXLqfjXN/6RDBIfia9T5grBFfnzW1XrvdG2gi3DPnKzWBrXgFQBM
         kvQqwgda3FtPHDukvL1rJ2ssjROl5ivieAUxSGCSeynGNbTlhje0V4vLunM2GVx0km9i
         M+/vkOK662QvFEGtMifdSXmSpD6lCcfNQo85rlg8klHLXl1+dC8UdvhNn/rDSK3QST0v
         oeeEmIw6KVkBkISFjluOV38BhmjZ3kug6jXhEkuwFZCtytGIWfka/nsyip62ihYvr9Fk
         q7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756537310; x=1757142110;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DUEw253wvzPX1uxeJuCosw4/ZlysOTpWbyGZ+cXPuaU=;
        b=snJUZnnhiNw0pZCGYO7fhGP21OfYN4LHR06iSC/IoGIkt4gaIEOhWxAXFx2lkyEo3I
         H3TWyVQWpjglchCM/IOKuWC3j//XLYZl+V8yFZaJaradTppY7tQ+k+BJJdv6eQckJqHO
         55nQSkz+CMOKHvSinC8SHP/1Di9DtfJnr5Qcaju/C1emFNOZybaGOoTPEkUlWEhHtsRd
         ZY6A7ZS7sVfcRx2PIZcNL/p1Bn+83XJBaNIXcGuWtmnNqbcG+n6De0sIT2koyXctyIrZ
         swKftlkXuKnx5r/E5FP89Pd47FCBwLGJaxsfRvh3K1DMdFVg1aa60n+2OosZXD5+XCVO
         hvYg==
X-Gm-Message-State: AOJu0YwqYR9HNgBbu+SOJNJAtEQO8xrmcpDaX0DTQ/0+SjXDTsK+MI+G
	kB9WQpieg/DJFXeQ8fulUHPrHmnVyf1cspaqgKNxM8kOWGu3qda4rPwAbOgkiGpnT/Lv3Gcx0Oc
	+DylpgeKjvSdIYljP7PRfSDjX30XxKgT6pj7Gpm1XcQ==
X-Gm-Gg: ASbGncvxG8iVH9DOstWNrkOkEWgRg5zczBNpZK0oG34YoArp8KLJdY/S6bhHrrbuVcY
	xN0XgR3nvy/gwEwkPVjRbhbNOAownIinKYfCZVTzKrjjscy0v8UPwRboPNnXSlMpeULDVIoEtDA
	O459Vz2kvr2c5+JBmwu1d73ylsDZ0tPLkcecNT4+oZXXuWxBy0SDsz0t1uyXDsB9fw57FOAes8C
	45ejQ==
X-Google-Smtp-Source: 
 AGHT+IFUaUfMymi+z9MefJSuWIWIaETyvna8gbxVIm+CCtVJ60X3M+WhiKt63Ar8ng45dqUdtu0MyrZlzxJrh2maw/c=
X-Received: by 2002:a17:90b:48c3:b0:327:f216:4360 with SMTP id
 98e67ed59e1d1-3281541434dmr1827045a91.8.1756537309170; Sat, 30 Aug 2025
 00:01:49 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?0JjQu9GM0Y8g0JrRg9C30L3QtdGG0L7Qsg==?=
 <zloy.technic@gmail.com>
Date: Sat, 30 Aug 2025 12:01:37 +0500
X-Gm-Features: Ac12FXzM802hjTT5zj5Co3zgURFLwswrxTbNGdbKTnB-cQuCfIcAd7URRROyXBQ
Message-ID: 
 <CAAnsHS6ve4+Zx5s63vCBtwUPF=FTHhTxPSjJTBcj6PkC=oyLYQ@mail.gmail.com>
Subject: 
 =?UTF-8?Q?=5BBUG=5D_ALSA_FireWire=3A_poll_timeout_causes_JACK_to_sto?=
	=?UTF-8?Q?p_=286=2E10_=E2=80=93_6=2E17=2Drc2=29?=
To: alsa-devel@alsa-project.org
X-MailFrom: zloy.technic@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LMGC6GI646TNXZGEQNE4WAFXROQALLZK
X-Message-ID-Hash: LMGC6GI646TNXZGEQNE4WAFXROQALLZK
X-Mailman-Approved-At: Tue, 09 Sep 2025 12:10:17 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LMGC6GI646TNXZGEQNE4WAFXROQALLZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCkhlbGxvIEFMU0EgZGV2ZWxvcGVycywN
Cg0KSSB3b3VsZCBsaWtlIHRvIHJlcG9ydCBhIHJlcHJvZHVjaWJsZSBpc3N1ZSB3aXRoICpzbmQt
ZmlyZWZhY2UqIG9uIExpbnV4DQprZXJuZWxzIDYuMTAgdGhyb3VnaCA2LjE3LXJjMi4NCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KU3lzdGVtIEluZm9ybWF0aW9uDQoNCiAgIC0NCg0K
ICAgKktlcm5lbCB2ZXJzaW9ucyB0ZXN0ZWQ6KiA2LjEwIOKGkiA2LjE3LXJjMg0KICAgLQ0KDQog
ICAqQXVkaW8gaW50ZXJmYWNlOiogUk1FIEZpcmVmYWNlIDgwMA0KICAgLQ0KDQogICAqRHJpdmVy
IGluIHVzZToqIHNuZC1maXJlZmFjZQ0KICAgLQ0KDQogICAqQXVkaW8gc2VydmVyOiogSkFDSyAo
dGVzdGVkIHdpdGggamFja2QgYW5kIFFKYWNrQ3RsKQ0KICAgLQ0KDQogICAqRGlzdHJpYnV0aW9u
OiogRGViaWFuIDEyDQogICAtDQoNCiAgICpLZXJuZWwgY29uZmlnOiogQUxTQSBGaXJlV2lyZSBk
cml2ZXJzIGVuYWJsZWQsIG5vIEZGQURPIGluIHVzZQ0KICAgLSAqQ2hpcCAxMzk0OiAqVGV4YXMg
SW5zdHJ1bWV0cw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClN0ZXBzIHRvIFJl
cHJvZHVjZQ0KDQogICAxLg0KDQogICBCb290IGtlcm5lbCA2LjEwIOKApiA2LjE3LXJjMiB3aXRo
IHNuZC1maXJlZmFjZSBsb2FkZWQuDQogICAyLg0KDQogICBTdGFydCBKQUNLIHdpdGggQUxTQSBi
YWNrZW5kLCBmb3IgZXhhbXBsZToNCg0KICAgamFja2QgLWQgYWxzYSAtZCBodzpGaXJlZmFjZSAt
cCA2NCAtbiAzDQoNCiAgIDMuIFVzZSB0aGUgc3lzdGVtIG5vcm1hbGx5IOKAlCBkdXJpbmcgcGxh
eWJhY2ssIHJlY29yZGluZywgb3IgZXZlbiB3aGVuDQogICBpZGxlLiBUaGUgaXNzdWUgbWF5IG9j
Y3VyIGF0IGFueSB0aW1lIHdpdGhvdXQgYXBwYXJlbnQgZXh0ZXJuYWwgY2F1c2UuDQoNCiAgIEFj
dHVhbCBCZWhhdmlvcg0KDQogICBBZnRlciBzb21lIGlkbGUgdGltZSwgQUxTQSBzdG9wcyByZXNw
b25kaW5nIGFuZCBKQUNLIHByaW50czoNCg0KICAgRVJST1I6IEFMU0E6IHBvbGwgdGltZSBvdXQs
IHBvbGxlZCBmb3IgLi4uIHVzZWNzDQogICBFUlJPUjogSmFja0F1ZGlvRHJpdmVyOjpQcm9jZXNz
QXN5bmM6IHJlYWQgZXJyb3IsIHN0b3BwaW5nLi4uDQoNCiAgIEpBQ0sgaW1tZWRpYXRlbHkgdGVy
bWluYXRlcy4gVGhlIEZpcmVmYWNlIDgwMCBkb2VzIG5vdCByZWNvdmVyIHVudGlsDQogICBKQUNL
IGlzIHJlc3RhcnRlZC4NCiAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KICAgRXhw
ZWN0ZWQgQmVoYXZpb3INCg0KICAgVGhlIEFMU0EgRmlyZVdpcmUgZHJpdmVyIHNob3VsZCBtYWlu
dGFpbiB0aGUgc3RyZWFtIGFuZCBhbGxvdyBKQUNLIHRvDQogICBjb250aW51ZSBydW5uaW5nIHdp
dGhvdXQgbWFudWFsIHJlc3RhcnQsIGV2ZW4gd2hlbiBpZGxlLg0KICAgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQogICBOb3Rlcw0KICAgNC4NCg0KICAgV2l0aCAqRkZBRE8qIGJhY2tl
bmQgKGphY2tkIC1kIGZpcmV3aXJlKSwgdGhlIHNhbWUgaGFyZHdhcmUgd29ya3MNCiAgIHJlbGlh
Ymx5IGFuZCBkb2VzIG5vdCBleGhpYml0IHRoaXMgaXNzdWUuDQogICA1Lg0KDQogICBUaGlzIHN1
Z2dlc3RzIHRoYXQgdGhlIHByb2JsZW0gbGllcyBpbiB0aGUgQUxTQSBGaXJlV2lyZSBzdHJlYW1p
bmcNCiAgIGVuZ2luZSByYXRoZXIgdGhhbiB0aGUgaGFyZHdhcmUgaXRzZWxmLg0KICAgNi4NCg0K
ICAgVGhlIHByb2JsZW0gaGFzIGJlZW4gcmVwcm9kdWNpYmxlIGFjcm9zcyBhbGwgdGVzdGVkIGtl
cm5lbHMgKHZhbmlsYSwgcnQsDQogICBsaXF1b3JpeCkgZnJvbSAqNi4xMCB0aHJvdWdoIDYuMTct
cmMyKi4NCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpSZXF1ZXN0DQoNCkNvdWxk
IHlvdSBwbGVhc2UgY29uZmlybSBpZiB0aGlzIGlzc3VlIGlzIGtub3duPw0KSXMgdGhlcmUgYW55
IG9uZ29pbmcgd29yayBvbiB0aGUgQUxTQSBGaXJlV2lyZSBzdHJlYW1pbmcgZW5naW5lICgNCnNu
ZC1maXJlZmFjZSkgdG8gYWRkcmVzcyB0aGVzZSBwb2xsIHRpbWVvdXQgY29uZGl0aW9ucz8NCg0K
SSBjYW4gcHJvdmlkZSBhZGRpdGlvbmFsIGxvZ3MgKGRtZXNnLCBqb3VybmFsY3RsKSBvciB0ZXN0
IHBhdGNoZXMgaWYgbmVlZGVkLg0KDQpUaGFuayB5b3UsDQoNCklseWEgS3V6bmV0c292Lg0K
