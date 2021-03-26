Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FC434A275
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 08:21:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2757A1663;
	Fri, 26 Mar 2021 08:21:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2757A1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616743313;
	bh=ZotfuyiyDpNM76EOjLqvlgKPuJcToqJBBsB//l0Umnk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QYtPDdHU7+Ws5lisgFPb7u+3ubQjB+n/tQ8iSZ0rBWIBIARXfIVKoSohhN4p/vuxw
	 Dd27eCIqHScAUT0MrxlaBKMbj4GIQcabZhs4lz8AXM7HMOE31ajx9gFdD5oloKTpQn
	 v/AtnvYHqYnz/C3jaXQEqyCF1+WuEs1uOtUQQYAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D53AF80104;
	Fri, 26 Mar 2021 08:20:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1620F8016B; Fri, 26 Mar 2021 08:20:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EB57F80103
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 08:20:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EB57F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="dNyCB+Qt"
Received: from pps.filterd (m0170389.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12Q7HK5x014976; Fri, 26 Mar 2021 03:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=ZotfuyiyDpNM76EOjLqvlgKPuJcToqJBBsB//l0Umnk=;
 b=dNyCB+QtR8budK71YGikXrLhRvO8ld4/99yukGrALvE7UnSIFz57+sPXrkULqaTDp2AD
 dEStjeyx0O5sHj7oylI9IqZX7sScH+k7/LgSnUIScqyagCirIkDg2K07xbNloX1pJMGZ
 3dHlAZrT5SvdPCZVb7s+fWlABUG3lXq0YbE/g9nTQqbX7cd7tnZLLsrOXwov5ixy7OjG
 ZCY5HQv+3AZKBi+51JYxtSDkJ6DYxr0FsW0GghMAWi/pbWOJu+QI8/bchMOt7LSkToGP
 6MdcNinSb7Y0BB8FdxndCQPXXGMbt05zRiaGyDcGaWX4Xn0i23Ul9wogXD1JUDgbTa4j Pw== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 37h1359nj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 03:20:14 -0400
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12Q12wll187219; Fri, 26 Mar 2021 03:20:13 -0400
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by mx0a-00154901.pphosted.com with ESMTP id 37gxc3s288-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 03:20:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikEtREdntuqZBlP8EQwtcaGZ0KK9riMMN07Kqp2pz1ZShB5CA2pXexGYGEdvn2xKW8u1eZ6jCQUbbXGyrb1QzUGRt+ieAwIG48buMD0B1gB+338IUdohZeeBmEt/1hWZoh7YiSoTKnRg9OUCZiYlC5w5kqm3RTOCx3z8gnpVQ3WO6l4UPm8py9R7rJAqalN8BOXlptxhf60m3cR2sdzofhdTt6jkdHARcj+HFxZlQRzXM33tTIwx+U0HoKeiDgfvtWjZl4rk5jG/cRPXyBDRYewGnOw2aCUpe8ZxrGSm8EJX6S2Am6SpOvlwihfp1werdSiT5ynPEGAXxQ7E0H9OOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZotfuyiyDpNM76EOjLqvlgKPuJcToqJBBsB//l0Umnk=;
 b=BSYlS5MDF8Iuj0uQY/QoUVk2dpGO808zu0xdlY/PyyGpBhhkSscFMdYkbY2pm+RHbYTMM403h9BWfCS5JEJflquplQkaghfDFAatOKXamq2MGWSPIfZdK7lcRZzab9F7CghnqQ9XllgXgrDXpbM3NfbUipfibQpzYnRU54kBPTJXJLfHb3DNZ4heaHqtZ0TqzJVPUAHs+QlDAap7zRpkVdyS4LJWdAMqpaF8nHchyWb1yymL+/iWhkOpfyLIQpd31899QFIO1qHnQVt/+KrkSfMAor6RC2ii2y/qPoyWvUl2XEBBnN5LGb2j761iJiB7zDw+4OObHB21Krc2gRutGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by BYAPR19MB2232.namprd19.prod.outlook.com (2603:10b6:a02:cd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Fri, 26 Mar
 2021 07:20:11 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a%7]) with mapi id 15.20.3977.030; Fri, 26 Mar 2021
 07:20:11 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Limonciello, Mario"
 <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 2/2] ASoC: rt715:add micmute led state control supports
Thread-Topic: [PATCH v4 2/2] ASoC: rt715:add micmute led state control supports
Thread-Index: AQHXDn6s4PfzwhTth0aZP8v1kYirtKp6YrWAgBVxBJCAAGEogIAABqmAgARUF5CAAGR1AIABC1ig
Date: Fri, 26 Mar 2021 07:20:11 +0000
Message-ID: <SJ0PR19MB4528872911CE42EC0C91AB1884619@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20210301093834.19524-1-Perry_Yuan@Dell.com>
 <20210308172409.GF4656@sirena.org.uk>
 <SJ0PR19MB4528847687FEEE4A4DED8E3F84659@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <604693cc-08c7-2b5f-632a-58ed537c54a0@perex.cz>
 <5cad3045-7948-3282-c999-926095818d5f@redhat.com>
 <SJ0PR19MB452851406C9B48DE688F1C1384629@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <11d7916c-5e8a-f3a2-5906-ed007ed146a3@redhat.com>
In-Reply-To: <11d7916c-5e8a-f3a2-5906-ed007ed146a3@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Perry_Yuan@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-03-26T07:20:09.1075750Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=7eadffdb-953d-4be8-b798-11d244ce3bc9;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [163.244.246.215]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76a46d98-ba33-4f9e-1f0e-08d8f02797bb
x-ms-traffictypediagnostic: BYAPR19MB2232:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR19MB223297B18FDD27BB7168721E84619@BYAPR19MB2232.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +5i/mAKksHZUD9kJAJFmlZt5J4c5VtbznaF8i6D2aYDeP5VzLcWdQCeOeaJFSsPvsljKZ3HUfQP2pNIUIvmHZlFQMSTeYBmzubD/4X5oyITh2r+MKOQomdT3KsdYmSmcootmgoNepGm1JmrmxVGUF2afdi/XLvVhPbcBw2uThutWIjpPbkAx9YEzifDc2USeqBA0/SzWeN1usmn5FR5Ba0zx6k5PtoMXxfCzh/wejpg+erfDtSUp446K8U3/VYR5jsqMw1KSnxHddXYF9DPlzEXaMeW0EXGD9rXYTcBaYoil6LHYTaU42AAz+zd8FnrNRv2HsmiTjCZtGy3Iy9shlnrjcZ7ySdJrA2jDrqm44uqkEYLK2r0SiB7kdXrNwgNbEp/5eooHhbiGGXVyLFnJ/14TmhQ7D6Qf5mTKxMZ7fDuRfD9wjYgrf9Ufh8p+hzPE81Ht78k39mpZNJb2LdHHnJncEkfBwSjwXqWCoFNsVEVDQRIs1ARsXk5zA2ylbrNsAixCD89GVOEqTC/HnHmUSX2kJLlUo0A/DNqmJxvOgCFPDdhx3WXBSnIx58uP40xuBBGTmqCGJx1pni46JsYSxbLEXlOZRT91dRIWgFo0bBdHJWawc8gdaIYSJ2ECN6y1yOiQW4W4jFBQAhCeWUxrGoyYPSjcjP9IMY8JSpbgPx210KsFoxdAaDqq+7vewnaxgQ5E+opfaQ1eQnROB+DaWqr/mWk/YiiNA5ZQT+jOU0PbXRoyC2XarsYEsgdIFSJO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(52536014)(186003)(5660300002)(86362001)(786003)(26005)(76116006)(316002)(71200400001)(66946007)(66556008)(66476007)(64756008)(53546011)(6506007)(66446008)(55016002)(83380400001)(7416002)(9686003)(8676002)(8936002)(6636002)(478600001)(33656002)(4326008)(966005)(2906002)(54906003)(7696005)(110136005)(38100700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cThuSGdPTHIxMXpFTDlmdkJMNjJ3VEZuajBqLzVzWDQ4R1ZueHpDOTVUNDQx?=
 =?utf-8?B?THNhUW9Qb0pMSjlUU0JiL1Rjd1cxbVZlQStaZnc3NUM5M2Y4NlJTUGtpbTJS?=
 =?utf-8?B?WlFGNE0zYXVvU1FuVEhBV0JZNFhrUmhvQ3dvYW1KSVpJNTdTanpCY3VrUGV4?=
 =?utf-8?B?SFZ3TGcrdi9WVW10WllNZXB4dnZUeUtsY3pKTFdXYWlsMmFVUEtNS0QyWXBw?=
 =?utf-8?B?Qm41VXJQQlpzalIwNFB1NEUzU1lMUlYwdHByNFRqT1pzV3pvNlFJTFAxUDlS?=
 =?utf-8?B?QjJRbFlZdXpHalR4WTNZVytsTTlJREp3S1R0V0RoR1lTWlgrbGtUUzdxQy8w?=
 =?utf-8?B?SkhEMVZ2SlVwT3ZXZll1YzVNQUFmM3d6dzNLV1dhUGV5MndsUGsrYTVHWEFE?=
 =?utf-8?B?UHJTcGpsbHlTZDVSY0owWklBQzBFVzhyWXptcFpUNjVsZHJ6NG95VXEwdnox?=
 =?utf-8?B?UDl2OE5jbm9BTDB2ZllXcGFQOE9rdUFRTW9FNUxsRm10SUVFNXI1TEFGaEhh?=
 =?utf-8?B?c0pKVE02a0FVZUNUd1RZc3VVUkRWZUdzQkcyc01qbExwN1c5WnhTWDVBNnVK?=
 =?utf-8?B?VzJKTGs2Uytud211QWRWR1VrN1RXcktSRlB1ek0zZ2Zjb2h0MmtWeGhIVERW?=
 =?utf-8?B?R1RRYXlYbTZ3ZWxQYWFKcFlzcnZVM0pTMDhiYk5Wa1loa2l1NWpQNlhodytx?=
 =?utf-8?B?eFQ4TnN4bG1QUlNMOFFoYlNhNEc3U1dLRCtKUGRRMW52VXUvRDlJNUpmamJw?=
 =?utf-8?B?NkR6WWFoTDZkK2sycmQrRGdhZHF1aW1wVktYV0VCcHFxRTRwMG52WnJmaUNB?=
 =?utf-8?B?ZnEvcGxLdXJyL3pFZjFHKysxdzlsK2JWK1dNeXlSYlRudHMrdWtKaEd5WWVp?=
 =?utf-8?B?NXVtQW5NcXJyS0hMbWt5RlgyNDFISGFFM0hiOURQQ3RYNmo0TjlZVVVrRWN3?=
 =?utf-8?B?SWNrT2xHY0dLNVBLaFNaMHVZU0pyWDUwQTYwNlNHU0twWEhuZE5VU3h2ZE9p?=
 =?utf-8?B?WlhkdEtGSzl3UThsaE5sK3g0bjJlZWVtUEkzQ2JhNURDMStOTWRBbUkvNkI4?=
 =?utf-8?B?cGZzKzRnZHIyNFNjUjdRNnJyRG5BWXJrL0FuK3MwaE5KUGFJZTNxU0ZJSG1n?=
 =?utf-8?B?U1dFVkQzK1VVTEorKzRLenJOUkhlOW1iNitRZVRlOXB1SnJTUE91Zk5XckM2?=
 =?utf-8?B?aGs5NkRlemZXZ3BPakl6ZFJQc2ovZ2dDaC9wa1lJZjZkYWcreXpjSkNmVjFJ?=
 =?utf-8?B?VThzeDJmVG91Z3lrRzA5L1piNTFKMDYxVUtuWjA5ancyWVZYNUxleWNXcnNt?=
 =?utf-8?B?TjRSRTNFQkNSRWM3cTVhbERmemdNNm9DdEdFSTBYMGhPWjFmM1VUSTRPNGJs?=
 =?utf-8?B?ZmZkZ1hBM2ErN0ZPMnBJaWZMc1pxMlNEN2sreDZjWEhQR2VYTDhSRDNRYzQ1?=
 =?utf-8?B?OUNMWnFQOVpKZWoyamMyVlFSNU82OVRGYW1RdXR4NU5tSEJab3JyVmhkNlpD?=
 =?utf-8?B?dUU4YjdENGdmMENOeVpwQXJZcWlOZ1NZamFlVjhBV0c3eCtycUJmek02bWFL?=
 =?utf-8?B?emFlSWwzbmZWSDVTbVB2bEt2cDZ6UGhKNG9BbFBqQkVWYjhVakR1M0t2TS9p?=
 =?utf-8?B?blFoTW91WlNkMGJGNHBxMkJxODdmaytEQk5KWDVoVENpQlRucDd1WEljVjFn?=
 =?utf-8?B?Yk16d3gzY2ltcGd0V2dyOWxUL0FwcTFybEI4TWdMWENhaFhTV000TjhXUEJU?=
 =?utf-8?Q?GG9ofIx1gbU17XbNKIGavgBUPZQVNlhJL8At2CW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a46d98-ba33-4f9e-1f0e-08d8f02797bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 07:20:11.1544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kVd/hGvFEKju43G0k4Qb2SU6IUcw4Othw9JLYrMcn8YrzuuV9ZSGBo9dkXvS4D6ZMLoquw8lngD2ja9jSDR1yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR19MB2232
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_03:2021-03-24,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103260000
X-Proofpoint-ORIG-GUID: ZE2SCOYHUfsXZBSHt2nXVaphYzQ96ty9
X-Proofpoint-GUID: ZE2SCOYHUfsXZBSHt2nXVaphYzQ96ty9
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260050
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pobrn@protonmail.com" <pobrn@protonmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
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

SGkgSGFucyxKYXJvc2xhdg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogMjAyMeW5tDPm
nIgyNeaXpSAyMzowNw0KPiBUbzogWXVhbiwgUGVycnk7IEphcm9zbGF2IEt5c2VsYTsgTWFyayBC
cm93bjsgcGllcnJlLQ0KPiBsb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbTsgTGltb25jaWVs
bG8sIE1hcmlvDQo+IENjOiBwb2JybkBwcm90b25tYWlsLmNvbTsgb2Rlcl9jaGlvdUByZWFsdGVr
LmNvbTsgdGl3YWlAc3VzZS5jb207DQo+IG1ncm9zc0BsaW51eC5pbnRlbC5jb207IGxnaXJkd29v
ZEBnbWFpbC5jb207IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsNCj4gbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmcNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NCAyLzJdIEFTb0M6IHJ0NzE1OmFkZCBtaWNtdXRlIGxlZCBz
dGF0ZSBjb250cm9sDQo+IHN1cHBvcnRzDQo+IA0KPiANCj4gW0VYVEVSTkFMIEVNQUlMXQ0KPiAN
Cj4gSGksDQo+IA0KPiBPbiAzLzI1LzIxIDM6MTEgUE0sIFl1YW4sIFBlcnJ5IHdyb3RlOg0KPiA+
IEhpIEhhbnMNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9t
OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPg0KPiA+PiBTZW50OiBNb25kYXks
IE1hcmNoIDIyLCAyMDIxIDExOjAyIFBNDQo+ID4+IFRvOiBKYXJvc2xhdiBLeXNlbGE7IFl1YW4s
IFBlcnJ5OyBNYXJrIEJyb3duOyBwaWVycmUtDQo+ID4+IGxvdWlzLmJvc3NhcnRAbGludXguaW50
ZWwuY29tOyBMaW1vbmNpZWxsbywgTWFyaW8NCj4gPj4gQ2M6IHBvYnJuQHByb3Rvbm1haWwuY29t
OyBvZGVyX2NoaW91QHJlYWx0ZWsuY29tOyB0aXdhaUBzdXNlLmNvbTsNCj4gPj4gbWdyb3NzQGxp
bnV4LmludGVsLmNvbTsgbGdpcmR3b29kQGdtYWlsLmNvbTsNCj4gPj4gYWxzYS1kZXZlbEBhbHNh
LXByb2plY3Qub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiA+PiBwbGF0Zm9y
bS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0
IDIvMl0gQVNvQzogcnQ3MTU6YWRkIG1pY211dGUgbGVkIHN0YXRlIGNvbnRyb2wNCj4gPj4gc3Vw
cG9ydHMNCj4gPj4NCj4gPj4NCj4gPj4gW0VYVEVSTkFMIEVNQUlMXQ0KPiA+Pg0KPiA+PiBIaSwN
Cj4gPj4NCj4gPj4gT24gMy8yMi8yMSAzOjM3IFBNLCBKYXJvc2xhdiBLeXNlbGEgd3JvdGU6DQo+
ID4+PiBEbmUgMjIuIDAzLiAyMSB2IDEwOjI1IFl1YW4sIFBlcnJ5IG5hcHNhbChhKToNCj4gPj4+
PiBIaSBNYXJrOg0KPiA+Pj4+DQo+ID4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+Pj4+IEZyb206IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4NCj4gPj4+Pj4gU2Vu
dDogVHVlc2RheSwgTWFyY2ggOSwgMjAyMSAxOjI0IEFNDQo+ID4+Pj4+IFRvOiBZdWFuLCBQZXJy
eQ0KPiA+Pj4+PiBDYzogcG9icm5AcHJvdG9ubWFpbC5jb207IHBpZXJyZS1sb3Vpcy5ib3NzYXJ0
QGxpbnV4LmludGVsLmNvbTsNCj4gPj4+Pj4gb2Rlcl9jaGlvdUByZWFsdGVrLmNvbTsgcGVyZXhA
cGVyZXguY3o7IHRpd2FpQHN1c2UuY29tOw0KPiA+Pj4+PiBoZGVnb2VkZUByZWRoYXQuY29tOyBt
Z3Jvc3NAbGludXguaW50ZWwuY29tOyBMaW1vbmNpZWxsbywgTWFyaW87DQo+ID4+Pj4+IGxnaXJk
d29vZEBnbWFpbC5jb207IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgbGludXgtDQo+ID4+
Pj4+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJu
ZWwub3JnDQo+ID4+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMi8yXSBBU29DOiBydDcxNTph
ZGQgbWljbXV0ZSBsZWQgc3RhdGUNCj4gPj4+Pj4gY29udHJvbCBzdXBwb3J0cw0KPiA+Pj4+Pg0K
PiA+Pj4+PiBPbiBNb24sIE1hciAwMSwgMjAyMSBhdCAwNTozODozNFBNICswODAwLCBQZXJyeSBZ
dWFuIHdyb3RlOg0KPiA+Pj4+Pg0KPiA+Pj4+Pj4gKwkvKiBNaWNtdXRlIExFRCBzdGF0ZSBjaGFu
Z2VkIGJ5IG11dGVkL3VubXV0ZSBzd2l0Y2ggKi8NCj4gPj4+Pj4+ICsJaWYgKG1jLT5pbnZlcnQp
IHsNCj4gPj4+Pj4+ICsJCWlmICh1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52YWx1ZVswXSB8fCB1
Y29udHJvbC0NCj4gPj4+Pj4+IHZhbHVlLmludGVnZXIudmFsdWVbMV0pIHsNCj4gPj4+Pj4+ICsJ
CQltaWNtdXRlX2xlZCA9IExFRF9PRkY7DQo+ID4+Pj4+PiArCQl9IGVsc2Ugew0KPiA+Pj4+Pj4g
KwkJCW1pY211dGVfbGVkID0gTEVEX09OOw0KPiA+Pj4+Pj4gKwkJfQ0KPiA+Pj4+Pj4gKwkJbGVk
dHJpZ19hdWRpb19zZXQoTEVEX0FVRElPX01JQ01VVEUsDQo+IG1pY211dGVfbGVkKTsNCj4gPj4+
Pj4+ICsJfQ0KPiA+Pj4+Pg0KPiA+Pj4+PiBUaGVzZSBjb25kaXRpb25hbHMgb24gaW52ZXJzaW9u
IHNlZW0gd2VpcmQgYW5kIGNvdW50ZXJpbnR1aXRpdmUuDQo+ID4+Pj4+IElmIHdlJ3JlIGdvaW5n
IHdpdGggdGhpcyBhcHByb2FjaCBpdCB3b3VsZCBwcm9iYWJseSBiZSBjbGVhcmVyIHRvDQo+ID4+
Pj4+IGRlZmluZSBhIGN1c3RvbSBvcGVyYXRpb24gZm9yIHRoZSBhZmZlY3RlZCBjb250cm9scyB0
aGF0IHdyYXBzIHRoZQ0KPiA+Pj4+PiBzdGFuZGFyZCBvbmUgYW5kIGFkZHMgdGhlIExFRCBzZXR0
aW5nIHJhdGhlciB0aGFuIGtleWluZyBvZmYNCj4gPj4+Pj4gaW52ZXJ0IGxpa2UNCj4gPj4gdGhp
cy4NCj4gPj4+Pg0KPiA+Pj4+IEN1cnJlbnRseSB0aGUgc29mIHNvdW5kd2lyZSBkcml2ZXIgaGFz
IG5vIGdlbmVyaWMgbGVkIGNvbnRyb2wgeWV0Lg0KPiA+Pj4+IFRoaXMgcGF0Y2ggY2FuIGhhbmRs
ZSB0aGUgbGVkIGNvbnRyb2wgbmVlZHMgZm9yIE1JQyBtdXRlIExFRCwNCj4gPj4+PiBkZWZpbml0
ZWx5DQo+ID4+IHRoZSBwYXRjaCBpcyBhIHNob3J0IHRlcm0gc29sdXRpb24uDQo+ID4+Pj4gVGhl
cmUgaXMgYSBmZWF0dXJlIHJlcXVlc3QgZGlzY3Vzc2lvbiB3aGVuIHdlIHN0YXJ0ZWQgdG8gaW1w
bGVtZW50DQo+ID4+Pj4gdGhpcw0KPiA+PiBzb2x1dGlvbi4NCj4gPj4+PiBodHRwczovL2dpdGh1
Yi5jb20vdGhlc29mcHJvamVjdC9saW51eC9pc3N1ZXMvMjQ5NiNpc3N1ZWNvbW1lbnQtDQo+ID4+
IDcxMzg5DQo+ID4+Pj4gMjYyMA0KPiA+Pj4+DQo+ID4+Pj4gVGhlIHdvcmthYmxlIHdheSBmb3Ig
bm93IGlzIHRoYXQgd2UgcHV0IHRoZSBMRUQgbXV0ZSBjb250cm9sIHRvIHRoZQ0KPiA+PiBjb2Rl
YyBkcml2ZXIuDQo+ID4+Pj4gV2hlbiB0aGVyZSBpcyBuZXcgYW5kIGZ1bGwgc291bmQgTEVEIHNv
bHV0aW9uIGltcGxlbWVudGVkLCB0aGlzDQo+ID4+Pj4gcGFydCB3aWxsDQo+ID4+IGJlIGFsc28g
b3B0aW1pemVkLg0KPiA+Pj4+IFRoZSBIYXJkd2FyZSBwcml2YWN5IGZlYXR1cmUgbmVlZHMgdGhp
cyBwYXRjaCB0byBoYW5kbGUgdGhlIE1pYw0KPiA+Pj4+IG11dGUgbGVkDQo+ID4+IHN0YXRlIGNo
YW5nZS4NCj4gPj4+PiBCZWZvcmUgdGhhdCBmdWxsIHNvbHV0aW9uIHJlYWR5IGluIGtlcm5lbCwg
Y291bGQgd2UgdGFrZSB0aGlzIGFzDQo+ID4+Pj4gc2hvcnQgdGVybQ0KPiA+PiBzb2x1dGlvbj8N
Cj4gPj4+DQo+ID4+PiBQZXJyeSwgaXQncyBhYm91dCB0aGUgbWFjaGluZSBkZXRlY3Rpb24uIFlv
dXIgY29kZSBpcyB0b28gbXVjaA0KPiA+Pj4gZ2VuZXJpYyBldmVuIGZvciB0aGUgdG9wLWxldmVs
IExFRCB0cmlnZ2VyIGltcGxlbWVudGF0aW9uLiBXZSBuZWVkDQo+ID4+PiBhbiBleHRyYSBjaGVj
aywgaWYgdGhlIHByb3BlciBMRUQncyBhcmUgcmVhbGx5IGNvbnRyb2xsZWQgb24gdGhlDQo+ID4+
PiBzcGVjaWZpYyBoYXJkd2FyZS4gT3RoZXIgaGFyZHdhcmUgbWF5IHVzZSBSVDcxNSBmb3IgYSBk
aWZmZXJlbnQNCj4gPj4+IHB1cnBvc2UuIFVzZSBETUkgLyBBQ1BJIGNoZWNrcyB0byBkZXRlY3Qg
dGhpcyBoYXJkd2FyZSBhbmQgZG9uJ3QNCj4gPj4+IG1pc3VzZSB0aGUgaW52ZXJzaW9uDQo+ID4+
IGZsYWcgdG8gZW5hYmxlIHRoaXMgY29kZS4NCj4gPj4NCj4gPj4gSSB0aGluayB0aGlzIHdvdWxk
IGJlIGEgZ29vIGNhbmRpZGF0ZSBmb3IgdGhlIG5ldyBnZW5lcmljIExFRCBoYW5kbGluZzoNCj4g
Pj4NCj4gPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxzYS1kZXZlbC8yMDIxMDMxNzE3Mjk0
NS44NDIyODAtMS0NCj4gPj4gcGVyZXhAcGVyZXguY3ovDQo+ID4+DQo+ID4+IEFuZCB0aGVuIHVz
ZSBhIHVkZXYtcnVsZSArIGh3ZGIgYW5kL29yIFVDTSBwcm9maWxlcyB0byBjb25maWd1cmUgdGhl
DQo+ID4+IExFRCB0cmlnZ2VyIGZvciBzcGVjaWZpYyBtb2RlbHMgZnJvbSB1c2Vyc3BhY2UgPw0K
PiA+Pg0KPiA+PiBSZWdhcmRzLA0KPiA+Pg0KPiA+PiBIYW5zDQo+ID4+DQo+ID4+DQo+ID4+DQo+
ID4gQmVjYXVzZSB0aGUgU09GIFNEVyBkZXNpZ24gaGFzIG5vIG1pYyBtdXRlIGxlZCBjb250cm9s
IHlldC4NCj4gPiBTbyBJIGFkZCBvbmUgc2hvcnQgdGVybSBzb2x1dGlvbiB0byBtYWtlIERlbGwg
cHJpdmFjeSB3b3JraW5nIGZvciBub3cNCj4gPiBEZWZpbml0ZWx5ICwgdGhhdCBpcyBuZXcgc29s
dXRpb24gSSBjYW4gYWRkIG15IHBhdGNoIG9uIHRoYXQgdG8gdGVzdCBhcyBvbmUNCj4gdXNlciBj
YXNlIC4NCj4gPiBXZSByZWFsbHkgbmVlZCB0byB0YWtlIHRoZSBzaG9ydCB0ZXJtIHNvbHV0aW9u
IHdvcmsgZm9yIHNvbWUgc3lzdGVtDQo+ID4gd2hpY2ggc3VwcG9ydCBuZXcgU09GIHNvdW5kd2ly
ZSBoYXJkd2FyZSB3aGljaCBoYXZlICBkZXBlbmRlbmNlIG9uDQo+IHRoZSBNSUMgbXV0ZSBmZWF0
dXJlIE1lYW53aGlsZSB3ZSBjYW4gY29udGludWUgd29ya2luZyBvbiB0aGUgbmV3ICAidWRldi0N
Cj4gcnVsZSArIGh3ZGIgYW5kL29yIFVDTSBwcm9maWxlcyIgc29sdXRpb24gYXMgdG8gcmVwbGFj
ZSB0aGlzIG9uZS4NCj4gPiBJZiB3ZSBhZ3JlZSB0aGF0LCBJIHdpbGwgc3VibWl0IGFub3RoZXIg
VjYgYWRkcmVzc2luZyBuZXcgZmVlZGJhY2suDQo+IA0KPiBUaGUgdHJpZ2dlcmluZyBvZiB0aGUg
TEVEIHRyaWdnZXIgYW5kIHRoZSBjb2RlIHJlZ2lzdGVyaW5nIHRoZSBsZWRfY2xhc3NkZXYgYXJl
DQo+IGluIDIgc2VwYXJhdGUgc3Vic3lzdGVtczsgYW5kIHNob3VsZCBiZSBtZXJnZWQgc2VwYXJh
dGVseS4NCj4gDQo+IElmIHlvdSBwb3N0IGEgbmV3IHZlcnNpb24gb2YgcGF0Y2ggMS8yIGFkZHJl
c3NpbmcgbXkgcmV2aWV3IHJlbWFya3MgdGhlbiBJDQo+IGNhbiBtZXJnZSB0aGF0Lg0KPiANCj4g
Rm9yIG1lcmdpbmcgdGhlIHNvdW5kIHNpZGUgb2YgdGhpcyB5b3UgbmVlZCB0byB0YWxrIHRvIHRo
ZSBzb3VuZCBmb2xrcw0KPiAoSmFyb3NsYXYgS3lzZWxhLCBUYWthc2hpIEl3YWksIE1hcmsgQnJv
d24gZm9yIGZpbGVzIHVuZGVyIHNvdW5kL3NvYykuDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gSGFu
cw0KDQpHb3QgaXQhDQpJIGFtIHdvcmtpbmcgdGhlIFY2IHRvZGF5LCB3aWxsIHBvc3QgaXQgQVNB
UC4NCiogYWRkcmVzc2luZyBIYW5zIEZlZWRiYWNrIA0KKiBhZGQgcnVudGltZSBtYWNoaW5lIGRl
dGVjdGlvbiB3aXRoIERNSSBjaGVja2luZyAoZnJvbSBKYXJvc2xhdiBGZWVkYmFjaykNCg0KUGVy
cnkgIFl1YW4NCkRlbGwgfCBDbGllbnQgU29mdHdhcmUgR3JvdXAgfCBDREMgTGludXggT1MNCg==
