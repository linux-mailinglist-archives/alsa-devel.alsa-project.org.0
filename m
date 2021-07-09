Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1502F3C2A45
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jul 2021 22:26:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BC06165D;
	Fri,  9 Jul 2021 22:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BC06165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625862417;
	bh=5Djmvazv5LUTdSRY41ifEdM8siNOk4OZ6LenKAyOG1U=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YR/S41IiMxYqakmc265Wqa6oKmFK2ZYHbRLCm4ufoV8S8NLa8byiPnmMQ41TtYge2
	 mloAJhwJ/1Dc5Mw4QqJ58FnCdXXG64FWmuZ9cSdanGxaVql0j+LjD58wvjoFYTUnyI
	 ZTcTeQQtKRmq8fI4Cgf7X5qFwPCZEFcM8nFcrLG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D615CF80171;
	Fri,  9 Jul 2021 22:25:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BF4DF80224; Fri,  9 Jul 2021 22:25:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com
 [67.231.159.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3824F80059
 for <alsa-devel@alsa-project.org>; Fri,  9 Jul 2021 22:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3824F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="n9SbgI36"
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 169JllhR023473; 
 Fri, 9 Jul 2021 16:25:19 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2055.outbound.protection.outlook.com [104.47.60.55])
 by mx0c-0054df01.pphosted.com with ESMTP id 39pvwv80v3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 16:25:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiWRTZqYw7kIE7mvB8Rz0CLYcVjm+BHf6hf/2/0kFe1dePjdcY3rU3iuZ5tKI6ugU+lB+crcBcX7870V1vBOlfMUN6rVBG8ynKg2meZ442Gx4+Gkr0HlzG17ZWYhTcUTZpdUXF+q7EfnsmQtZ09ZDTTWtbWEYjeM2qGqsdcudybwgjbR9RpfGW69KHXnzJQIXJhIi9faaHk04PLbdDdL8VN8Y8yAKHo0SuyfabChQ0ZFFpsgVyJNmm9Dm9Y6H7dYIEcaoeAMbuF3cUb87IVV5FGITc3shAKgbSZVWCRNnV/BIrG2quZ7k8eEfVp7Cd7jDM23kSXhwcZFqxv6SWGk4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Djmvazv5LUTdSRY41ifEdM8siNOk4OZ6LenKAyOG1U=;
 b=IOvRvrGAwSfEJBMpeZctssIN897zzCeDc1oX++jm36WSJn2SasXiiPJrZyCo6bd6piS5/fmuAclRY+ERm4p/RfLoBfvO4ZfSwcrjNzaKn3MlcK4YuxTDdW1xKjpUQUrvzQwVRGJfxlZz6sILKh1YEWhzVJoLcLIiXFBtKeMVrPz7o3UPle4Xqjc8hjLNW2SxLYqu+nMSjRte6WWSaIXbKm8gDzF6J1fVfF++qG1oE7DQv8C4kvcULOqhP5+49Ssv3m7B4LSYa76VrJv5B3nC8Uww2Zq1VUvALxpzb2pJyvl/anHC6YF91GZT92KxUrIKec7fvEnrWJQe5NZWPthOrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Djmvazv5LUTdSRY41ifEdM8siNOk4OZ6LenKAyOG1U=;
 b=n9SbgI36x3hpf2xOsKC+TeOjiIlYSri76TCMBdA+vO49tTTCeNj3WDtlGk0jNSdAqzKxWKC5TMXIJKOjc1MOSrAvNoiO+E/txup1M0FIDTZtilkUbZ5sWC2zCCVdWSoSEZoj5euNiUUKexsz+VLlO0NswSUKEfKC2xhNOX7FlzI=
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:27::23)
 by QB1PR01MB3251.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:2f::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Fri, 9 Jul
 2021 20:25:17 +0000
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::88bb:860e:2f3a:e007]) by YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::88bb:860e:2f3a:e007%6]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 20:25:17 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: Issues using simple-audio-card driver with Xilinx Audio Formatter
Thread-Topic: Issues using simple-audio-card driver with Xilinx Audio Formatter
Thread-Index: AQHXcsWHzh5VPmqBUEq1W5dwLNaiPKs2tqGAgAFyjACAAAU+gIABWLsAgABTeYCAAL6XAIAASpGAgAAP5ACAACfYAA==
Date: Fri, 9 Jul 2021 20:25:17 +0000
Message-ID: <5753ab0fbe8dad1a0ce3bbd8dbc9cfada71b21c9.camel@calian.com>
References: <6c7635f59ea9b162999f060334eef48e0812534b.camel@calian.com>
 <874kd63oqa.wl-kuninori.morimoto.gx@renesas.com>
 <52eda9910822e7e854b049127e462bf468f912ed.camel@calian.com>
 <87r1g91ygm.wl-kuninori.morimoto.gx@renesas.com>
 <2cccca32d53e1d832df67d070bac9ca998a931c6.camel@calian.com>
 <87bl7cl20y.wl-kuninori.morimoto.gx@renesas.com>
 <20210709123854.GA4112@sirena.org.uk>
 <129f46987f79328edba109a800b522c6ddfec99e.camel@calian.com>
 <20210709180240.GG4112@sirena.org.uk>
In-Reply-To: <20210709180240.GG4112@sirena.org.uk>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=calian.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e70f31e-8c06-4cef-fa7e-08d94317aa92
x-ms-traffictypediagnostic: QB1PR01MB3251:
x-microsoft-antispam-prvs: <QB1PR01MB3251E784202C9C71B943EF4BEC189@QB1PR01MB3251.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CKuFhlpuHgCkSaurn4wQ5I3NSZ5878y+PKU4Z5ySiaIJndoLC/LTz0avf86BlrpSV5oZFACVZ73u0ELjPoql7vOxeiBpb6YdzOPsLp61Qw2SPXYm3895mQQqjGr8fdVrA0tZMJ4HMq/WHG6tYuiUg/yGA6vPRvtiIk98NyzDgHAx69v8tnNpG6LPkG17lQZDKHB9UZBqtSCeOpjMtbQ+deoMgjTePvVAmZILp0DPX1cJW1pp8GK50Oxr/teznx424Y2Zns8RBLRPStFHOAiz76AgmMKPre2uZIlWBfHkyKmfkM2q2a/vTEUgjnI+hq+nqHidhD13E0bIinOTNAmq460P+fEp8gZm4Q9qXg22Wx+9KbrW1Mv/P920cjhWCICNtotqg6mljq51Yyo/DZtFahKKZdM4pOoIqPvZ6w2y+BQ4yVoVvDZPYS/93T1HpFPF7J6KiITxu6o/6kZRJz0hIp2H14YFAeeZIbo7hhAs/Y508vLtqpOQ0VLMdRCtoOE85+g6VXyPP5prs3eTCnPDlvZ3UlmwxqR/UWZ+gdG4PQaQe1i8fuZXiv6MJJiGQSggn+p81JfUQ4VhkWK8fehXT2XI7N+DV3I959TBVnscWEr4aQ8Ip2s1rWLXyBeLcXBAePnV7gVzGmoI6Y13Jpis9kZiasLWyGYVH5X5H8ZXcPFG89xIFtLEVPXyrCbmBywx29WX0Yr35mYuseDuekT57oYFBXgf1pW7A6dsZY9JSrsYa+RtMXegNcO2mx4nA7c4IpjfhJAEcTqK82b5t9H2av6B/ufzhQyggMNHnl/viEbxQ7BscrIqjMU457BlGDFB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(39850400004)(396003)(36756003)(38100700002)(6512007)(8676002)(71200400001)(316002)(6486002)(26005)(66476007)(186003)(66556008)(76116006)(66446008)(6506007)(122000001)(66946007)(64756008)(54906003)(8936002)(91956017)(4326008)(6916009)(5660300002)(15974865002)(44832011)(2616005)(478600001)(86362001)(2906002)(99106002)(18886075002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFNNUE9mdFB2NjRUSXpxaFNUZTVsY003VlhQN2dDeEZDbmxWY3FSZitZanY4?=
 =?utf-8?B?V2JFNXJ6Vlh1TVpYdGlNbWxsa2NVL04xKzF0YjYzb0wyck9RRWh0aUF1Um84?=
 =?utf-8?B?ditYbWVCOEdwdkdoV3puRHNNMklnZUk3REJ6WUM3YnhXRjZCZUtiNmc3L1VQ?=
 =?utf-8?B?K0xpMXMxcnR2cWtPdzRrM3FiWU1uNUdJOElGVWlaWTFVOFpFQWVRdUVUeWov?=
 =?utf-8?B?b3F3RVpVSjNTNXZzRWZnK25MSWk2U3Q0VjlXZ01oQTUzRVR4VTVvRWNHcHlj?=
 =?utf-8?B?dDJJcVBEMGJ5NFNDK29xdUp1WWdQRWVUNUVpWW53OWlUOEZKRVNqSVdIRWlu?=
 =?utf-8?B?WDlxSXhyc1hRb0JWM0RhbWgxdzg2VWprakRybWZPRStWUE5xOFNTWi9jOGkx?=
 =?utf-8?B?aTE5VDkrZVpTKzd5cWh5WmV0ZW42WGNmUUowTUxCVXpIUk9wQmpVemhCblpK?=
 =?utf-8?B?MFdmUUg2aklCcy9hNWZ0YlR2QUZtNmQxYStMNGFldWo1OWRDK3V5TCtQdDc0?=
 =?utf-8?B?bFhMaEFiUGxuR2VJQXJ4MnpweFpjcGNJQ1RuNC9vT2hPL2pEaWxSSmdnakdI?=
 =?utf-8?B?N2tlWkxNWnBxb2NnYi9aajNqUk44VEtodW5IaDZPd0s2akNUVnRkTnBVMGNr?=
 =?utf-8?B?ZlRMSm9BYWl0VXNGbk5kcGdNYkUvNDY5NzRrbkdhVkVWZGx2MkpZSTY5UVJP?=
 =?utf-8?B?Q3ZqOG9LVzc3NDR6aE0zU3lvVnlYNGtPNUtzZDlZVW12Q2xCUGJscmJFem9n?=
 =?utf-8?B?UVMyeHFmQkZkYy9QY21BSE1oVnN1emJrTEg0VDd5YlhMcHpqYXpHenFZK1BX?=
 =?utf-8?B?T3BLZG5yQ1A1cHpYVWI2SDFST3BzeWNQZGxQL0FIcFJCVTU1bHZQaWlGSE45?=
 =?utf-8?B?NlJBT1Q0dXB1YU9HRW5BMFo1VlJDa2pkMXNCanVUSTFFM2s4ZjdhSWFoVTNh?=
 =?utf-8?B?SzVzSXVCNnVoWTRPSzlwSTFneGU3amo1SHU4eXFxS2N5RTI2eEdyUE1VdEYx?=
 =?utf-8?B?WFU4b3J4Qkx6a050cGhacTF3c3o5N2VXMTZtaXJRRENBZU42VFVSMWQrQ0pL?=
 =?utf-8?B?V3dTeXNvYlpTTEtpcGowVk0wWWVQcEZEeENhblVQRDdhbHpzay85WTJaOGhT?=
 =?utf-8?B?MVBUbGNxSzJRMUNYSTk3cWh0SC9STy9mQ01XUHp1Ly9nc3dtcE1BYW9uelVS?=
 =?utf-8?B?eThVMzRXL1MrNkYzcXNtbHkrcEJDelNuN2ZkMDhsd3crbi9CMGhickFRQzZv?=
 =?utf-8?B?UzNRaUxrWng3QXA4K2NsVmg1U2hkZEdseVlrQkgwQnlTNW9lRDIrVk03d0dx?=
 =?utf-8?B?ZUNSbE5NaXFHQW80WkEycGpSSnVNenRDam9WY0ZzUHFEK1E4eno5eWU4Z0Nw?=
 =?utf-8?B?R1NRY0k4WjdQeUc4bXVtdWx2UWJXSUhvaitKSS9OL2VmbXo0TlNBbHZKV0ZJ?=
 =?utf-8?B?UGFnUEFPMXBoRzlhWWFkenoyTDVDN2UxL3dWL2NEMi9sTlc2eUlFMUhDZ3ph?=
 =?utf-8?B?MzN2anBZSDlGVnRzL3RjNjJWd29GZzlHcEdjcnowdnJnbUpjR2hKZ1NiSWN6?=
 =?utf-8?B?OGxXU2QzdjBKSC9rTWlycWRWQXlHclpXcWdXK0hpL252NGQxM0dVL2VVNGdQ?=
 =?utf-8?B?RE9qVlUyMWFzaTBEd1VNRFJLZzhHNndRWHlOTitIa2laNGxnYm5wSlRQeWRq?=
 =?utf-8?B?VkpFNWJ1bVpZZmRYQXQyZ0Yza010eHZOSi9Oa2pYMUVIWjhWUE5iL1BrVlR6?=
 =?utf-8?B?Ynp4NE1PcWpZN1FWRTFWdTFIbEFGYzNQTGFpaDJPdGgvK3dMa1lmcUp1TU1y?=
 =?utf-8?B?T3NxRm84anFnNTdUeVViQT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F9E7EE7E1968B428CD493BC45015B24@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e70f31e-8c06-4cef-fa7e-08d94317aa92
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2021 20:25:17.3897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IIyvXBaS+R/fnLJgB4v1i92sO4bwRRznUs+6JlZGQ75Rl1PYeFLVTwADdvPS2gZ0RqfjNrh/M25zaLgP0Hs9wHuADTy4RUnsnpJMFiO3lvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: QB1PR01MB3251
X-Proofpoint-ORIG-GUID: vtEKdZUD8PUH3kym3j8ESgkwfuIABx0l
X-Proofpoint-GUID: vtEKdZUD8PUH3kym3j8ESgkwfuIABx0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-09_15,2021-07-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107090101
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>
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

T24gRnJpLCAyMDIxLTA3LTA5IGF0IDE5OjAyICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBGcmksIEp1bCAwOSwgMjAyMSBhdCAwNTowNTo0N1BNICswMDAwLCBSb2JlcnQgSGFuY29jayB3
cm90ZToNCj4gPiBPbiBGcmksIDIwMjEtMDctMDkgYXQgMTM6MzggKzAxMDAsIE1hcmsgQnJvd24g
d3JvdGU6DQo+ID4gPiBGb3Igc29tZXRoaW5nIGxpa2UgdGhpcyBJIHRoaW5rIHRoZSBkcml2ZXIg
c2hvdWxkIGJlIGFibGUgdG8gZmlndXJlIG91dA0KPiA+ID4gdGhlIHJhdGlvIGJhc2VkIG9uIHRo
ZSBjb25maWd1cmVkIE1DTEsgYW5kIHNhbXBsZSByYXRlLiAgRm9yIHRoZSBtb3N0DQo+ID4gPiBw
YXJ0IHNldF9jbGtkaXYoKSBzaG91bGQgYmUgYSBsZWdhY3kgdGhpbmcsIGl0J3MgdmVyeSBtYW51
YWwgYW5kIGhhcmQgdG8NCj4gPiA+IHNlZSB3aHkgYSBzeXN0ZW0gd291bGQgZG8gc29tZXRoaW5n
IGRpZmZlcmVudCB0byB0aGUgb2J2aW91cyByYXRpbw0KPiA+ID4gdXN1YWxseS4NCj4gPiBQb3Nz
aWJseSB0aGUgSTJTIHRyYW5zbWl0dGVyIHNob3VsZCBiZSBpbXBsZW1lbnRpbmcgc2V0X3N5c2Ns
ayByYXRoZXIgdGhhbg0KPiA+IHNldF9jbGtkaXYgdGhlbj8gc2ltcGxlLWF1ZGlvLWNhcmQgc2Vl
bXMgbGlrZSBpdCB3b3VsZCBhbHJlYWR5IHByb3BhZ2F0ZQ0KPiA+IHRoYXQNCj4gPiB0aHJvdWdo
IGludG8gdGhlIENQVSBEQUkgaW4gYXNvY19zaW1wbGVfaHdfcGFyYW1zIGFuZCB0aGVuIGl0IGNv
dWxkIGZpZ3VyZQ0KPiA+IG91dA0KPiA+IHRoZSByaWdodCBkaXZpZGVyIHZhbHVlIHRvIHVzZS4N
Cj4gDQo+IEkgdGhpbmsgc28uDQo+IA0KPiA+IFRoZSB0cmlja3kgcGFydCBpcyB0aGF0IHRoZSBB
dWRpbyBGb3JtYXR0ZXIgKHVzZWQgYXMgdGhlICJwbGF0IiBjb21wb25lbnQNCj4gPiBoZXJlKQ0K
PiA+IGFsc28gbmVlZHMgdG8ga25vdyB3aGF0IHRoZSBtY2xrLWZzIHZhbHVlIGlzLiAoSSByZWFs
bHkgZG9uJ3Qga25vdyB3aHkgaXQNCj4gPiBjYXJlcywgSSB3b3VsZCB0aGluayBpdCB3b3VsZCBq
dXN0IHB1c2ggZGF0YSB0byB0aGUgb3V0cHV0IHN0cmVhbSBhcyBmYXN0DQo+ID4gYXMgaXQNCj4g
PiB3YXMgYWNjZXB0ZWQsIGJ1dCBpbmRlZWQgaXQgZG9lcyBoYXZlIGEgcmVnaXN0ZXIgdG8gc2V0
IHRoZSBzYW1wbGUgcmF0ZSB0bw0KPiA+IE1DTEsNCj4gPiBkaXZpZGVyLCBhbmQgaWYgaXQncyBu
b3Qgc2V0IHByb3Blcmx5IHRoZSBJMlMgdHJhbnNtaXR0ZXIgZG93bnN0cmVhbSBzZWVtcw0KPiA+
IHRvDQo+ID4gY29uc3RhbnRseSBnZXQgdW5kZXJydW5zLikgSSdtIG5vdCBzdXJlIGlmIHRoZXJl
J3MgYW55IG1lY2hhbmlzbSBmb3IgaXQgdG8NCj4gPiBkZXRlcm1pbmUgdGhlIHZhbHVlIHJpZ2h0
IG5vdywgb3IgaWYgc29tZXRoaW5nIG5ldyB3b3VsZCBuZWVkIHRvIGJlIGFkZGVkPw0KPiANCj4g
R2l2ZW4gdGhhdCBpdCBrbm93cyB0aGUgTUNMSyBpZiBzZXRfc3lzY2xrKCkgaXMgdXNlZCBhbmQg
aXQga25vd3MgdGhlDQo+IHNhbXBsZSByYXRlIGl0IHNob3VsZCBqdXN0IGJlIGFibGUgdG8gY2Fs
Y3VsYXRlIHRoZSByYXRpbz8NCg0KSSBzZWUgdGhhdCBzbmRfc29jX2NvbXBvbmVudF9kcml2ZXIg
aGFzIGEgc2V0X3N5c2NsayBjYWxsYmFjayBhcyB3ZWxsLCBzbyB0aGF0DQphbGxvd3MgdGhlIGZv
cm1hdHRlciB0byBoYW5kbGUgc2V0dGluZyB0aGUgZGl2aWRlci4gSG93ZXZlciwgcmlnaHQgbm93
IHdpdGgNCnNpbXBsZS1hdWRpby1jYXJkIHRoYXQgY2FsbGJhY2sgaXMgbm90IGJlaW5nIGludm9r
ZWQgb24gdGhlIGZvcm1hdHRlciwgdGhvdWdoDQppdCBpcyBvbiB0aGUgSTJTIHRyYW5zbWl0dGVy
Lg0KDQpJJ20gdGhpbmtpbmcgc29tZXRoaW5nIG5lZWRzIHRvIGJlIGFkZGVkIHRvIGFzb2Nfc2lt
cGxlX2h3X3BhcmFtcyB0byBjYWxsDQpzbmRfc29jX2NvbXBvbmVudF9zZXRfc3lzY2xrIG9uIHRo
ZSBwbGF0Zm9ybSBjb21wb25lbnQocykgbGlrZSBpdCBjYWxscw0Kc25kX3NvY19kYWlfc2V0X3N5
c2NsayBmb3IgdGhlIGNvZGVjIERBSSBhbmQgQ1BVIERBSS4NCg0KTm90IHN1cmUgZXhhY3RseSBo
b3cgdGhhdCBzaG91bGQgYmUgZG9uZSB0aG91Z2ggLSB3ZSBjb3VsZCB1c2UgDQpmb3JfZWFjaF9y
dGRfY29tcG9uZW50cyB0byBpdGVyYXRlIHRocm91Z2ggYWxsIG9mIHRoZSBjb21wb25lbnRzIGFu
ZCBjYWxsDQpzbmRfc29jX2NvbXBvbmVudF9zZXRfc3lzY2xrIG9uIGFsbCBvZiB0aGVtLCB0aG91
Z2ggdGhhdCB3b3VsZCBhbHNvIHBvdGVudGlhbGx5DQpkdXBsaWNhdGUgc29tZSBzZXR0aW5ncyBh
bHJlYWR5IGRvbmUgYnkgdGhlIHNuZF9zb2NfZGFpX3NldF9zeXNjbGsgY2FsbHMgb24gdGhlDQpD
UFUgYW5kIGNvZGVjIERBSXMuIEknbSBub3Qgc3VyZSBpZiB0aGF0IHJlYWxseSBodXJ0cyBhbnl0
aGluZyB0aG91Z2g/DQoNCi0tIA0KUm9iZXJ0IEhhbmNvY2sNClNlbmlvciBIYXJkd2FyZSBEZXNp
Z25lciwgQ2FsaWFuIEFkdmFuY2VkIFRlY2hub2xvZ2llcw0Kd3d3LmNhbGlhbi5jb20NCg==
