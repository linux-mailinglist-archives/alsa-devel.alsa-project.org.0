Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3939747AF
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 03:16:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57B13836;
	Wed, 11 Sep 2024 03:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57B13836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726017411;
	bh=4nWEyJw/UIDa1wKjvT/+rECcV6nZJu33XBDbe+y3Jho=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pk/cZBntJ/VrWlY+89QcSONqTLpIjXCPhSnvLDKBNIbwkVCibWTPYQUlCXd6fX8Zz
	 ph79+oaMvD1XhGygCietWRfQSViW05bC5jraaU7McM7NnGFR4d6fnHYQKhaMcT6B/7
	 b5rrOoxjb5BEg13MyUcuNI7iBA0PvBzpZo+EBaKo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92B7CF805A1; Wed, 11 Sep 2024 03:16:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6CE8F805B0;
	Wed, 11 Sep 2024 03:16:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 138EFF801F5; Wed, 11 Sep 2024 03:16:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from SE2P216CU007.outbound.protection.outlook.com
 (mail-koreacentralazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c40f::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10F7EF80107
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 03:16:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10F7EF80107
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sa6mVVeMdzH9y42FrxF4xNIXhrWCeHmrECflF0FMBfdJUNeVg7LQMXx/rhwi1TlMw8gWRXBvHrMKRqAMXDGswbHi/MwkQVAd0UwWFhdxVEnqd92GkXbmw+v8s4ZsAKHF2eZOw+VlBggkgTtuPNAPrulEfkW/uTIgURo6pL5FtbB9BlBPkTYAh7exHCvQwdMvLto7QoUYShgQibGb+Dk0LGWTnQsDtXHFxDSWktbqsczULADJJW3IdV46GzKlndKFtOXkhbZJZXd8EI22rnqs2Eh2kgdpCtQw2xXcN9ei4b9uKT6X4sKt9vVSDs2emftwB8aL/sEGfh+aSL5nyxQt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nWEyJw/UIDa1wKjvT/+rECcV6nZJu33XBDbe+y3Jho=;
 b=nmjCLK0EiCoavklTW6bNuF48vCfNda6NWV7vZQdxRPVhEF2GoN85kXuflF/w452XmlTj0pb8y5RzMzUZzCMtP92TmlorbaEbnInHDJnDbXmP8CqbSZgxEz1xJQvHur3q81eseQeK0Gf3C/xissKaPpB6V2CZQuJElhPIn5/2Ez+Ix4Gcn0hgh0RiRDT7ErYEepsYE6fQEdnsntLhUAm+tD+dBjAVZoW7sEtkyxnz6fAgrEoUor2arCpw41aGOuqfPCrK8viDrAANYfkm3hcKKRcJmmV8TN8JCcdfqql/XaFa4ngAuPIZwOjRGw2VoPt4DKqkcumMqEE/3kcgImffUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SE1P216MB2348.KORP216.PROD.OUTLOOK.COM (2603:1096:101:160::12)
 by PUYP216MB3110.KORP216.PROD.OUTLOOK.COM (2603:1096:301:151::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Wed, 11 Sep
 2024 01:16:01 +0000
Received: from SE1P216MB2348.KORP216.PROD.OUTLOOK.COM
 ([fe80::49d6:82d:3e2d:7e81]) by SE1P216MB2348.KORP216.PROD.OUTLOOK.COM
 ([fe80::49d6:82d:3e2d:7e81%7]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 01:16:01 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: FW: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add initial
 DT binding
Thread-Topic: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT binding
Thread-Index: 
 AQHa/cRmlR7aKhMVCUyKAPBkIGiSDLJFn0aAgAAeskCAAAR6AIAAA6GQgAAB4ACADAlEwA==
Date: Wed, 11 Sep 2024 01:16:01 +0000
Message-ID: 
 <SE1P216MB2348C5726B70913B57D8C67C8C9B2@SE1P216MB2348.KORP216.PROD.OUTLOOK.COM>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-3-kiseok.jo@irondevice.com>
 <afb4bwvowfjjrkdh63wx7afz3gyydz7tpuhz2i6g6ahubat3vy@7t5vciiv2yp7>
 <SL2P216MB2337D3255ABE335E9AE8CB378C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <db829bd7-e26b-44ed-b813-c1ccfd30c687@kernel.org>
 <SL2P216MB23374DF15DDE8A31486427068C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <42c43114-75ce-4946-9f70-aac3cb0c1b2b@kernel.org>
In-Reply-To: <42c43114-75ce-4946-9f70-aac3cb0c1b2b@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB2348:EE_|PUYP216MB3110:EE_
x-ms-office365-filtering-correlation-id: ef876f9f-e463-4607-035d-08dcd1ff4ce5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eGJvbHlMcDl4UDZsTXFuS2NOczUzSUNUSXZGLzJ0Q0lyUVo1OTdaT084TkFx?=
 =?utf-8?B?ZHNVSkRNTmVmdXdLZzhoYzRUYnUxaXd4YnhaR0Y0dGxVQURLVlRKVi82bC93?=
 =?utf-8?B?N1VGTytTSDJRazJDWjR1NkpaN2pGN1Ayemtsak9BYUphTlB2WFd1bkREd0tk?=
 =?utf-8?B?L3F2d20zTVFHZzk0UkRVQzlrQXBDbmxWNUF4Q0ZVSDY0MFFzZndxc0VndlhG?=
 =?utf-8?B?STNiNUFoMlhDUkFCZmxubjhTc0tmbFg4ZEFacEMyWit2bnQzaVVJWU5CSENp?=
 =?utf-8?B?eXJjUlFYSVg2MGpDbWdGbVFsTFNxUlMrcnl0ZGphNEZyNm1PMjFkTFpFaU1K?=
 =?utf-8?B?ZGdmb3ZadDN1d1B5R0J1UUI0TkZxVUxHUGF1cUlUSmUyVFJCeFJNQmt6U3Jm?=
 =?utf-8?B?dUVBQWxvbThMN29ZM2dvcTN5UE5vL0k2NTVjZUdweWNzVkJBTzlOZXl2Q01Q?=
 =?utf-8?B?d0RzYnNzR3BmQTRoV2MzajYwZ1dDWjdRZWh5b2ZiRFBUM1BRakNIQlZsUFhF?=
 =?utf-8?B?eWM0WG9WUVJHcDlYc3JCMmpScVA5QnM0WjhGUHlJVnU4MEh1cy9jREQxRy9m?=
 =?utf-8?B?MTBrcHNsZVAvUEwrZmpoSXBBeXMzeHkxVkdYMWNXeGNCN05WNzNYRmpNeTl1?=
 =?utf-8?B?aHlVREJ2QzRYdG5IblFmTXpFNTlBVFBYTFpBS3hTYzVQV1huaitlQmJFeEd2?=
 =?utf-8?B?dkdsbkNxRWpiQmxYRC84cW9vV3Q3c3BDOWJ2S3U2TDJySXYzY3VDc0Vwb0JW?=
 =?utf-8?B?bDlrOXp4cGJXaVR5MVkvbEl1eGxTMFBmU3BEVXRNd3lQb0EzTmRxRU5qUnph?=
 =?utf-8?B?SUNCNk5OWlJ4QTIrdmVXKysxQkFHK29CdW9odUNsRDFKbUpyNHJvaGU1MndK?=
 =?utf-8?B?MDZ4ZGtBa2dhQ0xtblZYbmlrU1h4Tm96SmllTHJyRG9HQ3FSSndoTXpvRjF4?=
 =?utf-8?B?QXVnS2ROMk1TNEhuSzVEcWJXdy9tTndTVmMyM1NaWU9KVFBOMExEbCtLU1o4?=
 =?utf-8?B?RnpORjU3bzVDaUNPTUtQNk9YWVc1SHYvYTRoYmpubjNQaG1aNCs0V09mS2Mr?=
 =?utf-8?B?YmNNRWxDRzFLdDhmd3R4c3JoY21ERGY4SDdKcHNybFdTQWZnVHlOZ2s5ZmFn?=
 =?utf-8?B?ZFEvMngrOW90SHFUeHNIWmFRcWZZOE1VdVNudkpCSHNyc2ZrSjVwRUg5SHFN?=
 =?utf-8?B?TUVzQ3NzcUtWNlUxcVl1dnhHeHZONTRnb0liRFJaQzI1WEE4d0lrT05rNEpF?=
 =?utf-8?B?M3lDSXRqeVlEY1YwSGZoQ1lPQTY1K0VmdDlMSCtFWEpzTnNnZTdFQnZQeXBN?=
 =?utf-8?B?ejM2bUJkSlN2WUNJd2ptUnJDdXpJeEhYdXU3NnpXeExOcnRaSVB1eXlHQUtp?=
 =?utf-8?B?NTJlcEFNRmFzYjZqdkdRS2JCeEc3Q3lsQ2dsOGo2akdsRER0MDRhSnNlOWNk?=
 =?utf-8?B?RGtHYkJaVU5OWjNGZm1Kekx3TFRhOE1Nd3Y0azNFUmNSaHNBWjdiOWJabG54?=
 =?utf-8?B?Z0dpRGJ0bm5vQjBRaWhTdWtBTWlmVzhpcDhyYnlzU2dsdTdBKzJrR3YxUjhn?=
 =?utf-8?B?QjVBcWd2Qzl3d29sMFd4bFJRdVdMVTd3eGNIN25TRzcxYmhXUHV4eG1HbGg1?=
 =?utf-8?B?K2VBRzhSVXgzR09xSGJLclZXenpXS1FFTkZUSDF3TWhtTzViTVdZd0tOMkpp?=
 =?utf-8?B?NGJyMHQ2OEtVM1prek5wQ0QvM3ZVWWo3bkRsVFg0SkhhcldmK3dRMFoyNEhQ?=
 =?utf-8?B?TjlJQVdxZ3h1ZzA1YXhFMlZMWG14MDJMNFo1RytWRm9aeTRnSFdua1VFTjJJ?=
 =?utf-8?B?bEo2NDhFaWpzckZZeVFTN3Vwc1lJSmszdW5vQ1h1bUFZTnJRdmtxUG9taEx4?=
 =?utf-8?B?ZStrWmRuL3F2QlI3aFFIS1A3RnBVZHJWa2RBWHliYjV1WlE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB2348.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Mm8yREdyUHZ5S1dXUEFnUTUvUHUwWVVpVXpTRXd6cHZRN2xtTFhacm91aWQ4?=
 =?utf-8?B?S0RNaE5vaUhXYWhVUlBKSHpTSmJLMUlKTHBlZ09mZWpRU3FWalhKZDF4WVAy?=
 =?utf-8?B?Y2NleE1kZDllQ1V3TVZBZTRNSDBpWTRjbW95bUVOUm10RWp1WjhrMTBpbDA1?=
 =?utf-8?B?d1ZXTzBaNEg2RVNER3QyekdIMHk0WUN5SFBLQ2dTdlo1SmEvTzd2V01lY2p5?=
 =?utf-8?B?bDZJTEthTDh3Tnd2UE5UeW1tQm4wSWxNdVpITlFQT25Za2RKcDR3ellnTWNj?=
 =?utf-8?B?K0Rpdk42dWJBZHI2Nlg5a3JQL1ltTEFLdzR5YithR2RvakZUOWw1ZW41WWN4?=
 =?utf-8?B?RVN1dndkRFl0dVNQT0ltbWR3N205VndLUC94aXRPdXhlUDRXU2VNV2xBQlQ0?=
 =?utf-8?B?QWUrRDZ2M21TQ2NMSXY0YmFPRU1tTk1WRGhDKzV4WHgzdytlS3JPZVNBM2w2?=
 =?utf-8?B?UVlHQ1BjZUJZVzFyK3ZMTlBqVElXb2c0TEtqclZNZEVyci9BdWlLcFZ4WWhH?=
 =?utf-8?B?SGdTOTRWcGUwdldOeFZKeVIrNzE2RDVxSGNmaUFicTdURlZPUGNxYk53aExG?=
 =?utf-8?B?QnVkWi9qd3BvQkJGYlJzajdXeGlTSndBUmtaSDQ2aWU3ZG8vUndjUzBZM2cv?=
 =?utf-8?B?Q1dyZ2N5UkR6Y1VtSjJzNGRhRDEwSFNZLzRVcHQvNTFGcWxtMmFUY0lrYWgr?=
 =?utf-8?B?bTZtNE5NdjFSZTFxekU5NmZjWWsyYmo0c3FUYVVRSFg1TG5RRmNFTDk3WGpp?=
 =?utf-8?B?R25xYVZ0TUpMVTN4YWNGN2REd2N4WVJUclFYWGR4eDF6UTArV0Q3Vk8vVFh5?=
 =?utf-8?B?NWhDWUJWTmJnZEgxMnFZVEJIUnVTbVlxQlNOSUZDcHlUeHlyaVR4dWNITDhI?=
 =?utf-8?B?RWJRNXFveXVGays3NmtUMXpYamdhYnErOENIZk1EclZUbUs5UitTUk1FeTZV?=
 =?utf-8?B?STByZE9qQklLNkpsRDdOTjRLZjBnWVd0M1dHdzI0a09naXZmWmQwVUVFelpt?=
 =?utf-8?B?VncyNjFOK1IyV0M5dkdRR1hwUWlQbjJrOW9pMzJacER1blBpOHE4Wng4KzNP?=
 =?utf-8?B?QVBOZnFqdkIvR0FieFU1Y2RueHpyaDFtYnBxbnVFd3VEeHg3VFNZWE1hTUpk?=
 =?utf-8?B?THF5UjhXbEI3MXZZTy9FWXZjQmxCaFRHSVdFT2I4Y3RkWjhMbzB2N0hhZEs1?=
 =?utf-8?B?YWp1VVY1dXQ1dmNSbnRRU01xRC9lZ3M0L21JY1pnYzk3bVlSZHJnNWRuWHNy?=
 =?utf-8?B?SWxkbVZONXl1aXh4SmFPK2JnMGdJYmdOZmdJdnFhNEhVS2hwaGhhZGF6R2do?=
 =?utf-8?B?eGI1MkNuWm9KdlpwTVZxN2tHeHZnK2VwV0xZWjFZa1lxVlBaaXFnZ281V1dL?=
 =?utf-8?B?OFI5RW1lTloyTFJQNTRDazFFYmNKS0xrVHdQVC9ZSTlVeWs4Wk5lSGlHYktt?=
 =?utf-8?B?UEZ4cXdJUVAzcmV4UVhlS2tOVThyWHFMRTBnc3ozVzk0OGJRT3NjR0h3b1cz?=
 =?utf-8?B?bGY1eUsyekcxdkY5QVVPZVpKUHhsbUgxM1hzbkQ1ZWNGcUsrak9KT1AzSTBv?=
 =?utf-8?B?Y1JnK1NTUnJrdHYzVVJaMDdub2FLZEdSeGx1dTlBRlE0TlYzSGhPWFhQZnpS?=
 =?utf-8?B?OTkvNzYwNGdjZzExSFFwcW1yNS9aeFJ6Q0NTYUphQ0VBNkZmSzlzSmhmVE81?=
 =?utf-8?B?LzBBU2FyelNheHZjcStsZHM2SzV3czg4WkZMM01FSFhWYzBZU1p2MW9USEtl?=
 =?utf-8?B?dmxEV0hIR0I3LzNwQ3hWQlBTZFhyblBEZlFTRWYyQzdjcjdacGFQR0dBTjIx?=
 =?utf-8?B?Z0xCZ1J5bU1DejJybnVtRWt2RzdHc1Z6R2RTQlRlSWsxVi8rYWN5MXd2bDFP?=
 =?utf-8?B?QjBlTG16dHdsdVJKejBOc3FLZ1RSY3NqWWpncFJpVGVLNFRKUFBwWTBLMHNE?=
 =?utf-8?B?Rll4RGdlMnRpeU84bXhuSWw3enZ4Y2dLMURKWnY2cDFnMGd6OXFBWjBjVWhp?=
 =?utf-8?B?RE9yUW5xWUljMU92TkR1bzhNT1VzMmVtOFFtdnIvSWFBcm52c3k4dkVlc2lW?=
 =?utf-8?B?WGhvaG9nUThZazNNVUhWOXJtbzVEL2pHK1RQdUJXY3NrSzVWbHRiZTI5Mzln?=
 =?utf-8?Q?HuhAY6agJLmsPDfTigBpkDzBm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB2348.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ef876f9f-e463-4607-035d-08dcd1ff4ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 01:16:01.6353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 VfzrkuBnFSrduug6BbRwzfwOSkqNZ1QuJS/f8QzXV7AxeQsH1vpkV8zppUTvxlkOHeJFTMu5aFUrHWDqkIuaB1GhSl/Po9V7ClovZo+BD9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB3110
Message-ID-Hash: NHMHHU5TCW6XLLCXX2OXXLCFPQQDZDK5
X-Message-ID-Hash: NHMHHU5TCW6XLLCXX2OXXLCFPQQDZDK5
X-MailFrom: kiseok.jo@irondevice.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5XUJZAM4NZ6GN4LYN7FWT7SWH2A5DOC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+DQo+ID4gSSBoYXZlIG5vIGludGVudGlvbiBvZiBvcHBvc2luZyB0aGUgY29udGVudC4gSSBh
bSBhc2tpbmcgYWdhaW4gYmVjYXVzZSBJDQo+IGRpZG4ndCByZWNlaXZlIGFueSB3YXJuaW5ncyB3
aGVuIEkgZGlkIHRoZSBmb2xsb3dpbmcsIGFuZCBJIHN1c3BlY3QgSSBtaWdodA0KPiBoYXZlIGRv
bmUgc29tZXRoaW5nIHdyb25nLg0KPiA+DQo+ID4NCj4gPiAuL3NjcmlwdHMvY2hlY2twYXRjaC5w
bA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9pcm9uZGV2aWNl
LHNtYTEzMDcueWFtbA0KPiA+DQo+ID4gdG90YWw6IDAgZXJyb3JzLCAwIHdhcm5pbmdzLCA1NCBs
aW5lcyBjaGVja2VkDQo+ID4NCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c291bmQvaXJvbmRldmljZSxzbWExMzA3LnlhbWwgaGFzIG5vDQo+IG9idmlvdXMgc3R5bGUgcHJv
YmxlbXMgYW5kIGlzIHJlYWR5IGZvciBzdWJtaXNzaW9uLg0KPiA+DQo+ID4gSSB3YXMgdW5kZXIg
dGhlIGltcHJlc3Npb24gdGhhdCB0aGlzIG9ubHkgYXBwbGllZCB0byBwYXRjaGVkIGZpbGVzIGFz
DQo+IGRlc2NyaWJlZCBhYm92ZS4gSXQgdHVybnMgb3V0IGl0IGNhbiBhbHNvIGJlIHVzZWQgd2l0
aCBwYXRjaCBmaWxlcy4gVGhhbmsgeW91DQo+IGZvciB0aGUgdXNlZnVsIGluZm9ybWF0aW9uIQ0K
PiA+DQo+IA0KPiBUaGF0J3Mgbm90IGhvdyB5b3UgcnVuIGNoZWNrcGF0Y2guIFlvdSBydW4gaXQg
b24gdGhlIHBhdGNoLiBQbGVhc2UgcmVhZA0KPiBzdWJtaXR0aW5nLXBhdGNoZXMgZG9jdW1lbnQu
IEl0IGV4cGxhaW5zIGV2ZXJ5dGhpbmcuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRv
Zg0KDQoNCkhpLA0KDQpJIGFtIGluIHRoZSBwcm9jZXNzIG9mIGNhcmVmdWxseSBpbmNvcnBvcmF0
aW5nIHlvdXIgZmVlZGJhY2sgYW5kIG1ha2luZyB0aGUgbmVjZXNzYXJ5IHJldmlzaW9ucy4NCg0K
TWF5IEkga2luZGx5IGFzayB5b3UgYSBxdWVzdGlvbiwgaWYgaXQncyBub3QgdG9vIG11Y2ggdHJv
dWJsZT8NCldoZW4gcnVubmluZyBjaGVja3BhdGNoLCB3aGF0IHdvdWxkIGJlIHRoZSBiZXN0IHdh
eSB0byBhZGRyZXNzIHRoZSBmb2xsb3dpbmcgd2FybmluZz8NCg0KV0FSTklORzogUHJlZmVyIGEg
bWF4aW11bSA3NSBjaGFycyBwZXIgbGluZSAocG9zc2libGUgdW53cmFwcGVkIGNvbW1pdCBkZXNj
cmlwdGlvbj8pDQojMjE6DQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb3VuZC9pcm9uZGV2aWNlLHNtYTEzMDcueWFtbA0KDQpJbiB0aGlzIGNh
c2UsIHdvdWxkIGl0IGJlIGJldHRlciBmb3IgbWUgdG8gYWRkIGEgbGluZSBicmVhayBpbiB0aGUg
cGF0Y2ggZmlsZSwgb3Igc2hvdWxkIEkgbGVhdmUgaXQgYXMgaXM/DQoNCg0KV0FSTklORzogYWRk
ZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0
aW5nPw0KIzY1Og0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCg0KSWYgdGhlIHdhcm5pbmcgaXMgYXBw
ZWFyaW5nIGJlY2F1c2UgaXQncyBhIG5ldyBmaWxlLCBpcyBpdCBzb21ldGhpbmcgdGhhdCBjYW4g
YmUgc2FmZWx5IGlnbm9yZWQsIG9yIHNob3VsZCBJIG1ha2UgY2hhbmdlcyB0byB0aGUgTUFJTlRB
SU5FUlMgZmlsZT8NCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrLiBJIGFtIGxlYXJuaW5n
IGEgbG90IG9mIG5ldyB0aGluZ3MhDQoNCkJlc3QgcmVnYXJkcywNCktpc2VvayBKbw0K
