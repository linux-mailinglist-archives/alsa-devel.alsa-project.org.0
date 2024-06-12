Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A489051A5
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 13:52:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC070E0F;
	Wed, 12 Jun 2024 13:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC070E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718193177;
	bh=VkkTtK8kv49ihxUIWWfJmoPWa7Qtpd9YsQ68XKHv/T4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SXmTArKUutYE55/Ggl0aVz3qfgNxDU7HRmGki9deynzgnWsWC6SX3goFTcxaH5pV8
	 2N67XFrKVXdSqLp2faGlaA7NsZtELletoooV8o20YMF+XZvht55j53t/3Jk7F2ig5t
	 6ik0Tgao4Tklt3m73lHQmEDaAS6VHpmGvuFBC93c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7E02F805BA; Wed, 12 Jun 2024 13:52:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1A78F805B4;
	Wed, 12 Jun 2024 13:52:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EEE7F8057A; Wed, 12 Jun 2024 13:52:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA5BBF8010C
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 13:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA5BBF8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ljDya9GC
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45CBpuLn085550;
	Wed, 12 Jun 2024 06:51:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718193116;
	bh=VkkTtK8kv49ihxUIWWfJmoPWa7Qtpd9YsQ68XKHv/T4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=ljDya9GCg4AdzEVBNT5A6TV9Uo15cW/lMf3r8TyH1fwbNYmkYxthEVF4ZTjTh9TQJ
	 X85oYZBolz1A3uNaT+n7ao5rpb0YWRg/Blkj/zVTADY27rCfrUdWi710ZFL78nsR+v
	 8eNl3WzIteepB9708pP/MoykdOZgWB3h/rPe5jV8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45CBpuM1006451
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Jun 2024 06:51:56 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Jun 2024 06:51:55 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Wed, 12 Jun 2024 06:51:55 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "13916275206@139.com" <13916275206@139.com>,
        "zhourui@huaqin.com" <zhourui@huaqin.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "Salazar, Ivan" <i-salazar@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Chadha,
 Jasjot Singh" <j-chadha@ti.com>,
        "liam.r.girdwood@intel.com"
	<liam.r.girdwood@intel.com>,
        "Yue, Jaden" <jaden-yue@ti.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "Rao,
 Dipa" <dipa@ti.com>, "yuhsuan@google.com" <yuhsuan@google.com>,
        "Lo, Henry"
	<henry.lo@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
        "Xu, Baojun"
	<baojun.xu@ti.com>, "soyer@irl.hu" <soyer@irl.hu>,
        "Baojun.Xu@fpt.com"
	<Baojun.Xu@fpt.com>,
        "judyhsiao@google.com" <judyhsiao@google.com>,
        "Navada
 Kanyana, Mukund" <navada@ti.com>,
        "cujomalainey@google.com"
	<cujomalainey@google.com>,
        "Kutty, Aanya" <aanya@ti.com>,
        "Mahmud, Nayeem"
	<nayeem.mahmud@ti.com>,
        "savyasanchi.shukla@netradyne.com"
	<savyasanchi.shukla@netradyne.com>,
        "flaviopr@microsoft.com"
	<flaviopr@microsoft.com>,
        "Ji, Jesse" <jesse-ji@ti.com>,
        "darren.ye@mediatek.com" <darren.ye@mediatek.com>
Subject: RE: [EXTERNAL] Re: [RESEND PATCH v4] ASoc: tas2781: Enable RCA-based
 playback without DSP firmware download
Thread-Topic: [EXTERNAL] Re: [RESEND PATCH v4] ASoc: tas2781: Enable RCA-based
 playback without DSP firmware download
Thread-Index: AQHauA7VzKr60B04MES3npAwhDhNCbG7CTGAgAj/dqA=
Date: Wed, 12 Jun 2024 11:51:55 +0000
Message-ID: <c56ec5c5bd7349a788251230deead24a@ti.com>
References: <20240606124105.1492-1-shenghao-ding@ti.com>
 <146da765-c53f-4eb4-874e-53625daeb03e@linux.intel.com>
In-Reply-To: <146da765-c53f-4eb4-874e-53625daeb03e@linux.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.158]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: BOURKQ5OHX4DX5RGZP3ZO6HB7T2TW2WL
X-Message-ID-Hash: BOURKQ5OHX4DX5RGZP3ZO6HB7T2TW2WL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOURKQ5OHX4DX5RGZP3ZO6HB7T2TW2WL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgUGllcnJlDQpTb3JyeSBmb3IgbWlzc2luZyB5b3VyIHZhbHVhYmxlIHJldmlldyBjb21tZW50
cywgdGhhbmtzIGZvciBCcm9vbmllJ3MgcmVtaW5kLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2Fy
dEBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDYsIDIwMjQgOTowOSBQ
TQ0KPiBUbzogRGluZywgU2hlbmdoYW8gPHNoZW5naGFvLWRpbmdAdGkuY29tPjsgYnJvb25pZUBr
ZXJuZWwub3JnDQo+IENjOiBhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb207IGxnaXJk
d29vZEBnbWFpbC5jb207DQo+IHBlcmV4QHBlcmV4LmN6OyAxMzkxNjI3NTIwNkAxMzkuY29tOyB6
aG91cnVpQGh1YXFpbi5jb207IGFsc2EtDQo+IGRldmVsQGFsc2EtcHJvamVjdC5vcmc7IFNhbGF6
YXIsIEl2YW4gPGktc2FsYXphckB0aS5jb20+OyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgQ2hhZGhhLCBKYXNqb3QgU2luZ2ggPGotY2hhZGhhQHRpLmNvbT47DQo+IGxpYW0uci5n
aXJkd29vZEBpbnRlbC5jb207IFl1ZSwgSmFkZW4gPGphZGVuLXl1ZUB0aS5jb20+OyB5dW5nLQ0K
PiBjaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbTsgUmFvLCBEaXBhIDxkaXBhQHRpLmNvbT47IHl1
aHN1YW5AZ29vZ2xlLmNvbTsNCj4gTG8sIEhlbnJ5IDxoZW5yeS5sb0B0aS5jb20+OyB0aXdhaUBz
dXNlLmRlOyBYdSwgQmFvanVuIDxiYW9qdW4ueHVAdGkuY29tPjsNCj4gc295ZXJAaXJsLmh1OyBC
YW9qdW4uWHVAZnB0LmNvbTsganVkeWhzaWFvQGdvb2dsZS5jb207IE5hdmFkYSBLYW55YW5hLA0K
PiBNdWt1bmQgPG5hdmFkYUB0aS5jb20+OyBjdWpvbWFsYWluZXlAZ29vZ2xlLmNvbTsgS3V0dHks
IEFhbnlhDQo+IDxhYW55YUB0aS5jb20+OyBNYWhtdWQsIE5heWVlbSA8bmF5ZWVtLm1haG11ZEB0
aS5jb20+Ow0KPiBzYXZ5YXNhbmNoaS5zaHVrbGFAbmV0cmFkeW5lLmNvbTsgZmxhdmlvcHJAbWlj
cm9zb2Z0LmNvbTsgSmksIEplc3NlIDxqZXNzZS0NCj4gamlAdGkuY29tPjsgZGFycmVuLnllQG1l
ZGlhdGVrLmNvbQ0KPiBTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbUkVTRU5EIFBBVENIIHY0XSBB
U29jOiB0YXMyNzgxOiBFbmFibGUgUkNBLWJhc2VkDQo+IHBsYXliYWNrIHdpdGhvdXQgRFNQIGZp
cm13YXJlIGRvd25sb2FkDQo+IA0KPiBJIGFtIGFmcmFpZCB0aGVyZSBhcmUgc3RpbGwgY2lyY3Vs
YXIgbG9naWMgaXNzdWVzLCBvciB0aGUgY29kZS9jb21tZW50cyBkb24ndA0KPiBjYXB0dXJlIHdo
YXQgeW91IGFyZSB0cnlpbmcgdG8gZG8u4oCKLuKAii7igIouID4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvc291bmQvdGFzMjc4MS0NCj4gZHNwLuKAimggYi9pbmNsdWRlL3NvdW5kL3RhczI3ODEtZHNw
LuKAimggPiBpbmRleCA3ZmJhN2VhMjZhNGIu4oCKLuKAijNjZGE5ZGExNGY2ZA0KPiAxMDA2NDQg
PiBaalFjbVFSWUZwZnB0QmFubmVyU3RhcnQgVGhpcyBtZXNzYWdlIHdhcyBzZW50IGZyb20gb3V0
c2lkZSBvZg0KPiBUZXhhcyBJbnN0cnVtZW50cy4NCj4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNvdXJjZSBvZiB0aGlzDQo+
IGVtYWlsIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuIElmIHlvdSB3aXNoIHRvIHJlcG9y
dCB0aGlzIG1lc3NhZ2UgdG8gSVQNCj4gU2VjdXJpdHksIHBsZWFzZSBmb3J3YXJkIHRoZSBtZXNz
YWdlIGFzIGFuIGF0dGFjaG1lbnQgdG8gcGhpc2hpbmdAbGlzdC50aS5jb20NCj4gDQo+IFpqUWNt
UVJZRnBmcHRCYW5uZXJFbmQNCj4gSSBhbSBhZnJhaWQgdGhlcmUgYXJlIHN0aWxsIGNpcmN1bGFy
IGxvZ2ljIGlzc3Vlcywgb3IgdGhlIGNvZGUvY29tbWVudHMgZG9uJ3QNCj4gY2FwdHVyZSB3aGF0
IHlvdSBhcmUgdHJ5aW5nIHRvIGRvLi4uLg0KPiANCj4gDQouLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uDQo+IC4uLiBhbmQgaGVyZSB0aGlzIFRBU0RFVklDRV9SQ0FfRldfT0sgcmVh
bGx5IG1lYW5zIGEgZmFpbC4NCj4gDQo+IHNvIGhvdyBjYW4gWzFdIGNvbnNpZGVyIFRBU0RFVklD
RV9SQ0FfRldfT0sgYXMgYSBzdWNjZXNzIGNhc2U/DQo+IA0KPiBPciB0aGlzIHRoaXMgc2F5aW5n
IHRoYXQgdGhlIGJhc2VsaW5lIGlzIHRoZSBSQ0EgY2FzZSwgYW5kIHRoZW4gdGhlIGNvZGUNCj4g
YXR0ZW1wdHMgdG8gbG9hZCBmaXJtd2FyZSBidXQgaW4gY2FzZSBvZiBmYWlsdXJlcyBqdXN0IGtl
ZXAgZ29pbmcsIGkuZS4NCj4gZmFpbGluZyB0byBsb2FkIGZpcm13YXJlIGlzIE5PVCBhbiBlcnJv
cj8NCkNvcnJlY3QuDQo+IA0KPiBUaGF0IHdvdWxkIGJlIHNvbWV3aGF0IGRpZmZlcmVudCB0byB0
aGUgY29tbWl0IHRpdGxlIHRoYXQgc2F5cyAnd2l0aG91dCBEU1ANCj4gZmlybXdhcmUgZG93bmxv
YWQnLg0KPiANCj4gV291bGQgeW91IG1pbmQgY2xhcmlmeWluZyB0aGUgc3RlcHMgcGxlYXNlPw0K
VGhlcmUncyB0d28gYmluIGZpbGVzIGZvciB0YXMyNzgxLCBvbmUgaXMgcmVnaXN0ZXIgc2V0dGlu
Z3MoUkNBIGJpbiBmaWxlKSwgdGhlIG90aGVyIGlzIHRoZSBkc3AgZmlybXdhcmUgYW5kIGZpbHRl
ciBjb2VmZi4NCklmIG5vIFJDQSBiaW4gZmlsZSBpcyBsb2FkLCB0aGUgdGFzMjc4MSBjYW4ndCB3
b3JrLCBpdCB3aWxsIGJlIFRBU0RFVklDRV9EU1BfRldfRkFJTC4NCklmIG9ubHkgUkNBIGJpbiBm
aWxlIGxvYWQsIHRoZSB0YXMyNzgxIHdpbGwgd29yayBpbiBieXBhc3MgbW9kZSwgd2hpY2ggZHNw
IGRvIG5vdCB3b3JrLCBuZWl0aGVyIHNwayBwcm90ZWN0aW9uIG5vciBhY291c3RpYyANCmFsZ29y
aXRobSBpcyBlbmFibGVkIA0KKFRBU0RFVklDRV9SQ0FfRldfT0spLg0KSWYgYm90aCBSQ0EgYmlu
IGFuZCBkc3AgZmlybXdhcmUgYXJlIGxvYWRlZCwgdGhhdCBpcyBUQVNERVZJQ0VfRFNQX0ZXX0FM
TF9PSywgdGFzMjc4MSB3b3JrIGluIGRzcCBtb2RlLCBib3RoIHNwayBwcm90ZWN0aW9uDQphbmQg
YWNvdXN0aWMgYWxnb3JpdGhtIGFyZSBlbmFibGVkDQo+IA0KPiANCj4gPiAgCQl0YXNkZXZpY2Vf
ZHNwX3JlbW92ZSh0YXNfcHJpdik7DQo+ID4gIAl9DQo+ID4gIAltdXRleF91bmxvY2soJnRhc19w
cml2LT5jb2RlY19sb2NrKTsNCj4gPiBAQCAtNDY2LDE0ICs0NzQsMTQgQEAgc3RhdGljIGludCB0
YXNkZXZpY2Vfc3RhcnR1cChzdHJ1Y3QNCj4gPiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFt
LCAgew0KPiA+ICAJc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb2RlYyA9IGRhaS0+Y29tcG9u
ZW50Ow0KPiA+ICAJc3RydWN0IHRhc2RldmljZV9wcml2IFRBU0RFVklDRV9SQ0FfRldfT0sqdGFz
X3ByaXYgPQ0KPiBzbmRfc29jX2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjb2RlYyk7DQo+ID4gLQlp
bnQgcmV0ID0gMDsNCj4gPg0KPiA+IC0JaWYgKHRhc19wcml2LT5md19zdGF0ZSAhPSBUQVNERVZJ
Q0VfRFNQX0ZXX0FMTF9PSykgew0KPiA+IC0JCWRldl9lcnIodGFzX3ByaXYtPmRldiwgIkRTUCBi
aW4gZmlsZSBub3QgbG9hZGVkXG4iKTsNCj4gPiAtCQlyZXQgPSAtRUlOVkFMOw0KPiA+ICsJc3dp
dGNoICh0YXNfcHJpdi0+Zndfc3RhdGUpIHsNCj4gPiArCWNhc2UgVEFTREVWSUNFX1JDQV9GV19P
SzoNCj4gPiArCWNhc2UgVEFTREVWSUNFX0RTUF9GV19BTExfT0s6DQo+ID4gKwkJcmV0dXJuIDA7
DQo+ID4gKwlkZWZhdWx0Og0KPiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+ICAJfQ0KPiA+IC0N
Cj4gPiAtCXJldHVybiByZXQ7DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMgaW50IHRhc2Rldmlj
ZV9od19wYXJhbXMoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sDQo=
