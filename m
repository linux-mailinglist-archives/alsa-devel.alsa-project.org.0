Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E801DE907
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 16:32:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79807188F;
	Fri, 22 May 2020 16:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79807188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590157963;
	bh=rJ/fwZIm/wEx9az8WXeaUoOqYYI+BnRYkLe0MXSEze4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T7lvy7eBrMHfLBP41zEaAT/BI2CDtONtW2MMecfEPZo2eiVUAdhCERSGYsFQ06wXh
	 1HcRzmW+yT6CoS3m1rz/m5ZkolmgJhQCOi3zlNKKL7hKOyKRs8hyeD63DKT4GDD1xX
	 o0Xp4DHT81qhUc9x2ozGKev+drIKACM2YRkidF6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB1DF80213;
	Fri, 22 May 2020 16:31:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9B78F80213; Fri, 22 May 2020 16:30:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE8F8F80140
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 16:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE8F8F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="yFJmefku"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCg1BlbUIlBMVpwVAVrnTuTx9+dGRY67qEjZhjewi9+rWU8EzYMpnt7v5H9F2vOME3mO0moz9NN0dI3s7LcsBHgdqrQBBKTbLcT8Pvth5SeBVI9ODsHkBJI/Bnr+0tSsLdl3jiiOijA4FCeXh1m9TIopt+pFzGnmvBu5YjrLDEP/w6d8x/elFWqgyA5PiTSbEn1W2GPB8QIbk1Yz87+dx3xja9wVz5QxcQK5Jflz0BskYKiXt14/Y+RwZL+rVjj3nf2vbAPUT8xgDCZFJ1CSfjbkW0vJQQDgTmkUqWCfWXRmd+EOobPg3B1MagqquHJJfy59ku7Q8wd38/b8HqPnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJ/fwZIm/wEx9az8WXeaUoOqYYI+BnRYkLe0MXSEze4=;
 b=Td44gj1TonduVba3O/TXneR8B9sKnAdSZyS0z2gvVaijJ2I2/uC7Bp3J0kYQXcUgsO/cQMwXHAeEFeT245+6jovQT+Zk9k/VoOARRAB+OucWx5aBBJcTHRHT1W7RgrWLKprgk2cOlaEX0ggUVBnZvFMqWXhxPBcs7bsNzom7Iyt6/i22NficN9XqaIGfQVGY9JzbU38uOoUDwNjXJm8SaKueFv2chiqY2FGMdDv3uPpKpmos5qK3b0Po+aE7txqPrEHnr9cfb4r+cMDHhplStCj29edIGFDZpZt3mFSGb8jMTl1mkU/exaQGmOU9lJCwtEH1HKEt9gQnA4bZNcvOmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJ/fwZIm/wEx9az8WXeaUoOqYYI+BnRYkLe0MXSEze4=;
 b=yFJmefkuhoNrv4x1TbCkB4XljUL5KBx19n6HBng9ZGqGn45c1ndhMFC+9nAdO+9SwBFHvvVwQgADzoyMNfYWizo4O71ZkSfRWmzK4rAw0mnmsKY2RmCtliy/zywAp+aqDivzYRLBBiJ22IziH8Wg4gzc/Xr2JZLhtTqEqi7GFPQ=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB4155.namprd12.prod.outlook.com (2603:10b6:5:221::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.24; Fri, 22 May 2020 14:30:47 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.3000.034; Fri, 22 May 2020
 14:30:47 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Hui Wang <hui.wang@canonical.com>, Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
Thread-Topic: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
Thread-Index: AQHWMBGAxjoSFfw9qEKCikUbd/uKQqiz8myAgAAAyuCAAAM0AIAAADWggAAa/ACAABASgIAABwTg
Date: Fri, 22 May 2020 14:30:47 +0000
Message-ID: <DM6PR12MB26335DA69D595C332A20779697B40@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200522081738.11636-1-hui.wang@canonical.com>
 <20200522110811.GB5801@sirena.org.uk>
 <DM6PR12MB2633D541378EB715AC18531C97B40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <20200522112228.GD5801@sirena.org.uk>
 <DM6PR12MB26337FD48A99D14814EB32F097B40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <2285006c-388c-810f-c1ac-ef76ab2319bb@canonical.com>
 <0acc99c4-6fe0-b613-4af2-5439ecd8981b@canonical.com>
In-Reply-To: <0acc99c4-6fe0-b613-4af2-5439ecd8981b@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-22T14:30:44Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=04cfad40-2123-48af-a5d7-0000b6141585;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-22T14:30:44Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 0ce4c36f-29cc-4b46-a7d3-00002ee5c424
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5b165e24-1264-4ecf-b87b-08d7fe5cb7eb
x-ms-traffictypediagnostic: DM6PR12MB4155:
x-microsoft-antispam-prvs: <DM6PR12MB415545C33FFF539827A8BD8A97B40@DM6PR12MB4155.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9JW9qjFT6/DYmMADh9iz/N+vyVJJnE4WTUmND2+J3pdJ4sWzhG75y/LPZ4C5D1EjdJ1cVQbRW92Y+EGDF+vF9azEnMhIEDlmX/VhAht9S2kqEWLGCj7V/Ye8KVEuV+6gqPgReVmfFulCqpO+F26rMtl/lpopi+pPX0UQemSCQsoLNG5NrR4DZOfojD0HQO5EZbMIFNWr925P5RCtpVDSJlK2Ercl5uJjARkDqjoSYk75kKYVxUhQHF60rL0Rx/WzF9UCNXokD3Ndvpm3nvuKiMeXndfkAt0jt7T9v+tEa8zVKwVAG9SyycyZdGDHJbuEANQ5pjChq6uca5q9yplYOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(366004)(346002)(71200400001)(6506007)(478600001)(4326008)(26005)(5660300002)(186003)(53546011)(66446008)(8676002)(7696005)(8936002)(2906002)(9686003)(52536014)(110136005)(66476007)(66556008)(55016002)(316002)(76116006)(64756008)(86362001)(66946007)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: dsKEPFrQHIvu22ALQVArQbCLQMg+ysjNAYVlXkvTO/Kmz/bWiz/lqP+MEdxWZGcbrEFVQfekBRRG59RmejXKrYdDQ+UzTgHDzVCowIVKeN4Gtctu0pxaGuZM2wgwdyL0D2l6KSXINIGk3AZnpatWMcMo8nu4wh1ACJLNwymVDuo/XGzwDNTBLWfusJgejYu5HCYzRFKxLJZh4NUSuCsQm/n6y+JgBKj/H2W9a0qlzkcp9N7uk+Hv55xQ2uFQK+HioDIomHey7VVMvt17NydMNZKaICI3aqyoQY5om4+cZxNYVHZ6jJQujjVHKvioY7/FWqY6B/gI8Y/0N6BIEqBfN817HlPJOqJq/Js3dadm085Biy9AG8/bM6OjpsnykxKwVKwgtZS/2jb+OLgpqYptbz8jsQkOZowa1BjXVVd5yevEyg9eo2Lw8/mU0TCL8dKdsvuZDX+GjpZ6y495LF6cLIgKX3IDRt6MGExDTHVe7Qw9wLWlWt58tb7+8/7u1zPz
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b165e24-1264-4ecf-b87b-08d7fe5cb7eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 14:30:47.1230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dzqzXA+vT+K6kaNmShxA6BbUVnV+39Ya9aHTm4ZCli6pTiW+G0Gkb73Cr03uYuTCgVrHQfz18XoKN7QRH3ZPeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4155
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQoN
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIdWkgV2FuZyA8aHVpLndh
bmdAY2Fub25pY2FsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBNYXkgMjIsIDIwMjAgNzoyNyBQTQ0K
PiBUbzogTXVrdW5kYSwgVmlqZW5kYXIgPFZpamVuZGFyLk11a3VuZGFAYW1kLmNvbT47IE1hcmsg
QnJvd24NCj4gPGJyb29uaWVAa2VybmVsLm9yZz4NCj4gQ2M6IGFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBBU29DOiBhbWQ6IHB1dCBvZmYgcmVn
aXN0ZXJpbmcgbWFjaCBwbGF0Zm9ybV9kZXYgdG8NCj4gYXZvaWQgLTUxNyBlcnINCj4gDQo+IA0K
PiBPbiAyMDIwLzUvMjIg5LiL5Y2IODo1OSwgSHVpIFdhbmcgd3JvdGU6DQo+ID4NCj4gPiBPbiAy
MDIwLzUvMjIg5LiL5Y2INzoyOCwgTXVrdW5kYSwgVmlqZW5kYXIgd3JvdGU6DQo+ID4+DQo+ID4+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4gRnJvbTogTWFyayBCcm93biA8YnJv
b25pZUBrZXJuZWwub3JnPg0KPiA+Pj4gU2VudDogRnJpZGF5LCBNYXkgMjIsIDIwMjAgNDo1MiBQ
TQ0KPiA+Pj4gVG86IE11a3VuZGEsIFZpamVuZGFyIDxWaWplbmRhci5NdWt1bmRhQGFtZC5jb20+
DQo+ID4+PiBDYzogSHVpIFdhbmcgPGh1aS53YW5nQGNhbm9uaWNhbC5jb20+OyBhbHNhLWRldmVs
QGFsc2EtcHJvamVjdC5vcmcNCj4gPj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIEFTb0M6IGFt
ZDogcHV0IG9mZiByZWdpc3RlcmluZyBtYWNoDQo+ID4+PiBwbGF0Zm9ybV9kZXYgdG8NCj4gPj4+
IGF2b2lkIC01MTcgZXJyDQo+ID4+Pg0KPiA+Pj4gT24gRnJpLCBNYXkgMjIsIDIwMjAgYXQgMTE6
MTM6NDNBTSArMDAwMCwgTXVrdW5kYSwgVmlqZW5kYXIgd3JvdGU6DQo+ID4+Pg0KPiA+Pj4+IERv
ZXMgc291bmQgY2FyZCByZWdpc3RyYXRpb24gZmFpbHVyZSBhdCBib290IHRpbWUgZHVlIHRvIG1v
ZHVsZXMNCj4gPj4+PiBsb2FkaW5nDQo+ID4+PiBvcmRlciBjYW4gYmUgY29uc2lkZXJlZCBhcyBi
dWcgPw0KPiA+Pj4NCj4gPj4+IE5vLCB0aGlzIGlzIHRvdGFsbHkgbm9ybWFsLsKgIElmIGl0IGZh
aWxlZCB0byBiaW5kIGV2ZXIgdGhlbiB0aGF0J2QgYmUgYQ0KPiA+Pj4gcHJvYmxlbSBidXQgdGhp
cyBpcyBqdXN0IGRlZmVycmluZy4NCj4gPj4gSW4gdGhhdCBjYXNlLCB3ZSBkb24ndCBuZWVkIHRo
aXMgd29yayBhcm91bmQgSSBndWVzcy4NCj4gPj4gQXQgbWF4aW11bSBkdXJpbmcgYm9vdCB0aW1l
LCB3ZSBtYXkgc2VlIGZldyBzb3VuZCBjYXJkIHJlZ2lzdHJhdGlvbg0KPiA+PiBmYWlsdXJlIGxv
Z3MsDQo+ID4+IFdoaWNoIGlzIG5vcm1hbC4NCj4gPj4NCj4gPj4gV2l0aCB0aGlzIGNoYW5nZSwg
b3VyIGNvbmNlcHQgb2YgQUNQIHBhcmVudCBkZXZpY2Ugd2hpY2ggd2lsbCBjcmVhdGUNCj4gPj4g
cGxhdGZvcm0gZGV2aWNlcw0KPiA+PiBmb3IgRE1BIGRyaXZlciwgR2VuZXJpYyBETUlDIGRyaXZl
ciBhbmQgTWFjaGluZSBkcml2ZXIgd2lsbCBiZSBjaGFuZ2VkLg0KPiA+PiBXZSBpbXBsZW1lbnRl
ZCBzYW1lIGRlc2lnbiBmb3IgUmF2ZW4gSTJTIGRyaXZlciBhcyB3ZWxsIHdoaWNoIGdvdA0KPiA+
PiBwcm9kdWN0aXplZC4NCj4gPj4NCj4gPiBPSywgZ290IGl0LsKgIEl0IGRvZXNuJ3QgYWZmZWN0
IHRoZSBzb3VuZCBmdW5jdGlvbiBhbnl3YXkuDQo+IA0KPiBCVFcsIHNvIGZhciwgSSBoYXZlIG5v
dCBzZWVuIHRoZSAtNTE3IGVycm9yIGZyb20gdWJ1bnR1IGtlcm5lbCBkbWVzZyBvbg0KPiBQQyBv
ciBsYXB0b3AuIE1heWJlIHRoaXMgaXMgdGhlIDFzdCBkcml2ZXIgdG8gcHJpbnQgdGhpcyBlcnJv
ciBpbiB0aGUNCj4gZG1lc2cgb24gUEMgb3IgbGFwdG9wLCBzbyBJIGd1ZXNzIGl0IHByb2JhYmx5
IGNvbmZ1c2VzIHRoZSB1c2VycyBvciBvdXIgUUEuDQo+IA0KDQpXZSBoYXZlIHNpbWlsYXIgZGVz
aWduIGZvciBJMlMgZW5kcG9pbnQgd2hpY2ggZ290IHByb2R1Y3RpemVkIG9uIG90aGVyIE9TDQp2
YXJpYW50Lg0KTW9zdCBvZiB0aGUgUEMgYW5kIExhcHRvcCBjb21lcyB1cCB3aXRoIExlZ2FjeSBI
RCBBdWRpbyBEcml2ZXIgc29sdXRpb24uDQpUaGlzIGlzIEFTb0MgYmFzZWQgZHJpdmVyLg0KQXMg
dGhpcyBmYWlsdXJlIG1lc3NhZ2Ugb25seSBhcHBlYXJzIGR1cmluZyBib290IHRpbWUsICBJdHMg
b2theSB0byBnbyBhaGVhZC4NCkVuZCB1c2VyIHNob3VsZCByZWFsbHkgd29ycnkgaWYgc291bmQg
Y2FyZCBpcyBub3QgY3JlYXRlZCBldmVuIGFmdGVyIHN5c3RlbQ0KYm9vdHMgdXAuDQo=
