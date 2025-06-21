Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEC8AE2B8E
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Jun 2025 21:36:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D396601B6;
	Sat, 21 Jun 2025 21:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D396601B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750534594;
	bh=gbwZBrIkt6mylPOp+fTj/QwZaWuwstY8/n2p3yeWSDo=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fNR0LL+VO4qM33JnWEXbYxNOxhEW4cESzh3QpudUpxVDK7b5n/uwwMlUA15AnHyy6
	 3tg/TgjkPZKt5SqUaIRLIN4WMUQbhfOSBFppti++6NoochEyPZwUCHYqF8Q+7i7ElL
	 UDkqqiKvnN4DIUMIz3wzMrtqHR/rkyJFDUqIB6XM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BAD3F80038; Sat, 21 Jun 2025 21:35:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2B0DF80038;
	Sat, 21 Jun 2025 21:35:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F31D3F80269; Sat, 21 Jun 2025 21:35:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DEE0F800D0
	for <alsa-devel@alsa-project.org>; Sat, 21 Jun 2025 21:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DEE0F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nck4tKDr
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-60707b740a6so4336764a12.0
        for <alsa-devel@alsa-project.org>;
 Sat, 21 Jun 2025 12:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750534552; x=1751139352;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i0xDlWUxn1krj+Tyg3dXcO7ABCXQ5WxWuPKmW6dRvmE=;
        b=nck4tKDrqpmrUxCJJr7aPGx2IH996dRbD+FqKq/vawdIZm+Mc5asm5tPm891DBHf3u
         jMrANqVO3eaTtbUhKBganbB9yELrFyX65LYqSGwrMUNF4rU/EvFsaR+fQ5TO4gXt5dAX
         op/JIo7fHK7Dy12StVPrScwq8R54JHP7tiNy/xQhKwCms2ZXMLQNvyE1ja/9WCWukuTJ
         /iJQtWeFkoHLlrauWyz2X/fsFgU3U4X3B0FqPBytDPXYHy87squ1wO9qWFX8Eaq0eBMo
         p6FG3TGK6vSNmM6oWXgdu5qyZhz/2j7T+0mLgeivrd36lzSIpExE6+ERY5WPcn/GYm5W
         Zrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750534552; x=1751139352;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i0xDlWUxn1krj+Tyg3dXcO7ABCXQ5WxWuPKmW6dRvmE=;
        b=wqzq9swebiOo0Rnlc06FJUcQ99RHzPBd6F3fF9xnuMhrawn50BMKWElno00GGzqzBd
         A0EPMfPr0OcaokrzBvTmo5UocGny2wNic18NNsmslYFUnQ7d9k34roe8KWwguYtSxWz0
         Pkfayhs4TSoY3uoUcpZ0B/a1ruw2vpm9chXdwgq9rtX4r7A9CqETsTYxbNwRBmOWMiuP
         n7BUc+bo7siq89Q0FWY6bF7xFJQwRwSgxz6/5EQEQddsu2j8Iwjf02EU4ym2++t2NoJc
         b0Rg9wN9N3n/BSLy7oK19Ne8LhdXf5Pn+JAFl3n0iJ0hlx3SfHkswlSGJuqRAa7zL/2k
         Mjcg==
X-Gm-Message-State: AOJu0YyLMjEp3SEkIIndkMtdt60g1eUvHRiyS1po84f1hQ3fwGKa5BYL
	MlQbpPR8bbLmhl0nhzKrQGFFmj8F/2HSF3LVFV/+eGJ3mL1eUlB5Nz+ZFjegRjhDCbSWv6DVT6W
	IvrFOLJXoAd8EfMaPm3r7x4UojAgrwNz3Ga5UeE4=
X-Gm-Gg: ASbGnctK6Fcb4tHPgcglTFEN10cxa2xvtsR8e91HspfVPOlNyHVDBK7ZogHMLIz3rDM
	a8FeoegK1AewO01I52gdGqZKTXK1fACij54oaWtLSZouNKPxBLeNM4dKZrnUfiuLDN1pIgx/1Cu
	6reOIpKNI8Wdjgs+0dFTitNR2iGMtv83XzGAporsi4MCu0vwoP9B/L4YyBY+/Rm862ebos8os2Z
	28=
X-Google-Smtp-Source: 
 AGHT+IFDdXyaJXnsgqz4IkkiphTX8Zgq33Jz8brJs5rnOY8HIYGPswXgqMlmE4WBLqCLz+Em/ik86Qg4H70yUQ80nNQ=
X-Received: by 2002:a05:6402:5c8:b0:609:b476:4d95 with SMTP id
 4fb4d7f45d1cf-60a1cf2fb78mr6149520a12.15.1750534551614; Sat, 21 Jun 2025
 12:35:51 -0700 (PDT)
MIME-Version: 1.0
From: Kaden Berger <kadenb816@gmail.com>
Date: Sat, 21 Jun 2025 14:35:40 -0500
X-Gm-Features: Ac12FXy7QoGaXIC1QvAHoRKC5AzoDwNamwBsXthc1ZeO0iffhYNQymg0AjiYpDw
Message-ID: 
 <CAPgmYfAvGQHP5VVb7d+Xsh7Mx4OopRJtiL-TRcp+kb0UHrmK8A@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: add fixup for HP Spectre x360 14t-ea100
 (ALC245)
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de
Message-ID-Hash: 3CHCAISHNWFGZR2ON2GSPFPOEGJP6LEQ
X-Message-ID-Hash: 3CHCAISHNWFGZR2ON2GSPFPOEGJP6LEQ
X-MailFrom: kadenb816@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CHCAISHNWFGZR2ON2GSPFPOEGJP6LEQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhpcyBwYXRjaCBhZGRzIGEgcXVpcmsgdG8gZW5hYmxlIHByb3BlciBzcGVha2VyIG91dHB1dCBv
biB0aGUgSFAgU3BlY3RyZQ0KeDM2MCAxNHQtZWExMDAgd2l0aCB0aGUgUmVhbHRlayBBTEMyNDUg
Y29kZS4NCg0KU0lnbmVkLW9mZi1ieTogS2FkZW4gQmVyZ2VyIDxrYWRlbmI4MTZAZ21haWwuY29t
Pg0KDQpkaWZmIC11cmEgbGludXgtNi4xNS4xLm9yaWcvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFs
dGVrLmMNCmxpbnV4LTYuMTUuMS5uZXcvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMNCi0t
LSBsaW51eC02LjE1LjEub3JpZy9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyAyMDI1LTA2
LTA5DQowODoyMTowNy4xNzgxODM1MjQgLTA1MDANCisrKyBsaW51eC02LjE1LjEubmV3L3NvdW5k
L3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIDIwMjUtMDYtMDkNCjA4OjI2OjE2Ljg1OTQ4NjA2MiAt
MDUwMA0KQEAgLTEwNzkyLDYgKzEwNzkzLDcgQEANCiAgU05EX1BDSV9RVUlSSygweDEwM2MsIDB4
OGJlOSwgIkhQIEVudnkgMTUiLCBBTEMyODdfRklYVVBfQ1MzNUw0MV9JMkNfMiksDQogIFNORF9Q
Q0lfUVVJUksoMHgxMDNjLCAweDhiZjAsICJIUCIsIEFMQzIzNl9GSVhVUF9IUF9HUElPX0xFRCks
DQogIFNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDhjMTUsICJIUCBTcGVjdHJlIHgzNjAgMi1pbi0x
IExhcHRvcCAxNC1ldTB4eHgiLA0KQUxDMjQ1X0ZJWFVQX0hQX1NQRUNUUkVfWDM2MF9FVTBYWFgp
LA0KKyBTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4OWRhLCAiSFAgU3BlY3RyZSB4MzYwIDE0dC1l
YTEwMCIsDQpBTEMyNDVfRklYVVBfSFBfU1BFQ1RSRV9YMzYwX0VVMFhYWCksDQogIFNORF9QQ0lf
UVVJUksoMHgxMDNjLCAweDhjMTYsICJIUCBTcGVjdHJlIHgzNjAgMi1pbi0xIExhcHRvcCAxNi1h
YTB4eHgiLA0KQUxDMjQ1X0ZJWFVQX0hQX1NQRUNUUkVfWDM2MF8xNl9BQTBYWFgpLA0KICBTTkRf
UENJX1FVSVJLKDB4MTAzYywgMHg4YzE3LCAiSFAgU3BlY3RyZSAxNiIsDQpBTEMyODdfRklYVVBf
Q1MzNUw0MV9JMkNfMiksDQogIFNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDhjMjEsICJIUCBQYXZp
bGlvbiBQbHVzIExhcHRvcCAxNC1leTBYWFgiLA0KQUxDMjQ1X0ZJWFVQX0hQX1gzNjBfTVVURV9M
RURTKSwNCg==
