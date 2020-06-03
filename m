Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3171ECDEC
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 13:00:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2DAD1666;
	Wed,  3 Jun 2020 12:59:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2DAD1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591182003;
	bh=qazWbi3j2Iw0i4ZG/YM76FncFmalGe/XkYMgwkbXuHI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RELLcEHToEtkJDK4YhixLUZoSy5K1PMyVUaOksiAjoFKBQwQHNsrYMTdWICbjc1+x
	 KMpzJ5kERq7jhFydakHNA00UEqz6SF3x/1aU5gKKiGKyVoqwON4lDOS6CfIFmZsEnZ
	 WmEindL3fp9S7saEPltkBy+4L93AJWFSLZ4oxrZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0993F800BC;
	Wed,  3 Jun 2020 12:58:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F9CFF801ED; Wed,  3 Jun 2020 12:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4DCDF800BC
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 12:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4DCDF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="DXguIg3y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgK1Q7VQuTiBhnGFdwLDXLDer2Mn/bIgCGrCo5/haeEMVrPNcw31M3Y2TAaCRdJFq3mUr8sIpQzxGOO7/p9YZqUs9qn15jZ3nTUfWRmsOEsaUf8mHaVnMDEDVZgAGdFQhI8GaYoTBT/SLWU+bVJQ5WHuEbrInbz1oQzh0N7eU/3R8L1HtNgAm+pQyZcwT6ZpBwaYGV9/eKBv2VJFGfif4CnZ7wFotnnU042aq8p0EHVzt8uVKb63bV9NgEn5VXL4Z/1By/bP5gRopNt5EakMMRzPuWsKE/x9laxk11KjcTXmtRGccawxrfmhi1TXbwQFzJ9Mr8k7aYKm3fCQiA7bHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qazWbi3j2Iw0i4ZG/YM76FncFmalGe/XkYMgwkbXuHI=;
 b=GAGzWQghT/aLsQwv/GC2HvDUebZHGQz67j8BJWnZv4FMHKm2HMDJV5NOM7jquIR3r+MylQ2xg5PdMvHrVWY4D4LqtzmrKUtXNNl43uB+dGeYIqmZR+my80DBdp+5UykFt3H1X3G8NK/nbLBTg6k/e7rBv0HzXPukvnfZhDM5j/V1JIIWar4ZFITj/CYpUxG5WyxnDRTP053BayXitDdElv7Py30I4EafU4UrSOetq10EbCbISeZPMFZz0DL0DKyqJlBlmFLxGKaih8FHJcMvxSasJuD1/3ndj1hsdf9iHuJ1632a+VHfRdZisyT3VA+ZAOQlF3Xc3mG4TzJI2DLZow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qazWbi3j2Iw0i4ZG/YM76FncFmalGe/XkYMgwkbXuHI=;
 b=DXguIg3ygW6FrPBDNXBUK/vF+iv5G5L7XPxvZwZlw8L6wSJlB2iIy8LPpb7jbj60+QH5s3ModaPhm3C8t516C79NXyIael9BioCU9CsYENLKHNAuB4z/TCxLD4SJYYL9uSn5NsJJDaolkBlMoQDTFzzwLCVN+8+Y1qDHNM0iZro=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB4578.namprd12.prod.outlook.com (2603:10b6:5:2a9::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.17; Wed, 3 Jun 2020 10:58:04 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::f9c2:772:27f4:87e0]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::f9c2:772:27f4:87e0%3]) with mapi id 15.20.3045.022; Wed, 3 Jun 2020
 10:58:03 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: alsa-project alsa-ucm : Audio endpoint is not switching when
 external mic connected
Thread-Topic: alsa-project alsa-ucm : Audio endpoint is not switching when
 external mic connected
Thread-Index: AQHWORWZpOabhVK9PUqV2EcoXElfLajGC9qAgACWYQCAAAzZEIAABDWAgAAFYvA=
Date: Wed, 3 Jun 2020 10:58:03 +0000
Message-ID: <DM6PR12MB2633A59C90974B547BD0FDBC97880@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <DM6PR12MB26332026A8F345F742B5E9FF978B0@DM6PR12MB2633.namprd12.prod.outlook.com>
 <d149204b-1e2d-1ee9-fbb4-c6f8874e369a@perex.cz>
 <da8b6e1e-fd29-fb99-07a7-d5fd8c7b78f9@canonical.com>
 <s5htuzsebm9.wl-tiwai@suse.de>
 <DM6PR12MB263397E76403D68BA6FE383E97880@DM6PR12MB2633.namprd12.prod.outlook.com>
 <s5hftbce8si.wl-tiwai@suse.de>
In-Reply-To: <s5hftbce8si.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-06-03T10:55:07Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=2c248987-7332-45b1-b185-00000da227dc;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-06-03T10:58:00Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: 6dbeb37c-a295-487e-a840-0000051b9486
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: db5bef0e-7841-4fdd-513b-08d807acfd60
x-ms-traffictypediagnostic: DM6PR12MB4578:
x-microsoft-antispam-prvs: <DM6PR12MB45789748A6F8367A07A89BCA97880@DM6PR12MB4578.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 04238CD941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s8EN9MRrlOVB6PlNNg+oJgSX3pBcAF/bPFFDjIaI6eeOVYi7eWAjFxCqcm/HuTuOPmZ3Y/2ibeJwWNSHGMZyV+pyBb2sUfVsT9yNKICec5C3Oehi3H/MGJVBzcasdnJo0KyMnPFcTdxS950xU0VHIrud9hO1murhSVpaf1NIDmkzKUlWrL19yN7kDKsnMYRNbuZ3gLLpX+m9PRtIl5UnUj0OBhOAZKsaJPO7PHygCxVsctbkblGYnZtZsp6i3Fit6KXpHiskehmos1s35KTlEgS94CE0Q5dDXI+BQ0tbgCBX4ARE3bM0ESEU4hDWQfnNXJp+O/J7F8TRXrfqUHsvU6niQIpNjBirL3Nxa2UimhOV6qPsRlOuVHGjQXSCju2oDkyE9X3dQLfHNzqra+REEg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(54906003)(316002)(2906002)(52536014)(33656002)(64756008)(8936002)(76116006)(478600001)(66946007)(66556008)(71200400001)(966005)(83380400001)(9686003)(45080400002)(66446008)(66476007)(53546011)(5660300002)(6506007)(7696005)(6916009)(8676002)(55016002)(4326008)(186003)(26005)(86362001)(83080400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: oXpuPMb7WgLszilHv0o6447IbqQxchCsPGbinOeuR0PqJT07Wafi+MJ/HE+0ikSpDuS9VBW26zd+hy4gsxs+PhJzO5d/u75LCz1dw3T260fp+LejPkvTdXJOU6zs5qvSJk8i6eADpeE7fJqZxhgUlyfQrWLyod0mTNa01c4CQw7+MgkmEwANTIBmkBau+If6jPKS5HcU416qHOwk8xkKxuwmhmq9q2H3pr8/T6GN3jxL6Xn5cXSA81v+Kf+nJoL2/Kg8bGIeWYxHW1hatZb+aJQY5xvIbrdwSAUEyMTgidYktOsFh9yimPltctrK/KP3pMKFPoG09gYxwiEmGZzEztAem9/92KaWcTm5MxDQqk0sTew4KJIQYgIGh/UIwrCgXr1nE8SKOmc0vgiLpxdtqYaW683U1u3UZia0EJZDLlOhz2V18k7nS11wB1UlfmIC6xmIIdFC2rH1eKoGC+OTGvMN2+TlfRj1uyGQTQ5NOFS9LJsPQ/h8rWo6Pw8rCsV5
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5bef0e-7841-4fdd-513b-08d807acfd60
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 10:58:03.8033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B2VDSXc1/Fa8oAvM2EwnMKjUmoDHBayoUi7ZXUXY55jDdZYg1eirvgca1nWo1gDPYZnWCrDsPXSZKqcVqVEoHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4578
Cc: Hui Wang <hui.wang@canonical.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGFrYXNoaSBJd2FpIDx0
aXdhaUBzdXNlLmRlPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMywgMjAyMCA0OjA2IFBNDQo+
IFRvOiBNdWt1bmRhLCBWaWplbmRhciA8VmlqZW5kYXIuTXVrdW5kYUBhbWQuY29tPg0KPiBDYzog
SHVpIFdhbmcgPGh1aS53YW5nQGNhbm9uaWNhbC5jb20+OyBKYXJvc2xhdiBLeXNlbGEgPHBlcmV4
QHBlcmV4LmN6PjsNCj4gYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJl
OiBhbHNhLXByb2plY3QgYWxzYS11Y20gOiBBdWRpbyBlbmRwb2ludCBpcyBub3Qgc3dpdGNoaW5n
IHdoZW4NCj4gZXh0ZXJuYWwgbWljIGNvbm5lY3RlZA0KPiANCj4gT24gV2VkLCAwMyBKdW4gMjAy
MCAxMjozMjo0MSArMDIwMCwNCj4gTXVrdW5kYSwgVmlqZW5kYXIgd3JvdGU6DQo+ID4NCj4gPg0K
PiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogVGFrYXNo
aSBJd2FpIDx0aXdhaUBzdXNlLmRlPg0KPiA+ID4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDMsIDIw
MjAgMzowNSBQTQ0KPiA+ID4gVG86IEh1aSBXYW5nIDxodWkud2FuZ0BjYW5vbmljYWwuY29tPg0K
PiA+ID4gQ2M6IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+OyBNdWt1bmRhLCBWaWpl
bmRhcg0KPiA+ID4gPFZpamVuZGFyLk11a3VuZGFAYW1kLmNvbT47IGFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IGFsc2EtcHJvamVjdCBhbHNhLXVjbSA6IEF1
ZGlvIGVuZHBvaW50IGlzIG5vdCBzd2l0Y2hpbmcgd2hlbg0KPiA+ID4gZXh0ZXJuYWwgbWljIGNv
bm5lY3RlZA0KPiA+ID4NCj4gPiA+IE9uIFdlZCwgMDMgSnVuIDIwMjAgMDI6MzY6MjUgKzAyMDAs
DQo+ID4gPiBIdWkgV2FuZyB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gT24gMjAy
MC82LzMg5LiK5Y2IMzozOSwgSmFyb3NsYXYgS3lzZWxhIHdyb3RlOg0KPiA+ID4gPiA+IERuZSAw
Mi4gMDYuIDIwIHYgMTk6NTcgTXVrdW5kYSwgVmlqZW5kYXIgbmFwc2FsKGEpOg0KPiA+ID4gPiA+
PiBXZSByZWNlbnRseSB1cCBzdHJlYW1lZCBBQ1AgUERNIGRyaXZlciBmb3IgUmVub2lyIEFQVS4N
Cj4gPiA+ID4gPj4NCj4gPiA+ID4gPj4gT3VyIEFDUCBJUCBoYXMgYW4gaW50ZXJuYWwgUERNIERl
Y29kZXIgYmxvY2sgd2hlcmUgRE1JQyBpcyBkaXJlY3RseQ0KPiA+ID4gPiA+PiBjb25uZWN0ZWQu
DQo+ID4gPiA+ID4+IFRoZXJlIGFyZSBubyBLQ29udHJvbHMgZGVmaW5lZCBmb3IgUERNIERyaXZl
ci4NCj4gPiA+ID4gPj4NCj4gPiA+ID4gPj4gT3VyIHBsYXRmb3JtIHN1cHBvcnRzIG9uIGJvYXJk
IERNSUMgYW5kIFNvdXRoIGJyaWRnZSBBemFsaWEgKEhEDQo+ID4gPiA+ID4+IEF1ZGlvICkgZW5k
cG9pbnQgLg0KPiA+ID4gPiA+PiBCeSBkZWZhdWx0LCBETUlDIGVuZHBvaW50IGlzIHVzZWQgYXMg
YXVkaW8gaW5wdXQgZGV2aWNlLg0KPiA+ID4gPiA+PiBXaGVuIEhlYWRzZXQgTWljIGphY2sgY29u
bmVjdGVkLCBpdCdzIG5vdCBzd2l0Y2hpbmcgdG8gRXh0ZXJuYWwgTWljLg0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gTWFrZSBzdXJlIHRoYXQgdGhlIEhlYWRzZXQgTWljIHByaW9yaXR5IHBvcnQgaW4g
cHVsc2VhdWRpbyBpcyBpcw0KPiA+ID4gPiA+IGdyZWF0ZXIgdGhhbiB0aGUgb25lIGZvciBETUlD
Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4+IEhvdyBkb2VzIGF1ZGlvIGVuZHBvaW50IHdpbGwgc3dp
dGNoIGluIGdub21lIHdoZW4gZXh0ZXJuYWwgbWljIGlzDQo+ID4gPiA+ID4+IGNvbm5lY3RlZD8N
Cj4gPiA+ID4gPj4+IEZyb20gb3VyIHVuZGVyc3RhbmRpbmcsIFVDTSBjb25mIGZpbGUgZm9yIEhE
QSBkcml2ZXIgaXMgYWxzbw0KPiA+ID4gPiA+Pj4gcmVxdWlyZWQgZm9yDQo+ID4gPiA+ID4+IGNv
bmZpZ3VyaW5nIG1peGVyIGNvbnRyb2xzIGZvciBIRCBBdWRpbyBjYXB0dXJlIGRldmljZS4NCj4g
PiA+ID4gPj4gU2ltaWxhcmx5IHdoZW4gRXh0ZXJuYWwgTWljIGlzIHJlbW92ZWQgLCBpdCBoYXMg
dG8gc3dpdGNoIHRvDQo+ID4gPiA+ID4+IGludGVybmFsIGRtaWMgLg0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gQW4gY29uZmlndXJhdGlvbiBleGFtcGxlIGZvciBVQ00gKERNSUMgY29ubmVjdGVkIHRv
IERTUCwgSERBIGNvZGVjDQo+ID4gPiA+ID4gZm9yIHJlc3QpOg0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4NCj4gPiA+DQo+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yg0KPiA+ID4gLmNvbSUyRmFsc2EtcHJvamVjdCUy
RmFsc2EtdWNtLWNvbmYlMkZ0cmVlJTJGbWFzdGVyJTJGdWNtMiUyRnNvZi0NCj4gPiA+IGhkYS0N
Cj4gPiA+DQo+IGRzcCZhbXA7ZGF0YT0wMiU3QzAxJTdDVmlqZW5kYXIuTXVrdW5kYSU0MGFtZC5j
b20lN0M1ZmJiM2E1MTZkNQ0KPiA+ID4NCj4gMjRjNzM1NjhkMDhkODA3YTE1N2ExJTdDM2RkODk2
MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDDQo+ID4gPg0KPiAwJTdDNjM3MjY3NzM2
ODI3NjcxOTQ2JmFtcDtzZGF0YT0wYU83ZGJMQVR1VyUyQkllSnNqV29XQ0dPYVlFTw0KPiA+ID4g
V1FhVndJOWl6cHBCM3Y3ayUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
SWYgeW91IG5lZWQgYSBoZWxwIHRvIGNyZWF0ZSBhIG5ldyBjb25maWd1cmF0aW9uIGZvciB5b3Vy
IGhhcmR3YXJlLA0KPiA+ID4gPiA+IHNob3cgdGhlIG91dHB1dCBmcm9tIHRoZSBhbHNhLWluZm8u
c2ggc2NyaXB0LCBwbGVhc2UuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBKYXJvc2xhdg0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIGF1
ZGlvIGRlc2lnbiBpc8KgIGEgYml0IGRpZmZlcmVudCBmcm9tIHNvZi1oZGEtZHNwLCB0aGUgZG1p
YyBpcyBvbg0KPiA+ID4gPiBhIHN0YW5kYWxvbmUgc291bmQgY2FyZC4gUGxlYXNlIHNlZSB0aGUg
YWxzYS1pbmZvLnR4dDoNCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+DQo+IGh0dHBzOi8vbmFtMTEu
c2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnBhc3Rl
Yg0KPiA+ID4NCj4gaW4udWJ1bnR1LmNvbSUyRnAlMkY0a3ByaERaWWJnJTJGJmFtcDtkYXRhPTAy
JTdDMDElN0NWaWplbmRhci5NdQ0KPiA+ID4NCj4ga3VuZGElNDBhbWQuY29tJTdDNWZiYjNhNTE2
ZDUyNGM3MzU2OGQwOGQ4MDdhMTU3YTElN0MzZGQ4OTYxZmU0DQo+ID4gPg0KPiA4ODRlNjA4ZTEx
YTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzcyNjc3MzY4Mjc2NzE5NDYmYW1wO3NkYXRhPVENCj4g
PiA+IDUweE5iRjFLU3Fhc05hMFV5S3pVRkF6T2M5S1BJZ3VCamdZSHIxWFNiZyUzRCZhbXA7cmVz
ZXJ2ZWQ9MA0KPiA+ID4NCj4gPiA+IEFuZCB0aGF0J3MgYW4gaW50ZXJlc3RpbmcgY2FzZS4gIENh
biB3ZSBtYW5hZ2UgbXVsdGlwbGUgY2FyZHMgaW4gYQ0KPiA+ID4gc2luZ2xlIFVDTSBwcm9maWxl
Pw0KPiA+ID4NCj4gPiA+DQo+ID4gPiBUYWthc2hpDQo+ID4NCj4gPiBJIGFtIG5vdCBtdWNoIGZh
bWlsaWFyIHdpdGggVUNNIGZpbGVzIGNyZWF0aW9uLg0KPiA+IEFzIHBlciBteSB1bmRlcnN0YW5k
aW5nLCBVQ00gZW50cmllcyB3aWxsIHByb2dyYW0gdGhlIG1peGVyIGNvbnRyb2xzDQo+ID4gZGVw
ZW5kaW5nIHVwIG9uIHRoZSB1c2UgY2FzZSBhbmQgc2VsZWN0ZWQgZGV2aWNlLg0KPiANCj4gVUNN
IGlzIG1vcmUgdGhhbiB0aGF0LiAgSXQgbWFuYWdlcyB3aGljaCBQQ00gZGV2aWNlIGlzIGNob3Nl
biwgd2hpY2gNCj4gamFjayBjb250cm9sIGNvcnJlc3BvbmRzLCBldGMsIHRvby4NCj4gDQo+IA0K
PiBUYWthc2hpDQoNCkdvdCBpdC4gQ291bGQgeW91IGhlbHAgdXMgdG8gZ2V0IHRoZSBVQ00gZmls
ZSB3aGljaCB3aWxsIHdvcmsgZm9yIGJvdGggc291bmQgY2FyZHMgZm9yIG91ciBwbGF0Zm9ybS4N
Cg0K
