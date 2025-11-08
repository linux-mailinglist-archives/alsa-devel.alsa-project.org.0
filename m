Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A696FC4759D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:51:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D8B260384;
	Mon, 10 Nov 2025 15:51:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D8B260384
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762786299;
	bh=WXp+t1SQJvUEAyNT6d0/mfZe9itgiRZmO0Gc/OuI4AU=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NZsjHoSmv+E6qTKPESBZZJR01JNKkVkRbKEkTCpDkBVWrandCvfYgVboJhAyn/Yxn
	 GK66tIz2SbkCXcP4VYy5G3gOnUNkaJS2bB7u+DvnlNSL0o+7DmK8S2XLKZzJl2wwy5
	 d1xYFFk9DiZNczGoH9HUKxyRFUauuxr0cRzZPRmQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C711F89896; Mon, 10 Nov 2025 15:43:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D94B5F89898;
	Mon, 10 Nov 2025 15:43:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFFA6F804B2; Sat,  8 Nov 2025 10:17:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_20,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,HTML_MESSAGE,
	NML_ADSP_CUSTOM_MED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BA08F80100
	for <alsa-devel@alsa-project.org>; Sat,  8 Nov 2025 10:17:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BA08F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LbF5cQVI
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b67684e2904so953272a12.2
        for <alsa-devel@alsa-project.org>;
 Sat, 08 Nov 2025 01:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762593454; x=1763198254;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BF1eFDBnyhFVH7OymT/t34FosRgtQVJAURpVDvc5CWE=;
        b=LbF5cQVIh7DXR1QfKlCNF7tOFfcX2nMG6FQ8ayzEvzEDrCUNxRpbZvbGLxHX6HLwOQ
         BnFMEwKDhGQU9aovFClhJ9SvjnyBUC/NpcysACIUmKqf+Hdu3LU9wuMlsi9vdX3pnC/Z
         t2XYDWVVDS1z9juHD7S2+weBwO1AI3bJ+JBCsOGMBlkdXC4daMSgCWkMBMkQ2EEQeNPJ
         ESWvC3KjfxbnzPRl/ggDYTaq2l92oagceZXD/sjT53PTajfOjN2GiV6vpnTZO/UAS/fT
         lX/wVWBHMijdz3GtvMnF0M1LF8z6nIIxprkkrBOwWnc9nMoiHIKXLzDoYV6qBGfUx6Pu
         IxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762593454; x=1763198254;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BF1eFDBnyhFVH7OymT/t34FosRgtQVJAURpVDvc5CWE=;
        b=Y0e6TgQEHz/iYokHI8sCKOl3KZGbeD7Cl6tvAxIe6i+7Uh/YFX9FdUlyPSLJyxbOkU
         wV5ocLNpAyiRtYtSzxdkUqWEUL1i+BWgeLJAGzzKTYu0LsszOCDlH/ktjAuuCCujakzZ
         zAutQiCUSPzoL5HyEGZCYi8vVBiRG+zvJgKSqzGut04aeyu+ljXLNrGNUb8ZMZs4aK2D
         sHiPOQgLZNgsCil/eu3uFdwnetXDKJS8Kwn5QgMMqY52iOZC8Aj7mYQ+5stLKL6CALBO
         5f0/M6oXGlmSGv/hKrxq1lQipxqTD8FfIQfPFaUhTVGYnvQFnnATigZrt39HucyxAV9d
         8ZQg==
X-Gm-Message-State: AOJu0YxMuFQHk8jFhGNQZTek12+NebissapvvwmmyTKOluGsI7huc8PH
	s1PZ6E9sOxbOEJM5JGWa/YdP4HFvfxy21Y/GbYS4LO029bQy5qyfN/Kh9uZ8wlRkZTKiu36bwNh
	hBdyczchIOXEvAy0k6h2noEpNW2qfEkSiP8wr
X-Gm-Gg: ASbGncu707K6LBdzjZj/fdm6teX3Ds97vO0IJSP/jKCxZ4yMvb8yPtfIzy29InqmX0w
	hUehGamD87w87+PquPlH2DCuYgwFbsR0TNDmFWFfbHGRJtEd0Y3YJFevS90qm3lNNk4Z9yDzETL
	PBteJsfN9F1W9weTjXmepjTps91AgNt8A1ZoxpPFKB+Fke8Pl6LuZMmcj31A+cR9+RltaJRZ4fE
	yGuO8AXHRf7YlylorS49svaxo8J/055BQQkn3EqXmvhzqYMcjRiAUwzSKI3YKsspSOeVjE=
X-Google-Smtp-Source: 
 AGHT+IGQYkfLNVfjv55WHX8RRIHyluAzPrAIC+XpZvzzjuG5atvev5X8pS1n1eRUZP0gTKB3ktMGRYGwEwkDAfURBNY=
X-Received: by 2002:a17:90a:e710:b0:341:8bdd:5cf3 with SMTP id
 98e67ed59e1d1-3436cb739d3mr2632876a91.7.1762593453568; Sat, 08 Nov 2025
 01:17:33 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Marco_Aurelio_Osorio_De_Le=C3=B3n?= <osoriodeleon@gmail.com>
Date: Sat, 8 Nov 2025 10:17:22 +0100
X-Gm-Features: AWmQ_blvYBCqfyOCquYr4zeq1DlMWBUnpBU5N8hZNsVQr1NhnGxR0Hm07vb5fVg
Message-ID: 
 <CAEKXz6tLo5QnPCy+8JE_XA+_6dnLO2rHk89eUd=Dwf4vOb_VVw@mail.gmail.com>
Subject: [REGRESSION?] No sound from internal speakers on Teclast T.BOLT with
 Realtek ALC256
To: alsa-devel@alsa-project.org
X-MailFrom: osoriodeleon@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6E2JFHXGE67QZTS4VC3T5YWLLKOGWF4X
X-Message-ID-Hash: 6E2JFHXGE67QZTS4VC3T5YWLLKOGWF4X
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:42:55 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6E2JFHXGE67QZTS4VC3T5YWLLKOGWF4X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

U3ViamVjdDogW1JFR1JFU1NJT04/XSBObyBzb3VuZCBmcm9tIGludGVybmFsIHNwZWFrZXJzIG9u
IFRlY2xhc3QgVC5CT0xUDQp3aXRoIFJlYWx0ZWsgQUxDMjU2DQoNCkhlbGxvIGV2ZXJ5b25lLA0K
DQpJIGhhdmUgYSBUZWNsYXN0IFQuQk9MVCBsYXB0b3Agd2l0aCBhIFJlYWx0ZWsgQUxDMjU2IGF1
ZGlvIGNvZGVjLg0KDQpUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBzb3VuZCBmcm9tIHRoZSBpbnRl
cm5hbCBzcGVha2VycyBpc24ndCB3b3JraW5nLiBUaGUNCmF1ZGlvIHdvcmtzIHBlcmZlY3RseSB0
aHJvdWdoIGhlYWRwaG9uZXMsIGJ1dCB3aGVuIEkgZGlzY29ubmVjdCB0aGVtLA0KdGhlcmUncyBu
byBzb3VuZCBmcm9tIHRoZSBzcGVha2Vycy4NCg0KSW4gdGhlIGdyYXBoaWNhbCBpbnRlcmZhY2Ug
KFB1bHNlQXVkaW8vUGlwZVdpcmUpLCB0aGUgdm9sdW1lIGJhciBtb3ZlcyBhcw0KaWYgdGhlIHNv
dW5kIHdlcmUgcGxheWluZyBjb3JyZWN0bHksIGJ1dCB0aGVyZSdzIG5vIHBoeXNpY2FsIGF1ZGlv
IG91dHB1dC4NCg0KSSd2ZSB0cmllZCBudW1lcm91cyBzb2x1dGlvbnMgd2l0aG91dCBzdWNjZXNz
Og0KDQotIEkgY2hlY2tlZCBgYWxzYW1peGVyYCB0byBlbnN1cmUgbm90aGluZyBpcyBtdXRlZCBh
bmQgdGhhdCAiQXV0by1NdXRlIiBpcw0KZW5hYmxlZC4NCg0KLSAtIFRlc3RlZCBtdWx0aXBsZSBg
bW9kZWxgIHBhcmFtZXRlcnMgZm9yIGBzbmQtaGRhLWludGVsYCBpbg0KYC9ldGMvbW9kcHJvYmUu
ZC9hbHNhLWJhc2UuY29uZmAgYW5kIGFsc28gYXMgYSBrZXJuZWwgcGFyYW1ldGVyIGluIEdSVUIN
CihkZWxsLXhwcy0xMy05MzYwLCBkZWxsLWhlYWRzZXQtbXVsdGksIGxlbm92by1sZWdpb24tMTVp
bWhnMDUsDQphbGMyNTUtZGVsbDEsIGV0Yy4pLg0KDQotIFRyaWVkIHJlY29uZmlndXJpbmcgdGhl
IHBpbnMgd2l0aCBgaGRhamFja3JldGFza2AsIGZvcmNpbmcgcGluIDB4MTQgdG8NCiJJbnRlcm5h
bCBTcGVha2VyIChMRkUpIiBhbmQgdGVzdGluZyBkaWZmZXJlbnQgY29uZmlndXJhdGlvbnMgZm9y
IHBpbiAweDIxLg0KDQotIEF0dGVtcHRlZCBzZXZlcmFsIGBoZGEtdmVyYmAgY29tbWFuZHMgdG8g
Zm9yY2UgdGhlIGNvZGVjIHN0YXRlLCBib3RoIHdpdGgNCmBTRVRfQ09FRl9EQVRBYCBhbmQgYFNF
VF9QSU5fV0lER0VUX0NPTlRST0xgLCBidXQgd2l0aG91dCBzdWNjZXNzLg0KDQpUaGUgaGFyZHdh
cmUgaXMgd29ya2luZyBjb3JyZWN0bHksIGFzIHRoZSBzcGVha2VycyBmdW5jdGlvbiB3aXRob3V0
DQpwcm9ibGVtcyBvbiBhIFdpbmRvd3MgMTEgaW5zdGFsbGF0aW9uIG9uIHRoZSBzYW1lIGxhcHRv
cC4gVGhpcyBhcHBlYXJzIHRvDQpiZSBhIGNvbmZpZ3VyYXRpb24gaXNzdWUgd2l0aCB0aGUgZ2Vu
ZXJpYyBMaW51eCBkcml2ZXIgZm9yIHRoaXMgc3BlY2lmaWMNCmhhcmR3YXJlLg0KDQpJJ3ZlIHN3
aXRjaGVkIGZyb20gdGhlIHN0YW5kYXJkIFVidW50dSAyNS4xMCBrZXJuZWwgdG8gTGlxdW9yaXgs
IGJ1dA0KdGhlcmUncyBubyBjaGFuZ2UuDQpMaW51eCBYWFhYWCA2LjE3LjctMS1saXF1b3JpeC1h
bWQ2NCAjMSBaRU4gU01QIFBSRUVNUFRfRFlOQU1JQyBsaXF1b3JpeA0KNi4xNy03dWJ1bnR1MX5x
dWVzdGluZyAoMjAyNSB4ODZfNjQgR05VL0xpbnV4KQ0KDQpJIGdlbmVyYXRlZCBhIGZ1bGwgcmVw
b3J0IHVzaW5nIGBhbHNhLWluZm8uc2hgLiBUaGUgVVJMIGlzOg0KDQpodHRwczovL2Fsc2EtcHJv
amVjdC5vcmcvZGIvP2Y9OTYxNzZhNWFiY2M5MDc4MGJiYmE0YTY3ZGFjOTQ2YmU2Yjc5M2MyYw0K
DQpBbnkgaWRlYXMgb24gd2hhdCBlbHNlIEkgY291bGQgdHJ5LCBvciBpZiBpdCBtaWdodCBiZSBh
IGJ1ZyB0aGF0IHJlcXVpcmVzIGENCnNwZWNpZmljIGZpeCBmb3IgdGhpcyBsYXB0b3A/DQoNClRo
YW5rIHlvdSBmb3IgeW91ciB0aW1lIGFuZCBlZmZvcnQuDQoNClJlZ2FyZHMuDQo=
