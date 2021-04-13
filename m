Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7B235D822
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Apr 2021 08:37:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0E281675;
	Tue, 13 Apr 2021 08:36:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0E281675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618295831;
	bh=7m0rDCPGw201e7nMnCne6zSW3fbN09fitlgh/nW+eZI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UzaoOxKYUAElSmCmRTgLFEQw/IfCu6uBRqGI+ie/C7L8wS343MrCUz0Dl46G/zUJ7
	 alkMgOhAF5itM5WodL3AoL6VpIbSpxObuaviBFeDvZVrRt0AkIKSkhQyAajEBLMLn0
	 TST7NcNpdjwmk1xe6XDEK9k+OtjlL5GYqBkzTzv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EDFFF8022D;
	Tue, 13 Apr 2021 08:35:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65E29F8022B; Tue, 13 Apr 2021 08:35:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C837F800FF
 for <alsa-devel@alsa-project.org>; Tue, 13 Apr 2021 08:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C837F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="P8A7Uu+2"
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13D6X2Qk031400; Tue, 13 Apr 2021 02:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=7m0rDCPGw201e7nMnCne6zSW3fbN09fitlgh/nW+eZI=;
 b=P8A7Uu+2R5cALjnApIrJUrtdC5ss0cKf/9umGUUPIhfziggX70r8D70sYZip+cDfA6vH
 3T0C61ojgX+lDaOUAW0OhA7ITTzOQvQCiZAd/zQg+BiFx6hHmlsA7/g1aYKg/3NRwg9Z
 iCsurnqeBruH38GCURcy5D57GoXWR/kIEzsvJwQe3pZRqXrn95FS39DltuJLawalAGpd
 wYbx8ohhP1UTOtTbgW/mjKj56Jb06glNfWbbfquy552rARupGIiUXSzRYnbs4qJp1Edw
 Mq2ewATSsJ1YSXOBo8ZtZruh0YX4hOIPS29zJ1UxvIOqoLU1UC2MLJjd4pv2sAdCTNZM Rw== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 37vs072kba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 02:35:29 -0400
Received: from pps.filterd (m0142693.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13D6QAoi118944; Tue, 13 Apr 2021 02:35:28 -0400
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by mx0a-00154901.pphosted.com with ESMTP id 37urykbv0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 02:35:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVbMjNdgblet8wdGSQQLX/G0K6JMKPiuFy5kAot+vb2BaZzZZOXsbAqOg+Ze+sTE3Hct8wfzgYpyu2LUNXLO1r5tisHCD8wzBJJ4R6PgHWf6cmiuoeiUMJVBW/3XYCpN0RJfE0RnTMG4gA57DJu58miDVrdV5Osc1o5f6+Yo2YtxcDgkoyf7BjWijG9REOr/m54q317KzWu1kh/EzE40CDaUrzJ7jf97LSCjAkk/GQGSDWzvhBHpqrA2J+G8NfHMMK2wFvkCHt1TphozLEjhD0xGO3sN0VUI36CkCr1jWJKo5Qo/oJH1I6lDB0s6FoqfXmYqimTeGn4V/E5QwTz9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m0rDCPGw201e7nMnCne6zSW3fbN09fitlgh/nW+eZI=;
 b=gEBXGKtwsjxXL5jLMcqRdEP2RqC1MeP0++b27Ea7tFfeL6M+GpSG0toDcUFCyrdHdrm/+l7FZXNlWWUTy8xNhIM8Ma3FJuRIMQEBTJJTtnlGsT7x8pyS+jSbhuvxSWd/aiTncM24LqnuNqdbUf7aUXGGAh8qNGMHddH5/9I5vMqP9l8cfSvJBfMHkHdrMexIuOV2BuIS+tZYcWDrbXFpvrodkyeEgzfR15gR7M/jVwRRJx2uZyPavSZkBOxNAWGlgbq/y15LeG1J/itr25bYv96btQbFzndrnhHaWat7hGt0T7yN0/jdAeGG8BJC5Ki9zcv1iuLSXc+PSdJosX5ZrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by BY3PR19MB4833.namprd19.prod.outlook.com (2603:10b6:a03:364::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Tue, 13 Apr
 2021 06:35:23 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a%9]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 06:35:23 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>,
 "pobrn@protonmail.com" <pobrn@protonmail.com>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "oder_chiou@realtek.com"
 <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>
Subject: RE: [PATCH v7 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
Thread-Topic: [PATCH v7 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
Thread-Index: AQHXL3z3zKvyLuVuUEyvwAGA66G/QqqwsVoAgAFNzdA=
Date: Tue, 13 Apr 2021 06:35:23 +0000
Message-ID: <SJ0PR19MB452892DD4BA9669B2BB2519C844F9@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20210412091919.27608-1-Perry_Yuan@Dell.com>
 <63b8dca1-83d0-09ab-3622-0baa68bbf776@linux.intel.com>
In-Reply-To: <63b8dca1-83d0-09ab-3622-0baa68bbf776@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Perry_Yuan@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-04-13T06:35:20.3461979Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=21e8ee9e-dfb0-4bae-8abe-f70bd5ae5725;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [163.244.246.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a17d09aa-9574-4a13-1b02-08d8fe465143
x-ms-traffictypediagnostic: BY3PR19MB4833:
x-ld-processed: 945c199a-83a2-4e80-9f8c-5a91be5752dd,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY3PR19MB483302FCCCEAD22C2028B159844F9@BY3PR19MB4833.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pKuqbNm0UyfBFtYsE/1w9GA4g4TVsijqp7bYN2cXwvRloT1Vb26TAYD3ZJxAydO+a7nxUXJigrigHEI5ubJLG3suu4RDu4lAu1yt45LubOgPHl9x5QTAbBqpY1GgcUUw2PrcwF3hYuBVosHc9SQ4XeoP+j4ogj06jvo+FOK9iCV4+adSezCjMgRSv9jMXXAdFZZjfED5qOVIDC+de2+FX/j0XoTc8ixaS9wYWjYxXFg6XEsihjtT6h6Xju+cmlTj1sLEGFnVJGsBtRVI3RtSkNml8lXllsJru9SyqG+sHWCbFgXbeoP+ht4f97hwi63GCOyHivPVoOvGxRG9YmZD939VzwKXiy7K4F3/VZLSG0k1ERtyyAlWXmwi/H7nWKxkMEJL1y0+P20F5hZapmdMDom6dpE+qrI4artfUv47JLn1X25jh9xCMB5jh17kDnI/XMAv/iuIvpQgTFoRPtf2bIA1Ohb1PdLvOQMx2Hm2x9b+oLBM5kvmAM9KRKE399Vern7NnAQH7zFHSp+nQ+85qJU1GNEaGBCXQNoT6sQKSuHCFPKI90bf6G6vXwZJmIehJIZGWY4+FJ/SUIAjKfvaFskGdpGyyHYPJkeHnt0AXy8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(76116006)(55016002)(66556008)(66476007)(64756008)(110136005)(66446008)(316002)(786003)(4326008)(478600001)(2906002)(53546011)(66946007)(186003)(54906003)(83380400001)(6506007)(26005)(7696005)(8676002)(86362001)(5660300002)(71200400001)(52536014)(45080400002)(7416002)(38100700002)(8936002)(33656002)(9686003)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cG1ZVm5saUFEdEhnVjhPSW1xODVUUFYxc0VHRmptMFpDQmdqM1NLK1Zwc3dV?=
 =?utf-8?B?WWJnRndhSnFnUXBiSVllSW5OUEJtaXdPY3lYdmJoWis5dURZVXhWamdMc1Bt?=
 =?utf-8?B?YUxtYnVPQWpURXMxVWYzZUtnWUJzY2NseXE2WHVzTDlUWU9GaWtjbGprVG9G?=
 =?utf-8?B?Z2hIeVJzSWdId0FDQXVEeGhjeXpoYlBJaWZMbGNYRmZBeXNBQTU5UzRpQkk4?=
 =?utf-8?B?UlZ0MDYrMk9xVXBzVXUxd3BDOEhoL3VIRVpaMzdTRHBwUGNCWDhhd3l1VC9T?=
 =?utf-8?B?K2tCMEZTTnF1dEs3amV4NEZCeStYZVJJZDVQYUxET2FmeHJiQkNqMzdzN3U1?=
 =?utf-8?B?SFdBN3FiQlNsdnZjYWlqc1F5SmtJY1BiYXJWSWFXdnhJVEZNZnU3RlM5WTZ6?=
 =?utf-8?B?ZjZwbGp4Y2dQMlFqZGI3emRlYXlaYWlXN3JJQW96VXN0a2t5eTgxeUVyZkY2?=
 =?utf-8?B?NVFkMHNnQkhvTUQzL1ZNMkxqSllhdkxnRXNmL2w3WGE3Y1UrRjNNd3N2c0lM?=
 =?utf-8?B?UE5YbkFObTR2QVB4YS9WNmdoK0NFa1V4bkx2YzRVRHpBNHBSMUg1MGtPSnd1?=
 =?utf-8?B?UjYycDN3Tm9XQkUyUlRZVFFDTEd0T2U3V2hYVDREK1I2NDl0K0pFSXFTb1B4?=
 =?utf-8?B?dGYvV2M2ejRxL1Fva2x0S3IyWTVoN1NJWi9QV01jMUNzcXRJSGJGazZTbEpH?=
 =?utf-8?B?bFFDWjdlSjVKM2lsandLbE50OXRDN2ZlWjlISHRVbE1SWWNvRGVRNmFaa0U3?=
 =?utf-8?B?aG1XUXJ0YjlNNW84dkhORC9ORjZrV3RjZ3cvQktvODhqL2YyUVBCQmlneWdS?=
 =?utf-8?B?MkhiQUY4b1pVTTdvOXJqOVJJSW5SeXo1d3A0OW9URVI2c3A3Mmp5NEFaWEc1?=
 =?utf-8?B?S1dnOGFpOTdWQ1AyRHZsVm1wNVlsL1ZkSFd2SjhaMm8yTEppT2VZVHR1eDZu?=
 =?utf-8?B?c3RmRkJvRnlEVm5MdTdGbCswblZsRG1QQ3dmYitXUXo3ZHJNSmNwQ2JUYlk0?=
 =?utf-8?B?OEFYT29keERXMVNSeFVIdEg1NWdScThacFBUWWFDVkRJWXcyUlF4ZGhOa25T?=
 =?utf-8?B?OFdndVY2Tm9XU0UxeGVhWnRGV2RpOG9WaTNWUUlLSXBsa0lTbHJma0tCWFk4?=
 =?utf-8?B?UlRScnlMU3VzNVhzd2l5elFLZGZPZS9aZEVNanhuenVYNi83bzh5UE9GQWFZ?=
 =?utf-8?B?R3NBQVpXS2U3SEVwaWRyRmhEcFdyK2lUQzgxWnNyV2UwZWd1c2tPQi9qUU5G?=
 =?utf-8?B?eW4yOFY4ZWw5cy9aQys4bEFzUFdiMHBZY2dONzNMdUlxM3VYZW9lcjVFRmhJ?=
 =?utf-8?B?WFYxRVJXM2YwSThGUjZ3dHlvcFdPVWJZT1Bsb1JIYWErOWFRUmNJQnJpbEth?=
 =?utf-8?B?TlM3SzJhcEJ1UGdUVjU1WUZjRmdma05Id2o3YUhiSWFQSVhoV0NxNXQvQmtT?=
 =?utf-8?B?NklOeTZBZkhZTXN4cTJZL3JXWDNFMUE3aUl4alJuOE5kMXRWNjdUUGpKSHUy?=
 =?utf-8?B?ZDB0NFVmZ0lEU2N0YTBTbUlWbCtJMkJHQTJOSHhYRHYvZnBWUWI4aEFyK0FZ?=
 =?utf-8?B?ZHlVRzljODdkTzZJYWNDRlhDeDU2ZlhEVEhIQXRaVGF2V1YvQ2pCWFpqbFRU?=
 =?utf-8?B?TzdJak4rdWNYOE4rQW1YdVlHSEZ3bWszeHRJTjVuTjkrVU5WOGo5TnJia1Js?=
 =?utf-8?B?MGJidjFHOEVFKzZTY0ZSMEF6VlBGajQwMUFodVpSZmE0YWVLb21qbk9NYmFT?=
 =?utf-8?Q?ixz/qKYbDmwhydeNcWBwzCUuD/zWTf9QCxFGAN6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a17d09aa-9574-4a13-1b02-08d8fe465143
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2021 06:35:23.6427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GpFcpviASme5/o3L64QVplDOVrhXvxr7UnYxZigt5iIZ6fMywHOYiv6mxinyxWt9PODI7gTB5zvrbhoiR7k1ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4833
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_01:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104130044
X-Proofpoint-ORIG-GUID: ZmDMC6Cbvpzd919eL226THLbfdhMGaQ3
X-Proofpoint-GUID: ZmDMC6Cbvpzd919eL226THLbfdhMGaQ3
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130044
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Dell Client Kernel <Dell.Client.Kernel@dell.com>,
 "mario.limonciello@outlook.com" <mario.limonciello@outlook.com>
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

SGkgLA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbWFkZXVzeiBTxYJh
d2nFhHNraSA8YW1hZGV1c3p4LnNsYXdpbnNraUBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IDIw
MjHlubQ05pyIMTLml6UgMTg6NDANCj4gVG86IFl1YW4sIFBlcnJ5OyBwb2JybkBwcm90b25tYWls
LmNvbTsgcGllcnJlLQ0KPiBsb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbTsgb2Rlcl9jaGlv
dUByZWFsdGVrLmNvbTsgcGVyZXhAcGVyZXguY3o7DQo+IHRpd2FpQHN1c2UuY29tOyBoZGVnb2Vk
ZUByZWRoYXQuY29tOyBtZ3Jvc3NAbGludXguaW50ZWwuY29tDQo+IENjOiBhbHNhLWRldmVsQGFs
c2EtcHJvamVjdC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxnaXJkd29v
ZEBnbWFpbC5jb207IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnOw0KPiBicm9v
bmllQGtlcm5lbC5vcmc7IERlbGwgQ2xpZW50IEtlcm5lbDsgbWFyaW8ubGltb25jaWVsbG9Ab3V0
bG9vay5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NyAxLzJdIHBsYXRmb3JtL3g4NjogZGVs
bC1wcml2YWN5OiBBZGQgc3VwcG9ydCBmb3IgRGVsbA0KPiBoYXJkd2FyZSBwcml2YWN5DQo+IA0K
PiANCj4gW0VYVEVSTkFMIEVNQUlMXQ0KPiANCj4gT24gNC8xMi8yMDIxIDExOjE5IEFNLCBQZXJy
eSBZdWFuIHdyb3RlOg0KPiA+IEZyb206IFBlcnJ5IFl1YW4gPHBlcnJ5X3l1YW5AZGVsbC5jb20+
DQo+ID4NCj4gDQo+ICguLi4pDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3Jt
L3g4Ni9kZWxsL2RlbGwtbGFwdG9wLmMNCj4gPiBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2RlbGwv
ZGVsbC1sYXB0b3AuYw0KPiA+IGluZGV4IDcwZWRjNWJiM2ExNC4uZTdmZmMwYjgxMjA4IDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2RlbGwvZGVsbC1sYXB0b3AuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2RlbGwvZGVsbC1sYXB0b3AuYw0KPiA+IEBAIC0z
MSw2ICszMSw4IEBADQo+ID4gICAjaW5jbHVkZSAiZGVsbC1yYnRuLmgiDQo+ID4gICAjaW5jbHVk
ZSAiZGVsbC1zbWJpb3MuaCINCj4gPg0KPiA+ICsjaW5jbHVkZSAiZGVsbC1wcml2YWN5LXdtaS5o
Ig0KPiA+ICsNCj4gPiAgIHN0cnVjdCBxdWlya19lbnRyeSB7DQo+ID4gICAJYm9vbCB0b3VjaHBh
ZF9sZWQ7DQo+ID4gICAJYm9vbCBrYmRfbGVkX25vdF9wcmVzZW50Ow0KPiA+IEBAIC05MCw2ICs5
Miw3IEBAIHN0YXRpYyBzdHJ1Y3QgcmZraWxsICp3aWZpX3Jma2lsbDsNCj4gPiAgIHN0YXRpYyBz
dHJ1Y3QgcmZraWxsICpibHVldG9vdGhfcmZraWxsOw0KPiA+ICAgc3RhdGljIHN0cnVjdCByZmtp
bGwgKnd3YW5fcmZraWxsOw0KPiA+ICAgc3RhdGljIGJvb2wgZm9yY2VfcmZraWxsOw0KPiA+ICtz
dGF0aWMgYm9vbCBoYXNfcHJpdmFjeTsNCj4gPg0KPiA+ICAgbW9kdWxlX3BhcmFtKGZvcmNlX3Jm
a2lsbCwgYm9vbCwgMDQ0NCk7DQo+ID4gICBNT0RVTEVfUEFSTV9ERVNDKGZvcmNlX3Jma2lsbCwg
ImVuYWJsZSByZmtpbGwgb24gbm9uIHdoaXRlbGlzdGVkDQo+ID4gbW9kZWxzIik7IEBAIC0yMjA2
LDEwICsyMjA5LDE2IEBAIHN0YXRpYyBpbnQgX19pbml0IGRlbGxfaW5pdCh2b2lkKQ0KPiA+DQo+
ID4gICAJaWYgKGRlbGxfc21iaW9zX2ZpbmRfdG9rZW4oR0xPQkFMX01JQ19NVVRFX0RJU0FCTEUp
ICYmDQo+ID4gICAJICAgIGRlbGxfc21iaW9zX2ZpbmRfdG9rZW4oR0xPQkFMX01JQ19NVVRFX0VO
QUJMRSkpIHsNCj4gPiAtCQltaWNtdXRlX2xlZF9jZGV2LmJyaWdodG5lc3MgPQ0KPiBsZWR0cmln
X2F1ZGlvX2dldChMRURfQVVESU9fTUlDTVVURSk7DQo+ID4gLQkJcmV0ID0gbGVkX2NsYXNzZGV2
X3JlZ2lzdGVyKCZwbGF0Zm9ybV9kZXZpY2UtPmRldiwNCj4gJm1pY211dGVfbGVkX2NkZXYpOw0K
PiA+IC0JCWlmIChyZXQgPCAwKQ0KPiA+IC0JCQlnb3RvIGZhaWxfbGVkOw0KPiA+ICsJCWlmIChk
ZWxsX3ByaXZhY3lfcHJlc2VudCgpKQ0KPiA+ICsJCQloYXNfcHJpdmFjeSA9IHRydWU7DQo+ID4g
KwkJZWxzZQ0KPiA+ICsJCQloYXNfcHJpdmFjeSA9IGZhbHNlOw0KPiANCj4gQml0LCBvZiBuaXRw
aWNraW5nLCBidXQgeW91IGNhbiB3cml0ZSBhYm92ZSBzaG9ydGVyOg0KPiBoYXNfcHJpdmFjeSA9
IGRlbGxfcHJpdmFjeV9wcmVzZW50KCk7DQoNCkdvb2QgcG9pbnQsIGNoYW5nZWQgdGhlIGNvZGUg
YXMgeW91IHN1Z2dlc3RlZC4NClRoYW5rIHlvdS4NClBlcnJ5Lg0K
