Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D717914B249
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 11:08:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74F92167A;
	Tue, 28 Jan 2020 11:07:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74F92167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580206082;
	bh=9ycYDkjTtP9UrImstxsb0Rx94mj3ERLfav/51PnFmAs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B+1bZ1FGSLUWA9NtCooWHVjOF9KphDRiPoVIcy93xGlutCYc2EwqSiSBRYaIyAD0b
	 xXJOiKcICVVgD7Wo/xc2DQ10qx8zJTsfqf+9pxfFY3CppYJXi5KwZPG296h11uMWSf
	 5LK3eSdCJ1Om9SXNO7MnzOtmKlYZl8MIVguSSoaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6442F80256;
	Tue, 28 Jan 2020 11:05:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F419F80274; Tue, 28 Jan 2020 09:06:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140043.outbound.protection.outlook.com [40.107.14.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B677F80268
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 09:06:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B677F80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="MyjtX7ef"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJxDbtP9C0C4ApCOukY4fNoJyuEjPCBPZMg5Gz3v68cIKkOoyHd1achdbC80uu9w4hzpl4QNjVQK3f+D5dtJ9q9gV8NDKi8bUErO1TUEsP6OoYZUwVed26XYpWGu0X6Rske8HbHTlM2Xnq8Exq9cAiHnVBsndQMLMl2ww33225ByZrCyEya2wsxSrmjmEslobHCNjUD4cxPQG3NuqsVH8YESjaiors3p+NHb3jKWLvIUPYItmVYcSKg98kdMUvOJhm163ZUqLtU+cQMWTswerCwLRVP77YQz22SU3wXilXVjFFIy2FORgYdq2MvG3KFM17TzSFvFadNn253J9U0HEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgrTWVveA8muFu/PDoevERBiRmp32PRRCYOjvz1v+0g=;
 b=UtvNQystGXrnTodUEiD15mRg84FTsTCHnnoxw8uhRmWrRB74vDghQFrYbA5oXl4NYfpe9SxFJiuAubrsN7j7jl2M0xgUqX+RmFu5NU9GgvtZRYJngxHnlLs/ZvhQCKB88UehD0nnZuTwxWI2wKABGWA3yChoYre2A9k7DlyCbbWtogdQzmxBx/o5VcUpklEzIlN33ClxdkPamidd6B6Dys1RKg/xvJ2alP9NowieKSYMvVB8hx5jc0/UQBP+FBPG7tOWtqgvObr2r+SiataWSJMW5XsZlTfaIB6E0G3rS96GdeIhAtE3PZK6UhkeoDVpGqH1GH+9KHw0/IDldth8Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgrTWVveA8muFu/PDoevERBiRmp32PRRCYOjvz1v+0g=;
 b=MyjtX7efT+Y3BYceu4ow4y6UYCczdWpjWZSsLCLEjfRoQ6fbwO3r8qB/R5PHVccGs+VPW7/KsTdUQj2CgilI3wwgT5d9iHnwBTz6siZE3P8FCy1vISoUmpk/Z4j8NC1Gia1NyDOl0wcn74Oc9LAXSVPiqeWw+6U4Hcw65o5cQxQ=
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3646.eurprd04.prod.outlook.com (52.134.13.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.23; Tue, 28 Jan 2020 08:06:08 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1%4]) with mapi id 15.20.2665.026; Tue, 28 Jan 2020
 08:06:08 +0000
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM4PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:200:42::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.13 via Frontend
 Transport; Tue, 28 Jan 2020 08:06:06 +0000
From: "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>
To: "broonie@kernel.org" <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Thread-Topic: [PATCH 0/4] Add a better separation between i.MX8 families
Thread-Index: AQHV1bHLGvLY3Gox+0avSHaglC7LIg==
Date: Tue, 28 Jan 2020 08:06:07 +0000
Message-ID: <20200128080518.29970-1-daniel.baluta@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:200:42::25) To VI1PR0402MB3839.eurprd04.prod.outlook.com
 (2603:10a6:803:21::19)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e3d9c1b8-58cc-40cb-1e37-08d7a3c8ede6
x-ms-traffictypediagnostic: VI1PR0402MB3646:|VI1PR0402MB3646:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB36467B2BC005E00A0390AFF6B80A0@VI1PR0402MB3646.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 029651C7A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(189003)(199004)(86362001)(6506007)(6512007)(54906003)(110136005)(2906002)(316002)(478600001)(81156014)(6486002)(956004)(66946007)(71200400001)(66476007)(2616005)(64756008)(66446008)(1076003)(8936002)(16526019)(81166006)(5660300002)(186003)(4326008)(66556008)(26005)(8676002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3646;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5seF/cMWrE99bSQDovor1/PFw/wbnsONC9mVCPvCW2p3iDWP5xrXDghuFRf+4AEStgKZNQIiJIKAqj9WlcBpggLao9Yz0mq1WP7YUW8+T2gkRp9gvQ/gpBoOLsCt8eAh2s0MkqQKgAUK5H1R4HrWwuH4PLtU9Qrzv7f8aMskz1u+m5hUWGAuKmoRUiYL8jtR9JOhYhr4laOcoIXS9mas8RewwhE62gL26fp4Z/d4TBz0H2mmcB/WNSkVtnZ4lsvbfjmlqIYQdxT8M3zbFzJcqizfMRBjPeeHX7b0eo6AMlKXR3z38iNeqXI1H9jATpinUL/R1QrwGlMMG8x7ARsIIHt5JqjsKrDn+q3nKLB4QJRQcv/txvLlZC+K+DoxJ1UqDkU7zTRbnZ4lifCm+RpiMSOx3A+RBDEx6dDjWlnpelLLD4i9UIrToRWTWtWLj3iV
x-ms-exchange-antispam-messagedata: Ytp8a2700P4ELLxTOcydR5uKjvIXyd1TdtDwfgTd/hbMEZqTwK6v5bzphtVNECC3M7TRxwGvZa2cO++Id+vR/2u4jdiwqAPWMVDzyP+JEMpuRwvEczDJeLCAqIYl1hMgIdMOiOuRsqBww37PbiFlqw==
Content-ID: <701A0E63D7940347839D7CE063670E83@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d9c1b8-58cc-40cb-1e37-08d7a3c8ede6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2020 08:06:08.2069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rArL3kXfnhEmeFo4xzRgX0/G0DD/+Q9fgL66pWzU3GmJ6nfMLp49prLxX7PMSpGYFP8z7ZOvI6g4KRzG36oZgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3646
X-Mailman-Approved-At: Tue, 28 Jan 2020 11:05:35 +0100
Cc: "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 dl-linux-imx <linux-imx@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [alsa-devel] [PATCH 0/4] Add a better separation between i.MX8
	families
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

RnJvbTogRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAuY29tPg0KDQpTbyBmYXIgdGhl
IGltcGxlbWVudGF0aW9uIHdhcyBkZXNpZ25lZCB0byBzdXBwb3J0ICBhIGdlbmVyaWMgcGxhdGZv
cm0NCm5hbWVkIGkuTVg4LiBBbnlob3csIG5vdyB3b3JraW5nIHdpdGggc3BlY2lmaWMgaS5NWDgg
aW5zdGFuY2VzIHdlIG5lZWQNCnRvIGFjY291bnQgZm9yIHRoZSBkaWZmZXJlbmNlcy4NCg0KaS5N
WDggbmFtaW5nIGNhbiBiZSBjb25mdXNpbmcgYXQgdGhlIGZpcnN0IGdsYW5jZSwgc28gd2UgbmVl
ZCB0byBoYXZlDQphIGNsZWFuIHNlcGFyYXRpb24gYmV0d2VlbiBkaWZmZXJlbnQgcGxhdGZvcm1z
Lg0KDQpIZXJlIGlzIHRoZSBzcGxpdCBvZiBpLk1YOCBwZXIgcGxhdGZvcm1zLiBOb3RpY2UgdGhh
dCBpLk1YOCBuYW1lcw0KdGhlIGVudGlyZSBmYW1pbHksIGJ1dCBhbHNvIGEgc3ViLWZhbWlseS4N
Cg0KaW14OA0K4pSc4pSA4pSAIGlteDgNCuKUgsKgwqAg4pSU4pSA4pSAIGlteDhxbSAoKikNCuKU
nOKUgOKUgCBpbXg4bQ0K4pSCwqDCoCDilJzilIDilIAgaW14OG1tDQrilILCoMKgIOKUnOKUgOKU
gCBpbXg4bW4NCuKUgsKgwqAg4pSc4pSA4pSAIGlteDhtcCAoKikNCuKUgsKgwqAg4pSU4pSA4pSA
IGlteDhtcQ0K4pSU4pSA4pSAIGlteDh4DQogICAg4pSU4pSA4pSAIGlteDhxeHAgKCopDQoNClBs
YXRmb3JtcyBtYXJrZWQgd2l0aCAoKikgY29udGFpbiBhIERTUC4gSW4gdGhlIGZ1dHVyZSB0aGVy
ZSBtaWdodCBiZQ0KbW9yZSBwbGF0Zm9ybXMuDQoNClRoaXMgcGF0Y2hzZXJpZXMgZG9lcyB0aGUg
Zm9sbG93aW5nOg0KCSogcmVuYW1lcyBpbXg4IHRvIGlteDh4IChiZWNhdXNlIHRoZSBvbmx5IHN1
cHBvcnRlZCBwbGF0Zm9ybSBub3cNCiAgICAgICAgaXMgaW14OHF4cCkuDQogICAgICAgICogYWRk
cyBzdXBwb3J0IGZvciBpbXg4ICh3aGljaCBpcyBpbXg4cW0pDQoNCkEgZnV0dXJlIHBhdGNoc2V0
IHdpbGwgYWRkIHN1cHByb3QgZm9yIGkuTVg4TVAuDQoNClBhdWwgT2xhcnUgKDQpOg0KICBBU29D
OiBTT0Y6IFJlbmFtZSBpLk1YOCBwbGF0Zm9ybSB0byBpLk1YOFgNCiAgQVNvQzogU09GOiBpbXg4
OiBBZGQgb3BzIGZvciBpLk1YOFFNDQogIEFTb0M6IFNPRjogQWRkIGkuTVg4UU0gZGV2aWNlIGRl
c2NyaXB0b3INCiAgZHQtYmluZGluZ3M6IGRzcDogZnNsOiBBZGQgZnNsLGlteDhxbS1kc3AgZW50
cnkNCg0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RzcC9mc2wsZHNwLnlhbWwgICAgICB8ICAx
ICsNCiBzb3VuZC9zb2Mvc29mL2lteC9pbXg4LmMgICAgICAgICAgICAgICAgICAgICAgfCA1NyAr
KysrKysrKysrKysrKysrKystDQogc291bmQvc29jL3NvZi9zb2Ytb2YtZGV2LmMgICAgICAgICAg
ICAgICAgICAgIHwgMTAgKysrKw0KIDMgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
