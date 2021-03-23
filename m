Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 176823457BA
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 07:24:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE97915F2;
	Tue, 23 Mar 2021 07:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE97915F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616480644;
	bh=/R0f29dyCuD8G7l0maLQNHDmeWsvVEohfjSdS4DVDnI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=silHQgpF36RJhRCG1Y1dySMA3FYg3QIOJ3t+o4y3ypGctddz2YaTF2kEDN8riITR/
	 WZAGGfpwIKH81HPS1otJ7Wh/Bdc5J5taYPleY5GxQEch/OL6OluRgNmUhFSdp01c/H
	 GT6jph4zDoXFexAY10EuZSOhFVM4s4H1ZhEvZdAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7673FF80268;
	Tue, 23 Mar 2021 07:22:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 492C0F8025F; Tue, 23 Mar 2021 07:22:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F8A3F800EE
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 07:22:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F8A3F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="KZrThOPN"
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12N68oFq000751; Tue, 23 Mar 2021 02:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=/R0f29dyCuD8G7l0maLQNHDmeWsvVEohfjSdS4DVDnI=;
 b=KZrThOPNNLYrqa2K5mJ5s0x1hJEwBaBYkaFutwhxajHco+P3VpMNKIxxyptleyra0v2t
 k9ERbql/44c3MLv0ujUrWoFnzi7t945ARs1XNCJSlukIE277ChTbRZQa9qgqb9uxCZbJ
 X7MKoBjB+Zk98AZe0rrlepIea+x0A6BuMyad58HP1ofNbEM1mJ2h0dxD8ThTb/3k6hfq
 /reeQgTQ1gSioEhQSvGne/ew2Sr+8AjWubFaXtJWdQ6i+uw5FMvQDDKEXZEfo4/xd6GF
 XRCz7TSGw1YyKDQNtYMkKSdQWPnclhphh1lLp+SEV8Pd+btoCGgHmXRMvtZYppsIVxzA 6A== 
Received: from mx0b-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 37dcch8871-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 02:22:25 -0400
Received: from pps.filterd (m0090350.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12N6A2V3043420; Tue, 23 Mar 2021 02:22:24 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by mx0b-00154901.pphosted.com with ESMTP id 37dx98248s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 02:22:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhxOOrSYFZBtg4udJyJLo9t6CuZaDLSlY/a8fyIBTp47ZBdaKA18cJbiTNczbdE6PmmZSGlkPa8WGvWNGuTxzn7+XCaBaIZFRIkyoQDfiemcADZlv917pb1S1HzmSbKuKu6vXSeJPLknvZiOXBus1La/KP6zrkSIL0b0oKFTrnenFmxoLNzSxbxqdZmZEwNWaLpQjb6Tnvd+kRRYCbN8fDtu5eDWH1B8QQC5OgKP9kzPrU0l001vp2GucjFcZvq8u/wkPxJG6vGB5Lmr0NnIEZJrFBexYoaGlH+crrk+PvxKDYZsuK6pGtd/pRW6XW4yZ5lXbJqHl37dgDBckCALuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/R0f29dyCuD8G7l0maLQNHDmeWsvVEohfjSdS4DVDnI=;
 b=ESn8f8bsmQhArRHm6AhHtHpSXxMV+m9l2z3FZfoM8dr8B0cIMPrIMTNF2Uhu7E2OND7ZygvphahDmfecGkidWo8/9WFIK5l3kd1wvmBSa8bpl5MeSST1809rJK6Ol8y9Vb4S368WIlLFTMozT9z+sCBLcbAk0WEZQwErxL465oGJK/hlulBbkp2ZDGIYElu5y60BaWDjVntxagZHeeT8qE3dx17WfAGkVZw8ttdkkGBKdNvipwr3QHyEj2t4yFgMA0vIWYWFSey/l1Q8hiAeGSjpaCTBZQjYy4+zJ80/U3Nn7Ta3qFvKnNj0BUnUuqHA2V0eR8iLoGUUJNDiRj5ddQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by BY5PR19MB3208.namprd19.prod.outlook.com (2603:10b6:a03:189::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 06:22:21 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 06:22:21 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Perry Yuan
 <perry979106@gmail.com>, "pobrn@protonmail.com" <pobrn@protonmail.com>,
 "oder_chiou@realtek.com" <oder_chiou@realtek.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "hdegoede@redhat.com"
 <hdegoede@redhat.com>, "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "Limonciello, Mario" <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
Thread-Topic: [PATCH v4 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
Thread-Index: AQHXDn6k5wL8X7p9nkSEGx5tlL+jsqpvMTMAgAqBXeCAAJhsgIAUZueAgAGGVQCAAQPTgA==
Date: Tue, 23 Mar 2021 06:22:21 +0000
Message-ID: <SJ0PR19MB452877CA9A69970F750EB64184649@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20210301093753.16300-1-Perry_Yuan@Dell.com>
 <551e30d2-0211-f3cb-fbb8-ee5b2f22a851@linux.intel.com>
 <SJ0PR19MB4528E7C88C955D2EE96CE3B484939@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <ab14a0b2-3f3a-3796-8baf-76e635d82340@linux.intel.com>
 <58d2e2f2-e552-6ecf-b1c3-bf38ad5d2e35@gmail.com>
 <7e0fc125-5a26-47d6-aa2a-7cd1b2580adf@linux.intel.com>
In-Reply-To: <7e0fc125-5a26-47d6-aa2a-7cd1b2580adf@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [163.244.246.207]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b25fd14e-f0bc-4a36-7c03-08d8edc40431
x-ms-traffictypediagnostic: BY5PR19MB3208:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR19MB320899C49106129A46B577DB84649@BY5PR19MB3208.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P/WuWyRUty8AI15WeKn0PAYQ0KPEhS+unlFgur7T7fBhxfDkwHNDH1QnFzI/8+W41HzK14vqU5LbSp4t4gIBEVNACF4kratxiM8z0cSI7Gb+duEWUR1fyOTtpbaPta7nnrgQDXsxE8EN1B2wSkuEgeFal2hGB0Qu9Ui5v8p+jB7kIGD7aHoBvYNKjl3rdYDDZZLWalV0MxYfkRvSw1oYC0rA77OBic2V2fWYHa8wq7n+KPkNYtdFcZQB8rak9pKiRuPDVG69k+p72zk9qpm56dmeJz85akwH0lfWAo4YyBQQWqSnMZNzKn5BIBebAX8s6M9yd8x2uc2vPWSJYfVFf0AjJUs6UgaUglpejkMSlEhbGjibJWLYTZxc7jGbZq2rp9lXVCagQtYETc3/2kpTXFQbDaOdwQAz/WxgYksIiKUkU9sVjZOoz4OXH2bQIN1cyll7WBSyzjxVX6wE5RJnHg7m8hRf4hPzb2+U3N+KHCfxoXVRqQ6/FrRc/NwxspP5zdA7epNIPS/ql6mSG/aMqTQbb/tpFFQCw5ZZzu9WOFHMjcaOqGIvDiN1xEst1Az92h+CMp902iPAlFGCR1uh41uWMMHvR4Q8vTzrvJQrNr9kCPN/mUptp1LfIiVN0uS7EF0c1qZg3eDheYOs92ukL2hEKaQMDfg8lv+ozgiSGmcOKcq1VaTEIN3CPATycOpp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(83380400001)(478600001)(71200400001)(186003)(26005)(8676002)(8936002)(33656002)(86362001)(38100700001)(2906002)(921005)(52536014)(7416002)(786003)(9686003)(55016002)(54906003)(316002)(53546011)(76116006)(66946007)(110136005)(6506007)(6636002)(4326008)(64756008)(7696005)(5660300002)(66556008)(66446008)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?U0hoR3JTc1dSU3NUejQzQlFKbW9vdDRXQmhESU1yVnd1RFd5WFFMUnRoOW5Q?=
 =?utf-8?B?Q2NxbmRKWUZqTkZpeXFDYXUrMUxKYnppUUVLYVpSL0JaT3Q2N1FwYXhUOFM4?=
 =?utf-8?B?WjByekM3OG5TSTZxOG9NbFZBWE9vZWFoTVN4a1RnVWtJQ3ZxdkF0S2loNUIy?=
 =?utf-8?B?bHk1aTNMMGVmUUIrbTkwd0JEL2xnUTEzcUNKaDQ5d1krZDhmVmJlMFN1eEc0?=
 =?utf-8?B?a3RiL0FBeUV5dWpTYXFraEhYemRaWjVFT3ZKdkk0MldsSDFDcVY0UXQwZE5n?=
 =?utf-8?B?UnNZVHpuWVluOUhIQzhhbllLekVWQUFzZmErL0JjV1VlSEpvWUtBbE9Qb2xD?=
 =?utf-8?B?N1V0RXd1VlMremdtRTZzSEJCSnBGbjFSUksxRGJNZ1VKUzFweFd3QjdKd05n?=
 =?utf-8?B?Q2lScDZndFl0bzIzUWw5ZGJkWTZtT0M5NWhsWHdCYWpZWTM3WXoxMlg5bmNJ?=
 =?utf-8?B?SlhIVFlCSnZXTFUxeTEwS0tnam4yN0R0NTNVeEFCYitVTnFhM0VEbmdYaGY4?=
 =?utf-8?B?T3J2N2R3V24xTFFod2V3eitrdDhMOFhzRk0rSWtTY05tYlhQTThpOWc1ZHpO?=
 =?utf-8?B?c2xXc3Y2cEt4b0JUY1NORVNYbTRKbDhuSHd1dG9wZXhFUHl0S09HMzd4NzlD?=
 =?utf-8?B?NjNrSGNGYUVzRTB6Z2k2QmZtL1BhSTMyNmVLYVZGbHgwWWtkSWFPdExlZ3Yz?=
 =?utf-8?B?aGw4TXJTYXRkMVRTWVFCVmRxdkJvVzV6ODJ0cTBzMjdLbW4ybGZaRGoyV0Y5?=
 =?utf-8?B?QS9UUXB0MDU5Sk5pc1c0Y0huN2lDU05LNytvR0hCcTNjOElxQitQUTZZcWdC?=
 =?utf-8?B?U2djd1E3OG1jcmZSUHoveXZYRzFHelJZRm5MUm9nTTl0MGxuYVNKNktPRlRF?=
 =?utf-8?B?d2tmc1ViT1dNZUNlTHU5TFl3d011eTZJcnJLQzJZWWJ5NEdNLzk2Uyt4c2JE?=
 =?utf-8?B?WG9iOHY4dzRWNVBTZDBLejJ5WExQdEE2bW5DbnpoREhRMkpUZU9KWTlJazdF?=
 =?utf-8?B?M0hRb01XZVR0SFhKR2xEdTBwTU80RGhJUDZzVitGSXdoVmtha2JVN28vS0ZK?=
 =?utf-8?B?dFhwSit1czJpQlladEVlV0R4Y3JGdUpoTk12eUZkYVJRUzZVOFdvcTFkTVRi?=
 =?utf-8?B?dUtxRHZ6bTU0MmYzWjdNV2sxazhoSFc2bStYVmNoK1hIcE8vTzkyUVFTODNw?=
 =?utf-8?B?SDl2b0N1djFMelBqSmdHQ3FUb0ZaV21CVkxsMkRZK20wWTl3UTFVZ2tSKzBP?=
 =?utf-8?B?YjcxZjRLT1NJUGtXdUpZVEY2d1RRRERJRE5Ma3lvVXMyVmZ1QTRjb1FnYUp2?=
 =?utf-8?B?N2U1ZkRkVDdLVHF5RUJ6QUZLVjVia3lualN2NG9XNk5EM0pkSjA0bTlqaHdQ?=
 =?utf-8?B?TVVnK0cxUXRMU2EzdUdzTjRsS3pEdXZRTnllUzI5RzJkdTNVWGoyd3ZTbWdz?=
 =?utf-8?B?aHppSFVPb3BBVmpkU2UzdThTaVNpSmRzQWdZTHlhNHNtTXZ1Y25yQ0xBdEVl?=
 =?utf-8?B?REhlSlV6ZGFWTGJsazdPVW96RkV5NkJZKzkwSjNRY2RrUExQdFp5RG1EL1h1?=
 =?utf-8?B?cXJ4am9vbE1jaFlYT1NRUjg1cGhtVEN6c09FMHFjUWZsRjl1YTJTVE9GOEcw?=
 =?utf-8?B?SlkwNCt4eWd1emJLU2RvSlJnTjllU0V1VWFDWFpJemdkL1BPZGtNTlQzOEJo?=
 =?utf-8?B?V2xncGI2eUZZR1FUYWtUUnpzbERpaGsvelZ5Y0JVcTRiOW5Ma1ZWK0UzbFBG?=
 =?utf-8?Q?Q0NfdZ/jt3pD92OdoZmX2E+fDgzgRjLy+zimRhN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b25fd14e-f0bc-4a36-7c03-08d8edc40431
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 06:22:21.0867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1jE4CA9jvXMVxC1DybqECJF/5rAcaApQ3IC7ch2NbFc+9LkbcVkTAEuyUN1aVAtlaeWZJ8rjIIwvrd7f1fSIxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3208
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_01:2021-03-22,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=971
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103230043
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230043
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
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

SGkgUGllcnJl77yaDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGll
cnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4N
Cj4gU2VudDogTW9uZGF5LCBNYXJjaCAyMiwgMjAyMSAxMDo1MCBQTQ0KPiBUbzogUGVycnkgWXVh
bjsgWXVhbiwgUGVycnk7IHBvYnJuQHByb3Rvbm1haWwuY29tOw0KPiBvZGVyX2NoaW91QHJlYWx0
ZWsuY29tOyBwZXJleEBwZXJleC5jejsgdGl3YWlAc3VzZS5jb207DQo+IGhkZWdvZWRlQHJlZGhh
dC5jb207IG1ncm9zc0BsaW51eC5pbnRlbC5jb207IExpbW9uY2llbGxvLCBNYXJpbw0KPiBDYzog
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Ow0KPiBicm9vbmllQGtlcm5lbC5vcmc7IGxnaXJkd29vZEBnbWFpbC5jb207IHBsYXRmb3JtLWRy
aXZlci0NCj4geDg2QHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDEv
Ml0gcGxhdGZvcm0veDg2OiBkZWxsLXByaXZhY3k6IEFkZCBzdXBwb3J0IGZvciBEZWxsDQo+IGhh
cmR3YXJlIHByaXZhY3kNCj4gDQo+IA0KPiBbRVhURVJOQUwgRU1BSUxdDQo+IA0KPiANCj4gPiBB
cyB5b3Ugc3VnZ2VzdGVkLEkgc2hvdWxkIGFkZCB0aGUgYWxpZ25tZW50IGNoYW5nZSBpbiBhbm90
aGVyIHBhdGNoLg0KPiA+IEJ1dCBpZiBpIGtlZXAgdGhlIG9sZCBhbGlnbm1lbnQsIHRoZSBjb2Rl
IHdpbGwgYmUgdmVyeSBvZGQuDQo+ID4gU2VlbXMgbGlrZSB0aGF0IEkgaGF2ZSB0byBjaGFuZ2Ug
dGhlIGJlbG93IGNvZGUgdG8gbmV3IGFsaWdubWVudCBpbg0KPiA+IHRoaXMgcGF0Y2guDQo+ID4N
Cj4gPiBpZiAoZGVsbF9zbWJpb3NfZmluZF90b2tlbihHTE9CQUxfTUlDX01VVEVfRElTQUJMRSkg
JiYNCj4gPiAgwqDCoMKgIGRlbGxfc21iaW9zX2ZpbmRfdG9rZW4oR0xPQkFMX01JQ19NVVRFX0VO
QUJMRSkpIHsgPDwtLS0gY2hhbmdlZA0KPiA+IGJhY2sNCj4gPiAgwqDCoMKgwqBpZiAoIXByaXZh
Y3lfdmFsaWQpDQo+ID4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGFzX3ByaXZhY3kgPSB0cnVl
Ow0KPiA+ICDCoMKgwqDCoGVsc2UNCj4gPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoYXNfcHJp
dmFjeSA9IGZhbHNlOw0KPiA+ICDCoMKgwqDCoGlmICghaGFzX3ByaXZhY3kpIHsNCj4gPiAgwqDC
oMKgwqDCoMKgwqAgbWljbXV0ZV9sZWRfY2Rldi5icmlnaHRuZXNzIDw8LS0tLS0tLS0tLS0gbmV3
IGFsaWdubWVudA0KPiA+ICDCoMKgwqDCoMKgwqDCoCAuLi4NCj4gPiAgwqDCoMKgwqB9DQo+ID4g
Li4uDQo+ID4gfQ0KPiANCj4gSSBkb24ndCBnZXQgdGhlIHBvaW50LCBzb3JyeS4gVGhlIGNvZGUg
YWJvdmUgZG9lc24ndCBzZWVtIHByb3Blcmx5IGluZGVudGVkDQo+IG9yIHRoZXJlIHdlcmUgc3B1
cmlvdXMgdGFiL3NwYWNlcyBjb252ZXJzaW9ucz8NCkNvdWxkIHlvdSBoZWxwIHRvIHRha2UgYSBs
b29rIHRoZSBWNSBwYXRjaCA/DQpJIHJlY292ZXJ5IHNvbWUgcGFydCBvZiBvcmlnaW5hbCBjb2Rl
IGFsaWdubWVudCBhbmQgYWRkIG15IG5ldyBjb2RlcyB3aXRoIG5ldyBUYWJzIGFkZGVkIA0KVGhh
bmsgeW91ICENCg0KUGVycnkNCg0K
