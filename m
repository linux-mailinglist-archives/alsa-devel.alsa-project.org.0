Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFA31ECD9F
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 12:34:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CEFD1664;
	Wed,  3 Jun 2020 12:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CEFD1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591180479;
	bh=2Bt2nRA0yj6ED+xGOXs3M2PlKdpmMcua5wfLh1irTK4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XcqHTrE1yHWHc0hZ7l3uUTPQJrdVjjnuOGEcM3yWShfWmqWBcz7m4stBMZTAmY2X6
	 gCSpieVwJ+F3hY4pUSwx5k3vBW8TPEDaPIpQ+omcnYur+4H0PbHMMvAkn/sHSZD9H3
	 N5Vji5O4+MknMbOxcwfiTSstmm5F0WXs5aor58tA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 778B1F801EC;
	Wed,  3 Jun 2020 12:32:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9392EF801ED; Wed,  3 Jun 2020 12:32:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760073.outbound.protection.outlook.com [40.107.76.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95ACBF800BC
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 12:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95ACBF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="HEIJMYXV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFG2nkp5m7ECieZX3e+MrgNZljs8g+d1PkvcGjTPPQsHgGAeW8QSw5K4nEIZ9m/hLfKwYm4npjBo5qlSiaYAr9eUbREG2La7WoT34RI/YTkbO00SG/qxBp9O0W521b4UZ5+JYjuJi+TO1eU7GccjRdD35hI/3zpZqlFD7dBrn4YKhGccUHvoHNxGN0HYYSr1gfnnDCXLrRvAozZx6AC/IQxPA6RyXN3z+tGUhBTpNLnKIl+qtKhmOCOtXkfNsRJwocR/T2G/e0OlUsg4I0uPHJV45Qc6w4XT+l28RtqOiY5YcSPzyKsmY8UksUExH34Ap5ef1teesIsbhKBE/2pKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Bt2nRA0yj6ED+xGOXs3M2PlKdpmMcua5wfLh1irTK4=;
 b=aQ1XpzqH+crxOONaNEdKkTB6IL28z155XcifDkj4b2FEWsqlNAX81H44eGX6L8dreRvuv7DAcNYOwR6JegeZJjbMFO//8eGqHoap4e/iCFeYuhld01Y9hntEs3/hN1SLXK9vhXaOOFiYpOzrLPhxMI4j5Rps6VNHRhRQebv5QIuCleT8xtprzjow8pyvhH+qbnciK97VTzceeeGy+2hkAbOstFtij20N6GoLjbl/54oMg88/Xd/8PrE6XRqF7PfKoRdKhWmQF2OyiIuETaQaPaKIx3UVC20yed6VLH12oUCdR3nCCplK/Kd7bDeFcP7Xw1vmPkAXxyr7wMzqLisvzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Bt2nRA0yj6ED+xGOXs3M2PlKdpmMcua5wfLh1irTK4=;
 b=HEIJMYXVwssFOr64jCUxUA+HJo+fOgJn+ptSEi1+7Ol1qGGdRqnk0KPcscE61kUqu42vSS/rY5DwL2q2XkHC4Kap64pSlXVCN2ME6q/zhu122HGlW/CnFrOZBV7bF49DWukmayHDvffx6xWyyvm3CCu1dpvgLpdRW3NO9kMtXXA=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3354.namprd12.prod.outlook.com (2603:10b6:5:11f::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.17; Wed, 3 Jun 2020 10:32:41 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::f9c2:772:27f4:87e0]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::f9c2:772:27f4:87e0%3]) with mapi id 15.20.3045.022; Wed, 3 Jun 2020
 10:32:41 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Takashi Iwai <tiwai@suse.de>, Hui Wang <hui.wang@canonical.com>
Subject: RE: alsa-project alsa-ucm : Audio endpoint is not switching when
 external mic connected
Thread-Topic: alsa-project alsa-ucm : Audio endpoint is not switching when
 external mic connected
Thread-Index: AQHWORWZpOabhVK9PUqV2EcoXElfLajGC9qAgACWYQCAAAzZEA==
Date: Wed, 3 Jun 2020 10:32:41 +0000
Message-ID: <DM6PR12MB263397E76403D68BA6FE383E97880@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <DM6PR12MB26332026A8F345F742B5E9FF978B0@DM6PR12MB2633.namprd12.prod.outlook.com>
 <d149204b-1e2d-1ee9-fbb4-c6f8874e369a@perex.cz>
 <da8b6e1e-fd29-fb99-07a7-d5fd8c7b78f9@canonical.com>
 <s5htuzsebm9.wl-tiwai@suse.de>
In-Reply-To: <s5htuzsebm9.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-06-03T10:32:33Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=cb386f0f-a23b-4ca1-b50d-0000479c8403;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-06-03T10:32:22Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 5fadeb59-214a-465b-9178-00008f5178dd
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-06-03T10:32:37Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: 659531ea-0c51-4101-932c-00009fda1fd5
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e6628df5-8f8c-40d6-3525-08d807a971c8
x-ms-traffictypediagnostic: DM6PR12MB3354:
x-microsoft-antispam-prvs: <DM6PR12MB335482585AEFBF685286454697880@DM6PR12MB3354.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 04238CD941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HrIhW1drUMfVOTLLJRI5vczPIWosynVa+Cma/PEbLUnhmHlfZMthgef6y5To9dM56TZSwN3XsjujMmumhNjRk0U9+TJglHwE3iqZ+xq/GSmY1BHPcJBj4ahNTtH32yEk3Fi46IwzcExFErzvsHVQAapI5uY71mNx5K/Jub8R4lZu4KPI6wYp6zhYiChvNRValK+ZUkqfld0Ki68P+FdAfOl/s13LVDEJZhotxqGEgkmLxujEKFSn/8nM6M+xZNbeE7ynEowz78XmQDjVvOV2K0PBkmDJXtlewnrEfzA9LD1atAuLofdgSd5lKyHtD+KMydRkpFFcB+DXEEikds6RwxWfiCKvWO9ANUSWIzaFPkzUA/bHGrQfBPU+Bkj4BUsWYzVqrEpvmf8DbBkhFhfYdw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(9686003)(71200400001)(86362001)(54906003)(83080400001)(110136005)(55016002)(186003)(2906002)(83380400001)(45080400002)(478600001)(52536014)(53546011)(7696005)(66946007)(76116006)(4326008)(26005)(6506007)(966005)(8676002)(33656002)(66556008)(8936002)(316002)(66476007)(5660300002)(66446008)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: J4pyYe8aJ8yriwzhCv2WbD2tZD8vibUfib/Q6hk8nCmews09KKgEnFQGOXzN6pxzwU1FyeEPHFA+1w7oBdoRYVsshS15VClZdNkXcxz/5jfJuBBZ2HRdmJqXwswR+iOzuvInRMnzFa5pn6VM/Fit3pZ29UzMw8BzDpWOEfgEGykUrAIJfHzdQcDjsZCB0iyWtDskjdHsQbhd+30amVWQhObLG0D/KmQfIyYsZQ/5VNKO5OMis9vOt7W6DL9621b2LBo+liUBooAmmsSj8pbnuLroMIoh4fXC1iC9Ok8tznWKvcSTVlDBwd6TO9M25AityHXSP+A30ImjKSS6Es6aXk0DLkUZfFl39n683aHN0gYV75tS6g2oKH7okSdyP2gXgjrtZisUhbim9M/XVptXDklpzFN3uB2L5I/3S7WA38SBBgAD8wsHWwa5uS/8G5uo09R6J2lQ3s7v0DKHPd7eqEndZauxwJ2TznxuATANdL5A/sqH4c1wAnI5qsfXsIUX
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6628df5-8f8c-40d6-3525-08d807a971c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 10:32:41.1179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: czI//k5OVL2s02B+A1Ux5qpIF4T1akfC6Kg72s3RiPngV93NT3PeFa+rcPtZZn7JTdlY+xlkMxuzFqOVM6X6xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3354
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGFrYXNoaSBJd2FpIDx0
aXdhaUBzdXNlLmRlPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMywgMjAyMCAzOjA1IFBNDQo+
IFRvOiBIdWkgV2FuZyA8aHVpLndhbmdAY2Fub25pY2FsLmNvbT4NCj4gQ2M6IEphcm9zbGF2IEt5
c2VsYSA8cGVyZXhAcGVyZXguY3o+OyBNdWt1bmRhLCBWaWplbmRhcg0KPiA8VmlqZW5kYXIuTXVr
dW5kYUBhbWQuY29tPjsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJl
OiBhbHNhLXByb2plY3QgYWxzYS11Y20gOiBBdWRpbyBlbmRwb2ludCBpcyBub3Qgc3dpdGNoaW5n
IHdoZW4NCj4gZXh0ZXJuYWwgbWljIGNvbm5lY3RlZA0KPiANCj4gT24gV2VkLCAwMyBKdW4gMjAy
MCAwMjozNjoyNSArMDIwMCwNCj4gSHVpIFdhbmcgd3JvdGU6DQo+ID4NCj4gPg0KPiA+IE9uIDIw
MjAvNi8zIOS4iuWNiDM6MzksIEphcm9zbGF2IEt5c2VsYSB3cm90ZToNCj4gPiA+IERuZSAwMi4g
MDYuIDIwIHYgMTk6NTcgTXVrdW5kYSwgVmlqZW5kYXIgbmFwc2FsKGEpOg0KPiA+ID4+IFdlIHJl
Y2VudGx5IHVwIHN0cmVhbWVkIEFDUCBQRE0gZHJpdmVyIGZvciBSZW5vaXIgQVBVLg0KPiA+ID4+
DQo+ID4gPj4gT3VyIEFDUCBJUCBoYXMgYW4gaW50ZXJuYWwgUERNIERlY29kZXIgYmxvY2sgd2hl
cmUgRE1JQyBpcyBkaXJlY3RseQ0KPiA+ID4+IGNvbm5lY3RlZC4NCj4gPiA+PiBUaGVyZSBhcmUg
bm8gS0NvbnRyb2xzIGRlZmluZWQgZm9yIFBETSBEcml2ZXIuDQo+ID4gPj4NCj4gPiA+PiBPdXIg
cGxhdGZvcm0gc3VwcG9ydHMgb24gYm9hcmQgRE1JQyBhbmQgU291dGggYnJpZGdlIEF6YWxpYSAo
SEQNCj4gPiA+PiBBdWRpbyApIGVuZHBvaW50IC4NCj4gPiA+PiBCeSBkZWZhdWx0LCBETUlDIGVu
ZHBvaW50IGlzIHVzZWQgYXMgYXVkaW8gaW5wdXQgZGV2aWNlLg0KPiA+ID4+IFdoZW4gSGVhZHNl
dCBNaWMgamFjayBjb25uZWN0ZWQsIGl0J3Mgbm90IHN3aXRjaGluZyB0byBFeHRlcm5hbCBNaWMu
DQo+ID4gPg0KPiA+ID4gTWFrZSBzdXJlIHRoYXQgdGhlIEhlYWRzZXQgTWljIHByaW9yaXR5IHBv
cnQgaW4gcHVsc2VhdWRpbyBpcyBpcw0KPiA+ID4gZ3JlYXRlciB0aGFuIHRoZSBvbmUgZm9yIERN
SUMuDQo+ID4gPg0KPiA+ID4+IEhvdyBkb2VzIGF1ZGlvIGVuZHBvaW50IHdpbGwgc3dpdGNoIGlu
IGdub21lIHdoZW4gZXh0ZXJuYWwgbWljIGlzDQo+ID4gPj4gY29ubmVjdGVkPw0KPiA+ID4+PiBG
cm9tIG91ciB1bmRlcnN0YW5kaW5nLCBVQ00gY29uZiBmaWxlIGZvciBIREEgZHJpdmVyIGlzIGFs
c28NCj4gPiA+Pj4gcmVxdWlyZWQgZm9yDQo+ID4gPj4gY29uZmlndXJpbmcgbWl4ZXIgY29udHJv
bHMgZm9yIEhEIEF1ZGlvIGNhcHR1cmUgZGV2aWNlLg0KPiA+ID4+IFNpbWlsYXJseSB3aGVuIEV4
dGVybmFsIE1pYyBpcyByZW1vdmVkICwgaXQgaGFzIHRvIHN3aXRjaCB0bw0KPiA+ID4+IGludGVy
bmFsIGRtaWMgLg0KPiA+ID4NCj4gPiA+IEFuIGNvbmZpZ3VyYXRpb24gZXhhbXBsZSBmb3IgVUNN
IChETUlDIGNvbm5lY3RlZCB0byBEU1AsIEhEQSBjb2RlYw0KPiA+ID4gZm9yIHJlc3QpOg0KPiA+
ID4NCj4gPiA+DQo+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yg0KPiAuY29tJTJGYWxzYS1wcm9qZWN0JTJGYWxz
YS11Y20tY29uZiUyRnRyZWUlMkZtYXN0ZXIlMkZ1Y20yJTJGc29mLQ0KPiBoZGEtDQo+IGRzcCZh
bXA7ZGF0YT0wMiU3QzAxJTdDVmlqZW5kYXIuTXVrdW5kYSU0MGFtZC5jb20lN0M1ZmJiM2E1MTZk
NQ0KPiAyNGM3MzU2OGQwOGQ4MDdhMTU3YTElN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRl
MTgzZCU3QzAlN0MNCj4gMCU3QzYzNzI2NzczNjgyNzY3MTk0NiZhbXA7c2RhdGE9MGFPN2RiTEFU
dVclMkJJZUpzaldvV0NHT2FZRU8NCj4gV1FhVndJOWl6cHBCM3Y3ayUzRCZhbXA7cmVzZXJ2ZWQ9
MA0KPiA+ID4NCj4gPiA+IElmIHlvdSBuZWVkIGEgaGVscCB0byBjcmVhdGUgYSBuZXcgY29uZmln
dXJhdGlvbiBmb3IgeW91ciBoYXJkd2FyZSwNCj4gPiA+IHNob3cgdGhlIG91dHB1dCBmcm9tIHRo
ZSBhbHNhLWluZm8uc2ggc2NyaXB0LCBwbGVhc2UuDQo+ID4gPg0KPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSmFyb3NsYXYNCj4gPg0KPiA+IFRoaXMgYXVkaW8g
ZGVzaWduIGlzwqAgYSBiaXQgZGlmZmVyZW50IGZyb20gc29mLWhkYS1kc3AsIHRoZSBkbWljIGlz
IG9uDQo+ID4gYSBzdGFuZGFsb25lIHNvdW5kIGNhcmQuIFBsZWFzZSBzZWUgdGhlIGFsc2EtaW5m
by50eHQ6DQo+ID4NCj4gPg0KPiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91
dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZwYXN0ZWINCj4gaW4udWJ1bnR1LmNvbSUyRnAl
MkY0a3ByaERaWWJnJTJGJmFtcDtkYXRhPTAyJTdDMDElN0NWaWplbmRhci5NdQ0KPiBrdW5kYSU0
MGFtZC5jb20lN0M1ZmJiM2E1MTZkNTI0YzczNTY4ZDA4ZDgwN2ExNTdhMSU3QzNkZDg5NjFmZTQN
Cj4gODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MjY3NzM2ODI3NjcxOTQ2JmFt
cDtzZGF0YT1RDQo+IDUweE5iRjFLU3Fhc05hMFV5S3pVRkF6T2M5S1BJZ3VCamdZSHIxWFNiZyUz
RCZhbXA7cmVzZXJ2ZWQ9MA0KPiANCj4gQW5kIHRoYXQncyBhbiBpbnRlcmVzdGluZyBjYXNlLiAg
Q2FuIHdlIG1hbmFnZSBtdWx0aXBsZSBjYXJkcyBpbiBhDQo+IHNpbmdsZSBVQ00gcHJvZmlsZT8N
Cj4gDQo+IA0KPiBUYWthc2hpDQoNCkkgYW0gbm90IG11Y2ggZmFtaWxpYXIgd2l0aCBVQ00gZmls
ZXMgY3JlYXRpb24uDQpBcyBwZXIgbXkgdW5kZXJzdGFuZGluZywgVUNNIGVudHJpZXMgd2lsbCBw
cm9ncmFtIHRoZSBtaXhlciBjb250cm9scw0KZGVwZW5kaW5nIHVwIG9uIHRoZSB1c2UgY2FzZSBh
bmQgc2VsZWN0ZWQgZGV2aWNlLg0KDQpCdXQgZm9yIFBETSBzb3VuZCBjYXJkIHRoZXJlIGFyZSBu
byBtaXhlciBjb250cm9scyBkZWZpbmVkLg0KRG8gd2Ugc3RpbGwgbmVlZCB0byBhZGQgVUNNIGVu
dHJpZXMgZm9yIFBETSBzb3VuZCBjYXJkICBhbG9uZyB3aXRoIFVDTSBlbnRyaWVzIGZvcg0KSEQg
QXVkaW8gc291bmQgY2FyZCA/DQpGb3IgZXhhbXBsZSBtZW50aW9uaW5nIHRoZSBwY20gZGV2aWNl
IGZvciBQRE0gc291bmQgY2FyZCwgDQpldmVuIHdlIGRvbid0IHByb2dyYW0gYW55IHNwZWNpZmlj
IGtjb250cm9scyA/DQoNCg0KDQo=
