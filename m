Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E2E48A1E6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 22:26:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 857F6190F;
	Mon, 10 Jan 2022 22:25:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 857F6190F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641849961;
	bh=Uq1lTsrEK0M+HiA4asBfd7Hvdi0juZWOrX9mhd4i+zY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VYYpH2weJV+xJR9gcS2XXHip0YYlsp6rftOTziRZqVlTJ+/6IC00Q6auqV4CLl3Qy
	 JXoFpkKe9ylCtD5JTmLCd61vTxuhQNwjbzNGUSNIAtxEtAjXe7zBbgF6tygxv2hL+P
	 /5YlA0svw3I8ZqwFfOzjjKs+/fnzjKnsyg/iFrkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF497F80125;
	Mon, 10 Jan 2022 22:24:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAF54F8012E; Mon, 10 Jan 2022 22:24:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0804AF800B6
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 22:24:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0804AF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="U2iZ654Y"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AI6Uf9002276;
 Mon, 10 Jan 2022 16:24:41 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2055.outbound.protection.outlook.com [104.47.60.55])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dgp68r9fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 16:24:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=no1VcAb+AIz5ZPjRXBjv8nV4888sVQqWqcd5td9C3/mrf08CNIGGq/95yGZOENYmWGZe06Vzpjcih7b3QT9JUZvVCbeqj3MKCP59HMdo2hozGppBCbzf5rjML8UbNHIsK7DmRQtH855J6kNU92qlWh+Je6CLQAATiwUfLut0Rta8UVyi5Blvb0oFEgMht2TG4A+abWOFJbEjr2pwVt44O+1UPvSZNjTy7CuImb3i9UhQIuGDPco7d1q1R/eQSR/JzGF03z1lQhB2C1rHOSfSSnGFjfgsb1cD5KYkMJal57l11J8Pj7nJS/O1XSxrk8G73+LdiDgRY07KFmevva+3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uq1lTsrEK0M+HiA4asBfd7Hvdi0juZWOrX9mhd4i+zY=;
 b=O3mYwJyxGn943RRXBYuG+8lk5WzHMp/gSf4ddQYbaJ411HlxwD8gASw+H9iU4cpy/IJos1NkbqmXBKE9qiGT5//rqeTve+ZdNtaJUWwFngJ4m1lcnStOeneL62dilLneAxdrqWiEt2/WhlFvyXAqaKg9nh5wARbjQ3I2AqiHQMt4rvqlIzZZiCQDQTiwxpuzc18krSwtSDyfF+lHmbgjhpd7ufnnbDY/650/z0FZStSQFxNdSl+Ohc3ziMuYSG3kyqmAIUysrkBPCzXA3M3Ch2ED5zQQ7cVT8g/pCpNoJudn0zi4ktfgk54CcdjOg3aKIs+QA/cjT7LoLJ0dGTnUyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uq1lTsrEK0M+HiA4asBfd7Hvdi0juZWOrX9mhd4i+zY=;
 b=U2iZ654Y0B06IfmQdDKSGqO1XnlrPSuw1IrhW9CZPz5EzpuQ3oRsbC9yoSIOGpkymGdU9jDpP/WHD3zxUxlQLgvs5u95BPdYJgIEiLkK2vrR6ffWOy4kCOdAxxiqOo5kUrfdUFXXNIsxWXVM2lvwtNQw2Vt2ieDS+OUgaXNWpbI=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YT3PR01MB4835.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 21:24:38 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 21:24:38 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v2 2/6] ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk
 setting
Thread-Topic: [PATCH v2 2/6] ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk
 setting
Thread-Index: AQHYBBAwYl3tgsTgXkyND6y3hLRvxaxcWXUAgAA+LQCAACJHgIAADugA
Date: Mon, 10 Jan 2022 21:24:38 +0000
Message-ID: <20a640e08f80b2cbc28c5fdd27282b398bc844a6.camel@calian.com>
References: <20220107214711.1100162-1-robert.hancock@calian.com>
 <20220107214711.1100162-3-robert.hancock@calian.com>
 <YdxGrApvHyPW1aii@sirena.org.uk>
 <b45aa6b8f3aa443da90b561e579370a0255e7017.camel@calian.com>
 <YdyXlalTSxPksLXH@sirena.org.uk>
In-Reply-To: <YdyXlalTSxPksLXH@sirena.org.uk>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 459a91b6-886b-4300-522a-08d9d47f9bc7
x-ms-traffictypediagnostic: YT3PR01MB4835:EE_
x-microsoft-antispam-prvs: <YT3PR01MB483561F85114B7AC6DAB6527EC509@YT3PR01MB4835.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xrRFqLcrSIl4qhsoe2Xkfh/8StMc/4wBUgOVG7rBTHeDSnw9uUAqzHukeGuZW9OGigY5KL5E97SwdKXT9sIaXAYNjpp8eLLgzqmR7Pp9xlVISShqz/xILOWVVxwCnZ5kvfZMe8Tg+XxkRDhUQx20BF/KY2wjBdJAle5al3V7gYRuPHQkFrBnIlBI1nTdsaMy35+iTU657eLLi9E6TiRE73K+dyJLhP6XReAMW5uIqktsgaG48ugIKf7qU0oFu+DTv1t//4H3g6pSN046xOTHBNnElOPxqEQ0NNb0mjTebcHzXUpVs9FPx7bKr3IULdpZikvrse4z+jm0lqvr01XMnWZYJW6NcFkAU8sUcruMnLGBr2zATWvck0hmO2w96EpQ4gGWLoVAyEl9dDv60EjExRLTONluwt6WeMnNOL6TKItQxrpKkKqakyk9al0kMMBDWPYrJJjk1hY8DEq69BQwEdYOSbWX/6s1k5Xq8nmiZEdh8+PqSYqvS4peOtxkyj8Bf1U2NKRbgnMmhNmqA9t2Gz1+cYdk9nyuOzm/XfpHuFNBxIihgMyD/Jl0Cf7c33s6txHwhx21CASAF3A6sYZeFWb/GIZ9MxZNIxZtYo6Y8E+h0KKLg01qNQE4RlJ0erTh1NUAxp64qf55FD4V/5YQNY6IKjfQ8PtefyLBzbICIA18GKejX7Gm+CPA8piAWE3hV9UmIr2OnMcI/KFkIOQhRzj3884hfIXWWIqs0AKuYczTDIpDHfFWkbYODQULi8Q7I7rLc6qJHvCKD4BT7vGB0cZD0VmV4yhVFP5Lr3VVXiUx7TiJn6Dmgaqi3oxyDYUkzhbOe8NC//BzKswRHpTW2gnyXkxgVhkFHd+IoHjmP0E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(8676002)(38070700005)(91956017)(76116006)(44832011)(71200400001)(83380400001)(66476007)(15974865002)(4326008)(6512007)(66556008)(2616005)(66446008)(186003)(6486002)(38100700002)(122000001)(86362001)(66946007)(5660300002)(8936002)(26005)(6506007)(2906002)(6916009)(64756008)(508600001)(316002)(54906003)(99106002)(18886075002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGl3dTlFWG9CRmt0NXQrM1ZaSEd0OEswdEZodGo3ckVBRXJ6UkxVamtlUWp3?=
 =?utf-8?B?T3pjV1QrRkpDcjBxMGVqa2ErRitCeFAvVGJUTzE0cEJEZlc4WmFVd3BtZDl2?=
 =?utf-8?B?Y1gwb2Y4elNvK3BlR0dyN0p3ZmhhRHF0SEpibE1zQ0c3NXhJdXdJRFNEOXBO?=
 =?utf-8?B?cWxvWUlXekZsZFRMeUMxMUIxWXBKSzhRL2JGUWVsbWVXVE9tRVgvdnk2UWI0?=
 =?utf-8?B?ZUg0R1ZlS3JuVmR1RnRmdCtsWUpxL3JuUmZ2VWhsTVU0TFVTZG9lVjBoZkox?=
 =?utf-8?B?dG5SWUhkaktabXNyZXI1NVpzTUtVczZLSng1cEVNWnpINTFpVmxSSU96Smwz?=
 =?utf-8?B?cDZ2RC9wR1lMTDk5OEpZTnVEck50MGVLQjZTOXBDVjZYMGpDZ2FFQmZVRmVC?=
 =?utf-8?B?YnVkRUcxQTNVeG1SQ1ZtK0Vkcjk1T2VncStHR2JQVEowQ3JFSXI0bGdZd0JO?=
 =?utf-8?B?di9GWGo0QUlwSDRWWi9TZGtDOC9iNGNjSE5rUW91K0gwL0dVUHhzV09WeUQ3?=
 =?utf-8?B?TEdoYzlPNzA0L2lkYmczN1JVZ1RpL0ZxSzBSQUoxeU1zOU5TTHZ1VkFWaDQ2?=
 =?utf-8?B?SVN3K1lnbmh5M1g5UWl4aHl4Y1RoVS9WWmwxTzdFOG9vbEFTcExldjRWRkN4?=
 =?utf-8?B?RnEyQ1pnWGlVTVQ5NmVjaDZEZE5IOWpkSkJubUVqZVdIY1A4L1hvSDZTY3ZH?=
 =?utf-8?B?RHZtWDlaNXR3WHhXV3U2Qi90NEFlWkpWSVpNV0w3SlRhWEJJeEFJVm84NGVC?=
 =?utf-8?B?MlV4NHlRSVZrYlVzcjRvU05Fb2kzR052eFd5UFMxWXo5SkV5SldFZ2xvRjJ0?=
 =?utf-8?B?SFJ1NjZ6SlJnNHdUaUdicmErSHpqQmJkWm5XcC9ud3F2OEdBVnZNVS8vaExr?=
 =?utf-8?B?RUZ2bzJCMlRwTHNENXA4emF6Ui9pVTdtZ0tBZUdsTkk2Njh0Q0VaTzd0bWlu?=
 =?utf-8?B?ckRDeWxXY01MWjNzZG1oMGNTenptMkhTN2hlR2MvWjIzUlpIVTJLU2l4YTBa?=
 =?utf-8?B?QVloSjFOL0NTTUVpMi85TEhxRlJqU0NpMmQxZEt2cGkzQzRKNmpNRmdNaStQ?=
 =?utf-8?B?VEszUjY3a0lzWGxoZDdpUkdhWmU4Mzkzc3FMaWRaWTlSbWppenMyVjFqTXhW?=
 =?utf-8?B?TE5JbGlmNVNIZEdvNm0ybXJMWTFOK0EwZVd4M0FGQnNKcHVsUVdpcWExNW9v?=
 =?utf-8?B?b09nRjNDZ0Q5VWkrOEZKd3VuUzNsaFdMN1p3UUZFVmplRHJTWWpTQ3owdXBi?=
 =?utf-8?B?TkxHLzk4WmRYZjRmNS83TWtwVDJweEZkMG5lTGFqL3RmSjBWSlgwRXl6em5R?=
 =?utf-8?B?YkNEL0JOUldNZFhKd1l3VzFBcEdldU9vQmo3eHdzNXNXeXl0QVJadUVOQkhj?=
 =?utf-8?B?R1BqZjhBV1c1VDFjQXhWWVFKZlZ1dFVyanhPYW1ZRDNsN09Ua1VnY2lJSkpS?=
 =?utf-8?B?elY4QWtPZWRtNFhpWUhQK1pQV3Y0RXJCTmROS0ZFMDhRUDBqRGlua3JvRU1a?=
 =?utf-8?B?NXNCT256VG43cDM1OGlWOVZBdnRPcWlKZk40eXVaNXU5OXV0R0U1b1hGaGR2?=
 =?utf-8?B?c3prT0R4bS9yeE45WU1SQzNaMFAwZVBzbWhoSGI3YTY5Z3JOSnZYMjhaTU1H?=
 =?utf-8?B?WGZYMUNCS2JnRFpmN2V1SnkwSllDSmE5VkZEenc2OFA4UEpLSUhNQi9Ua2dw?=
 =?utf-8?B?MjFPaGdhZnFJY1gyaDc0bGFxR01qVjVIR3BOK0c0Z0lWNUE4dFo1UHRzOXl1?=
 =?utf-8?B?V0pOUGwwallzbTM1UkRIaGlBVXhybDcrOGJEWmd5M3VUMm90cW9VYXBmWEd1?=
 =?utf-8?B?b1k4RjRkemx3MWNjUlE3ajZ6K0o1ZGdlQXA5Y2hrR2dRWCtQcHhNb0pyWk9E?=
 =?utf-8?B?azVWclM5aVpjcGVtVFZBLzE2bUJPRDd3V0lkZUhGRm95ZXdNT0x2ajNBaWE3?=
 =?utf-8?B?U3Y2czVLOGJhcjI3S1VsN21QOHZmZ2JPa2lRb2JsOFdqNUU4eTBSN0YwTzl1?=
 =?utf-8?B?RnYrYWZuUUdCbHA3ZE9RKzVnTlpidFVOdWhLZCs4b01ZeGZwSVYyTXZCVWdh?=
 =?utf-8?B?YnF1VzIybUs3ejRxY2JJQjNZajJNazBIbjBuYWlVRjgwTXBEczBBc1dUU1ZV?=
 =?utf-8?B?WFhSVkNhNXdtNTN4azdrNHNWeTliNFdyRVZWcDBjWVJpWXRlV2drOGM0RHFa?=
 =?utf-8?B?OXE4TnhTYzAzUHlLQ0k1ZlJWbmU5anhiWnpRdnFyZk9yZG1VcWVEbkNFU1FE?=
 =?utf-8?Q?2qqWDzCAPpDbneqp+yj2PBbwegqrJv8J0XeDtv4HZw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <85F0820C75EC4F4796BB8EA6E1A2D5AA@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 459a91b6-886b-4300-522a-08d9d47f9bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 21:24:38.8633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uryhmu3oyKjSnIIoGv52KijMlRX8xC0vp2r/UAIcfKifzdMNVyzF8B5DOv7tB22GidJYQSLrDy8oUMXL6fceopIlsv/4hmyXjm5HcvY4IPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB4835
X-Proofpoint-GUID: VpIQiqCRBFvkKS3fEAbMg9FUB0jESbGa
X-Proofpoint-ORIG-GUID: VpIQiqCRBFvkKS3fEAbMg9FUB0jESbGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_09,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100142
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

T24gTW9uLCAyMDIyLTAxLTEwIGF0IDIwOjMxICswMDAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBNb24sIEphbiAxMCwgMjAyMiBhdCAwNjoyODozNlBNICswMDAwLCBSb2JlcnQgSGFuY29jayB3
cm90ZToNCj4gDQo+ID4gLU9uIGluaXRpYWxpemF0aW9uIGZvciBzaW1wbGUtY2FyZCwgaWYgYSBj
bG9jayBmcmVxdWVuY3kgaXMgc3BlY2lmaWVkIGluDQo+ID4gZGV2aWNlDQo+ID4gdHJlZSwgc2V0
X3N5c2NsayBpcyBjYWxsZWQgb24gdGhlIERBSSBieSBhc29jX3NpbXBsZV9pbml0X2RhaSAoY2Fs
bGVkIGJ5DQo+ID4gYXNvY19zaW1wbGVfZGFpX2luaXQpLiBIb3dldmVyLCBpdCBkb2Vzbid0IGFw
cGVhciB0aGF0IGl0IGlzIGNhbGxlZCBvbiB0aGUNCj4gPiBwbGF0Zm9ybSAoeGxueF9mb3JtYXR0
ZXJfcGNtIGluIHRoaXMgY2FzZSkgYXQgdGhpcyBwb2ludC4NCj4gPiAtc3RhcnR1cCBnZXRzIGNh
bGxlZCBvbiB0aGUgREFJIGZyb20gcGNtX29wZW4sIHNvIHhsbnhfaTJzIHNob3VsZCBiZSBhYmxl
DQo+ID4gdG8NCj4gPiBhZGQgaXRzIHJhdGUgY29uc3RyYWludHMgcHJvcGVybHkgYXQgdGhhdCBw
b2ludC4gSG93ZXZlciwNCj4gPiB4bG54X2Zvcm1hdHRlcl9wY20NCj4gPiBoYXMgbm8gc3lzY2xr
IHNldCBhdCB0aGlzIHBvaW50LCBzbyBpdCBjb3VsZG4ndCBjdXJyZW50bHkgZW5mb3JjZSBhbnkN
Cj4gPiBjb25zdHJhaW50IGJhc2VkIG9uIHRoYXQuDQo+IA0KPiBJIHRob3VnaHQgdGhlIGxhdGVy
IHBhdGNoZXMgaW4geW91ciBzZXJpZXMgd2VyZSBpbnRlbmRlZCB0byBmaXggdGhpbmdzDQo+IHNv
IHRoYXQgdGhlIHNldF9zeXNjbGsoKSBkb2VzIGdldCBjYWxsZWQ/DQoNCkl0IGRvZXMgZ2V0IGNh
bGxlZCBkdXJpbmcgaHdfcGFyYW1zIG5vdywgYnV0IG5vdCBkdXJpbmcgaW5pdGlhbGl6YXRpb24g
YXMgaXQgaXMNCndpdGggdGhlIERBSSBjb21wb25lbnRzLiBJJ20gbm90IHN1cmUgdGhhdCByZWFs
bHkgbWF0dGVycyBpZiB3ZSBkb24ndCB0cnkgdG8NCmFkZCBjb25zdHJhaW50cyBpbiB0aGF0IGRy
aXZlciB0aG91Z2ggKHNlZSBiZWxvdykgYW5kIGl0IGp1c3QgbmVlZHMgdG8ga25vdw0Kd2hhdCBz
eXNjbGsgYW5kIHNhbXBsZSByYXRlIGFyZSBiZWluZyB1c2VkLg0KDQo+IA0KPiA+IC13aGVuIHRo
ZSB0b3AtbGV2ZWwgaHdfcGFyYW1zIGNhbGwgaXMgbWFkZSB3aXRoIHNpbXBsZS1jYXJkLCBzZXRf
c3lzY2xrDQo+ID4gZ2V0cw0KPiA+IGNhbGxlZCBvbiBldmVyeXRoaW5nIGJ5IGFzb2Nfc2ltcGxl
X2h3X3BhcmFtcyBwcmlvciB0byBod19wYXJhbXMgY2FsbHMgb24NCj4gPiBhbGwNCj4gPiBvZiB0
aGUgY29tcG9uZW50cy4gVGhlIHN5c2NsayB0aGVyZSBpcyBiYXNlZCBvbiB0aGUgZGV2aWNlIHRy
ZWUgbWNsay1mcyBhbmQNCj4gPiB0aGUNCj4gPiBzYW1wbGUgcmF0ZSB3aGljaCBtaWdodCB3aXBl
IG91dCB0aGUgb3JpZ2luYWwgY2xvY2sgZnJlcXVlbmN5IGlmIHRoZQ0KPiA+IGNvbnN0cmFpbnRz
IGRvbid0IHByZXZlbnQgc2V0dGluZyBhbiBpbnZhbGlkIHJhdGUuDQo+IA0KPiBJZiB0aGUgZGV2
aWNlIGlzIHVzaW5nIG1jbGstZnMgdGhlbiBlaXRoZXIgdGhlcmUncyBhIGZpeGVkIHNhbXBsZSBy
YXRlDQo+IChpbiB3aGljaCBjYXNlIHNpbXBsZS1jYXJkIHByb2JhYmx5IG91Z2h0IHRvIGZvcmNl
IGl0IHdpdGhvdXQgdGhlIGRyaXZlcg0KPiB3b3JyeWluZykgb3IgdGhlIHN5c2NsayB3aWxsIHZh
cnkgaW4gd2hpY2ggY2FzZSBzaW1wbGUtY2FyZCBzaG91bGQgYmUNCj4gc2V0dGluZyB0aGUgc3lz
Y2xrIHRvIDAgd2hlbiB0aGUgY2FyZCBnb2VzIGlkbGUgdG8gY2xlYXIgYW55DQo+IGNvbnN0cmFp
bnRzICh3aGljaCBhcyB5b3Ugc2F5IGxhdGVyIGl0IGRvZXMpLg0KDQpJdCBzb3VuZHMgbGlrZSB0
byBmaXggdGhhdCwgc2ltcGxlLWNhcmQgbmVlZHMgdG8ga2VlcCB0cmFjayBvZiB3aGV0aGVyIHRo
ZSBEQUkNCmhhcyBhIGZpeGVkIGNsb2NrIHJhdGUgb3Igbm90LiBJZiBpdCBkb2VzLCB0aGVuIGl0
IHNob3VsZG4ndCBiZSB6ZXJvaW5nIG91dCB0aGUNCnN5c2NsayB3aGVuIGNsb3NpbmcgdGhlIGRl
dmljZSBhcyB0aGF0J3Mgd2lwaW5nIG91dCBpbmZvcm1hdGlvbiB0aGF0IG5lZWRzIHRvDQpiZSBw
ZXJzaXN0ZW50LiBJIGd1ZXNzIGlmIHRoZSBmcmVxdWVuY3kgd2FzIHJlYWQgZnJvbSBhIHN5c3Rl
bS1jbG9jay1mcmVxdWVuY3kNCnByb3BlcnR5IHRoZW4gd2Uga25vdyBpdCBpcyBmaXhlZC4gVGhl
cmUgYXJlIG90aGVyIGNhc2VzIHdoZXJlIGl0IGNvdWxkIGJlIGENCmZpeGVkIHJhdGUsIHN1Y2gg
YXMgaWYgdGhlIGNsb2NrIGlzIGNvbm5lY3RlZCB0byBhIGZpeGVkLWNsb2NrLiBNYXliZSB3ZSBu
ZWVkDQphbiBleHBsaWNpdCBEVCBmbGFnICJzeXN0ZW0tY2xvY2stZml4ZWQiIG9yIHNvbWV0aGlu
ZyBmb3IgdGhvc2UgY2FzZXM/DQoNClRoZW4gYXQgbGVhc3QgaW4gdGhlIGNhc2Ugd2hlcmUgbWNs
ay1mcyBpcyBzZXQgYW5kIG9uZSBvciBtb3JlIG9mIHRoZSBEQUlzIGhhdmUNCmEgZml4ZWQgcmF0
ZSwgc2ltcGxlLWNhcmQgY2FuIGFkZCBhIGNvbnN0cmFpbnQgdG8gcmVzdHJpY3QgdGhlIHNhbXBs
ZSByYXRlIHRvDQp0aGUgZml4ZWQgY2xvY2sgZGl2aWRlZCBieSBtY2xrLWZzPw0KDQo+IA0KPiA+
IC1JbiB0aGUgY2FzZSBvZiB4bG54X2Zvcm1hdHRlcl9wY20gYW5kIHNpbXBsZS1jYXJkLCBzaW5j
ZSBzeXNjbGsgaXMNCj4gPiBkZXRlcm1pbmVkDQo+ID4gYnkgc2FtcGxlIHJhdGUgdGltZXMgbWNs
ay1mcywgdGhlcmUncyBubyB3YXkgZm9yIHVzZXJzcGFjZSB0byB2aW9sYXRlIHRoZQ0KPiA+IGNv
bnN0cmFpbnQgdGhhdCB0aGUgc2FtcGxlIHJhdGUgZGl2aWRlcyBldmVubHkgaW50byBzeXNjbGsu
DQo+IA0KPiBPbmx5IG9uIGEgc3lzdGVtIHdoZXJlIHRoZSBzeXNjbGsgY2FuIHZhcnkgLSB0aGlz
IGlzIGEgZ2VuZXJpYyBjYXJkIHNvDQo+IHNvbWVvbmUgY291bGQgc2V0IGEgZml4ZWQgc3lzY2xr
LCBhbmQgb2YgY291cnNlIHRoZSBkcml2ZXIgY291bGQgYmUgdXNlZA0KPiB3aXRoIG90aGVyIGNh
cmRzLg0KPiANCj4gPiAtaW4gb3JkZXIgdG8gYWRkIGFueSBjb25zdHJhaW50cyBvbiBzYW1wbGUg
cmF0ZSBiYXNlZCBvbiBzeXNjbGsgaW4gdGhlDQo+ID4gZm9ybWF0dGVyIGRyaXZlciwgaXQgd291
bGQgbmVlZCB0byBnZXQgc2V0X3N5c2NsayBjYWxsZWQgZHVyaW5nDQo+ID4gaW5pdGlhbGl6YXRp
b24NCj4gPiB3aGljaCBkb2Vzbid0IGN1cnJlbnRseSBoYXBwZW4uIEJ1dCB3aXRoIHNpbXBsZS1j
YXJkLCB0aGVyZSdzIG5vIHdheSB0aG9zZQ0KPiA+IGNvbnN0cmFpbnRzIGNvdWxkIGJlIHZpb2xh
dGVkIG90aGVyIHRoYW4gYSBrZXJuZWwgYnVnLg0KPiANCj4gWW91IHNob3VsZG4ndCBiZSBtYWtp
bmcgYXNzdW1wdGlvbnMgYWJvdXQgdGhlIG1hY2hpbmUgZHJpdmVyIGluIHRoZSBETUENCj4gZHJp
dmVyLCBlc3BlY2lhbGx5IGZvciBzb21ldGhpbmcgbGlrZSB0aGlzIHVzZWQgaW4gYSBGUEdBIHBy
b2R1Y3Qgd2hpY2gNCj4gaGFzIGV2ZW4gbW9yZSBmbGV4aWJpbGl0eSB0aGFuIG1vc3QgdGhpbmdz
Lg0KDQpUaGF0J3MgdHJ1ZSwgYnV0IHRoZSBjb25zdHJhaW50IG9mICJzYW1wbGUgcmF0ZSBtdXN0
IGRpdmlkZSBpbnRvIHN5c2NsayIgaW4gdGhlDQpmb3JtYXR0ZXIgc2VlbXMgbGlrZSBvbmUgdGhh
dCBzaG91bGQgYWx3YXlzIGJlIHRoZSBjYXNlLCBhbmQgc2hvdWxkbid0IHJlYWxseQ0KYmUgdGhl
IHJlc3BvbnNpYmlsaXR5IG9mIHRoZSBsb3ctbGV2ZWwgZHJpdmVyIGxldmVsIHRvIHZlcmlmeSBi
dXQgc2hvdWxkIGJlDQpoYW5kbGVkIGJ5IHNpbXBsZS1jYXJkIG9yIHdoYXRldmVyIG90aGVyIHRv
cC1sZXZlbCBkcml2ZXIuDQoNCj4gDQo+ID4gLXhsbnhfaTJzIG5lZWRzIHNvbWUgd2F5IHRvIGF2
b2lkIGl0cyBzdG9yZWQgc3lzY2xrIGJlaW5nIHdpcGVkIG91dCBkdXJpbmcNCj4gPiBQQ00NCj4g
PiBjbG9zZSBzbyB0aGF0IHRoZSBjb25zdHJhaW50cyBhcmUgaGFuZGxlZCBwcm9wZXJseSBkdXJp
bmcgc3Vic2VxdWVudCBvcGVucy4NCj4gDQo+IERlcGVuZGluZyBvbiBob3cgZmxleGlibGUgdGhl
IHN5c3RlbSBpcyBjbGVhcmluZyB0aGUgc3lzY2xrIHN0b3JlZCBpbg0KPiB0aGUgSTJTIGRyaXZl
ciBtYXkgYmUgZGVzaXJhYmxlIC0gaWYgdGhlIHN5c2NsayByYXRlIGNhbiBiZSBjaGFuZ2VkIHRo
ZW4NCj4geW91IHVzdWFsbHkgZG9uJ3Qgd2FudCB0byBmb3JjZSBjb25zdHJhaW50cyBiYXNlZCBv
biB3aGF0IGl0IHdhcyBkdXJpbmcNCj4gdGhlIGxhc3Qgc3RyZWFtLCB5b3Ugd2FudCB0byByZWxh
eCBzdWNoIGNvbnN0cmFpbnRzIHNvIHRoYXQgYSBuZXcgc3lzY2xrDQo+IGNhbiBiZSBjaG9zZW4g
d2hlcmUgYXBwcm9wcmlhdGUuDQo+IA0KPiBJZiB0aGF0J3Mgbm90IHBvc3NpYmxlIGluIHRoaXMg
c3lzdGVtIHRoZW4gaXQgc291bmRzIGxpa2UgaXQgc2hvdWxkIGJlDQo+IHNldHRpbmcgc3lzdGVt
LWNsb2NrLWZyZXF1ZW5jeSBhbmQgc2ltcGxlLWNhcmQgc2hvdWxkIHRoZW4gbm90IGJlDQo+IGNs
ZWFyaW5nIGFueSBzZXR0aW5nIGluIHRoZSBjb21wb25lbnRzIHdoZW4gdGhlIHN0cmVhbSBjbG9z
ZXMgZG93biwgaXQNCj4gc2hvdWxkIGJlIHNldHRpbmcgdGhlIGNsb2NrIHVwIG9uY2UgYXQgaW5p
dC4gIEJyb2FkbHkgc3BlYWtpbmcgdGhlDQo+IG1hY2hpbmUgZHJpdmVyIGlzIHJlc3BvbnNpYmxl
IGZvciBlbnN1cmluZyB0aGF0IHRoZSBvdmVyYWxsIHN5c3RlbQ0KPiBjb25maWd1cmF0aW9uIGlz
IHNlbnNpYmxlIGFuZCBjb2hlcmVudCAodGhhdCdzIHdoYXQgaXQncyB0aGVyZSBmb3IpLg0KLS0g
DQpSb2JlcnQgSGFuY29jaw0KU2VuaW9yIEhhcmR3YXJlIERlc2lnbmVyLCBDYWxpYW4gQWR2YW5j
ZWQgVGVjaG5vbG9naWVzDQp3d3cuY2FsaWFuLmNvbQ0K
