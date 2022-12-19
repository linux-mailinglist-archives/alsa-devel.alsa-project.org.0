Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ECC653CAC
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 08:53:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31D5C34C8;
	Thu, 22 Dec 2022 08:52:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31D5C34C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671695588;
	bh=tt8KGoEDFunHzIW4U/+dtDeff0z17kLRZycYNEE1oFU=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=APStrIU/JFYO/KaGQzR8B45Ett9C9Gk3f96M6VfTYzPcxVYhxgRgaW6df0ESzemWa
	 AN1Y2kRxnQX23vKWnY7lRcAbjgHU31sZR2o68+59pxDjyJvnWmd4povaYN/bLea41G
	 djpUsFdAaGHW3B2+PKzJ+bhvsGA9km8tiSfDz7cs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85F25F80158;
	Thu, 22 Dec 2022 08:52:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C174F80423; Mon, 19 Dec 2022 04:53:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2125.outbound.protection.outlook.com [40.107.114.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D9F7F800DF
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 04:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D9F7F800DF
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=dm.renesas.com header.i=@dm.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=muatSHiV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCVB/vg1QzPkOX9P3GEmmcoIyQ5ID0a0gVM9QQxgeUF4XXT4neNrinmk/pRMzLQ7fYPLcXcAU5EHqAh1jGiXs4qDkyeKrffxZzbaleppEGD5rwnvSGv+5tS9+wbXidYXWCuF+IzKOHusjYQz4s88Vo0WEjjaNyblWxjVAuoVKFmyy2WS9KWV14WafvMfPP9gp4q/AOfYOSaVVHc8MR8+lW3nBnKY4+pFaUhK4BYWe2m9gUM2VnvdkMqvA14hg2/lmUNtEerrtNNVzzKPOpdD+bLMo18K0aHnGLAFZG9z69zY1rijQDU6m0tR6XkAb7F71inEbo+DeDzs+armwSw2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt8KGoEDFunHzIW4U/+dtDeff0z17kLRZycYNEE1oFU=;
 b=Zn061KkPINa5vzCAnlAkcgPMAUtmrFbpXUKuFdEVLM2TIwPr6KBh1ySd4BsETuuAnnf0mhq5nFnTRhxJxqH82QKllo05VWcr9qfK4VRByyJ2w54hjgIv4ssSW2sU4m6B6a26iNOrB3ih73Vu+cfxtRVfumxSmRoU7l7pSQm6uKil5IhCp24jbX22QTKj5+4sJwS2B8/BqMSHm/lYdxMkS7yfUSCGxvlboEicZM0WokWuRZ9o8mTPnhsEGezROfotHMHJo1Rrqr24knRSaigK4A+iZX+0ey8kaxz7coaS5ZRzGRO7Ql+FN7JF8kE6XHACrIacoErEPiQkJdYU09gvwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt8KGoEDFunHzIW4U/+dtDeff0z17kLRZycYNEE1oFU=;
 b=muatSHiVsSIRYCrlGPpMuB9Y5MwMcRJugLGL2oj2pjYesRiKHbQRrq7hdvT+JQyEJ5Q8+K6+j5onCSJEaj26GtqH52nos62EwGNZ/69R+JsEvAx4C1QC3g+6pZ9BEEMFPNwr8CbGTpeD0Ux/5U7ZTV1ciYn9qTDLBLn7fQLC3L4=
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com (2603:1096:604:10b::11)
 by TYWPR01MB10003.jpnprd01.prod.outlook.com (2603:1096:400:1e3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 03:52:53 +0000
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::8059:793b:71e3:72af]) by OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::8059:793b:71e3:72af%4]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 03:52:52 +0000
From: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Mark Brown
 <broonie@kernel.org>
Subject: RE: [PATCH 2/2] ASoC: da7213: Add support for mono, set frame width
 to 32 when possible
Thread-Topic: [PATCH 2/2] ASoC: da7213: Add support for mono, set frame width
 to 32 when possible
Thread-Index: AQHZD3ZQQ4uJHluZskO81BKtbME91a5tb9AAgAACwQCAAAbsAIAAGLwAgAcGilA=
Date: Mon, 19 Dec 2022 03:52:52 +0000
Message-ID: <OS3PR01MB66410E087BED80930430F72FCDE59@OS3PR01MB6641.jpnprd01.prod.outlook.com>
References: <20221214044058.6289-1-David.Rau.opensource@dm.renesas.com>
 <Y5nb7ik1cCKo+FlR@sirena.org.uk>
 <CAG+cZ07erTzV8Re-xo8GixpsEhK28Q6wHxQeE0co+sWgQAFgGA@mail.gmail.com>
 <Y5nkDEcgbZ2vNEsK@sirena.org.uk>
 <CAG+cZ06PHgrLebLESbitdkupYcyZ6twr4uv6iczNxp5ztox-EA@mail.gmail.com>
In-Reply-To: <CAG+cZ06PHgrLebLESbitdkupYcyZ6twr4uv6iczNxp5ztox-EA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6641:EE_|TYWPR01MB10003:EE_
x-ms-office365-filtering-correlation-id: 0225d44a-118b-4dc5-d5ab-08dae174813e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P1Vn0jqEDRLAImP5IOdlBodAzmc5h74kq2kOAhvBipr2binE235hWLiIq9XSw4MWuAreH8ytedPRShc4QJBi+ydIs3SsKc6646jB2kr+2jI0Ok9qepZ5YRqGTkbroYSRH6wjXNTIZHv5w5ooA9LpaOsOGw4JRcMYa4FRb0ZvO6vLkj9LjWC044JQ/FFG7h1mQyMi7hG7oEaKiqe2XLJXAgBEBpYJG4xhIZjNUpajoMFK5aUANwb8EnoFLY3DSWTwIUf45ObJbU/j+YpqcjBb0eImBhiG9DLMJh7A47645sZ0+JfFLYOn4OLoMEKLuEKTi9dyP2w2YfJSoRdShD/64u9olIKgHKna6U4DN2j5yAZhMk5U2djd1lHtFPTmz1qElI9CmMql8M2Lk54WclOV+miIgOIL9AaTZggB6MapouYEy+l4nhEcxBqwpeHrAzAYajj7pYLo8XFnTQ94l8FJUJaDlcOnC2MVMe82aY2DW3d48V0y2vTlx5K/0jJ3CKKaJ/8D4UKSsG+Rjh11sKw62N57Fe0763QWNCZWzHfYrDLp9hUZK8jhMuCq8fjLFPg94no3S3vJLVAGG7QusuD+0DTCjtY8jvvA/HwIeGO4Ox8PsuzvXhQUhL3u/RX5WBb0xeitPRKkjpYbVPy10MJsCDGXq/GiSNf6oLYW72Ydy0XnAp1TYOEna8eXLVrhWeTD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB6641.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199015)(83380400001)(478600001)(186003)(26005)(71200400001)(33656002)(86362001)(55016003)(38070700005)(38100700002)(122000001)(5660300002)(64756008)(66946007)(66446008)(66556008)(66476007)(76116006)(55236004)(9686003)(53546011)(6506007)(7696005)(4744005)(110136005)(54906003)(4326008)(2906002)(52536014)(8936002)(41300700001)(8676002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVF6S3MvSkQyN25aV050VGJHN2FzemlIR0k1NDdOYWdQWTdrWnFsTTVneHpv?=
 =?utf-8?B?ZVJMK1FCY2tJa29tajl3UXdiUFlJdHorQVFXWDdGT0lrci9WZnFmZXJWZGpB?=
 =?utf-8?B?SnFvME1wazh0OElwTUpmS0txNWZqa2RUNDdZMlA1Sjk0ZVVNa1EyK3gxaTBO?=
 =?utf-8?B?eWZDTTB2TjdlYlVqbHM5d2hFa2JkYTZZUUhWRnhJN2VwS1N3cDNzMk02eHJa?=
 =?utf-8?B?cmRESmZMa2dJNnVKaWxRTXF6RWkwMHBwWW16V0FUeHd5Q1B0dTRWSS9oVjAx?=
 =?utf-8?B?UnRZZDYxalNBcUtsa1ZHNi9sYjhUZHlkdkhTOUQvMWtCVHRNUXM3dGFhQUlz?=
 =?utf-8?B?aTFRYm9handBODQvVm0wL1F5TVQvbm5YMUtGME81Q3JHNkM1WmkrTzR1M0ZL?=
 =?utf-8?B?bVZ0OURnVGw3QzBsZ3VCa1U4OWllZTh4cCt1NlhwNy95cXZtMTA0UWwrQ1pw?=
 =?utf-8?B?czJSQi82QzJMcnc3RTZOL2lCTHBhT0tLa3g5M3dkdk9MRFJZKzd0U0hhSVd0?=
 =?utf-8?B?REdGazhoeFlHOVVRK3VZa0xOTnVwMGRjT1VvUnZMemFLdnIzOU5SOEo2WjBH?=
 =?utf-8?B?N0dHci9tbFJZZ00rREtMbXp5cVplejdsZ0tKcytvdUQ1dnE5MUdzNC80dW91?=
 =?utf-8?B?Vml4d1lRTHZVV0QyTjloNGQxVDZWWDJZVDZHV0hqQmVkSXdiNEU2ZW9peWlM?=
 =?utf-8?B?MUNFb29qbW9CdTVaeUF4RGxMaGJHVnRXUzl6RjlJK0dvTzh2ZkhTaWpDT0Jq?=
 =?utf-8?B?QmVCSCtZN3hxZWViWHh0WFZWVTJvSFltL3docEw0RjNNQVlYM2Z2NUU5UURr?=
 =?utf-8?B?aDBNSldMZTRoV2VlcTUxbDVIdDJzZWtncFVIZ2ZRMDljNnBJd0xXY1dzVUZ5?=
 =?utf-8?B?YU1MM0hIb0YwUnRsRlhGcGd2Vmp6QXo2UWUvWHU4bTJ0QXNQcnJwWUkrS1o4?=
 =?utf-8?B?ekFZc21PVThmRkpUcDJ3eHRjSFNDc1c0bkxMU3RLYjFxNWhqZUxmUVRxOS9F?=
 =?utf-8?B?UFM1bGNDNVZxY3F0aGxuczR0bU5SNWpJSzlHNnFkeVlUNnpReSt3WGcza0JD?=
 =?utf-8?B?V1hOdzNCMWE1WDN3cm9BdkZKWGRRbWpzSHZYWjRqVmQybnNoNGQzRW9DVzhn?=
 =?utf-8?B?bUw5MStraHN3Y3hTWVRRMWttc1g5eDdPcG83WCtqVzM2Sm0ySHNtYVJYQW8y?=
 =?utf-8?B?aVVlUjY4NlJUekdIZjN5N0h2LzdIRlhqWVZjTVhzM1hZblUwTzUzbFFPUzR3?=
 =?utf-8?B?TXVrQzFLMGRFZzEvZFBrZnVDTThReDl3TEhGTHpXYmVhcUNaSGVndE1DdHBa?=
 =?utf-8?B?eVQ5QnIrTVltYjRyV29Ya2JtN2FybVI3MHZ4VUVTem9jMWR6MWdEV0sxcThi?=
 =?utf-8?B?d040Y2ZHdnR3MFduTmpIbjliRVBxQkZQVE51MEh2K3dWSFZvNjlTNnFhWjQ2?=
 =?utf-8?B?U2hhYTFOWkhPVHpMNjRSbmh5US9UY09QNVl4cWNSUHdxME9UNW9aeHB0M0pa?=
 =?utf-8?B?WER1M3NkTWFOZ2pDamhYdld3YXdPOUtXVVQ1cHV6R2V0SzFHSmYxZDc3eExJ?=
 =?utf-8?B?Nm5Iem05QUJudkJzeWV4dlBMN00yQ3dRNldsNzV4MW44b3FLMm1SMU94UGhY?=
 =?utf-8?B?Um4yT3UyZUYrOGpTL0VLTmVmK2xmamRZb0RMSTF6OEhGa2gvTkx5OUVoWjlJ?=
 =?utf-8?B?S1MvQ05GRUVaYU9EZnhsVDJWNHZNVjNmSUx5ZTgzTHVJRmFYcjBhTjNwbmha?=
 =?utf-8?B?TGszdVdOR0YrcVNPL3Ezd1Mzam5oK2JXNVJnZ2NhNkZEZnV3blhUUkl0dTl2?=
 =?utf-8?B?aEFJRjBmQTVkeHJic29HYjZZNTNSNTliRXNpZGo3a0V0cWQ4R3R5WHRhVWg1?=
 =?utf-8?B?d2t6N25yR3p6Lzkzc0hWYWhQMDlZQkR4UGhORmFQVjNFTGk0TDZVVWNXaVRP?=
 =?utf-8?B?bXM4MGNQTm5KNGRyMEx2NnJuWU80Y1F3VG5kbkNxNVNBbXBOb0RKZjIwbVU4?=
 =?utf-8?B?ZlRWZU1HSUFuMkU1ZTBLdktYYUhzMkxtbmQ2OThIYTRZanh0OWRxMDMveHVt?=
 =?utf-8?B?R1ZOZ0EvU3YyQ3BubjlhQ2hza3J2TkZhZi81aXI5Z1VZNGVkT3FXZEdBaHVm?=
 =?utf-8?B?UmFGcm5oMzNQM3RQZHRMQ0xKWEVueksxRkJDMzNhUDE4YmNBOUtSL3FweDlq?=
 =?utf-8?B?clE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6641.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0225d44a-118b-4dc5-d5ab-08dae174813e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 03:52:52.6556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +7I1ZO0ft87ZrVMgBFynZDNccff8X3m2yTdFKFEpDcoXjmMXMeCyuDM/xPfL1V0JTPBypa01CttQZeQ0jG/1aN+iEQmiTn6sEnKJYG6a2BI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10003
X-Mailman-Approved-At: Thu, 22 Dec 2022 08:52:08 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "David.Rau.opensource" <David.Rau.opensource@dm.renesas.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SXMgdGhlcmUgYW55dGhpbmcgSSBzaG91bGQgbW9kaWZ5IG9yIGNvcnJlY3QgdG8gbWFrZSB0aGlz
IGNvbW1pdCBtb3ZlIGZvcndhcmQ/DQoNCkRhdmlkIFJhdQ0KUmVuZXNhcw0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IFBpb3RyIFdvanRhc3pjenlrIDxwaW90ci53b2p0YXN6Y3p5
a0B0aW1lc3lzLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIgMTUsIDIwMjIgMDA6MjUN
ClRvOiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+DQpDYzogRGF2aWQuUmF1Lm9wZW5z
b3VyY2UgPERhdmlkLlJhdS5vcGVuc291cmNlQGRtLnJlbmVzYXMuY29tPjsgdGl3YWlAc3VzZS5j
b207IHBlcmV4QHBlcmV4LmN6OyBzdXBwb3J0Lm9wZW5zb3VyY2VAZGlhc2VtaS5jb207IGxnaXJk
d29vZEBnbWFpbC5jb207IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIEFTb0M6IGRhNzIxMzog
QWRkIHN1cHBvcnQgZm9yIG1vbm8sIHNldCBmcmFtZSB3aWR0aCB0byAzMiB3aGVuIHBvc3NpYmxl
DQoNCk9uIFdlZCwgRGVjIDE0LCAyMDIyIGF0IDM6NTYgUE0gTWFyayBCcm93biA8YnJvb25pZUBr
ZXJuZWwub3JnPiB3cm90ZToNCj4NCj4gT24gV2VkLCBEZWMgMTQsIDIwMjIgYXQgMDM6MzE6MjZQ
TSArMDEwMCwgUGlvdHIgV29qdGFzemN6eWsgd3JvdGU6DQo+ID4gSXQgd2FzIGEgc2luZ2xlIHBh
dGNoLCB3aXRoIG5vIGRlcHMuDQo+ID4NCj4NCj4gSXQncyBmbGFnZ2VkIGFzIHBhdGNoIDIvMj8N
Cg0KVGhhdCdzIHdyb25nIHRhZywgaW5pdGlhbGx5IEkgc3VibWl0dGVkIHRoaXMgYXMgYSBzaW5n
bGUgcGF0Y2ggdG8gYHN1cHBvcnQub3BlbnNvdXJjZUBkaWFzZW1pLmNvbWAgYW5kIG5vdyBpdCBj
b21lcyBvbiBMS01MIGFmdGVyIHRlc3RpbmcgYnkgRGF2aWQgUmF1Lg0KDQotLQ0KUGlvdHIgV29q
dGFzemN6eWsNClRpbWVzeXMNCg==
