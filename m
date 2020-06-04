Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DA21EDC98
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 06:56:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C10B166C;
	Thu,  4 Jun 2020 06:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C10B166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591246597;
	bh=qBuHKOgJV7azTAMNFLL0HZuOZoDSdkA9zAdkmOBbt5k=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eah8jpm/hKugpU4bGIpH2hVKAJa4jmRoDLh6pZWvLW+rUae/QT7HCq8bZCb/PXcSY
	 BBWghpXeIt8+OBQzqe6dUYKY/4jtGOOGpQu2T4cixOzZDD+AEPixqAGMA5rkO7h35n
	 Ga1wD1Bus2/nKy7eOaSvarEib02lEF5BDpdA3hsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD962F80260;
	Thu,  4 Jun 2020 06:54:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B2B4F80254; Thu,  4 Jun 2020 06:54:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74EE2F8013C
 for <alsa-devel@alsa-project.org>; Thu,  4 Jun 2020 06:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74EE2F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="CHKDWvBh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNF+rsieJhA1KBkDwItV16VtNGQlgEpHf1VTeuuc5WJCp31GXKCc3oCZZRK40kQai3DAjH5gHzd0zSuF9jfUYdke0AwCXaBQ0ENSqdC1Ev+OSNWWwtPUjOZd1RDcNXrSJvqWj90NKr4XOMFR2S3dvBhGJBFeJHtb+em7ocok8uWQf2caDLvAcwrF+91pSbeS+C3fEwjJByME6wwU3w616cS1iIxEOrH3ZpGF8lFNauWYigoUjXRMovTaPSN0J2+Cl6lHaX/xd/ljp5eHvqGFv8qbhB/N+GRySMCN503TQPswB1N93RjhQNuJw8V06PCU4VDjzW1aPD6n2uVFGP1ATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBuHKOgJV7azTAMNFLL0HZuOZoDSdkA9zAdkmOBbt5k=;
 b=QSoy1m+UA7qTjgn2RYoEz0kHGxHGEluSOQoUnip1Z08ULo/ab+R3Vm+zljgxosBcvD1oCYHRjSvYSbrF8g/khIwXv14z5uaGL9spLsyyOguA32CmhXmn2KgWO9L3zNEGGg7XjTSGN/SXSqkRk5ooI2LrJNO8LAT3JwA0/7nCNRDOvFcoNwrEBz8OaCo+ghXWGhIRMcdm6t+AmZmkFiTytDWms2h0pM57Qv7zUQMcUHPRiIkfE3MIWH6+nTWJnuUx6evY57v6toLMGpKThBsrI9iJKtYi/zzAqbhkDHQVetMyZHvTbW6A0JS7mUnaoQA3klCLQXK2fIuJHwucZgvqoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBuHKOgJV7azTAMNFLL0HZuOZoDSdkA9zAdkmOBbt5k=;
 b=CHKDWvBhvkphGBo4ZHU8C6q85mdd2aZyvWGYV17bk/12fChCcVlAnZS2vqrHJ1FPQLOs7BidBaXWAOLl1XCxjDR4PMYzlQ0HqTyxbvku9Zc7zUl9C2eRMvk1gno6aRKaq9d7XGEbOEdX49NMmyRT7dD9pYv8cUVuKHPeUD5ocig=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3932.namprd12.prod.outlook.com (2603:10b6:5:1c1::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.17; Thu, 4 Jun 2020 04:54:41 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::f9c2:772:27f4:87e0]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::f9c2:772:27f4:87e0%3]) with mapi id 15.20.3045.022; Thu, 4 Jun 2020
 04:54:41 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Subject: RE: alsa-project alsa-ucm : Audio endpoint is not switching when
 external mic connected
Thread-Topic: alsa-project alsa-ucm : Audio endpoint is not switching when
 external mic connected
Thread-Index: AQHWORWZpOabhVK9PUqV2EcoXElfLajGC9qAgACWYQCAAAzZEIAABDWAgAAFYvCAACJ3AIABCs4w
Date: Thu, 4 Jun 2020 04:54:41 +0000
Message-ID: <DM6PR12MB2633E3A1874DA5D52120EFE597890@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <DM6PR12MB26332026A8F345F742B5E9FF978B0@DM6PR12MB2633.namprd12.prod.outlook.com>
 <d149204b-1e2d-1ee9-fbb4-c6f8874e369a@perex.cz>
 <da8b6e1e-fd29-fb99-07a7-d5fd8c7b78f9@canonical.com>
 <s5htuzsebm9.wl-tiwai@suse.de>
 <DM6PR12MB263397E76403D68BA6FE383E97880@DM6PR12MB2633.namprd12.prod.outlook.com>
 <s5hftbce8si.wl-tiwai@suse.de>
 <DM6PR12MB2633A59C90974B547BD0FDBC97880@DM6PR12MB2633.namprd12.prod.outlook.com>
 <c1d060ab-0ad2-91dc-7df3-fad59a2287b9@perex.cz>
In-Reply-To: <c1d060ab-0ad2-91dc-7df3-fad59a2287b9@perex.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-06-04T04:54:29Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=aa3d8e6b-5e02-455a-ba07-0000b9200072;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-06-04T04:54:06Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 1c8d3305-7a2a-4087-8031-000057751444
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-06-04T04:54:37Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: a881c1cf-112e-43c4-99a4-000006c095e6
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=amd.com;
x-originating-ip: [124.123.31.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a57602fd-452f-43cb-c9e8-08d80843647b
x-ms-traffictypediagnostic: DM6PR12MB3932:
x-microsoft-antispam-prvs: <DM6PR12MB3932BD3D3E0D0CC994CB49A097890@DM6PR12MB3932.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oRrfKSxACbAEKobnfWCmYVAjJdINFE/u8hqwVEO5b+q/nbGyUvwOmyGZ7D3S0ekgER67VKfU1odTG7VKxs6wqs9nHaCkifqdzFslLyzQ9FOrzmFdxfYdBFDrnkLppIwNHRpha8xssJx6aR27cchDqPVXn/qveNfNnOXFJ7HfaJFTHC3/3GoLIKR7d1jtXdxPMDwxsl3AyRB6BS6HthNZMZOtaZLkXEzgFJ1LfQco99j93slGf81eVNYMx8pI1o60mW0uuSAJPhQZ25jHctlU0iLF62y9VXSvNc7Vgx6iOQ1Eb2lJ74O8x07gMFdXRpcjoToYfmK9I3h6uMgQKXQ+PS8RzJ6MymqR6usj2RK2K3/EwHFUe91WZjBQ0vsINL7/t/L5IFWuOWAR28ZJEYCZkQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(66556008)(66946007)(52536014)(8936002)(45080400002)(83380400001)(8676002)(966005)(66446008)(478600001)(316002)(86362001)(55016002)(64756008)(76116006)(66476007)(4326008)(186003)(2906002)(33656002)(71200400001)(9686003)(110136005)(6506007)(83080400001)(7696005)(54906003)(5660300002)(26005)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: PzMxtMeJPITbdxaYh+hNch8BbsBq+CpKuOboTcQ505CQekkuhDzNkpRMz8RY4pFEIQmTRzZrOdOswL5Wd4BuWuSe3Vm1gPQ8lhjftIs5xEKu4bjdcw0B9CJTJIhaEos+PkmhZFFQAJt9WMbMuVpjZnjDdrhWVq1KGARNS+RABJ9iCng1ASYgVSnch6pc/lkKoyRSj5JXBYR+q+jZ34bxkAVZ6hEKtL8nPcwgpyfb0i4wT2gaMAVStXmRuhRxikAS/dTYQvmrqn2fY2zNInnO31b4G0NIm/D+jMPqkrh1vHEC3Ad369/Irbl7zXxQBzYoRgu0rv+1N8RmfdmnWputdx4J+IVPszUh8WZjk62qAL75aKphCbke8KH8ZnOCv6d+GvyRLa+ArdyJcfK1eCi6hnM8LIh5kI9/rau3RMKzxDhcLnpqE5lsqLNrsjUi+5SKHWw35mw20TuINg2o0PUhhsKkDR0LanbHPJhW3M+5nrKdquOyrV2KxLLBVfRAqtIh
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57602fd-452f-43cb-c9e8-08d80843647b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 04:54:41.3311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3iCCDrYK8Nn92hJnVpFctl8FtBKn+GoKMMW3dNmrzKX/ZSCKoZav6Mcl8pkxhsacXIxnbdvVXW5/LmKHkcEBSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3932
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFyb3NsYXYgS3lzZWxh
IDxwZXJleEBwZXJleC5jej4NCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDMsIDIwMjAgNjoyOCBQ
TQ0KPiBUbzogTXVrdW5kYSwgVmlqZW5kYXIgPFZpamVuZGFyLk11a3VuZGFAYW1kLmNvbT47IFRh
a2FzaGkgSXdhaQ0KPiA8dGl3YWlAc3VzZS5kZT4NCj4gQ2M6IEh1aSBXYW5nIDxodWkud2FuZ0Bj
YW5vbmljYWwuY29tPjsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJl
OiBhbHNhLXByb2plY3QgYWxzYS11Y20gOiBBdWRpbyBlbmRwb2ludCBpcyBub3Qgc3dpdGNoaW5n
IHdoZW4NCj4gZXh0ZXJuYWwgbWljIGNvbm5lY3RlZA0KPiANCj4gRG5lIDAzLiAwNi4gMjAgdiAx
Mjo1OCBNdWt1bmRhLCBWaWplbmRhciBuYXBzYWwoYSk6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2Uu
ZGU+DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAzLCAyMDIwIDQ6MDYgUE0NCj4gPj4gVG86
IE11a3VuZGEsIFZpamVuZGFyIDxWaWplbmRhci5NdWt1bmRhQGFtZC5jb20+DQo+ID4+IENjOiBI
dWkgV2FuZyA8aHVpLndhbmdAY2Fub25pY2FsLmNvbT47IEphcm9zbGF2IEt5c2VsYQ0KPiA8cGVy
ZXhAcGVyZXguY3o+Ow0KPiA+PiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcNCj4gPj4gU3Vi
amVjdDogUmU6IGFsc2EtcHJvamVjdCBhbHNhLXVjbSA6IEF1ZGlvIGVuZHBvaW50IGlzIG5vdCBz
d2l0Y2hpbmcgd2hlbg0KPiA+PiBleHRlcm5hbCBtaWMgY29ubmVjdGVkDQo+ID4+DQo+ID4+IE9u
IFdlZCwgMDMgSnVuIDIwMjAgMTI6MzI6NDEgKzAyMDAsDQo+ID4+IE11a3VuZGEsIFZpamVuZGFy
IHdyb3RlOg0KPiA+Pj4NCj4gPj4+DQo+ID4+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4+Pj4gRnJvbTogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPg0KPiA+Pj4+
IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAzLCAyMDIwIDM6MDUgUE0NCj4gPj4+PiBUbzogSHVpIFdh
bmcgPGh1aS53YW5nQGNhbm9uaWNhbC5jb20+DQo+ID4+Pj4gQ2M6IEphcm9zbGF2IEt5c2VsYSA8
cGVyZXhAcGVyZXguY3o+OyBNdWt1bmRhLCBWaWplbmRhcg0KPiA+Pj4+IDxWaWplbmRhci5NdWt1
bmRhQGFtZC5jb20+OyBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcNCj4gPj4+PiBTdWJqZWN0
OiBSZTogYWxzYS1wcm9qZWN0IGFsc2EtdWNtIDogQXVkaW8gZW5kcG9pbnQgaXMgbm90IHN3aXRj
aGluZyB3aGVuDQo+ID4+Pj4gZXh0ZXJuYWwgbWljIGNvbm5lY3RlZA0KPiA+Pj4+DQo+ID4+Pj4g
T24gV2VkLCAwMyBKdW4gMjAyMCAwMjozNjoyNSArMDIwMCwNCj4gPj4+PiBIdWkgV2FuZyB3cm90
ZToNCj4gPj4+Pj4NCj4gPj4+Pj4NCj4gPj4+Pj4gT24gMjAyMC82LzMg5LiK5Y2IMzozOSwgSmFy
b3NsYXYgS3lzZWxhIHdyb3RlOg0KPiA+Pj4+Pj4gRG5lIDAyLiAwNi4gMjAgdiAxOTo1NyBNdWt1
bmRhLCBWaWplbmRhciBuYXBzYWwoYSk6DQo+ID4+Pj4+Pj4gV2UgcmVjZW50bHkgdXAgc3RyZWFt
ZWQgQUNQIFBETSBkcml2ZXIgZm9yIFJlbm9pciBBUFUuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBP
dXIgQUNQIElQIGhhcyBhbiBpbnRlcm5hbCBQRE0gRGVjb2RlciBibG9jayB3aGVyZSBETUlDIGlz
IGRpcmVjdGx5DQo+ID4+Pj4+Pj4gY29ubmVjdGVkLg0KPiA+Pj4+Pj4+IFRoZXJlIGFyZSBubyBL
Q29udHJvbHMgZGVmaW5lZCBmb3IgUERNIERyaXZlci4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IE91
ciBwbGF0Zm9ybSBzdXBwb3J0cyBvbiBib2FyZCBETUlDIGFuZCBTb3V0aCBicmlkZ2UgQXphbGlh
IChIRA0KPiA+Pj4+Pj4+IEF1ZGlvICkgZW5kcG9pbnQgLg0KPiA+Pj4+Pj4+IEJ5IGRlZmF1bHQs
IERNSUMgZW5kcG9pbnQgaXMgdXNlZCBhcyBhdWRpbyBpbnB1dCBkZXZpY2UuDQo+ID4+Pj4+Pj4g
V2hlbiBIZWFkc2V0IE1pYyBqYWNrIGNvbm5lY3RlZCwgaXQncyBub3Qgc3dpdGNoaW5nIHRvIEV4
dGVybmFsIE1pYy4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBNYWtlIHN1cmUgdGhhdCB0aGUgSGVhZHNl
dCBNaWMgcHJpb3JpdHkgcG9ydCBpbiBwdWxzZWF1ZGlvIGlzIGlzDQo+ID4+Pj4+PiBncmVhdGVy
IHRoYW4gdGhlIG9uZSBmb3IgRE1JQy4NCj4gPj4+Pj4+DQo+ID4+Pj4+Pj4gSG93IGRvZXMgYXVk
aW8gZW5kcG9pbnQgd2lsbCBzd2l0Y2ggaW4gZ25vbWUgd2hlbiBleHRlcm5hbCBtaWMgaXMNCj4g
Pj4+Pj4+PiBjb25uZWN0ZWQ/DQo+ID4+Pj4+Pj4+ICBGcm9tIG91ciB1bmRlcnN0YW5kaW5nLCBV
Q00gY29uZiBmaWxlIGZvciBIREEgZHJpdmVyIGlzIGFsc28NCj4gPj4+Pj4+Pj4gcmVxdWlyZWQg
Zm9yDQo+ID4+Pj4+Pj4gY29uZmlndXJpbmcgbWl4ZXIgY29udHJvbHMgZm9yIEhEIEF1ZGlvIGNh
cHR1cmUgZGV2aWNlLg0KPiA+Pj4+Pj4+IFNpbWlsYXJseSB3aGVuIEV4dGVybmFsIE1pYyBpcyBy
ZW1vdmVkICwgaXQgaGFzIHRvIHN3aXRjaCB0bw0KPiA+Pj4+Pj4+IGludGVybmFsIGRtaWMgLg0K
PiA+Pj4+Pj4NCj4gPj4+Pj4+IEFuIGNvbmZpZ3VyYXRpb24gZXhhbXBsZSBmb3IgVUNNIChETUlD
IGNvbm5lY3RlZCB0byBEU1AsIEhEQQ0KPiBjb2RlYw0KPiA+Pj4+Pj4gZm9yIHJlc3QpOg0KPiA+
Pj4+Pj4NCj4gPj4+Pj4+DQo+ID4+Pj4NCj4gPj4NCj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHViDQo+ID4+Pj4g
LmNvbSUyRmFsc2EtcHJvamVjdCUyRmFsc2EtdWNtLQ0KPiBjb25mJTJGdHJlZSUyRm1hc3RlciUy
RnVjbTIlMkZzb2YtDQo+ID4+Pj4gaGRhLQ0KPiA+Pj4+DQo+ID4+DQo+IGRzcCZhbXA7ZGF0YT0w
MiU3QzAxJTdDVmlqZW5kYXIuTXVrdW5kYSU0MGFtZC5jb20lN0M1ZmJiM2E1MTZkNQ0KPiA+Pj4+
DQo+ID4+DQo+IDI0YzczNTY4ZDA4ZDgwN2ExNTdhMSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgy
ZDk5NGUxODNkJTdDMCU3Qw0KPiA+Pj4+DQo+ID4+DQo+IDAlN0M2MzcyNjc3MzY4Mjc2NzE5NDYm
YW1wO3NkYXRhPTBhTzdkYkxBVHVXJTJCSWVKc2pXb1dDR09hWUVPDQo+ID4+Pj4gV1FhVndJOWl6
cHBCM3Y3ayUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IElmIHlvdSBuZWVk
IGEgaGVscCB0byBjcmVhdGUgYSBuZXcgY29uZmlndXJhdGlvbiBmb3IgeW91ciBoYXJkd2FyZSwN
Cj4gPj4+Pj4+IHNob3cgdGhlIG91dHB1dCBmcm9tIHRoZSBhbHNhLWluZm8uc2ggc2NyaXB0LCBw
bGVhc2UuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIEphcm9zbGF2DQo+ID4+Pj4+DQo+ID4+Pj4+IFRoaXMgYXVkaW8gZGVzaWduIGlz
wqAgYSBiaXQgZGlmZmVyZW50IGZyb20gc29mLWhkYS1kc3AsIHRoZSBkbWljIGlzIG9uDQo+ID4+
Pj4+IGEgc3RhbmRhbG9uZSBzb3VuZCBjYXJkLiBQbGVhc2Ugc2VlIHRoZSBhbHNhLWluZm8udHh0
Og0KPiA+Pj4+Pg0KPiA+Pj4+Pg0KPiA+Pj4+DQo+ID4+DQo+IGh0dHBzOi8vbmFtMTEuc2FmZWxp
bmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnBhc3RlYg0KPiA+
Pj4+DQo+ID4+DQo+IGluLnVidW50dS5jb20lMkZwJTJGNGtwcmhEWlliZyUyRiZhbXA7ZGF0YT0w
MiU3QzAxJTdDVmlqZW5kYXIuTXUNCj4gPj4+Pg0KPiA+Pg0KPiBrdW5kYSU0MGFtZC5jb20lN0M1
ZmJiM2E1MTZkNTI0YzczNTY4ZDA4ZDgwN2ExNTdhMSU3QzNkZDg5NjFmZTQNCj4gPj4+Pg0KPiA+
Pg0KPiA4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzcyNjc3MzY4Mjc2NzE5NDYm
YW1wO3NkYXRhPVENCj4gPj4+PiA1MHhOYkYxS1NxYXNOYTBVeUt6VUZBek9jOUtQSWd1QmpnWUhy
MVhTYmclM0QmYW1wO3Jlc2VydmVkPTANCj4gPj4+Pg0KPiA+Pj4+IEFuZCB0aGF0J3MgYW4gaW50
ZXJlc3RpbmcgY2FzZS4gIENhbiB3ZSBtYW5hZ2UgbXVsdGlwbGUgY2FyZHMgaW4gYQ0KPiA+Pj4+
IHNpbmdsZSBVQ00gcHJvZmlsZT8NCj4gPj4+Pg0KPiA+Pj4+DQo+ID4+Pj4gVGFrYXNoaQ0KPiA+
Pj4NCj4gPj4+IEkgYW0gbm90IG11Y2ggZmFtaWxpYXIgd2l0aCBVQ00gZmlsZXMgY3JlYXRpb24u
DQo+ID4+PiBBcyBwZXIgbXkgdW5kZXJzdGFuZGluZywgVUNNIGVudHJpZXMgd2lsbCBwcm9ncmFt
IHRoZSBtaXhlciBjb250cm9scw0KPiA+Pj4gZGVwZW5kaW5nIHVwIG9uIHRoZSB1c2UgY2FzZSBh
bmQgc2VsZWN0ZWQgZGV2aWNlLg0KPiA+Pg0KPiA+PiBVQ00gaXMgbW9yZSB0aGFuIHRoYXQuICBJ
dCBtYW5hZ2VzIHdoaWNoIFBDTSBkZXZpY2UgaXMgY2hvc2VuLCB3aGljaA0KPiA+PiBqYWNrIGNv
bnRyb2wgY29ycmVzcG9uZHMsIGV0YywgdG9vLg0KPiA+Pg0KPiA+Pg0KPiA+PiBUYWthc2hpDQo+
ID4NCj4gPiBHb3QgaXQuIENvdWxkIHlvdSBoZWxwIHVzIHRvIGdldCB0aGUgVUNNIGZpbGUgd2hp
Y2ggd2lsbCB3b3JrIGZvciBib3RoIHNvdW5kDQo+IGNhcmRzIGZvciBvdXIgcGxhdGZvcm0uDQo+
IA0KPiBQbGVhc2UsIGNyZWF0ZSBhIG5ldyBpc3N1ZSB3aXRoIHRoZSBtZW50aW9uZWQgYWxzYS1p
bmZvIFVSTCBhdCBnaXRodWI6DQo+IA0KPiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRodWINCj4gLmNvbSUyRmFsc2Et
cHJvamVjdCUyRmFsc2EtdWNtLQ0KPiBjb25mJTJGaXNzdWVzJmFtcDtkYXRhPTAyJTdDMDElN0NW
aWplbmRhci5NdWt1bmRhJTQwYW1kLmNvbSU3Q2E5DQo+IDdhMzgyOWM2ZjY0NGY3MmI4MDA4ZDgw
N2JkY2Q3ZiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkDQo+ICU3QzAlN0MwJTdD
NjM3MjY3ODU5MDczNDQxNjg5JmFtcDtzZGF0YT1IUWxVUGREcnBCd0R6bCUyRnNnWFBzZQ0KPiBo
TXZ4VWk0ajJ0RVdxcG4zYmtWOGk4JTNEJmFtcDtyZXNlcnZlZD0wDQo+IA0KPiBJJ2xsIGdpdmUg
YSBsb29rIHdoZW4gbXkgdGltZSBwZXJtaXRzLg0KPiANCj4gCQkJCQlKYXJvc2xhdg0KPiANCj4g
LS0NCj4gSmFyb3NsYXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej4NCj4gTGludXggU291bmQgTWFp
bnRhaW5lcjsgQUxTQSBQcm9qZWN0OyBSZWQgSGF0LCBJbmMuDQoNCkNyZWF0ZWQgdGlja2V0IGZv
ciB0aGUgc2FtZSBpbiBnaXQgaHViLiBCZWxvdyBpcyB0aGUgbGluay4NCmh0dHBzOi8vZ2l0aHVi
LmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9pc3N1ZXMvMzANCg==
