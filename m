Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F45B4184D
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Sep 2025 10:22:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A17EA601B4;
	Wed,  3 Sep 2025 10:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A17EA601B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756887767;
	bh=N0ZCxv90G25eo0Ved5BuTzC5yFsUyVfF1hJXMJKOPUw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iP464pPW1reeoXtFLXIvezxUt6Xn7rfprf1iet9XSKrg/Nv5zxGbKhxY6BKP3XrS2
	 QP/Y+DTy80+Vkn/9HXzcYT5jkrQVAFHeN6a0yGZsRnx1uZC43k9ZxMhxG1GNb+ennA
	 idBTJNFO12G67rouwAZ1TGoLKzZF0RVXw5y0ylpw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17F1BF805C4; Wed,  3 Sep 2025 10:22:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DE5BF80588;
	Wed,  3 Sep 2025 10:22:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 951AAF804D6; Wed,  3 Sep 2025 10:21:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 075ACF8011B
	for <alsa-devel@alsa-project.org>; Wed,  3 Sep 2025 10:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 075ACF8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=vkmezarc
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5838LlSr3219746;
	Wed, 3 Sep 2025 03:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756887707;
	bh=N0ZCxv90G25eo0Ved5BuTzC5yFsUyVfF1hJXMJKOPUw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=vkmezarcNbXOn9C29udxCpuL70RkLeIfu28AuryUQ6N3WUlwAbhT6VwaWga4fJb/t
	 CD1QTCvL1icIE5XwY2ylP+evZRFZeXKO/nZ/rztciJ5gCxHZ5fshDXAPr7hHrf88qs
	 iEiADfpqfDseU5qSyfvrMKGYauiMeoqPlQ+pcGHw=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5838LlVk2902531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 03:21:47 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 03:21:46 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.055; Wed, 3 Sep 2025 03:21:46 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "broonie@kernel.org" <broonie@kernel.org>,
        "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>,
        "13564923607@139.com" <13564923607@139.com>,
        "13916275206@139.com"
	<13916275206@139.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Xu, Baojun" <baojun.xu@ti.com>,
        "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>
Subject: RE: [EXTERNAL] Re: [PATCH v2] ALSA: hda/tas2781: Fix the order of
 TAS2781 calibrated-data
Thread-Topic: [EXTERNAL] Re: [PATCH v2] ALSA: hda/tas2781: Fix the order of
 TAS2781 calibrated-data
Thread-Index: AQHcHIktAJvNMNT5vE+BhvDY5ZGSArSBYW0A//+74SA=
Date: Wed, 3 Sep 2025 08:21:46 +0000
Message-ID: <27b157f549b64c15b77a60dfef84dcfd@ti.com>
References: <20250903041351.143-1-shenghao-ding@ti.com>
 <87cy88vw5t.wl-tiwai@suse.de>
In-Reply-To: <87cy88vw5t.wl-tiwai@suse.de>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.14.208]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: UKIZN2TAEFHPCYVZTBH3M5VZVNYE54EI
X-Message-ID-Hash: UKIZN2TAEFHPCYVZTBH3M5VZVNYE54EI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UKIZN2TAEFHPCYVZTBH3M5VZVNYE54EI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

R2xhZCB0byBhbnN3ZXIgeW91ciBxdWVzdGlvbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4NCj4gU2VudDogV2VkbmVz
ZGF5LCBTZXB0ZW1iZXIgMywgMjAyNSAzOjIxIFBNDQo+IFRvOiBEaW5nLCBTaGVuZ2hhbyA8c2hl
bmdoYW8tZGluZ0B0aS5jb20+DQo+IENjOiBicm9vbmllQGtlcm5lbC5vcmc7IGFuZHJpeS5zaGV2
Y2hlbmtvQGxpbnV4LmludGVsLmNvbTsNCj4gMTM1NjQ5MjM2MDdAMTM5LmNvbTsgMTM5MTYyNzUy
MDZAMTM5LmNvbTsgYWxzYS1kZXZlbEBhbHNhLQ0KPiBwcm9qZWN0Lm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgWHUsIEJhb2p1biA8YmFvanVuLnh1QHRpLmNvbT47DQo+IEJhb2p1
bi5YdUBmcHQuY29tDQo+IFN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6IFtQQVRDSCB2Ml0gQUxTQTog
aGRhL3RhczI3ODE6IEZpeCB0aGUgb3JkZXIgb2YNCj4gVEFTMjc4MSBjYWxpYnJhdGVkLWRhdGEN
Cj4gDQouLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uDQo+IFpqUWNtUVJZRnBmcHRCYW5uZXJFbmQN
Cj4gT24gV2VkLCAwMyBTZXAgMjAyNSAwNjoxMzo1MSArMDIwMCwNCj4gU2hlbmdoYW8gRGluZyB3
cm90ZToNCj4gPg0KPiA+IEEgYnVnIHJlcG9ydGVkIGJ5IG9uZSBvZiBteSBjdXN0b21lcnMgdGhh
dCB0aGUgb3JkZXIgb2YgVEFTMjc4MQ0KPiA+IGNhbGlicmF0ZWQtZGF0YSBpcyBpbmNvcnJlY3Qs
IHRoZSBjb3JyZWN0IHdheSBpcyB0byBtb3ZlIFIwX0xvdyBhbmQNCj4gPiBpbnNlcnQgaXQgYmV0
d2VlbiBSMCBhbmQgSW52UjAuDQo+ID4NCj4gPiBGaXhlczogNGZlMjM4NTEzNDA3ICgiQUxTQTog
aGRhL3RhczI3ODE6IE1vdmUgYW5kIHVuaWZpZWQgdGhlDQo+ID4gY2FsaWJyYXRlZC1kYXRhIGdl
dHRpbmcgZnVuY3Rpb24gZm9yIFNQSSBhbmQgSTJDIGludG8gdGhlIHRhczI3ODFfaGRhDQo+ID4g
bGliIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaGVuZ2hhbyBEaW5nIDxzaGVuZ2hhby1kaW5nQHRp
LmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+IHYyOg0KPiA+ICAtIFN1Ym1pdCB0byBzb3VuZCBicmFu
Y2ggbWFpbnRpYW5lZCBieSBUaXdhaSBpbnN0ZWFkIG9mIGxpbnV4LW5leHQNCj4gPiBicmFuY2gN
Cj4gPiAgLSBkcm9wIG90aGVyIGZpeA0KPiANCj4gWW91IGhhdmVuJ3QgYW5zd2VyZWQgdG8gbXkg
cHJldmlvdXMgcXVlc3Rpb24gYXQgYWxsLg0KPiANCj4gSXMgdGhlIGlzc3VlIHlvdSdyZSB0cnlp
bmcgdG8gZml4IHNvbWV0aGluZyBkaWZmZXJlbnQgZnJvbSB3aGF0IEdlcmdvIGFscmVhZHkNCj4g
Zml4ZWQgaW4gY29tbWl0IGQ1Zjg0NThlMzRhMzMxZTViMjI4ZGUxNDIxNDVlNjJhYzViZmRhMzQN
Cj4gKHdoaWNoIHdhcyBhbHJlYWR5IG1lcmdlZCB0byBMaW51cyB0cmVlKS4NClllcywgdGhpcyBw
YXRjaCBpcyB0byBmaXggVEFTMjc4MS4gR2VyZ28gZml4ZWQgVEFTMjU2Mw0KPiANCj4gDQo+IFRh
a2FzaGkNCg==
