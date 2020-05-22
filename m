Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ED81DEB9F
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 17:16:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C64C6182F;
	Fri, 22 May 2020 17:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C64C6182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590160576;
	bh=iPWhseW6VxF9Nm4CDe1HMJWg1WLkjWoTikTkL6HrhTY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=maHuoheTj6tiW6ZUTrCQoNG+rPKZKl3PEOJl8AxpeQQ/PcTZ15+cxHe/RTL5wDLxr
	 +JnGC05DRTl9VLvbCQXiu0By9P+G7C50Ex615KTwQGXEf2hlIOx8HYpXETNFWv0OPh
	 LI9Swvvpqg7OXeWAFT67Ljds9hu9yFJppeROe4E4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC35FF80111;
	Fri, 22 May 2020 17:14:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A033F801F9; Fri, 22 May 2020 17:14:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89FC4F80111
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 17:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89FC4F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="d8MP6gLx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7stsOZp6Qf5DOhLZ21xpmXWagmYLSAKshza9rf/GyjJFy0BKLfh9s2atRpzHNEaudWPK1jq7MkyPeSIRDW9pmhcCnS6QV7Bly71WnX9w2/E/Rban7DKaZblm22QbYz3Mv7UEqZeI+txch0507Yhdrhpa3RTvpg53sq2D80yYn8OS7nG080D1gax8rG7fI++uw/G73b7rmXtzDWi9ueP57HixZTnrTQHumhjAqDn14ho9/8TgwBH1tOS6fuLr5PRHVT5VTpJgzCeGujX14uaQRY4yZ2dVMHp3Jf1GPkAA059AYhe3DFZCXtP8G4geo231LqFiOFXAZGVTQlY/SZokA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPWhseW6VxF9Nm4CDe1HMJWg1WLkjWoTikTkL6HrhTY=;
 b=G6X36y5hLY6sg0gptMkgbZIiq+NmEmSCrLb+46zxmAvIX92xwEXqBts+Bs9cf1K7DzBlxqWDfHtUU9JYF5TiG301KG9Q99kCxvR5yxq8+sOKuTQEDM6GcqqATnFLfFW0eSLT4/W+et5k1AMRtHfcJHdjXtp4nVqY1ZAYeJGEGLY3xrA78yIH35JFgkTbdt2NWsfCfjsHsH+RCW/1ka3wTewTubFZWh8qedPXTUO3tPlfu8bHh2j1Zc96/ccl1hSKokLJU+h4tGtbfscKNZQ7jtsw/RPWYzlyhvm63Xx9/mNCoAOvgQXBsJXq5MwrFUgDiXskDB8fIeuPDDCGbEimHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPWhseW6VxF9Nm4CDe1HMJWg1WLkjWoTikTkL6HrhTY=;
 b=d8MP6gLxGI90rbN/SQ4x3zcIeyipP56dszGkRTSgWxZQZqLBCzG5ZcUijmB5YAbZvCdvX1g4fZZbUkbztklfT8TfxYVztM1NVm0IG6Su76G/BTC6Bo8b7n5U8LJWFINu2tPO7PGuF02BEm7len4p8gkf4S1pJqvwseE23ZNiDJA=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3259.namprd12.prod.outlook.com (2603:10b6:5:180::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.27; Fri, 22 May 2020 15:14:21 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.3000.034; Fri, 22 May 2020
 15:14:21 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Hui Wang <hui.wang@canonical.com>, Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
Thread-Topic: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
Thread-Index: AQHWMBGAxjoSFfw9qEKCikUbd/uKQqiz8myAgAAAyuCAAAM0AIAAADWggAAa/ACAABASgIAABwTggAAKD9A=
Date: Fri, 22 May 2020 15:14:21 +0000
Message-ID: <DM6PR12MB2633FECD2F752EFE8DD4A6AA97B40@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200522081738.11636-1-hui.wang@canonical.com>
 <20200522110811.GB5801@sirena.org.uk>
 <DM6PR12MB2633D541378EB715AC18531C97B40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <20200522112228.GD5801@sirena.org.uk>
 <DM6PR12MB26337FD48A99D14814EB32F097B40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <2285006c-388c-810f-c1ac-ef76ab2319bb@canonical.com>
 <0acc99c4-6fe0-b613-4af2-5439ecd8981b@canonical.com>
 <DM6PR12MB26335DA69D595C332A20779697B40@DM6PR12MB2633.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB26335DA69D595C332A20779697B40@DM6PR12MB2633.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-05-22T15:00:25Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=2c5178c8-1243-493d-b25a-00009983d526;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-05-22T15:14:19Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: 2f99b83d-24af-4857-9e14-00000cdb134a
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ab0e83f6-1328-471a-44e3-08d7fe62ce26
x-ms-traffictypediagnostic: DM6PR12MB3259:
x-microsoft-antispam-prvs: <DM6PR12MB325959D036C4FE9B080CD56997B40@DM6PR12MB3259.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XBc25N6vFB0wT29VcZndB+Ta69DvxMuJbkcS+REsAmAOaObSQhAnPA7dZnvJ0o1ZRRuDEl/Zs+zsDXfbtDUC0Z1aMseA49gyc3txNu9HYzQy+S4S+kcGyXkEDhqHo9MlcCjjaqaMeOg64MAr8vFMvCiLwL+9NKjPuHYXlgqpJqvyvlfRDxE/LLIyfaSYM9dtFP/592AoG1S5EQGNoqyjHCMV0kHryrQGmiI7r4hFefzUv8rGMXZfLfMpL41QdzfQpCrj4Rjjo183ltfjr9ANGH/9lFbeRATw4QDOMR58P9duZ6Xk2xoISg4w2FBAA0Dcohvrwb11wqJ/Y2QMDyE8AA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(66476007)(6506007)(7696005)(8676002)(2940100002)(8936002)(66946007)(64756008)(66446008)(110136005)(4326008)(316002)(76116006)(33656002)(26005)(2906002)(52536014)(9686003)(478600001)(53546011)(86362001)(55016002)(186003)(66556008)(71200400001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: l0km+MA63STcC56Zv3a2buRxC7lEhpTMmSvcRXrrMy3KgkRIPZZ4WxAfGFYwskoXds3nSIIRTEVBLSqu2p0CSfX3LTujPY3RWGurAyojYHa/lmWSTlDwUGWDHCgG5K+5PSQkd75pD+IquaTgV7fl/dj6K1naf3wRkxUgQSQKhmNo3NSIV85JQ2drKGmmpQ3tCCGA8haYzZb3ugr+Ipp3bvRYrlVKjjif7Uv1kIkT4AZ1SXi4fo25OKY6X5sayjqQ3BuXau6s9hz4InRSyXGKRqbEx+70sAYqnLSgauyS63FAwyiqkMaoP1wY/tMyxsTzCJmxQid0qB2xA4RqxiDzLCI82hfsurtw2u35LpcMF7JNF2nfibFOcqzJ2sglm3fZF7E4MxnN2gsWAX7Jo8wjv+oKqC/05HSxPiZkW1g5J8Ki0asSz6g/+RxiTADQVkN3SXuexCjyAJiLvfqY0LpY9xOXHPInuvPOkGLpRoz1rPkfYrNqCuSysvoMExMNG75h
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0e83f6-1328-471a-44e3-08d7fe62ce26
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 15:14:21.3629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 03v6IFMRDzaLij9D4wqRhzb/IOZTSBYp3XgI6BEakwbEa2m7R5FG5sLv9Xe6L/7DJ8H1ECwHAN/2bMb2Sm1Z7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3259
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVrdW5kYSwgVmlqZW5k
YXINCj4gU2VudDogRnJpZGF5LCBNYXkgMjIsIDIwMjAgODowMSBQTQ0KPiBUbzogJ0h1aSBXYW5n
JyA8aHVpLndhbmdAY2Fub25pY2FsLmNvbT47IE1hcmsgQnJvd24NCj4gPGJyb29uaWVAa2VybmVs
Lm9yZz4NCj4gQ2M6IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSRTog
W1BBVENIIHYyXSBBU29DOiBhbWQ6IHB1dCBvZmYgcmVnaXN0ZXJpbmcgbWFjaCBwbGF0Zm9ybV9k
ZXYgdG8NCj4gYXZvaWQgLTUxNyBlcnINCj4gDQo+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBJ
bnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0NCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEh1aSBXYW5nIDxodWkud2FuZ0BjYW5vbmljYWwuY29t
Pg0KPiA+IFNlbnQ6IEZyaWRheSwgTWF5IDIyLCAyMDIwIDc6MjcgUE0NCj4gPiBUbzogTXVrdW5k
YSwgVmlqZW5kYXIgPFZpamVuZGFyLk11a3VuZGFAYW1kLmNvbT47IE1hcmsgQnJvd24NCj4gPiA8
YnJvb25pZUBrZXJuZWwub3JnPg0KPiA+IENjOiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcN
Cj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBBU29DOiBhbWQ6IHB1dCBvZmYgcmVnaXN0ZXJp
bmcgbWFjaCBwbGF0Zm9ybV9kZXYgdG8NCj4gPiBhdm9pZCAtNTE3IGVycg0KPiA+DQo+ID4NCj4g
PiBPbiAyMDIwLzUvMjIg5LiL5Y2IODo1OSwgSHVpIFdhbmcgd3JvdGU6DQo+ID4gPg0KPiA+ID4g
T24gMjAyMC81LzIyIOS4i+WNiDc6MjgsIE11a3VuZGEsIFZpamVuZGFyIHdyb3RlOg0KPiA+ID4+
DQo+ID4gPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPj4+IEZyb206IE1hcmsg
QnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4NCj4gPiA+Pj4gU2VudDogRnJpZGF5LCBNYXkgMjIs
IDIwMjAgNDo1MiBQTQ0KPiA+ID4+PiBUbzogTXVrdW5kYSwgVmlqZW5kYXIgPFZpamVuZGFyLk11
a3VuZGFAYW1kLmNvbT4NCj4gPiA+Pj4gQ2M6IEh1aSBXYW5nIDxodWkud2FuZ0BjYW5vbmljYWwu
Y29tPjsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnDQo+ID4gPj4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjJdIEFTb0M6IGFtZDogcHV0IG9mZiByZWdpc3RlcmluZyBtYWNoDQo+ID4gPj4+IHBs
YXRmb3JtX2RldiB0bw0KPiA+ID4+PiBhdm9pZCAtNTE3IGVycg0KPiA+ID4+Pg0KPiA+ID4+PiBP
biBGcmksIE1heSAyMiwgMjAyMCBhdCAxMToxMzo0M0FNICswMDAwLCBNdWt1bmRhLCBWaWplbmRh
ciB3cm90ZToNCj4gPiA+Pj4NCj4gPiA+Pj4+IERvZXMgc291bmQgY2FyZCByZWdpc3RyYXRpb24g
ZmFpbHVyZSBhdCBib290IHRpbWUgZHVlIHRvIG1vZHVsZXMNCj4gPiA+Pj4+IGxvYWRpbmcNCj4g
PiA+Pj4gb3JkZXIgY2FuIGJlIGNvbnNpZGVyZWQgYXMgYnVnID8NCj4gPiA+Pj4NCj4gPiA+Pj4g
Tm8sIHRoaXMgaXMgdG90YWxseSBub3JtYWwuwqAgSWYgaXQgZmFpbGVkIHRvIGJpbmQgZXZlciB0
aGVuIHRoYXQnZCBiZSBhDQo+ID4gPj4+IHByb2JsZW0gYnV0IHRoaXMgaXMganVzdCBkZWZlcnJp
bmcuDQo+ID4gPj4gSW4gdGhhdCBjYXNlLCB3ZSBkb24ndCBuZWVkIHRoaXMgd29yayBhcm91bmQg
SSBndWVzcy4NCj4gPiA+PiBBdCBtYXhpbXVtIGR1cmluZyBib290IHRpbWUsIHdlIG1heSBzZWUg
ZmV3IHNvdW5kIGNhcmQgcmVnaXN0cmF0aW9uDQo+ID4gPj4gZmFpbHVyZSBsb2dzLA0KPiA+ID4+
IFdoaWNoIGlzIG5vcm1hbC4NCj4gPiA+Pg0KPiA+ID4+IFdpdGggdGhpcyBjaGFuZ2UsIG91ciBj
b25jZXB0IG9mIEFDUCBwYXJlbnQgZGV2aWNlIHdoaWNoIHdpbGwgY3JlYXRlDQo+ID4gPj4gcGxh
dGZvcm0gZGV2aWNlcw0KPiA+ID4+IGZvciBETUEgZHJpdmVyLCBHZW5lcmljIERNSUMgZHJpdmVy
IGFuZCBNYWNoaW5lIGRyaXZlciB3aWxsIGJlIGNoYW5nZWQuDQo+ID4gPj4gV2UgaW1wbGVtZW50
ZWQgc2FtZSBkZXNpZ24gZm9yIFJhdmVuIEkyUyBkcml2ZXIgYXMgd2VsbCB3aGljaCBnb3QNCj4g
PiA+PiBwcm9kdWN0aXplZC4NCj4gPiA+Pg0KPiA+ID4gT0ssIGdvdCBpdC7CoCBJdCBkb2Vzbid0
IGFmZmVjdCB0aGUgc291bmQgZnVuY3Rpb24gYW55d2F5Lg0KPiA+DQo+ID4gQlRXLCBzbyBmYXIs
IEkgaGF2ZSBub3Qgc2VlbiB0aGUgLTUxNyBlcnJvciBmcm9tIHVidW50dSBrZXJuZWwgZG1lc2cg
b24NCj4gPiBQQyBvciBsYXB0b3AuIE1heWJlIHRoaXMgaXMgdGhlIDFzdCBkcml2ZXIgdG8gcHJp
bnQgdGhpcyBlcnJvciBpbiB0aGUNCj4gPiBkbWVzZyBvbiBQQyBvciBsYXB0b3AsIHNvIEkgZ3Vl
c3MgaXQgcHJvYmFibHkgY29uZnVzZXMgdGhlIHVzZXJzIG9yIG91ciBRQS4NCj4gPg0KPiANCj4g
V2UgaGF2ZSBzaW1pbGFyIGRlc2lnbiBmb3IgSTJTIGVuZHBvaW50IHdoaWNoIGdvdCBwcm9kdWN0
aXplZCBvbiBvdGhlciBPUw0KPiB2YXJpYW50Lg0KPiBNb3N0IG9mIHRoZSBQQyBhbmQgTGFwdG9w
IGNvbWVzIHVwIHdpdGggTGVnYWN5IEhEIEF1ZGlvIERyaXZlciBzb2x1dGlvbi4NCj4gVGhpcyBp
cyBBU29DIGJhc2VkIGRyaXZlci4NCj4gQXMgdGhpcyBmYWlsdXJlIG1lc3NhZ2Ugb25seSBhcHBl
YXJzIGR1cmluZyBib290IHRpbWUsICBJdHMgb2theSB0byBnbyBhaGVhZC4NCj4gRW5kIHVzZXIg
c2hvdWxkIHJlYWxseSB3b3JyeSBpZiBzb3VuZCBjYXJkIGlzIG5vdCBjcmVhdGVkIGV2ZW4gYWZ0
ZXIgc3lzdGVtDQo+IGJvb3RzIHVwLg0KDQpJIGhhdmUgc2VlbiBzYW1wbGUgaW1wbGVtZW50YXRp
b24gb2YgZGVmZXJyZWQgcHJvYmUgaW4gb25lIG9mIHRoZSBtYWNoaW5lDQpkcml2ZXIgY29kZSB1
c2luZyBsYXRlX2luaXRjYWxsKCkgQVBJLg0KTm90IHN1cmUgaG93IHRoaXMgYXBpIHJlYWxseSB3
b3JrcyB3aGljaCB3aWxsIHJlc29sdmUgdGhlIG1vZHVsZXMgbG9hZGluZyBzZXF1ZW5jZQ0KaXNz
dWUuDQoNCg0KDQoNCg0KDQo=
