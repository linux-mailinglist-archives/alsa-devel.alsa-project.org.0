Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33707C4071
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 20:55:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A39C21677;
	Tue,  1 Oct 2019 20:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A39C21677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569956102;
	bh=AUL1oy5vpd9HyHAZJkNiLgbwPoW2DZ65GVSh4oViJ2U=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I7l8RK61WcjPG4cykq8j+ZrzfHmubtMAhhCgIniEYSEt6ZwlIasaPVzeQw8/G68Kg
	 lfC6UbYYBMLh9dyVqZvDGjzkj4EqQymznCMSqx9beQxr+GGEv5Dzwp4yZTRkDei3B5
	 RUg5JftitDMe9RwEJZ7Dc+BlVbJ7y07VuTQweQjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D767AF80506;
	Tue,  1 Oct 2019 20:53:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F402DF80506; Tue,  1 Oct 2019 20:53:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700068.outbound.protection.outlook.com [40.107.70.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC7FEF800DE
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 20:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC7FEF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="wGRDtu2q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4IlWOc47EiryaXyKH+qUrPuRvUZmoEz+AM/rQJTl3G8O11tNQkPnPItNXeTEJibL1WJebTYRDKchun/3fPtarrg57mo/E+y3tBXhM2hyDQhHhFol9mnOYLidpHM8FXeY8wZsITjk5m3xnCWDun6pkSEJW5GuQ/lab3Ijp4F41+gK1GjNk+z9r8AIHX/h4DVuVfizPYhHCd0htCpfx8MOiHyasrZdTgHOy5rO9JaHdbvxnOsa2TaEblEsdZoR1707MQ697pkT/bZMqwgCv0Ytx1wEPhEfbDVVUf/KJe5TAPuUFQIIriVEGzpwBp0gEKQnPIRlVzNlYvyU1zzldYCDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=man0Je8iTGKTI5Md+rkb25uKgQPFDTfiH1vpR4XIBpk=;
 b=luctrPjg8PvIi7EY6qsR/K69EsfSZX6lR8OPIqu2AzkXPbfarGvUnamIosvOJfkVoSU+OG/zKiprTkacH4TjCV+o/pDdoCYBkgr9Ctc17WrQj03qO5vTc/7pb+5vnOWYUEA/BGaCvMpSuffc6U9V2Qh27oQU+oWrWwaNeYNH50wlGYkM9avv/uEkdWkBmnECp5iGm2JIACjar62YI4NuTLpUyZ0SlDllI5lBi8kyLcSazl6bezwjwf5J9v9SKIE0rTObJEwhlYcEpjI/oT0mnjBuq3lX+YZY/RTLtVQgN9iXhqc5lNq2Q7QQ8Bha4+pgDQRSo/Y2EPTzdVGswN3Xzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=man0Je8iTGKTI5Md+rkb25uKgQPFDTfiH1vpR4XIBpk=;
 b=wGRDtu2q3/o19W/5eKIbVXPPCvn/NcYkN1Jq8IvWZ8gD4fLHBNkMpYdzQJYYqq61HQBJbgMySFWfvNUYyWx9Ya/oWboYN7luOVlkIpReh7am16GBL5QljWVPze1NLNkWZvD72+hjGHgIp+oxgm8gXDLR6qO5A2KNTXfYChioIXw=
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1491.namprd12.prod.outlook.com (10.172.18.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 18:53:08 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::418d:e764:3c12:f961]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::418d:e764:3c12:f961%10]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 18:53:08 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Lee Jones <lee.jones@linaro.org>, "RAVULAPATI, VISHNU VARDHAN RAO"
 <Vishnuvardhanrao.Ravulapati@amd.com>
Thread-Topic: [PATCH 2/7] ASoC: amd: Registering device endpoints using MFD
 framework
Thread-Index: AQHVd5gywJvnY+WwrkWUotR2w3skaqdFWHuAgAA2g4CAACFpAIAAct1A
Date: Tue, 1 Oct 2019 18:53:08 +0000
Message-ID: <BN6PR12MB180930BD7D03FD7DEB14D7C1F79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1569891524-18875-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191001064539.GB11769@dell> <2ff13a61-a346-4d49-ab3a-da5d2126727c@amd.com>
 <20191001120020.GC11769@dell>
In-Reply-To: <20191001120020.GC11769@dell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65c4ea8b-b829-44e4-7b8d-08d746a099b1
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1491:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB149173EC1462E540F4C44A69F79D0@BN6PR12MB1491.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(13464003)(199004)(189003)(2906002)(6116002)(26005)(256004)(3846002)(53546011)(7696005)(6506007)(99286004)(102836004)(52536014)(81166006)(81156014)(486006)(71190400001)(5660300002)(8676002)(71200400001)(6636002)(446003)(186003)(476003)(76176011)(11346002)(110136005)(229853002)(33656002)(55016002)(66476007)(66556008)(64756008)(66446008)(6436002)(9686003)(478600001)(316002)(76116006)(86362001)(4326008)(66066001)(305945005)(74316002)(7736002)(6246003)(8936002)(14454004)(66946007)(25786009)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1491;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3P78y0yGAfn6tB88wJu4/g/jR4sBE4ORkybpod4KDxV2pXzftqsWwRq4SdXNSf0fpDfYDR5HseR984o4M68pfIYBe5MIwVneYFyezLi18vTxMrG05WLdzrAoE0gUF5jQrwnlefcHrp79Ax9/2K/3ti1RBNtS4lQJ2jbSpDTXpkiNaF3uMo0mL0CYGoRZlQnJBaHS8hcYoexPQWdtCEi7AVornGB/n9Hiiez3uGySQfIxTYIG1JuyONU3phJkx33DxU0LtMrXUBOAFBFfITnjuqnH7fRP69qgM0fWjgiGkGHwl16hNBeZpRkkV/n3+Ombs9QkQj2VPMxUA02M6L4s+u0Y/LZEFARb3h7JVC6CQBnDAsR3uzeIYkRDGIK6+U77SBz40Egi3HJFe+rmEh3vtcDNNRqhm7cICQK9BFqc+dM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c4ea8b-b829-44e4-7b8d-08d746a099b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 18:53:08.1412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ijaI5jejFDhKpH+N5roxOL8QC0t/frtv1VqbEhNVc8iKFA7EKD28H/JTPiGb+tzrFM14G6itsBRBUA7TF4mxIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1491
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Mehta, Sanju" <Sanju.Mehta@amd.com>,
 Mark Brown <broonie@kernel.org>, "Mukunda, 
 Vijendar" <Vijendar.Mukunda@amd.com>, "RAVULAPATI,
 VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDEsIDIwMTkgODowMCBBTQ0K
PiBUbzogUkFWVUxBUEFUSSwgVklTSE5VIFZBUkRIQU4gUkFPDQo+IDxWaXNobnV2YXJkaGFucmFv
LlJhdnVsYXBhdGlAYW1kLmNvbT4NCj4gQ2M6IFJBVlVMQVBBVEksIFZJU0hOVSBWQVJESEFOIFJB
Tw0KPiA8VmlzaG51dmFyZGhhbnJhby5SYXZ1bGFwYXRpQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4
YW5kZXINCj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBMaWFtIEdpcmR3b29kIDxsZ2ly
ZHdvb2RAZ21haWwuY29tPjsNCj4gTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPjsgSmFy
b3NsYXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej47DQo+IFRha2FzaGkgSXdhaSA8dGl3YWlAc3Vz
ZS5jb20+OyBNdWt1bmRhLCBWaWplbmRhcg0KPiA8VmlqZW5kYXIuTXVrdW5kYUBhbWQuY29tPjsg
TWFydXRoaSBTcmluaXZhcyBCYXl5YXZhcmFwdQ0KPiA8TWFydXRoaS5CYXl5YXZhcmFwdUBhbWQu
Y29tPjsgTWVodGEsIFNhbmp1DQo+IDxTYW5qdS5NZWh0YUBhbWQuY29tPjsgQ29saW4gSWFuIEtp
bmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT47IERhbg0KPiBDYXJwZW50ZXIgPGRhbi5jYXJw
ZW50ZXJAb3JhY2xlLmNvbT47IG1vZGVyYXRlZCBsaXN0OlNPVU5EIC0gU09DIExBWUVSDQo+IC8g
RFlOQU1JQyBBVURJTyBQT1dFUiBNQU5BR0VNLi4uIDxhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5v
cmc+Ow0KPiBvcGVuIGxpc3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggMi83XSBBU29DOiBhbWQ6IFJlZ2lzdGVyaW5nIGRldmljZSBlbmRwb2lu
dHMgdXNpbmcgTUZEDQo+IGZyYW1ld29yaw0KPiANCj4gT24gVHVlLCAwMSBPY3QgMjAxOSwgdmlz
aG51IHdyb3RlOg0KPiANCj4gPiBIaSBKb25lcywNCj4gPg0KPiA+IEkgYW0gdmVyeSBUaGFua2Z1
bCB0byB5b3VyIHJldmlldyBjb21tZW50cy4NCj4gPg0KPiA+IEFjdHVhbGx5IFRoZSBkcml2ZXIg
aXMgbm90IHRvdGFsbHkgYmFzZWQgb24gTUZELiBJdCBqdXN0IHVzZXMNCj4gPiBtZmRfYWRkX2hv
dHBsdWdfZGV2aWNlcygpIGFuZCBtZmRfcmVtb3ZlX2RldmljZXMoKSBmb3IgYWRkaW5nIHRoZQ0K
PiA+IGRldmljZXMgYXV0b21hdGljYWxseS4NCj4gPg0KPiA+IFJlbWFpbmluZyBjb2RlIGhhcyBu
b3RoaW5nIHRvIGRvIHdpdGggTUZEIGZyYW1ld29yay4NCj4gPg0KPiA+IFNvIEkgdGhvdWdodCBJ
dCB3b3VsZCBub3QgYnJlYWsgdGhlIGNvZGluZyBzdHlsZSBhbmQgbW92ZWQgYWhlYWQgYnkNCj4g
PiB1c2luZyB0aGUgTUZEIEFQSSBieSBhZGRpbmcgaXRzIGhlYWRlciBmaWxlLg0KPiA+DQo+ID4g
SWYgaXQgaXMgYW55IHZpb2xhdGlvbiBvZiBjb2Rpbmcgc3RhbmRhcmQgdGhlbiBJIGNhbiBtb3Zl
IGl0IHRvDQo+ID4gZHJpdmVycy9tZmQuDQo+ID4NCj4gPiBUaGlzIHBhdGNoIGNvdWxkIGJlIGEg
c2hvdyBzdG9wcGVyIGZvciB1cy5QbGVhc2Ugc3VnZ2VzdCB1cyBob3cgY2FuIHdlDQo+ID4gbW92
ZSBhaGVhZCBBU0FQLg0KPiANCj4gRWl0aGVyIG1vdmUgdGhlIE1GRCBwYXJ0cyB0byBkcml2ZXJz
L21mZCwgb3Igc3RvcCB1c2luZyB0aGUgTUZEIEFQSS4NCg0KVGhlcmUgYXJlIG1vcmUgZHJpdmVy
cyBvdXRzaWRlIG9mIGRyaXZlcnMvbWZkIHVzaW5nIHRoaXMgQVBJIHRoYW4gZHJpdmVycyBpbiBk
cml2ZXJzL21mZC4gIEluIGEgbG90IG9mIGNhc2VzIGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBt
b3ZlIHRoZSBkcml2ZXIgdG8gZHJpdmVycy9tZmQuDQoNCkFsZXgNCg0KPiANCj4gLS0NCj4gTGVl
IEpvbmVzIFvmnY7nkLzmlq9dDQo+IExpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZA0KPiBM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MgRm9sbG93IExp
bmFybzogRmFjZWJvb2sgfA0KPiBUd2l0dGVyIHwgQmxvZw0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
