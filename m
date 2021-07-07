Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 935293BE028
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 02:19:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03B57165D;
	Wed,  7 Jul 2021 02:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03B57165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625617175;
	bh=JWt8V+91UG+VqwXTenIZB2ZMoms48XQo/tZbAU1xKJU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U9HF63C/h2fIw4T3LtuIVQevJbBL0a+NQlEDyfauTFZ0ZT9crS9fFGefc8czl/r6T
	 +VbTKR0hlP5XDblGmzG60y7tOnlOVRsBGyQ7K9SxV/Vv7dPW21woFtzp961XeO/Jak
	 o4Gd+1/LXAXEsVoV1aBzg6ogA6VJwLnFBaxzQSrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 817C3F80259;
	Wed,  7 Jul 2021 02:18:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5CA0F80249; Wed,  7 Jul 2021 02:18:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADE83F80134
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 02:17:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADE83F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="Lqq/FB73"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 166MPfVs001182; 
 Tue, 6 Jul 2021 20:17:55 -0400
Received: from can01-to1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2059.outbound.protection.outlook.com [104.47.61.59])
 by mx0c-0054df01.pphosted.com with ESMTP id 39myy2010y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 20:17:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W37SaoTbkhUDPkyPB26gBd514rGcSsCTqXzMYloMrxW4d3RY5TFs33hiaC8G2EJnIP3rt+Xw2/DEWxDKoZB6Ugvjyx/wsxEmbwMNa+tG8W0MdrWVZEkvs6gXapu17EsRXXW3lW5cw97esRIsu+uj9i62MJF0qIQRyjZHkNUyjKQxyfn7ieO3tNoL2zOeW2oTfAsg9JZYEPvgIhfy0P+hETAusIaPHHJab96P3uJHdmYuBV1Bt8qUWhy+Y0//hFjHSYEuAJbQ4W77gbUAa7i44Z+d3EpE3IMYRJCxPCffXnSM7ey3RLRGYTWhcXYn1hM5rfenl4q++vRLjsXbBMQtew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWt8V+91UG+VqwXTenIZB2ZMoms48XQo/tZbAU1xKJU=;
 b=fIW95AyU5oDziNzbfVPx/k/krGuJ+8KdpfyNMyzh2l/1ZoektwVBXYxUrXuke2Bde4BwPfhMDm4BsGlvEjJpns2P41ioQ/6FWJHFKO/7KkAbkw6mazXaBN+klSa9TTHILefPxGsb6byBABIFeUZN6Kliyd0bxz//Hb3tA9Oqe8Mex5OSK+I8uBhSAdnnPwYyPM/GCe+K28D4uEZ1SiZNDiiPxR6I2PQh/A9QXdEmBcc0yjEpgOwUPVWifDmYnBvxY8mF9DMYuzofRxGeG8n0w2IE1O1nHz9war/kx0vV4U/x9ujcMFORKA8fwAgN6rYfAhKd1crId+R2qNm+cNBkQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWt8V+91UG+VqwXTenIZB2ZMoms48XQo/tZbAU1xKJU=;
 b=Lqq/FB73FaOW5GaGbW6G3oS1IGa8t3fKThZcKfERJLeO4nPvbAQPxWQrnwmmJsShrzBJUb2n2RsCq1pjRKzVSJXNZBaUMQKOgiLBYMHYKk1DlXa3Jccdng2bKPi9BLFBREJg50Gn07GIX2OqqPYkP/MXWCDoEv3ttfwlTaPZNeA=
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:27::23)
 by YQBPR0101MB1393.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:9::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Wed, 7 Jul
 2021 00:17:53 +0000
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::88bb:860e:2f3a:e007]) by YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::88bb:860e:2f3a:e007%6]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 00:17:53 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Issues using simple-audio-card driver with Xilinx Audio Formatter
Thread-Topic: Issues using simple-audio-card driver with Xilinx Audio Formatter
Thread-Index: AQHXcsWHzh5VPmqBUEq1W5dwLNaiPA==
Date: Wed, 7 Jul 2021 00:17:53 +0000
Message-ID: <6c7635f59ea9b162999f060334eef48e0812534b.camel@calian.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
authentication-results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=calian.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffd22ad7-71c0-46de-2725-08d940dca9f4
x-ms-traffictypediagnostic: YQBPR0101MB1393:
x-microsoft-antispam-prvs: <YQBPR0101MB1393666AF6D0CC44F1EE1E46EC1A9@YQBPR0101MB1393.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AimenMCeFIMhASXm1kbsjcu80J2rmE1ueMFRnTBTRLL+cwfet9YZfio2kkVkQzVc1K5Bjd25feDzqXgdRlooBU8duk0OVPBKcFeqpMfBG9qmY6oSHOoitDBUGSnShOgeplKvCS39rgFY91rCltwDHa+jmGzpTy8j1LsFwVj5quAGVbhGIbnT1L7DCGVE73uQmuyrf6tk73cynyFWLJT5s5Mhmnkr0oGYDKFRqV2uXL5HphtA02gyvwd+a+Eigq6iRd4ElNatmHF4GoDlvmDSh8HXov7msUQTPkj64Ckn0ulIXrUxh/NKayuV1SAMUYcTv21ebS99IJE53Xw3A2XmieB59NcmGbYSIVRo5JOkT0dLDrIBDrfPo/zJONYUoT9qHXIYqLvNQzwU2PFMzwAiSChXcyiHHbrJAEuNqdrT64PJqtnFB3KZqsW2Vz3zFgJwxrCNHEdpTX40duJR5V/12UEfNZpRJmgmQ9am2etms0KldYu3B7M+9KL/3zq7Y66i2bfs80BC0tO3pB40zxrJqm5mhh5WJ/Q2QxSl05E8K+haj2pjfjMsMUU/lghcEUQ4UxIxOLM8foCIuPxaC6uTJkWS78tU3mKNohTJjVa4Z3du8C2WEUdHEjb+wuQa8Q/BeFyD7Cs50gtsgrmeTbvsIPRdvX2yJ+MimQ8di54fjxUia3SYOnLUxLMSzTCWX8lWdVYsGRv2NusF7J0YVla4QcoTcevwf5oP17351vrTPB897fI9zWlXzrblJBfJlQrQrHolNwmlrDuYjYRyVcc9XnIFRfbwNZnEaqv41YmS7EE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(346002)(39850400004)(136003)(186003)(4326008)(5660300002)(83380400001)(8676002)(6916009)(86362001)(91956017)(36756003)(44832011)(26005)(8936002)(15974865002)(6506007)(2616005)(38100700002)(66476007)(66556008)(64756008)(2906002)(66946007)(6512007)(478600001)(54906003)(71200400001)(76116006)(6486002)(122000001)(316002)(66446008)(99106002)(18886075002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VE5aSVJLblBqVS9nWjdQNmZUZnVHaVpMc3UweFJ0dXpJMjVSRVk3dVFZN0VT?=
 =?utf-8?B?VU96dVBvUmNaVEExQ1FIblFsYWxFakVwL2liZ2svV1RjRXdHWlpqZ0QvTXlI?=
 =?utf-8?B?YnNjQmhSb0xZSTZ0cHlGeENDQ2VsR0IxRUoyaEp4SXcwLytRYzk1Vi9hQlEr?=
 =?utf-8?B?N2wydVNZeVdueHhDaFJaRitXQ2Y1T3lvWDhxQXBaWHBhdXM3UnJWVXM5VWc1?=
 =?utf-8?B?aEZEdk1WdVN1TG1WbnFtWnFQck5Yc3FHd2pTVzZiMExFUWVXUm1WTEZGQXk2?=
 =?utf-8?B?ZHFpNlRuOC9UNC9HSXVQSURwaG44VzFXS1dwbVcreDJmRjlKVk1sRzY5dVZy?=
 =?utf-8?B?MEszcVkvb0dJNmprYUJYRmtWNUZoQWlXOTBXUlNPSHRmb3dNOVFHTWt2SytH?=
 =?utf-8?B?RXJHNm9IWXlGYW5RdnNxQlhLOXY5WFl5ZUNmNExzYnM5ay83MGJBbm5nOUg0?=
 =?utf-8?B?empzRXpkbEVzSU9QeTdJUnNMRDBobzhwVjQxQTNLRUZLY3dmWlVRMkZiOVZs?=
 =?utf-8?B?RWZmb2lGNGhlbitOdHVyTWwzY1hCN1I0SGpDSG40cW00V0owK1pmbGp0VGQy?=
 =?utf-8?B?OXFWU2Foc1QrUitqM1dIUEN4NERvQ1RITWVJaXJVRDFjMkl2aXYzS1RMWWRW?=
 =?utf-8?B?clV4c283MUd1b0VJRjFGcVh0NlNpNWF4M1hPTVZLaUdNUUUrQmMwa3ExVTdY?=
 =?utf-8?B?eEppSXVXZEc3eFhla2ZQek82R1JNY2xLTGlad01DZW5tK2paNkdJRTJSZlVv?=
 =?utf-8?B?c3ZSaHF4TUI0MHlQZnZLM0JZcGVFZXVIMXpBdlA3dkRsdnlxNlFuOE40MW1i?=
 =?utf-8?B?a3hqVjVRVWtVY1BtYmFHUFI3Vkt5Q3FyMUdWMDc2eGg3amQ1ZTlDZHNzakM3?=
 =?utf-8?B?dStrandtNFF0Q0cxOFRWa29CRVhlVGNlMHhUV1VweU1nQU1RTG5jMWtGcDdu?=
 =?utf-8?B?MEZzT3dGWFgxRW1oVmhNVDhWT0tDSDR1U2liaEJzNWFMaFpINlQrYXhNQzVa?=
 =?utf-8?B?L1pFZm4wNzdPMUZGWmJ6MEJNTU1kOElISVRoZ3pUNGlMdkNSVjA3RmdLTmMy?=
 =?utf-8?B?ZWU2OEx6dmpYNmZ5aWo4bzdKd1JydURsb05aMlc3TmNUQzZJQ1o4MzVzUVE4?=
 =?utf-8?B?VjFEWHZDRi91RExWQkRRemxmUHF0WjNHTEF0WDNuN3F6WEJGbkFkTS90azFv?=
 =?utf-8?B?RmNHc1YwTTAxVngzdWMyU2xDeExNTUYrbW10ZHNDT09qU0hINk5FMkZ6SG4z?=
 =?utf-8?B?N3NiejY4UGNvU0c4eXR5Zy8yck1mT0wxNXNvM1A0S211VE9TOG5KZFdSVVM4?=
 =?utf-8?B?Nkp5dkI2QkRLMFhZa3lJbFMzOHJjQ1A4QWNDajJGd3QyTEY5UVp3ODZ6VFIv?=
 =?utf-8?B?akVsR1VXemxVc1Iyb0twanJ1ako3WmxwdTZIYVdBMFNQSXJEMnJZRkJicnov?=
 =?utf-8?B?N3Y2QUJWMldRT2h1MXdVa2h4T0hQbnhLbURaOWhjbDVXQzN1bjdyMVJWMmJE?=
 =?utf-8?B?cmtFeTA5TmNyVE1Lb0NHbmZOR1F2SnByd2krYVV6YTFEdWJOR0ZybjRSRFRa?=
 =?utf-8?B?Z2tJQUtIRkczUVl1eThSb1NoeHBkOUtSbmdyT1JHU1ljOUhvNkxJS3p3VnJt?=
 =?utf-8?B?alowelpLUzFwVnhMR3VHU1FjT1JRNHdRUUlmWHFsWWllYVpRQ2llS25KS0hH?=
 =?utf-8?B?N040WU0yTVVSWU4rb0lFV3pjcHFwZXNXQTVqenpkbE5ZZjBOVHljL0JtQ1ZW?=
 =?utf-8?Q?WsdUGes02eZmQDhYvExZYA7fPM0wGdc4V+g6g68?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <36BFC2150166134F8A8F08F4AE9A21D4@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd22ad7-71c0-46de-2725-08d940dca9f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 00:17:53.6963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SVaNDgMSIdcwyEtAcAvHWdnuvJTN9dZtH+acXhNoQsCSy2/cpTelCA0RmGgD4H6eAnK/Nh5hR73W7+eFf6396/aFjM1KbT0AzzFO9EH/2zY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB1393
X-Proofpoint-GUID: seYhv85LxfXk0CT1Otj9uXsz7UefM6ns
X-Proofpoint-ORIG-GUID: seYhv85LxfXk0CT1Otj9uXsz7UefM6ns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-06_13,2021-07-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070000
Cc: "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
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

SSdtIHdvcmtpbmcgd2l0aCBhIFhpbGlueCBVbHRyYVNjYWxlKyBNUFNvQyBwbGF0Zm9ybSBhbmQg
dHJ5aW5nIHRvIGdldCBzb21lDQpkcml2ZXJzIHdvcmtpbmcgZm9yIHRoZSBYaWxpbnggQXVkaW8g
Rm9ybWF0dGVyLCBJMlMgVHJhbnNtaXR0ZXIgYW5kIEkyUw0KUmVjZWl2ZXIgRlBHQSBsb2dpYyBj
b3Jlcy4gVGhlIEF1ZGlvIEZvcm1hdHRlciBpcyB3aGF0IGhhbmRsZXMgYXVkaW8gRE1BIGFuZA0K
dGhlIEkyUyBUcmFuc21pdHRlci9SZWNlaXZlciBoYW5kbGUgY29udmVydGluZyBiZXR3ZWVuIGFu
IEFYSSBzdHJlYW0gYW5kIEkyUy4NCg0KUmlnaHQgbm93IGFzIGEgcHJvdG90eXBlLCBJIGp1c3Qg
aGF2ZSB0aGUgSTJTIFRyYW5zbWl0dGVyIGxvb3BlZCBiYWNrIGRpcmVjdGx5DQp0byB0aGUgSTJT
IFJlY2VpdmVyIGFuZCBib3RoIG9mIHRoZW0gY29ubmVjdGVkIHRvIHRoZSBBdWRpbyBGb3JtYXR0
ZXIsIHdpdGggdGhlDQppZGVhIHRoYXQgYXVkaW8gcGxheWVkIGJhY2sgY2FuIGJlIGltbWVkaWF0
ZWx5IHJlY29yZGVkIGluIGFnYWluLiBUaGUgZHJpdmVycw0KZm9yIHRoZXNlIGNvcmVzIGFyZSBp
biBtYWlubGluZSAoc291bmQvc29jL3hpbGlueC94bG54X2kycy5jIGFuZA0Kc291bmQvc29jL3hp
bGlueC94bG54X2Zvcm1hdHRlcl9wY20uYyksIGJ1dCBpdCdzIHRoZSBuZXh0IHN0ZXAgb2YgcHV0
dGluZyB0aGVtDQp0b2dldGhlciBpbnRvIGEgZnVuY3Rpb25pbmcgYXVkaW8gZGV2aWNlIHdoaWNo
IEkgYW0gaGF2aW5nIHRyb3VibGUgd2l0aC4gSXQNCnNlZW1zIHRoZSB1c3VhbCB3YXkgb25lIHdv
dWxkIGRvIHRoaXMgaXMgdXNpbmcgdGhlIHNpbXBsZS1hdWRpby1jYXJkIGRyaXZlciBhbmQNCmFk
ZGluZyBzb21lIGRldmljZSB0cmVlIGVudHJpZXMgdG8gaG9vayBldmVyeXRoaW5nIHVwLiBJbiB0
aGlzIGNhc2UgdGhlcmUgaXMgbm8NCnJlYWwgImNvZGVjIiBzbyBJJ20gdXNpbmcgdGhlIFNQRElG
IHRyYW5zbWl0dGVyIGFuZCByZWNlaXZlciBjb2RlY3MgZm9yIHRoaXMgLQ0KdGhlIGRldmljZSB0
cmVlIGVudHJpZXMgZm9yIHRoZSBzaW1wbGUtYXVkaW8tY2FyZCBJIGhhdmUgbG9vayBsaWtlIHRo
aXM6DQoNCi8qIFVzZSBTL1BESUYgdHJhbnNtaXR0ZXIgYXMgY29kZWMgcmVxdWlyZWQgYnkgc2lt
cGxlLWF1ZGlvLWNhcmQgKi8NCnBsYXliYWNrX2NvZGVjOiBwbGF5YmFjay1jb2RlYyB7DQoJY29t
cGF0aWJsZSA9ICJsaW51eCxzcGRpZi1kaXQiOw0KCSNzb3VuZC1kYWktY2VsbHMgPSA8MD47DQp9
Ow0KDQovKiBVc2UgUy9QRElGIHJlY2VpdmVyIGFzIGNvZGVjIHJlcXVpcmVkIGJ5IHNpbXBsZS1h
dWRpby1jYXJkICovDQpyZWNvcmRfY29kZWM6IHJlY29yZC1jb2RlYyB7DQoJY29tcGF0aWJsZSA9
ICJsaW51eCxzcGRpZi1kaXIiOw0KCSNzb3VuZC1kYWktY2VsbHMgPSA8MD47DQp9Ow0KDQppcnhz
LWF1ZGlvIHsNCgljb21wYXRpYmxlID0gInNpbXBsZS1hdWRpby1jYXJkIjsNCglzaW1wbGUtYXVk
aW8tY2FyZCxuYW1lID0gIklSWFMtQXVkaW8iOw0KCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KCSNz
aXplLWNlbGxzID0gPDA+Ow0KDQoJcGxheWJhY2tfbGluazogc2ltcGxlLWF1ZGlvLWNhcmQsZGFp
LWxpbmtAMCB7DQoJCXJlZyA9IDwwPjsNCgkJZm9ybWF0ID0gImkycyI7DQoNCgkJYml0Y2xvY2st
bWFzdGVyID0gPCZwX2NvZGVjX2RhaT47DQoJCWZyYW1lLW1hc3RlciA9IDwmcF9jb2RlY19kYWk+
Ow0KDQoJCXBfY3B1X2RhaTogY3B1IHsNCgkJCXNvdW5kLWRhaSA9IDwmdGVzdF9hdWRpb19pMnNf
dHJhbnNtaXR0ZXJfMD47DQoJCX07DQoNCgkJcF9wbGF0Zm9ybV9kYWk6IHBsYXQgew0KCQkJc291
bmQtZGFpID0gPCZ0ZXN0X2F1ZGlvX2F1ZGlvX2Zvcm1hdHRlcl8wPjsNCgkJfTsNCg0KCQlwX2Nv
ZGVjX2RhaTogY29kZWMgew0KCQkJc291bmQtZGFpID0gPCZwbGF5YmFja19jb2RlYz47DQoJCQlj
bG9ja3MgPSA8Jm1pc2NfY2xrXzQ+Ow0KCQl9Ow0KCX07DQoNCglyZWNvcmRfbGluazogc2ltcGxl
LWF1ZGlvLWNhcmQsZGFpLWxpbmtAMSB7DQoJCXJlZyA9IDwxPjsNCgkJZm9ybWF0ID0gImkycyI7
DQoNCgkJYml0Y2xvY2stbWFzdGVyID0gPCZyX2NvZGVjX2RhaT47DQoJCWZyYW1lLW1hc3RlciA9
IDwmcl9jb2RlY19kYWk+Ow0KDQoJCXJfY3B1X2RhaTogY3B1IHsNCgkJCXNvdW5kLWRhaSA9IDwm
dGVzdF9hdWRpb19pMnNfcmVjZWl2ZXJfMD47DQoJCX07DQoNCgkJcl9wbGF0Zm9ybV9kYWk6IHBs
YXQgew0KCQkJc291bmQtZGFpID0gPCZ0ZXN0X2F1ZGlvX2F1ZGlvX2Zvcm1hdHRlcl8wPjsNCgkJ
fTsNCg0KCQlyX2NvZGVjX2RhaTogY29kZWMgew0KCQkJc291bmQtZGFpID0gPCZyZWNvcmRfY29k
ZWM+Ow0KCQkJY2xvY2tzID0gPCZtaXNjX2Nsa180PjsNCgkJfTsNCgl9Ow0KfTsNCg0KSSBfdGhp
bmtfIHRoaXMgc2hvdWxkIGJlIGEgcmVhc29uYWJsZSBzZXR1cCBhcyBmYXIgYXMgSSBjYW4gdGVs
bD8gSG93ZXZlciwNCnRlc3RpbmcgdGhpcyBvdXQganVzdCByZXN1bHRzIGluOg0KDQphc29jLXNp
bXBsZS1jYXJkIGlyeHMtYXVkaW86IHBhcnNlIGVycm9yIC0yMg0KYXNvYy1zaW1wbGUtY2FyZDog
cHJvYmUgb2YgaXJ4cy1hdWRpbyBmYWlsZWQgd2l0aCBlcnJvciAtMjINCg0KQWZ0ZXIgYWRkaW5n
IGluIGEgYnVuY2ggb2YgZGVidWcgb3V0cHV0LCBpdCBzZWVtcyB0aGF0IHRoZSBpc3N1ZSBpcyB0
aGF0DQp0aHJvdWdoIHRoaXMgc2VxdWVuY2Ugb2YgY2FsbHM6DQoNCmFzb2Nfc2ltcGxlX3Byb2Jl
DQpzaW1wbGVfcGFyc2Vfb2YNCnNpbXBsZV9mb3JfZWFjaF9saW5rDQpzaW1wbGVfZGFpX2xpbmtf
b2YNCmFzb2Nfc2ltcGxlX3BhcnNlX3BsYXRmb3JtIChha2EgYXNvY19zaW1wbGVfcGFyc2VfZGFp
KQ0Kc25kX3NvY19vZl9nZXRfZGFpX25hbWUNCnNuZF9zb2NfZ2V0X2RhaV9uYW1lDQoNCkluc2lk
ZSBzbmRfc29jX2dldF9kYWlfbmFtZSwgc25kX3NvY19jb21wb25lbnRfb2ZfeGxhdGVfZGFpX25h
bWUgaXMgY2FsbGVkIGFuZA0KcmV0dXJucyAtRU5PVFNVUFAsIHNvIHdlIGZhbGwgaW50byB0aGUg
aWYgYmxvY2sgYW5kIGVuZCB1cCBmYWlsaW5nIG91dCBoZXJlOg0KDQoJCQlpZiAoaWQgPCAwIHx8
IGlkID49IHBvcy0+bnVtX2RhaSkgew0KCQkJCXJldCA9IC1FSU5WQUw7DQoJCQkJY29udGludWU7
DQoJCQl9DQoNClRoYXQsIGluIHR1cm4sIHNlZW1zIHRvIGJlIGJlY2F1c2UgdGhlIEF1ZGlvIEZv
cm1hdHRlciBkcml2ZXIgZG9lc24ndCByZWdpc3Rlcg0KYW55IERBSXMgaW4gaXRzIGNhbGwgdG8g
ZGV2bV9zbmRfc29jX3JlZ2lzdGVyX2NvbXBvbmVudCBpbg0KeGxueF9mb3JtYXR0ZXJfcGNtX3By
b2JlLiBJJ20gYSBiaXQgdW5zdXJlIHdoZXRoZXIgdGhhdCBpcyBzdXBwb3NlZCB0byBiZSB0aGUN
CmNhc2UsIG9yIGlmIG5vdCwgd2hhdCBzaG91bGQgYmUgZG9uZSB0byBmaXggaXQuIENhbiBhbnlv
bmUgcHJvdmlkZSBzb21lIGFkdmljZT8NCg0KTXkgdGVzdHMgYXJlIG9uIGtlcm5lbCA1LjEwLjQ1
LCBidXQgdGhlcmUncyBiZWVuIG5vIGNoYW5nZXMgaW4gdGhlIFhpbGlueCBBU29DDQpkcml2ZXJz
IHNpbmNlIHRoZW4sIGFuZCBJJ20gbm90IHN1cmUgYW55dGhpbmcgcmVsZXZhbnQgdG8gdGhpcyBo
YXMgY2hhbmdlZCBpbg0KdGhlIHJlc3Qgb2YgQVNvQyBlaXRoZXIuDQoNCi0tIA0KUm9iZXJ0IEhh
bmNvY2sNClNlbmlvciBIYXJkd2FyZSBEZXNpZ25lciwgQ2FsaWFuIEFkdmFuY2VkIFRlY2hub2xv
Z2llcw0Kd3d3LmNhbGlhbi5jb20NCg==
