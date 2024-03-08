Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0FA877052
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:19:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83A6C227B;
	Sat,  9 Mar 2024 11:19:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83A6C227B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979583;
	bh=uTnPg7HziyY6lCsRX9Qrb/ljHh7Z+vgodnnWOYXji1A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I/FY1Dlb0IRoOsD7GzBhcCYTWAYkvCVVwzStKZ9I4Q8txJJNMxT8OED5fmFwtawmd
	 bcItWP0hNMosMaRN0iBH9uBCtqdteBsf63A/+FrGY+lI4TingNKehMvvmie6Nlf75T
	 dNBQk3b2gAvdHu8yQ/keCcgyNxGU2oSd8NDteFRE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1796CF805C9; Sat,  9 Mar 2024 11:13:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13ED0F89721;
	Sat,  9 Mar 2024 11:13:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96B61F8024E; Fri,  8 Mar 2024 09:46:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on20716.outbound.protection.partner.outlook.cn
 [IPv6:2406:e500:4440:2::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28287F80087
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 09:45:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28287F80087
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NK/UYuc+uemTBUo8bmd9gpAjR97rWZw65XgiKPUkvz0wjLHpDQ0/QnqUJ/Uyl0MEu2fHSDh8D/EcKnqqB8kaPAP/E229u3srtrw5gFlIjVtOJg/+SbF83sJ8m/NhIi2WsMZqhvEKcGavZAocctthA40CaQ1dqHDL1pSEe7YbYsZQfe0OoEI4YtlJC03oI8exuXhyJ6jWWzHAKrgQ3voSoyrGEg4+3CUcTOo01U6YN+1JemOw2fw23bQV+0qKkTsG2htciyXwMTp1VE+ycYv2/4Lm/tYO3PcQ/bDxzKWY/p+tYAygu12bYTIs5TNtzrjVbMq1HX/Z3mL8kxnQIsChBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTnPg7HziyY6lCsRX9Qrb/ljHh7Z+vgodnnWOYXji1A=;
 b=QIVMTN4yB/ZX28pSqVR1CGMG57Xt6JO+8W1EOxcgL3ORc8ILry78/hl+MWHblI4P8qx1xKbeMnZ3Q2i4LmF0TqmbOxVdNwDkU1PcIj9zGWDY6Ta6hZwMER+lM+CbRPOQQL+4pSNaBNASAC2WVyWcIhCh1CfmaANyh0bdSQyDNGAt610PsbV9dvxKQhu1cDeVBsGcrXXgP0C31vxu8wONTlbBKJUZ8MrRu12SOyBBZuOQ5ZnPE24kvZMLnUqZ38+qj4DDdDJ5qYoC/gghjfaUYDifrhNgXp3YNM8VjHEX+nVYdt/1++eoFO8nTz866+09VlNhkFlLGLWh6CRGR/pvAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1098.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Fri, 8 Mar
 2024 08:45:45 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::20e3:6cc0:b982:ae95]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::20e3:6cc0:b982:ae95%3])
 with mapi id 15.20.7316.039; Fri, 8 Mar 2024 08:45:45 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Walker Chen <walker.chen@starfivetech.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: 
 =?gb2312?B?u9i4tDogW1BBVENIIHYxIDIvMl0gQVNvQzogc3RhcmZpdmU6IEFkZCBQRE0g?=
 =?gb2312?Q?controller_support?=
Thread-Topic: [PATCH v1 2/2] ASoC: starfive: Add PDM controller support
Thread-Index: AQHacEDB2p29DpAx80qeYuosaSA+7LEsPAcAgAE+qoA=
Date: Fri, 8 Mar 2024 08:45:45 +0000
Message-ID: 
 <NTZPR01MB0956E2033EDDA3FFE1211ACD9F27A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20240307033708.139535-1-xingyu.wu@starfivetech.com>
 <20240307033708.139535-3-xingyu.wu@starfivetech.com>
 <fddca901-273c-4b06-ad59-d156941920d6@sirena.org.uk>
In-Reply-To: <fddca901-273c-4b06-ad59-d156941920d6@sirena.org.uk>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB1098:EE_
x-ms-office365-filtering-correlation-id: 86c62f65-0231-422d-f492-08dc3f4c2567
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 drIojJdrFmICsrZf5+3KdpjNSfS3YjEkIIWsfAc8Jy7ZtuMQRv+mWkTI3QihegAJ1hzQC0mKIW95zRnd7gPlbL2YPAyV2przTlggAdtWN7VxwnzI7tPo/FW+SDjgMNW/sxapc4AA5ozvs9JM/ClwNWXfQXTDzlyf8fvjSU7JXfEFg5cowFyCHT5siqdfO4xB5fAI+SP07e9UmU6mjvSdhNkMqzjfEDqS3NbcD/h3ch8QwUl2sciLdivQd/g5T37x9zAR29EvRaFz9H5lOpmhwDgjutv9C5086EQpH2NxaY7qruWnOjfYdt1Y9tMta5giRbABXpdc56VCrPpW3S/GiLEVeOaD05DHzCR0ApTru2HIBDpW08fSQNK4FEmhdhEOXhQICYm8NkRWEFK5VQifDIpciGhFVrC/tH0FWa6rtoNYyTyHViI6Y4VUcUQStVuOPhNOXgmdLsqSV+L4NjNwrGh8LHLQkSzAuFYS5aZwQcNnPaLUjZNeaRxLZEIflJtJd2scrcib8Oo9/JRHMJIrde+ZpQnCAcu0ZJHWUcTJb14YLIDKp5QbRpcwJjium+q98WzenaIJHUM/SU6D6Y7lVo01+g33XbQ/kXL3Uxvn79Eh0QlSvuy8Wh//C5uwdlTa
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?YklnTk1hbytZMTVWdUlZcGdGME1qUEJlMWpmMDlHT0N1dHY2MFJqV2x3SUpz?=
 =?gb2312?B?RnRtSGNPc3dhWTdOaEQ3dEhHZHpKSnlabE1ISVVPUnoybDZpZGJ0bWdWZjR3?=
 =?gb2312?B?RHlkYVhHZW5xYytDRjIxNm42MUl0cWxlaXZ4Y3ZlekJQdEp6RVFvR3BBdEp5?=
 =?gb2312?B?UmV0cXFEZGN2K1VVaTFpb3BzWUdTUnRvYnN3RE5JNFRpeEMzdTkvbGlTQndH?=
 =?gb2312?B?SnFuaTFmMnF3MTcrMitWa2ZtdWtlR2s3Qy9kYWRDTHM3dWhxR3ZuNjNKTHNy?=
 =?gb2312?B?d3NJbm1ud1ZCL2JqWnpuUGxBbitVT2h5MTFZMnZWWCtBNnkrcW1SMVZoajl0?=
 =?gb2312?B?NG9PbjNFWmtDM0ZtYWZZbWFYSStEYjMzWXdpOG5FdElKcm45OE5IV04xd015?=
 =?gb2312?B?MzJTRjdLK1pDMVRSYUFqQmxlN2ZEVWFtNkZaMWc1YlhndWZFSkdMa1lZMVo4?=
 =?gb2312?B?ZnRzTy81amJlZzFXelp2ME9WNWdaeVRJQVc4c05OSVQxd3k1QzBjYlVxQVRQ?=
 =?gb2312?B?VU9WK3R6R2NVTmFobTFlQkNuMlViNVQ0YU51a2JuTTRjYWVUUnFvdjVXeFkz?=
 =?gb2312?B?U0xSYzhGenZ5SnN2MldNOEttVGxVZGc3WVpuazVNRXk1Vy9qWVg5amVZcVd0?=
 =?gb2312?B?dHZ4bUNYaGZGZzVJbGpNV0sxNmV3YTNaM21QeFh3cVlyb0JZSGd3bGU5YUpF?=
 =?gb2312?B?TDVZc052UEs1cFRYRHRZd0k3a3Z1Nko0eVpiLzJkdmpiRkI0NDNEbE1IeXd5?=
 =?gb2312?B?TnNvZzFPK0RtdlZxSm84T3lyRThtNmQrTTZ1VDc0ekxUend3cS9SbnY0T25V?=
 =?gb2312?B?RE52c0ZheWlZVWRIZUcvVVBwbGZhTEtJa3EwQ1RwLzZxQ1gvL3N1c2xXbUJi?=
 =?gb2312?B?aitzZklVSjNHV2VTeVh2QzdPWDNpOGl1V1pnWll4bzRKSmhVcWZrQTlEd01W?=
 =?gb2312?B?SjBCZnp3cFU3U2o1Ny95djhqSDJMRW9OeURpSlJyZ2VDaU5BdHgyRENxV05H?=
 =?gb2312?B?cWx3Syt4YVFlaHBtTWdITGt5K0k0Ymt5VlVYT2xWTVM1dDRucGJyWWNIS1Zq?=
 =?gb2312?B?emdkc3F2ZCtLS1RtZVVkWis0SzdlUFRvUEpZbWJka1ZGWGYxWVJLZEMyS3Zu?=
 =?gb2312?B?Sk9mSjhOMjNaeHRpbXFKNzZyS0NRc2pLRWRpak4wZ2lhMGlFeVdoVUlsVU9j?=
 =?gb2312?B?VFM0Mkxjb01ubDdUbHJvL0xmTzdleEtkK2RsTnJQSU1FeTJ4Tlk3QjZ4aGVF?=
 =?gb2312?B?K0tTQm5HUjFQVkRLZ1RoNGdZL3MzUVhJWk44cStBeTl6dUZQME1LanRORHJ2?=
 =?gb2312?B?YVVpdXZZVzE0NDRnQ2ludW1Bd1JYbjdUSE0xcHJnM0d3Nm9ETldWR3ZjSk5i?=
 =?gb2312?B?eXF5TGlSVnM1ZXFTd2RTZ3VyYTk0WFgweU5hSFdNa2huR0F5Tm1SMW9QVFA2?=
 =?gb2312?B?ZHRYOENWK3MrMmFhaDJLT3ZyaUwwa01SWk9HRTNXaDQzd1VWSkV6cDE1MUVM?=
 =?gb2312?B?TWV4VnFWcUpmR2ZtUmFsWVBGR1RxYUlsN3lNWng3ZDlvSFZEMUs3NEJhUlpX?=
 =?gb2312?B?aDRZWGdFb2FjelpXRFZRNHYxK3VVek9FNEhrVTROR1JpM2QvMFNmYjNod3lX?=
 =?gb2312?B?U2pYUkkzcWx5N0swbnNDZ3JSMkdGc3BrT2VFSS9tODQ5MXU1WjA0S2czTjli?=
 =?gb2312?B?eTJEcnVielIyUW93V3RYajB6Ly9qWnhjMFQzYkp2T1hHbmd2RnZyQk9lZHFj?=
 =?gb2312?B?cWx3SStQVEdaQVc4RHkrRzFkOWwrVTdXeTFHb0JmVFlORTFHVHFTR0xLbnNq?=
 =?gb2312?B?Y29DbGhMbC81S0kzcUNSYkszblJWWTN3MnBUYytZc2JaTzYzaWZ5UDVkWEp4?=
 =?gb2312?B?S2N2ZGU2YllGNGNFbTVFSHNyOWZTbUFnU2FaVjQyejkvMXZRVjhZZE5SUXVM?=
 =?gb2312?B?aS9hYjllam9kWXprZFRmRVVsZHpVUHlSeGpTeWk1NG1IcDhJbFVianVKRnFJ?=
 =?gb2312?B?VlN1VlBlMXE4NWNDcUZ4TkphQWlMTVZOM3JKeEp1OTB6ejdzT1ZEQk9tZmdE?=
 =?gb2312?B?ck96QWpiRTFHdU9JeHZmNmRnZjVaM1R4aThwYmJtbzhrRkdIZTdqRTFORGJD?=
 =?gb2312?Q?f17uBZ5FS94zZGG3FL/2msK+p?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 86c62f65-0231-422d-f492-08dc3f4c2567
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 08:45:45.6907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 HLbpAydptNoA9FoGa7NhENYCziiJiBqYKnWcrrHyXENcpWgA6DFP+G39Z9nobpbeNkgzmYpAjD87sxdO3kxVy4WJris6zCKbbOId9gMz7MA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1098
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: F3CDNPTRGIH7UIGNAMSM4QYQEXOBGYF5
X-Message-ID-Hash: F3CDNPTRGIH7UIGNAMSM4QYQEXOBGYF5
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:12:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H324A6TAOQT4YL52PHX773FL5635RRQR/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiANCj4gT24gVGh1LCBNYXIgMDcsIDIwMjQgYXQgMTE6Mzc6MDhBTSArMDgwMCwgWGluZ3l1IFd1
IHdyb3RlOg0KPiANCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3IGpo
ODEwMF9wZG1fc25kX2NvbnRyb2xzW10gPSB7DQo+ID4gKwlTT0NfU0lOR0xFKCJEQyBjb21wZW5z
YXRpb24gQ29udHJvbCIsIEpIODEwMF9QRE1fRE1JQ19DVFJMMCwgMzAsDQo+IDEsIDApLA0KPiA+
ICsJU09DX1NJTkdMRSgiSGlnaCBQYXNzIEZpbHRlciBDb250cm9sIiwgSkg4MTAwX1BETV9ETUlD
X0NUUkwwLCAyOCwgMSwNCj4gMCksDQo+ID4gKwlTT0NfU0lOR0xFKCJMZWZ0IENoYW5uZWwgVm9s
dW1lIENvbnRyb2wiLCBKSDgxMDBfUERNX0RNSUNfQ1RSTDAsDQo+IDIzLCAxLCAwKSwNCj4gPiAr
CVNPQ19TSU5HTEUoIlJpZ2h0IENoYW5uZWwgVm9sdW1lIENvbnRyb2wiLCBKSDgxMDBfUERNX0RN
SUNfQ1RSTDAsDQo+IDIyLCAxLCAwKSwNCj4gPiArCVNPQ19TSU5HTEVfVExWKCJWb2x1bWUiLCBK
SDgxMDBfUERNX0RNSUNfQ1RSTDAsIDE2LCAweDNGLCAxLA0KPiB2b2x1bWVfdGx2KSwNCj4gPiAr
CVNPQ19TSU5HTEUoIkRhdGEgTVNCIFNoaWZ0IiwgSkg4MTAwX1BETV9ETUlDX0NUUkwwLCAxLCA3
LCAwKSwNCj4gPiArCVNPQ19TSU5HTEUoIlNDQUxFIiwgSkg4MTAwX1BETV9EQ19TQ0FMRTAsIDAs
IDB4M0YsIDApLA0KPiA+ICsJU09DX1NJTkdMRSgiREMgb2Zmc2V0IiwgSkg4MTAwX1BETV9EQ19T
Q0FMRTAsIDgsIDB4RkZGRkYsIDApLCB9Ow0KPiANCj4gU2ltcGxlIG9uL29mZiBzd2l0Y2hlcyBz
aG91bGQgaGF2ZSBuYW1lcyBlbmRpbmcgaW4gU3dpdGNoLCB2b2x1bWVzIHNob3VsZCBlbmQNCj4g
aW4gVm9sdW1lIGFzIHBlciBjb250cm9sLW5hbWVzLnJzdC4gIFBsZWFzZSBmb3IgdGhlIG5leHQg
dmVyc2lvbiB5b3UgcG9zdCBzaG93DQo+IHRoZSBvdXRwdXQgb2YgcnVubmluZyBtaXhlci10ZXN0
IG9uIGEgc3lzdGVtIHdpdGggdGhpcyBkZXZpY2UsIGl0IHdpbGwgaWRlbnRpZnkNCj4gdGhlc2Ug
YW5kIG90aGVyIGlzc3Vlcy4NCg0KV2lsbCBmaXguIFRoYW5rcy4NCg0KPiANCj4gPiArc3RhdGlj
IGludCBqaDgxMDBfcGRtX2NvbXBvbmVudF9wcm9iZShzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQN
Cj4gPiArKmNvbXBvbmVudCkgew0KPiA+ICsJc3RydWN0IGpoODEwMF9wZG1fcHJpdiAqcHJpdiA9
DQo+ID4gK3NuZF9zb2NfY29tcG9uZW50X2dldF9kcnZkYXRhKGNvbXBvbmVudCk7DQo+ID4gKw0K
PiA+ICsJc25kX3NvY19jb21wb25lbnRfaW5pdF9yZWdtYXAoY29tcG9uZW50LCBwcml2LT5yZWdt
YXApOw0KPiA+ICsJc25kX3NvY19hZGRfY29tcG9uZW50X2NvbnRyb2xzKGNvbXBvbmVudCwgamg4
MTAwX3BkbV9zbmRfY29udHJvbHMsDQo+ID4gKwkJCQkgICAgICAgQVJSQVlfU0laRShqaDgxMDBf
cGRtX3NuZF9jb250cm9scykpOw0KPiANCj4gWW91IGNhbiBqdXN0IHNwZWNpZnkgdGhlIGNvbnRy
b2xzIGluIHRoZSBzbmRfc29jX2NvbXBvZW5lbnRfZHJpdmVyLg0KDQpJdCBzZWVtIHRvIGJlIG1v
cmUgY29udmVuaWVudC4gTm90ZWQuDQoNCj4gDQo+ID4gKyNpZmRlZiBDT05GSUdfUE0NCj4gPiAr
c3RhdGljIGludCBqaDgxMDBfcGRtX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp
IHsNCj4gPiArCXN0cnVjdCBqaDgxMDBfcGRtX3ByaXYgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsNCj4gPiArDQo+ID4gKwljbGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+aWNnX2Nsayk7
DQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBqaDgxMDBf
cGRtX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikgew0KPiA+ICsJc3RydWN0IGpo
ODEwMF9wZG1fcHJpdiAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ICsNCj4gPiAr
CXJldHVybiBqaDgxMDBfcGRtX2NyZ19lbmFibGUocHJpdik7DQo+ID4gK30NCj4gPiArI2VuZGlm
DQo+IA0KPiBJdCdzIHdlaXJkIHRoYXQgdGhlIHJ1bnRpbWUgc3VzcGVuZCBhbmQgcmVzdW1lIGFy
ZSBub3Qgc3ltbWV0cmljIC0gd2h5IGRvIHdlDQo+IG5lZWQgdG8gYnJpbmcgdGhlIGRldmljZSBv
dXQgb2YgcmVzZXQgYnV0IG5vdCBwdXQgaXQgaW50byByZXNldD8NCg0KSSB3aWxsIGFkZCB0aGUg
cmVzZXQgd2hlbiBzdXNwZW5kLg0KDQo+IA0KPiA+ICsJaWYgKCFkZXZpY2VfcHJvcGVydHlfcmVh
ZF91OCgmcGRldi0+ZGV2LCAic3RhcmZpdmUscGRtLW1vZHVsZXgiLA0KPiAmdXNpbmdfbW9kdWxl
eCkpDQo+ID4gKwkJaWYgKHVzaW5nX21vZHVsZXggPT0gMSkNCj4gPiArCQkJYmFzZSArPSBKSDgx
MDBfUERNX01PRFVMRVhfU0hJRlQ7IC8qIFVzZSBtb2R1bGUgMSAqLw0KPiANCj4gVGhpcyByZWFs
bHkgbG9va3MgbGlrZSB5b3UndmUgZ290IG9uZSBoYXJkd2FyZSBibG9jayB3aXRoIHR3byBkZXZp
Y2VzIGluIGl0LCBlaXRoZXINCj4gdGhlIGFkZHJlc3MgcmFuZ2VzIHJlZ2lzdGVyZWQgZm9yIHRo
ZSBkZXZpY2VzIGluIERUIHNob3VsZCBiZSBzZXBhcmF0ZSBhbmQgeW91DQo+IHNob3VsZG4ndCBu
ZWVkIHRoaXMgcHJvcGVydHkgb3IgeW91IHNob3VsZCBoYXZlIG9uZSBjb21wb25lbnQgcmVnaXN0
ZXJpbmcgYm90aA0KPiBQRE0gaW50ZXJmYWNlcy4NCg0KWWVhaCwgVGhleSBsaWtlIHR3byBpbmRl
cGVuZGVudCBkZXZpY2UgYW5kIGhhdmUgZGlmZmVyZW50IHJlZ2lzdGVyIHRvIGNvbmZpZ3VyZSwg
YnV0IGp1c3QgdXNlIHRoZSBzYW1lIGNsb2NrcyBhbmQgcmVzZXRzLg0KRHVlIHRvIHRoZSBzYW1w
bGUgcmF0ZSBkZXBlbmQgb24gdGhlIHNoYXJlIGNsb2NrcywgdGhleSBzaG91bGQgYmUgcmVnaXN0
ZXJlZCB0b2dldGhlciBhcyBhIDQtY2hhbm5lbCBjYXB0dXJlIGRldmljZSAocmFyZWx5IHVzZWQp
LCBvciBqdXN0IG9uZSBvZiB0aGVtIGNhbiBiZSByZWdpc3RlcmVkIHNlcGFyYXRlbHkgYXMgYSAy
LWNoYW5uZWwgZGV2aWNlLg0KQlRXLCBjYW4gSSB1c2UgdGhlIDB4MTIyNTAwMDAgYWJvdXQgdGhl
IHByb3BlcnR5IG9mIHJlZyBmb3IgZGV2aWNlIDAgb3IgMHgxMjI1MDAxMCBmb3IgZGV2aWNlIDEg
dG8gY2hvb3NlIHdoaWNoIGRldmljZSB0byBiZSB1c2VkIGluIERUPw0KDQpCZXN0IHJlZ2FyZHMs
DQpYaW5neXUgV3UNCg==
