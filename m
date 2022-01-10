Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E6F489F48
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 19:30:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90FE718C4;
	Mon, 10 Jan 2022 19:29:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90FE718C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641839399;
	bh=pIW8uoMLPVcDUtgfNtQEvn3i+HQHCOM+kR1oW7xIjpk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LOUlqumx7EfVqLeUv8y2hmgTHheB3UzTaGMFU4ioNN7FIm1hb4cfaQwvOfqJFKkuD
	 DiXzPW5FTs7QIXXKEeOUHtrj7UvaPOjD2eopGd9i2hOAjfKhAR7x7fI2kBfkeFnsWg
	 Z7DDOMyvq7Q4OdabBCSluQf7secLrLLnlO6n38CQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 015EBF80054;
	Mon, 10 Jan 2022 19:28:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92179F8012E; Mon, 10 Jan 2022 19:28:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com
 [67.231.159.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3803F80054
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 19:28:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3803F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="tFdLC4aW"
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AI5aX8017510;
 Mon, 10 Jan 2022 13:28:38 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2052.outbound.protection.outlook.com [104.47.61.52])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dgjrs8aue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 13:28:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDTWqVK/oRhVTMHofKeMvRIX+A7rqWukhU4v88pBNrAmMeXGr4hc26iZ557Ss7IP38YNwfVrZw1Gnu9LI+P7QPxSgJh9E/49NIUOPsJVvgj3sVOqwPeuxtaNpU4x2YYyzndBcZGcAFsTCY2d4WZD66Jt7JcXjwyzG1lXPZR0HYolHDc0oSaiwieHPPZpOdHeLS0rF4pjZ5U1T2VaQvV66j5zW8fL8D7jXxqoqGvWeUbPYIMT1n8JyzCU8hIirM8KacTTAUqj1oAkmC8u8CGY2qLvLQJQG7UsQJPbocTVzOUXYzvWsx5/oASSr4+sqwf1N/IhIBSyMRzfjz219cRvMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIW8uoMLPVcDUtgfNtQEvn3i+HQHCOM+kR1oW7xIjpk=;
 b=h67JV+74ljXJEKhBhSJ15vkkWyhmNUJZpvBv+HZuXjneIbM4hwphph/DEitTij3kUwA9BHNtyi1iQ0h7sVtjna1KkMKfPLvxW9pBPXV3UdDvpE5Jcxxlg0sHnA1CSPtcNqzBIXTiXv6RQ7fEJB6jRrNG29SmKYQmemHItn5uRdbOS9qiQgTp3N+4DqqMC51OP/djaCpB50yFSDirs+40EHj7oFkkkIYgEVzTRdatGq7VLn3EPKKgDMdepL33PUqnZvF1e0i3JFxIOqAUs1PoyAyu/zarM7KxoJ3/n5uYJH3W3bBvqrqhTCrxD6n9wLp9S64kjrpCd0m476bTzpNwJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIW8uoMLPVcDUtgfNtQEvn3i+HQHCOM+kR1oW7xIjpk=;
 b=tFdLC4aWE7nzIXOU90cfdApwWMidKzQDYAE0KuhWD5vXpDEy39yWSC6MJUxMPPNgOrNNjiG09EcUsZ+hm8CCXPcQFwRKomIP9/BizTNQsX9ON9zl4pov1LIBSoAJUmX3W4TokwfNs3TeioSC6IMRdE/3za1k9qiEQ+dv6vyZFnk=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YTOPR0101MB1755.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 18:28:36 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 18:28:36 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v2 2/6] ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk
 setting
Thread-Topic: [PATCH v2 2/6] ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk
 setting
Thread-Index: AQHYBBAwYl3tgsTgXkyND6y3hLRvxaxcWXUAgAA+LQA=
Date: Mon, 10 Jan 2022 18:28:36 +0000
Message-ID: <b45aa6b8f3aa443da90b561e579370a0255e7017.camel@calian.com>
References: <20220107214711.1100162-1-robert.hancock@calian.com>
 <20220107214711.1100162-3-robert.hancock@calian.com>
 <YdxGrApvHyPW1aii@sirena.org.uk>
In-Reply-To: <YdxGrApvHyPW1aii@sirena.org.uk>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acb134bd-b927-42dc-dc67-08d9d4670432
x-ms-traffictypediagnostic: YTOPR0101MB1755:EE_
x-microsoft-antispam-prvs: <YTOPR0101MB1755C2BA4DA262B1D4FCA258EC509@YTOPR0101MB1755.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x3F0eIKIoNehen6iqZcicE20lx1N/xkC7VM9ETdLerX1fJw4ncStXqL1KOgAwemts2zNBxjkRr6joxOUzd7vjdbO7W/DBQ21EXOUUTD6fjwXahVkcoWPfPuNaQliC5+JW/kH8baKgZxtrGlXFisZN/ugOnW466B2YLtt6NcHEnqaZ3T7lyaZoGpSffqUC51uM2AfSLi3YxtAVSAzODZUtPr3TuJdnouh38wASgHV7+frc4pm6sCGia1piNw6d7yOewIt1B90PZe5N+InfM4tr2F0y4msn0+Oaxb+PS9Z9EeybW40DcrK0TquLzN+6sOmM2UDP89OUgbFD13PlXkeQV7zmXiOAk1cuTtmI+4QT8XTu+1636adJR1SjaxwAT+8h9PL5oP7N8l6ylwOgmUYE4CZVQbtm94ppb3nnn9ZSCBMvgXDytMOoJ/AgxybafTvfmfEwQqIyISXjgV7ZdAnFDyu/BHTYTcsjEL52c2FIIwu/1Un0DdOg0HgqWYX84Iq9S9NRo32Yh1LdBXRhu35Sy411strdR7Xn8MgyyEK49NpdjQbe7p7wvMp2nA591LVirhiYsjyap/GRRWXiXB0HAoZvrQUXH7NEKI8zDdd7iRQDot4yrynKBls4ppMaiswO12i/Mw8UWgxchEa04vaXuNHxIGEwiOKInkzbdOJs7fM7J3vLT3RxvnlOoPE/upOtLcHtAIxMIRvVmR6Y/W++flg3kcoEiNLeJjlaiMjGgE7lWeZws98yg1X7NIh1eeFencqVK5MRlAbyQF4kVG8dqkTurzHFkZ/WKFqCxmy1yiqwhHxXbHvtzb27M4C87cprnHY62JwN9zrZ6iawQHB0q4ezIfw89qeCeKjzwuhruM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(44832011)(6916009)(71200400001)(6512007)(54906003)(38070700005)(4326008)(66446008)(38100700002)(76116006)(66556008)(66476007)(2616005)(2906002)(6486002)(66946007)(91956017)(122000001)(86362001)(8936002)(26005)(15974865002)(8676002)(83380400001)(186003)(5660300002)(508600001)(64756008)(36756003)(6506007)(99106002)(18886075002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUxQNjhQaStzTlBsTUxxU0p4aFhENFF3aWtKUi9YMFF6dTNxNTdnWnV1KzlO?=
 =?utf-8?B?eUIzR043cENCT1BLOVRtZHJxa0Q2M0F3dWFVWTVCQi9nVGgrTTJ0MFJLNjNO?=
 =?utf-8?B?OTJkbDhlZHB3Q010bzZMY2JzaWtVTlNpUlVEbnkyZWxxZk8yazBjZ2RmTWpL?=
 =?utf-8?B?OTdWdS9lWUtuY2RFUWpDUmNtemorcDJzVlBFT0pzTS8yZzJsUk4xckIrYWtX?=
 =?utf-8?B?V3BEVXcreFhDcjYrNE1vLzJ1ekpJVGc1Qk0zcnc5S1Bla05icXBRNWZyN210?=
 =?utf-8?B?Sy9RakcxMm85QnI1YmJxbHFEWWxpZ2FodExieGMvMWtYRkVkVkpWUG5uR1dj?=
 =?utf-8?B?Y2RsK1FTYUpVNy9LUkF4TGJGVmh4c3ZxQlZJUGFiekNacUVBOXNwcVVTVm0x?=
 =?utf-8?B?dDhiWTlZeDBycEpNUy9rVXhmRWxYVmFSQTM3SENDanMxKzZBTmFSa2V1c01V?=
 =?utf-8?B?NHo3NjlUSXlnVUhPSE9GMEh2cjVlN2RJTHhac21ob2xJQitpWjdmM3NxTFhs?=
 =?utf-8?B?SzBML0Rlc0F2MkhqdjZFb1I5NHkvS3NyeVZTYVFmUDhGcE5ORXU5WUhzelAr?=
 =?utf-8?B?SjREamNmaDFMQ1g5aVA0d2kzMEE4U3Vjb0grNVFpQlRuYlFlKzJJQ3ZaOHhX?=
 =?utf-8?B?dTIyVzltOS9laDE0cno2T1kyUHVFNlo1b0pYSzBPQThhY0I4UFNPUkE2bEJL?=
 =?utf-8?B?M044Ky9TZXQvUlNLanRIQkM3cE9Jdis1MFBWM1JQZDA5RkZWRU5WSzFLWXBi?=
 =?utf-8?B?QnhURDhHYVJWcU16NWZ6NVRkYjN2My9qU0h1eGJrckR3WVAzREdHN1p2aFpw?=
 =?utf-8?B?NHVDVUFrakpzZVlaL2V5NHZ1UFlZZVQ4ZWVmRm0xc2IvU0l3Z2lDTFZOelRC?=
 =?utf-8?B?UysxNUN3WUpodk0reStGRnFWN2ZGMlJ0ek0vYXRoaU9Qd3A1YUhLRklmeGlU?=
 =?utf-8?B?cmZEbmZIbzNHdStXcVdUZlQzbE0waDhycDgxeTlLLzhxRkZYNDFYQi9oT05V?=
 =?utf-8?B?ckxwSW9UT05WRWo0anJmRXNOUG8xcDJlTUEvdWhtRmUxelEvQzRsK216SVdR?=
 =?utf-8?B?cm5teDYwRitOVWtobDVtZzZFKzBmaUhQdVBscFVVKy9Xa21VTzFYVUVqWjRX?=
 =?utf-8?B?RXNsUU9sTlVuQW5UeUlFT1V6VW9uK2dnT2xtZDFHbm1NVC9pQXBnN1dpODlO?=
 =?utf-8?B?dndISUdBSWZiL2ZpYWhnaktabFpzYlVYTi9XemcyNEhQR0Ftb0Q4Y3JMOW1h?=
 =?utf-8?B?elZkd1NYajNHOHZhUDJIWHVTTWpnSWlDYW4zWjJ0dFlMT3JPb3ROb0t2cGQ0?=
 =?utf-8?B?U1VnaWRrVkNpZDh4NXZMaHczaThrWGYwclhpOEtuK0krd2tyRTYzZTJvTXZr?=
 =?utf-8?B?RlA4MFg0R3hHZHlFOUZkV0pNWkJVeVVRVlJQdjNUUFllanhqUjhybkVuZk0w?=
 =?utf-8?B?MkpLcmgzWklMcXY5SnFxR3hVNHJhQ0R5RHpDb1g4REdsbitndzBrWGMwMUky?=
 =?utf-8?B?UzZZT2xodU1OdzlRc2tIMngzTmw1RERXSHo4M3hPclFGU1JxZVBjVmhFSklB?=
 =?utf-8?B?TmJaNG9CNnc5M0pzWFRRejRhY212QUtybTJOVGI1Z0dEdmY3NVJ5STRlMnky?=
 =?utf-8?B?Vm5ZczNwQ0Z4d2RPRzRrQW1XS2xTYldvQzQybkovNVpHbjVEbm1FblBxVFRt?=
 =?utf-8?B?NnlNNUo3eCs3d1NQUzJMc3V3U3VHdVBxMld4VmNoYXM2WVpSM2VsT0h4WlRo?=
 =?utf-8?B?ZTlid2FhemVsczg1N0ZZQzhWQ3lxekdja3U4WkJCZjQwR0Y0OHljTmphZmU5?=
 =?utf-8?B?VHJydGNqTytiSWVTdmNMRzc1TjUxTFBnTWVtd2l5M0RQYnNKWk1rV2JRME5N?=
 =?utf-8?B?Ti9KbE9FU1k4UkRaM1hkc0lRdUlraklQWUN0UjNsbHBENFR6b21rQTRFcVMz?=
 =?utf-8?B?OStGaStzaU42RnMwd3ZkSkw3RW45VTZoODJMUkx4YlErMWpndFJtWHdxVFl3?=
 =?utf-8?B?d1RzeWord2dsRFdsQzJVdWZORXFyb0I4dlVaanpSR3FvMEQ5YmZkT0MxKy9x?=
 =?utf-8?B?YnhNNnNORER3anFJT2FhMjc1N3k4ekdycEsyLy95K3NGWG5FQkZZbnU4UGpM?=
 =?utf-8?B?Mkx4ZVg2REU0RHlUM3JVSVBuTTVNSjN2bElhbDlFUTBDN05rMUFHcC9XMEF4?=
 =?utf-8?B?b2FzQ2V3dFVGZkltb1F2M3JWUmwzR0NKNWxLelAwNG9QZSsreXZrb3JZNW5z?=
 =?utf-8?Q?sewm6vsxkP0B5bJnrfleiX/8M0GP7WY5qETmKYMVWM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF9B279FF105A3419E921BB9926BEBBA@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: acb134bd-b927-42dc-dc67-08d9d4670432
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 18:28:36.6173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iCpO/plTgeyKNoCPSxOPGWA/0wEn0XrBDXIufMk+V8Zv/B16Epv3zwCvZvPq+k+ZfWqvA9Ur/Jy9WheCiFGaTpBtYLhXBN9VQCsRZKdziJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTOPR0101MB1755
X-Proofpoint-ORIG-GUID: Swl9lmI-rbY4bJe6tnmUelxIqJDwzqYz
X-Proofpoint-GUID: Swl9lmI-rbY4bJe6tnmUelxIqJDwzqYz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_07,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 mlxlogscore=910 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100125
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "maruthi.srinivas.bayyavarapu@xilinx.com"
 <maruthi.srinivas.bayyavarapu@xilinx.com>,
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

T24gTW9uLCAyMDIyLTAxLTEwIGF0IDE0OjQ2ICswMDAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBGcmksIEphbiAwNywgMjAyMiBhdCAwMzo0NzowN1BNIC0wNjAwLCBSb2JlcnQgSGFuY29jayB3
cm90ZToNCj4gPiBUaGlzIGRyaXZlciBkaWQgbm90IHNldCB0aGUgTU0yUyBGcyBNdWx0aXBsaWVy
IFJlZ2lzdGVyIHRvIHRoZSBwcm9wZXINCj4gPiB2YWx1ZSBmb3IgcGxheWJhY2sgc3RyZWFtcy4g
VGhpcyBuZWVkcyB0byBiZSBzZXQgdG8gdGhlIHNhbXBsZSByYXRlIHRvDQo+ID4gTUNMSyBtdWx0
aXBsaWVyLCBvciByYW5kb20gc3RyZWFtIHVuZGVyZmxvd3MgY2FuIG9jY3VyIG9uIHRoZSBkb3du
c3RyZWFtDQo+ID4gSTJTIHRyYW5zbWl0dGVyLg0KPiA+IA0KPiA+IFN0b3JlIHRoZSBzeXNjbGsg
dmFsdWUgcHJvdmlkZWQgdmlhIHRoZSBzZXRfc3lzY2xrIGNhbGxiYWNrIGFuZCB1c2UgdGhhdA0K
PiA+IGluIGNvbmp1bmN0aW9uIHdpdGggdGhlIHNhbXBsZSByYXRlIGluIHRoZSBod19wYXJhbXMg
Y2FsbGJhY2sgdG8gY2FsY3VsYXRlDQo+ID4gdGhlIHByb3BlciB2YWx1ZSB0byBzZXQgZm9yIHRo
aXMgcmVnaXN0ZXIuDQo+IA0KPiBUaGUgZHJpdmVyIHNob3VsZCBiZSBzZXR0aW5nIGEgY29uc3Ry
YWludCBmb3IgdGhpcyBpZiB0aGUgc3lzY2xrIGlzDQo+IGNvbmZpZ3VyZWQsIHdlIHNob3VsZG4n
dCBlbmQgdXAgaW4gYSBzaXR1YXRpb24gd2hlcmUgdXNlcnNwYWNlIGlzIHRyeWluZw0KPiB0byBz
dGFydCBhIHBsYXliYWNrIHRoYXQgd2lsbCBmYWlsLg0KDQpTbyBhcyBmYXIgYXMgSSBjYW4gdGVs
bCwgdGhlIGN1cnJlbnQgc2l0dWF0aW9uIGlzOg0KDQotT24gaW5pdGlhbGl6YXRpb24gZm9yIHNp
bXBsZS1jYXJkLCBpZiBhIGNsb2NrIGZyZXF1ZW5jeSBpcyBzcGVjaWZpZWQgaW4gZGV2aWNlDQp0
cmVlLCBzZXRfc3lzY2xrIGlzIGNhbGxlZCBvbiB0aGUgREFJIGJ5IGFzb2Nfc2ltcGxlX2luaXRf
ZGFpIChjYWxsZWQgYnkNCmFzb2Nfc2ltcGxlX2RhaV9pbml0KS4gSG93ZXZlciwgaXQgZG9lc24n
dCBhcHBlYXIgdGhhdCBpdCBpcyBjYWxsZWQgb24gdGhlDQpwbGF0Zm9ybSAoeGxueF9mb3JtYXR0
ZXJfcGNtIGluIHRoaXMgY2FzZSkgYXQgdGhpcyBwb2ludC4NCg0KLXN0YXJ0dXAgZ2V0cyBjYWxs
ZWQgb24gdGhlIERBSSBmcm9tIHBjbV9vcGVuLCBzbyB4bG54X2kycyBzaG91bGQgYmUgYWJsZSB0
bw0KYWRkIGl0cyByYXRlIGNvbnN0cmFpbnRzIHByb3Blcmx5IGF0IHRoYXQgcG9pbnQuIEhvd2V2
ZXIsIHhsbnhfZm9ybWF0dGVyX3BjbQ0KaGFzIG5vIHN5c2NsayBzZXQgYXQgdGhpcyBwb2ludCwg
c28gaXQgY291bGRuJ3QgY3VycmVudGx5IGVuZm9yY2UgYW55DQpjb25zdHJhaW50IGJhc2VkIG9u
IHRoYXQuDQoNCi13aGVuIHRoZSB0b3AtbGV2ZWwgaHdfcGFyYW1zIGNhbGwgaXMgbWFkZSB3aXRo
IHNpbXBsZS1jYXJkLCBzZXRfc3lzY2xrIGdldHMNCmNhbGxlZCBvbiBldmVyeXRoaW5nIGJ5IGFz
b2Nfc2ltcGxlX2h3X3BhcmFtcyBwcmlvciB0byBod19wYXJhbXMgY2FsbHMgb24gYWxsDQpvZiB0
aGUgY29tcG9uZW50cy4gVGhlIHN5c2NsayB0aGVyZSBpcyBiYXNlZCBvbiB0aGUgZGV2aWNlIHRy
ZWUgbWNsay1mcyBhbmQgdGhlDQpzYW1wbGUgcmF0ZSB3aGljaCBtaWdodCB3aXBlIG91dCB0aGUg
b3JpZ2luYWwgY2xvY2sgZnJlcXVlbmN5IGlmIHRoZQ0KY29uc3RyYWludHMgZG9uJ3QgcHJldmVu
dCBzZXR0aW5nIGFuIGludmFsaWQgcmF0ZS4NCg0KLUluIHRoZSBjYXNlIG9mIHhsbnhfZm9ybWF0
dGVyX3BjbSBhbmQgc2ltcGxlLWNhcmQsIHNpbmNlIHN5c2NsayBpcyBkZXRlcm1pbmVkDQpieSBz
YW1wbGUgcmF0ZSB0aW1lcyBtY2xrLWZzLCB0aGVyZSdzIG5vIHdheSBmb3IgdXNlcnNwYWNlIHRv
IHZpb2xhdGUgdGhlDQpjb25zdHJhaW50IHRoYXQgdGhlIHNhbXBsZSByYXRlIGRpdmlkZXMgZXZl
bmx5IGludG8gc3lzY2xrLg0KDQotV2hlbiB0aGUgUENNIGlzIGNsb3NlZCwgYXNvY19zaW1wbGVf
c2h1dGRvd24gc2V0cyB0aGUgc3lzY2xrIHRvIDAgb24gdGhlIERBSXMsDQp3aGljaCBlbmRzIHVw
IHdpcGluZyBvdXQgdGhlIGZpeGVkIHZhbHVlIHRoYXQgeGxueF9pMnMgaGFkIHN0b3JlZCBmcm9t
DQppbml0aWFsaXphdGlvbi4NCg0KRnJvbSB0aGF0IEkgY29uY2x1ZGU6DQoNCi1pbiBvcmRlciB0
byBhZGQgYW55IGNvbnN0cmFpbnRzIG9uIHNhbXBsZSByYXRlIGJhc2VkIG9uIHN5c2NsayBpbiB0
aGUNCmZvcm1hdHRlciBkcml2ZXIsIGl0IHdvdWxkIG5lZWQgdG8gZ2V0IHNldF9zeXNjbGsgY2Fs
bGVkIGR1cmluZyBpbml0aWFsaXphdGlvbg0Kd2hpY2ggZG9lc24ndCBjdXJyZW50bHkgaGFwcGVu
LiBCdXQgd2l0aCBzaW1wbGUtY2FyZCwgdGhlcmUncyBubyB3YXkgdGhvc2UNCmNvbnN0cmFpbnRz
IGNvdWxkIGJlIHZpb2xhdGVkIG90aGVyIHRoYW4gYSBrZXJuZWwgYnVnLg0KDQoteGxueF9pMnMg
bmVlZHMgc29tZSB3YXkgdG8gYXZvaWQgaXRzIHN0b3JlZCBzeXNjbGsgYmVpbmcgd2lwZWQgb3V0
IGR1cmluZyBQQ00NCmNsb3NlIHNvIHRoYXQgdGhlIGNvbnN0cmFpbnRzIGFyZSBoYW5kbGVkIHBy
b3Blcmx5IGR1cmluZyBzdWJzZXF1ZW50IG9wZW5zLg0KDQpBbnkgdGhvdWdodHMgb24gaG93IHRo
b3NlIHNob3VsZCBiZSBoYW5kbGVkPw0KDQotLSANClJvYmVydCBIYW5jb2NrDQpTZW5pb3IgSGFy
ZHdhcmUgRGVzaWduZXIsIENhbGlhbiBBZHZhbmNlZCBUZWNobm9sb2dpZXMNCnd3dy5jYWxpYW4u
Y29tDQo=
