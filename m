Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C4EC3F06C
	for <lists+alsa-devel@lfdr.de>; Fri, 07 Nov 2025 09:51:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B215A60204;
	Fri,  7 Nov 2025 09:51:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B215A60204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762505511;
	bh=hkklIKGngmK1eQDNMCHYKmgoQzzKuk9rx26oK4ABn3w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p2UbW0JxmzPRfDU/vju1yGkVwKchyp+U3gjZwxv/paln/6qXryqpNsKsXdrc0Ynqx
	 kQYP2qVMupWiyorE1bNeVhvXuf46OVgtYJHfmiq2Do0yIqDmk9n6MKubzBB/72NpZf
	 6zDhZu+pGO1w4l5O9sBGG9hX4G7Wc/HkGpusoazs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAFB0F805CB; Fri,  7 Nov 2025 09:51:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DCF8F805C8;
	Fri,  7 Nov 2025 09:51:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2D86F8055B; Fri,  7 Nov 2025 09:51:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF02FF80100
	for <alsa-devel@alsa-project.org>; Fri,  7 Nov 2025 09:50:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF02FF80100
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=aN/WA5f8
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5A78olr07339044,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1762505447; bh=hkklIKGngmK1eQDNMCHYKmgoQzzKuk9rx26oK4ABn3w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=aN/WA5f8TuBxWeQQJzJV+3qDXvKZJ1vyGee/ZyqMqFfCVt986OwgR501+RnUtBOST
	 i4eEYfTE//GZQJOVmTOKUtJBFqtLiWjXHPhC3VmV7C4h/ug+xCdIwFAv9NHjDw+vag
	 qehVjCIgRhcVpJHDTmxI1yoPILcqmnfKPeRMujgDks1z7FCp+hzQNbp9Kz34P9+KJj
	 +3HqgKVPMXNF5UjJlq9Nr7vX/idfloo7+BdNNTusjVUc4zqSsuVKSMpiYK+kTjKleq
	 eY6tdHxZ3+ZDqZN3nerY/4CWxUQCRe5gPPaE7jYvh1JCffzaQJODkRP9zzkRhOmyNs
	 rtyM4ZIx8XVBA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 5A78olr07339044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Nov 2025 16:50:47 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 7 Nov 2025 16:50:47 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 7 Nov 2025 16:50:47 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::744:4bc9:832c:9b7e%10]) with mapi id
 15.02.1544.027; Fri, 7 Nov 2025 16:50:47 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: "'Cezary Rojewski'" <cezary.rojewski@intel.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "Flove(HsinFu)" <flove@realtek.com>,
        =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
	<shumingf@realtek.com>,
        Jack Yu <jack.yu@realtek.com>,
        =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>
Subject: RE: [PATCH v6 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
Thread-Topic: [PATCH v6 1/2] ASoC: rt5575: Add the codec driver for the
 ALC5575
Thread-Index: AQHcSjhKIYM5ECNrEkyw0KBJr/3vM7Tk7P2AgAHYPPA=
Date: Fri, 7 Nov 2025 08:50:46 +0000
Message-ID: <d8f14cabf8c744e3be9a01706a585fa3@realtek.com>
References: <20251031073245.3629060-1-oder_chiou@realtek.com>
 <550e7259-c371-431d-b515-c1e49b0ddd42@intel.com>
In-Reply-To: <550e7259-c371-431d-b515-c1e49b0ddd42@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: OX6JBS4IENR73ML4S5XJ7KK4AWROUXC4
X-Message-ID-Hash: OX6JBS4IENR73ML4S5XJ7KK4AWROUXC4
X-MailFrom: oder_chiou@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OX6JBS4IENR73ML4S5XJ7KK4AWROUXC4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDZXphcnkgUm9qZXdza2kgPGNl
emFyeS5yb2pld3NraUBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciA2LCAy
MDI1IDU6NTggUE0NCj4gVG86IE9kZXIgQ2hpb3UgPG9kZXJfY2hpb3VAcmVhbHRlay5jb20+DQo+
IENjOiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IEZsb3ZlKEhzaW5GdSkgPGZsb3ZlQHJl
YWx0ZWsuY29tPjsgU2h1bWluZw0KPiBb6IyD5pu46YqYXSA8c2h1bWluZ2ZAcmVhbHRlay5jb20+
OyBKYWNrIFl1IDxqYWNrLnl1QHJlYWx0ZWsuY29tPjsgRGVyZWsgW+aWuQ0KPiDlvrfnvqldIDxk
ZXJlay5mYW5nQHJlYWx0ZWsuY29tPjsgYnJvb25pZUBrZXJuZWwub3JnOyBsZ2lyZHdvb2RAZ21h
aWwuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMS8yXSBBU29DOiBydDU1NzU6IEFkZCB0
aGUgY29kZWMgZHJpdmVyIGZvciB0aGUNCj4gQUxDNTU3NQ0KPiANCj4gVGhlIHBhdGNoIGxvb2tz
IG11Y2ggbmljZXIuIFRoYW5rIHlvdSBmb3IgdGhlIHVwZGF0ZSwgT2Rlci4gTGV0J3MgbW92ZQ0K
PiB0byByb3VuZCAyLg0KDQpUaGFua3MgdmVyeSBtdWNoIGZvciB0aGUgc3VnZ2VzdGlvbnMuDQoN
Cj4gPiArfTsNCj4gPiArDQo+ID4gK3N0cnVjdCBydDU1NzVfc3BpX2J1cnN0X3dyaXRlIHsNCj4g
DQo+IE5hbWluZyBpcyB3ZWlyZCAtIGl0J3Mgbm90IGEgJ0JVUlNUX1dSSVRFJyBjb21tYW5kIHVu
dGlsIHRoZSAnY21kJyBmaWVsZA0KPiBzYXlzIHNvLiBJJ2QgcmF0aGVyIGhhdmUgdGhpcyBuYW1l
ZCAnc3RydWN0IHJ0NTU3NV9zcGlfY21kJyBhcyBpdHMNCj4gZGVzY3JpcHRpb24gYW5kIHVzYWdl
IHN1Z2dlc3RzLg0KDQpUaGUgc3RydWN0dXJlIGlzIG9ubHkgZm9yIHRoZSAnQlVSU1RfV1JJVEUn
IGNvbW1hbmQsIGFuZCBvdGhlciBjb21tYW5kcyBhcmUNCmRpZmZlcmVudCBzdHJ1Y3R1cmUuDQoN
Cj4gPiArDQo+ID4gKyAgICAgICAgICAgICBvZmZzZXQgKz0gUlQ1NTc1X1NQSV9CVUZfTEVOOw0K
PiA+ICsgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArRVhQ
T1JUX1NZTUJPTF9HUEwocnQ1NTc1X3NwaV9idXJzdF93cml0ZSk7DQo+ID4gKw0KPiA+ICtzdGF0
aWMgaW50IHJ0NTU3NV9zcGlfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkNCj4gPiArew0K
PiA+ICsgICAgIHJ0NTU3NV9zcGkgPSBzcGk7DQo+ID4gKw0KPiA+ICsgICAgIHJ0NTU3NV9zcGlf
cmVhZHkgPSB0cnVlOw0KPiANCj4gVGhpcyBsb29rcyB3ZWlyZC4gSWYgcnQ1NTc1X3NwaV9yZWFk
eSBpcyAndHJ1ZScgdW5jb25kaXRpb25hbGx5IG9uDQo+IHByb2JlKCksIHdoeSBub3QganVzdCBy
ZXBsYWNlIGl0IHdpdGggJyFydDU1NzVfc3BpJyBjaGVja3Mgb3INCj4gSVNfRVJSX09SX05VTEwo
cnQ1NTc1X3NwaSk/DQoNCklmIHRoZSBrZXJuZWwgZmFpbGVkIHRvIGFsbG9jYXRlIG1lbW9yeSBm
b3IgdGhlIHN0cnVjdHVyZSBvciBjb3VsZG4ndA0Kc3VjY2Vzc2Z1bGx5IG1hdGNoIHRoZSBkZXZp
Y2UsIHRoZSBwcm9iZSBmdW5jdGlvbiB3b3VsZCBub3QgYmUgY2FsbGVkLg0KDQo+ID4gKyNpZiBJ
U19FTkFCTEVEKENPTkZJR19TTkRfU09DX1JUNTU3NV9TUEkpDQo+ID4gK3N0YXRpYyB2b2lkIHJ0
NTU3NV9zcGlfZndfbG9hZGVkKGNvbnN0IHN0cnVjdCBmaXJtd2FyZSAqZncsIHZvaWQgKmNvbnRl
eHQpDQo+IA0KPiBUaGlzIGhhcyBzdGlsbCBub3QgYmVlbiBhZGRyZXNzZWQgc2luY2UgbXkgcHJl
dmlvdXMgcmV2aWV3LiBJIGRvIG5vdA0KPiB1bmRlcnN0YW5kIHRoZSBsb2dpYyBoZXJlLiBXZSBo
YXZlIGEgJ2NvbW1vbicgZmlsZSB5ZXQgZmlsbGVkIHBsYWd1ZWQgYnkNCj4gU1BJIHNwZWNpZmlj
cy4gT24gb25lIGhhbmQgd2UgaGF2ZSBydDU1NzVfc3BpX2J1cnN0X3dyaXRlKCkgZXhwb3J0ZWQg
YW5kDQo+IHBhcnQgb2YgU1BJLXNwZWNpZmljIGVudGl0eSwgb24gdGhlIG90aGVyIHdlIGhhdmUg
cnQ1NTc1X3NwaV9md19sb2FkZWQoKQ0KPiBoaWRkZW4gaGVyZS4NCj4gDQo+IERlc2lnbiBpZiBv
ZmYsIGNob29zZSBvbmUgb3IgdGhlIG90aGVyLiBJbiBnZW5lcmFsLCBwcmVmZXIgdGhlIGNvbW1v
bg0KPiBjb2RlIHRvIGJlIGFjdHVhbGx5IF9jb21tb25fLiBNYWtlcyBpdCBlYXNpZXIgdG8gUmVh
bHRlayBhbmQgbm9uLVJlYWx0ZWsNCj4gdG8gbWFpbnRhaW4gdGhlIGNvZGUgZ29pbmcgZm9yd2Fy
ZC4gTGVhdmUgc3BlY2lmaWNzIHdpdGhpbiB0aGUNCj4gc3BlY2lmaWNzLWZpbGVzLg0KDQpUaGUg
ZnVuY3Rpb24gbmFtZSB3aWxsIGJlIGNoYW5nZWQgYXMgcnQ1NTc1X2Z3X2xvYWRfYnlfc3BpLg0K
DQo=
