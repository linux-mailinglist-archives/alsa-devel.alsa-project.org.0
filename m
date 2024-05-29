Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F4F8D2DF5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2024 09:16:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B1B8846;
	Wed, 29 May 2024 09:16:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B1B8846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716966978;
	bh=dtl6IvVIcy95ErncD4IjxYkJnnlytniayWsfALbzAI0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QK8pBvvaLWJmRUya3bL++rZDqpZ5SK2oeadJj67MfDxBAySHoJTxO7hekgd0lA6X9
	 Rc4TMycj2LzA9BS/ULokhdBuw6M+pCCQL91UDLaNtg8yRAdcR0JiOd26+XFAhKlL0D
	 r5NH6Ii/elytBKUX30ZX3RQNmkjBqsN2ch/hExB8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D5F8F805AC; Wed, 29 May 2024 09:15:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3455F8057A;
	Wed, 29 May 2024 09:15:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CB8DF80149; Wed, 29 May 2024 09:12:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EA8AF800BA
	for <alsa-devel@alsa-project.org>; Wed, 29 May 2024 09:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EA8AF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=AE4OmqwQ
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44T7CU7Z030585;
	Wed, 29 May 2024 02:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716966750;
	bh=dtl6IvVIcy95ErncD4IjxYkJnnlytniayWsfALbzAI0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=AE4OmqwQ5ttpRxtYNP8kLyQ6G+l0QLJW5EvPjDHrX+TV3ECoVhC4XtIcWJcS+M5ED
	 JpPsI9J/vp6GWMlxMMhhxJG5pqUFf4xcA28SlqKA9aR2lnZlE4hP1jKxnXpcKl+oQP
	 8k9s+VlWDGDOSarArZ3dpQxXj54TBE4U82iLk7H8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44T7CUGF086277
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 May 2024 02:12:30 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 29
 May 2024 02:12:30 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Wed, 29 May 2024 02:12:30 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "13916275206@139.com" <13916275206@139.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "Salazar, Ivan"
	<i-salazar@ti.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Chadha, Jasjot Singh" <j-chadha@ti.com>,
        "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
        "Yue, Jaden"
	<jaden-yue@ti.com>,
        "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>,
        "Rao, Dipa" <dipa@ti.com>, "Lu, Kevin"
	<kevin-lu@ti.com>,
        "yuhsuan@google.com" <yuhsuan@google.com>,
        "tiwai@suse.de"
	<tiwai@suse.de>, "Xu, Baojun" <baojun.xu@ti.com>,
        "soyer@irl.hu"
	<soyer@irl.hu>,
        "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
        "judyhsiao@google.com" <judyhsiao@google.com>,
        "Navada Kanyana, Mukund"
	<navada@ti.com>,
        "cujomalainey@google.com" <cujomalainey@google.com>,
        "Kutty,
 Aanya" <aanya@ti.com>,
        "Mahmud, Nayeem" <nayeem.mahmud@ti.com>
Subject: RE: [EXTERNAL] Re: [PATCH v2] ASoc: tas2781: Playback can work when
 only RCA binary loading without dsp firmware loading
Thread-Topic: [EXTERNAL] Re: [PATCH v2] ASoc: tas2781: Playback can work when
 only RCA binary loading without dsp firmware loading
Thread-Index: AQHarkWK7iKbbU+59EqlRKOrGPAfoLGrbykAgAJhvRA=
Date: Wed, 29 May 2024 07:12:29 +0000
Message-ID: <c55a356b2ab0452db81dbcc36ab36b65@ti.com>
References: <20240525014727.197-1-shenghao-ding@ti.com>
 <6a8ab4f6-63be-4284-814a-d853faf000b5@linux.intel.com>
In-Reply-To: <6a8ab4f6-63be-4284-814a-d853faf000b5@linux.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.14.171]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: SELGCM3ZEGFWBUXMPRWF6Q2EPWANNUYA
X-Message-ID-Hash: SELGCM3ZEGFWBUXMPRWF6Q2EPWANNUYA
X-MailFrom: shenghao-ding@ti.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SELGCM3ZEGFWBUXMPRWF6Q2EPWANNUYA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBNYXkgMjcsIDIwMjQgOTo0NCBQTQ0KPiBUbzogRGluZywgU2hlbmdoYW8gPHNoZW5naGFv
LWRpbmdAdGkuY29tPjsgYnJvb25pZUBrZXJuZWwub3JnDQo+IENjOiBhbmRyaXkuc2hldmNoZW5r
b0BsaW51eC5pbnRlbC5jb207IGxnaXJkd29vZEBnbWFpbC5jb207DQo+IHBlcmV4QHBlcmV4LmN6
OyAxMzkxNjI3NTIwNkAxMzkuY29tOyBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7DQo+IFNh
bGF6YXIsIEl2YW4gPGktc2FsYXphckB0aS5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyBDaGFkaGEsDQo+IEphc2pvdCBTaW5naCA8ai1jaGFkaGFAdGkuY29tPjsgbGlhbS5yLmdp
cmR3b29kQGludGVsLmNvbTsgWXVlLCBKYWRlbg0KPiA8amFkZW4teXVlQHRpLmNvbT47IHl1bmct
Y2h1YW4ubGlhb0BsaW51eC5pbnRlbC5jb207IFJhbywgRGlwYQ0KPiA8ZGlwYUB0aS5jb20+OyBM
dSwgS2V2aW4gPGtldmluLWx1QHRpLmNvbT47IHl1aHN1YW5AZ29vZ2xlLmNvbTsNCj4gdGl3YWlA
c3VzZS5kZTsgWHUsIEJhb2p1biA8YmFvanVuLnh1QHRpLmNvbT47IHNveWVyQGlybC5odTsNCj4g
QmFvanVuLlh1QGZwdC5jb207IGp1ZHloc2lhb0Bnb29nbGUuY29tOyBOYXZhZGEgS2FueWFuYSwg
TXVrdW5kDQo+IDxuYXZhZGFAdGkuY29tPjsgY3Vqb21hbGFpbmV5QGdvb2dsZS5jb207IEt1dHR5
LCBBYW55YQ0KPiA8YWFueWFAdGkuY29tPjsgTWFobXVkLCBOYXllZW0gPG5heWVlbS5tYWhtdWRA
dGkuY29tPg0KPiBTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbUEFUQ0ggdjJdIEFTb2M6IHRhczI3
ODE6IFBsYXliYWNrIGNhbiB3b3JrIHdoZW4NCj4gb25seSBSQ0EgYmluYXJ5IGxvYWRpbmcgd2l0
aG91dCBkc3AgZmlybXdhcmUgbG9hZGluZw0KPiANCj4gT24gNS8yNC8yNCAyMDrigIo0NywgU2hl
bmdoYW8gRGluZyB3cm90ZTogPiBJbiBvbmx5IFJDQSBiaW5hcnkgbG9hZGluZyBjYXNlLA0KPiBv
bmx5IGRlZmF1bHQgZHNwIHByb2dyYW0gaW5zaWRlIHRoZSA+IGNoaXAgd2lsbCBiZSB3b3JrLiBX
aGF0IGRvZXMgJ1JDQScNCj4gc3RhbmQgZm9yPyBBbHNvIGNsYXJpZnkgdGhlIGNvbW1pdCB0aXRs
ZSB3aXRob3V0IGRvdWJsZSBuZWdhdGl2ZXMsIGUu4oCKZy4gIkVuYWJsZQ0KPiBSQ0EtYmFzZWQg
WmpRY21RUllGcGZwdEJhbm5lclN0YXJ0IFRoaXMgbWVzc2FnZSB3YXMgc2VudCBmcm9tIG91dHNp
ZGUNCj4gb2YgVGV4YXMgSW5zdHJ1bWVudHMuDQo+IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzb3VyY2Ugb2YgdGhpcw0KPiBl
bWFpbCBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLiBJZiB5b3Ugd2lzaCB0byByZXBvcnQg
dGhpcyBtZXNzYWdlIHRvIElUDQo+IFNlY3VyaXR5LCBwbGVhc2UgZm9yd2FyZCB0aGUgbWVzc2Fn
ZSBhcyBhbiBhdHRhY2htZW50IHRvDQo+IHBoaXNoaW5nQGxpc3QudGkuY29tDQo+IA0KPiBaalFj
bVFSWUZwZnB0QmFubmVyRW5kDQo+IA0KPiANCj4gT24gNS8yNC8yNCAyMDo0NywgU2hlbmdoYW8g
RGluZyB3cm90ZToNCj4gPiBJbiBvbmx5IFJDQSBiaW5hcnkgbG9hZGluZyBjYXNlLCBvbmx5IGRl
ZmF1bHQgZHNwIHByb2dyYW0gaW5zaWRlIHRoZQ0KPiA+IGNoaXAgd2lsbCBiZSB3b3JrLg0KPiAN
Ci4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4NCj4gPiAtCWlmICh0YXNfcHJpdi0+Zndfc3RhdGUgPT0gVEFTREVWSUNF
X0RTUF9GV19GQUlMKSB7DQo+ID4gLQkJLypJZiBEU1AgRlcgZmFpbCwga2NvbnRyb2wgd29uJ3Qg
YmUgY3JlYXRlZCAqLw0KPiA+IC0JCXRhc2RldmljZV9jb25maWdfaW5mb19yZW1vdmUodGFzX3By
aXYpOw0KPiA+ICsJaWYgKHRhc19wcml2LT5md19zdGF0ZSA9PSBUQVNERVZJQ0VfUkNBX0ZXX09L
KSB7DQo+ID4gKwkJLypJZiBEU1AgRlcgZmFpbCwgRFNQIGtjb250cm9sIHdvbid0IGJlIGNyZWF0
ZWQgKi8NCj4gDQo+IEl0IGxvb2tzIGxpa2UgeW91J3JlIG5vIGxvbmdlciB1c2luZyBQRU5ESU5H
IGFuZCBGQUlMIHN0YXRlcz8NCj4gVGhlIHN0YXRlIG1hY2hpbmUgaXMgYmVjb21pbmcgcmVhbGx5
IGhhcmQgdG8gZm9sbG93Lg0KUEVORElORyBhbmQgRkFJTCBzdGF0ZXMgaGF2ZSBiZWVuIHVzZWQg
aW4gSERBLWJhc2VkIHRhczI1NjMvdGFzMjc4MSBkcml2ZXINCg0KPiANCj4gPiAgCQl0YXNkZXZp
Y2VfZHNwX3JlbW92ZSh0YXNfcHJpdik7DQo+ID4gIAl9DQo+ID4gIAltdXRleF91bmxvY2soJnRh
c19wcml2LT5jb2RlY19sb2NrKTsNCj4gPiBAQCAtNDY2LDE0ICs0NzIsMTQgQEAgc3RhdGljIGlu
dCB0YXNkZXZpY2Vfc3RhcnR1cChzdHJ1Y3QNCj4gPiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3Ry
ZWFtLCAgew0KPiA+ICAJc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb2RlYyA9IGRhaS0+Y29t
cG9uZW50Ow0KPiA+ICAJc3RydWN0IHRhc2RldmljZV9wcml2ICp0YXNfcHJpdiA9DQouLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uDQo=
