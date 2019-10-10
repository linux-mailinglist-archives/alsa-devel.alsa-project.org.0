Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D54D2A7A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 15:10:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76E1F1671;
	Thu, 10 Oct 2019 15:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76E1F1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570713031;
	bh=KEHcLCmzY5HaUGZs2BrXL7xPrBXSkjweTc3N30wrD7Y=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=My4B7dQsqPNBvRDQ0LGcAC28y/Lt/qNxzPCouttqV0Wvv6wmConAmX/C4AXR42/hy
	 g7bK7SoHTsItLYn/0p0iQu95czF1XtmfAUlYcRzVPFA6Iny6nPk5g3qAzTsVTjNT64
	 2HpZdOPI8u2ldJXhBlw9+driYSV5+327btxdukK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8A1EF8045E;
	Thu, 10 Oct 2019 15:08:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32AB4F8038F; Thu, 10 Oct 2019 15:08:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,HTML_MESSAGE,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680061.outbound.protection.outlook.com [40.107.68.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D681DF802BC
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 15:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D681DF802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="FmP+InSI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bt/C+G7kZUBq7BDH8FYBTno+SpKOA+oJLbkHiehEGNFC7KWKMQR/9LV9olbCybZ49aIAmFus7IRfRMB/ZPyZGEyLGfFnSnppGmmkxIeIEfRpUmrKVSk15ZH/5aIx6Fxv/L9h203ltt94A5SeB83Xpkr0ka0o3bT0KNfqgqNCBCMLpTOBr6PAVakXa2+1nRI4Of8cazlCTRXvDB+vRViAejA+5o1aVWcKe9bH3hFBeKZ++OBl3c2ObHdQMCaPBgoqNcJzuqVpDudgpCn+x2MyZQ6PPxP1Hc30UwgfdNg5ay8HSTpT7FqWLfPJVtq2BgPZKNO0TLRVmPdiI5Ai87wpjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11WLeJwMxXWx10pwPRnk8fpMUvspbKKe3mpkej7RQZk=;
 b=nIt37e2akLaSDQec+QE4oBNekesju4nJC1PXkym1cAjrrq5oIUsyO2jUWkcBKwzJx6WJz7W9YNfI4jQ9Q+0RqbasaWv9toZuyIGpmpcZ+CyfBgEClTch9axynCVwo0fM+UsJnQR0ln83a+sBg9Ul8jVN0IS7tsGRGCS0njXm5FN/DNjNLMP0k5cqb9MX627ncLMB0OVnvHDrq/03aKjpPfMyAZbT0poyJur6t7uLuAIpoT9NeeAlWn4qoARqIO+5DcO6ohKJVOsmtEa1qKTwaXZTQtNIygB2L1QXb0kwQUr/CQznhKpP2tIiTAQkOE52j6uuKuHPKOH3Twe5B/pdzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11WLeJwMxXWx10pwPRnk8fpMUvspbKKe3mpkej7RQZk=;
 b=FmP+InSIJdnBG6JrKGEx7RTFVoBZje4Zy5Qkgi7o5tyRBiCbLZVH2DEYDjHsXhXK5KYq51b6a23fbdJv3nkG45HI4LD+PDWYtbhHq0F0NUAdgeowRLJP53fu2vaiUzmpUFwauP6uBQB1DxrqYtEViqCBM73KZ6rnCXAN77GJZTY=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6SPR01MB0050.namprd12.prod.outlook.com (20.178.29.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 10 Oct 2019 13:08:35 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1%4]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 13:08:35 +0000
From: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
To: Lee Jones <lee.jones@linaro.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Thread-Topic: [PATCH 2/7] ASoC: amd: Registering device endpoints using MFD
 framework
Thread-Index: AQHVd5gysBGn4q83rEe097OrmwWXeadFWHuAgADs8gD//2r6AIAAc1YAgAEphICAAAlmgIAABseAgAyKavA=
Date: Thu, 10 Oct 2019 13:08:35 +0000
Message-ID: <DM6PR12MB3868561CDEEF9D21940E8F57E7940@DM6PR12MB3868.namprd12.prod.outlook.com>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1569891524-18875-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191001064539.GB11769@dell> <2ff13a61-a346-4d49-ab3a-da5d2126727c@amd.com>
 <20191001120020.GC11769@dell>
 <BN6PR12MB180930BD7D03FD7DEB14D7C1F79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <20191002123759.GD11769@dell>
 <BN6PR12MB1809451A3152488F3D8D1371F79C0@BN6PR12MB1809.namprd12.prod.outlook.com>,
 <20191002133553.GA21172@dell>
In-Reply-To: <20191002133553.GA21172@dell>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-originating-ip: [27.59.141.44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4eb25917-10d7-4a21-e67d-08d74d82f545
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6SPR01MB0050:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6SPR01MB00509AC80F98C0033777DE0DE7940@DM6SPR01MB0050.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(13464003)(189003)(199004)(6636002)(66066001)(52536014)(55016002)(6436002)(4326008)(86362001)(6306002)(54896002)(33656002)(5660300002)(9686003)(66446008)(2906002)(3846002)(6116002)(64756008)(66556008)(66476007)(8936002)(66946007)(76116006)(6246003)(91956017)(81156014)(236005)(7736002)(74316002)(81166006)(8676002)(229853002)(7696005)(476003)(45080400002)(256004)(71200400001)(76176011)(99286004)(71190400001)(26005)(14454004)(478600001)(6506007)(186003)(53546011)(486006)(102836004)(446003)(316002)(110136005)(25786009)(54906003)(606006)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6SPR01MB0050;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pqVqbZA3jB5jIu3EMLJVlGE2PkVcm6kan4I+XkEvRtJ+hQNySpkD6/k3qLRSCjGCCfQBXH2Kn9EHoR0BMxy4b3cjDPIBeFMwc39zdBvu6QtKYLxgIJSzAumHfZm2QryS3RUXbnAO8H83CnYh0rzwS3oWWdZLk7oc7wgzdY5TAoaAnCS2lotPHpAKXBtiW/GjJMjRBtvy7mMOLyp1HR+H8AkaZLRXolcy12zllMp7O2Ujgjjr09mqyQU3iRAj45nw2MYzaVfdqbLEkt0P5542w+2a8d9UBHMTVZy3kMROU3npIt4CFqunJhPz/tlilJFgWjqxupHGdjI9syXLO6JdkswpW9FwUdx6ZHbAmKhWdJ1BNS2THfVOaxCD6RrbNrW+JF0Vh1tryzRRb4sx31HLemvOwGLygHwxZu80soutS0v0H6vNU+bVwiRDFs4ppwHgeHsQlDJxdjyPzVWPWO7gnA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb25917-10d7-4a21-e67d-08d74d82f545
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 13:08:35.0941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: evYMwfcX8txK7bSa6TFpzJweikE8BLsjJfiE2pWTW+RCmZxPnIOlaihXDGq2376XVqBqHkQR9Ta+ChuNa6avPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6SPR01MB0050
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Mehta, Sanju" <Sanju.Mehta@amd.com>,
 Mark Brown <broonie@kernel.org>, "Mukunda, 
 Vijendar" <Vijendar.Mukunda@amd.com>, Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 2/7] ASoC: amd: Registering device
 endpoints using MFD framework
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgTGVlLA0KDQpXZSBoYXZlIHR3byBpbnN0YW5jZXMgQlQgYW5kIEkyUy4NCldlIG5lZWQgdG8g
Y3JlYXRlIGRldmljZXMgd2l0aCBzYW1lIG5hbWUgYWRkZWQgd2l0aCBudW1iZXIgb2YgZGV2aWNl
DQpsaWtlIGV4YW1wbGU6DQphY3AzeF9pMnNfcGxheWNhcC4xLmF1dG88aHR0cDovLzEuYXV0bz4N
CmFjcDN4X2kyc19wbGF5Y2FwLjIuYXV0bzxodHRwOi8vMi5hdXRvPg0KDQpieSB1c2luZyBNRkQg
d2UgY2FuIG1ha2UgaXQgaGFwcGVuIGF1dG9tYXRpY2FsbHkgYnkgZ2l2aW5nDQoiYWNwM3hfaTJz
X3BsYXljYXAiIGFuZCBvdGhlciBleHRlbnNpb24gd2lsbCBiZSBhZGRlZCBieSBNRkQgYWRkIGRl
dmljZSBBUEkuDQpUaGlzIGhlbHBzIHVzIGJ5IHJlY3RpZnlpbmcgdGhlIHJlbmFtaW5nIGlzc3Vl
IHdoaWNoIHdlIGdldCBieSB1c2luZw0KUGxhdGZvcm1fZGV2X2NyZWF0ZSBBUElgcy5JZiB3ZSBo
YXZlIHRvIHVzZSBwbGF0Zm9ybSByZWxhdGVkIEFQSXMgdGhlbg0Kd2UgbmVlZCB0byBnaXZlIGRp
ZmZlcmVudCBuYW1pbmcgY29udmVudGlvbnMgd2hpbGUgY3JlYXRpbmcgdGhlIGRldmljZXMNCmFu
ZCBjYW50IHVzZSBpdCBpbiBsb29wIGFzIHdlIGhhdmUgMyBkZXZpY2VzIHdlIG5lZWQgdG8gY2Fs
bCB0aHJlZQ0KZXhwbGljaXRseS5UaGlzIG1ha2Ugb3VyIGNvZGUgbGVuZ3RoeS4NCklmIHdlIHVz
ZSBNRkQgaXQgd291bGQgaGVscCB1cyBhIGxvdC4NCg0KUGxlYXNlIHN1Z2dlc3QgdXMgaG93IGNh
biB3ZSBwcm9jZWVkLg0KDQpUaGFua3MsDQpWaXNobnUNCg0KDQpHZXQgT3V0bG9vayBmb3IgQW5k
cm9pZDxodHRwczovL2FrYS5tcy9naGVpMzY+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQpGcm9tOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPg0KU2VudDogV2Vk
bmVzZGF5LCBPY3RvYmVyIDIsIDIwMTkgNzowNTo1MyBQTQ0KVG86IERldWNoZXIsIEFsZXhhbmRl
ciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NCkNjOiBSQVZVTEFQQVRJLCBWSVNITlUgVkFS
REhBTiBSQU8gPFZpc2hudXZhcmRoYW5yYW8uUmF2dWxhcGF0aUBhbWQuY29tPjsgTGlhbSBHaXJk
d29vZCA8bGdpcmR3b29kQGdtYWlsLmNvbT47IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9y
Zz47IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+OyBUYWthc2hpIEl3YWkgPHRpd2Fp
QHN1c2UuY29tPjsgTXVrdW5kYSwgVmlqZW5kYXIgPFZpamVuZGFyLk11a3VuZGFAYW1kLmNvbT47
IE1hcnV0aGkgU3Jpbml2YXMgQmF5eWF2YXJhcHUgPE1hcnV0aGkuQmF5eWF2YXJhcHVAYW1kLmNv
bT47IE1laHRhLCBTYW5qdSA8U2FuanUuTWVodGFAYW1kLmNvbT47IENvbGluIElhbiBLaW5nIDxj
b2xpbi5raW5nQGNhbm9uaWNhbC5jb20+OyBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9y
YWNsZS5jb20+OyBtb2RlcmF0ZWQgbGlzdDpTT1VORCAtIFNPQyBMQVlFUiAvIERZTkFNSUMgQVVE
SU8gUE9XRVIgTUFOQUdFTS4uLiA8YWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnPjsgb3BlbiBs
aXN0IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPg0KU3ViamVjdDogUmU6IFtQQVRDSCAy
LzddIEFTb0M6IGFtZDogUmVnaXN0ZXJpbmcgZGV2aWNlIGVuZHBvaW50cyB1c2luZyBNRkQgZnJh
bWV3b3JrDQoNCk9uIFdlZCwgMDIgT2N0IDIwMTksIERldWNoZXIsIEFsZXhhbmRlciB3cm90ZToN
Cg0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4NCj4gPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMiwgMjAx
OSA4OjM4IEFNDQo+ID4gVG86IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJA
YW1kLmNvbT4NCj4gPiBDYzogUkFWVUxBUEFUSSwgVklTSE5VIFZBUkRIQU4gUkFPDQo+ID4gPFZp
c2hudXZhcmRoYW5yYW8uUmF2dWxhcGF0aUBhbWQuY29tPjsgTGlhbSBHaXJkd29vZA0KPiA+IDxs
Z2lyZHdvb2RAZ21haWwuY29tPjsgTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPjsgSmFy
b3NsYXYNCj4gPiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6PjsgVGFrYXNoaSBJd2FpIDx0aXdhaUBz
dXNlLmNvbT47IE11a3VuZGEsDQo+ID4gVmlqZW5kYXIgPFZpamVuZGFyLk11a3VuZGFAYW1kLmNv
bT47IE1hcnV0aGkgU3Jpbml2YXMgQmF5eWF2YXJhcHUNCj4gPiA8TWFydXRoaS5CYXl5YXZhcmFw
dUBhbWQuY29tPjsgTWVodGEsIFNhbmp1DQo+ID4gPFNhbmp1Lk1laHRhQGFtZC5jb20+OyBDb2xp
biBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPjsgRGFuDQo+ID4gQ2FycGVudGVy
IDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+OyBtb2RlcmF0ZWQgbGlzdDpTT1VORCAtIFNPQyBM
QVlFUg0KPiA+IC8gRFlOQU1JQyBBVURJTyBQT1dFUiBNQU5BR0VNLi4uIDxhbHNhLWRldmVsQGFs
c2EtcHJvamVjdC5vcmc+Ow0KPiA+IG9wZW4gbGlzdCA8bGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZz4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvN10gQVNvQzogYW1kOiBSZWdpc3Rlcmlu
ZyBkZXZpY2UgZW5kcG9pbnRzIHVzaW5nIE1GRA0KPiA+IGZyYW1ld29yaw0KPiA+DQo+ID4gT24g
VHVlLCAwMSBPY3QgMjAxOSwgRGV1Y2hlciwgQWxleGFuZGVyIHdyb3RlOg0KPiA+DQo+ID4gPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+IEZyb206IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+DQo+ID4gPiA+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMSwgMjAx
OSA4OjAwIEFNDQo+ID4gPiA+IFRvOiBSQVZVTEFQQVRJLCBWSVNITlUgVkFSREhBTiBSQU8NCj4g
PiA+ID4gPFZpc2hudXZhcmRoYW5yYW8uUmF2dWxhcGF0aUBhbWQuY29tPg0KPiA+ID4gPiBDYzog
UkFWVUxBUEFUSSwgVklTSE5VIFZBUkRIQU4gUkFPDQo+ID4gPiA+IDxWaXNobnV2YXJkaGFucmFv
LlJhdnVsYXBhdGlAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlcg0KPiA+ID4gPiA8QWxleGFu
ZGVyLkRldWNoZXJAYW1kLmNvbT47IExpYW0gR2lyZHdvb2QNCj4gPiA8bGdpcmR3b29kQGdtYWls
LmNvbT47DQo+ID4gPiA+IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz47IEphcm9zbGF2
IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+Ow0KPiA+ID4gPiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1
c2UuY29tPjsgTXVrdW5kYSwgVmlqZW5kYXINCj4gPiA+ID4gPFZpamVuZGFyLk11a3VuZGFAYW1k
LmNvbT47IE1hcnV0aGkgU3Jpbml2YXMgQmF5eWF2YXJhcHUNCj4gPiA+ID4gPE1hcnV0aGkuQmF5
eWF2YXJhcHVAYW1kLmNvbT47IE1laHRhLCBTYW5qdQ0KPiA+IDxTYW5qdS5NZWh0YUBhbWQuY29t
PjsNCj4gPiA+ID4gQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT47IERh
biBDYXJwZW50ZXINCj4gPiA+ID4gPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT47IG1vZGVyYXRl
ZCBsaXN0OlNPVU5EIC0gU09DIExBWUVSIC8NCj4gPiA+ID4gRFlOQU1JQyBBVURJTyBQT1dFUiBN
QU5BR0VNLi4uIDxhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc+Ow0KPiA+IG9wZW4NCj4gPiA+
ID4gbGlzdCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4NCj4gPiA+ID4gU3ViamVjdDog
UmU6IFtQQVRDSCAyLzddIEFTb0M6IGFtZDogUmVnaXN0ZXJpbmcgZGV2aWNlIGVuZHBvaW50cw0K
PiA+ID4gPiB1c2luZyBNRkQgZnJhbWV3b3JrDQo+ID4gPiA+DQo+ID4gPiA+IE9uIFR1ZSwgMDEg
T2N0IDIwMTksIHZpc2hudSB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gPiBIaSBKb25lcywNCj4g
PiA+ID4gPg0KPiA+ID4gPiA+IEkgYW0gdmVyeSBUaGFua2Z1bCB0byB5b3VyIHJldmlldyBjb21t
ZW50cy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEFjdHVhbGx5IFRoZSBkcml2ZXIgaXMgbm90IHRv
dGFsbHkgYmFzZWQgb24gTUZELiBJdCBqdXN0IHVzZXMNCj4gPiA+ID4gPiBtZmRfYWRkX2hvdHBs
dWdfZGV2aWNlcygpIGFuZCBtZmRfcmVtb3ZlX2RldmljZXMoKSBmb3IgYWRkaW5nDQo+ID4gdGhl
DQo+ID4gPiA+ID4gZGV2aWNlcyBhdXRvbWF0aWNhbGx5Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
UmVtYWluaW5nIGNvZGUgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBNRkQgZnJhbWV3b3JrLg0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4gU28gSSB0aG91Z2h0IEl0IHdvdWxkIG5vdCBicmVhayB0aGUgY29k
aW5nIHN0eWxlIGFuZCBtb3ZlZCBhaGVhZA0KPiA+ID4gPiA+IGJ5IHVzaW5nIHRoZSBNRkQgQVBJ
IGJ5IGFkZGluZyBpdHMgaGVhZGVyIGZpbGUuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJZiBpdCBp
cyBhbnkgdmlvbGF0aW9uIG9mIGNvZGluZyBzdGFuZGFyZCB0aGVuIEkgY2FuIG1vdmUgaXQgdG8N
Cj4gPiA+ID4gPiBkcml2ZXJzL21mZC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoaXMgcGF0Y2gg
Y291bGQgYmUgYSBzaG93IHN0b3BwZXIgZm9yIHVzLlBsZWFzZSBzdWdnZXN0IHVzIGhvdw0KPiA+
ID4gPiA+IGNhbiB3ZSBtb3ZlIGFoZWFkIEFTQVAuDQo+ID4gPiA+DQo+ID4gPiA+IEVpdGhlciBt
b3ZlIHRoZSBNRkQgcGFydHMgdG8gZHJpdmVycy9tZmQsIG9yIHN0b3AgdXNpbmcgdGhlIE1GRCBB
UEkuDQo+ID4gPg0KPiA+ID4gVGhlcmUgYXJlIG1vcmUgZHJpdmVycyBvdXRzaWRlIG9mIGRyaXZl
cnMvbWZkIHVzaW5nIHRoaXMgQVBJIHRoYW4NCj4gPiA+IGRyaXZlcnMgaW4gZHJpdmVycy9tZmQu
DQo+ID4NCj4gPiBQZW9wbGUgZG8gd3JvbmcgdGhpbmdzIGFsbCB0aGUgdGltZS4gIEl0IGRvZXNu
J3QgbWFrZSB0aGVtIHJpZ2h0Lg0KPiA+DQo+ID4gPiBJbiBhIGxvdCBvZiBjYXNlcyBpdCBkb2Vz
bid0IG1ha2Ugc2Vuc2UgdG8gbW92ZSB0aGUgZHJpdmVyIHRvIGRyaXZlcnMvbWZkLg0KPiA+DQo+
ID4gSW4gdGhvc2UgY2FzZXMsIHRoZSBwbGF0Zm9ybV9kZXZpY2VfKigpIEFQSSBzaG91bGQgYmUg
dXNlZC4NCj4NCj4gV2h5IGRvIHdlIGhhdmUgYm90aD8gIEl0J3Mgbm90IGNsZWFyIHRvIG1lIG9u
IHdoZW4gd2Ugc2hvdWxkIHVzZSBvbmUNCg0KVGhlIHBsYXRmb3JtX2RldmljZV8qKCkgQVBJIGlz
IHRoZSBkZSBmYWN0byBBUEkgdG8gdXNlIGZvciByZWdpc3RlcmluZw0KZGV2aWNlcy4gIG1mZF8q
KCkgaXMgYSBmcmFtZXdvcmsgYnVpbHQgb24tdG9wIG9mIHRoYXQgZm9yIGRldmljZXMNCndoaWNo
IHJlZ2lzdGVyIHN1Yi1kZXZpY2VzIHRoYXQgZG8gbm90IHJlYXNvbmFibHkgcmVzaWRlIGVsc2V3
aGVyZS4NCg0KVGhlIG1mZF8qKCkgaGVscGVyIGZ1bmN0aW9ucyBzaG91bGQgb25seSBiZSB1c2Vk
IGJ5IE1GRCBkZXZpY2VzLg0KDQo+IHZzIHRoZSBvdGhlci4gIFRoZXNlIGFyZSBub3QgcGxhdGZv
cm1zIHBlciBzZSwgdGhleSBhcmUgUENJIGRldmljZXMNCj4gdGhhdCBoYXBwZW4gdG8gaGF2ZSBv
dGhlciBkZXZpY2VzIG9uIHRoZW0uICBPbiBwcmV2aW91cyBwcm9qZWN0cywgSQ0KPiB3YXMgdG9s
ZCB0byB1c2UgbWZkIGFuZCBubyBvYmplY3Rpb25zIHdlcmUgcmFpc2VkIGF0IHRoYXQgdGltZS4N
Cg0KV2hvIHRvbGQgeW91IHRvIHVzZSBNRkQgQVBJIG91dHNpZGUgb2YgZHJpdmVycy9tZmQ/ICBU
aGF0J3MgYSBoYWNrLg0KDQotLQ0KTGVlIEpvbmVzIFvA7sfty7ldDQpMaW5hcm8gU2VydmljZXMg
VGVjaG5pY2FsIExlYWQNCkxpbmFyby5vcmcgqaYgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFS
TSBTb0NzDQpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxp
bmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
