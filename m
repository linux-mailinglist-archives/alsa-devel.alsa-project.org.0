Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFDE32DFD9
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 03:58:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2EED17F1;
	Fri,  5 Mar 2021 03:57:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2EED17F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614913087;
	bh=9EjuQnbTo3vE3GEtzABNaGCv8Z74CNi4GSw09TWtbYc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rJM/iWoJZ1+KIfabW/mviZbUSyCe9yZq9TaoQ71/nW4qbbrUUJWmnSNy/sQ/RYlNJ
	 rrJBNe5Kk3nMYXD5y5JJAdAGhRicn/BN29MgHumv70y+pXfZITKWc00jVycq0I8JFW
	 8a51Gi9VdWWqGRDy36HzSeRhO71HUZ70103AR2P8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4F6CF8025E;
	Fri,  5 Mar 2021 03:57:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2BA1F8025E; Fri,  5 Mar 2021 03:57:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F63DF800F3
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 03:57:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F63DF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="s2FC1fwh"
Received: from pps.filterd (m0170398.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1252mBgI024542; Thu, 4 Mar 2021 21:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=9EjuQnbTo3vE3GEtzABNaGCv8Z74CNi4GSw09TWtbYc=;
 b=s2FC1fwhI/MsjAKBKcw6Tj6/rbULtqBexEcGlnJX4CsuMSxwbpPnN2kb42a1GThGftzl
 F7+Aa4XLfhsrpBBCB35KNYCHmuSN4W3tAx1FJUZbMBXBlM+fHE8g6qWXMMjPI7WHr30T
 bxVxHvKtq5RxNnszgfQN8PiaBqDQR3c4Y/A5HqgOv90/WJouzlcbIclzmDJ/jNFlxubz
 NxPjNNMY2Ry3jGxLhV8RAqpy2npQDAW7XDtWai31FYiH8QZ4+MXF9CsziTuZmnfQmESz
 ZxdoCgB2fmBYvrU6jVsgMidrtB3FpK+kby++/q3RjbhBnIrvwOdMfdcCquah3PRIcTWe 4w== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 36yj6ew2bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 21:57:00 -0500
Received: from pps.filterd (m0142693.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1252pQCJ040361; Thu, 4 Mar 2021 21:56:59 -0500
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by mx0a-00154901.pphosted.com with ESMTP id 372yj4kph3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Mar 2021 21:56:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZugqOW6t6ZaN8KL1oN8cYCY8mhI163VHrKZRIbgn3cW59qoI1RF3rkvfY2JOpEjgkfY/o4cCStc8vMCX1bxFecqf7oT/4wGJx8wcONjByehsQT90brKIGhDxY2F+8QT9ePEz+3FyJ3/vf/AbXg6FILUJEUSPoFGawqe/v/VpL85xUqlzC42KAkNaaPlf+JkEFE2yChxb3qOKLkwp1Mkrmn9Bxy7O/xUuRpP4lkI6mzQ3FgpTpzekSIpsJoa7KkMCXEDsJH/qvfKuw5yYYR7UHyU/ON/bU3p/WMZQ+ujULTkJP/kDPgiPSepzjc2epFA19Do+mmkU4fiu4PZrmgpVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EjuQnbTo3vE3GEtzABNaGCv8Z74CNi4GSw09TWtbYc=;
 b=RysrEUuf3Qs67HcJIKpCqhEngBm+YMHxftFsV875BOBg5Em7/EaukQL50A8qV5tF+kkae0WsvJ9cMOrtNWUjfh34Iw74cq6jhOzMKjciX2Mvh+vRP9ywup0RcMab1Cx64bSwAgWJOyNWnaUov3jW3rLeYp5cp70oIIlkX/DYnkSmtTfX3/vITMLCdeoiA4MDI2ywhFBx2myafyiNTjRaF3Z7vkUgaD7248MHZvThHlh+w0SbKRkOH9RWeuMKoBIDsuHEz3/LbPMsBxLA5Y6r+WBTb7U123nYANssGkF4qwuVVL8HceT/uYsfr7wvq70rre/IfIRpHWgp/bGfm4AlDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by SJ0PR19MB4574.namprd19.prod.outlook.com (2603:10b6:a03:283::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.18; Fri, 5 Mar
 2021 02:56:57 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::50bf:f1c3:9600:fe6b]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::50bf:f1c3:9600:fe6b%8]) with mapi id 15.20.3890.032; Fri, 5 Mar 2021
 02:56:57 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Perry Yuan
 <perry979106@gmail.com>, "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>, "mgross@linux.intel.com"
 <mgross@linux.intel.com>
Subject: RE: [PATCH v3 1/3] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
Thread-Topic: [PATCH v3 1/3] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
Thread-Index: AQHW6QbX7RFZ7lqWNEyhC5TzzcBrh6okWHSAgDY07ICAAIh9AIABbkoAgAAa24CAGGTpYA==
Date: Fri, 5 Mar 2021 02:56:57 +0000
Message-ID: <SJ0PR19MB4528BF867F9CAB88675A6B5584969@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20210112171723.19484-1-Perry_Yuan@Dell.com>
 <bf048701-4e6b-ad18-1a73-8bca5c922425@linux.intel.com>
 <79277bf2-3c9e-8b66-47a9-b926a2576f7f@gmail.com>
 <31982e8d-3b0d-7187-8798-900f95d876ee@linux.intel.com>
 <e66d8098-beb6-1299-20aa-42cfe13882f6@gmail.com>
 <882f4b80-c182-4038-39bd-eddb2ecc7800@linux.intel.com>
In-Reply-To: <882f4b80-c182-4038-39bd-eddb2ecc7800@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Perry_Yuan@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-03-05T02:56:52.6858568Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=bd154b0b-1bfe-4f07-a505-2f9073ec506c;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [114.84.248.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b231df27-159b-43f4-5359-08d8df825766
x-ms-traffictypediagnostic: SJ0PR19MB4574:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR19MB45748852E01D14C210D05F8084969@SJ0PR19MB4574.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bvof8+JZ0COJbOtVXXuC2Qvrujhbr/38znKPEtmWDUpmq3fF2czr7IU92k812/F1xTHB0QNV+8sXxReuHnW8boJgFL43W+nO9Hx7fCfZlsqkKlwYG+beP6xnms/5OQYVZV6JXGeGFgMQltRm+Rr6qDXz/TXTqqgu/jrFmr1LGz0pehVvywfCBjEE2g5WtoKyJF8u+vQ7dTJfFMeh6iswHettQXqy2OdzaK1M7NxYJV7i1pHUrpemw6+ECy54F8duvVxugG9I43pyrRfwkIhmuHjbaAM8Jsd0pLMzc4mm3UvvZh1Y3P0AaS+fXZZoUC0zBE4s31CjwxTiY6526+DetHn7x/FFnimz8ocoGGBp1pq6MsK8nPGLTihzSu5LZridw2ldood8Wnj3NCLOsR/wTB5DmBFEYvA5ZrKVMzGdaCfh7ogRBIZsQcRXUfQxBxMS2pMC8w4rZWQDimzjL9kIWB4Ob0KvD5LCc1QVnJz9cETpMwq/qd5UbEyfCEJLfxwOynXaNxMJIimT7BfyoLzq8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(76116006)(2906002)(66946007)(53546011)(54906003)(52536014)(5660300002)(26005)(66556008)(186003)(66476007)(64756008)(66446008)(83380400001)(7416002)(86362001)(6506007)(8936002)(316002)(7696005)(71200400001)(33656002)(55016002)(786003)(110136005)(4326008)(9686003)(478600001)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 7neu1dUtHJ9vJlSnXBwngxL//xnUgSABxDgOrnoB+rF+NVv23ebPihFvKrVfL/khKF4FhKpRWKMu95XBJlCYKg7sSy3lY2rzd2VEVL5UAuuhr6QxzpSsdGZwNUgoysakf57TTedY8IkZwal28yZqr8lrSrf+fDNwkRO28GugJb1eyry/LIfwLd4fsddbguUdaad+TsWrPNEUyzL3FzsZqmrD1MQ7zxe6SFwtKSqzhhOW/tIRPChC0EMnb4tto1ZugMsr7gd8/olKmV6quEW4eOGNDHMYzbKkl1a6h7jxyfH84egkLVI5ST4uIzGK8IfnyiLYts5Odw+MFzoj7vZysrYu4qTdzAVOkBzdafpKegwLGuOloLufHa115uonQZAmjNHnrgObWLCLZuLMTcQJmNrcsGqzr2IfQIap6pUx5tU2RFjTmnnGte69pKSsyu9ZSQ175FS3vvu5hGQDtRV+qCyKDgbxwVICJBSY6LVBu46zovoAS0rLc/UL/hfECBqDtCmLCngjR2kX9SQIZZIgJQFVqpPeboYxIDSgHEBFPCyAxg0loNGRzMJiSEZTRthiXlvBt14DzBVM7xW9lf+Cg4m9sQmpQN7GAXR4WBNA6gJZEMDecm7P0HM0vfw44O9TMQbeDxy280ZQRpUxXF/hNBAi/FcgMZqrX1qwGNet3tcFCC9y32r9cK99JF3dy7vEG8gg3sPqDdV4EhGmZ6aVVwzV5S6CU6JXgc4G2/+tGRI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b231df27-159b-43f4-5359-08d8df825766
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2021 02:56:57.7324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V3MKLlpqSLOW1ZxMvmyuQZoUa+0D/INVsj1b77wnjn2MkXuru0u5XtQZF/eCsHX5l66SnHudrJ2BKOJ+cXVi6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4574
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_09:2021-03-03,
 2021-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050012
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050012
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Limonciello, 
 Mario" <Mario.Limonciello@dell.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>
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

SGkgUGllcnJlDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJl
LUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4g
U2VudDogMjAyMeW5tDLmnIgxN+aXpSAyMjoyNA0KPiBUbzogUGVycnkgWXVhbjsgWXVhbiwgUGVy
cnk7IG9kZXJfY2hpb3VAcmVhbHRlay5jb207IHBlcmV4QHBlcmV4LmN6Ow0KPiB0aXdhaUBzdXNl
LmNvbTsgaGRlZ29lZGVAcmVkaGF0LmNvbTsgbWdyb3NzQGxpbnV4LmludGVsLmNvbQ0KPiBDYzog
YWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOyBMaW1vbmNpZWxsbywgTWFyaW87IGxpbnV4LQ0K
PiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsZ2lyZHdvb2RAZ21haWwuY29tOyBwbGF0Zm9ybS1k
cml2ZXItDQo+IHg4NkB2Z2VyLmtlcm5lbC5vcmc7IGJyb29uaWVAa2VybmVsLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYzIDEvM10gcGxhdGZvcm0veDg2OiBkZWxsLXByaXZhY3k6IEFkZCBz
dXBwb3J0IGZvciBEZWxsDQo+IGhhcmR3YXJlIHByaXZhY3kNCj4gDQo+IA0KPiBbRVhURVJOQUwg
RU1BSUxdDQo+IA0KPiANCj4gDQo+IE9uIDIvMTcvMjEgNjo0NyBBTSwgUGVycnkgWXVhbiB3cm90
ZToNCj4gPiBIaSBQaWVycmU6DQo+ID4gT24gMjAyMS8yLzE2IDIyOjU2LCBQaWVycmUtTG91aXMg
Qm9zc2FydCB3cm90ZToNCj4gPj4NCj4gPj4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYWNwaV9k
ZXZpY2VfaWQgcHJpdmFjeV9hY3BpX2RldmljZV9pZHNbXSA9IHsNCj4gPj4+Pj4gK8KgwqDCoCB7
IlBOUDBDMDkiLCAwfSwNCj4gPj4+Pj4gK8KgwqDCoCB7IH0sDQo+ID4+Pj4+ICt9Ow0KPiA+Pj4+
PiArTU9EVUxFX0RFVklDRV9UQUJMRShhY3BpLCBwcml2YWN5X2FjcGlfZGV2aWNlX2lkcyk7DQo+
ID4+Pj4+ICsNCj4gPj4+Pj4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGRlbGxfcHJp
dmFjeV9wbGF0Zm9ybV9kcnYgPSB7DQo+ID4+Pj4+ICvCoMKgwqAgLmRyaXZlciA9IHsNCj4gPj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIC5uYW1lID0gUFJJVkFDWV9QTEFURk9STV9OQU1FLA0KPiA+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgLmFjcGlfbWF0Y2hfdGFibGUgPSBBQ1BJX1BUUihwcml2YWN5X2Fj
cGlfZGV2aWNlX2lkcyksDQo+ID4+Pj4+ICvCoMKgwqAgfSwNCj4gPj4+Pg0KPiA+Pj4+IG5vIC5w
cm9iZT8NCj4gPj4+IE9yaWdpbmFsbHkgaSBhZGRlZCB0aGUgcHJvYmUgaGVyZSwgYnV0IGl0IGNh
dXNlIHRoZSBkcml2ZXLCoCAucHJvYmUNCj4gPj4+IGNhbGxlZCB0d2ljZS4gYWZ0ZXIgaSB1c2Ug
cGxhdGZvcm1fZHJpdmVyX3Byb2JlIHRvIHJlZ2lzdGVyIHRoZQ0KPiA+Pj4gZHJpdmVyIGxvYWRp
bmcgcHJvY2VzcywgdGhlIGR1cGxpY2F0ZWQgcHJvYmUgaXNzdWUgcmVzb2x2ZWQuDQo+ID4+Pg0K
PiA+Pj4gSQ0KPiA+Pj4+DQo+ID4+Pj4+ICvCoMKgwqAgLnJlbW92ZSA9IGRlbGxfcHJpdmFjeV9h
Y3BpX3JlbW92ZSwgfTsNCj4gPj4+Pj4gKw0KPiA+Pj4+PiAraW50IF9faW5pdCBkZWxsX3ByaXZh
Y3lfYWNwaV9pbml0KHZvaWQpIHsNCj4gPj4+Pj4gK8KgwqDCoCBpbnQgZXJyOw0KPiA+Pj4+PiAr
wqDCoMKgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXY7DQo+ID4+Pj4+ICvCoMKgwqAgaW50
IHByaXZhY3lfY2FwYWJsZSA9IHdtaV9oYXNfZ3VpZChERUxMX1BSSVZBQ1lfR1VJRCk7DQo+ID4+
Pj4+ICsNCj4gPj4+Pj4gK8KgwqDCoCBpZiAoIXdtaV9oYXNfZ3VpZChERUxMX1BSSVZBQ1lfR1VJ
RCkpDQo+ID4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsNCj4gPj4+Pj4gKw0K
PiA+Pj4+PiArwqDCoMKgIHByaXZhY3lfYWNwaSA9IGt6YWxsb2Moc2l6ZW9mKCpwcml2YWN5X2Fj
cGkpLCBHRlBfS0VSTkVMKTsNCj4gPj4+Pj4gK8KgwqDCoCBpZiAoIXByaXZhY3lfYWNwaSkNCj4g
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOw0KPiA+Pj4+PiArDQo+ID4+Pj4+
ICvCoMKgwqAgcGRldiA9IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9zaW1wbGUoDQo+ID4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBSSVZBQ1lfUExBVEZPUk1fTkFNRSwgUExBVEZPUk1f
REVWSURfTk9ORSwgTlVMTCwNCj4gMCk7DQo+ID4+Pj4+ICvCoMKgwqAgaWYgKElTX0VSUihwZGV2
KSkgew0KPiA+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZXJyID0gUFRSX0VSUihwZGV2KTsNCj4gPj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gcGRldl9lcnI7DQo+ID4+Pj4+ICvCoMKgwqAgfQ0KPiA+
Pj4+PiArwqDCoMKgIGVyciA9IHBsYXRmb3JtX2RyaXZlcl9wcm9iZSgmZGVsbF9wcml2YWN5X3Bs
YXRmb3JtX2RydiwNCj4gPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVsbF9wcml2YWN5
X2FjcGlfcHJvYmUpOw0KPiA+Pj4+PiArwqDCoMKgIGlmIChlcnIpDQo+ID4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBnb3RvIHBkcnZfZXJyOw0KPiA+Pj4+DQo+ID4+Pj4gd2h5IGlzIHRoZSBwcm9iZSBk
b25lIGhlcmU/IFB1dCBkaWZmZXJlbnRseSwgd2hhdCBwcmV2ZW50cyB5b3UgZnJvbQ0KPiA+Pj4+
IHVzaW5nIGEgJ25vcm1hbCcgcGxhdGZvcm0gZHJpdmVyLCBhbmQgZG8gdGhlIGxlZHNfc2V0dXAg
aW4gdGhlDQo+ID4+Pj4gLnByb2JlKCk/DQo+ID4+PiBBdCBmaXJzdCAsSSB1c2VkIHRoZSBub3Jt
YWwgcGxhdGZvcm0gZHJpdmVyIGZyYW1ld29yaywgaG93ZXZlciB0dA0KPiA+Pj4gY2F1c2UgdGhl
IGRyaXZlcsKgIC5wcm9iZSBjYWxsZWQgdHdpY2UuIGFmdGVyIGkgdXNlDQo+ID4+PiBwbGF0Zm9y
bV9kcml2ZXJfcHJvYmUgdG8gcmVnaXN0ZXIgdGhlIGRyaXZlciBsb2FkaW5nIHByb2Nlc3MsIHRo
ZQ0KPiA+Pj4gZHVwbGljYXRlZCBwcm9iZSBpc3N1ZSByZXNvbHZlZC4NCj4gPj4NCj4gPj4gVGhp
cyBzb3VuZHMgdmVyeSBvZGQuLi4NCj4gPj4NCj4gPj4gdGhpcyBsb29rcyBsaWtlIGEgY29uZmxp
Y3Qgd2l0aCB0aGUgQUNQSSBzdWJzeXN0ZW0gZmluZGluZyBhIGRldmljZQ0KPiA+PiBhbmQgcHJv
YmluZyB0aGUgZHJpdmVyIHRoYXQncyBhc3NvY2lhdGVkIHdpdGggdGhlIFBOUDBDMDkgSElELCBh
bmQNCj4gPj4gdGhlbiB0aGlzIG1vZHVsZSBfX2luaXTCoCBjcmVhdGluZyBhIGRldmljZSBtYW51
YWxseSB3aGljaCBsZWFkcyB0byBhDQo+ID4+IHNlY29uZCBwcm9iZQ0KPiA+Pg0KPiA+PiBOZWl0
aGVyIHRoZSBwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXJfc2ltcGxlKCkgbm9yDQo+ID4+IHBsYXRm
b3JtX2RyaXZlcl9wcm9iZSgpIHNlZW0gbmVjZXNzYXJ5P0JlY2F1c2UgdGhpcyBwcml2YWN5IGFj
cGkNCj4gPj4gZHJpdmVyIGZpbGUgaGFzIGRlcGVuZGVuY3kgb24gdGhlIGVjIGhhbmRsZSwNCj4g
PiBzbyBpIHdhbnQgdG8gZGV0ZXJtaW5lIGlmIHRoZSBkcml2ZXIgY2FuIGJlIGxvYWRlZCBiYXNp
bmcgb24gdGhlIEVDIElEDQo+ID4gUE5QMEMwOSBtYXRjaGluZy4NCj4gPg0KPiA+IFNvIGZhcixJ
dCB3b3JrcyB3ZWxsIGZvciBtZSB0byByZWdpc3RlciB0aGUgcHJpdmFjeSBkcml2ZXIgd2l0aMKg
IHRoZQ0KPiA+IHJlZ2lzdGVyIHNlcXVlbmNlLg0KPiA+IERvc2UgaXQgaHVydCB0byBrZWVwIGN1
cnJlbnQgcmVnaXN0ZXJpbmcgcHJvY2VzcyB3aXRoDQo+ID4gcGxhdGZvcm1fZHJpdmVyX3Byb2Jl
IHVzZWQ/DQo+IA0KPiBTb3JyeSwgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB5b3UgbmVlZCB0byBs
aXN0IFBOUDBDMDkgSElEIGluIGEgbWF0Y2hpbmcNCj4gdGFibGUgaWYgaXQncyBub3QgdXNlZCB0
byBwcm9iZSBhbnl0aGluZy4NCj4gDQo+IFRoZSBwdXJwb3NlIG9mIHRob3NlIG1hdGNoaW5nIHRh
YmxlcyBpcyB0aGF0IHdoZW4gdGhpcyBISUQgaXMgZm91bmQsIHRoZSBjb3JlDQo+IHdpbGwgaW52
b2tlIHRoZSBwcm9iZSBjYWxsYmFjayB3aXRoIG5vIG5lZWQgZm9yIGFueSBtYW51YWwgaW50ZXJ2
ZW50aW9uLg0KPiANCj4gSWYgeW91IHdhbnQgdG8gZG8gdGhpbmdzIG1hbnVhbGx5IHdpdGggdGhl
IG1vZHVsZSBpbml0LCB0aGF0J3MgZmluZSwgaXQncyB0aGUNCj4gY29tYmluYXRpb24gb2YgdGhl
IHR3byB0aGF0IEkgZmluZCBxdWVzdGlvbmFibGUuDQo+IA0KPiBJdCdzIGxpa2UgaGF2aW5nIGJv
dGggYSBtYW51YWwgYW5kIGF1dG9tYXRpYyB0cmFuc21pc3Npb24gaW4gYSBjYXIsIHdpdGggdGhl
DQo+IGF1dG9tYXRpYyB0cmFuc21pc3Npb24gbm90IGNvdXBsZWQgdG8gdGhlIHdoZWVscy4NCg0K
SSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQsSSBoYXZlIHJlbW92ZWQgdGhlIFBOUDBDMDkgSUQgZnJv
bSBWNCBwYXRjaC4NClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uIHZlcnkgbXVjaCAhDQoNClBl
cnJ5IA0K
