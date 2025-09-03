Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E1FB414CE
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Sep 2025 08:15:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D357601E7;
	Wed,  3 Sep 2025 08:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D357601E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756880157;
	bh=O6TAH9bf7bZ6q1nguftqj9/qayPa8X6Mxs22Re+/UqI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gbyOVVrQd8mY6IHAxHdSc88R5s1r6JrVfjFznQdW9b0Vmg0z06NeLIY4smM5+VrO0
	 YLunUFCnWaU1GF4wqPHS6SoaipH+OYEVDZiZ+pOz4uEglfXJcq5vSR3pH7F8u24ZAU
	 Y+yZyXYu5OlvYbJXCMKy6LAO2LGlYxIYt/G+2zBY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAB65F805C5; Wed,  3 Sep 2025 08:15:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15CC3F805C5;
	Wed,  3 Sep 2025 08:15:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D27FAF804D6; Wed,  3 Sep 2025 08:15:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74127F8011B
	for <alsa-devel@alsa-project.org>; Wed,  3 Sep 2025 08:15:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74127F8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=f+McvNdJ
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b49cf1d4f6fso4306292a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 02 Sep 2025 23:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756880107; x=1757484907;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CASaOQXxXBHm0Hm/XSUlcFSzoKA+XZoPaksGw+yvEGQ=;
        b=f+McvNdJpK4Xfuax+RPb0TFYQYlSWMMOxppChJh90h2wfqV5WGRYQ4ZPat7vTTV1rb
         ViiRcdiUrPxLge4Qb6x9roPXmN+G+MtgmTVjwkqqdGyNzJJb2ebmosc+RBk+p5DZzdyX
         b/L//2A3vcxaQccWEwCrfpWQD2XNpe1YiyeFyRgDhAKhI5xiiVUba0r8j8jbl6wLoDEL
         yYXFeJYQL3wXcs0nal3/xFDmTO9V63fTliia8Y2skORdjYf0UT0m2ine3mUkTY06F4rA
         EY7I32NlduPjHQ0fk52A21mWOkCURHZDADH9Ary3qLgNOWso0ByZ8rZ2CKC8/rEo84bi
         0Zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756880107; x=1757484907;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CASaOQXxXBHm0Hm/XSUlcFSzoKA+XZoPaksGw+yvEGQ=;
        b=tdR6phxX/NayOIpxTCz31K0DAQRzjZ+DNY+9/el5AivW9aNGijEY/qh2PL5rkhbwmy
         VbmrUPNw/hVMVSuY/LmXEO5EV0khYvUmKmkdgtRMIxa37lU/FrlZrzyg1eykIfwGlngH
         Xpt2KpRxkH+Ix5zfpFWJt0K2HxN18W+pEkz9Fv0X+GnVLUQhHKqZGe0BD7utp6HOjSg4
         2knJwA8UzM9feiVlxySO4aXTPHwNqloz/F8wkEjMrkwzIQ/7//9f/+jkFqzRX569SYYk
         9SpXiendfPMhd4ymhAiMQZ8rf37OMtlAddDK4P0oPQl+6iPBBydZxLBrxJSvjIaS6bUt
         UO3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG59KSysITmSEThhg5ynLU+TjFLgRYILhZ+vW9dq5I7l1m7ncNJxiB4Swxacq+e4WPdrbUw8CcXX26@alsa-project.org
X-Gm-Message-State: AOJu0YxudC28scfgl81MkwzlNUcIlzLUuBfb3L4rBtl29fCKlrFr7GkE
	hJ54eTAH5neCVhguqxXiybslbcJlLNvEFOXxr4WDqVYMY7VOv0dHW2u/HO1ViFhch7ZtlGkUM4I
	+WCd8nyT7gvF4dpZR40Ok2a+FlW1pN5M=
X-Gm-Gg: ASbGncsyb6aQvAJa1881PWXRWviGnKMB6s2tKXIpPdlawlY2a0kUxCUTLVv0YyrRJMs
	2fkeOXoXGwAUQni99nlgnFHAtSXPRWEO3CExpf3grSfU4Zx1m85YVlxkBgYwCMusS+3gUiKc2rD
	yh4P/Vxv/KZvgc3yubkLPxM6+hcTJVmvQYrNqJL+TRKxsIQsQQfH9GSzfDvPWnzxw5s/6MOUtcn
	RXCy7M=
X-Google-Smtp-Source: 
 AGHT+IGCoYY66ZhyMy6Ahj7iH50PNrot1s5HIq7fDQawLlBlLw7rgtXHqA+TqOZ7GG/kRHAwRQ3wBNMyhBe0YlwdMtQ=
X-Received: by 2002:a17:90a:e7ce:b0:32a:34d8:33d3 with SMTP id
 98e67ed59e1d1-32a34d83524mr4858527a91.0.1756880106780; Tue, 02 Sep 2025
 23:15:06 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAAnsHS64Pt9N2Ct3D6X=f6JytCiii9ntQ=MYqvweC=QaFpXPNw@mail.gmail.com>
 <20250902234540.GA65685@workstation.local>
In-Reply-To: <20250902234540.GA65685@workstation.local>
From: =?UTF-8?B?0JjQu9GM0Y8g0JrRg9C30L3QtdGG0L7Qsg==?=
 <zloy.technic@gmail.com>
Date: Wed, 3 Sep 2025 11:14:53 +0500
X-Gm-Features: Ac12FXyKh806fYkY3qM_zuoqeekVL08kRv4iHT6nfTv3iYIyFHIaoSyvn9mdyZc
Message-ID: 
 <CAAnsHS776YOJGUA9DYOT6rEjOx+5-iK=P8UOXjbE9QVgcb5uAg@mail.gmail.com>
Subject: 
 =?UTF-8?Q?Re=3A_=5BBUG=5D_ALSA_FireWire=3A_poll_timeout_causes_JACK_to?=
	=?UTF-8?Q?_stop_=286=2E10_=E2=80=93_6=2E17=2Drc2=29?=
To: =?UTF-8?B?0JjQu9GM0Y8g0JrRg9C30L3QtdGG0L7Qsg==?= <zloy.technic@gmail.com>,
	alsa-devel@alsa-project.org
Message-ID-Hash: OBXHA3BQ6WOJIHKPZB2RFEUDMGSIW24A
X-Message-ID-Hash: OBXHA3BQ6WOJIHKPZB2RFEUDMGSIW24A
X-MailFrom: zloy.technic@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBXHA3BQ6WOJIHKPZB2RFEUDMGSIW24A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgVGFrYXNoaSwNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5LiBJIHRyaWVkIFBpcGVXaXJl
IGluIHRoZSBwYXN0LCBidXQgbXkgb3ZlcmFsbA0KZXhwZXJpZW5jZSB3YXMgcmF0aGVyIG5lZ2F0
aXZlLiBXaXRoIGl0cyBBTFNBIGRyaXZlcnMgSSBjb3VsZCBub3QgYWNoaWV2ZQ0KdGhlIHNhbWUg
bG93IGxhdGVuY3kgYXMgd2l0aCBGRkFETy4gV2hlbiB1c2luZyBQaXBlV2lyZSB0b2dldGhlciB3
aXRoDQpGRkFETywgdGhlIHJlc3VsdHMgd2VyZSBldmVuIHdvcnNlLCB3aXRoIG1hbnkgY2xlYXJs
eSBhdWRpYmxlIHhydW5zLg0KDQpCZWNhdXNlIG9mIHRoaXMsIEkgc3RvcHBlZCB1c2luZyBQaXBl
V2lyZSBmb3IgUHJvQXVkaW8gcHVycG9zZXMuIEFzIGZhciBhcw0KSSBrbm93LCB0aGVyZSBpcyBz
dGlsbCBhbiB1bnJlc29sdmVkIGlzc3VlIHdpdGggYWJvdXQgOTAgbXMgb2YgYWRkaXRpb25hbA0K
bGF0ZW5jeSwgd2hpY2ggbWFrZXMgaXQgdW5zdWl0YWJsZSBmb3IgbXkgd29ya2Zsb3cuDQoNCkkg
YW0gYXdhcmUgb2YgdGhlIG9uZ29pbmcgd29yayBvbiB0aGUgTGludXggRmlyZVdpcmUgc3RhY2ss
IGJ1dCBteQ0KdW5kZXJzdGFuZGluZyB3YXMgdGhhdCB3aXRoIEFMU0EgSSBzaG91bGQgbm90IGJl
IGdldHRpbmcgeHJ1bnMgb24gbXkNCnN5c3RlbS4gRm9yIHJlZmVyZW5jZTogSSBhbSBydW5uaW5n
IGEgUnl6ZW4gNyA3NzAwIENQVSBhbmQgdGVzdGVkIHdpdGggYm90aA0KUlQgYW5kIExpcXVvcml4
IGtlcm5lbHMuDQoNCkJlc3QgcmVnYXJkcywNCklseWEgS3V6bmV0c292DQoNCtGB0YAsIDMg0YHQ
tdC90YIuIDIwMjXigK/Qsy4sIDA0OjQ1IFRha2FzaGkgU2FrYW1vdG8gPG8tdGFrYXNoaUBzYWth
bW9jY2hpLmpwPjoNCg0KPiBIaSwNCj4NCj4gSSdtIHNvcnJ5IGZvciB5b3VyIGluY29udmVuaWVu
Y2UuDQo+DQo+IElmIHlvdSBoYXZlIGV2ZXIgdXNlZCB5b3VyIGRldmljZSB3aXRoIFBpcGV3aXJl
LCBJIHdvdWxkIGxpa2UgdG8gc2VlDQo+IHlvdXIgZXhwZXJpZW5jZXMgaG93IGl0IHdvcmtzLCBz
aW5jZSBib3RoIHNlcnZlcnMgdXNlcyB0aGUgZGlmZmVyZW50DQo+IHdheXMgdG8gaGFuZGxlIEFM
U0EgUENNIGRldmljZSBpbiByZXNwZWN0IHRvIG5vLXBlcmlvZC13YWtldXAgbW9kZS4uDQo+DQo+
IE9uIFR1ZSwgU2VwIDAyLCAyMDI1IGF0IDAzOjExOjUyUE0gKzA1MDAsINCY0LvRjNGPINCa0YPQ
t9C90LXRhtC+0LIgd3JvdGU6DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gPg0KPiA+IEhlbGxvIEFMU0EgZGV2ZWxvcGVycywNCj4gPg0KPiA+IEkgd291bGQgbGlrZSB0
byByZXBvcnQgYSByZXByb2R1Y2libGUgaXNzdWUgd2l0aCBzbmQtZmlyZWZhY2Ugb24gTGludXgN
Cj4gPiBrZXJuZWxzIDYuMTAgdGhyb3VnaCA2LjE3LXJjMi4NCj4gPg0KPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQo+ID4NCj4gPiBTeXN0ZW0gSW5mb3JtYXRpb24NCj4gPg0K
PiA+IEtlcm5lbCB2ZXJzaW9ucyB0ZXN0ZWQ6IDYuMTAg4oaSIDYuMTctcmMyDQo+ID4NCj4gPiBB
dWRpbyBpbnRlcmZhY2U6IFJNRSBGaXJlZmFjZSA4MDANCj4gPg0KPiA+IERyaXZlciBpbiB1c2U6
IHNuZC1maXJlZmFjZQ0KPiA+DQo+ID4gQXVkaW8gc2VydmVyOiBKQUNLICh0ZXN0ZWQgd2l0aCBq
YWNrZCBhbmQgUUphY2tDdGwpDQo+ID4NCj4gPiBEaXN0cmlidXRpb246IERlYmlhbiAxMg0KPiA+
DQo+ID4gS2VybmVsIGNvbmZpZzogQUxTQSBGaXJlV2lyZSBkcml2ZXJzIGVuYWJsZWQsIG5vIEZG
QURPIGluIHVzZQ0KPiA+DQo+ID4gQ2hpcCAxMzk0OiBUZXhhcyBJbnN0cnVtZXRzDQo+ID4NCj4g
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+DQo+ID4gU3RlcHMgdG8gUmVw
cm9kdWNlDQo+ID4NCj4gPiBCb290IGtlcm5lbCA2LjEwIOKApiA2LjE3LXJjMiB3aXRoIHNuZC1m
aXJlZmFjZSBsb2FkZWQuDQo+ID4NCj4gPiBTdGFydCBKQUNLIHdpdGggQUxTQSBiYWNrZW5kLCBm
b3IgZXhhbXBsZToNCj4gPg0KPiA+IGphY2tkIC1kIGFsc2EgLWQgaHc6RmlyZWZhY2UgLXAgNjQg
LW4gMw0KPiA+DQo+ID4gVXNlIHRoZSBzeXN0ZW0gbm9ybWFsbHkg4oCUIGR1cmluZyBwbGF5YmFj
aywgcmVjb3JkaW5nLCBvciBldmVuIHdoZW4NCj4gPiBpZGxlLiBUaGUgaXNzdWUgbWF5IG9jY3Vy
IGF0IGFueSB0aW1lIHdpdGhvdXQgYXBwYXJlbnQgZXh0ZXJuYWwgY2F1c2UuDQo+ID4NCj4gPiBB
Y3R1YWwgQmVoYXZpb3INCj4gPg0KPiA+IEFmdGVyIHNvbWUgaWRsZSB0aW1lLCBBTFNBIHN0b3Bz
IHJlc3BvbmRpbmcgYW5kIEpBQ0sgcHJpbnRzOg0KPiA+DQo+ID4gRVJST1I6IEFMU0E6IHBvbGwg
dGltZSBvdXQsIHBvbGxlZCBmb3IgLi4uIHVzZWNzDQo+ID4gRVJST1I6IEphY2tBdWRpb0RyaXZl
cjo6UHJvY2Vzc0FzeW5jOiByZWFkIGVycm9yLCBzdG9wcGluZy4uLg0KPiA+DQo+ID4gSkFDSyBp
bW1lZGlhdGVseSB0ZXJtaW5hdGVzLiBUaGUgRmlyZWZhY2UgODAwIGRvZXMgbm90IHJlY292ZXIg
dW50aWwNCj4gPiBKQUNLIGlzIHJlc3RhcnRlZC4NCj4gPg0KPiA+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+ID4NCj4gPiBFeHBlY3RlZCBCZWhhdmlvcg0KPiA+DQo+ID4gVGhl
IEFMU0EgRmlyZVdpcmUgZHJpdmVyIHNob3VsZCBtYWludGFpbiB0aGUgc3RyZWFtIGFuZCBhbGxv
dyBKQUNLIHRvDQo+ID4gY29udGludWUgcnVubmluZyB3aXRob3V0IG1hbnVhbCByZXN0YXJ0LCBl
dmVuIHdoZW4gaWRsZS4NCj4gPg0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+ID4NCj4gPiBOb3Rlcw0KPiA+DQo+ID4gV2l0aCBGRkFETyBiYWNrZW5kIChqYWNrZCAtZCBm
aXJld2lyZSksIHRoZSBzYW1lIGhhcmR3YXJlIHdvcmtzDQo+ID4gcmVsaWFibHkgYW5kIGRvZXMg
bm90IGV4aGliaXQgdGhpcyBpc3N1ZS4NCj4gPg0KPiA+IFRoaXMgc3VnZ2VzdHMgdGhhdCB0aGUg
cHJvYmxlbSBsaWVzIGluIHRoZSBBTFNBIEZpcmVXaXJlIHN0cmVhbWluZw0KPiA+IGVuZ2luZSBy
YXRoZXIgdGhhbiB0aGUgaGFyZHdhcmUgaXRzZWxmLg0KPiA+DQo+ID4gVGhlIHByb2JsZW0gaGFz
IGJlZW4gcmVwcm9kdWNpYmxlIGFjcm9zcyBhbGwgdGVzdGVkIGtlcm5lbHMgKHZhbmlsYSwNCj4g
PiBydCwgbGlxdW9yaXgpIGZyb20gNi4xMCB0aHJvdWdoIDYuMTctcmMyLg0KPiA+DQo+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPg0KPiA+IFJlcXVlc3QNCj4gPg0KPiA+
IENvdWxkIHlvdSBwbGVhc2UgY29uZmlybSBpZiB0aGlzIGlzc3VlIGlzIGtub3duPw0KPiA+IElz
IHRoZXJlIGFueSBvbmdvaW5nIHdvcmsgb24gdGhlIEFMU0EgRmlyZVdpcmUgc3RyZWFtaW5nIGVu
Z2luZQ0KPiA+IChzbmQtZmlyZWZhY2UpIHRvIGFkZHJlc3MgdGhlc2UgcG9sbCB0aW1lb3V0IGNv
bmRpdGlvbnM/DQo+ID4NCj4gPiBJIGNhbiBwcm92aWRlIGFkZGl0aW9uYWwgbG9ncyAoZG1lc2cs
IGpvdXJuYWxjdGwpIG9yIHRlc3QgcGF0Y2hlcyBpZg0KPiBuZWVkZWQuDQo+ID4NCj4gPiBUaGFu
ayB5b3UsDQo+ID4NCj4gPiBJbHlhIEt1em5ldHNvdi4NCj4NCj4NCj4gUmVnYXJkcw0KPg0KPiBU
YWthc2hpIFNha2Ftb3RvDQo+DQo=
