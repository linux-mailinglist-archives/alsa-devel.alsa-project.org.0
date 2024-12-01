Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC469DF4DA
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Dec 2024 07:00:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D41415FB;
	Sun,  1 Dec 2024 07:00:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D41415FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733032843;
	bh=jyOV/MtYhYi0j3/Jsu8H5Li32S/80cWAD/jonikYo9c=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=C5GpU20Gz+W9cEFaL32udUXtV8yF2kZoTV+1CJC5vbmTvDVrkGaIO1hnIj9LMLCrF
	 mDdC9zmtkPcyIXlbmkRd2xqFLNKlslm3NpAEJ9Y2zQdFbQykTQU4Ix8D94ZAo+JsJV
	 878jMFktJF7ieE5HMMUM7j9RxymoqI5s3XW3cA9w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F7ACF80448; Sun,  1 Dec 2024 07:00:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79398F805C0;
	Sun,  1 Dec 2024 07:00:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD8F8F8032D; Sun,  1 Dec 2024 06:59:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31263F801C0
	for <alsa-devel@alsa-project.org>; Sun,  1 Dec 2024 06:59:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31263F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=glyphic.com header.i=@glyphic.com header.a=rsa-sha256
 header.s=google header.b=TUYinnh2
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53df63230d0so3644576e87.3
        for <alsa-devel@alsa-project.org>;
 Sat, 30 Nov 2024 21:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=glyphic.com; s=google; t=1733032727; x=1733637527;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Eevr/6uIURUC9dN1eC+ZYqQRhPgBD///1XsUHeZOE/Y=;
        b=TUYinnh2ENfhkXYt4ph0HRnMDo/Gks0vlsNCTnDdpaVcg5LahdXGjPAYFO/FlfZ9fK
         0DBuI2baspFhmZMM7W5a+Qq9Ox/R6kyXgbJeMV3R6NqzrJ7fpZo5GeMxOgAJUeQdhRr1
         ZGpvIq2vFuGYW/IfHSKJGJfpkK5k/9e56iK7PQ8IyzPFMztx8BDu0fj30XisqIi//ini
         Y7yRAhpBxDyNoW7aZkz+z9faTTjjIoB2E/mRl656t6HpDp7ogLGaw5yEP6dHFNnZkEDb
         Z2NW7sfly3SQ69iXmHL0JY6IqmmKZJkALHs3CixRd/ZO6CPkYvDU/uMfVRMLAoWTNHzo
         nk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733032727; x=1733637527;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eevr/6uIURUC9dN1eC+ZYqQRhPgBD///1XsUHeZOE/Y=;
        b=Xqxq9HB6NjWYzZLbmIl8bTgLdYZIW9O8uUOnLuNpddq8CxYiJ8AoKj/w7hxIX34Wfq
         rowuYr+wcc6kGDvjW98pmlMlVOWM0nAO07A/zdzIusQRavXtKFXJ72w9xISZjaSKnns2
         KcUt8dFP2IzKBwmtxj7TeDzSswVbJdJn5b5eEkORPhdsA4r2QUwe5Kic5ElaE85txfgH
         Jcw04R6XAC92DuW0jzMsEjWlI3DHwELXkk19g3VNakQj+LaGPZQzEd4QjAj0fU0xsw4c
         2agDjPewFU3szuFT2esQmFHyxKcFKykZ1WE2VgTr5UMw764pv47kRoWmKaq4VdxlkVnl
         qBmw==
X-Gm-Message-State: AOJu0YwoQwlQ+XNVTl/L7d/YIveZ4AAd88YFXIDXDgjL7OTpatr0Pn6f
	3licEq4mGo3mboZmQQ022pnLzQ18VAhhvOHexbQ1KBygd4OGg/SqVO7d269c0fpqlVDRIQ+aji1
	PnAKp31LHlo/dqATuO2g7hcSsrHvmMVNr8dfbNnvU069rCQJ85mI=
X-Gm-Gg: ASbGncuAYYEGuZqONgi1WE5sv1JV7LgUwVxfFj15y0RtO1BhXetvFOZX/I3SoN1zxIZ
	Pin7B7fPmOMMsPiVB2AiM6VFnjhbUARA=
X-Google-Smtp-Source: 
 AGHT+IE9xXVcC/kX+QMAEv/5g1DQPDXW0F0tLpeOnlkVXUey1cJBap16tvCOlBmp+5amy/N8LYKKHfSGjT4FGmmDXc8=
X-Received: by 2002:a05:6512:33c8:b0:53d:e70d:f3bc with SMTP id
 2adb3069b0e04-53df00d1bb2mr9459989e87.18.1733032727127; Sat, 30 Nov 2024
 21:58:47 -0800 (PST)
MIME-Version: 1.0
From: Mark Lentczner <mark@glyphic.com>
Date: Sat, 30 Nov 2024 21:58:36 -0800
Message-ID: 
 <CAPnksqQRnbLw3Pwdr5GyFtgqncEmgDq+z9y2s+rPocoRrdXxOg@mail.gmail.com>
Subject: snd_seq_open and pulse audio??
To: alsa-devel@alsa-project.org
Message-ID-Hash: Z5LXM42CJ5U4RV63FMRP4RPP4IC4MYY3
X-Message-ID-Hash: Z5LXM42CJ5U4RV63FMRP4RPP4IC4MYY3
X-MailFrom: mark@glyphic.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5LXM42CJ5U4RV63FMRP4RPP4IC4MYY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

TXkgQUxTQSBTZXEgcG9ydCBtYW5hZ2VyIHJ1bnMgYXMgYSBzZXJ2aWNlLiBUaGUgc2VydmljZSBp
cyBpbnN0YWxsZWQgdW5kZXINCml0cyBvd24gc2VydmljZSB1c2VyLCB3aGljaCBoYXMgdGhlIGhv
bWUgZGlyZWN0b3J5IHNldCB0byBzb21lIHBsYWNlDQpub24tZXhpc3RlbnQgYW5kIG5vbi13cml0
YWJsZS4NCg0KV2hlbiBteSBzZXJ2aWNlIHN0YXJ0cyBJIHNlZSB0aGlzIHN1cnByaXNpbmcgbG9n
IG1lc3NhZ2U6DQoNCiphbWlkaW1pbmRlclsxMzYzNDVdOiBGYWlsZWQgdG8gY3JlYXRlIHNlY3Vy
ZSBkaXJlY3RvcnkNCigvdmFyL2xpYi9taXNjLy5jb25maWcvcHVsc2UpOiBObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5Kg0KDQoNCkEgbGl0dGxlIGludmVzdGlnYXRpb24gcmV2ZWFscyB0aGF0IHRo
aXMgZXJyb3IgaXMgZ2VuZXJhdGVkIGJ5IHRoaXMgY2FsbCwNCm9wZW5pbmcgdGhlIEFMU0EgU2Vx
Og0KDQpzZXJyID0gc25kX3NlcV9vcGVuKCZzZXEsICJkZWZhdWx0IiwgU05EX1NFUV9PUEVOX0RV
UExFWCwgMCk7DQoNCkl0J3MgYSBsaXR0bGUgc3VycHJpc2luZyB0aGF0IG9wZW5pbmcgQUxTQSBT
ZXEgd291bGQgc29tZWhvdyBpbnZva2UNCnNvbWV0aGluZyBpbiBwdWxzZSBhdWRpbywgYW5kIGZ1
cnRoZXIgdGhhdCBwdWxzZSBhdWRpbyB3b3VsZCB0aGVuIGJlIHRyeWluZw0KdG8gY3JlYXRlIGl0
cyB1c2VyIGRpcmVjdG9yeSAoLmNvbmZpZ3VyZS9wdWxzZSBpcyB3aGVyZSBwdWxzZSBhdWRpbyBz
dGlja3MNCnRoaW5ncyB1bmRlciBlYWNoIHVzZXIncyBob21lIGRpcmVjdG9yeSkuDQoNClRoaXMg
c2VlbXMgdG8gYmUgYSByZXByaXNlIG9mIHRoaXMgRGViaWFuIGJ1ZyBmcm9tIDIwMTMgaW52b2x2
aW5nDQphbHNhLXV0aWxzIGFuZCBwdWxzZSBhdWRpbzoNCg0KaHR0cHM6Ly9idWdzLmRlYmlhbi5v
cmcvY2dpLWJpbi9idWdyZXBvcnQuY2dpP2J1Zz03MTI5ODANCg0KV2hpY2ggd2FzIGNsb3NlIHZp
YSB0aGlzIHBhdGNoIHRvIGFsc2EtdXRpbHM6DQoNCmFsc2FjdGw6IE1ha2UgaG9tZWRpciBjb25m
aWd1cmFibGUNCjxodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9oeXBlcmtpdHR5L2xp
c3QvYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnL3RocmVhZC9MMlJEVllSQTVSM1ZRSVhGUzRU
R0tVNERJQTRJRlBXVy8jTDJSRFZZUkE1UjNWUUlYRlM0VEdLVTRESUE0SUZQV1c+DQoNClRoZSBm
aXggdGhlcmUgc2VlbXMgdG8gYmUgYWRkaW5nIHNvbWUgbWVjaGFuaXNtIHRvIGNoYW5nZSB0aGUg
JEhPTUUNCmVudmlyb25tZW50IHZhcmlhYmxlIHRvIHBvaW50IGF0IC92YXIvcnVuL2Fsc2EuIEkg
YWdyZWUgd2l0aCBUYWthc2hpJ3MNCnJlcGx5IHRvIHRoYXQgZml4OiBPdmVycmlkaW5nICRIT01F
IHNvdW5kcyBzY2FyeSB0byBtZSwgdG9vIQ0KDQpJcyB0aGVyZSBhbnkgaW5zaWdodCBpbnRvIHRo
aXMuLi4gYW5kIGRpZCB0aGF0IGZpeCBzdGljayBvciB3YXMgc29tZSBvdGhlcg0KbWV0aG9kIGZv
dW5kIHRvIGRlYWwgd2l0aCB0aGlzLiAgSW4gbXkgY2FzZSwgSSBkb24ndCB1bmRlcnN0YW5kIHdo
eSBqdXN0DQpvcGVuaW5nIHRoZSBBTFNBIFNlcSBpcyBjYXVzaW5nIGFueSBwdWxzZSBhdWRpbyBj
b2RlIHRvIHJ1bi4uLiBidXQgcGVyaGFwcw0KdGhpbmdzIGFyZSBtb3JlIGVudHdpbmVkIGF0IGEg
bG93ZXIgbGV2ZWwgb2YgQUxTQSBsaWIgdGhhbiBJIHVuZGVyc3RhbmQuDQoNCi0gTWFyaw0K
