Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58254894BD0
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:50:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E79B2BB2;
	Tue,  2 Apr 2024 08:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E79B2BB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040628;
	bh=VZ2QeI6UW1LLEnVfDsPK5zBwtECVBwE0Sa600vTVQxM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qtjexlK+wY73QduBofOLbKHzkufbgimFCzGxsJdh3Ryab1on06q5setPCJWkCzrhB
	 cynlXboAUWACDIl3TNNF5pYMlz1DQTkAOEVOb1UWeiJfwJRt5EoKbDqLkFFD0MfEI7
	 DWcoesKxV1eRzx94tnxSVt9bQ63nM1dR4x1cWxBk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8637EF80636; Tue,  2 Apr 2024 08:48:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98CC8F806A8;
	Tue,  2 Apr 2024 08:48:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05C04F801EB; Tue, 26 Mar 2024 06:31:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HTML_MESSAGE,RDNS_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by alsa1.perex.cz (Postfix) with SMTP id 07AABF801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 06:30:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07AABF801EB
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 6A48760695A66;
	Tue, 26 Mar 2024 13:30:05 +0800 (CST)
Message-ID: <e70c65b0-2e0d-613f-4f05-bda61377fc01@nfschina.com>
Date: Tue, 26 Mar 2024 13:30:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] ASoC: sti: uniperif: fix the undefined bitwise shift
 behavior problem
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: arnaud.pouliquen@foss.st.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, nathan@kernel.org, ndesaulniers@google.com,
 morbo@google.com, justinstitt@google.com, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <5d850276-a872-45fb-9df2-2b72479787be@moroto.mountain>
X-MailFrom: suhui@nfschina.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FXVLW5YAH5HAQ3BBOBGXRSZZ6YYV7JQU
X-Message-ID-Hash: FXVLW5YAH5HAQ3BBOBGXRSZZ6YYV7JQU
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:47:35 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGksDQpPbiAyMDI0LzMvMjUgMjI6MjUsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IE9uIE1vbiwg
TWFyIDI1LCAyMDI0IGF0IDExOjQwOjMzQU0gKzA4MDAsIFN1IEh1aSB3cm90ZToNCj4+IC0tLSBh
L3NvdW5kL3NvYy9zdGkvdW5pcGVyaWYuaA0KPj4gKysrIGIvc291bmQvc29jL3N0aS91bmlwZXJp
Zi5oDQo+PiBAQCAtMTIsMTcgKzEyLDI4IEBADQo+PiAgIA0KPj4gICAjaW5jbHVkZSA8c291bmQv
ZG1hZW5naW5lX3BjbS5oPg0KPj4gICANCj4+ICsjZGVmaW5lIFNSX1NISUZUKGEsIGIpCQkoe3Vu
c2lnbmVkIGxvbmcgX19hID0gKGEpOyBcDQo+PiArCQkJCXVuc2lnbmVkIGludCBfX2IgPSAoYik7
IFwNCj4+ICsJCQkJX19iIDwgQklUU19QRVJfTE9ORyA/IFwNCj4+ICsJCQkJX19hID4+IF9fYiA6
IDA7IH0pDQo+IFRoZSBjb2RlIGRlZmluaXRlbHkgbG9va3MgYnVnZ3ksIGJ1dCBob3cgZG8geW91
IGtub3cgeW91ciBzb2x1dGlvbiBpcw0KPiBjb3JyZWN0IHdpdGhvdXQgdGVzdGluZyBpdD8NCg0K
SSBvbmx5IHRlc3Qgc29tZSBjYXNlcyBsaWtlIFNSX1NISUZUKDEsIC0xKSxTUl9TSElGVCg4LDEp
LCBpdCBzZWVtcyBoYXZlIGEgcmlnaHQgcmVzdWx0Lg0KT2gsIG1heWJlIEkgdW5kZXJzdGFuZCBp
dC4gV2hlbiAnYScgaXMgYSBuZWdhdGl2ZSB2YWx1ZSBsaWtlICcoaW50KS0xJywgU1JfU0hJRlQo
YSwgYikgd2lsbA0KaGF2ZSBzb21lIGJ1Z3MuDQoNCj4NCj4gSSBkb24ndCBsaWtlIHRoaXMgc29s
dXRpb24gYXQgYWxsLiAgVGhpcyBpcyBiYXNpY2FsbHkgYSByZWFsbHkNCj4gY29tcGxpY2F0ZWQg
d2F5IG9mIHdyaXRpbmcgImlmIChiICE9IC0xKSIuICBJbnN0ZWFkIG9mIGNoZWNraW5nIGZvciAt
MSwNCj4gdGhlIGJldHRlciBzb2x1dGlvbiBpcyB0byBqdXN0IHN0b3AgcGFzc2luZyAtMS4gIElm
IHlvdSByZXZpZXcgdGhhdA0KPiBmaWxlLCBldmVyeSB0aW1lIGl0IHVzZXMgIi0xIiB0aGF0J3Mg
ZWl0aGVyIGRlYWQgY29kZSBvciBhIGJ1Zy4uLg0KDQpBZ3JlZWTvvIxzb21lIGFyZSBkZWFkIGNv
ZGVzIHdoaWNoIGNhbiBiZSByZW1vdmVkLCBidXQgd2hhdCBzaG91bGQgd2UgZG8gd2l0aCB0aGUN
CmZvbGxvd2luZyBlcnJvciBjb2RlcyBsaWtlIHRoaXMgb25lPw0KDQpzb3VuZC9zb2Mvc3RpL3Vu
aXBlcmlmLmgNCiAgNDE1ICNkZWZpbmUgVU5JUEVSSUZfQ09ORklHX0JBQ0tfU1RBTExfUkVRX1NI
SUZUKGlwKSBcDQogIDQxNiAgICAgICAgICgoaXApLT52ZXIgPCBTTkRfU1RfVU5JUEVSSUZfVkVS
U0lPTl9VTklfUExSX1RPUF8xXzAgPyA3IDogLTEpDQogIC4uLg0KICA0MjMgI2RlZmluZSBTRVRf
VU5JUEVSSUZfQ09ORklHX0JBQ0tfU1RBTExfUkVRX0RJU0FCTEUoaXApIFwNCiAgNDI0ICAgICAg
ICAgU0VUX1VOSVBFUklGX1JFRyhpcCwgXA0KICA0MjUgICAgICAgICAgICAgICAgIFVOSVBFUklG
X0NPTkZJR19PRkZTRVQoaXApLCBcDQogIDQyNiAgICAgICAgICAgICAgICAgVU5JUEVSSUZfQ09O
RklHX0JBQ0tfU1RBTExfUkVRX1NISUZUKGlwKSwgXA0KICAgICAgICAgICAgICAgICAgICAgXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4NCkhvdyBhYm91dCB0aGlzIHNv
bHV0aW9uPyBJZiB0aGUgY29uZGl0aW9uIGlzIGZhbHNlLCBqdXN0IHNraXAgaXQuDQoNCkBAIC00
MTIsOCArNDEyLDcgQEANCiAgICAgICAgICAgICAgICAgVU5JUEVSSUZfQ09ORklHX1JFUEVBVF9D
SExfU1RTX01BU0soaXApLCAxKQ0KICANCiAgLyogQkFDS19TVEFMTF9SRVEgKi8NCi0jZGVmaW5l
IFVOSVBFUklGX0NPTkZJR19CQUNLX1NUQUxMX1JFUV9TSElGVChpcCkgXA0KLSAgICAgICAoKGlw
KS0+dmVyIDwgU05EX1NUX1VOSVBFUklGX1ZFUlNJT05fVU5JX1BMUl9UT1BfMV8wID8gNyA6IC0x
KQ0KKyNkZWZpbmUgVU5JUEVSSUZfQ09ORklHX0JBQ0tfU1RBTExfUkVRX1NISUZUKGlwKSA3DQog
ICNkZWZpbmUgVU5JUEVSSUZfQ09ORklHX0JBQ0tfU1RBTExfUkVRX01BU0soaXApIDB4MQ0KICAj
ZGVmaW5lIEdFVF9VTklQRVJJRl9DT05GSUdfQkFDS19TVEFMTF9SRVEoaXApIFwNCiAgICAgICAg
IEdFVF9VTklQRVJJRl9SRUcoaXAsIFwNCkBAIC00MjEsMTAgKzQyMCwxMSBAQA0KICAgICAgICAg
ICAgICAgICBVTklQRVJJRl9DT05GSUdfQkFDS19TVEFMTF9SRVFfU0hJRlQoaXApLCBcDQogICAg
ICAgICAgICAgICAgIFVOSVBFUklGX0NPTkZJR19CQUNLX1NUQUxMX1JFUV9NQVNLKGlwKSkNCiAg
I2RlZmluZSBTRVRfVU5JUEVSSUZfQ09ORklHX0JBQ0tfU1RBTExfUkVRX0RJU0FCTEUoaXApIFwN
CisgICAgICAgKChpcCktPnZlciA8IFNORF9TVF9VTklQRVJJRl9WRVJTSU9OX1VOSV9QTFJfVE9Q
XzFfMCA/IC0xIDogXA0KICAgICAgICAgU0VUX1VOSVBFUklGX1JFRyhpcCwgXA0KICAgICAgICAg
ICAgICAgICBVTklQRVJJRl9DT05GSUdfT0ZGU0VUKGlwKSwgXA0KICAgICAgICAgICAgICAgICBV
TklQRVJJRl9DT05GSUdfQkFDS19TVEFMTF9SRVFfU0hJRlQoaXApLCBcDQotICAgICAgICAgICAg
ICAgVU5JUEVSSUZfQ09ORklHX0JBQ0tfU1RBTExfUkVRX01BU0soaXApLCAwKQ0KKyAgICAgICAg
ICAgICAgIFVOSVBFUklGX0NPTkZJR19CQUNLX1NUQUxMX1JFUV9NQVNLKGlwKSwgMCkpDQogICNk
ZWZpbmUgU0VUX1VOSVBFUklGX0NPTkZJR19CQUNLX1NUQUxMX1JFUV9FTkFCTEUoaXApIFwNCg0K
TWF5YmUgc2hvdWxkIHByaW50IHNvbWUgZXJyb3IgbG9nIGhlcmUuDQpJJ20gbm90IHN1cmUgYWJv
dXQgdGhlIHNhZmV0eSBvZiBza2lwcGluZyBTRVRfVU5JUEVSSUZfUkVHIHdoZW4gdGhlIGNvbmRp
dGlvbiBpcyBmYWxzZSwNCg0KV291bGQgaXQgYmUgYmV0dGVyIHRvIG1ha2UgdGhlIHJlc3VsdCBv
ZiB1bmRlZmluZWQgc2hpZnQgZXF1YWwgdG8gemVybz8NCg0KcmVnYXJkcywNClN1IEh1aQ0KICAN
Cg==
