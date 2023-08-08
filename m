Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EFF7738D3
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 10:05:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72F4F83B;
	Tue,  8 Aug 2023 10:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72F4F83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691481931;
	bh=fK9LZlRl/fWjV1rToc8C/RI1Rf9Tcb6FiY8kHOr8P8I=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TK8LA3hMIPzNibwnfihtes7/Joql4SpldEKmjHkFPvgWsKtOH/ItWOBEnKFjPaV35
	 qqk/mj0kF1Q2TMI/fTp9RjLKumM6Y2HF/kXmo0z7U7yMyhHcfaKZP8PKwhQM93rQU2
	 +Tm+vvZcVvLQTfJI0BOIDgb1jlSEEVKR0IGFmhUQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17CA8F8016D; Tue,  8 Aug 2023 10:04:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5FC9F80087;
	Tue,  8 Aug 2023 10:04:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88BBEF8051E; Tue,  8 Aug 2023 10:04:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AEC4FF8016B
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 10:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEC4FF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256
 header.s=selector2 header.b=CUlTKdq4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDs2qINgJ4hweujztYLFmdbenw6gCUYAK+7VkDxq0D+0Dm/KFx+CAtH2SBq68BvCjkUQsW0+2LvqKmKAgWsjORBSBdM/RkkOKbAAg4JS2njBilG8yLQGiWJF5iYZ17MmVo8rU9Hx62tRHb6pUnFZf3SLRduL9FCy9ostyCFTWpkC8/iWyttlFC0rdAPZHDT0kkAuZaLMXPBXGC/+sp6zqxwMPTQibqke6Mu2CWJ65XJCxmOlr9rBnq2gMFoewVKVX6WEwVrCoyhtya1QC3DLbsB6+P+4IqdNgtPU2turC+abay4huJCrKLMowdHpnuJ0H905Zn/0CXagXAca445fJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fK9LZlRl/fWjV1rToc8C/RI1Rf9Tcb6FiY8kHOr8P8I=;
 b=Oi2/jb6sHNPKxl10MjmxLWx69D6YxHqjQ4nUwRwDU/tNTouSV3+qlh4Cvof/T027rW+a8MbHlYU+e0+i+XxLIQO4IFN6WLOzf5dGLHi/FGOik2iKRJ0QfYhHvssZkUfpjFE4DGROEzC1hAjDqrwjpXTBvyAWRhkFEPOMn2n1hzpLnkB1m+D1HgfClTy9baxVVkE0VnCFNPw5IvyfEnNwuJR/10fDUFQu/CAWdeGLs1xZsiwxojGedgdUGPRxcoQlvmW0NY2NimXeRzTLj4KTltfqPDAE8DZs0APWgRJply6h+MLq8J8jBEvsplpZyO536IhaA1ve/I274i+rlINDJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fK9LZlRl/fWjV1rToc8C/RI1Rf9Tcb6FiY8kHOr8P8I=;
 b=CUlTKdq4Cfg0lKeOZiTzXcmaCJhVOeSTzZy//tN6wTiOFEBePi7QUMUkq+E97VPUmml88szlgiSbg/hgLv51c/Y9dvgrYB6mmKBzZzM+7NyYvIOq/ufGskKb+IRoRb1R/WSu7XyFw1CgWmUz4op7+XAUB333yxa0S2BcMjWmGCXegX0Z/tIkFdpwHU5/Dwtz0+NiXOeTbuZZMfCU/b4ZTSbFCOJIjwfD/KdFcxFBBqEV8tKvVRBWBNjhSEgcZ9+jS536SuKKP2R9+JJ5jbHPNL62xJndyVQ01/5hEvty8hvOLCV0WY6ioL5tnORsfrRAxDSm3M6rfmewEX5v051tRA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3279.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:187::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:04:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:04:31 +0000
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
Subject: Re: [PATCH v2 08/28] soc: fsl: cpm1: qmc: Introduce available
 timeslots masks
Thread-Topic: [PATCH v2 08/28] soc: fsl: cpm1: qmc: Introduce available
 timeslots masks
Thread-Index: AQHZv9JJQWTy+945x0Ka49n2d9oJ76/gHkeA
Date: Tue, 8 Aug 2023 08:04:31 +0000
Message-ID: <b4e6f227-376e-e502-470e-f98f48ccbae6@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-9-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-9-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3279:EE_
x-ms-office365-filtering-correlation-id: 64d454a4-6911-4c47-8887-08db97e618a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tgrfH+FdLT2RuYdfmJd0ih63ABV21H+sKxgWMY4lVrJ9WokqYhQUK/7SmeIngMjKN9PeQzMYoONIGFj6Hy1S8GD8plUdy5KrCy9KNMYmvyo9vgjtFxEHMRdNduIYAPZo83iUS/TTz904f5jPw4a984tXy1M55IQ+Azg8blw+gAaMo6oQr5QtFXEx6Qqp7+Xwu0qDNE41uBnC5GKvOgKXhZ9pqCqsk5iG67gj4LQg1LjbOsx8HDJuKzyQ+ju7pKxksEOF4d/3otxHkUWYIMSBtLK0xeyYwtjB0lUsE5Aidqpg8dkKDgb6ua3Wl8ym2mXJq1GQ2U/dNAuezQc3TyxTRQi/DbMTjRv3oQf9Fc36KRGbfPK18RXJwEo0H3klMOZf7oA5D0IigoXbFbyvK2NQr/WCZ45d800BxHTVAPPhXB/UqZJzxIAOf4wW6owLN2uTMnKqfwTNhLJCfzhDGVylDPxBgKPS8wTIRTZbXx/caPG/93XZptd6DTxqP/H1ZAtSq7OQ7WLQKK+ekPBsQBRXSiO+fQe71VZwel00bXs1Us7brdFAllN/g1w7n5dwxmNDj4eepiM49B5m66B8oUwV4pFEtD7vkKddMXjGbqbPIaBQcznID2B8Il5Rmw+f5FF9o53di/6RCxvE4+ZiEkw427pubfzTiJa5hFuwIsL1DfMhFcjzr+E3bDN68UIzRxcCF7O1zD46VpArE8hGwtHBCpmBviTlFn/yUa8cIQ6q4bdCLA1C5cyInE0Jk4lTMf5aglbhK55kgmayWfFVlcEwbA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39850400004)(396003)(136003)(376002)(90011799007)(186006)(1800799003)(90021799007)(451199021)(2616005)(36756003)(6506007)(26005)(6486002)(71200400001)(6512007)(122000001)(31686004)(478600001)(921005)(54906003)(38100700002)(110136005)(91956017)(66476007)(66556008)(66946007)(76116006)(66446008)(64756008)(4326008)(316002)(41300700001)(8936002)(8676002)(5660300002)(38070700005)(7406005)(7416002)(44832011)(2906002)(83380400001)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QjFoSVNKb21nNHpYQ0FtZ05ZN2ZmMVZrRS9QMklKVHpoRnhuMThueTZ6MURY?=
 =?utf-8?B?ZS94c0hZLzlXZFJCcTIyS241TFJOdEg2Yk1rWVdRZUdQSllmRkxha3dZZmdI?=
 =?utf-8?B?eUhYbkI4NHZyaHVaNm9GM3hVdWdTdUFNS3ZPYnFIa3NZcGF1NWpNUmp5cUl4?=
 =?utf-8?B?ODBTNzVYV3ZuYmZEcFQwV25hTWFzbzNXT1ZyUjNjb3c2d2pBNUtBc01GQ3Z3?=
 =?utf-8?B?dXJsUjVuR0pPOHVqMUFxTXFLeTdzcjhNWlY1WVFEcVlZVFJ3VEFSWCs4S3ZN?=
 =?utf-8?B?ZzZ0cU9CYzNSTEcydGYwQVpib0lZdGdrTzJObTdIbElLV0huRXJPeVJ1Q0xm?=
 =?utf-8?B?YjdnaVZRM1lrWk82RFBQQTJqMTIxMFNQVldMTkNxT1ZRYUhycUVXSmx5amkv?=
 =?utf-8?B?QjZQSTRqTEpZNjViaFBvSlVJbnNXS2JscElmVTFSejR0cUZuZ0czczRPNXlE?=
 =?utf-8?B?STlmQ1pvckpXbjdOTTNZQys3citwVjU2Wm1EbUU4Qmp3REdxanpnMUJOM0lj?=
 =?utf-8?B?VG1zQlVZS1VTeHlsZXBEN3ZEM25CMGlUUXR6U2ZUNVlrcHErZEs4aVVPRDBv?=
 =?utf-8?B?K2o3SGhrOXFBQVVBNlhSWC81UlFheVBVa2p6Ym1HRUpMWE94N2hOeDBTOFh1?=
 =?utf-8?B?LzRvREpiMXp0TkRESEhsK2Q3Y3V6a0ZuclFpZmdpVnNEN21ZVkNSZklRZ1Rx?=
 =?utf-8?B?N1VHWHBJb09EYjdZWldZUThNRG1vWkl4L29Cc3VtZGdtNGpJNml1dHU4dUVN?=
 =?utf-8?B?U1NjRElaZVFKU1ZvUytjY01aSDlBUS9mT01KS3RNNVlGMld4YWl2alRWSW4x?=
 =?utf-8?B?NGdJT2N2MnNyVzJMSHFwTEQ4NnE0ZktYN0xVTXA2bFo2dHhMLzR1TnUzaDhj?=
 =?utf-8?B?Wm1vY1V1VnFUQ3lKRlV4bWVYR3BHWENZZmVYYnN2M2w3OGtjSTI4YkZFVnhZ?=
 =?utf-8?B?anh5U1paTHlaZEN2ZHVwV0d2ZUY3NjlMeGw4N25QekNDR2xuQWhQTjdkN3ZY?=
 =?utf-8?B?bTR4S0FKR2dBc0hCUWFGaFN6YkxPMFFWSkMxelpCOSt3dWNBaHZ4UlhSdTNw?=
 =?utf-8?B?dXl4T1RuMjRXWEtOZVM1VmRmRy96eWxBRytjSEc2WDhuaHBzOW5rN2xrZGpS?=
 =?utf-8?B?K2ZkekZzZ3FRNEF3eENFOW9nNmkrVm5XSkZKUE12bFFGV0xFdldxNm9rRTY1?=
 =?utf-8?B?SjlxSEF6dWVvN1BLQ3pKN2tvbWdPK0ZKZG5ZL2RJS2pDQWo3ZzdSVTZ5WGVY?=
 =?utf-8?B?elNVdHF5cHJWaERzcVN6aC9iMGxIZWJDVUpkTVJVNTlzR09XRmhqb2hGb2FL?=
 =?utf-8?B?SUVQcVVXRE15YnowckFoU01LMDlKZW1SVGw0RDZRWk13T3dML1JVdWRYaFVx?=
 =?utf-8?B?NTUxdHdxSXphZTFFZ2hqWnk0SnFIaW1IZlFncnc3VU5IS1NBbWdZODh0endr?=
 =?utf-8?B?bmpoVzVSbnlSL2FLNzVUTE03MVMrUk05TWMxTTlPbytzUGpXQUxlYVBMTGZk?=
 =?utf-8?B?OTdrWmVXOU5TVTF0bDN0SkNLNk85S1pRTndvelBabGZQKzgzM000cXNQb0Vp?=
 =?utf-8?B?Y1RRdVNySWV0cmxmT0lnN3JEeTRORHM4V2Z1NWRwOVQ2allRMm40SEpHSS93?=
 =?utf-8?B?U3p4Q3NZeEtJTis0Q0U2aEJGOCt5SXN1WEloL0lKbzFURWM1blo0RW9VNWhZ?=
 =?utf-8?B?QmV1OXo5NzZxTnhCdmd0SGhpRHBuYUZRZmlIRmdNSW1QZmpmUWphZzRTbDdt?=
 =?utf-8?B?REhqaTBsU2o0cXI2Snhrai91aUc3Y1lnQ1dNSlYyMlhPRHRyS0hXMTZOK2Rq?=
 =?utf-8?B?a1hRRnBQQ2tBTWsrZm5MZDlvK2tiMkZ4Y0dMZFBiR0c0bmFBakVGelROYmhE?=
 =?utf-8?B?NUZKUkIveFJQMkdQYlRkaFBqNFVXeDJUWTl2eEJSWVYrTjh6OGRJWkRHWjl0?=
 =?utf-8?B?NGprSmhHWkR3Uk9vSnJMZXRGSjVnL3l0ZHJDQUVVdDNxTFkxYWhEaDdnanNM?=
 =?utf-8?B?MzVJSFFrT25yVEFGZTFSS3lPKzlDMW9NWC9uTWVHdHRTS1FyWjYzSGtQcTVY?=
 =?utf-8?B?QU9PUGFFZTlPZ1EreWZkL3pNQk1mZXllZ215NmdwSzUwcU93R2k1eDZnRHZa?=
 =?utf-8?Q?IIPzkGo+Dw5ZCALA30KRbO/Cc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F54AFFB0F0199E4F9767C16DDFDCB4F6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 64d454a4-6911-4c47-8887-08db97e618a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:04:31.4029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 zCWxNsI7aRPFbnrqD7akPgvvGNT7GttyAaLmmDxQtNtEA1lpqqOAGFt+7STCrvgUCQxJKqMDa1ChuZgA4Kz7Qqr7mFYPOrRWBFREPsTRQq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3279
Message-ID-Hash: 5YLTLACFZL3UIJ2QGQ72NMSBBHF2TSV5
X-Message-ID-Hash: 5YLTLACFZL3UIJ2QGQ72NMSBBHF2TSV5
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

DQoNCkxlIDI2LzA3LzIwMjMgw6AgMTc6MDIsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBB
dmFpbGFibGUgdGltZXNsb3RzIG1hc2tzIGRlZmluZSB0aW1lc2xvdHMgYXZhaWxhYmxlIGZvciB0
aGUgcmVsYXRlZA0KPiBjaGFubmVsLiBUaGVzZSB0aW1lc2xvdHMgYXJlIGRlZmluZWQgYnkgdGhl
IFFNQyBiaW5kaW5nLg0KPiANCj4gVGltZXNsb3RzIHVzZWQgYXJlIGluaXRpYWxpemVkIHRvIGF2
YWlsYWJsZSB0aW1lc2xvdHMgYnV0IGNhbiBiZSBhDQo+IHN1YnNldCBvZiBhdmFpbGFibGUgdGlt
ZXNsb3RzLg0KPiBUaGlzIHByZXBhcmVzIHRoZSBkeW5hbWljIHRpbWVzbG90cyBtYW5hZ2VtZW50
IChpZS4gY2hhbmdpbmcgdGltZXNsb3RzDQo+IGF0IHJ1bnRpbWUpLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+DQoNClJldmlld2Vk
LWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4g
LS0tDQo+ICAgZHJpdmVycy9zb2MvZnNsL3FlL3FtYy5jIHwgOCArKysrKystLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zb2MvZnNsL3FlL3FtYy5jIGIvZHJpdmVycy9zb2MvZnNsL3FlL3FtYy5j
DQo+IGluZGV4IDJkMmE5ZDg4YmE2Yy4uMjFhZDdlNzllN2JkIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3NvYy9mc2wvcWUvcW1jLmMNCj4gKysrIGIvZHJpdmVycy9zb2MvZnNsL3FlL3FtYy5jDQo+
IEBAIC0xNzcsNyArMTc3LDkgQEAgc3RydWN0IHFtY19jaGFuIHsNCj4gICAJc3RydWN0IHFtYyAq
cW1jOw0KPiAgIAl2b2lkIF9faW9tZW0gKnNfcGFyYW07DQo+ICAgCWVudW0gcW1jX21vZGUgbW9k
ZTsNCj4gKwl1NjQJdHhfdHNfbWFza19hdmFpbDsNCj4gICAJdTY0CXR4X3RzX21hc2s7DQo+ICsJ
dTY0CXJ4X3RzX21hc2tfYXZhaWw7DQo+ICAgCXU2NAlyeF90c19tYXNrOw0KPiAgIAlib29sIGlz
X3JldmVyc2VfZGF0YTsNCj4gICANCj4gQEAgLTg3NSw3ICs4NzcsOCBAQCBzdGF0aWMgaW50IHFt
Y19vZl9wYXJzZV9jaGFucyhzdHJ1Y3QgcW1jICpxbWMsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAp
DQo+ICAgCQkJb2Zfbm9kZV9wdXQoY2hhbl9ucCk7DQo+ICAgCQkJcmV0dXJuIHJldDsNCj4gICAJ
CX0NCj4gLQkJY2hhbi0+dHhfdHNfbWFzayA9IHRzX21hc2s7DQo+ICsJCWNoYW4tPnR4X3RzX21h
c2tfYXZhaWwgPSB0c19tYXNrOw0KPiArCQljaGFuLT50eF90c19tYXNrID0gY2hhbi0+dHhfdHNf
bWFza19hdmFpbDsNCj4gICANCj4gICAJCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTY0KGNoYW5f
bnAsICJmc2wscngtdHMtbWFzayIsICZ0c19tYXNrKTsNCj4gICAJCWlmIChyZXQpIHsNCj4gQEAg
LTg4NCw3ICs4ODcsOCBAQCBzdGF0aWMgaW50IHFtY19vZl9wYXJzZV9jaGFucyhzdHJ1Y3QgcW1j
ICpxbWMsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApDQo+ICAgCQkJb2Zfbm9kZV9wdXQoY2hhbl9u
cCk7DQo+ICAgCQkJcmV0dXJuIHJldDsNCj4gICAJCX0NCj4gLQkJY2hhbi0+cnhfdHNfbWFzayA9
IHRzX21hc2s7DQo+ICsJCWNoYW4tPnJ4X3RzX21hc2tfYXZhaWwgPSB0c19tYXNrOw0KPiArCQlj
aGFuLT5yeF90c19tYXNrID0gY2hhbi0+cnhfdHNfbWFza19hdmFpbDsNCj4gICANCj4gICAJCW1v
ZGUgPSAidHJhbnNwYXJlbnQiOw0KPiAgIAkJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmco
Y2hhbl9ucCwgImZzbCxvcGVyYXRpb25hbC1tb2RlIiwgJm1vZGUpOw0K
