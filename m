Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E07C8CE523
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 14:19:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9951C741;
	Fri, 24 May 2024 14:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9951C741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716553147;
	bh=a99aLeh6iGZu179GD9aXIWTeRMhV/A4Uh8+Q93ck7SA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aUUM6AlKNJ1K83DdzjbajVNl+IsGcg74DgBG7ZJm+He1Usd573yd/vSCoBzMWjp86
	 XU6/OExfshLKsA2RVqa+ZIvRzmADRLBqDG3s+JR1cMzBlhxXEJ1KkYUnvU38kM9sj/
	 bCkVNt7KE7uzXLm+sOmXtZkeBh3SaJJjwx+hrUyY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 031C4F805F0; Fri, 24 May 2024 14:18:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 951E7F805EE;
	Fri, 24 May 2024 14:18:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55936F8026A; Wed, 22 May 2024 10:25:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2072e.outbound.protection.partner.outlook.cn
 [IPv6:2406:e500:4420:2::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BB02F8016B
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 10:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BB02F8016B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X++gdlT6u0QsXJrJjjPc6Ae3a6VzpN2DEUROoTiy+T8n/6bebHV8sodJjL1v1j05NPp736xdyL2GpYSQq+Ec0yy9Q1AHte0nwH1xym52ngv8AfAAp9/F5M3P5ObrBarm+McSpo42JIvclRSZfCIggAZ1k+YXP/FvSPOQUj/l7u/IagKoyFBbIYh/ldwIBHhpOP2ROWcweYmWATxaVisY2MlTg/6LaCun53hD1mBJOOa6+xEsL/oU/CRdVUYTnkRYFcoiS4cxIMZFqNiAlQPuQzMCsXdp0OtmViaqPeXMnLjFqQNG5zdBkkkGaxCtMY5lVUqRio84xpLjn72YOZFK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a99aLeh6iGZu179GD9aXIWTeRMhV/A4Uh8+Q93ck7SA=;
 b=XaK1V4CW5Ajfmz966Rue6HWS/AuKIjW/fHmVSBiWBkdzyGDNNap864G0w17ZewGzVO8jZRDlj3ZM3p57wMSCQiq2ZTUtab9VGKEA8tc3JLImSZVTY7y4FxiVetJVGspiEuqYVKcy2GDe7SPZ6hqSHrsS5r0mtJ/Z8c3tgrm67VuRSXtoRg/764/dG6KAHmNTd18SK2B3XjT0URcfLLgr+SCb4NyxMTgoXtHD/Va1ZOq8VSgSrJcnXtfM+Tqxiy+TOUwYQwBAXybnV6cC0Dgjn9ZLYKP7BJeHZZ6Z0EszUCe5TNL1fJXhd7tl2UtrbdtgPZ2XGd7FU14fK7WJHEoE/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33; Wed, 22 May
 2024 08:24:41 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::e903:99a6:10b7:304d]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::e903:99a6:10b7:304d%6])
 with mapi id 15.20.7472.044; Wed, 22 May 2024 08:24:41 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Claudiu Beznea
	<Claudiu.Beznea@microchip.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH v3 1/2] ASoC: dt-bindings: Add bindings for Cadence I2S-MC
 controller
Thread-Topic: [PATCH v3 1/2] ASoC: dt-bindings: Add bindings for Cadence
 I2S-MC controller
Thread-Index: AQHaoRXv+B83yeIjJkupTIWZ+xjDObGM+lQAgBX3ToCAAAj/kA==
Date: Wed, 22 May 2024 08:24:40 +0000
Message-ID: 
 <NTZPR01MB09560302DD3BFCEF35E77DC49FEB2@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20240508070406.286159-1-xingyu.wu@starfivetech.com>
 <20240508070406.286159-2-xingyu.wu@starfivetech.com>
 <0e7496c4-7dfc-404d-944c-a1869389722b@linaro.org>
 <af72c0c1-144d-4f04-86ba-d85e5125d261@linaro.org>
In-Reply-To: <af72c0c1-144d-4f04-86ba-d85e5125d261@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB0986:EE_
x-ms-office365-filtering-correlation-id: c4d6706b-75e3-430a-4661-08dc7a38a088
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tecL13YynBWK+S0lexGzu19qU94T4HpHLbdpJXWLGi9EE5gNe+vpZYioTe1I4uxdD8s7aSCemP81GvLVzuizdC+k2z2pbiWJiVFecIt3hFTtIwidTYDYjTLqbIjqcOi3O9y+zcKH2xEqTyKHbyXHv4PlSLY0vngHnERrsQqNPeGxaqrwECkP6/YKJSHg4ENS+xX5knM2nzor/EhgsW2IAonlrPYOiJ301Q3QmfG4uUQ9nctWlySyGkN5w+9GLXyymBpSqcafmuJdWXEzOShid5cU7+cZ0zIn3nMbDwR22Y+NEDxJ39bY3l5TU+vLUl55nYDbQ1piqvWSnsbmAcb9TzZUOOWlShmya2vpNt4urnAGgBYlao2ydJdUnTT7VzSz1oP1u9RPWo1MfBeYz1cdbeqTisfi2rvnQQX4aomyCk9jA5CY4DIMY3jd8/P6EV8Z9BGlsax1GcQtnkIor79+GjW0BDRr9XVcOAtI4akmlEM2VPhwxqlz3BunKK4Cs27U3M728Q9KQCexKsg/5o7R11eUkc9n5B9bK4bYZFMVll0DG0/IV5YlF88eLQ6un/yCAEvCRxg/n9CIn4eb3hQgHS8JH4bbs6zYduNleYZQ+MnU7PXlGjRnTFhFE1lJrUuF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(41320700004)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OHBaWE5tKzBaZUM0OGlFWitHU3ZGTTNJMmRmOWtkNzVrVXNjNldhL1ovUnNX?=
 =?utf-8?B?cU9kRGRod25pY0RkSVJUN3BFK2p4VGxPbGxFbVpkTW9haVhkV3cwbklYaVBh?=
 =?utf-8?B?RjJ3bDVvMG9SN0piV3RQK2U3OXA2NWE2V1gxRFREa3VSNlZPSlBZaDFQekt0?=
 =?utf-8?B?ZDZZZHpiSFlSYU44M3VxRU1reUlZaGN1TnM1QXhOVGFBMnhra3VPV21nb0g0?=
 =?utf-8?B?dVpNYkJCMkVVZkc5WmFKaVM2ODR5M0dkdkZ2UEhpNmUvOFdUc3lzay9pVVNB?=
 =?utf-8?B?ZmFaeG5pWTByQVZJK1d5cGlza1ZnNmFhc3lSSXBsNCt4bXA3M3g4aWlWYmxY?=
 =?utf-8?B?a2NhSUoybWxaRUJjMVlXeGpHbGU0MVRkcWFQMDRSK3NEMENCTjNKNGtHbnNH?=
 =?utf-8?B?UGtBYUxMZS9nU0NhMXhIdzlhck1JMXZkaEdWNE1UaUNaK3hBWW5JNXVReEkx?=
 =?utf-8?B?SXByUUdlaFN4b3QwNWFYTzZqekswMUpOT1ZaYlI3bzhqQ3JIWlNxNTdvampq?=
 =?utf-8?B?WlZZaG9kT0tWdCtJU3pmd1FkbnBHYUhBMWh1bndMNUNFMmk1Q2FnWWQ1ZkJG?=
 =?utf-8?B?STd3OHk4em5pRDRqaENJZ3htUEpyN2t6SU15OEhINmpZQ1lYYmJjNUdxZXN2?=
 =?utf-8?B?a1ZncDlpb1Y4TEZpS1pDRDdXTkhsLzAvdnNsb0VKRndGTXJHak15SHBHTWRP?=
 =?utf-8?B?bUo3K3Y1NjBOazgwWkczbndhd3RhdGMxbWdyaTZ3UmZPK056MWxZbzdrS3FY?=
 =?utf-8?B?WWF1K01YSW1ZMVltdGhoZGlEL2hqcTZPSEwwZU55YWR1YnZESDZFOFk1a0lB?=
 =?utf-8?B?Q2kweloyRFlQU3l4UTlNZEZUNUpqV1JnZU8rT0VZamUzSytiVGx3eGRnbEJh?=
 =?utf-8?B?dHBOL3lpcDRzSXdFWlMxRkNKRHJXc2RXT1ovbjZKTU9RSVFvdmxlcXZqMFdz?=
 =?utf-8?B?dElPdHFFYUZhcGJvek54NWliYjFWYTdNc3lXbUZqRUZOMHhKNkY1eG1yRG5B?=
 =?utf-8?B?d1JNQUhwLzVGKzNYbkhDcFRZSTk0OUtnTnlENlU4cnl3VzllMDZCc3VFdjZ4?=
 =?utf-8?B?TGgvTHBCNW5iSHpDdnRTbkVPNjFGR0hCQkRkcGpIQmFlYmU1WkpmZkRsWmh4?=
 =?utf-8?B?VDhrRklaZWdiL25IaHlnV2dJUXRrSDI5bGJlSW9aOTBKcERsYVV2ME04dS9z?=
 =?utf-8?B?cy9WdTk0RE53Rlp5Q01Xc3NWMFB0azlPU1hlZHRmK1V4aEZySGdxWC9IbHox?=
 =?utf-8?B?Q2p1VGNjeUZxSG8zTUdTbWE5YzkxdW4vNlV6b2xlaDZMTlJTT3VEbFlQdGNY?=
 =?utf-8?B?K1VhQXNKTkMyNWFQQjdmUm54SVgyKzNscjRzUWNDaW1ZRm14YnR0T0lnMmJ0?=
 =?utf-8?B?SjRUSFEzRldsTVpoUUU4WHl2Y0srUGkxaEtKLy96bmJtZnJ4L1FvSUx6Qytx?=
 =?utf-8?B?NWx6NjR6WUt5MENoMHV1eHl6MGZ1WWYrNVI4aUpVRlFWLzVaZUxFNUdrZ0pO?=
 =?utf-8?B?RlhObmtzcHlFRXpldUJIcmNyVlFTdmhrSk9ZV0lheEdBTmNMMTQxZFhtU2k0?=
 =?utf-8?B?TVd5WXVHUUhodWF6cHptdU1iMVdJcnJ5K2diM0J4S21CbGpIVjYzMFBDVVIv?=
 =?utf-8?B?YzNNTjFrcXdkSHpVWDZ2Y2pveC9xcFl6b0ZVT1VJZ1Q3RzV0cGRxb1p3WXhR?=
 =?utf-8?B?dGlTUG5uRTlWMndXUVlQMHE2TWVDUVR0ZUVDMUEyVzZRNGY5NnZYUS80bG45?=
 =?utf-8?B?czFWdmc2MHQyN2dtSEFxOTRyVTNGYWRQMVlRRmQwWllFK1ZlakFscFk2Smxv?=
 =?utf-8?B?UVpDb2hRY1VYNDA4WGJQcjlRd3Y5aWpNQk9pNjJyK1ZEOS9SZHh6WFhvTFR2?=
 =?utf-8?B?WFlsbURXME9NSXNCYWkyUWZmVFNuTmF1R0V3d3ZvdllWTG9BTHh0bEZyNzJm?=
 =?utf-8?B?R1V0b0pnY0ZGNlRXTGJXd1VmeFpSM2pyYWRMU0tvbHFTNTdUVlp3UGN0OVY2?=
 =?utf-8?B?NDZWbWdpL3Y5bHhtUktsMmFpcFNZUElrcjdmZG5id250Z2lCZ29YZXdqRmx2?=
 =?utf-8?B?NWxVVThwZnZMLy8ySFphM1FBMkhGUENXL2Jtcm9qVW5MQ3VKcFN6ZnVLRjM2?=
 =?utf-8?Q?67D8frQwCT9w1eyD5Uo0P1E6b?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c4d6706b-75e3-430a-4661-08dc7a38a088
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 08:24:40.9657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ctWCocEFAQ/VRw6+Orexy0k5xq0XfevRM4X0nPwXIkWf8bR51jLs/jXezCHyZwpn7qzQVTxvQGvKPMbG85w6phgaK4Ijxxw9rfeJPbv84jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB0986
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GNHRFSWSU73PYKT75VFLSFQ3ZRZD5YBN
X-Message-ID-Hash: GNHRFSWSU73PYKT75VFLSFQ3ZRZD5YBN
X-Mailman-Approved-At: Fri, 24 May 2024 12:16:20 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXJYZ3NQWWW5GDFDO5WAIL2LT3W2K5WN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMjIvMDUvMjAyNCAxNTozMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gDQo+IE9u
IDA4LzA1LzIwMjQgMTA6MDMsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4gT24gMDgv
MDUvMjAyNCAwOTowNCwgWGluZ3l1IFd1IHdyb3RlOg0KPiA+PiBBZGQgYmluZGluZ3MgZm9yIHRo
ZSBNdWx0aS1DaGFubmVsIEkyUyBjb250cm9sbGVyIG9mIENhZGVuY2UuDQo+ID4+DQo+ID4+IFRo
ZSBNdWx0aS1DaGFubmVsIEkyUyAoSTJTLU1DKSBpbXBsZW1lbnRzIGEgZnVuY3Rpb24gb2YgdGhl
IDgtY2hhbm5lbA0KPiA+PiBJMlMgYnVzIGludGVyZmFzY2UuIEVhY2ggY2hhbm5lbCBjYW4gYmVj
b21lIHJlY2VpdmVyIG9yIHRyYW5zbWl0dGVyLg0KPiA+PiBGb3VyIEkyUyBpbnN0YW5jZXMgYXJl
IHVzZWQgb24gdGhlIFN0YXJGaXZlDQo+ID4+IEpIODEwMCBTb0MuIE9uZSBpbnN0YW5jZSBvZiB0
aGVtIGlzIGxpbWl0ZWQgdG8gMiBjaGFubmVscywgdHdvDQo+ID4+IGluc3RhbmNlIGFyZSBsaW1p
dGVkIHRvIDQgY2hhbm5lbHMsIGFuZCB0aGUgb3RoZXIgb25lIGNhbiB1c2UgbW9zdCA4DQo+ID4+
IGNoYW5uZWxzLiBBZGQgYSB1bmlxdWUgcHJvcGVydHkgYWJvdXQgJ3N0YXJmaXZlLGkycy1tYXgt
Y2hhbm5lbHMnIHRvDQo+ID4+IGRpc3Rpbmd1aXNoIGVhY2ggaW5zdGFuY2UuDQo+ID4+DQo+ID4+
IFNpZ25lZC1vZmYtYnk6IFhpbmd5dSBXdSA8eGluZ3l1Lnd1QHN0YXJmaXZldGVjaC5jb20+DQo+
ID4NCj4gPg0KPiA+PiArDQo+ID4+ICsgIHN0YXJmaXZlLGkycy1tYXgtY2hhbm5lbHM6DQo+ID4+
ICsgICAgZGVzY3JpcHRpb246DQo+ID4+ICsgICAgICBOdW1iZXIgb2YgSTJTIG1heCBzdGVyZW8g
Y2hhbm5lbHMgc3VwcG9ydGVkIG9uIHRoZSBTdGFyRml2ZQ0KPiA+PiArICAgICAgSkg4MTAwIFNv
Qy4NCj4gPj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50
MzINCj4gPj4gKyAgICBlbnVtOiBbMiwgNCwgOF0NCj4gPj4gKw0KPiA+PiArYWxsT2Y6DQo+ID4+
ICsgIC0gJHJlZjogZGFpLWNvbW1vbi55YW1sIw0KPiA+PiArICAtIGlmOg0KPiA+PiArICAgICAg
cHJvcGVydGllczoNCj4gPj4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPj4gKyAgICAgICAgICBj
b250YWluczoNCj4gPj4gKyAgICAgICAgICAgIGNvbnN0OiBzdGFyZml2ZSxqaDgxMDAtaTJzDQo+
ID4+ICsgICAgdGhlbjoNCj4gPj4gKyAgICAgIHJlcXVpcmVkOg0KPiA+PiArICAgICAgICAtIHN0
YXJmaXZlLGkycy1tYXgtY2hhbm5lbHMNCj4gPj4gKyAgICBlbHNlOg0KPiA+PiArICAgICAgcHJv
cGVydGllczoNCj4gPj4gKyAgICAgICAgc3RhcmZpdmUsaTJzLW1heC1jaGFubmVsczogZmFsc2UN
Cj4gPj4gKw0KPiA+PiArcmVxdWlyZWQ6DQo+ID4NCj4gPiBJIGFza2VkIHRvIHB1dCBpdCBhZnRl
ciBwcm9wZXJ0aWVzOiBibG9jaywgbm90IGFmdGVyIGFsbE9mOi4gU2VlDQo+ID4gZXhhbXBsZS1z
Y2hlbWEgZm9yIHByZWZlcnJlZCBvcmRlci4gV2h5PyBCZWNhdXNlIHdlIGFyZSB1c2VkIHRvIGl0
IGFuZA0KPiA+IGl0IG1ha2VzIHJlYWRpbmcgdGhlIHNjaGVtYSBlYXNpZXIgZm9yIHVzLg0KPiA+
DQo+ID4gUmVzdCBsb29rcyBnb29kLCBzbyB3aXRoIHRoZSByZS1vcmRlcjoNCj4gPg0KPiA+IFJl
dmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFy
by5vcmc+DQo+IA0KPiBTaW5jZSB5b3UgZG8gbm90IHBsYW4gdG8gZml4IGl0IGFuZCBhbHJlYWR5
IHN0YXJ0ZWQgcGluZ2luZyBtYXJrLCBJIHJldHJhY3QgbXkNCj4gcmV2aWV3Lg0KPiANCj4gVW5y
ZXZpZXdlZC1ieS4NCj4gDQo+IEltcGxlbWVudCB0aGUgZmVlZGJhY2sgSSBhbHJlYWR5IGFza2Vk
IHlvdSBCRUZPUkUuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpTb3JyeSwg
SSB0aG91Z2h0IG15IHJlcGx5IGVtYWlsIHdlbnQgb3V0IGJ1dCBpdCBkaWRuJ3QuIEkgd2lsbCBy
ZS1vcmRlciBpdCBhbmQgcHV0DQp0aGUgcmVxdWlyZWQgYmVmb3JlIHRoZSBhbGxPZiBpbiB0aGUg
bmV4dCB2ZXJzaW9uLg0KDQpJIHRob3VnaHQgaXQgd291bGQgYmUgbmljZSB0byB1cGRhdGUgYm90
aCBiaW5kaW5ncyBhbmQgZHJpdmVyIHBhdGNoZXMgaW4gdGhlDQpuZXh0IHZlcnNpb24sIHNvIEkg
cGluZyBtYXJrLg0KDQpCZXN0IHJlZ2FyZHMsDQpYaW5neXUgV3UNCg==
