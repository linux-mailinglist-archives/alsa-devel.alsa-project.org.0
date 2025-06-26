Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E85F8AEB8E2
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:28:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C40ED60328;
	Fri, 27 Jun 2025 15:28:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C40ED60328
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030897;
	bh=zhosX0JBBePq7//6mnw4XH0q9/FOQItlwPdQ91fv/vY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tMF751JwYtP214bVS9JGuYr8Owi1vJqHvj+2IcrE+zZqb39Kx84ujoi0emPMQHEu1
	 CXfq5ppfpKX5mXTvRXuwx+zmUDNsO3fEngWYc2vRh3RDs8W7B7vnP5qB2q63ycAadD
	 qaaPJpQSmrl+7WBrgTIMZUM9CjehP3NBSqYH/zBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6171CF805D9; Fri, 27 Jun 2025 15:24:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CE44F80641;
	Fri, 27 Jun 2025 15:24:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9E8FF8016E; Thu, 26 Jun 2025 16:23:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4EA8F800FA
	for <alsa-devel@alsa-project.org>; Thu, 26 Jun 2025 16:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4EA8F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ICm23Q9Z
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QENiHG2446687;
	Thu, 26 Jun 2025 09:23:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750947824;
	bh=zhosX0JBBePq7//6mnw4XH0q9/FOQItlwPdQ91fv/vY=;
	h=From:To:CC:Subject:Date;
	b=ICm23Q9Z8ibvXA4LvmpDjGLGVWdzE0NXkWD+KWFHRhf6N2i9DraMl2yNlkFErCVfk
	 bESvQRy1VXkMe5/KlUw6Q4nJtVjMfBuAhtVQGaN/4xhd36veUNRqcPWFhZS6G0fWSL
	 gaIenQY836jvwMA+ycMp0rFi0XQ1oUVOJ9GI8l4U=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QENiiY2057158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 09:23:44 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 09:23:43 -0500
Received: from DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6]) by
 DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6%17]) with mapi id
 15.01.2507.055; Thu, 26 Jun 2025 09:23:43 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "broonie@kernel.org" <broonie@kernel.org>,
        "tiwai@suse.de"
	<tiwai@suse.de>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "Xu, Baojun" <baojun.xu@ti.com>,
        "Ding, Shenghao" <shenghao-ding@ti.com>,
        "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
        "Navada Kanyana,
 Mukund" <navada@ti.com>,
        "Hampiholi, Vallabha" <v-hampiholi@ti.com>
Subject: Re: [PATCH v2 2/4] Asoc: tac5x1x: document tac5x1x codec
Thread-Topic: [PATCH v2 2/4] Asoc: tac5x1x: document tac5x1x codec
Thread-Index: Advmo2XvBxMK9Y3BTqapXqunA0wUsA==
Date: Thu, 26 Jun 2025 14:23:43 +0000
Message-ID: <02bd6e338b114622993ae829fb0d4f5b@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.82.30.14]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BZOPQNCCNCBUNM6QF5QRJ5YHTQLVLH3R
X-Message-ID-Hash: BZOPQNCCNCBUNM6QF5QRJ5YHTQLVLH3R
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:24:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZOPQNCCNCBUNM6QF5QRJ5YHTQLVLH3R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhhbmsgeW91IGZvciB0aGUgdGltZSBhbmQgcmV2aWV3IGNvbW1lbnQuDQoNCj4gRnJvbTogQW5k
eSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgSnVuZSAyNSwgMjAyNSA4OjAxIFBNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djIgMi80XSBBc29jOiB0YWM1eDF4OiBkb2N1bWVudCB0YWM1eDF4IGNvZGVjDQo+IA0KPiBPbiBU
dWUsIEp1biAyNCwgMjAyNSBhdCAwOTowNzo0MFBNICswNTMwLCBOaXJhbmphbiBIIFkgd3JvdGU6
DQo+ID4gdGFjNXgxeCBmYW1pbHkgYXJlIHNlcmllcyBvZiBsb3ctcG93ZXIgYW5kIGhpZ2ggcGVy
Zm9ybWFuY2UNCj4gPiBtb25vL3N0ZXJlbyBhdWRpbyBjb2RlY3MgY29uc2lzdHMgb2YgQURDIGFu
ZCBEQUMgY29tYmluYXRpb25zLg0KPiANCj4gQXJlbid0IERUIGJpbmRpbmdzIGNoYW5nZXMgc3Vw
cG9zZWQgdG8gZm9sbG93IHRoZSBjb21tb24gdGVtcGxhdGUgaW4gdGhlDQo+IFN1YmplY3Q/DQpJ
cyBpdCBva2F5IHRvIGNoYW5nZSB0aGUgc3ViamVjdCBpbiB0aGUgbmV4dCBwYXRjaCBvciBrZWVw
IHVzaW5nIHRoZSANCnNhbWUgc3ViamVjdCB0cmFja2luZz8gIHBsZWFzZSBzdWdnZXN0Lg0KPiAN
Cj4gTW9yZSBpbXBvcnRhbnQsIHRoZSBDYyBsaXN0IG1pc3NlZCBEVCBtYWlsaW5nIGxpc3RzIGFu
ZCBtYWludGFpbmVycy4NCj4gV2hhdCdzIGdvaW5nIG9uIGhlcmUsIHBsZWFzZT8NClBhcmRvbiBt
eSBpZ25vcmFuY2UuIA0KSSB3aWxsIGFkZHJlc3MgaW4gdGhlIG5leHQgcGF0Y2guDQoNClJlZ2Fy
ZHMNCk5pcmFuamFuDQo=
