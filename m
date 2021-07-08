Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3983C1A7A
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 22:19:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FC1B85D;
	Thu,  8 Jul 2021 22:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FC1B85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625775584;
	bh=+XrZD4t++2MQlE+YbqxtaSm+2Nl7dVExxtet9+Cc1p0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LX3Dm7QWxFdLWDUIE4vA9zufoseVkR6G1iu68NzwWEkbtWi5eHOdKWbFUiwljuve4
	 6zbcrrAkYVv3zRgTWUVyC4I9BJIp6N8KqkyrGYK1PFae7ZfiKgZs/U58wSB/hJAIST
	 xpuK0QGHJCi5zOtuT1RwDxCEkpC/IWM2q43lsznU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBF69F80246;
	Thu,  8 Jul 2021 22:18:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7BA5F80249; Thu,  8 Jul 2021 22:18:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com
 [67.231.159.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84B3EF80143
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 22:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84B3EF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="ZKvx+y9c"
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 168JR1DF031136; 
 Thu, 8 Jul 2021 16:18:04 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2055.outbound.protection.outlook.com [104.47.60.55])
 by mx0c-0054df01.pphosted.com with ESMTP id 39nybg8eec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 16:18:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0Y2VZPWIgiVvUrGK0/+okGIvUBazagMmzGOPOlYZ0/QIJmoHv0Hv631Wsfg342mWAKB2JWIMBxivso+jQnO9gRvtNNpjDCRV1CAv5JaE832cQaWNIIaTac5BGesZgv2W8oPaVw8qm6hDrHm7FL2O9UI05HgrlZY+1ycw+5UgqJYt8UXurHp9C/1Mwu8PVgq7uLdqkEQB+splelyKmvrzv9Mg7TU0MpcijOKBzmcgJKvf++UMQOFJRxmVS/Eib6hSdodT1G8B5StjWwU4dUsYovjpt4rD1XbL3Kk8M2BWoGysihJOR2UYOj6tv6WniS181LiUVlZHTKAvs3JqT4RnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XrZD4t++2MQlE+YbqxtaSm+2Nl7dVExxtet9+Cc1p0=;
 b=TEY7verVp481T91faOjQfsJcUz7NTHFbJ9sMx8eDhlrXoEllOBTrXPi5Ju6u9bICN8QjVTU5LBtnX1kaEunnG/gKD3zZDLnW2xQdE13jX0zsIG/9QpepIEfD5fOR2XxOsB8+OYtX9g+ylVYBetFb3w7nH5V3Ty/IqQq2rUKWBN1gaFNfu09U+X0DyKMenundxlNjSBxFHC8lcOWIshPCxjkphgsZvCoK9or10TxwpR+yoZyoW7afvmduAZQknf00F+6VcrxaJHhjVMCk4tv/vtaSJ13cd58bJbHqNOyqHQSuaz32LX2XptccPdPTXftyB7usS4DpL3is2px8sDoHjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XrZD4t++2MQlE+YbqxtaSm+2Nl7dVExxtet9+Cc1p0=;
 b=ZKvx+y9cxUmSYWuHj43Inxz2VhxhRVj03hTQPpzAZ1N8k92lAiVWOPRjzwMXvEjBtetek1Y2kplh9QmapIivVWIizq7a7lA7JmzguEzFSwAx24vqeVYwKyHYL/Srlru2x/iIso3NhLfR1hsVwdv8JJ2RjUevD8ldj0wphktbxs0=
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:27::23)
 by YQXPR01MB4407.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Thu, 8 Jul
 2021 20:18:01 +0000
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::88bb:860e:2f3a:e007]) by YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::88bb:860e:2f3a:e007%6]) with mapi id 15.20.4308.023; Thu, 8 Jul 2021
 20:18:01 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>
Subject: Re: Issues using simple-audio-card driver with Xilinx Audio Formatter
Thread-Topic: Issues using simple-audio-card driver with Xilinx Audio Formatter
Thread-Index: AQHXcsWHzh5VPmqBUEq1W5dwLNaiPKs2tqGAgAFyjACAAAU+gIABWLsA
Date: Thu, 8 Jul 2021 20:18:01 +0000
Message-ID: <2cccca32d53e1d832df67d070bac9ca998a931c6.camel@calian.com>
References: <6c7635f59ea9b162999f060334eef48e0812534b.camel@calian.com>
 <874kd63oqa.wl-kuninori.morimoto.gx@renesas.com>
 <52eda9910822e7e854b049127e462bf468f912ed.camel@calian.com>
 <87r1g91ygm.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r1g91ygm.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=calian.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c2aa4cd-607a-4aeb-3c63-08d9424d7c3c
x-ms-traffictypediagnostic: YQXPR01MB4407:
x-microsoft-antispam-prvs: <YQXPR01MB4407CE8A317E73097BCD1D17EC199@YQXPR01MB4407.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PthDitHxYOpvuom3eocHNJJkOyEkP9gq57pep14JE+WCvKCmdYodnWdfcI/woxHhzOnNtQnroA7XtplyIPvDlmMRKDJoawombf+6Mj90et1JFBx65h9pF15Pi688iyJQnvcIm2Qec5wka4UHHwZ51qbKw3W5bdYghVXyWL6lUuPmEsbYjZbc2gftBkIRGIIUzrFQG4RMpO750REFu/NYeDnp/ScR8Xy+/dZ3m5ZjTzRDdtDkhPDkukBB2wIM50gyzjKRYG+Js/fM5qi7qTFJg853lnurgwsN8vfMHIJTY+pWSdP36UQQZm1xkt3aJpI2aW2lsCQe2j/LAgcy2pvRaSjxXkliXy3ge9OFU8MzfMdu1JSilb9P5lnjHLMOnZOaxupHRZpUVH2NsdU0Kc+J4dSZakUzC3P3D4CI6cd8/gar+FIIn2+DAt7pAPjWqYMBQuaJ5mYiYgK7DrCGvYeBBJ2gh8pr0OmIzNjCK4nFGQL40pFducJNrZk0jVWMeVi4EPguyvEtv/mlrXe2BH1+/ccJjdlb8X0UhZxQv1fccQBQomX6tYq3/oJny8Dpi2fLS1PMO8g/02CCGb0lubnOae/LQpnu3Ibs7I0Ld6IY6hlCLMrKdC6XP2iP/d7mzD2BDa9Qg6T1WKJ92c3cRdaAycTrgazqSbEr2uZrfTiBGQ5OCe2PFS/KGsAfRbyBaCIxCK4vpwqpou8UzE3s4ykMZoEE6IhCLYZTl4Li2EMJ2Dlu9omqiXcfpq5WoM+dHhpR6eNZUbDh1mcf7LUsBxpKfIGQpod0Utt9JhT45oeS0poAGWZywanA3yR5JDR0gON6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(136003)(396003)(376002)(346002)(4326008)(83380400001)(26005)(36756003)(122000001)(8936002)(91956017)(38100700002)(66556008)(54906003)(8676002)(76116006)(15974865002)(2616005)(186003)(6486002)(6506007)(2906002)(6916009)(66476007)(6512007)(71200400001)(5660300002)(86362001)(64756008)(966005)(66446008)(66946007)(316002)(478600001)(44832011)(99106002)(18886075002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REFVd2M0M0s3eE44QlRTcFVzd3Q5cmpOeGl1enh2Y20vUkZJYjUzV1lITWx3?=
 =?utf-8?B?WnVJU1lHMjJhaWNKSldiejcxVG9Hc3hLdkRSc0xyd3lFODE5dnJQcXpGeEd3?=
 =?utf-8?B?ZldFY29sZVVBNzAxanB4ODlwdlV3QVdseFRmUHJadTZsREgwRXQvL3FwQlA5?=
 =?utf-8?B?Qnh1RkpQbGlNaGJUM0dQTlkxUzhScVZHQUdHUzRyeGxvdVlGNys4ckJnNDVI?=
 =?utf-8?B?UWE0ZGNnL2ZWMDZqRStuQ0VMV3Nuc1NLZ25qUU1BMGp6SjR2b1NteE9sWGxi?=
 =?utf-8?B?Y1NVQTZpSFY1V1RQU0RxQ0FKL1JkMGxBVWtSYnpsZmZHVnZnWEE3MUFpNFR0?=
 =?utf-8?B?SERLTDJJdC95WmYvY3IzQnNmYkhxOTdVSjVWSzh4WHh3WFROMFVuTDQ2dURi?=
 =?utf-8?B?bWVPMWU1WUlsRitwbmdGbzE3NzcvQnVxN2RUVnM1YjFOcVlhSUFOZ2xZTGpi?=
 =?utf-8?B?Y0hTOERLQWFjcUZYSDRjZWFGVWFXMkp6U0hZQ1NVb0lWSWFWVHRpUndXTmJH?=
 =?utf-8?B?T0gvWUNMT0hIcEN1YmVwSTRkSmJIKy9DMXI2SERvWDluMTlJL0xlY3JIeWFW?=
 =?utf-8?B?VmZtcGRmeTdxT0FvK2FhMWNZTWRGSGQ5SjVRUXZuSUJsVzFVdzFmbzAxVHBk?=
 =?utf-8?B?aDFCLzBoSmIwbmhuNmxDMjFqaDFYSVZXNDVmL25SbWxRQnI5R3Y2akEzeWdO?=
 =?utf-8?B?YzE2MDNwUFFMejk4SFd2ekY0T3BLL3Z1NlZQUE1MNFYvb01rUXVvVXBURVY2?=
 =?utf-8?B?anNkbzBFNmFqM1NiSVdFZTNCWjhEVDB1SlNpb1h0UzR6enN6bWdzcC9iZnV4?=
 =?utf-8?B?MG5NQVRmKzRZN0JGdTdnUVhYSTNHSFJzV3RQOEY4OEhtS2JZeWtkYWxraDlR?=
 =?utf-8?B?OTdSMzcrVWMvWERtTndjRFcvRXpFZTVSNDZaYUczQjFQSDc0Y1U5ZE0veW5B?=
 =?utf-8?B?WWtuaGNncE41blI1Rzh0akNnaGd1VDRYZU1TT2p2WjJFODBKRmpKVWx2K2FS?=
 =?utf-8?B?RU5tQ09CNzdKWFdXVmFrK2ZNSGh4VzdZdm00ODR4NnV6empIbG9uUUNFQUdS?=
 =?utf-8?B?ZFVGc3lEdWpFcXhpbkJRSEJIRzIyRjE4OGhZbnFMK3N2MkRUOHFzZ3dDREtD?=
 =?utf-8?B?MGRERGMrWTVCSi9CditsNUI5UzBTNndiNi9LRk1PNGw5RGZ2Q2JYVCtva29x?=
 =?utf-8?B?YzBSR2lFSWxCZkNJeGo2aGZXRDhjR2ZTTW1pZ1UwRVVMVThjaXJzSDBQSnV2?=
 =?utf-8?B?NE5SakN2RmdFWUVVNHh5YXJQT0JhRDliSnlhV3NCbnM1N0FUZjIvYVNGemxM?=
 =?utf-8?B?bzdjeTFmcnJiaTRZUjE2RVl3QmNISEN4dXpIb0tMcDZWbnJaTHJmZG9IdDFr?=
 =?utf-8?B?UktGQXdmU3JqVVdmWnFkYkl6bVJqWWFJSEppNkRmSDl1QTNRMWpPTEJMQVox?=
 =?utf-8?B?cE5FVWorbXV6RnJ5MHExU2MwUzJWTGlxS0kvL0kxK3JjbmxLVUlscVNUMUd3?=
 =?utf-8?B?YXNZZ3lZLzdza2MvMXkrQUZBa1dxb2Q1dTdXSjdRWDNMcUI0VDFWQzdKdVcw?=
 =?utf-8?B?am1CdkhkalNJVGZpVjNJWU40Q0ZqY0tSeDJucCt2R3VDd25Nc0tpVFByV3ha?=
 =?utf-8?B?YUpTNG8wRCtwTFB6OVJyVDJIcjY0NW9xV0NXSnB5enBuOUJGWFJnWGZaWnds?=
 =?utf-8?B?VEJDdHd1S0RtTWZ6YkhQektHczF1N0xFaDlpUHJPVWROcnNTNjg4V1dURStJ?=
 =?utf-8?Q?T32MjXAPhpyPVJjSVnA022jrLTXvxIBbh5hgKwl?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FD0BF6ED352224180824EF44A7C077A@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2aa4cd-607a-4aeb-3c63-08d9424d7c3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2021 20:18:01.2937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 80b1rDtcAVWvT8iNx4PkRNsVBu1q+RHCQ/UYRP1RiO7SVPt4LFHA686in/5kRc9r+VSUNLQML7HUMtDKp+5BX4nQ2IYKp3gYXlvA0pDu1xU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB4407
X-Proofpoint-GUID: Xy7sK2yxZuMNSdUqXVmymxteJfMVX5Wi
X-Proofpoint-ORIG-GUID: Xy7sK2yxZuMNSdUqXVmymxteJfMVX5Wi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-08_11,2021-07-08_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 spamscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080103
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
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

T24gVGh1LCAyMDIxLTA3LTA4IGF0IDA4OjQ0ICswOTAwLCBLdW5pbm9yaSBNb3JpbW90byB3cm90
ZToNCj4gSGkgUm9iZXJ0DQo+IA0KPiA+IEkgdGhpbmsgeW91J3JlIHByb2JhYmx5IHJpZ2h0IC0g
SSBtYWRlIGEgY2hhbmdlIHRvIGJhc2ljYWxseSBpZ25vcmUgYQ0KPiA+IGZhaWx1cmUgb2YNCj4g
PiBzbmRfc29jX29mX2dldF9kYWlfbmFtZSBpbiB0aGUgcGxhdGZvcm0gY2FzZSBhbmQgdGhlIGRy
aXZlciBzZWVtcyB0byBwcm9iZQ0KPiA+IE9LLg0KPiA+IFBvc3NpYmx5IGl0IHNob3VsZCBqdXN0
IHNraXAgdGhlIGNhbGwgZW50aXJlbHkgYW5kIG5vdCBldmVuIHRyeSB0byBwb3B1bGF0ZQ0KPiA+
IHRoZQ0KPiA+IG5hbWUgZm9yIHBsYXRmb3JtIGlmIGl0J3MgbmV2ZXIgbmVlZGVkPw0KPiA+IA0K
PiA+IEkgaGF2ZSBzb21lIG90aGVyIGlzc3VlcyB0byB3b3JrIHRocm91Z2ggdG8gdHJ5IGFuZCBn
ZXQgYSB3b3JraW5nIHNldHVwLA0KPiA+IGJ1dA0KPiA+IG9uY2UgSSBnZXQgdGhpbmdzIHdvcmtp
bmcgaW4gbXkgdGVzdCBzZXR1cCBJIGNhbiBwdXQgYSBwYXRjaCB0b2dldGhlci4NCj4gDQo+IEdy
ZWF0ICEgTmljZSB0byBrbm93Lg0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGhlbHAgISENCg0K
U28gdGhlIG5leHQgaXNzdWUgSSdtIG5vdyBmYWNpbmcgaXMgdGhhdCB0aGUgTUNMSyB0byBTQ0xL
IGRpdmlkZXIgaXMgbm90IGJlaW5nDQpzZXQgcHJvcGVybHkgaW4gZWl0aGVyIHRoZSBBdWRpbyBG
b3JtYXR0ZXIgKE1NMlMgRnMgTXVsdGlwbGllciByZWdpc3Rlcikgb3IgaW4NCnRoZSBJMlMgVHJh
bnNtaXR0ZXIgKEkyUyBUaW1pbmcgQ29udHJvbCByZWdpc3RlcikuIFRoZSB4bG54X2kycyBkcml2
ZXIgaGFzIGENCnNldF9jbGtkaXYgZnVuY3Rpb24gZGVmaW5lZCBpbiBpdHMgc25kX3NvY19kYWlf
b3BzIHN0cnVjdHVyZSwgaG93ZXZlciB0aGF0DQpkb2Vzbid0IGFwcGVhciB0byBiZSBnZXR0aW5n
IGNhbGxlZC4gQW5kIHRoZSB4bG54X2Zvcm1hdHRlcl9wY20gZHJpdmVyIGRvZXNuJ3QNCnNlZW0g
dG8gaGF2ZSBhbnkgY29kZSB0byBzZXQgWExOWF9BVURfRlNfTVVMVElQTElFUiBhdCBhbGwuDQoN
CkluIHRoaXMgY2FzZSBJIGhhdmUgYSBzYW1wbGUgcmF0ZSB0byBNQ0xLIGRpdmlkZXIgb2YgMjU2
LCBzbyBpdCBsb29rcyBsaWtlIEkNCnNob3VsZCBhZGQgbWNsay1mcyA9IDwyNTY+IGludG8gdGhl
IGRhaS1saW5rIG5vZGVzIGluIHRoZSBkZXZpY2UgdHJlZSwgYnV0DQp0aGVyZSB3aWxsIG5lZWQg
dG8gYmUgc29tZSBjb2RlIGFkZGVkIHRvIHRoZSB4bG54X2Zvcm1hdHRlcl9wY20gdG8gZG8gc29t
ZXRoaW5nDQp3aXRoIHRoYXQgaW5mb3JtYXRpb24/IEFuZCB0aGVuIHNob3VsZCB0aGF0IGRyaXZl
ciBoYXZlIGNvZGUgdG8gdHJpZ2dlciB0aGUNCmNhbGwgdG8gc2V0X2Nsa2RpdiBvbiB0aGUgQ1BV
IERBSSBhcyB3ZWxsPw0KDQpUaGVzZSBkcml2ZXJzIG9yaWdpbmF0ZWQgaW4gdGhlIFhpbGlueCBr
ZXJuZWwgdHJlZSAoDQpodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2xpbnV4LXhsbngvdHJlZS9t
YXN0ZXIvc291bmQvc29jL3hpbGlueCkgYW5kIGluIHRoYXQNCnRyZWUgdGhleSd2ZSBnb3QgYSB0
b3AtbGV2ZWwgeGxueF9wbF9zbmRfY2FyZC5jIGRyaXZlciB3aGljaCBpcyBkZWZpbmluZyB0aGUN
Ck1DTEsgZGl2aWRlciBhbmQgaW5zdGFudGlhdGluZyB0aGUgb3RoZXIgY29tcG9uZW50cywgaG93
ZXZlciB0aGF0IGRyaXZlciBpcyBub3QNCmluIG1haW5saW5lIGFuZCBzZWVtcyBsaWtlIGl0IGlz
IGtpbmQgb2YgYSBoYWNrLiBJdCBzZWVtcyBsaWtlIHRoaXMgU0NMSw0KZGl2aWRlciBzZXR0aW5n
IGlzIHRoZSBtYWluIHRoaW5nIHRoYXQgaXMgc3RpbGwgbmVlZGVkIHRvIGdldHRpbmcgdGhlIFhp
bGlueA0KYXVkaW8gY29yZXMgd29ya2luZyBpbiBtYWlubGluZSB1c2luZyBzaW1wbGUtc291bmQt
Y2FyZC4uDQoNCi0tIA0KUm9iZXJ0IEhhbmNvY2sNClNlbmlvciBIYXJkd2FyZSBEZXNpZ25lciwg
Q2FsaWFuIEFkdmFuY2VkIFRlY2hub2xvZ2llcw0Kd3d3LmNhbGlhbi5jb20NCg==
