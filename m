Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD3A914905
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 13:43:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E3D783E;
	Mon, 24 Jun 2024 13:42:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E3D783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719229388;
	bh=SciTnTEbsnJfT0rVQqYl7Yj98yDLsD7kqr/o0jvFwCQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pVeIqNN+ZQrrUsOKQIjz0VCoInNDJ29t59tGXbxvokYsSJknv6vrEqshomRzRJ9Bk
	 M+jCKMId4G4Xj6K0GnVkr3fhn5jGVfjseJBaXDTfVHOQvHrXAt6ckPgl+3Tij8MZI5
	 J2TYPboKL7SjsgGEcFN+rT8XgLtyo6yHXUxJfXI0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1B57F805BD; Mon, 24 Jun 2024 13:42:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBF06F805B0;
	Mon, 24 Jun 2024 13:42:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F29A9F80495; Mon, 24 Jun 2024 13:42:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83AC4F800ED
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 13:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83AC4F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=KbPieSv+
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45OBgChm044887;
	Mon, 24 Jun 2024 06:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719229332;
	bh=SciTnTEbsnJfT0rVQqYl7Yj98yDLsD7kqr/o0jvFwCQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=KbPieSv+fyXaLDsPihsQE+lhanZhEXOxmogN3J+6C+/jSM+vyMjVts3na99KzvAUj
	 oyH6k1ob3+uGbVD/5yL8VtFYSgAtq1eFKFTEMea8O0OxI/5nVBDk9H7E51U3G07C9G
	 iNRAUItZeS5fLPdF3HaeNEy71I6DY/aOOHf9iHGg=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45OBgCJx004871
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jun 2024 06:42:12 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Jun 2024 06:42:11 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Mon, 24 Jun 2024 06:42:11 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "13916275206@139.com"
	<13916275206@139.com>,
        "judyhsiao@google.com" <judyhsiao@google.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "Salazar, Ivan"
	<i-salazar@ti.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Chadha, Jasjot Singh" <j-chadha@ti.com>,
        "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
        "bard.liao@intel.com" <bard.liao@intel.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "Rao,
 Dipa" <dipa@ti.com>, "yuhsuan@google.com" <yuhsuan@google.com>,
        "tiwai@suse.de" <tiwai@suse.de>, "Xu, Baojun" <baojun.xu@ti.com>,
        "soyer@irl.hu" <soyer@irl.hu>,
 "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
        "Navada Kanyana, Mukund" <navada@ti.com>,
        "cujomalainey@google.com"
	<cujomalainey@google.com>,
        "Kutty, Aanya" <aanya@ti.com>,
        "Mahmud, Nayeem"
	<nayeem.mahmud@ti.com>
Subject: RE: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Add Calibration
 Kcontrols and tas2563 digtial gain for Chromebook
Thread-Topic: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Add Calibration
 Kcontrols and tas2563 digtial gain for Chromebook
Thread-Index: AQHarDtfp06/EgvZKUCy2VuueNkSubGjev+AgDOBclA=
Date: Mon, 24 Jun 2024 11:42:11 +0000
Message-ID: <6b6a0af1e55241c4b2acde42e9966e3b@ti.com>
References: <20240522112942.994-1-shenghao-ding@ti.com>
 <Zk3eq0k2Eq-gtejq@smile.fi.intel.com>
In-Reply-To: <Zk3eq0k2Eq-gtejq@smile.fi.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.14.87]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: CJBXHTYCFYUOIBIVVXCIJYGCQTIEV4YU
X-Message-ID-Hash: CJBXHTYCFYUOIBIVVXCIJYGCQTIEV4YU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CJBXHTYCFYUOIBIVVXCIJYGCQTIEV4YU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQW5keQ0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLiBGb2xsb3dpbmcgYXJlIG15IGFuc3dl
cnMuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hl
bmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgTWF5IDIyLCAyMDI0IDg6MDIgUE0NCj4gVG86IERpbmcsIFNoZW5naGFvIDxzaGVuZ2hhby1k
aW5nQHRpLmNvbT4NCj4gQ2M6IGJyb29uaWVAa2VybmVsLm9yZzsgbGdpcmR3b29kQGdtYWlsLmNv
bTsgcGVyZXhAcGVyZXguY3o7IHBpZXJyZS0NCj4gbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5j
b207IDEzOTE2Mjc1MjA2QDEzOS5jb207DQo+IGp1ZHloc2lhb0Bnb29nbGUuY29tOyBhbHNhLWRl
dmVsQGFsc2EtcHJvamVjdC5vcmc7IFNhbGF6YXIsIEl2YW4gPGktDQo+IHNhbGF6YXJAdGkuY29t
PjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgQ2hhZGhhLCBKYXNqb3QgU2luZ2ggPGot
DQo+IGNoYWRoYUB0aS5jb20+OyBsaWFtLnIuZ2lyZHdvb2RAaW50ZWwuY29tOyBiYXJkLmxpYW9A
aW50ZWwuY29tOyB5dW5nLQ0KPiBjaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbTsgUmFvLCBEaXBh
IDxkaXBhQHRpLmNvbT47IEx1LCBLZXZpbiA8a2V2aW4tDQo+IGx1QHRpLmNvbT47IHl1aHN1YW5A
Z29vZ2xlLmNvbTsgdGl3YWlAc3VzZS5kZTsgWHUsIEJhb2p1bg0KPiA8YmFvanVuLnh1QHRpLmNv
bT47IHNveWVyQGlybC5odTsgQmFvanVuLlh1QGZwdC5jb207IE5hdmFkYSBLYW55YW5hLA0KPiBN
dWt1bmQgPG5hdmFkYUB0aS5jb20+OyBjdWpvbWFsYWluZXlAZ29vZ2xlLmNvbTsgS3V0dHksIEFh
bnlhDQo+IDxhYW55YUB0aS5jb20+OyBNYWhtdWQsIE5heWVlbSA8bmF5ZWVtLm1haG11ZEB0aS5j
b20+DQo+IFN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6IFtQQVRDSCB2MV0gQVNvYzogdGFzMjc4MTog
QWRkIENhbGlicmF0aW9uIEtjb250cm9scw0KPiBhbmQgdGFzMjU2MyBkaWd0aWFsIGdhaW4gZm9y
IENocm9tZWJvb2sNCj4gDQo+IE9uIFdlZCwgTWF5IDIyLCAyMDI0IGF0IDA3OuKAijI5OuKAijQx
UE0gKzA4MDAsIFNoZW5naGFvIERpbmcgd3JvdGU6ID4NCj4gQ2FsaWJyYXRlZCBkYXRhIHdpbGwg
YmUgc2V0IHRvIGRlZmF1bHQgYWZ0ZXIgbG9hZGluZyBEU1AgY29uZmlnIHBhcmFtcywgPg0KPiB3
aGljaCB3aWxsIGNhdXNlIHNwZWFrZXIgcHJvdGVjdGlvbiB3b3JrIGFibm9ybWFsbHkuIFJlbG9h
ZCBjYWxpYnJhdGVkID4NCj4gZGF0YSBhZnRlciBsb2FkaW5nIFpqUWNtUVJZRnBmcHRCYW5uZXJT
dGFydCBUaGlzIG1lc3NhZ2Ugd2FzIHNlbnQgZnJvbQ0KPiBvdXRzaWRlIG9mIFRleGFzIEluc3Ry
dW1lbnRzLg0KPiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IHJlY29nbml6ZSB0aGUgc291cmNlIG9mIHRoaXMNCj4gZW1haWwgYW5kIGtub3cgdGhlIGNv
bnRlbnQgaXMgc2FmZS4gSWYgeW91IHdpc2ggdG8gcmVwb3J0IHRoaXMgbWVzc2FnZSB0byBJVA0K
PiBTZWN1cml0eSwgcGxlYXNlIGZvcndhcmQgdGhlIG1lc3NhZ2UgYXMgYW4gYXR0YWNobWVudCB0
bw0KPiBwaGlzaGluZ0BsaXN0LnRpLmNvbQ0KPiANCi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLg0K
PiA+ICsJd2hpbGUgKHIgPiAxICsgbCkgew0KPiA+ICsJCW1pZCA9IChsICsgcikgLyAyOw0KPiA+
ICsJCWFyX21pZCA9IGdldF91bmFsaWduZWRfYmUzMih0YXMyNTYzX2R2Y190YWJsZVttaWRdKTsN
Cj4gPiArCQlpZiAodGFyZ2V0IDwgYXJfbWlkKQ0KPiA+ICsJCQlyID0gbWlkOw0KPiA+ICsJCWVs
c2UNCj4gPiArCQkJbCA9IG1pZDsNCj4gPiArCX0NCj4gDQo+IEhtbS4uLiBJJ20gd29uZGVyaW5n
IGlmIGJzZWFyY2goKSBjYW4gYmUgdXRpbGlzZWQgaGVyZS4NCkJzZWFyY2ggaXMgdG8gZmluZCBv
dXQgdGhlIHZhbHVlLCBpbiB0aGlzIGZ1bmN0aW9uIGlzIHRvIGZpbmQgb3V0IHRoZSBtZW1iZXIg
c2FtZSBhcyBvciBjbG9zZXIgdG8gdGhlIGlucHV0IHZhbHVlLg0KDQo+IA0KPiAuLi4NCj4gDQo+
ID4gKwl1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52YWx1ZVswXSA9DQo+ID4gKwkJYWJzKHRhcmdl
dCAtIGFyX2wpIDw9IGFicyh0YXJnZXQgLSBhcl9yKSA/IGwgOiByOw0KPiANCj4gSSBkb24ndCB1
bmRlcnN0YW5kIHdoeSBkbyB5b3UgbmVlZCAndGFyZ2V0JyB0byBiZSBpbiB0aGlzIGNoZWNrLg0K
PiANCj4gLi4uDQo+IA0KPiA+ICsJdWluZm8tPnZhbHVlLmludGVnZXIubWF4ID0gKGludCl0YXNf
cHJpdi0+bmRldiAtIDE7DQo+IA0KPiBXaHkgY2FzdGluZz8NCj4gDQo+IC4uLg0KPiANCj4gPiAr
CXNjbnByaW50ZihhY3RpdmVfZGV2X25hbWUsIFNORFJWX0NUTF9FTEVNX0lEX05BTUVfTUFYTEVO
LA0KPiANCj4gV2h5ICdjJyB2YXJpYW50IGluIHVzZT8gWW91IGFyZSBpZ25vcmluZyB0aGUgcmV0
dXJuZWQgdmFsdWUuIElzbid0IHN0cnNjcHkoKSB5b3UNCj4gd2FudCBvciBtZW10b3N0cigpIChp
biBib3RoIGNhc2VzIDIgcGFyYW1ldGVycyB2YXJpYW50KT8NCj4gDQo+ID4gKwkJIkFjdGl2YXRl
IFRhc2RldmljZSBJZCIpOw0KPiANCj4gU2FtZSBRIHRvIGFsbCBzY25wcmludGYoKSBjYWxscy4N
Cj4gDQo+IC4uLg0KPiANCj4gPiArCWNhbGlfZGF0YS0+ZGF0YSA9IGRldm1fa3phbGxvYyh0YXNf
cHJpdi0+ZGV2LCB0YXNfcHJpdi0+bmRldiAqDQo+ID4gKwkJKGNhbGlfZGF0YS0+cmVnX2FycmF5
X3N6ICogNCArIDEpLCBHRlBfS0VSTkVMKTsNCj4gDQo+IE5vIHdheS4gRmlyc3Qgb2YgYWxsLCB3
ZSBoYXZlIGtjYWxsb2MoKSwgc2Vjb25kLCB0aGVyZSBpcyBhbiBvdmVyZmxvdy5oIHRoYXQgaGFz
DQo+IG5lY2Vzc2FyeSBtYWNyb3MgdG8gY2FsY3VsYXRlIHNpemVzIGZvciBtZW1vcnkgYWxsb2Nh
dGlvbnMuDQpNZW1vcnkgYWxsb2NhdGVkIHdpdGggZGV2bV9remFsbG9jIGlzIGF1dG9tYXRpY2Fs
bHkgZnJlZWQgb24gZHJpdmVyIGRldGFjaCB3aGlsZSBrY2FsbG9jIGNhbuKAmXQNCj4gDQo+ID4g
KwlpZiAoIWNhbGlfZGF0YS0+ZGF0YSkNCj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gDQo+IC4u
Lg0KDQpCUg0KU2hlbmdoYW8gRGluZw0K
