Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 707952B7A51
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 10:27:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 013FB17B0;
	Wed, 18 Nov 2020 10:26:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 013FB17B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605691624;
	bh=qB9fKTWVWUZg9ctHor0J4tpr7+WAIq70HKwOQNMwDxc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WXnSqvew9qsBgDoIWPztO8iI2eu0A9NpQDjnR72MLnowaRKz5rcEI5m74EsQ98dai
	 t4b5kazQr3HhSsx6wnkR00x8/7ITWcK4ejPb2qYdyUG0k+hNvBMxJn8/CICaAK9EdP
	 2pcJQvntbRUD/2zF3U+B4LVPp+Zag+XLfqjkSv10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFA72F800EE;
	Wed, 18 Nov 2020 10:25:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3795F8016C; Wed, 18 Nov 2020 10:25:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46164F8010A
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 10:25:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46164F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="sJu1Z80l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYPo1WOS9IRidwAyHqZvxuyiEScDRe8FYu//SSF4KlhtEn2QP5c8jM0mYKIc/aoBqkoRGmtLrKg+sXnT6XM/z79BfrFcxEhCJpCvEYhg8HGNqkvMd/sN7qwSW8zJVaAH+sMuwlq56xAd39S2qqNNIpLCoLHnXRq4okPFmD9EKXCvoZnlT/J6Uci6uwr6lFtw3x7w+lPCohLzmMNVaQmP9PZ22Hb41JmLljDeDMODOZrVg8VwjNkpBc40hJ49dTbuR994iaNQQO5MdQC9bGv8WbDFlyqseRnDrHfmmvCFAWVeqWWA9GUEsi5Cknuw19V1WehRWOBUqh81809KCteOzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qB9fKTWVWUZg9ctHor0J4tpr7+WAIq70HKwOQNMwDxc=;
 b=LDlOS9Tusbrzv76QCjy5e+apYX/8s95ZITfAiHe/LWzAZLesq24ubYG1YoEtuYgHWaPAmXZA+aOtQVX0YRJaIfG+a60phbOOnGueDL6IVl3cLEPjeEwo5lRxbDETUGhmXGjZgRtShOF4Umaxo6V8UN3agfzwhaByntoddZR9ti7nf0ETQtaoMX4gQIqUsCHkojRjYvEdBgmRDXMUAj51VCWNQ8bKacmUokQ8Gi+xL5Dolq67eKdnnFiVWguqHAoXvtkHt0wqprN91Toiqmgmpa65HEH9IvnuvXBFPmVRpxYcN9vPGpzEPJJeyuVr600jWhf+uxIJizBgYpcEGnzE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qB9fKTWVWUZg9ctHor0J4tpr7+WAIq70HKwOQNMwDxc=;
 b=sJu1Z80l6Z6BaPRW/WduFf3YQtw5UyI+vUIvkO1Hnr/vXYjHAN9Mv8wqc1RW6VxohguAm1mDCxPEaMjsVL3H9ZEsds7qncTv3lyPk1NdK8YHhFoKGLxrdSf9UzjdNF6xauABljxpA3cKl+Ie82KmtUp5XCs1HTp1Ppn3TakqKTw=
Received: from MWHPR12MB1663.namprd12.prod.outlook.com (2603:10b6:301:e::9) by
 MWHPR1201MB2492.namprd12.prod.outlook.com (2603:10b6:300:e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 09:25:14 +0000
Received: from MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::6589:efec:c3ee:cbaa]) by MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::6589:efec:c3ee:cbaa%11]) with mapi id 15.20.3541.028; Wed, 18 Nov
 2020 09:25:14 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: RE: snd-rn-pci-acp3x - auto dmic detection unreliable
Thread-Topic: snd-rn-pci-acp3x - auto dmic detection unreliable
Thread-Index: AQHWvYo5qUto92LFuEi5qZyKYWwLGKnNnYjQ
Date: Wed, 18 Nov 2020 09:25:14 +0000
Message-ID: <MWHPR12MB166388C29409E3D488E5C85597E10@MWHPR12MB1663.namprd12.prod.outlook.com>
References: <a13f4f45-513e-0b99-8cf4-0ae89bf7d6bd@perex.cz>
In-Reply-To: <a13f4f45-513e-0b99-8cf4-0ae89bf7d6bd@perex.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-11-18T09:24:44Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=8220a000-756f-4bb8-b4bb-000044a818ee;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-11-18T09:24:14Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: a1f542cd-dac1-421c-bde0-0000f758f1d6
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-11-18T09:25:02Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 3e2fc1d9-6e3b-46f9-9dd3-0000bbb94b76
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2401:4900:52b5:e5d9:84be:40ae:7213:757c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ca1ebfbb-acb0-4df6-d6c4-08d88ba3daff
x-ms-traffictypediagnostic: MWHPR1201MB2492:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1201MB2492168B119E4F21346FA2FD97E10@MWHPR1201MB2492.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MXbgbbTgqqCY2t77e6bTOOyYfiqCg6k1LZqn0hM/X3T/VJam7JpRUM9/kZIJE3352twEIKg3p8AVvH8LPlPcoxeddFyqOw1JVvkoYsQ8yEheS+Cz9FO1ItDWaRaf2Zi60IATeqYBBNgDm4acJIOgfmuy2hhhhMx5MA7wiKXxACJ3BtzyxkGgtysVQL1pjSlvFx8RsLF1R5nZIFBpWTPfm3m7W1ed6jaCkc1Pt8X3RgLWzHnkMs0kFUNfMk9XbBJ/t7oXu3NV1VWXknirnCSCrtOWT9AzeQZvKcxF0aFz+Vupo5nHu8cPJnbWLWz+nwJ0Z/Ndtzb560UxEXrDLCh54gewNLiTUHAhlOhZuYCouDCXQPrTsd3wiKyHDRBIshRq0WN7vGKc+Y2HoA2eZjthRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(8676002)(33656002)(4326008)(52536014)(55016002)(966005)(9686003)(66556008)(66476007)(45080400002)(186003)(66946007)(66446008)(316002)(478600001)(54906003)(64756008)(76116006)(8936002)(7696005)(6916009)(86362001)(71200400001)(5660300002)(2906002)(53546011)(83380400001)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 7ATpgV2UAUkKmDewTQXdP+IOFMbQ5Q3O7f8urG+r3AASFKXQ2CsGRI40i/VfyVq4beiKXVwYYGDXTKt5vYRjzfT3oteQLZu+8Kz+hsKWIJuiWGHJTbLnOp3b3/CNADiSb6hoUbDTrHC6gSXHWEo0gELRadpl35NTZBIOSqZB0ywddqX1mB1E189hO0RCWSQGrbWw6iJgJnAlbAxEDs2yMihUXGSHAop+SycGp0+JG6n0KMWZRiu3/NL5K6P2cNm/MTFp86xL87jiq+ZQ5H3dGAy1by6/e+fq0IzX5C9v18j7G4kV9wMjBAtsLW7aX0ALyOU0gaYNBwY9ZZxxtB35+QJpsGDMgHTEtrye1VFBHgQfVbs43QlS5POy6F8kP2bOt6CyuDTWUgqpkLHvb7Sa/F36NJ/kEl3h4WZUicN1Sc10SDO6gKkWoQglDt6cM57f+GKq2lWk6VKbzJv+vKQWe33O107f2RrFFAm7liXvT6aGR8qkLEHTLexXscBxwl5H2LD05bG9I7QXm8dVzGigDl61lHpxfPTSJl6HlLXFcZQWRfXcIElINioJAGWc99NT9CSbV56urs291qE2rv4kncrZ6WkjxAlLp3XTEosxCkwSenv49eDqQYVaKdgkymF7h8Zt8a6BiWLfr6uIwvEhi2QIlXlnYnosW5KprA8/JUGL7MRjOrhIdk2yRIFxHJ85kGpfp+l37WG15OQW39tovw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1ebfbb-acb0-4df6-d6c4-08d88ba3daff
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2020 09:25:14.1515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OnaH+GG1l5tP9hhrsMdEfDx4gkaA18gnm+dykgkmO+fujgjN1/yJJeS72gEsnuca1ptiPM/Ed32ETsdCMQxOZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2492
Cc: ALSA development <alsa-devel@alsa-project.org>, "Kandimalla,
 NagaMalleswaraRao" <NagaMalleswaraRao.Kandimalla@amd.com>, "Arya,
 Virendra-Pratap" <Virendra-Pratap.Arya@amd.com>
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

W0FNRCBQdWJsaWMgVXNlXQ0KDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+IA0KU2VudDogV2VkbmVzZGF5LCBOb3Zl
bWJlciAxOCwgMjAyMCAyOjM3IFBNDQpUbzogTXVrdW5kYSwgVmlqZW5kYXIgPFZpamVuZGFyLk11
a3VuZGFAYW1kLmNvbT4NCkNjOiBBTFNBIGRldmVsb3BtZW50IDxhbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmc+DQpTdWJqZWN0OiBzbmQtcm4tcGNpLWFjcDN4IC0gYXV0byBkbWljIGRldGVjdGlv
biB1bnJlbGlhYmxlDQoNCkhpLA0KDQoJaXQgc2VlbXMgdGhhdCB0aGUgQUNQSSBhdXRvLWRldGVj
dGlvbiBvZiB0aGUgcHJlc2VuY2UgdGhlIGRpZ2l0YWwgbWljcm9waG9uZSBjb25uZWN0ZWQgdG8g
QU1EIFJlbm9pciBhdWRpbyBicmlkZ2UgaXMgdW5yZWxpYWJsZS4gSXQgbWF5IGJlIHRoYXQgaGFy
ZHdhcmUgdmVuZG9ycyBkbyBub3QgcHJvdmlkZSB0aGUgY29ycmVjdCBBQ1BJIHRhYmxlcy4NCglD
b3VsZCB5b3UgY2xhcmlmeSB0aGUgdXNhZ2Ugb2YgX1dPViBpbnRlZ2VyIHZhbHVlPyBJdCBzZWVt
cyB0aGF0IHRoaXMgdmFsdWUgaXMgc2V0IG9uIHRob3NlIHBsYWZvcm1zIHdoaWNoIGRvIG5vdCBo
YXZlIHRoZSBkaWdpdGFsIG1pY3JvcGhvbmUgKHRoZSBtaWNyb3Bob25lIGlzIGNvbm5lY3RlZCB0
byB0aGUgSERBIGNvZGVjKToNCg0KX1dPViBpbnRlZ2VyIHZhbHVlIHNob3VsZCBiZSBzZXQgb25s
eSB3aGVuIERNSUMgaXMgY29ubmVjdGVkIHRvIEFQVS4NCldoZW4gRE1JQyBpcyBub3QgYXZhaWxh
YmxlLCBfV09WIGludGVnZXIgdmFsdWUgc2hvdWxkIGJlIHNldCB0byB6ZXJvIGJ5IEJJT1MuDQoN
Ckxlbm92byBJZGVhUGFkIDUgKDE1QVJFMDUpDQpMZW5vdm8gVGhpbmtwYWQgWDM5NQ0KDQoJSW4g
YW55IGNhc2UsIHdlIHNob3VsZCBwcm9iYWJseSBpbXByb3ZlIHRoZSBhdXRvLWRldGVjdGlvbiB1
c2luZyBETUkgb3Igb3RoZXIgcGxhdGZvcm0gaW5mby4NCg0KCQkJCQlKYXJvc2xhdg0KDQpCdWdM
aW5rOiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9
aHR0cHMlM0ElMkYlMkZidWd6aWxsYS5yZWRoYXQuY29tJTJGc2hvd19idWcuY2dpJTNGaWQlM0Qx
ODkyMTE1JmFtcDtkYXRhPTA0JTdDMDElN0NWaWplbmRhci5NdWt1bmRhJTQwYW1kLmNvbSU3QzRk
OTAxNTMxYjY0NTRiZWJjNTgyMDhkODhiYTE1YTRiJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJk
OTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQxMjg3MjQxMjg4Nzg0OCU3Q1Vua25vd24lN0NUV0ZwYkda
c2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dp
TENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1TNzc2OXVZR1QzZGIlMkJhenR6WnlvYm1W
TjJsZXNlWFBxalI2cGt0RlVhUjAlM0QmYW1wO3Jlc2VydmVkPTANCg0KLS0NCkphcm9zbGF2IEt5
c2VsYSA8cGVyZXhAcGVyZXguY3o+DQpMaW51eCBTb3VuZCBNYWludGFpbmVyOyBBTFNBIFByb2pl
Y3Q7IFJlZCBIYXQsIEluYy4NCg==
