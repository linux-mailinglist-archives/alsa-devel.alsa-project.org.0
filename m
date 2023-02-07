Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 326AB68E418
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:02:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C17E0843;
	Wed,  8 Feb 2023 00:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C17E0843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675810950;
	bh=1q7owbSL5G1OrMtZAq52aG8r6Tom/34803RcgTxouE8=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WSSdk1XZuokk+7fWOIryHQAdMOgAQIRaATF5psZEdcAiaeh+AP+xklK/TewY3gHor
	 +BzuCdyniAHDJPBvDTTWvbQXzeCSf3M6SoXBGtEyi3JCO7Vpg7KXMGGtUpvs8zjHJe
	 4/0GMJcvv/aldZDwHs2Ehtv7ojeB50e9mFvmaofo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BC99F8012B;
	Wed,  8 Feb 2023 00:01:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 268DDF80518; Wed,  8 Feb 2023 00:01:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C23FF8012B
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:01:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C23FF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=N0cro9P2
Received: from [192.168.86.246]
 (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2C934660208F;
	Tue,  7 Feb 2023 17:03:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675789413;
	bh=wXQQ9hKZcEEkrcDxicfFkwdm2d8cPyM0mRqhWTqAu6Y=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=N0cro9P2kAQnSsWLmuFFbK3gcDv0FZGpHvAI+aLTLUDMBB68kJrNayxCDhdlMmZz+
	 yWCnkvqvSJKpky5rK2mwNKhHpEZzpFnpErscf4Yf0hC0deRzrz6x0d7K+aqvvmM9JX
	 I5UunF0z12QtQUXu6KZoKF13rI9PUF/2uqN8LzwrzNh6TlRMzQ8LZEtEWv4eR8cXxT
	 YrqLDoeFglAsx8Knhlgx5NCLPQclycuSG0rbHv+MA0oegwT52QEz4d0kfNMD/3nWKx
	 hsY9NTzq8cN8Zz03fGGkU7Iz4OQ38hiCJw72phfM5rgmDXUNRwfS258FHjLSwTVN86
	 kt+EUCcTrwRTw==
Message-ID: <e8aa571a-2d96-47da-34f0-47cc048dc655@collabora.com>
Date: Tue, 7 Feb 2023 17:03:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: lucas.tanure@collabora.com
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Rhodes <david.rhodes@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH 2/2] Documentation: cs35l41: Shared boost properties
References: <20230207104021.2842-1-lucas.tanure@collabora.com>
 <20230207104021.2842-3-lucas.tanure@collabora.com>
 <44faeca1-94c9-4423-d87a-03d80e286812@linaro.org>
 <e7257f9a-86c5-74e8-c538-6f6d2ba13274@collabora.com>
 <44c7274f-8a5e-0235-413a-6c3260018601@linaro.org>
 <4efe9796-6d3e-09d1-d5f7-cfb25a439061@collabora.com>
 <56ce2617-4fd1-d597-a4dc-918654cdd3f6@linaro.org>
In-Reply-To: <56ce2617-4fd1-d597-a4dc-918654cdd3f6@linaro.org>
Message-ID-Hash: O5PK6VJF22NJWWEIO3UUHBL4G7NQZOJS
X-Message-ID-Hash: O5PK6VJF22NJWWEIO3UUHBL4G7NQZOJS
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O5PK6VJF22NJWWEIO3UUHBL4G7NQZOJS/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMi83LzIzIDQ6NDjigK9QTSwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxv
d3NraUBsaW5hcm8ub3JnPiB3cm90ZToNCj4gT24gMDcvMDIvMjAyMyAxNzozNCwgTHVjYXMgVGFu
dXJlIHdyb3RlOg0KPiA+IE9uIDA3LTAyLTIwMjMgMTY6MTMsIEtyenlzenRvZiBLb3psb3dza2kg
d3JvdGU6DQo+ID4+IE9uIDA3LzAyLzIwMjMgMTY6NDYsIEx1Y2FzIFRhbnVyZSB3cm90ZToNCj4g
Pj4+Pj4gKyAgICAgIFNoYXJlZCBib29zdCBhbGxvd3MgdHdvIGFtcGxpZmllcnMgdG8gc2hhcmUg
YSBzaW5nbGUgYm9vc3QgY2lyY3VpdCBieQ0KPiA+Pj4+PiArICAgICAgY29tbXVuaWNhdGluZyBv
biB0aGUgTURTWU5DIGJ1cy4gVGhlIHBhc3NpdmUgYW1wbGlmaWVyIGRvZXMgbm90IGNvbnRyb2wN
Cj4gPj4+Pj4gKyAgICAgIHRoZSBib29zdCBhbmQgcmVjZWl2ZXMgZGF0YSBmcm9tIHRoZSBhY3Rp
dmUgYW1wbGlmaWVyLiBHUElPMSBzaG91bGQgYmUNCj4gPj4+Pj4gKyAgICAgIGNvbmZpZ3VyZWQg
Zm9yIFN5bmMgd2hlbiBzaGFyZWQgYm9vc3QgaXMgdXNlZC4gU2hhcmVkIGJvb3N0IGlzIG5vdA0K
PiA+Pj4+PiArICAgICAgY29tcGF0aWJsZSB3aXRoIEV4dGVybmFsIGJvb3N0LiBBY3RpdmUgYW1w
bGlmaWVyIHJlcXVpcmVzDQo+ID4+Pj4+ICsgICAgICBib29zdC1wZWFrLW1pbGxpYW1wLCBib29z
dC1pbmQtbmFub2hlbnJ5IGFuZCBib29zdC1jYXAtbWljcm9mYXJhZC4NCj4gPj4+Pj4gICAgICAg
ICAgIDAgPSBJbnRlcm5hbCBCb29zdA0KPiA+Pj4+PiAgICAgICAgICAgMSA9IEV4dGVybmFsIEJv
b3N0DQo+ID4+Pj4+ICsgICAgICAyID0gUmVzZXJ2ZWQNCj4gPj4+Pg0KPiA+Pj4+IEhvdyBiaW5k
aW5nIGNhbiBiZSByZXNlcnZlZD8gRm9yIHdoYXQgYW5kIHdoeT8gRHJvcC4gMiBpcyBzaGFyZWQg
YWN0aXZlLA0KPiA+Pj4+IDMgaXMgc2hhcmVkIHBhc3NpdmUuDQo+ID4+PiAyIElzIHNoYXJlZCBi
b29zdCB3aXRob3V0IFZTUEsgc3dpdGNoLCBhIG1vZGUgbm90IHN1cHBvcnRlZCBmb3IgbmV3DQo+
ID4+PiBzeXN0ZW0gZGVzaWducy4gQnV0IHRoZXJlIGlzIGxhcHRvcHMgdXNpbmcgaXQsIHNvIHdl
IG5lZWQgdG8ga2VlcA0KPiA+Pj4gc3VwcG9ydGluZyBpbiB0aGUgZHJpdmVyLg0KPiA+Pg0KPiA+
PiBUaGF0J3Mgbm90IHRoZSBhbnN3ZXIuIDIgaXMgbm90aGluZyBoZXJlLCBzbyBpdCBjYW5ub3Qg
YmUgcmVzZXJ2ZWQuDQo+ID4+IEFyZW4ndCB5b3UgbWl4aW5nIG5vdyBzb21lIHJlZ2lzdGVyIHZh
bHVlIHdpdGggYmluZGluZ3M/DQo+ID4+DQo+ID4+IEJlc3QgcmVnYXJkcywNCj4gPj4gS3J6eXN6
dG9mDQo+ID4+DQo+ID4+DQo+ID4gSSBoYXZlIGFkZGVkIGEgbmV3IHBhdGNoIHdpdGggcHJvcHBl
ciBkb2N1bWVudGF0aW9uLg0KPiA+IEFuZCBJIHdvdWxkIGxpa2UgdG8gdXNlIDMgYW5kIDQgZm9y
IHNoYXJlZCBib29zdCBhcw0KPiA+IENTMzVMNDFfRVhUX0JPT1NUX05PX1ZTUEtfU1dJVENIIGFs
cmVhZHkgZXhpc3QgYXMgMiBhbmQgaXMgdXNlZCBpbiB0aGUNCj4gPiBjdXJyZW50IGRyaXZlci4N
Cj4gDQo+IEkgZG9uJ3Qgc2VlIENTMzVMNDFfRVhUX0JPT1NUX05PX1ZTUEtfU1dJVENIIGluIHRo
ZSBiaW5kaW5ncy4NCj4gDQo+ID4gVGhlIGxhcHRvcCB0aGF0IHVzZXMgQ1MzNUw0MV9FWFRfQk9P
U1RfTk9fVlNQS19TV0lUQ0ggZG9lc24ndCBoYXZlIHRoZQ0KPiA+IHByb3BlcnR5ICJjaXJydXMs
Ym9vc3QtdHlwZSIsIGJ1dCB0byBtYWtlIGV2ZXJ5dGhpbmcgY29uc2lzdGVudCBJIHdvdWxkDQo+
ID4gcHJlZmVyIHRvIHVzZSAzIGFuZCA0IGZvciB0aGUgbmV3IGJvb3N0IHR5cGVzLg0KPiA+IElz
IHRoYXQgb2sgd2l0aCB5b3U/DQo+IA0KPiBJIGRvbid0IHNlZSBob3cgaXQgaXMgcmVsYXRlZC4g
VGhlIHZhbHVlIGRvZXMgbm90IGV4aXN0LCBzbyB3aGV0aGVyDQo+IGxhcHRvcCBoYXMgdGhhdCBw
cm9wZXJ0eSBvciBub3QsIGlzIG5vdCByZWFsbHkgcmVsYXRlZCwgcmlnaHQ/DQo+IA0KPiBCZXN0
IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCj4gDQpUaGUgdmFsdWUgZG9lcyBleGlzdCBpbiB0
aGUgY29kZSwgYnV0IG5vIGRldmljZSBzaG91bGQgaGF2ZSB0aGF0IGluIEFDUEkvRFRCLCBzbyB5
ZXMgdGhlIHZhbHVlIGRvZXNuJ3QgZXhpc3QgZm9yIEFDUEkvRFRCIHB1cnBvc2VzLg0KSSBjYW4g
Y2hhbmdlIENTMzVMNDFfRVhUX0JPT1NUX05PX1ZTUEtfU1dJVENIIHRvIGFub3RoZXIgdmFsdWUs
IGxpa2UgOTksIGFuZCB1c2UgMiBhbmQgMyBmb3Igc2hhcmVkIGJvb3N0Lg0KSSB3aWxsIHJlLXN1
Ym1pdCB0aGF0IHdpdGggdjMuDQpJcyB0aGF0IG9rIHdpdGggeW91Pw0KDQpUaGFua3MNCkx1Y2Fz
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2Et
ZGV2ZWwgbWFpbGluZyBsaXN0IC0tIGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpUbyB1bnN1
YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGFsc2EtZGV2ZWwtbGVhdmVAYWxzYS1wcm9qZWN0Lm9y
Zwo=
