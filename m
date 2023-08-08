Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9477B7738B2
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 09:43:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F372284A;
	Tue,  8 Aug 2023 09:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F372284A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691480585;
	bh=byZilevN1FXh7UO8d0fhP5p9wfCqnpUN6pICIWXSe/I=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TlledAKr3kTZ7wWYy6nJVr0I/LKfqnbKpwETC0d4wd1HispYWI3+2BK9LJDl+4J3O
	 WKnUrMjKZiX+FFBFlV5Vgv8KZ8EF9q6xI8NXejwFuBxen8YV9KK22LmrsusxQ5qJ3Y
	 wTpd/9oh7O3TcOnGdHs2Hj7YphQNjtfuAALYX15k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33DE1F80568; Tue,  8 Aug 2023 09:41:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E65EF80551;
	Tue,  8 Aug 2023 09:41:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AE40F80564; Tue,  8 Aug 2023 09:41:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C932FF80551
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 09:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C932FF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256
 header.s=selector2 header.b=XEElozRo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCBHAiwKn24fX/Hpp9e/O3DMeeTZj7rjbccclaGpleW2Z+eBcR0RSLmAO1P5CaDZKBq2sV5htHYfdPFAqX8hTUBmMP7+WXgFdZDaUaO75WmND9mU4PuVXz/+oQ6Hiv7vsKCxVoSkCU69+rqt6CLtv7GvHQ5J7YvVnY0b+iPTZss6MXagkFjFPsdtJsN+HaoPNhueAIfhok7IjntYnY2v7PPM1NtaDHFB83fiXFlS7kgdtX87dXXKEPw8VIJNZBJO9+gu6Ko5c3ptR7egCuBEOEn5TiaBwvDy+KTR22upiddcuO/8yGNu4sOCBOIKzlYVaJMDD3M77XaNsXbMnMqfTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byZilevN1FXh7UO8d0fhP5p9wfCqnpUN6pICIWXSe/I=;
 b=c4MGXwWiNieAt3n8nSKNvkTLkLS6apTyM3x1EA2/f/FOrhufso3F5WkgfqFckNHWG2teV6SyYd7Z5DXyU+5tksm6veDyqIXwN+rYcO46QeTHTLBumOPtLZcFjh47MxO6MIy9Qv1wEVX8Qbja5V+hiXnaspkZP/1xbIUtDlDeRhzF9yo2ahhSz8ZYuM3wuNQtNiJ+l3OUpOq+MoG+RanFVkaua5So9c7k6g/VPJPWynyygOLZN3CPx0Tp4kbuwY15zxrD/TXUbcKrM6lWO/leU4Mc/AJftXFKVHmTYx6q0rf1FJCTArXBXicrT/f9XvoXQZZzJIGNcnP42dcB8690nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byZilevN1FXh7UO8d0fhP5p9wfCqnpUN6pICIWXSe/I=;
 b=XEElozRonr/sE+O57xGirbaNjFd+odY/BMIrMqdvE+cD5fqZ51KnqKgkecezoU8b4hfTehMui4E/zNJnopG8yfdDlrbO+Gxo2x1ooHCO31pKJ/TkDZCejOOKwf4F1SYS2XRfnaVHZVly+rxQGV2gBB14AK/NAmsfsXzRwS6kz+ZrrAYEofg0zS2LDG/N0ZE/7lWXGo9l484OHyKecSBMZWo2TpSNNbJY1qoF2xa8jAeQ6aSZ70THvN6qXQKfB286E+7fLq6Wa/TQm0Mi3j/yKbwgw3seancyIVlvUnRMXCB/ljfNIrhRe8IxQL1OoBVbixQP+XD1RN/EQnQahFgKrw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2884.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:39::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 07:41:24 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 07:41:24 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
	<andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao
	<qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
	<shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap
	<rdunlap@infradead.org>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 03/28] soc: fsl: cpm1: qmc: Fix rx channel reset
Thread-Topic: [PATCH v2 03/28] soc: fsl: cpm1: qmc: Fix rx channel reset
Thread-Index: AQHZv9I9O5xUtbHSq0OF6ZBFjvVeFq/gF9EA
Date: Tue, 8 Aug 2023 07:41:24 +0000
Message-ID: <c57e888a-36b8-ab6d-e28a-a2d83dfc6788@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-4-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-4-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2884:EE_
x-ms-office365-filtering-correlation-id: c6227a1d-6f24-489d-8eea-08db97e2ddc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZXAHc5t8kl4Fp0jbqGaBYd0g1+jPzSAZtqmkXw/KoFOu47RoSHqbmFZSy+GyiSxlr8+KHoQaBkZ7oKhSYTDa144E3ULRA1ZcUSYW54V52JySBXuXQvqC3X2/SdLdZDrhMrH+JIkU+G3dEKLj5Ucvsk7U2jCjtV+hYtQwshWMUoWZXNIgG5RVjqrk/7vTKya+31ql1sODOJ4qGzP3wzMfYbUDSh7MhaOGehBmPls/trzpszXuWg/NZwJ3sdhA62gg9HRpRotVwwfIANR/u5G7Du7gxQWQxeyjP+RdJN11aGEj0XdqSqkGDzUHG3rMDUhU9GbM2hwjtDwEMqAzqhuymQGJHNOuK+2DM8K/MQFlazyjtwtwlYDkvAvfMatOqqZrvE6mK0UHXDGenv1Vx0m1stRH2GA414i8mxPRvhtNE6WwSYpmj7yLvLRZn3x9JkCdt1n6CfqQ8fbPegmxlZc/W/OO1VFSmjUPGPkov/bRDama/7H/yy6RE5pcdi4D0rHAV/6MhGMnuc5XJ9gfbxesfZ5ftwgySRwS9rpaXaOq/ReqvfGNFqUMrg2tPnxDMG1MhNpME2fIp+iuhAB0DiJYk/cUQnx9MXI2X0hzwowww+NJBH599hmmNArbKVKHorRNBGVskTwnIa20zGEq0P0b/46REURIGwrD1GMyLriLSkvLXua4jW9q4QvlOW27Y4MYqLYM6NKK68B7NdXYBuqmqep4w+HPjBwGkCQvPq9XW6L79W7Xl7TrpDTQ6y7TS5qaOLuCF1X+qpzuzrLvckbyiQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(39850400004)(396003)(376002)(90021799007)(1800799003)(186006)(451199021)(90011799007)(7416002)(7406005)(76116006)(66946007)(36756003)(66556008)(64756008)(66476007)(4326008)(91956017)(2906002)(478600001)(66446008)(44832011)(31686004)(8936002)(8676002)(31696002)(5660300002)(41300700001)(316002)(54906003)(110136005)(38070700005)(6486002)(921005)(71200400001)(38100700002)(122000001)(6512007)(6506007)(26005)(2616005)(86362001)(83380400001)(66574015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Zlprd2phQ3ZQWWp0eElWM1JDeDRVZXc3V0NjZTN6WkpsVkRqdFUwZzdLYnNK?=
 =?utf-8?B?WFVEOWtCMTAzbXNqQ0RzOThaZi9MRlVMUVpsK25uSCtxMWJsTWhSR2NZWHBv?=
 =?utf-8?B?dUpKbHhkODhzYWcwVXZRTEtNcVZYOW1YZGpkR0RZV2VGZVBUUkg4T2JVaTRV?=
 =?utf-8?B?MWVPMkJEekRSRG11K3ZUeEtUN1ZjMFREK3VuUkhxKzZPUndGa09UY0t6Ni9B?=
 =?utf-8?B?MkZFR01LSUtRaGZ3dXprRkwwdjZyMWNXQVRRamp2Um0zNjZRS29RWnhrb0V5?=
 =?utf-8?B?SGYwMmErNWxRZ3U2OGR5Vm4yUGs1OHV1R2QvWW5kazgxQmJLN0dnSHhHL3R5?=
 =?utf-8?B?eDl0cmxOMXlFaUJBSUo2UVIydU1BWjNEUWwxUWdlWDI5RW5sTW5iazl2Smla?=
 =?utf-8?B?alhuUGcwQm5PaU9LemtJQmcwWi9ER1B0L2FBNytKL2gxNWVRZEZXTFF5Wno2?=
 =?utf-8?B?S0F1c2F3TSs0UFhoSWMyNmkrRStCVExqc3FWckV0R0pXczBoRFQ2YjVLc3hi?=
 =?utf-8?B?Q3E1V1IvblVlNTVlZE9pWFNzQTUzQ2VJdVVmcHRxdjR6RWMyQ2dsa2EwNm40?=
 =?utf-8?B?R0dUWlhBNXNObFFmcllDaVhpVzNRTy9XSEp0UkFYYnVDTU13ZmV1WXZVZ0dH?=
 =?utf-8?B?MjdUbGJXa0pqOEE5ZnZIU3lxcGU1Um9YM3pJQzNxSHhVcFZOM1FPeXFWVzc2?=
 =?utf-8?B?eml6aTg2NmNMamlSOTI0WUJPd3FNYkwwUGFBNlVlU2dzV3NyMDE5RnZUbld5?=
 =?utf-8?B?emdEbEh5RERab0FNcVE4R3ZTSGZxY0Q2a1RoUktPenUwa1ZIWE9PclVacUVL?=
 =?utf-8?B?RkJIT2h3OE1RWklIWFcxYTNpWm40cVdka0pxNnpzTFVZUHJPdnVxQUU5dUZB?=
 =?utf-8?B?TXRSQ2hhbEk5ZTFMVUk4dUFVVXlPV2pXcDdMT0wrSDQ3NytsVXBGdDdvV0ky?=
 =?utf-8?B?MmhkU01wZkZhM3hObWNIb0ttM0RYYkF2dGREWFRodFg5VWFhKzgvWjBpdEpn?=
 =?utf-8?B?WmppQXlPQzhqTUJKeGh4cGdjaHJGLzY3bUNJODJLTUJCVExRUzcvVUx0VHlP?=
 =?utf-8?B?b2czbytiaVNaMmIzNkFjN1FrRUxhTXhYTUx0OE1zOElobThSRXh1WVRFNUhw?=
 =?utf-8?B?Wk5vckdTU0N3aGdmYzZ5eDcrK2p3dlZpdkE0L09mQ29XMjlhbE1ZaVVvRFBJ?=
 =?utf-8?B?VUNIanpJNjRLVHQwci95eGduNzQ5R1gxWmlKMkE3SnA5eWhmOUgwM0hRbksx?=
 =?utf-8?B?dkNpZzViOUVleTRhZTc0M1ZzM2l6OXpCbWZGNGlxWFRNcXFieHM4ODNnWjEy?=
 =?utf-8?B?bnhMQUVBeVlSbzkxR2ZZRzlVQ0Rra21jMkxteVQ5TlljYXFrQzJEN3lMeGI0?=
 =?utf-8?B?Zm43T3ZhTGwrOG9PMTUxazVzMU5haXBYUVJQQ1YvTDBNeDRiT0ZqYmhURjJz?=
 =?utf-8?B?YW1BUUNhMitGdjdOR0YzRHBwRzRjOWRRNEdENkZ1UGI1eXk5NkhwT3I2Z2pT?=
 =?utf-8?B?Z3lYNDJsU1Q4dGFqWDFkSzRIRFFzaHhZY3VrVmFNZ09NWXdjS2pURjZIK0Ix?=
 =?utf-8?B?WEVQMndibnluaVc4eHpqWFdCanE3QXZ0SXV4OWp4elQ2aDk3U2ZWUThSbndT?=
 =?utf-8?B?UXhUZ0Rac0hmcVFoYWJGck1vQzhSYWhaSnBEYTBWUHl3aE5BSzFjQjlYN2pY?=
 =?utf-8?B?SVlwZEorMThpZzIvS05wTHJncjBXMlhsMjd5TldNQ0pTMWJxT1lVNEJURnBr?=
 =?utf-8?B?aVVaVjhvWUpUOXV0S0w0SWlCYWZRbEJxTzQ2dnd5RzVLL1RiVkRGcjlUZnJT?=
 =?utf-8?B?ZTBpa0Y0M0ZGR084TTVHdjhDSDV1NzRUZlFxaXl0MEpmRkF2WUxTZllZZDAw?=
 =?utf-8?B?SWx3S2VuaXlpV0t3Lys0MGNzTXd6Q0lMV2dtbnMrNFY5VDk4OERnZ1B2UWpZ?=
 =?utf-8?B?bWR4clhJVHo4QXlkYjBJVldOdmlEQmRDQ25LY0s0Y29QUVA3c0lTMkRqeE5D?=
 =?utf-8?B?a05ROGpqV2N4b3VTR25sL29PUHJ3MWJXNitoNFc4T0xnWGJRb2tUSE45V0Fp?=
 =?utf-8?B?UEJPV0g1SWphYTJ5R1hPQXhXc1Y4emc2eEFMaXE0NlJzaDdrZktRcFIrMm9o?=
 =?utf-8?Q?3Oh/0mN1DRX8zJXiHtXdAwK1O?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7C87286644EC24DA81DF4C786F52CE8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c6227a1d-6f24-489d-8eea-08db97e2ddc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 07:41:24.1965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 +Z0nCyF/IhSx4TjNapvij3ONzvWNHDl7yKLHFNjj+Z3Et96M7gGr8a3hcGX6aDF+K6Hasjr8LOLZWSHh+pFFiilT+mDGp350RBJC0n0Z2QA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2884
Message-ID-Hash: T4MPLETDIBAHPE3PWZH56BX6BKALVCG6
X-Message-ID-Hash: T4MPLETDIBAHPE3PWZH56BX6BKALVCG6
X-MailFrom: christophe.leroy@csgroup.eu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQoNCkxlIDI2LzA3LzIwMjMgw6AgMTc6MDEsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBU
aGUgcW1jX2NoYW5fcmVzZXRfcngoKSBzZXQgdGhlIGlzX3J4X3N0b3BwZWQgZmxhZy4gVGhpcyBs
ZWFkcyB0byBhbg0KPiBpbmNvbnNpc3RlbnQgc3RhdGUgaW4gdGhlIGZvbGxvd2luZyBzZXF1ZW5j
ZS4NCj4gICAgICBxbWNfY2hhbl9zdG9wKCkNCj4gICAgICBxbWNfY2hhbl9yZXNldCgpDQo+IElu
ZGVlZCwgYWZ0ZXIgdGhlIHFtY19jaGFuX3Jlc2V0KCkgY2FsbCwgdGhlIGNoYW5uZWwgbXVzdCBz
dGlsbCBiZQ0KPiBzdG9wcGVkLiBPbmx5IGEgcW1jX2NoYW5fc3RhcnQoKSBjYWxsIGNhbiBtb3Zl
IHRoZSBjaGFubmVsIGZyb20gc3RvcHBlZA0KPiBzdGF0ZSB0byBzdGFydGVkIHN0YXRlLg0KPiAN
Cj4gRml4IHRoZSBpc3N1ZSByZW1vdmluZyB0aGUgaXNfcnhfc3RvcHBlZCBmbGFnIHNldHRpbmcg
ZnJvbQ0KPiBxbWNfY2hhbl9yZXNldCgpDQo+IA0KPiBGaXhlczogMzE3OGQ1OGUwYjk3ICgic29j
OiBmc2w6IGNwbTE6IEFkZCBzdXBwb3J0IGZvciBRTUMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBIZXJ2
ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlz
dG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBk
cml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMgfCAxIC0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxl
dGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYyBiL2Ry
aXZlcnMvc29jL2ZzbC9xZS9xbWMuYw0KPiBpbmRleCA3YWQwZDc3ZjE3NDAuLjhkYzczY2MxYTgz
YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zb2MvZnNsL3FlL3FtYy5jDQo+ICsrKyBiL2RyaXZl
cnMvc29jL2ZzbC9xZS9xbWMuYw0KPiBAQCAtNjg1LDcgKzY4NSw2IEBAIHN0YXRpYyB2b2lkIHFt
Y19jaGFuX3Jlc2V0X3J4KHN0cnVjdCBxbWNfY2hhbiAqY2hhbikNCj4gICAJCSAgICBxbWNfcmVh
ZDE2KGNoYW4tPnNfcGFyYW0gKyBRTUNfU1BFX1JCQVNFKSk7DQo+ICAgDQo+ICAgCWNoYW4tPnJ4
X3BlbmRpbmcgPSAwOw0KPiAtCWNoYW4tPmlzX3J4X3N0b3BwZWQgPSBmYWxzZTsNCj4gICANCj4g
ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmY2hhbi0+cnhfbG9jaywgZmxhZ3MpOw0KPiAgIH0N
Cg==
