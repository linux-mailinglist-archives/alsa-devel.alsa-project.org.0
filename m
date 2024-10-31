Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F89B9B7806
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Oct 2024 10:53:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC940E82;
	Thu, 31 Oct 2024 10:53:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC940E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730368400;
	bh=BMhAaD7mpcJwEdJ3BNr3CEY0ASND7tC7FNz9fM2jCHw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V5uHgSXUKl/mXvIRX8zb2q9ElTQh4EppYWRn+ES6Rghot95N31C+AxCyA1IYWSRcb
	 t5mM8RHnFmRXrdbpKoiuauaAP+PFbApkioBCLpJaBE9vuI3dppCYhe+SAn+jSmRZO2
	 vkhk8UHo6VXCllpHZVXA7wl+PmBY6MhSEEa5nnpQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B066F8014C; Thu, 31 Oct 2024 10:52:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E355F805B2;
	Thu, 31 Oct 2024 10:52:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 473C9F80269; Thu, 31 Oct 2024 10:52:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 385B0F80104
	for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2024 10:52:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 385B0F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=blokas.io header.i=@blokas.io header.a=rsa-sha256
 header.s=google header.b=A6uEZ7rP
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-6e5a5a59094so6285227b3.3
        for <alsa-devel@alsa-project.org>;
 Thu, 31 Oct 2024 02:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blokas.io; s=google; t=1730368355; x=1730973155;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BlSlm2V9aIOdtRq2nMJKcPiqR0lCQ0fvazqfL1AZOII=;
        b=A6uEZ7rPwFLZb50RYo4t8oyjXsX90RmaWZgvTPX33IMloiIjQMRYWilUjJseLQbp05
         UJHxACRuCVTi1f24qQAscSKPwCjnv4yGbsZGSJxFFyC4L/A/wKpKNmZcvd0xhLONX4Tz
         6CS4QtcYz9NSuyoBeHS0gAtoIAqAtNhZmg7mEVcq0DIpkcVVXg6K+CODn0m9WTqjHPQI
         ViU+63H/KLFHO2HmeyGtIiOYBDe2omfdEz8WkW6Qvqi2Cz1vmHLCTE1DffewyzEgJup6
         gBRyi8yAW1Ru9TH8CzIS9xR9kxSBSatxC4u/7igzJvi3LSFANYilTw6UaUUkh/oj5Am8
         TaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730368355; x=1730973155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BlSlm2V9aIOdtRq2nMJKcPiqR0lCQ0fvazqfL1AZOII=;
        b=nKvV7H6PFhrvkteMgPFvJlJrG48Z4TiHnAZftYvQ9ZVh3okFKQffaXz1t2Bdkz4V/x
         8apRLQRmrW7S8WU6uN7VpA0Lk1I30paqVxNsLwy8pxkDOwt6eER+X2tnIFoeO+9laDmo
         BK+nvp0ts/dXQgav7S/ZSQigIdQOgVDnCmz6l3PY+1mUtj54PVJFpBmr8XrN2jUksWEz
         BNF3Q9Gq1aLKj44WvUVbf79C0cPmlxLIZPjYoqSFn+Uno33a8CrxghPIilLIi3mRecuc
         KRWrspy7iCb17HjhGH/CqqGCfYhdxcDh6+a1gHOZPfL+8xNNvAhZUxeLRjraHGGFgGTq
         UVGw==
X-Gm-Message-State: AOJu0Yz5xDBLd/zWdYfBHQJzlhVubrneIp7oE5cE3Zq4pJlxxOqTjKlV
	BwVA/y8vAZ6wSK1RDPWwy9kXgkMJtzTeF40x1KPJLm8q6r2GrL7Eqq7OYNCos+BfI20+Ox5qUK9
	Kpq7jU5y4NfwIDu1BFgLaV0Ep/yog3cmSiN2KnA==
X-Google-Smtp-Source: 
 AGHT+IFbFYmDUZPeUtDjEBeVFNU0XtpL5WOfZXRjuVWTbhQm1d16nh4VTF+1cbDhrwV4OcQR7iiC3AY2VCJp6P71LeQ=
X-Received: by 2002:a05:690c:4913:b0:6c7:a120:e0ec with SMTP id
 00721157ae682-6e9d89d5638mr204247347b3.22.1730368355153; Thu, 31 Oct 2024
 02:52:35 -0700 (PDT)
MIME-Version: 1.0
References: 
 <173036094280.7932.15651402625270790788@mailman-web.alsa-project.org>
 <87ttcswsoe.wl-tiwai@suse.de>
In-Reply-To: <87ttcswsoe.wl-tiwai@suse.de>
From: =?UTF-8?Q?Giedrius_Trainavi=C4=8Dius?= <giedrius@blokas.io>
Date: Thu, 31 Oct 2024 11:52:23 +0200
Message-ID: 
 <CAMONXLt_G5AsdGcYtXi005-K=o4=+4H8-JqVZHXMJpbSBdoQtA@mail.gmail.com>
Subject: Re: Direct MIDI event delivery to ALSA sequencer's hardware port
 without any connections/subscriptions fails with -ENODEV.
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Message-ID-Hash: X4FZ6MUTNGL7KCGUS3T5HNFXOSPR3QHF
X-Message-ID-Hash: X4FZ6MUTNGL7KCGUS3T5HNFXOSPR3QHF
X-MailFrom: giedrius@blokas.io
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X4FZ6MUTNGL7KCGUS3T5HNFXOSPR3QHF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgVGFrYXNoaSwNCg0KU28gdGhlIHBhdHRlcm4gaW5zdGVhZCBzaG91bGQgYmUgdG8gc3Vic2Ny
aWJlIG93biBzaW1wbGUgcG9ydCB0byB0aGUNCmRlc3RpbmF0aW9uIHBvcnQocykgYW5kIHRoZW4g
c2VuZCB0aGUgZXZlbnRzIHVzaW5nICdzbmRfc2VxX2V2X3NldF9zdWJzJz8NCg0KSSBzZWUgYXNl
cXNlbmQgYXBwZWFyZWQgaW4gQUxTQS11dGlscyBhcyB3ZWxsLCBpdCB3b3VsZCBhbHNvIGJlIGlt
cGFjdGVkIGJ5DQp0aGUgc2FtZSBhY2Nlc3MgcGF0dGVybiBpZiB0cnlpbmcgdG8gc2VuZCB0byBh
biB1bnN1YnNjcmliZWQgaGFyZHdhcmUgcG9ydC4NCg0KVGhhbmsgeW91IQ0KR2llZHJpdXMuDQoN
Ck9uIFRodSwgT2N0IDMxLCAyMDI0IGF0IDExOjAy4oCvQU0gVGFrYXNoaSBJd2FpIDx0aXdhaUBz
dXNlLmRlPiB3cm90ZToNCg0KPiBPbiBUaHUsIDMxIE9jdCAyMDI0IDA4OjQ5OjAyICswMTAwLA0K
PiBnaWVkcml1c0BibG9rYXMuaW8gd3JvdGU6DQo+ID4NCj4gPiBIZWxsbywNCj4gPg0KPiA+IEkg
aGFkIHdyaXR0ZW4gYW4gYGFzZXFzZW5kYCB1dGlsaXR5IHRvIHNlbmQgTUlESSBldmVudHMgZnJv
bSBoZXggc3RyaW5ncw0KPiB0byBBTFNBIHNlcXVlbmNlciBwb3J0cywgc2ltaWxhciB0byB0aGUg
LVMgYXJnIG9mIGBhbWlkaWAsIGJ1dCBJIGp1c3QNCj4gbm90aWNlZCB0aGF0IHdoaWxlIHNlbmRp
bmcgZXZlbnRzIGRpcmVjdGx5IHRvIGFwcGxpY2F0aW9uIEFMU0EgU2VxdWVuY2VyDQo+IHBvcnRz
IHdvcmtzIGp1c3QgZmluZSwgdHJ5aW5nIHRvIHNlbmQgdG8gYSBoYXJkd2FyZSBNSURJIHBvcnQg
ZmFpbHMgd2l0aA0KPiAtMTkgKC1FTk9ERVYpLg0KPiA+DQo+ID4gSGVyZSdzIHRoZSBhc2Vxc2Vu
ZCB1dGlsaXR5IGNvZGUsIHRoZSBoaWdobGlnaHRlZCBsaW5lIGlzIHRoZSBvbmUNCj4gcmV0dXJu
aW5nIC1FTk9ERVY6DQo+ID4NCj4gPiBodHRwczovL2dpdGh1Yi5jb20vQmxva2FzTGFicy9hc2Vx
c2VuZC9ibG9iL21haW4vYXNlcXNlbmQuYyNMMTczDQo+ID4NCj4gPiBIZXJlJ3Mgc29tZSBzYW1w
bGUgY29tbWFuZHMgc2hvd2Nhc2luZyB0aGUgcHJvYmxlbSAoSSd2ZSBhZGRlZCBhIHByaW50Zg0K
PiB3aXRoIGRyYWluIHJlc3VsdCBqdXN0IGFmdGVyIHRoZSBpbmRpY2F0ZWQgbGluZSBhYm92ZSBs
b2NhbGx5KToNCj4gPg0KPiA+IGh0dHBzOi8vcGFzdGUuZGViaWFuLm5ldC9oaWRkZW4vOTY5MGQ2
NjAvDQo+ID4NCj4gPiBJdCBzaG93cyB0aGF0IGluIGNhc2UgdGhlcmUncyBubyBhY3RpdmUgc3Vi
c2NyaXB0aW9ucyB0byB0aGUgcG9ydCwgdGhlDQo+IGV2ZW50IGRlbGl2ZXJ5IGZhaWxzLCB3aXRo
IG5vIGRhdGEgZXZlciByZWFjaGluZyB0aGUgaGFyZHdhcmUgZGV2aWNlLiBBcw0KPiBsb25nIGFz
IHRoZXJlJ3MgYXQgbGVhc3Qgb25lIHN1YnNjcmlwdGlvbiB0byB0aGUgcG9ydCwgaXQgd29ya3Mg
b2suIEkndmUNCj4gcmVwcm9kdWNlZCB0aGlzIG9uIDUuMTUuMzYtcnQ0MS12NysgYW5kIDYuNi41
OC12OC0xNmsgKHJ1bm5pbmcgb24gUmFzcGJlcnJ5DQo+IFBpLCBiYXNlZCBvbiBodHRwczovL2dp
dGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgpDQo+ID4NCj4gPiBJJ3ZlIHRyYWNlZCB0aGUgLUVO
T0RFViB0byBiZSByZXR1cm5lZCBhdCB0aGlzIGxvY2F0aW9uOg0KPiBodHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC92Ni42LjU4L3NvdXJjZS9zb3VuZC9jb3JlL3NlcS9zZXFfbWlkaS5j
I0wxMzQNCj4gPg0KPiA+IFdoZW5ldmVyIHRoZXJlJ3MgYSBzdWJzY3JpcHRpb24sIHRoZSAnc3Vi
c3RyZWFtJyBpcyBub3QgTlVMTC4NCj4gPg0KPiA+IEJ1dCB3aGF0IEkgd291bGQgbmF0dXJhbGx5
IGV4cGVjdCBpcyBmb3IgdGhlIGV2ZW50cyB0byBnZXQgZGVsaXZlcmVkIHRvDQo+IHRoZSBoYXJk
d2FyZSBwb3J0IHdoZW4gdXNpbmcgZGlyZWN0IGFkZHJlc3NpbmcsIHJlZ2FyZGxlc3Mgb2YgaXRz
DQo+IHN1YnNjcmlwdGlvbiBzdGF0dXMsIHRoZSBzYW1lIHdheSBob3cgaXQncyBwb3NzaWJsZSB0
byBzZW5kIGV2ZW50cyB0bw0KPiBhcHBsaWNhdGlvbiBhc2VxIHBvcnRzOg0KPiA+DQo+ID4gLS0g
VGVybWluYWwgMSAtLQ0KPiA+IHBhdGNoQHBhdGNoYm94On4gJCBhc2VxZHVtcA0KPiA+IFdhaXRp
bmcgZm9yIGRhdGEgYXQgcG9ydCAxMjg6MC4gUHJlc3MgQ3RybCtDIHRvIGVuZC4NCj4gPiBTb3Vy
Y2UgIEV2ZW50ICAgICAgICAgICAgICAgICAgQ2ggIERhdGENCj4gPiAxMjk6MCAgIE5vdGUgb24g
ICAgICAgICAgICAgICAgIDAsIG5vdGUgNjQsIHZlbG9jaXR5IDQ4DQo+ID4NCj4gPiAtLSBUZXJt
aW5hbCAyIC0tDQo+ID4gcGF0Y2hAcGF0Y2hib3g6fi93b3JrL2FzZXFzZW5kICQgLi9hc2Vxc2Vu
ZCAxMjg6MCA5MCA0MCAzMA0KPiA+IGRyYWluOiAwDQo+ID4NCj4gPg0KPiA+IElzIHRoaXMgYSBi
dWcgaW4gQUxTQSBTZXF1ZW5jZXIsIG9yIGlzIG15IGV4cGVjdGF0aW9uIG9mIGJlaW5nIGFibGUg
dG8NCj4gd3JpdGUgZGlyZWN0bHkgdG8gYSBoYXJkd2FyZSBBTFNBIHNlcXVlbmNlciBwb3J0IGlu
Y29ycmVjdD8NCj4NCj4gVGhlIGJlaGF2aW9yIGRlcGVuZHMgb24gdGhlIHNlcXVlbmNlciBjbGll
bnQsIGJ1dCBpbiB0aGUgY2FzZSBvZiB0aGUNCj4gbm9ybWFsIE1JREkgY2xpZW50cywgdGhlIHN1
YnNjcmlwdGlvbiBpcyBtYW5kYXRvcnkgZm9yIGRlbGl2ZXJpbmcNCj4gZXZlbnRzIHByb3Blcmx5
LiAgSXQgY29ycmVzcG9uZHMgdG8gb3Blbi9jbG9zZSB0aGUgZGV2aWNlLg0KPg0KPg0KPiBIVEgs
DQo+DQo+IFRha2FzaGkNCj4NCg==
