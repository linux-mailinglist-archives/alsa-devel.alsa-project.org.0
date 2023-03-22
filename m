Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E11EB6C4014
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 03:02:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF4433E7;
	Wed, 22 Mar 2023 03:01:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF4433E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679450530;
	bh=9xZKZ8ccvCQLrHTjyJnVALPlnMnXtrhw8Vu57XpEk/s=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hplQOUAFwhg4nJY2D2Qh7VFjhs+JAJ6n/1Io35xGeZN/wu66Nd7vgOo1bHhRjXcK0
	 f5RnOz2xY1RPSy3inYcqV3OGHkezroX+/Cbd9bm47b7NsoNwyBIl9tW6kFPnnoOBqU
	 9OxsgvunmIgkURvAa5wx/7vlPRIPBRAiXQpUYwAc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36BC9F8024E;
	Wed, 22 Mar 2023 03:01:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E73EF80254; Wed, 22 Mar 2023 03:01:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEF49F80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 03:01:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEF49F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=o/ca8Jie
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5416b0ab0ecso313441597b3.6
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Mar 2023 19:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679450464;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y3lSnFrQGkWPOTuQCKCUWjwKmr+psrlahP4j3AW9vpM=;
        b=o/ca8JieIY4WnXiK0+wna47MmMuLOz+bm09NlnISDtIunEOQQALx+ERNVDVhWmzv85
         4qDxqDrH34xs3mn2LoHn3ANVDNUZg7p2dyKxcElMfZALXZFw1k1eHmLh2WcFkMEw3zDv
         IOdJEx8Ia8nuI/p2XaMXnM3W++dRLdE33ozNriyTAo8BODx/yy0/oKgDZqKojfFYVmNK
         1CXrUq8FTEsAIxYjEb2j46DCFJHsjcjCOB3tQ2VWov5aTeE5pryjrJGseCW4/N8QFIRs
         zPvqsy7x7ES/CiRQMpz36NNkTf5Ou+Isyor/xY+v0cPBZmThwmA/AQj4hc0zOH7XDTk7
         5ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679450464;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y3lSnFrQGkWPOTuQCKCUWjwKmr+psrlahP4j3AW9vpM=;
        b=GHuGDpr8JLhW3LLE79GVxQ4zFfPkHIuRudSdchMDisu5sZ2NMNabdQ79NmtIEQ4+/9
         JfLsv0y8AOrvG0gFp7x7tzXHd2XExCCNpi1p357iDOhoGHGb9GgxzIAhmIj35JW8c7vK
         unOezyfJM1CP/P69q0RvOk3fM21aFFNTah1CxvWs9tUT5NJpFLzOfKrGS6WBMFHu+Cst
         8tguFm/C1MeBJ979UJ7I6GJl27g8+hNQ054gPXyTRRqxVH+N6RHCcMCse2Rk4G6tPyYh
         As+60RN5mn8du/0OD4S6EFfwLzSi/G5LGI7rs33Gdn36Vued5KNIiQ7oLHMlkkOfW6w4
         SoHQ==
X-Gm-Message-State: AAQBX9dZZDRfrlkkm41FUGZuprxrJREBj/S5pupHGxM39RPQQseSDVOE
	T3ZyoJgcdCoEzGXLSz+LtggwnxPSauk34rIqODA=
X-Google-Smtp-Source: 
 AKy350Y3/0Jd6KfWFBlijkp89uD8+RrZs+Q/vymBy5leldTI6PlMC9z7IqnNLkJxEZ2LG+H4fFWaOEdla+dBZ9iobVk=
X-Received: by 2002:a81:b285:0:b0:541:8291:5237 with SMTP id
 q127-20020a81b285000000b0054182915237mr402176ywh.0.1679450464520; Tue, 21 Mar
 2023 19:01:04 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5rKI5LiA6LaF?= <zhuning0077@gmail.com>
Date: Wed, 22 Mar 2023 10:00:52 +0800
Message-ID: 
 <CANPLYpAzUuJu12Sz77Fq5zfQGo+u2NksQQE-8m-d1SqKuP-Qjg@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: es8316: Enable support for S32 LE format and
 MCLK div by 2
To: broonie@kernel.org
Message-ID-Hash: UL6B5VA5QBLTEVQ3BUZNUVYRFVGAW4VU
X-Message-ID-Hash: UL6B5VA5QBLTEVQ3BUZNUVYRFVGAW4VU
X-MailFrom: zhuning0077@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, posteuca@mutex.one, tiwai@suse.com,
 yangxiaohua <yangxiaohua@everest-semi.com>,
 Zhu Ning <zhuning@everest-semi.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UL6B5VA5QBLTEVQ3BUZNUVYRFVGAW4VU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+ID4gVGhpcyBpbnRyb2R1Y2VzIGEgRFQgcHJvcGVydHkgYnV0IHRoZXJlJ3Mgbm8gZG9jdW1l
bnRhdGlvbiBmb3IgaXQsDQpidXQgSQ0KPiA+ID4gZG9uJ3Qgc2VlIHdoeSB3ZSdkIHdhbnQgdGhp
cyBpbiB0aGUgYmluZGluZ3MgLSB0aGUgZHJpdmVyIHNob3VsZCBiZQ0KYWJsZQ0KPiA+ID4gdG8g
dGVsbCBmcm9tIHRoZSBpbnB1dCBjbG9jayByYXRlIGFuZCByZXF1aXJlZCBvdXRwdXQvaW50ZXJu
YWwgY2xvY2tzDQppZg0KPiA+ID4gaXQgbmVlZHMgdG8gZGl2aWRlIE1DTEsuDQo+DQo+ID4gVGhl
IHByb2JsZW0gaGVyZSBpcyB0aGF0IEkgaGF2ZSBubyBrbm93bGVkZ2Ugd2hhdCBpcyB0aGUgbWF4
aW11bSBNQ0xLDQo+ID4gdGhhdCB0aGUgY29kZWMgYWNjZXB0cy4gQWNjb3JkaW5nIHRvIHRoZSBk
YXRhc2hlZXQgdGhlIG1heGltdW0gc3VwcG9ydGVkDQo+ID4gZnJlcXVlbmN5IG9mIE1DTEsgaXMg
NTEuMiBNaHouIEJ1dCB0aGlzIGRvZXNuJ3Qgc2VlbSB0byBiZSB0aGUgY2FzZSBpbg0KPiA+IHBy
YWN0aWNlIHNpbmNlIGEgTUNMSyBvZiA0OE1oeiBjYXVzZXMgbm9pc2VzIGluIHRoZSBzb3VuZCBv
dXRwdXQuDQo+ID4gVGhlIGlkZWEgdG8gZGl2aWRlIHRoZSBNQ0xLIGJ5IDIgd2FzIHByb3Bvc2Vk
IGJ5IGEgRXZlcmVzdCBTZW1pY29uZHVjdG9yDQo+ID4gZW5naW5lZXIuDQo+ID4gU28gSSBkb24n
dCBrbm93IGhvdyB0byBtYWtlIHRoaXMgZ2VuZXJpYyBlbm91Z2ggdG8gYmUgYWN0aXZhdGVkIGZy
b20gdGhlDQo+ID4gY29kZWMgZHJpdmVyLg0KPg0KPiBUaGUgdXN1YWwgY29uc3RyYWludCB3b3Vs
ZCBiZSB0aGF0IE1DTEsgY2FuIGJlIGF0IG1vc3Qgc29tZSBtdWx0aXBsZSBvZg0KPiBMUkNMSyBv
ciBzb21ldGhpbmcgc2ltaWxhciAoYXJlIGFsbCB0aGUgb3RoZXIgZGl2aWRlcnMgaW4gdGhlIGNo
aXAgc2V0DQo+IHNlbnNpYmx5IGZvciB0aGUgZnVsbCBzY2FsZSBNQ0xLPykuICBJbiBhbnkgY2Fz
ZSB5b3UncmUgY2xlYXJseSBhd2FyZSBvZg0KPiBhIHNwZWNpZmljIGNhc2Ugd2hlcmUgaXQgbmVl
ZHMgdG8gYmUgZGl2aWRlZCBkb3duIHdoaWNoIGNhbiBiZQ0KPiBpZGVudGlmaWVkIGV2ZW4gaWYg
eW91J3JlIGNvbmNlcm5lZCBhYm91dCBkaXZpZGluZyBkb3duIGZvciBvdGhlciBjYXNlcy4NCg0K
SW4gcHJhY3RpY2Ugbm8gZHQgcHJvcGVydHkgaXMgbmVlZGVkLiBXZSBzdXBwb3J0IDQ4TSBtY2xr
LCBiYXNlZCBvbiBlbmFibGluZw0KTUNMSyBkaXZpZGVkIGJ5IDIgZm9yIG1jbGsgZ3JlYXRlciB0
aGFuIDI0TSAuIFlvdSBtYXkgd2FudCBjb2RlIGxpa2UgdGhpczoNCi8qIGVuYWJsaW5nICBtY2xr
IGRpdmlkZWQgYnkgMiBmb3IgbWNsayA+IDI0TSAqLw0KaWYgKGVzODMxNi0+c3lzY2xrID4gMjQw
MDAwMDApDQogICAgbWNsa19kaXZfb3B0aW9uID0gdHJ1ZTsNCg==
