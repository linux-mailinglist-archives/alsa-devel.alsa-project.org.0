Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94710AFFCB
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 17:19:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E8F916E9;
	Wed, 11 Sep 2019 17:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E8F916E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568215187;
	bh=+aVUc6jbpesUbKvFzrqimofncFDCvQoszfswE1xwufg=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c8FbrfOjnKWT3er7L3py/KDKaueTiFhsKePY/9tLpA24jdlTFGqrOJD7iF2biu4pc
	 nCFZ0hUTyYZvauF8F/CQ9nwqNyDBbg7qkcKKBj2Rg5SzVRMAlh0iJT5v7cw4y8z3VK
	 RTsxcg18GEdSHLX9YnF5J8qyocWTj+eRUNjazrmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1AB5F8060D;
	Wed, 11 Sep 2019 17:16:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CD11F80368; Tue, 10 Sep 2019 03:56:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,FROM_EXCESS_BASE64,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255054.outbound.protection.outlook.com [40.92.255.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D093F800A9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 03:56:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D093F800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="f7pWaVHI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xt7qBIoQZ/3AAaQGNyslbBS/sSz2N+zIEuwaywMEBuslYFtQABA/vxG6pXINd8ltBSwkGg/foO6ivu+2d6bDjeI1LWoqMLa3baBXmqvx18vkB5HL9rWQHlGYIeEMGR7jzep+/AJOmKBcHCdNJPFncuYVnUJmU2mQ/e3ZhbApQelVo9+21DtQlfsghNuZIuACMptSxbFtIq+MgZ2BXyoPYGkVHWQqzvK/JU/LXY4qOGKeCMeO+glTqgRGrtl/2/vmUmbS83Qd4SBhysInvi67BEtolcY8dlFSt46aIBDuBnacDpMNpGIvR64KOm6Sd2s9OyDQ84fZpWz/+AZpKuwSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bazp0fricJZVoDdFY3Sd/4O/5TiVW6yzZSHYLVp3pk=;
 b=Y/i0RxTsEmgOQnEvOOtRHent89RF7Va6M2pqu8z7HLeq/H53ldJ0eHG454wXe6Ko+InuhjBeq5mgHoRGf/5QfwUXJxxW7vyQonKI/+e0cwWa+fw9ACr7Lm/tdnKdgZPhqWoyw3eQMC4X1LcKBq4+8LcKPO89zAKhJ1PXje3IMfweTtMK4A/YK8YasEZnq8UhwI3AkqwIAtu3fhvqCRjI8pMYQjt03Air8/hJatWwcf9ASfRIckr0eYbxirtKTSbriVPNoVTqcEl+Y8F629uoYVljfLlcDqUBlntmuABk7zcy74zgcJ8P+Ie5zs0gA/CmulNDeucltN3PBMkbxG7jbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bazp0fricJZVoDdFY3Sd/4O/5TiVW6yzZSHYLVp3pk=;
 b=f7pWaVHI3lV5+mTEeeT0fOVKlzRRpQXoTL2FYn7UaycW+9DBLCz6ZecEUdW1Dk2OJT5M3bkIaxmg0ijM7iOh3wHvScFEpNvNOV1r/TYJnJqm4aVDEMDTFbzm5xcbDzRwu6UgHb2Your/pYGv9XTQ/qVEVCPx0JRH+2zBDoUn7X/jjBK0UtvYgKIWeLglb7H+5RRfDh7rbypOdka9I+hTOEe8y8r58P1r2/xf7pE39Z4zcoTf1NsWrcCg7k8smMCcy98qKCCgoi0CrzQgz1BxXaVjKOiHKAn66EY3hE+xzQv75jdwzWELj7q6eE0YfQN/dXnXzj5KGjjR/wpB0HFYpA==
Received: from HK2APC01FT006.eop-APC01.prod.protection.outlook.com
 (10.152.248.51) by HK2APC01HT069.eop-APC01.prod.protection.outlook.com
 (10.152.249.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.14; Tue, 10 Sep
 2019 01:56:07 +0000
Received: from HK2PR02MB3969.apcprd02.prod.outlook.com (10.152.248.58) by
 HK2APC01FT006.mail.protection.outlook.com (10.152.248.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 01:56:07 +0000
Received: from HK2PR02MB3969.apcprd02.prod.outlook.com
 ([fe80::e818:6810:e32f:5e7e]) by HK2PR02MB3969.apcprd02.prod.outlook.com
 ([fe80::e818:6810:e32f:5e7e%3]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 01:56:07 +0000
From: =?utf-8?B?6bKBIOa2tQ==?= <tridlh@hotmail.com>
To: Keyon Jie <yang.jie@linux.intel.com>
Thread-Topic: [alsa-devel] Licence change for your alsa-lib UCM commit (Lu,
 Han: 1 total)
Thread-Index: AQHVZtUgos8SohtSYkOmoejPV6qZ8KckKCd/
Date: Tue, 10 Sep 2019 01:56:07 +0000
Message-ID: <HK2PR02MB39694887BBF27E53BD85A121C0B60@HK2PR02MB3969.apcprd02.prod.outlook.com>
References: <15679391594432724-alsa-devel@perex.cz>
 <50d38c53-78c8-0593-2029-f5502c49b69f@perex.cz>,
 <977a5bd9-7dde-7207-bb93-fc008197faf0@linux.intel.com>
In-Reply-To: <977a5bd9-7dde-7207-bb93-fc008197faf0@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:D58010DF76A45B2BCFE17460638D4017CD4B8227A8F4ECE35DD3A6FA371940D7;
 UpperCasedChecksum:FC80D9084D637125E69C181318DFBB4C9C5B30EF5B01D8A9831024E6F48B0481;
 SizeAsReceived:6973; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [X5pqL2I0tqh5krDzWj8pz/tFjqzSqquT]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:HK2APC01HT069; 
x-ms-traffictypediagnostic: HK2APC01HT069:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-message-info: Gc9AYa5GnPrL96IU9rxrln9zIsIa/1dBRqd8ceP6Q7YEZaLBR0lMMITX6HuEDDglYFZqGWKDDX9cSgYGYjNZS0CT689sEp6ZVu8VMOuD1QIK1Seo8XjZ+H3Dk89tqaI2dJhymhShAdd24RputBUHiPn6w++H8/SqyIrKtq3LSf46ZwZRqqWP1pdheluD3v1Y
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6ada2d-091b-4a4a-beb2-08d735920b8a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 01:56:07.0764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT069
X-Mailman-Approved-At: Wed, 11 Sep 2019 17:16:14 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Licence change for your alsa-lib UCM commit (Lu,
 Han: 1 total)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgSmFyb3NsYXYsDQoNClN1cmUsIEkgYWdyZWUgd2l0aCB0aGUgY2hhbmdlLiBUaGFua3MuDQpB
bmQgdGhhbmtzIEtleW9uIGZvciBoZWxwLg0KDQpCUiwNCg0KSGFuIEx1DQoNCj4g5ZyoIDIwMTnl
ubQ55pyIOeaXpe+8jOS4i+WNiDI6MDnvvIxLZXlvbiBKaWUgPHlhbmcuamllQGxpbnV4LmludGVs
LmNvbT4g5YaZ6YGT77yaDQo+IA0KPiBIaSBKYXJvc2xhdiwNCj4gDQo+IEhlcmUgYWRkIEhhbidz
IG5ldyBlbWFpbCBhZGRyZXNzIHdoaWNoIG1heSBiZSBhcHByb2FjaGFibGUuDQo+IA0KPiB+S2V5
b24NCj4gDQo+PiBPbiAyMDE5LzkvOCDkuIvljYg4OjQ1LCBKYXJvc2xhdiBLeXNlbGEgd3JvdGU6
DQo+PiBSZXNlbmQgKGRlbGl2ZXJ5IGlzc3VlcyBmb3IgdGhlIGRpcmVjdCBlLW1haWwpLiBQbGVh
c2UsIGFuc3dlci4gVGhhbmsgeW91Lg0KPj4gICAgICAgICAgICAgICAgICAgIEphcm9zbGF2DQo+
PiAwOC4wOS4xOSBpbiAxMjozOSBKYXJvc2xhdiBLeXNlbGEgd3JvdGU6DQo+Pj4gQXMgZGlzY3Vz
c2VkLCB3ZSB3b3VsZCBsaWtlIHRvIG1vdmUgdGhlIFVDTSBjb25maWd1cmF0aW9uIGZpbGVzIGZy
b20gdGhlDQo+Pj4gYWxzYS1saWIgcmVwb3NpdG9yeSB0byBuZXcgYWxzYS11Y20tY29uZiByZXBv
c2l0b3J5IHdpdGggdGhlIGxpY2VuY2UgY2hhbmdlDQo+Pj4gZnJvbSBMR1BMLTIuMSB0byBCU0Qt
My1DbGF1c2UuDQo+Pj4gDQo+Pj4gSSB3b3VsZCBsaWtlIHRvIGNoZWNrLCBpZiB5b3UgYWdyZWUg
d2l0aCB0aGlzIGxpY2VuY2UgY2hhbmdlLiBQbGVhc2UsIGFuc3dlcg0KPj4+IHRvIHRoaXMgZS1t
YWlsIGFuZCB3cml0ZSB5b3VyIGFncmVlbWVudCAvIGRpc2FncmVlbWVudCAoa2VlcCBDQyB0bw0K
Pj4+IHRoZSBhbHNhLWRldmVsIG1haWxpbmcgbGlzdCBmb3IgdGhlIGFyY2hpdmluZyBwdXJwb3Nl
cykuDQo+Pj4gDQo+Pj4gVGhhbmsgeW91IGZvciB5b3VyIHRpbWUgYW5kIGNvLW9wZXJhdGlvbi4N
Cj4+PiANCj4+PiBSZWZlcmVuY2U6ICBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9w
aXBlcm1haWwvYWxzYS1kZXZlbC8yMDE5LUp1bHkvMTUzMjU3Lmh0bWwNCj4+PiANCj4+PiBMaXN0
IG9mIHlvdXIgY29tbWl0KHMpOg0KPj4+IA0KPj4+ICAgM2MyNjM3MTZmZDViZDJkOWQ1MzA4Y2Ix
M2RiYTY2N2QxMzhjMDA5Nw0KPj4+ICAgICBjb25mL3VjbTogYnJvYWR3ZWxsLXJ0Mjg2OiBhZGQg
dWNtIGNvbmZpZw0KPj4+IA0KPj4+IC0tLQ0KPj4+IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVy
ZXguY3o+DQo+Pj4gTGludXggU291bmQgTWFpbnRhaW5lcjsgQUxTQSBQcm9qZWN0OyBSZWQgSGF0
LCBJbmMuDQo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4+PiBBbHNhLWRldmVsIG1haWxpbmcgbGlzdA0KPj4+IEFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZw0KPj4+IGh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYWxzYS1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
