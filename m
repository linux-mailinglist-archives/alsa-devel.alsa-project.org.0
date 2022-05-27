Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E888D5364AB
	for <lists+alsa-devel@lfdr.de>; Fri, 27 May 2022 17:30:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 078BB1772;
	Fri, 27 May 2022 17:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 078BB1772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653665416;
	bh=J+tVB/KVjt99QkkY55QLzjI9UpH+Zaqe9nzHs2ZP9a8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q7zjNsDmTu1448w8clg+xg00VION12XPjeKpCvkhURCoI3u6cgtKwOh44WeYfNMo4
	 8//hP1umR1X8XPSnFq7CeGne9Btix/BAF9za2D5cTr+tK6pds3yc+FnkRziUnrlKkg
	 6h7RIWjhCo201jRSnjD0RsbSHGZusGSSa+gaSGUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05660F8051C;
	Fri, 27 May 2022 17:28:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56503F802DB; Fri, 27 May 2022 10:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20723.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::723])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50960F800D0
 for <alsa-devel@alsa-project.org>; Fri, 27 May 2022 10:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50960F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dm.renesas.com header.i=@dm.renesas.com
 header.b="PdF8Qf5d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXR85xYbB5k71s2LhrxuOEp4tbJYnrJCvnVzhYD1lN7+N47Lq99uoddHRfCrvFMsMbELLqPcHsqeaIOY1h6ZMTk3BjU6OtIw53cNp4mN1oDnhb6tmFgC99ndJnvZCog0DaGF94UqFt2d9G0jM9/x0rab+M2jV8pd8ypDe1corwC/Mkl8dIcSlOuuWPHr9I6ZiFrPDfhq3mtIw+jpOoah95mDeY7lnX/jl0cnXbaSQPkkJsyZoM8QC+B+a4DrI9BhADDGQk0Zi07arChmz7j2tynYgCgFvtze6OJvBP/l7C7qSSBELYUh39uSUuBfslDdyqytfK6DC+IcMdCXOwQ/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+tVB/KVjt99QkkY55QLzjI9UpH+Zaqe9nzHs2ZP9a8=;
 b=HHKmRmhFLhXihZURVWezD9AU+Dd03qQdPCFPKM8PA4+XH6TqPB/Jkhy4H6F5vqVLAwArhCkoN+ID581kqbXf3ZTjiSKnRb+celohr2g+wYI6E4E1m6GfX0eOKcFKxrfxPxxGpzFYsbD7eE5jxZWqu/FWiHq3h+OMomq7KYpFouXRktV1DgaG+WOTaQn1jHBeKnr4DTksZWrHit1dKcmixlRGgLXwSBbYTHoP5HRMDH7Ac/ZEixh8skDW1vmuYgX7Lgij2OXLE+rXpAlBO1YfAHHP0Xeb/qA20Yis0hC/Td9tEP9f2DsVieJ0I1IFY3L404/US8mTKwY47cDYpkAcyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+tVB/KVjt99QkkY55QLzjI9UpH+Zaqe9nzHs2ZP9a8=;
 b=PdF8Qf5dFPk+qPUyx5pcPdrpPCznmfjb2eQPudQRblcnTSTL7TVwU5N+Mik1zLyfD0SGG4qQysBT74TToRNIKoW2gwkxazyPBnoKy74uyDnTLQhorOV3/+EwkDNLdYscLdJeDRUH/FHqZYWKvaslpf7384lzI79QOWZVRi0zIvs=
Received: from OSAPR01MB5060.jpnprd01.prod.outlook.com (2603:1096:604:6e::17)
 by TY2PR01MB2699.jpnprd01.prod.outlook.com (2603:1096:404:7b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Fri, 27 May
 2022 08:47:58 +0000
Received: from OSAPR01MB5060.jpnprd01.prod.outlook.com
 ([fe80::98da:f7c:9a11:f91d]) by OSAPR01MB5060.jpnprd01.prod.outlook.com
 ([fe80::98da:f7c:9a11:f91d%5]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 08:47:58 +0000
From: DLG Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Support Opensource <support.opensource@diasemi.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH] ASoC: da732x: Drop no-op remove function
Thread-Topic: [PATCH] ASoC: da732x: Drop no-op remove function
Thread-Index: AQHYcUBv51NxdAPcA0WOq0siOXPBpK0yaliQ
Date: Fri, 27 May 2022 08:47:58 +0000
Message-ID: <OSAPR01MB50607744BEEE4637E27EE0F8B0D89@OSAPR01MB5060.jpnprd01.prod.outlook.com>
References: <20220526203708.1723898-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220526203708.1723898-1-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b5eba9b-8178-4a13-5d71-08da3fbd99d3
x-ms-traffictypediagnostic: TY2PR01MB2699:EE_
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <TY2PR01MB2699C2C1BABAECB1891D00E5C1D89@TY2PR01MB2699.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zagLEV8qg/2Qsg8a077cKNBWk9yZavBUGwr2olgxNL2Kh6vFKjFcsErEFPrWHB+7C6OfrqwWBDxY11bgexQGvojT3CzVNSw+9xz1WmhGCxn/MDqzrZ2ww/SjjT4B+JrGxf8tCcj9AWywsirNGaKxMNtPtwZiPsLKufTpZO2SZYlgN9ykQiUwGozRhLoaj91xhzzEDbhH7B4OoFmhvswOnB1szhHY1UKJtvuJtlxxC/PWM8v/RK5dyIWRM+f5TjTShXPJV9BOvr4Ch4x7vS2GOt0boCxCUx1nARcTwwH3E+syS5aEYGdks8IoJq1yVAz0jIcvdyZrhewoTklg48AQpefeV+4fxCmGABQxXNPy9ZdAO7kQmEZPQL7z8neKyVf+ryocZFLgUoC1uRP8HpelzYN6u6t5Djj3ZMTaPObzH6fxOy7B3jJx4uvxxDJtsVGU+e2SdlSmcA2RrfNtVqxUjrUgSL2B7rcWzA37sNcnz8gIQTj6XHqnfl9iVqcFIhh4jtRr8ieQ+Hk4NY+lgvJy36EAfZV7AvvLAqJ/epdPC8i5nLqOrDte+os3xjfJIu/l/r7q/q4lgC8UJzDL6d/U/K5I6c0C1bRy3jFb8kMHInU+t7hr8rmJ+1HODj/XQP9E9zyOAfofXlnVjTFeMMmUZ1AcQ8cpSFqykVdi93LMcG05pIJNEEicRU8D/fs2ofQowzcrg5KDukbG5sJk/TlReA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB5060.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7696005)(38100700002)(66946007)(86362001)(2906002)(55016003)(558084003)(66556008)(66446008)(8676002)(66476007)(76116006)(4326008)(64756008)(33656002)(316002)(8936002)(38070700005)(5660300002)(71200400001)(26005)(52536014)(9686003)(6506007)(508600001)(53546011)(110136005)(54906003)(122000001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkVzTEI3cHhqQ1B0dnBraGh2SlVCZjFldDdMakRIeGd4S040d29CUWdOWHB5?=
 =?utf-8?B?dmhoS2NxeWE5bEk0ZDYySnVBeFptMDA5SW9NbkJKZmJVTXVkaERvWmxTamMr?=
 =?utf-8?B?WjJEbXBTbVVlL0lIa2FBOWVEVWxJZkNhamNpTmZpYUo1Z05pZ203MWNTL0dI?=
 =?utf-8?B?aVo5MzZjVmsxYWJGaGJmMjhXZTZCVEtOTXZ4dmNsc29PeDNodC9DWTNGT1Vh?=
 =?utf-8?B?STZSQ2JOQUt4eFV3T1d4MnBYQkFaV3lQbXZnUDVoMGE5VDdvMnJCVS9rZXJB?=
 =?utf-8?B?UGRjTlFYdWRsMnVWQTA5UVRQaitRVDBaakRib0F0bmowM1Z1WE91K1VLS1VH?=
 =?utf-8?B?Rk52aWtTRmE5bVBGK1N0TnVnOStYSVNvOEdDOEl0UTY4dXlOWEpHQ1g4QUcr?=
 =?utf-8?B?WUUyRFp5VHpNeS9ZbDh1MkwwejVMS2RNMDNWV3RoNzVOZDllNVJJaWQxTmJR?=
 =?utf-8?B?MVlJUm0ySTF5WktqTkxlV09TTmdUNWdWVUdIaFRJck1HMnkxTXMzRXlmbkFM?=
 =?utf-8?B?SDJtK3I3WjlYZzJPZXF1UVpqWnZCaHZzZ1pON1QwSGZWN21jNGhtdVVhcm1R?=
 =?utf-8?B?MzZ1Sis2OEdBKzdJMDFlSjFiaURiMVFTUk5HQ3loamFEMk5YWGlnaVg1RVgz?=
 =?utf-8?B?YnZJZFRsQzNUU1RtclcxMUd5ZlFaWDRlS2VhQ3ZzKzRhMitpdFk1cWZQM2c2?=
 =?utf-8?B?REhVeGZJSWpBbHZrcW9xSkx6R04zdWh3YmN3SkV3K1F0NXhrMGhkSFQxZ2pG?=
 =?utf-8?B?eXRPVU15MWtBVDZJWHdDcGVwU3BhSjdFSy9VTGtMdU41dVNJTzVBNVlucVN6?=
 =?utf-8?B?Sk5adHJNQ3E5UXNyQnpDSE91dXNhZERlbThRUlM1bnAvQkVNTVdNVG1pTDhE?=
 =?utf-8?B?Mlpvam5jYSt4cWg0b3h6NCtidnRLTnlIRkFKNU1Kd3RFYVg0eWNCOTNBazlp?=
 =?utf-8?B?QmoySzYwNWQrZ2ZGcTF2V0FRNmR2U1RTazBqSjJLa2xCTjdLYXIxeU1rSkdz?=
 =?utf-8?B?YWxEUU8rTUJxbXVtT1o4YjkvdzhaWEZTL2pIc2VidlM2a2w4MXhVRjB2TTZu?=
 =?utf-8?B?Slc3dXAxelQxNU5icTRXQnhhcmp0VWhxL1JpMWlpTHFTRy82VmE0S1phTTJD?=
 =?utf-8?B?djVWYU55MUpGYXhmQ3Fobk53VUdzNG9CTmo5YlVwV09oT2p2RUd0Z3pudUpv?=
 =?utf-8?B?Q3g3Zm1xREZFVVdJdlQ3YTRBSVk1Z0M5dWNCVzFkaWFnd1UvRWV6QlBqcWFV?=
 =?utf-8?B?TzF2TmZFdHN4RDJJbDZwVUNZMVpscXVHRGtjcC9ya0FIcXRwSFd5cHI2SU9S?=
 =?utf-8?B?dWUvaVU3SHZPZW5mb1BPTDhXZ2ViRlJFVUIxZkdNZy9Dc3Voc3dUK0s3RDlp?=
 =?utf-8?B?bFFWeWh5TFZXMThDNUEvZmZTQk1tcjl2dzNSZVpOdW5LVnRQNUdqRURiYzNu?=
 =?utf-8?B?Sjh6a2NqMmZ5S2ZKaDZDNy9MSXIrVEpGanBqM1l3UnE5S3lMLzVSZW9OZlVL?=
 =?utf-8?B?M3pwZk9kYU91TDVsMHJPM0NNQ01PVlZ2aXAvN04wUmh4QzAwUCtYc0c0NCtW?=
 =?utf-8?B?SUdmMWM0eHJIQ3VVcEVjb3dYNXdVVEIvdGh4Q012dkNpZTB3dlRWK1VwbWFC?=
 =?utf-8?B?R1NwKzRMTXRtaERNMnhMZ3FQK25qSFVrQy9qaDQxa3JCTlFNYTVPckh5M1Yv?=
 =?utf-8?B?QUp3bDdYbUV1MVJjZ3FrUlJ2cEtCcnB6SmNTSk9QR3AwSUVheHczaFo4VkY1?=
 =?utf-8?B?VzlFV1ZsSUNqbmpHQ3ZuNFJBU1dWM082OHpnS3VOeUFTcHcxUXcxdUhpSThm?=
 =?utf-8?B?N0w2UW5CTmEwc3FtRy9PTlE0bTVlb0JWTCtBT0FEc2FQSEJ3NDhtOTYvL2ZN?=
 =?utf-8?B?alQ5YnRxNmM1dkU3WDVmTExheVl0a2NoV2grUkhIemVSWWVscVVVV0t6a0JH?=
 =?utf-8?B?M3dUekVZUHFIczJWOUZQa2xGOFJGYkN6cTVHVXhVOHhsR0I1aWdjTXZWRW1X?=
 =?utf-8?B?OUNrNmg4dU1BTi9WQ0hNdEZVcnR2WHRqWStmWkJOd1FJOFJhS05wQmRNK0xj?=
 =?utf-8?B?aTFlUm5yWkFaK3BTeE9WNGNldHl0eDBYdmpQTkVlYXN5UnZ5ZVM3bTlhVTIx?=
 =?utf-8?B?d21OY1dpajRranpTL0J2Zi9hbExoZnowbmdydTRjUjhYUWNUQ0ZqdVI4WVNT?=
 =?utf-8?B?YUdwMExaa1EyZ3lXdUlmeFhMN2lWNE9Jd3ZtZ29wNnc2NEFWY0ZhQkpxbWxC?=
 =?utf-8?B?R3lUWlZrVjExYzhZc0ZNSjNHWk1lTWVpK2dJOGJGMHhTb2c4YUU2MjFtOTJa?=
 =?utf-8?B?REFpajlkZE40V0YxZEJxVkkzZVExVGgwdTN0Z0hPcEZPOUVCVG42ekpzSUJ4?=
 =?utf-8?Q?9nKjy+9TetDyu7oc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB5060.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5eba9b-8178-4a13-5d71-08da3fbd99d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2022 08:47:58.8325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f70kv9GdgjSiGs4TkRwVEsDcNGTvwIbbJbxPvJ7VAQ6X0H1Te6+XwHIyat6RYD06NBTW7QKyRlM9Chvlh5gTA5BKmaK8IkpjuhEUDFdRCU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2699
X-Mailman-Approved-At: Fri, 27 May 2022 17:28:30 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
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

T24gMjYgTWF5IDIwMjIgMjE6MzcsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOg0KDQo+IEEgcmVt
b3ZlIGNhbGxiYWNrIHRoYXQganVzdCByZXR1cm5zIDAgaXMgZXF1aXZhbGVudCB0byBubyBjYWxs
YmFjayBhdCBhbGwNCj4gYXMgY2FuIGJlIHNlZW4gaW4gaTJjX2RldmljZV9yZW1vdmUoKS4gU28g
c2ltcGxpZnkgYWNjb3JkaW5nbHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KDQpSZXZpZXdlZC1ieTogQWRh
bSBUaG9tc29uIDxETEctQWRhbS5UaG9tc29uLk9wZW5zb3VyY2VAZG0ucmVuZXNhcy5jb20+DQo=
