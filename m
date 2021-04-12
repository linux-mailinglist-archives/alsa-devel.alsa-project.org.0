Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F183E35C19F
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 11:32:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 811A71614;
	Mon, 12 Apr 2021 11:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 811A71614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618219938;
	bh=ZQhy74bNIhyQX3BffEBoeZLI4XEGKyKBJi+4Lmuayqo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O3sM7n9gMYz81OX8BxX05BfRyj2RZ5iB/vcOoaieUdc8VQFcpACq/5yLzROsYiCWb
	 S/ckZv5rY9dzGV3RVs57XO4QuP1vn+eFnPK83+AoHQdrbxCpIwF464OPYdHZZTLT/v
	 v13p6RwbfGmhaWlp4tA6cuAdEIqd6GMKGLzrH7F4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF61AF800FF;
	Mon, 12 Apr 2021 11:30:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60572F80269; Mon, 12 Apr 2021 11:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F1ADF8013D
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 11:30:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F1ADF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="ABpMKnI/"
Received: from pps.filterd (m0170395.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13C9Sd25017917; Mon, 12 Apr 2021 05:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=ZQhy74bNIhyQX3BffEBoeZLI4XEGKyKBJi+4Lmuayqo=;
 b=ABpMKnI/63VPBgR7txVAvYhGMMEjJFrX8AdwW5cIQ9gozUu0x44S9JksiYOIK0LjfPgs
 z5GyPKSjIZZcF1HHskPvPUIkjGkKK+C/m/gNpYK2tbNJeqBnIpzfJA2a6mxztzh92/og
 1kHyyZqI2fWgQOxEnExWymnEJ21mTwGTyqrs9Z1+LXiXb3DoVuJdzqaoQ5IOTRyxM2po
 zjv7mssn4E8pJFgM6ndzyqTC4fY9nrupIGczgEJjEVSDnoK1GdhPkVHNKAms9IH/7r1f
 LFxzTDsWqzsRNuKk9D4M31l6PqpTXoDHJQ4pWZYsPwybWQXGZEFxvL1sNnWHhFsnLRRT gg== 
Received: from mx0a-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0b-00154904.pphosted.com with ESMTP id 37u8pqmkmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 05:30:28 -0400
Received: from pps.filterd (m0089484.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13C9PI68079040; Mon, 12 Apr 2021 05:30:27 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by mx0b-00154901.pphosted.com with ESMTP id 37usb9n9r8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Apr 2021 05:30:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyZ3UFVCx8+OHD7NKyfiBOnlm5LpKRkMfco4YhvX9kuocNHUslsfNDNNy8dw7k3Lfj/1SLkXeukSVZLEIfQf5UyeO/+jQJkDyf+MLh4cd9DdJRTUTt0e3r7G9kz3gs57axhu/ApmmTH8P42LUq1B48zjekpB0bWaXfM/FqAcARaJvYXNUJBouaLQZ4HLKuSeCUsKOQhuHrdIhWOQ+7l2Nwrr6RvD/6/uTPyOP7en1gBOP2TYVlrZejDXYOtXXX3bJDAB2mMvReeRCn5KL2rJ75HE4OtFpBwqiUtMp3gbuAvHcyNl408qADhO11zPkCBTKjWGA9UMADUdvOyqqWBQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQhy74bNIhyQX3BffEBoeZLI4XEGKyKBJi+4Lmuayqo=;
 b=jRQYE5FwKlDbsVln+CAYtOEIyVu9kKQmEE/7Ai9mRHI7dgid8VGH0GGWMGmPpWMNdPabx2tLLjLH/xDJVVktr2kGhNGK5adNrckfaBhvqmD6g96T+Rle5vwWwQVoho6xZD1XvSgWDVV19P/rlyphLP5rzXylHgv4lU8IO9KUbesqN2sq/mR9UTX8wHX/8syreRGynOycSr99l0IVYHtK9KL5lQIk5Yheti5+WD7BSzuT2OMwAsODVyGNJdvtHanS+RTkiBdgXH2AT26Xc55A0zaYyDl+JSb7SSWuAq/wAZpdeWg3HE55wFU3SfOX2Kt8QGKhWLXinKgFYfFwLLhhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by BY5PR19MB3940.namprd19.prod.outlook.com (2603:10b6:a03:227::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Mon, 12 Apr
 2021 09:30:23 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a%9]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 09:30:23 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v6 2/2] ASoC: rt715:add micmute led state control supports
Thread-Topic: [PATCH v6 2/2] ASoC: rt715:add micmute led state control supports
Thread-Index: AQHXKS0KHFZqF0PjHEmTWK9BqS/Ml6qpL1wAgAd6TAA=
Date: Mon, 12 Apr 2021 09:30:23 +0000
Message-ID: <SJ0PR19MB4528CC82A09AE20669BC26D084709@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20210404083159.1620-1-Perry_Yuan@Dell.com>
 <20210407151534.GE5510@sirena.org.uk>
In-Reply-To: <20210407151534.GE5510@sirena.org.uk>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Perry_Yuan@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-04-12T09:30:19.8010512Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=2818970d-d27a-4239-9b5e-e2cd033b40a9;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [163.244.246.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd8d3b5a-cecb-4839-b55b-08d8fd959960
x-ms-traffictypediagnostic: BY5PR19MB3940:
x-ld-processed: 945c199a-83a2-4e80-9f8c-5a91be5752dd,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR19MB3940E526FE2F5987B166D12C84709@BY5PR19MB3940.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W2gWm/VRyqWjTbj4gVhToc8Vs8VAy0N1zkOt4dgfmx5qit9p0qp3VaOkulJvdFS4uwJBJSYmH8TdmCZU6XDjgLCxP3F5QZRmgGskb8aIKSQmDwIorZhbufk4atA6nnzYMXRIXo/jKnMyfsN/9XVJ+iB/jWFuDAKg8e99y6DvJ2V6Y9hLazCBwxjwojVOvYzleEiAfymLVqGp9aeYcsJiAcbydhylcmAtWY8dqUanxDDOA09FFd2eWk7bOCoyJi7M5nUxzawAHrRRIHlMFWxY7KKRuELU3Phm6u2WNWdZp9eEEg5VgKRAghQcS3t62hFeKTPr8Yejfg44wpAAhzkNb/U1geqYe+M5vZq83AEL248WP8PZwmU4mzupqOqyZk012TQTwd6aw/ljqDUzxgcMZ+t5wFUUBJYs4slrlR21/FaA04eOYJhgiB/+lhfLLy0GYvBmrNE4AGI8d/5xWzufZz75/xQU8+zt6ci/WG35xUUuh5uZrQSM8+RB8DRjdNKzzU1LYU6av0IiLXv9IU2TffYy5xg/LzTy7FIsuvAOOFo9A30eWEi7X1BB9/j1CuUbH5qZs3G9ssY2sqXlNJkL2b2aHMW3eA5WzCXKfozpxfY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(7696005)(478600001)(66446008)(7416002)(4326008)(8676002)(55016002)(107886003)(38100700002)(66556008)(64756008)(9686003)(2906002)(8936002)(53546011)(33656002)(86362001)(26005)(66476007)(83380400001)(6916009)(5660300002)(71200400001)(52536014)(45080400002)(6506007)(54906003)(316002)(76116006)(186003)(66946007)(786003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SjJiL1M3ZmgvSVI5UlBaS1haVUl0bUJQQjQ5dXo0MVZSWHVYMHNacFE2WkJE?=
 =?utf-8?B?cURRQitaOVpoTk15ZHMyd0RKdndTdTZoZHFkL01pZVZpcjFuZCtHb0dpdXJJ?=
 =?utf-8?B?SXh3V3l5MzlOY2ltcUxLMGs2bVEwYlBuVFpqRVFxTkRaVW80NzY1TnF6MzBH?=
 =?utf-8?B?aVl0R0pNeEQ3ZjFUNkdNSjFzR28zcGdwbE85cGlUQnMzRnpydDVEUnVvcW5a?=
 =?utf-8?B?cVpDdXgvem9WUThLaENsZUo1MHdHYWVpdUU3allGQzNNVjY0MzdHUGpqRnFX?=
 =?utf-8?B?Yk04R2tYdEZEeFNXMElpVW1rQisyTjZWQjVjWmVoMHFrRkpuczMvMWdWNFpw?=
 =?utf-8?B?dU9MaUVPMWxNazhzNis3bFRLdXk1cHlSR3dLdTBCaXB2NE4xcnpLTHFsQ0Jk?=
 =?utf-8?B?RDUvOElNc2drMDZySHRacjlST0I5bjVVOEY3RWx2Z0tCWTZXck5aMmkzOGg0?=
 =?utf-8?B?cmtMZC85Qmh5MU1URFI4ZkQyZ1JzemFha3FpZktDeVk4M0xvb0pMRGlWVlNw?=
 =?utf-8?B?UzUvU0pLY0NSUDVRL3BGbjJCdExzdTdXMFBkYTFSbTRsYzd4Y2NYYVlHK2FM?=
 =?utf-8?B?blhVbzZTbHVKRGNjRjJKSlRpcnJMQVpaaG05Y3lEVkFzem5iTjh6ei9YZ2RI?=
 =?utf-8?B?dHFtVXhuYTNrM0tYMGR6bnlvNk4yUFRtMWQ4QWFwR25ZL3E0WEdNTUoxaFNo?=
 =?utf-8?B?MmxtdllzYVBGR1Fnc2w1aGxpUE9xN2pGdEMyN0ZzdHF5K0dud3BrM2tEOGFF?=
 =?utf-8?B?L2JSQnFyUzFzTmViVG1xZFRmbkVCU1diT0tRamdYYVBCV2pwQzRqK0xnUDcv?=
 =?utf-8?B?Q0tJUmkyMjFQSU11blZqallNZkIzNDR0VWtkV1lzN2N2aVJEZjRxVnUyRzky?=
 =?utf-8?B?STVhT2lGa05LZXhybm1BZmFDcFBEUWd1RjF3RUNodVFMYVlpNGVGQ3dpN3Zx?=
 =?utf-8?B?SzZxWnBURVVwR3N4K3R6aERBTU1YRVVYYS9OMTRoYlQzRDNaWUYvQytWbnBI?=
 =?utf-8?B?ZTFuNmRScGVzb2tWOC9wZ3hoamRCMHY4SGlIWjBQMlYvWHpPeCtFSFdXeWFG?=
 =?utf-8?B?WXEvUDY0NC9zaG16SE1LOG5LSzVxUThTbm1DcjNKaG1rSDJFcTgrNThRV3Zl?=
 =?utf-8?B?dTJxaWVqckhmWWpZMS9sNWxQUXFUSnA3RVJWb2Q3aENNWVBVendZRVVIYmx3?=
 =?utf-8?B?MVFTbGlaMEZtcUZCTzMydzVPRkdNcDNrWDNVR1RLOWFOZTlra3dhaE1uOXkx?=
 =?utf-8?B?cEhLc0F3K09HNUVqTTlXTGJOdWFIOXFoVW5iVzlPSmdnQnJSS3RSQWZhclhJ?=
 =?utf-8?B?NTEweThaRHpMVXMwU29UdDlZMW4vT3pxZW00YTlaVEdGLzBBQW1RYk96WDA1?=
 =?utf-8?B?dWhSU1ZlZDIyYnpLZTFXUGI2REc0VWU4UjNwc2taVmRPT1RYUWo3Z2xkNHE1?=
 =?utf-8?B?L24rZFlDWWRkZjdsWGp4ZVVtMjJ5Wi9XbTZ3ZHRrY1doL0VqaDFwbXRQWUpG?=
 =?utf-8?B?MTd2K0lVUVRCdWx6SnUxY1RjNm1jSHRsbnRzVVRRRy9rWTlBbkZ5VzNGWGdS?=
 =?utf-8?B?cUZJdkN4cWNuZWt1Sy91NU8wVm03d2NPRi9kQTZHa210Q1M2aU5Md0JOWXA3?=
 =?utf-8?B?Wm1WbGcxN28vZk1TcEI3dkpBUU5FbFJsbE5YMHVURGk3TnF1NmxJS1ZTZ282?=
 =?utf-8?B?Y2syTWdDVXRReGdMRS82YXBCUWdYazNoekRoUExQbTNQOXVQSGJ6S2x6V0Na?=
 =?utf-8?Q?6k+1sVhbzyT+5Wix8cpYhjFBkCQOWbnSswNkACb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8d3b5a-cecb-4839-b55b-08d8fd959960
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2021 09:30:23.7295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cNwu8k9tJth/4rrwfrzpAbTHQXfHpmNHI4y4AHy8P44RnCsiMlhh3TUzcrr2mKHHhCjdlpmcOqkm28T5HQQEUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3940
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-12_07:2021-04-12,
 2021-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 clxscore=1011
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104120062
X-Proofpoint-ORIG-GUID: Bsyj4TsRPPnTT24C62v9wxZy28NzA3kk
X-Proofpoint-GUID: Bsyj4TsRPPnTT24C62v9wxZy28NzA3kk
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104120062
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Limonciello,
 Mario" <Mario.Limonciello@dell.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "pobrn@protonmail.com" <pobrn@protonmail.com>,
 "mario.limonciello@outlook.com" <mario.limonciello@outlook.com>,
 Dell Client Kernel <Dell.Client.Kernel@dell.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

SGkgTWFyazoNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hcmsg
QnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4NCj4gU2VudDogMjAyMeW5tDTmnIg35pelIDIzOjE2
DQo+IFRvOiBZdWFuLCBQZXJyeQ0KPiBDYzogcG9icm5AcHJvdG9ubWFpbC5jb207IHBpZXJyZS1s
b3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbTsNCj4gb2Rlcl9jaGlvdUByZWFsdGVrLmNvbTsg
cGVyZXhAcGVyZXguY3o7IHRpd2FpQHN1c2UuY29tOw0KPiBoZGVnb2VkZUByZWRoYXQuY29tOyBt
Z3Jvc3NAbGludXguaW50ZWwuY29tOyBMaW1vbmNpZWxsbywgTWFyaW87DQo+IGxnaXJkd29vZEBn
bWFpbC5jb207IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgbGludXgtDQo+IGtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnOw0KPiBt
YXJpby5saW1vbmNpZWxsb0BvdXRsb29rLmNvbTsgRGVsbCBDbGllbnQgS2VybmVsDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjYgMi8yXSBBU29DOiBydDcxNTphZGQgbWljbXV0ZSBsZWQgc3RhdGUg
Y29udHJvbA0KPiBzdXBwb3J0cw0KPiANCj4gT24gU3VuLCBBcHIgMDQsIDIwMjEgYXQgMDQ6MzE6
NTlQTSArMDgwMCwgUGVycnkgWXVhbiB3cm90ZToNCj4gDQo+ID4gK3N0YXRpYyBib29sIG1pY211
dGVfbGVkX3NldDsNCj4gPiArc3RhdGljIGludCAgZG1pX21hdGNoZWQoY29uc3Qgc3RydWN0IGRt
aV9zeXN0ZW1faWQgKmRtaSkgew0KPiA+ICsJbWljbXV0ZV9sZWRfc2V0ID0gMTsNCj4gPiArCXJl
dHVybiAxOw0KPiA+ICt9DQo+IA0KPiBUaGlzIGlzbid0IGhvdyB3ZSB1c3VhbGx5IHJlY29yZCBE
TUkgcXVpcmtzLCB1c3VhbGx5IHdlJ2QgcXVlcnkgb25jZSBvbiBwcm9iZQ0KPiBhbmQgc3RvcmUg
dGhlIGRhdGEgaW4gdGhlIGRyaXZlciBkYXRhIHN0cnVjdCAtIHNlZSBvdGhlciB1c2VycyBmb3Ig
ZXhhbXBsZXMuDQo+IA0KPiA+IEBAIC0zNTgsNiArMzg4LDcgQEAgc3RhdGljIGludCBydDcxNV9z
ZGNhX3B1dF92b2xzdyhzdHJ1Y3Qgc25kX2tjb250cm9sDQo+ICprY29udHJvbCwNCj4gPiAgCXVu
c2lnbmVkIGludCBtYXNrID0gKDEgPDwgZmxzKG1heCkpIC0gMTsNCj4gDQo+ID4gKwlkbWlfY2hl
Y2tfc3lzdGVtKG1pY211dGVfbGVkX2RtaV90YWJsZSk7DQo+ID4gKwlpZiAoaW52ZXJ0ICYmIG1p
Y211dGVfbGVkX3NldCkgew0KPiANCj4gVGhpcyBjaGVjayBmb3IgaW52ZXJ0IGlzIG9kZCBhbmQg
Y291bGQgcHJvYmFibHkgdXNlIGEgY29tbWVudC4NCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4N
CkkgYWRkIG9uZSBzaG9ydCBjb21tZW50cyBmb3IgdGhlIHJlYXNvbiBpbiBWNyBwYXRjaC4NCkkg
dHJpZWQgbm90IHRvIHVzZSB0aGUgaW52ZXJ0ICwgdGhlIExFRCBzdGF0ZSBhbmQgbXV0ZSBzdGF0
ZSB3aWxsIGJlIG5vdCBtYXRjaGluZw0KU28gaXQgaGFzIHRvIHVzZSB0aGUgaW52ZXJ0IHRvIGNo
ZWNrIGlmIHRoZSBtdXRlIHN0YXRlIGNoYW5nZWQuIFRoZW4gbm90aWZpeSB0aGUgbGVkIHRyaWdn
ZXIgZHJpdmVyIHRvIHNldCB0aGUgbmV3IGxlZCBzdGF0ZS4NCg0KUGVycnkNCg==
