Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB278D75A1
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2024 15:15:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C99783B;
	Sun,  2 Jun 2024 15:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C99783B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717334108;
	bh=R/MS50cxneOyPgLypSlTlanwb/Hbu1+mxf+65n/qBIg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vz60VlMWq+VTE8WNOlH/GTAj6oIqO/6IdCJwuZjET3SkgJCrBczGtOPVRmglTiy4x
	 M4qA+xiH+DzURDSjpKZopNQSTKUyQPgdNJcFln1iJLoL6emJdkGCLEkAn/ZonyaY6+
	 fwzot30U84JWRgyk1CT6snjEV+j8lAMr/ryz+Es8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE22AF80496; Sun,  2 Jun 2024 15:14:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C06FF80236;
	Sun,  2 Jun 2024 15:14:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08901F8025A; Sun,  2 Jun 2024 15:11:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E19BF800AC
	for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2024 15:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E19BF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ODN9Sujw
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 452DBe7I128155;
	Sun, 2 Jun 2024 08:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717333900;
	bh=R/MS50cxneOyPgLypSlTlanwb/Hbu1+mxf+65n/qBIg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=ODN9SujwZjd63tBgqBx13NPWEjtE7XSE43INcnk1eAnOKVu9CYcTzMUzdti73RLiW
	 scW4oOi1QzcPLh0UN2MxnsXOLAl9sK3JfEqgCMBSpve67IKSO1xcn78CXsAG0oFr4R
	 nZULGEVtUibpzf8MURnXd4gnvz0X28nPAmXaN37c=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 452DBeWx029626
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Jun 2024 08:11:40 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Jun 2024 08:11:40 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Sun, 2 Jun 2024 08:11:40 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "13916275206@139.com"
	<13916275206@139.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com"
	<liam.r.girdwood@intel.com>,
        "tiwai@suse.de" <tiwai@suse.de>, "Xu, Baojun"
	<baojun.xu@ti.com>,
        "soyer@irl.hu" <soyer@irl.hu>,
        "Baojun.Xu@fpt.com"
	<Baojun.Xu@fpt.com>,
        "yuhsuan@google.com" <yuhsuan@google.com>,
        "Yue, Jaden"
	<jaden-yue@ti.com>, "Lo, Henry" <henry.lo@ti.com>,
        "Navada Kanyana, Mukund"
	<navada@ti.com>, "Hari, Raj" <s-hari@ti.com>,
        "zhourui@huaqin.com"
	<zhourui@huaqin.com>
Subject: RE: [EXTERNAL] Re: [PATCH v6] ASoC: tas2781: Fix wrong loading
 calibrated data sequence
Thread-Topic: [EXTERNAL] Re: [PATCH v6] ASoC: tas2781: Fix wrong loading
 calibrated data sequence
Thread-Index: AQHaqS31kPp1+e8rVkmNZkec74ALOLGg2NiAgBOuXWA=
Date: Sun, 2 Jun 2024 13:11:39 +0000
Message-ID: <138b621eeccc47329ec5fc808790667f@ti.com>
References: <20240518141546.1742-1-shenghao-ding@ti.com>
 <171623322336.94469.13172149100331733795.b4-ty@kernel.org>
In-Reply-To: <171623322336.94469.13172149100331733795.b4-ty@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.158]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: QP3CTMRABBV2KXUBMOWFXRLSLXNMJQKD
X-Message-ID-Hash: QP3CTMRABBV2KXUBMOWFXRLSLXNMJQKD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QP3CTMRABBV2KXUBMOWFXRLSLXNMJQKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQnJvd24NCk9uZSBvZiBteSBjdXN0b21lcnMgcmVxdWVzdGVkIHRhczI3ODEgZHJpdmVyIGlu
IGtlcm5lbCA2LjEwIHRvIGJlIG1lcmdlZCBpbnRvIGtlcm5lbCA2LjEuIA0KSSB3b25kZXJlZCBo
b3cgSSAgY2FuIGhhbmRsZSB0aGlzLiBNYXkgSSByZXN1Ym1pdCB0aGUgd2hvbGUgY29kZSBpbnRv
IGxhdGVzdCA2LjEgYnJhbmNoPw0KTG9va2luZyBmb3J3YXJkIHRvIHlvdXIgcmVwbHkuIFRoYW5r
cy4NCg0KQlINClNoZW5naGFvIERpbmcNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBN
YXkgMjEsIDIwMjQgMzoyNyBBTQ0KPiBUbzogRGluZywgU2hlbmdoYW8gPHNoZW5naGFvLWRpbmdA
dGkuY29tPg0KPiBDYzogYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tOyBsZ2lyZHdv
b2RAZ21haWwuY29tOw0KPiBwZXJleEBwZXJleC5jejsgcGllcnJlLWxvdWlzLmJvc3NhcnRAbGlu
dXguaW50ZWwuY29tOw0KPiAxMzkxNjI3NTIwNkAxMzkuY29tOyBhbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaWFtLnIuZ2lyZHdv
b2RAaW50ZWwuY29tOyBiYXJkLmxpYW9AaW50ZWwuY29tOw0KPiB5dW5nLWNodWFuLmxpYW9AbGlu
dXguaW50ZWwuY29tOyBMdSwgS2V2aW4gPGtldmluLWx1QHRpLmNvbT47DQo+IGNhbWVyb24uYmVy
a2VucGFzQGdtYWlsLmNvbTsgdGl3YWlAc3VzZS5kZTsgWHUsIEJhb2p1bg0KPiA8YmFvanVuLnh1
QHRpLmNvbT47IHNveWVyQGlybC5odTsgQmFvanVuLlh1QGZwdC5jb20NCj4gU3ViamVjdDogW0VY
VEVSTkFMXSBSZTogW1BBVENIIHY2XSBBU29DOiB0YXMyNzgxOiBGaXggd3JvbmcgbG9hZGluZw0K
PiBjYWxpYnJhdGVkIGRhdGEgc2VxdWVuY2UNCj4gDQouLi4NCj4gSWYgYW55IHVwZGF0ZXMgYXJl
IHJlcXVpcmVkIG9yIHlvdSBhcmUgc3VibWl0dGluZyBmdXJ0aGVyIGNoYW5nZXMgdGhleQ0KPiBz
aG91bGQgYmUgc2VudCBhcyBpbmNyZW1lbnRhbCB1cGRhdGVzIGFnYWluc3QgY3VycmVudCBnaXQs
IGV4aXN0aW5nIHBhdGNoZXMNCj4gd2lsbCBub3QgYmUgcmVwbGFjZWQuDQo+IA0KPiBQbGVhc2Ug
YWRkIGFueSByZWxldmFudCBsaXN0cyBhbmQgbWFpbnRhaW5lcnMgdG8gdGhlIENDcyB3aGVuIHJl
cGx5aW5nIHRvIHRoaXMNCj4gbWFpbC4NCj4gDQo+IFRoYW5rcywNCj4gTWFyaw0KDQo=
