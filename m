Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF79877497
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Mar 2024 01:50:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B7F2B70;
	Sun, 10 Mar 2024 01:50:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B7F2B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710031823;
	bh=bbVchnAWOmDf0SY5tz51gU0zBbPFluXdodP+37nox/s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M4NyYYKzaLSdWw9ybdA5ZE+jJmQMHTKAoO4Fsq+jdxFvmXjj1F5iS4yv3ipeW14q8
	 lNYChWGG9ZDXfbit0bwFsYSc3CCL/MJMbBHRQpshLgwcDj00rgKt7kRrRTj6AA66xu
	 +n8ggIQ/Z85YZRgZxKcDPy/CzV9A8F5mJ31Z/yg0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F70AF805A0; Sun, 10 Mar 2024 01:49:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9620DF80589;
	Sun, 10 Mar 2024 01:49:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B42EF8028D; Sun, 10 Mar 2024 01:49:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 192C7F8014B
	for <alsa-devel@alsa-project.org>; Sun, 10 Mar 2024 01:49:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 192C7F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=GQbP44zN
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42A0lde6084913;
	Sat, 9 Mar 2024 18:47:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710031659;
	bh=bbVchnAWOmDf0SY5tz51gU0zBbPFluXdodP+37nox/s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=GQbP44zN4GKS4l8JeqqvPLLUoz8THToc2KG9mzMnPHhAh26U186Tv7WssQTH0rq8N
	 4S6ElclTYP9MtJVHYS/DV58VQeuyZXjcob1uchMCgefh3yUSJMHfcPe+HxRHPFFzZ6
	 MNNv8eBTIMrHcM43Nh0TmA06JbN/Un4iLofySZiA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42A0ldx3035319
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 9 Mar 2024 18:47:39 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 9
 Mar 2024 18:47:38 -0600
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Sat, 9 Mar 2024 18:47:38 -0600
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "13916275206@139.com" <13916275206@139.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
        "bard.liao@intel.com" <bard.liao@intel.com>,
        "mengdong.lin@intel.com"
	<mengdong.lin@intel.com>,
        "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>,
        "Lu, Kevin" <kevin-lu@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
        "soyer@irl.hu" <soyer@irl.hu>,
 "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
        "Navada Kanyana, Mukund"
	<navada@ti.com>
Subject: RE: [EXTERNAL] Re: [PATCH v11] ASoc: tas2783: Add tas2783 codec
 driver
Thread-Topic: [EXTERNAL] Re: [PATCH v11] ASoc: tas2783: Add tas2783 codec
 driver
Thread-Index: AQHabwDKl9LUvPfYxEefCqERSA/bELEps8iAgAZrVaA=
Date: Sun, 10 Mar 2024 00:47:38 +0000
Message-ID: <433f1e2469ec4f33b4c0a06d03775652@ti.com>
References: <20240305132646.638-1-shenghao-ding@ti.com>
 <52752743-b4fc-44b3-96d8-21c8cfd2bc3c@linux.intel.com>
In-Reply-To: <52752743-b4fc-44b3-96d8-21c8cfd2bc3c@linux.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.249]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: XELLT6RT4QGMFXPDJNBA6GANZCC36YKN
X-Message-ID-Hash: XELLT6RT4QGMFXPDJNBA6GANZCC36YKN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XELLT6RT4QGMFXPDJNBA6GANZCC36YKN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgUGllcnJlLUxvdWlzDQpUaGFua3MgZm9yIHlvdXIgY29tbWV0cy4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxv
dWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDYs
IDIwMjQgMTI6MDMgQU0NCj4gVG86IERpbmcsIFNoZW5naGFvIDxzaGVuZ2hhby1kaW5nQHRpLmNv
bT47IGJyb29uaWVAa2VybmVsLm9yZw0KPiBDYzogYW5kcml5LnNoZXZjaGVua29AbGludXguaW50
ZWwuY29tOyBsZ2lyZHdvb2RAZ21haWwuY29tOw0KPiBwZXJleEBwZXJleC5jejsgMTM5MTYyNzUy
MDZAMTM5LmNvbTsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOw0KPiBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOyBsaWFtLnIuZ2lyZHdvb2RAaW50ZWwuY29tOw0KPiBiYXJkLmxpYW9A
aW50ZWwuY29tOyBtZW5nZG9uZy5saW5AaW50ZWwuY29tOyB5dW5nLQ0KPiBjaHVhbi5saWFvQGxp
bnV4LmludGVsLmNvbTsgTHUsIEtldmluIDxrZXZpbi1sdUB0aS5jb20+OyB0aXdhaUBzdXNlLmRl
Ow0KPiBzb3llckBpcmwuaHU7IEJhb2p1bi5YdUBmcHQuY29tOyBOYXZhZGEgS2FueWFuYSwgTXVr
dW5kDQo+IDxuYXZhZGFAdGkuY29tPg0KPiBTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbUEFUQ0gg
djExXSBBU29jOiB0YXMyNzgzOiBBZGQgdGFzMjc4MyBjb2RlYw0KPiBkcml2ZXINCj4gDQouLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uDQo+ID4gK3N0YXRpYyB2b2lkIHRhczI3ODNfY2Fs
aWJyYXRpb24oc3RydWN0IHRhc2RldmljZV9wcml2ICp0YXNfZGV2KSB7DQo+ID4gKwllZmlfZ3Vp
ZF90IGVmaV9ndWlkID0gRUZJX0dVSUQoMHgxZjUyZDJhMSwgMHhiYjNhLCAweDQ1N2QsIDB4YmMs
DQo+ID4gKwkJCTB4MDksIDB4NDMsIDB4YTMsIDB4ZjQsIDB4MzEsIDB4MGEsIDB4OTIpOw0KPiA+
ICsJc3RhdGljIGVmaV9jaGFyMTZfdCBlZmlfbmFtZVtdID0gTCJDQUxJX0RBVEEiOw0KPiA+ICsJ
c3RydWN0IGNhbGlicmF0aW9uX2RhdGEgY2FsaV9kYXRhOw0KPiA+ICsJdW5zaWduZWQgaW50ICp0
bXBfdmFsOw0KPiA+ICsJdW5zaWduZWQgaW50IGNyYzsNCj4gPiArCWVmaV9zdGF0dXNfdCBzdGF0
dXM7DQo+ID4gKw0KPiA+ICsJY2FsaV9kYXRhLnRvdGFsX3N6ID0gMDsNCj4gPiArDQo+ID4gKwlz
dGF0dXMgPSBlZmkuZ2V0X3ZhcmlhYmxlKGVmaV9uYW1lLCAmZWZpX2d1aWQsIE5VTEwsDQo+ID4g
KwkJJmNhbGlfZGF0YS50b3RhbF9zeiwgTlVMTCk7DQo+ID4gKwlpZiAoc3RhdHVzID09IEVGSV9C
VUZGRVJfVE9PX1NNQUxMDQo+ID4gKwkJJiYgY2FsaV9kYXRhLnRvdGFsX3N6IDwgVEFTMjc4M19N
QVhfQ0FMSURBVEFfU0laRSkgew0KPiA+ICsJCXN0YXR1cyA9IGVmaS5nZXRfdmFyaWFibGUoZWZp
X25hbWUsICZlZmlfZ3VpZCwgTlVMTCwNCj4gPiArCQkJJmNhbGlfZGF0YS50b3RhbF9zeiwNCj4g
PiArCQkJY2FsaV9kYXRhLmRhdGEpOw0KPiA+ICsJCWRldl9kYmcodGFzX2Rldi0+ZGV2LCAiJXM6
IGNhbGkgZ2V0ICVseCBieXRlcyByZXN1bHQ6JWxkXG4iLA0KPiA+ICsJCQlfX2Z1bmNfXywgY2Fs
aV9kYXRhLnRvdGFsX3N6LCBzdGF0dXMpOw0KPiA+ICsJfQ0KPiA+ICsJaWYgKHN0YXR1cyAhPSAw
KSB7DQo+ID4gKwkJLyogRmFpbGVkIGdvdCBjYWxpYnJhdGlvbiBkYXRhIGZyb20gRUZJLiAqLw0K
PiA+ICsJCWRldl9kYmcodGFzX2Rldi0+ZGV2LCAiTm8gY2FsaWJyYXRpb24gZGF0YSBpbiBVRUZJ
LiIpOw0KPiA+ICsJCXJldHVybjsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwl0bXBfdmFsID0gKHVu
c2lnbmVkIGludCAqKWNhbGlfZGF0YS5kYXRhOw0KPiA+ICsNCj4gPiArCWlmICh0bXBfdmFsWzBd
ID09IDI3ODMpIHsNCj4gDQo+IEdvb2RuZXNzLCB3aGF0IGd1YXJhbnRlZXJzIHRoYXQgdGhlICcy
NzgzJyB2YWx1ZSBpcyBOT1QgYSBjYWxpYnJhdGVkIHZhbHVlPw0KPiANCj4gVjI6DQo+ICoJQ2hp
cElEICgyNzgzLCA0IGJ5dGVzKQ0KPiANCj4gVjE6DQo+ICoJQ2FsaWJyYXRlZCBEYXRhIG9mIERl
diAwKHVuaXF1ZV9pZCBvZmZzZXQgMCkgKDIwIGJ5dGVzKQ0KPiANCj4gQ29tcGFyaW5nIGJpbmFy
eSB2YWx1ZXMgaXMgdmVyeSByaXNreS4gVXN1YWxseSB5b3UgbmVlZCBzb21lIHNvcnQgb2YgQ1JD
IHRvDQo+IGF2b2lkIGNvbmZsaWN0cy4uLg0KPiANCj4gPiArCQkvKiBDYWxpYnJhdGVkIERhdGEg
VjIgKi8NCj4gPiArCQl1bnNpZ25lZCBpbnQgZGV2X3N1bSA9IHRtcF92YWxbMV07DQo+ID4gKw0K
PiA+ICsJCWlmIChkZXZfc3VtID4gVEFTMjc4M19NQVhfREVWX05VTSB8fA0KPiANCj4gSSB0aG91
Z2h0IGRldl9zdW0gbWVhbnQgc29tZSBzb3J0IG9mICdzdW0nIGluIHRoZSBDUkMgc2Vuc2UsIGJ1
dCBpdCdzIHJlYWxseQ0KPiBudW1iZXJfb2ZfZGV2aWNlcywgaXNuJ3QgaXQ/DQo+IA0KPiA+ICsJ
CQlkZXZfc3VtID09IDApIHsNCj4gPiArCQkJZGV2X2RiZyh0YXNfZGV2LT5kZXYsICJObyBkZXYg
aW4gY2FsaWJyYXRlZCBkYXRhDQo+IFYyLiIpOw0KPiA+ICsJCQlyZXR1cm47DQo+ID4gKwkJfQ0K
PiA+ICsJCWNyYyA9IGNyYzMyKH4wLCBjYWxpX2RhdGEuZGF0YSwgMTIgKyBkZXZfc3VtICogMjQp
IF4gfjA7DQo+ID4gKwkJaWYgKGNyYyA9PSB0bXBfdmFsWzMgKyBkZXZfc3VtICogNl0pIHsNCj4g
PiArCQkJdGFzMjc4M19hcHBseV9jYWxpYnYyKHRhc19kZXYsIHRtcF92YWwpOw0KPiA+ICsJCQlk
ZXZfZGJnKHRhc19kZXYtPmRldiwgIlYyOiAlcHRUcyIsICZ0bXBfdmFsWzQwXSk7DQo+ID4gKwkJ
fSBlbHNlIHsNCj4gPiArCQkJZGV2X2RiZyh0YXNfZGV2LT5kZXYsDQo+ID4gKwkJCQkiVjI6IENS
QyAweCUwOHggbm90IG1hdGNoIDB4JTA4eFxuIiwNCj4gPiArCQkJCWNyYywgdG1wX3ZhbFs0MV0p
Ow0KPiA+ICsJCX0NCj4gPiArCX0gZWxzZSB7DQo+ID4gKwkJLyogQ2FsaWJyYXRlZCBEYXRhIFYx
ICovDQo+ID4gKwkJLyogOCBkZXZzICogMjAgYnl0ZXMgY2FsaWJyYXRlZCBkYXRhL2RldiArIDQg
Ynl0ZXMgVGltZXN0YW1wDQo+ICovDQo+ID4gKwkJY3JjID0gY3JjMzIofjAsIGNhbGlfZGF0YS5k
YXRhLCAxNjQpIF4gfjA7DQo+ID4gKwkJaWYgKGNyYyA9PSB0bXBfdmFsWzQxXSkgew0KPiA+ICsJ
CQkvKiBEYXRlIGFuZCB0aW1lIG9mIHdoZW4gY2FsaWJyYXRpb24gd2FzIGRvbmUuICovDQo+ID4g
KwkJCXRhczI3ODNfYXBwbHlfY2FsaWJ2MSh0YXNfZGV2LCB0bXBfdmFsKTsNCj4gPiArCQkJZGV2
X2RiZyh0YXNfZGV2LT5kZXYsICJWMTogJXB0VHMiLCAmdG1wX3ZhbFs0MF0pOw0KPiA+ICsJCX0g
ZWxzZSB7DQo+ID4gKwkJCWRldl9kYmcodGFzX2Rldi0+ZGV2LA0KPiA+ICsJCQkJIlYxOiBDUkMg
MHglMDh4IG5vdCBtYXRjaCAweCUwOHhcbiIsDQo+ID4gKwkJCQljcmMsIHRtcF92YWxbNDFdKTsN
Cj4gPiArCQl9DQo+IA0KPiBUaGUgQ1JDIGNoZWNrIHNob3VsZCBiZSB1c2VkIHRvIGRldGVybWlu
ZSBpZiB0aGUgdjEgb3IgdjIgc2hvdWxkIGJlIHVzZWQuDQo+IFRoaXMgaXMgcmVhbGx5IGJyb2tl
biBJTUhPLCB5b3UgY291bGQgZGV0ZWN0IHRoZSB3cm9uZyBsYXlvdXQgdGhlbiBmbGFnIHRoYXQN
Cj4gdGhlIENSQyBpcyBiYWQgd2l0aG91dCBldmVuIHRyeWluZyB0aGUgb3RoZXIgbGF5b3V0Li4u
DQoNCkl0IHNlZW1lZCBub3QgZWFzeSB0byBhZGQgYW4gZXh0cmEgQ1JDIGluIFYxLCBlc3BlY2lh
bGx5IGZvciB0aGUgb2xkIGRldmljZSBpbiB0aGUgZW5kIHVzZXJzLg0KQXMgeW91IGtub3csIHRo
ZSBWMSBpcyBzdG9yZWQgaW4gcmF3IGRhdGEuIEluIG9yZGVyIHRvIHRha2UgY2FyZSBvZiB0aGUN
Cm9sZCBkZXZpY2VzIGhhdmUgYmVlbiBhbHJlYWR5IGluIHRoZSBlbmQgdXNlcnMsIHRoZSBWMSBw
YXJ0IGhhcyB0byBrZWVwIGhlcmUuDQoNCj4gDQo+ID4gKwl9DQo+ID4gK30NCj4gPiArDQo+ID4g
K3N0YXRpYyB2b2lkIHRhc2RldmljZV9kc3Bmd19yZWFkeShjb25zdCBzdHJ1Y3QgZmlybXdhcmUg
KmZtdywNCj4gPiArCXZvaWQgKmNvbnRleHQpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCB0YXNkZXZp
Y2VfcHJpdiAqdGFzX2RldiA9DQo+ID4gKwkJKHN0cnVjdCB0YXNkZXZpY2VfcHJpdiAqKSBjb250
ZXh0Ow0KPiA+ICsJc3RydWN0IHRhczI3ODNfZmlybXdhcmVfbm9kZSAqcDsNCj4gPiArCXN0cnVj
dCByZWdtYXAgKm1hcCA9IHRhc19kZXYtPnJlZ21hcDsNCj4gPiArCXVuc2lnbmVkIGNoYXIgKmJ1
ZiA9IE5VTEw7DQo+ID4gKwlpbnQgb2Zmc2V0ID0gMCwgaW1nX3N6Ow0KPiA+ICsJaW50IHJldDsN
Cj4gPiArDQo+ID4gKwlpZiAoIWZtdyB8fCAhZm13LT5kYXRhKSB7DQo+ID4gKwkJZGV2X3dhcm4o
dGFzX2Rldi0+ZGV2LA0KPiA+ICsJCQkiJXM6IGZhaWxlZCB0byByZWFkICVzOiB3b3JrIGluIGJ5
cGFzcy1kc3AgbW9kZS5cbiIsDQo+ID4gKwkJCV9fZnVuY19fLCB0YXNfZGV2LT5kc3Bmd19iaW5h
cnluYW1lKTsNCj4gPiArCQlyZXR1cm47DQo+ID4gKwl9DQo+ID4gKwlidWYgPSAodW5zaWduZWQg
Y2hhciAqKWZtdy0+ZGF0YTsNCj4gPiArDQo+ID4gKwlpbWdfc3ogPSBnZXRfdW5hbGlnbmVkX2xl
MzIoJmJ1ZltvZmZzZXRdKTsNCj4gPiArCW9mZnNldCAgKz0gc2l6ZW9mKGltZ19zeik7DQo+ID4g
KwlpZiAoaW1nX3N6ICE9IGZtdy0+c2l6ZSkgew0KPiA+ICsJCWRldl93YXJuKHRhc19kZXYtPmRl
diwgIiVzOiBzaXplIG5vdCBtYXRjaGluZywgJWQgJXUuIiwNCj4gPiArCQkJX19mdW5jX18sIChp
bnQpZm13LT5zaXplLCBpbWdfc3opOw0KPiA+ICsJCXJldHVybjsNCj4gPiArCX0NCj4gPiArDQo+
ID4gKwl3aGlsZSAob2Zmc2V0IDwgaW1nX3N6KSB7DQo+ID4gKwkJcCA9IChzdHJ1Y3QgdGFzMjc4
M19maXJtd2FyZV9ub2RlICopKGJ1ZiArIG9mZnNldCk7DQo+ID4gKwkJaWYgKHAtPmxlbmd0aCA+
IDEpIHsNCj4gPiArCQkJcmV0ID0gcmVnbWFwX2J1bGtfd3JpdGUobWFwLCBwLT5kb3dubG9hZF9h
ZGRyLA0KPiA+ICsJCQlidWYgKyBvZmZzZXQgKyBzaXplb2YodW5zaWduZWQgaW50KSAqIDUsIHAt
Pmxlbmd0aCk7DQo+ID4gKwkJfSBlbHNlIHsNCj4gPiArCQkJcmV0ID0gcmVnbWFwX3dyaXRlKG1h
cCwgcC0+ZG93bmxvYWRfYWRkciwNCj4gPiArCQkJCSooYnVmICsgb2Zmc2V0ICsgc2l6ZW9mKHVu
c2lnbmVkIGludCkgKiA1KSk7DQo+ID4gKwkJfQ0KPiA+ICsNCj4gPiArCQlpZiAocmV0ICE9IDAp
IHsNCj4gPiArCQkJZGV2X2RiZyh0YXNfZGV2LT5kZXYsDQo+ID4gKwkJCQkiJXM6IGxvYWQgRlcg
ZmFpbDogJWQsIHdvcmsgaW4gYnlwYXNzLlxuIiwNCj4gPiArCQkJCV9fZnVuY19fLCByZXQpOw0K
PiA+ICsJCQlyZXR1cm47DQo+ID4gKwkJfQ0KPiA+ICsJCW9mZnNldCArPSBzaXplb2YodW5zaWdu
ZWQgaW50KSAqIDUgKyBwLT5sZW5ndGg7DQo+IA0KPiB3aGF0IGlzICc1Jz8gVXNpbmcgYSBkZWZp
bmUgaXMgYmVzdCB0byBhdm9pZCBzdWNoIG1hZ2ljIG51bWJlcnMuDQo+IA0KPiA+ICsJfQ0KPiA+
ICsNCj4gPiArCXRhczI3ODNfY2FsaWJyYXRpb24odGFzX2Rldik7DQo+ID4gK30NCj4gPiArDQo+
IA0KPiA+ICtzdGF0aWMgaW50IHRhc2RldmljZV9tdXRlKHN0cnVjdCBzbmRfc29jX2RhaSAqZGFp
LCBpbnQgbXV0ZSwNCj4gPiArCWludCBkaXJlY3Rpb24pDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBz
bmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50ID0gZGFpLT5jb21wb25lbnQ7DQo+ID4gKwlzdHJ1
Y3QgdGFzZGV2aWNlX3ByaXYgKnRhc19kZXYgPQ0KPiA+ICsJCXNuZF9zb2NfY29tcG9uZW50X2dl
dF9kcnZkYXRhKGNvbXBvbmVudCk7DQo+ID4gKwlzdHJ1Y3QgcmVnbWFwICptYXAgPSB0YXNfZGV2
LT5yZWdtYXA7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCWRldl9kYmcodGFzX2Rldi0+
ZGV2LCAiJXM6ICVkLlxuIiwgX19mdW5jX18sIG11dGUpOw0KPiA+ICsNCj4gPiArCWlmIChtdXRl
KSB7DQo+ID4gKwkJaWYgKGRpcmVjdGlvbiA9PSBTTkRSVl9QQ01fU1RSRUFNX0NBUFRVUkUpIHsN
Cj4gPiArCQkJcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKG1hcCwNCj4gVEFTMjg3M19SRUdfUFdS
X0NUUkwsDQo+ID4gKwkJCQlUQVMyNzgzX1JFR19BRUZfTUFTSywNCj4gPiArCQkJCVRBUzI3ODNf
UkVHX0FFRl9JTkFDVElWRSk7DQo+ID4gKwkJCWlmIChyZXQpDQo+ID4gKwkJCQlkZXZfZXJyKHRh
c19kZXYtPmRldiwNCj4gPiArCQkJCQkiJXM6IERpc2FibGUgQUVGIGZhaWxlZC5cbiIsDQo+IF9f
ZnVuY19fKTsNCj4gPiArCQl9IGVsc2Ugew0KPiA+ICsJCQkvKiBGVTIzIG11dGUgKDB4NDA0MDAx
MDgpICovDQo+ID4gKwkJCXJldCA9IHJlZ21hcF93cml0ZShtYXAsDQo+ID4gKw0KPiAJU0RXX1NE
Q0FfQ1RMKFRBUzI3ODNfRlVOQ19UWVBFX1NNQVJUX0FNUCwNCj4gPiArCQkJCVRBUzI3ODNfU0RD
QV9FTlRfRlUyMywNCj4gPiArCQkJCVRBUzI3ODNfU0RDQV9DVExfRlVfTVVURSwgMCksIDEpOw0K
PiA+ICsJCQlpZiAocmV0KSB7DQo+ID4gKwkJCQlkZXZfZXJyKHRhc19kZXYtPmRldiwNCj4gPiAr
CQkJCQkiJXM6IEZVMjMgbXV0ZSBmYWlsZWQuXG4iLCBfX2Z1bmNfXyk7DQo+ID4gKwkJCQlnb3Rv
IG91dDsNCj4gPiArCQkJfQ0KPiA+ICsJCQkvKg0KPiA+ICsJCQkgKiBCb3RoIHBsYXliYWNrIGFu
ZCBlY2hvIGRhdGEgd2lsbCBiZSBzaHV0ZG93biBpbg0KPiA+ICsJCQkgKiBwbGF5YmFjayBzdHJl
YW0uDQo+IA0KPiBbMV0gZWNobyByZWZlcmVuY2UgZGF0YSBpcyB1c3VhbGx5IG5vdCBwYXJ0IG9m
IHRoZSBwbGF5YmFjayBzdHJlYW0gYnV0DQo+IHByb3ZpZGVkIG92ZXIgYSBjYXB0dXJlIHN0cmVh
bS4gUGxlYXNlIGNsYXJpZnkgdGhpcyBjb21tZW50Lg0KPiANCj4gPiArCQkJICovDQo+ID4gKwkJ
CXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhtYXAsDQo+IFRBUzI4NzNfUkVHX1BXUl9DVFJMLA0K
PiA+ICsJCQkJVEFTMjc4M19SRUdfUFdSX01PREVfTUFTSyB8DQo+ID4gKwkJCQlUQVMyNzgzX1JF
R19BRUZfTUFTSywNCj4gPiArCQkJCVRBUzI3ODNfUkVHX1BXUl9NT0RFX0FDVElWRSB8DQo+ID4g
KwkJCQlUQVMyNzgzX1JFR19QV1JfTU9ERV9TV19QV0QpOw0KPiA+ICsJCQlpZiAocmV0KSB7DQo+
ID4gKwkJCQlkZXZfZXJyKHRhc19kZXYtPmRldiwNCj4gPiArCQkJCQkiJXM6IFBXUiZBRUYgc2h1
dGRvd24gZmFpbGVkLlxuIiwNCj4gPiArCQkJCQlfX2Z1bmNfXyk7DQo+ID4gKwkJCQlnb3RvIG91
dDsNCj4gPiArCQkJfQ0KPiA+ICsJCQl0YXNfZGV2LT5wc3RyZWFtID0gZmFsc2U7DQo+ID4gKwkJ
fQ0KPiA+ICsJfSBlbHNlIHsNCj4gPiArCQkvKiBGVTIzIFVubXV0ZSwgMHg0MDQwMDEwOC4gKi8N
Cj4gPiArCQlpZiAoZGlyZWN0aW9uID09IFNORFJWX1BDTV9TVFJFQU1fUExBWUJBQ0spIHsNCj4g
PiArCQkJcmV0ID0gcmVnbWFwX3dyaXRlKG1hcCwNCj4gPiArDQo+IAlTRFdfU0RDQV9DVEwoVEFT
Mjc4M19GVU5DX1RZUEVfU01BUlRfQU1QLA0KPiA+ICsJCQkJVEFTMjc4M19TRENBX0VOVF9GVTIz
LA0KPiA+ICsJCQkJVEFTMjc4M19TRENBX0NUTF9GVV9NVVRFLCAwKSwgMCk7DQo+ID4gKwkJCWlm
IChyZXQpIHsNCj4gPiArCQkJCWRldl9lcnIodGFzX2Rldi0+ZGV2LA0KPiA+ICsJCQkJCSIlczog
RlUyMyBVbm11dGUgZmFpbGVkLlxuIiwNCj4gX19mdW5jX18pOw0KPiA+ICsJCQkJZ290byBvdXQ7
DQo+ID4gKwkJCX0NCj4gPiArCQkJcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKG1hcCwNCj4gVEFT
Mjg3M19SRUdfUFdSX0NUUkwsDQo+ID4gKwkJCQlUQVMyNzgzX1JFR19QV1JfTU9ERV9NQVNLLA0K
PiA+ICsJCQkJVEFTMjc4M19SRUdfUFdSX01PREVfQUNUSVZFKTsNCj4gPiArCQkJaWYgKHJldCkg
ew0KPiA+ICsJCQkJZGV2X2Vycih0YXNfZGV2LT5kZXYsDQo+ID4gKwkJCQkJIiVzOiBQV1IgVW5t
dXRlIGZhaWxlZC5cbiIsDQo+IF9fZnVuY19fKTsNCj4gPiArCQkJCWdvdG8gb3V0Ow0KPiA+ICsJ
CQl9DQo+ID4gKwkJCXRhc19kZXYtPnBzdHJlYW0gPSB0cnVlOw0KPiA+ICsJCX0gZWxzZSB7DQo+
ID4gKwkJCS8qIENhcHR1cmUgc3RyZWFtIGlzIHRoZSBlY2hvIHJlZiBkYXRhIGZvciB2b2ljZS4N
Cj4gPiArCQkJICogV2l0aG91dCBwbGF5YmFjaywgaXQgY2FuJ3QgYmUgYWN0aXZlLg0KPiANCj4g
VGhhdCBtYWtlcyBjYXNlIGZvciBbMV0gYWJvdmUuDQo+IA0KPiBJIGFsc28gZG9uJ3QgZ2V0IHRo
ZSBjb25jZXB0IG9mICdhY3RpdmUnLiBFdmVuIHdoZW4gdGhlIHBsYXliYWNrIGlzIG11dGVkLCB5
b3UNCj4gZG8gd2FudCB0byBwcm92aWRlIGEgcmVmZXJlbmNlIHN0cmVhbSwgZG9uJ3QgeW91Pw0K
V2hlbiBwbGF5YmFjayBpcyBtdXRlZCwgaXQgd2lsbCB0dXJuIG9mZiBlY2hvIHJlZi4NCj4gDQo+
IEFsc28gZG9uJ3Qgd2UgaGF2ZSBhIHBvdGVudGlhbCByYWNlIGNvbmRpdGlvbiwgeW91IHNldCB0
aGUgJ3BzdHJlYW0nDQo+IHN0YXR1cyBmb3IgdGhlIHBsYXliYWNrIGJ1dCB1c2UgaXQgZm9yIGNh
cHR1cmUuIFdoYXQgdGVsbHMgeW91IHRoYXQgdGhpcyBjYW5ub3QNCj4gYmUgZXhlY3V0ZWQgY29u
Y3VycmVudGx5Pw0KQ2FwdHVyZSBpbiB0YXMyNzgzIGNhbiBiZSB1bm11dGUgZHVyaW5nIHBsYXli
YWNrIGlzIHVubXV0ZS4NCk5vIHBsYXliYWNrLCBubyBjYXB0dXJlLg0KPiANCj4gPiArCQkJICov
DQo+ID4gKwkJCWlmICh0YXNfZGV2LT5wc3RyZWFtID09IHRydWUpIHsNCj4gPiArCQkJCXJldCA9
IHJlZ21hcF91cGRhdGVfYml0cyhtYXAsDQo+ID4gKwkJCQkJVEFTMjg3M19SRUdfUFdSX0NUUkws
DQo+ID4gKwkJCQkJVEFTMjc4M19SRUdfQUVGX01BU0ssDQo+ID4gKwkJCQkJVEFTMjc4M19SRUdf
QUVGX0FDVElWRSk7DQo+ID4gKwkJCQlpZiAocmV0KSB7DQo+ID4gKwkJCQkJZGV2X2Vycih0YXNf
ZGV2LT5kZXYsDQo+ID4gKwkJCQkJCSIlczogQUVGIGVuYWJsZSBmYWlsZWQuXG4iLA0KPiA+ICsJ
CQkJCQlfX2Z1bmNfXyk7DQo+ID4gKwkJCQkJZ290byBvdXQ7DQo+ID4gKwkJCQl9DQo+ID4gKwkJ
CX0gZWxzZSB7DQo+ID4gKwkJCQlkZXZfZXJyKHRhc19kZXYtPmRldiwNCj4gPiArCQkJCQkiJXM6
IE5vIHBsYXliYWNrLCBubyBBRUYhIiwNCj4gX19mdW5jX18pOw0KPiA+ICsJCQkJcmV0ID0gLUVJ
TlZBTDsNCj4gPiArCQkJfQ0KPiA+ICsJCX0NCj4gPiArCX0NCj4gPiArb3V0Og0KPiA+ICsJaWYg
KHJldCkNCj4gPiArCQlkZXZfZXJyKHRhc19kZXYtPmRldiwgIk11dGUgb3IgdW5tdXRlICVkIGZh
aWxlZCAlZC5cbiIsDQo+ID4gKwkJCW11dGUsIHJldCk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHJl
dDsNCj4gPiArfQ0KDQo=
