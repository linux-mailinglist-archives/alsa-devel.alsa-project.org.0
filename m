Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C07774372B8
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Oct 2021 09:26:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FBCE1670;
	Fri, 22 Oct 2021 09:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FBCE1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634887614;
	bh=jLCxGFdrRrSjwiyE8ZcGGyGgi12ZesPYhYo90XKatdM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UTFbUYYjtH3e2Z7kPxPatRopNoq69aKx5hNeuNEzzOTr+TYCz1hCF5bOX74KExmMx
	 HgNv0cTe9Fh4k/3V8pr9iug6muZ4Pg+wYpaL00U0/TQZwsiGwXbTBpMNDs9AXKK7hG
	 jsMexrvMdzkWiRToTzP5byxH7viXO57S6eC1Id+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8F00F80224;
	Fri, 22 Oct 2021 09:25:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 729AEF80229; Fri, 22 Oct 2021 09:25:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9355F80086
 for <alsa-devel@alsa-project.org>; Fri, 22 Oct 2021 09:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9355F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=epam.com header.i=@epam.com
 header.b="wx0Zv4RB"
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19M5wWMQ023336; 
 Fri, 22 Oct 2021 07:25:25 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bunn5rf6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Oct 2021 07:25:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvAg5VLA0QexZBDKo1xzZrN8QqZnus4T6KJ8qkhYidBxBzNwA7eqs6etxq+7XTxe7TO/NFYEjr/fT0+iDDA3OfJw+8rtsp4AW5hhVhfN6n2iV4zra2DM7n5bfTnETOj930TwPWe1pXAeHTa6rW9XcsD4Lhws64NY1p/k7EVglmWOCFgSlVXHScIpT98rP5jbRvfu3koYd3gc6lHQ3nf/7eSwo+vmPd43ljW8oE9af9ACCRcjpTYD2Tnl1YqrUVnxfTxNOFFjHjAu9siQVxQq+2BF9mrHI0bRhXNReM1VJ8J60HOjKcFowK0wDtmQqNSc5hbpZ3xVEghzS6ojJw5FzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLCxGFdrRrSjwiyE8ZcGGyGgi12ZesPYhYo90XKatdM=;
 b=DBA8uwpD0/jUpQSS1zbKaiO0/VCOuOidLtVnNdg3ZPYXM8F2uX90TxcNLEYJPk4wsCUmO3n+ldvdszsdvkBF4rfK7lkn5uidu5/2Z1ZbdMItq5fQRULfJfakpmwXfXDsCYKpJwt6W9CO9Y4tBSeptH56JgFv4iXgJcnWopPpU80Dpp1C50R1wuIfWy7BUelVHsgTjYNo4U22HtaL6BQMsb1ogy69FoMlE25Dlsp3yaSyNo7iTlK4uPYzB6AdqjRyuuD6m696utrW1fpDLOrDT2Zux87HpE0aLQ5qcmqMGnsus+BzvXOiIoL4dMXGDbdmMTQ6vbPXPz0Tx2JloPppQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLCxGFdrRrSjwiyE8ZcGGyGgi12ZesPYhYo90XKatdM=;
 b=wx0Zv4RBH/XYVo88iQI9sDW1TtfZGXaI+Y9iKXyZqsLMDwfDqwvLLS2ipK3gohV1KxtJ06sNZ7hNESf+Q2qqI/iQniN9xgUUOQwjDn5Ff42d9T9XWl8Pepy5B0jq9mf6UynU0Q1m+LDmzWWvi8LN8MeRXMrybysJdcVl8qXGZS+xVUrDj5bBLtlqFMsy5ls4L2fd//3E4Avn3HKyHMpQAUZI3MK8U0W5KUla4onPjumjKm5wrORzBk9oXnfljzC3KmDVzEsxZnnfZcnsYqvh6pu1u188bR5/ZxSDChCEU9N67IfFgr0uTVIsCgmQ0FH0QP5i09SNZ2uAxXZ1WS0ZtQ==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4435.eurprd03.prod.outlook.com (2603:10a6:208:c1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Fri, 22 Oct
 2021 07:25:23 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 07:25:23 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] xen: flag xen_snd_front to be not essential for
 system boot
Thread-Topic: [PATCH 5/5] xen: flag xen_snd_front to be not essential for
 system boot
Thread-Index: AQHXxxDrXTppQLCDQ02hFy/t0k8Um6vendAA
Date: Fri, 22 Oct 2021 07:25:23 +0000
Message-ID: <72b951c4-5a84-d68a-b718-3d20f2704ffd@epam.com>
References: <20211022064800.14978-1-jgross@suse.com>
 <20211022064800.14978-6-jgross@suse.com>
In-Reply-To: <20211022064800.14978-6-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 652d601a-42bb-4b96-2e11-08d9952d1c57
x-ms-traffictypediagnostic: AM0PR03MB4435:
x-microsoft-antispam-prvs: <AM0PR03MB44355F131A147E25B0F8215EE7809@AM0PR03MB4435.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8d1yuKJoYKLni1ly1gNKy8VkRtuzgWAZziVLdPmBb8ak/Vpz4D0acvr3TusF/DU5r/w1MJHu7iPoneye00M8MHgZeIuXKZ35d5k3UWQSK2D+d0HZD6JLeZ+d3SEw3E0mZH9RYSow/O4/ReWw2bxbVCbA8HbWR1kqo/SrNiC/K9/oF3tojqofgwUHf5HgVmAq9sDg6O4uOkAyrbkz8W1xYOTjk6d9H2+TG9OTSN/FUVNxIUXMh2t4th7+JIIlt9aBDn1xxSMTy+5uuS/l/bCT7xzNFiQ0qU92wxddQD84bWFu2qV5uYZbxCggo/AjfyKiGUQGtvOg0MnRKKSJ0HCwk/kNgNIT653EFymitPRjxYgfB2jfTl90yu9pLNdfYigx8Pc2X3DZCESEbkDGO1aoSDUjIBi926oXAJTUx5SttIUYBCV010Q6HDF/8D7Smg2Mb+q9pzOu6QbVFIZLeuu0DIPM9azuHoospNjQAnmYXq1zMEEPamyIrMzJeyZoLPm2dKTCK+ZQfMDeOR7db+eyzA4b45qxQM/GWafk1+fsCcZt5ze9tJUwt6dXOQ3DfYe+yYGQSjB5AEmQL3+g+kEEEM3EWPypkxO8Q53Z3zQwAjPqaYE3R7JDdcT6Z75U84smhR+B1Njpz2XW6+KWSL82RvjlycOulNLwXH3NUT9Sp/ZrSysm1quj9OxIVgp38zD3Gh4acqNm0kidBJ1+uvzaAmrxXn6VxZ1CaXVq7ZkOcs/qH0ni13JzjjwrMAeeWUlp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(186003)(122000001)(6486002)(38070700005)(54906003)(110136005)(316002)(36756003)(71200400001)(4326008)(64756008)(66946007)(31696002)(91956017)(76116006)(66556008)(66446008)(66476007)(2616005)(6506007)(53546011)(31686004)(5660300002)(4744005)(6512007)(26005)(8936002)(508600001)(8676002)(38100700002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWpKcE5uSFpxMnpIcXl4VEV4VjMwRDA1MGNnZ0pYZy9NNG1lTFB6M3VPNjhY?=
 =?utf-8?B?L0xTcjI1UjR0K0oyRW9zejNGYjJxSWdSYm54THpQTTdTRzhlUG52SE1yTUxq?=
 =?utf-8?B?S0ViWm1GTnZ0ZEIxa1ZmeWhSOHVmWS93VmU3RjJrWVpYSWJRRXlZN0EvRGZh?=
 =?utf-8?B?WHZoVXBweG9JK09mdUhmNlFXQ015QWtrL2RtU2dKWjJEMUNxWGR3WUZDU3dI?=
 =?utf-8?B?Vm12eXRLQWM2OUJ5Z01GcGhZbHhKd05nS1NkQS94MmhoNWFHNm9ta2hhdUxw?=
 =?utf-8?B?bStJOHA5NVJLNmpSWVJ2cE9EQ2dLRUNKY0ZpZC9LLzZUeUl0ajIvUy91NzdD?=
 =?utf-8?B?K1oyUXhVclJMYklIdi9RT2xqZGhzUzBzN2VzbGRualFqT0dyUHZjendXN3Nm?=
 =?utf-8?B?RSt0SjEzSnNldjV4WDN6cUozdXFXMFYvQzNCOXV1QWJ6UXVEd2R0ZjFwcmtK?=
 =?utf-8?B?WlBGblcrMjlvRGsreWxkZmN1M1YraWxvUUdab2w0Qno1a1Y3UUNMc3ZESXJS?=
 =?utf-8?B?QSs1b0l2WmhnWmZMZ0VVTlNITUpLd2dUY2pmeUpCU0Y2NEhRcUdwRlowUW5I?=
 =?utf-8?B?bkJ0ci8zUUl0YmR3cDdCTmNYRVMvek45Wjl2dm9BSVNLMGIzSm16NmpBWng1?=
 =?utf-8?B?R3Y3dDczVlNXZDgxS2ZPOG9VWk1senYyV3RJdTcvdFVVSjN4dllrVHIyN0s0?=
 =?utf-8?B?MFFPNEl6dW1xdGU4TXZDNXpMaTZ3UFBPZkc5aE55ZTMrQ1RTclBlRTBQdnpP?=
 =?utf-8?B?V2gvTUNHSDBvTlN4cXJLYjdRekV2YmpXYUVjaFB4dTFuRDZubTNOS0FQU2Nk?=
 =?utf-8?B?emJUVFFHckJnWTVzL21yWVBJOW45VkRhbzhtTm9hR0JIQXJWMzBubDEzSEhz?=
 =?utf-8?B?WjhVcmtrc1dmT09FSGI4U3hvdFpTQmJUYlI3QnBWaTU4SGJxQUlBTlJNNkZL?=
 =?utf-8?B?K3hvSnVIN1FZejlQSlN2aDJHRHZVQXV1dFZ0V2QyUG9zekpldGZPT240bU5r?=
 =?utf-8?B?T3ltWEZoQVNVYmhuVm4rYllGcFAzOUJYampZOENzZmxzckxmL3JsOFB0RFhz?=
 =?utf-8?B?eEI2dUtTWGZTaHR1RWRBU1RtcWp6Yk5TZk1xOW90cXh5M2c4L2lod2VVekNU?=
 =?utf-8?B?THVFakJGU1VqbS9JSU02NG10MFhjWVZXRzJ0ZE1WZ2kvS2ZXd0Mrdk9hWVFP?=
 =?utf-8?B?bTZ3UmhBUG9WcXZlSVlqMCtRNU10TDJPWjF1eHMydHdvZjNsODBMTEh5Sllu?=
 =?utf-8?B?VTZQdzM3amhWeGphK21EcXhOUjRXTmlNZDlDb0ZDTjErTnFSQVYydVJyczdM?=
 =?utf-8?B?UGEvMkVTUmdwazlUSjM3TEhTenA4UHBmZ1d6cUwvYkVCdUhXKzZtVE1pblNz?=
 =?utf-8?B?dlNHYWlPSENZNWVTWllVOWRjd1FzYTRMUCt1WUhJR1A3VHBEVFdCeG5XVHJr?=
 =?utf-8?B?eEYvaXBpaFRaMk9UcW1Pdkk4OUpRUXdoU1RtWmZObFZKVTc3cEtHR1NSaGIy?=
 =?utf-8?B?ckdyNmFzcG9zZkVZU2JBYlRVR1NXTVV2c25GWURDR293cGFhYVI4TVI1Ym1U?=
 =?utf-8?B?aGtKOWtXUURDeElHU0pqWDR2aEs0TCthTFd5cExHQzJHdm5yVkVnTWJiczBo?=
 =?utf-8?B?WERIUEZ2U0k4bm05cnFhOTdVSERZK1pXMUFPV2E4MnBXa0phKy9XZWpLWFlJ?=
 =?utf-8?B?N3hDSVNVSzE3cE5OK3ljNVRZTmtQZGVuY2YxNUxKaGVDWHBuSVdrMFdyVmhF?=
 =?utf-8?B?SEZrMHhLSnV2am1rMEpmUGhNM3B4SVM2ZjFLRzNEWVZEQWNqZ2tsREpBZUMr?=
 =?utf-8?B?VFUzNlFBVVVxVjFBTVo2RzZYOG9maTMyKzkwQWRFOFVSMWIzSEIzR1kzRTgx?=
 =?utf-8?B?Ym9CRTBMTnV0L2s0Qk9mRHI2TVFEdzFCYkVwa20yYUN6ZW8vaGF1SDlIdklv?=
 =?utf-8?B?d0Vwb2I1NGxwd2NYM1hiNXdlc3NoMEMxRDFhcDF3R2pGby9KYk11VFc2SHFF?=
 =?utf-8?B?Ny8relNRWnpBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4540E125C24C145BE1DAC90307552A1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652d601a-42bb-4b96-2e11-08d9952d1c57
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 07:25:23.0212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oleksandr_Andrushchenko@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4435
X-Proofpoint-GUID: 2T-jqHXG1trwMG4SsvThidavhT1DVmpy
X-Proofpoint-ORIG-GUID: 2T-jqHXG1trwMG4SsvThidavhT1DVmpy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_02,2021-10-21_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110220039
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
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

SGksIEp1ZXJnZW4hDQoNCk9uIDIyLjEwLjIxIDA5OjQ4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
PiBUaGUgWGVuIHB2IHNvdW5kIGRyaXZlciBpcyBub3QgZXNzZW50aWFsIGZvciBib290aW5nLiBT
ZXQgdGhlIHJlc3BlY3RpdmUNCj4gZmxhZy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPg0KUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4gLS0tDQo+ICAgc291bmQv
eGVuL3hlbl9zbmRfZnJvbnQuYyB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvc291bmQveGVuL3hlbl9zbmRfZnJvbnQuYyBiL3NvdW5k
L3hlbi94ZW5fc25kX2Zyb250LmMNCj4gaW5kZXggMmNiMGExOWJlMmI4Li43YmU5ZmJjZjc4OGYg
MTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3hlbi94ZW5fc25kX2Zyb250LmMNCj4gKysrIGIvc291bmQv
eGVuL3hlbl9zbmRfZnJvbnQuYw0KPiBAQCAtMzU4LDYgKzM1OCw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
eGVuYnVzX2RyaXZlciB4ZW5fZHJpdmVyID0gew0KPiAgIAkucHJvYmUgPSB4ZW5fZHJ2X3Byb2Jl
LA0KPiAgIAkucmVtb3ZlID0geGVuX2Rydl9yZW1vdmUsDQo+ICAgCS5vdGhlcmVuZF9jaGFuZ2Vk
ID0gc25kYmFja19jaGFuZ2VkLA0KPiArCS5ub3RfZXNzZW50aWFsID0gdHJ1ZTsNCj4gICB9Ow0K
PiAgIA0KPiAgIHN0YXRpYyBpbnQgX19pbml0IHhlbl9kcnZfaW5pdCh2b2lkKQ0K
