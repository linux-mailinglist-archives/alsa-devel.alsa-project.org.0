Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 160CE1C7575
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 17:55:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B71DE1665;
	Wed,  6 May 2020 17:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B71DE1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588780556;
	bh=WUEZFRgeCw4MwqPNRRCMnb74K3rzJ4msyK1Fz+2zceU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kAvsQnGHvTlXSrkAPM5vTGOSQ9r3gkRdBZkt9KpbwzRcrn1vIZXNK4q1gbLuuO/gT
	 Dn974qaXHiMSG33auK2poK2iZikUFx0bgLSc4x+PW5B6WPf9R84pHMBV4I2hf9b74o
	 9bzX+bDrTQV07CfLRLtiGgu8iLBOquBMd66QnCjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B41BF80259;
	Wed,  6 May 2020 17:54:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D6FDF800DF; Wed,  6 May 2020 17:54:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::619])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 101E1F800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 17:54:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 101E1F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="CBtube1i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYfgdP8otoEeR1zXuWl2gpR1PCmZeeGh+Ksxb95i0V2BRNkCkH2AXVbAfE7nnZ8Z1gsWg6ZLDHvVMHuUD+EISi7LpD4CHU7FpH2AFnuRfamn7WBbPr2A6KAt6hmFwVcnYa81QCohwcL3nNza/aIRIlwB0Ti1xBwPpx0KjzaBQHSBUPd8ZWhEB5irhxNg4iTQzkzD6838BwjT6Z4ZtmkzpBCO9nsupz6hLRehSI7OMe6Vy4Epa4JGEOXtR0zo9aOmAFUXuhQgVrgwCSDU5e8g27zjat3yGMTpWrzQtmW+RLfHnQmld9ITL41PjTwL6nDmE6O0CS/fMRja4Wf8khqqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUEZFRgeCw4MwqPNRRCMnb74K3rzJ4msyK1Fz+2zceU=;
 b=OVWODbws+8KMP3bcduWaZM7xp3RVBOud2BNvBXm1RqXbtvrEyHtcYo3JzEROYO9JCAcx2+lL67Py6dSyCqHZxhgcf5fSv3oVoah41XxVu/qViTuhT3Txr/ngnDfExbTRuoV1+a7z9kYtyXWCPS1dmAOZ7dJ2EhHJo3hiyphp7VfbjErCpaZPCkcX/fg2Fo8a4GFgfG96tT1V15RWEjfT+hsBLFS9EcZ6O46tddFCehTTWa/59l4FTUJ3pdS49ZniY3cG0NU05hAPemth2PalwnFpaU6Qx9lqjI8AXHRGxkVSvfV/MkwS70Br8B3Z7Q+02VjOOKq1XG5Ihz1jkMJx2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUEZFRgeCw4MwqPNRRCMnb74K3rzJ4msyK1Fz+2zceU=;
 b=CBtube1i9RXLRCf/6j1QAP7DeKSFT7M2zmiuYe75A0qPNbvIoG3B/++A/Q+Zy137kj5SFEZHeyf9bqKCXQj+1te+QA4I0/bnfX5IYG1aNaNc9bwBWv/EtaAOLw9gheHN/vJn2NA0pLAQek0J0SuEWCBoKko143Wdd4M31FGHnwU=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3836.namprd12.prod.outlook.com (2603:10b6:5:1c3::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.26; Wed, 6 May 2020 15:54:02 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.2958.029; Wed, 6 May 2020
 15:54:01 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Alex Deucher
 <alexdeucher@gmail.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "tiwai@suse.de" <tiwai@suse.de>
Subject: RE: [PATCH 14/14] ASoC: amd: enable build for RN machine driver
Thread-Topic: [PATCH 14/14] ASoC: amd: enable build for RN machine driver
Thread-Index: AQHWIx9eubSxPmQRlEGSeiFcD8Q7b6iaBRqAgAExaEA=
Date: Wed, 6 May 2020 15:54:01 +0000
Message-ID: <DM6PR12MB2633FF3CCD730CB9149BB55097A40@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-15-alexander.deucher@amd.com>
 <2a8891ec-d162-77ed-8093-6c7072b6b8f7@linux.intel.com>
In-Reply-To: <2a8891ec-d162-77ed-8093-6c7072b6b8f7@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-06T15:53:58Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=3fcaa111-76f8-4a83-8eb1-00005262d1bb;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-06T15:53:58Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 4b877078-6246-489e-a5ab-00009c8d177c
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c101aeb5-7547-4698-d920-08d7f1d5b26b
x-ms-traffictypediagnostic: DM6PR12MB3836:|DM6PR12MB3836:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB38369AE9D2F670A3F48CC8A497A40@DM6PR12MB3836.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /EqeRjIhCil6kO7j0VIWuLP4KvM3nd007BSKLJ/dsnWvrnoDq6Z7cgMgNEYO68rVzlRI5EtLyzCdgTiQQoswZ7IYinZqRY4KXm5GD3CaYOM4WMWs6zoYTqm23SrTWD/vZ+g+L8ZMZTue/gXqr06QN+mRgVCuxuC/d2W3GORtASoH3n73tisgUW1U8OFi8PI0RgDLOjaVnVqtsxczCfdnmNYzxUdMlGJv5b4WGkCNA9sZkZcl8TQEtE0Lp04flwQ2Uwx3144dnLrnl1zDuxEaz3x581VP5Dvt11dxx/WztODBC8KLCDHrWGRSHaT66TLH/DYlggmk+ilbl4f7zW5AwLAjJdaQMMbTV8feInOkzGaDJKNPyT43AnVR9fBBYTokJkgKe8XJRw2TVgv3J2ICG8MfN6mvkBP5d/noNvYYnNOrdcDlP3tJjUF8QYub9MqbnXCxJzwtzZrsOLhGUegWrwr4WxGIR5eUPgnFeNY4LvRngU45lWPfnrd/atn1bUz4op476Iafu9mii5Gig1BVYg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(33430700001)(186003)(7696005)(71200400001)(26005)(5660300002)(86362001)(9686003)(66476007)(316002)(66446008)(66556008)(64756008)(33656002)(33440700001)(53546011)(2906002)(8936002)(6506007)(110136005)(8676002)(76116006)(478600001)(4326008)(66946007)(52536014)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: pXFb7u4Z6m/VJl0oXxPWQj0cNf92nlj6cVHAA/bZw/8X5i5IrSjo3jzOVzt3fvN0IHW4VYawdBnW4lYei1acx3wvLw2ifqLGDdeB3VzO0RoSQmxfepIMziUMT4AZb3+f3M7ge8lmM51bfGir2MOhof56nqfPidrnRaivwvpJJPDf7b2iHdPxEZ2nBu1ZqWHMhuHAw3G5zEtCD+QugZGo1BEDTAENgQCR6Het8tOUIJLGz9BBrCw7u6gUCnJrUH5uzgYkDGLs4PkCsSIWKXGuFN3HsUC2Xx3+NlRMw+LQtsD4hbjcr9O6zMu7Vo8inXJ8hBgxLb79T0MIXwua6ZKtWymu6q5UuC104kjW0xfxda5Qzy/gObeKA/zw9ni/8buSAIjoSPgfDUf1+5Hl5ZIP02SBurI7kdkxdYWOQ6MI8/G3QONdL80tEt1TX6Vs/R++/v203RlInUVRfeOGKcvidZqxXG3MgluQML7anfDeYSp5gksHLSGLgCsvSfPo375xjKVnC3srdjMwAlgRrKJx7L9hmSdfzgucTvZCKsfGfcbfc5+Mi2UOo/FC8h5ZrMkjBOe7hD+2nmkIZzu5gCbO+vBwXhhm3u5tZ/Zomo7HuM3n2qzkJBhtCtCvQX7Z5KyfM/PA4M/jO/L6bXw1juJbPsqfip/vt/+jei8zQDolZT01v8IAkdgwZZH3JikMc+3fzD3McpMuUUQD7CwyUYDxDGhVFrc4AtyB+GzGNGuUWHIROHc3ym+5KZ3lbDCWg75XBDdkWJ3g5uNEZ6+xXM79++NsciB1MmJOEp+MvyfEVXv6FA79ZwmUvOapSguC55Ta
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c101aeb5-7547-4698-d920-08d7f1d5b26b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 15:54:01.8985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JHUeAy+VYoixtUOdI5QmX2ayC+Gym0n3TsJ0nknolipNjE2UmmCcORYWU6xkfxEekm3gb3SJ5B4FOBU2dOdTFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3836
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
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
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaWVycmUtTG91aXMgQm9z
c2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIE1heSA2LCAyMDIwIDM6MTAgQU0NCj4gVG86IEFsZXggRGV1Y2hlciA8YWxleGRldWNo
ZXJAZ21haWwuY29tPjsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOw0KPiBicm9vbmllQGtl
cm5lbC5vcmc7IE11a3VuZGEsIFZpamVuZGFyIDxWaWplbmRhci5NdWt1bmRhQGFtZC5jb20+Ow0K
PiB0aXdhaUBzdXNlLmRlDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVj
aGVyQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMTQvMTRdIEFTb0M6IGFtZDogZW5h
YmxlIGJ1aWxkIGZvciBSTiBtYWNoaW5lIGRyaXZlcg0KPiANCj4gDQo+IA0KPiA+IGRpZmYgLS1n
aXQgYS9zb3VuZC9zb2MvYW1kL0tjb25maWcgYi9zb3VuZC9zb2MvYW1kL0tjb25maWcNCj4gPiBp
bmRleCA1ZjU3YTQ3MzgyYjQuLjc3ZmZkYjQxYmVlNSAxMDA2NDQNCj4gPiAtLS0gYS9zb3VuZC9z
b2MvYW1kL0tjb25maWcNCj4gPiArKysgYi9zb3VuZC9zb2MvYW1kL0tjb25maWcNCj4gPiBAQCAt
NDIsMyArNDIsMTAgQEAgY29uZmlnIFNORF9TT0NfQU1EX1JFTk9JUg0KPiA+ICAgCWRlcGVuZHMg
b24gWDg2ICYmIFBDSQ0KPiA+ICAgCWhlbHANCj4gPiAgIAkgVGhpcyBvcHRpb24gZW5hYmxlcyBB
Q1Agc3VwcG9ydCBmb3IgUmVub2lyIHBsYXRmb3JtDQo+ID4gKw0KPiA+ICtjb25maWcgU05EX1NP
Q19BTURfUkVOT0lSX01BQ0gNCj4gPiArCXRyaXN0YXRlICJBTUQgUmVub2lyIHN1cHBvcnQgZm9y
IERNSUMiDQo+ID4gKwlzZWxlY3QgU05EX1NPQ19ETUlDDQo+IA0KPiB0aGVyZSBjb3VsZCBiZSBh
IG1pc3NpbmcgZGVwZW5kZW5jeSBpZiBHUElPTElCIGlzIG5vdCBzZWxlY3RlZA0KPiAoU05EX1NP
Q19ETUlDIGRlcGVuZHMgb24gaXQpLg0KDQpXaWxsIGZpeCBpdCBhbmQgc2hhcmUgYSBuZXcgcGF0
Y2guDQpkdWUgdG8gY292aWQxOSBJIGRvbid0IGhhdmUgYWNjZXNzIHRvIG15IHJlZ3VsYXIgZW1h
aWwgY2xpZW50IHNvIGFwb2xvZ2llcyBmb3IgdGhlIGZvcm1hdHRpbmcuDQotIFZpamVuZGFyDQo+
IA0KPiA+ICsJZGVwZW5kcyBvbiBTTkRfU09DX0FNRF9SRU5PSVINCj4gPiArCWhlbHANCj4gPiAr
CSBUaGlzIG9wdGlvbiBlbmFibGVzIG1hY2hpbmUgZHJpdmVyIGZvciBETUlDDQo=
