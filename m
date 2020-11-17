Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC30B2B6522
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 14:54:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AEFF177F;
	Tue, 17 Nov 2020 14:54:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AEFF177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605621295;
	bh=nj7OtAaXuRaWh4sGyypX/VGJXozCOjy0b/yDpCkAi/s=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Er5m61iyAQX21OOLAu70JzJY4JYGPLC6imZ8myxW+kDhkLq0bTRNvMmEymxRP/WKt
	 qojuQKtTECyPtVJdOG1KywoLk2wv01D+2zfjEMViUY4CkN8Bq4ZJX/vIIA09lFtRns
	 BxHouuY/cbFz62PjSEojS/Xyjq48npp/i4/oR8nc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D65EF801F9;
	Tue, 17 Nov 2020 14:53:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C936BF801F5; Tue, 17 Nov 2020 14:53:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F0A5F800E2
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 14:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F0A5F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="nxigKY00"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHDkYZ4022528; Tue, 17 Nov 2020 08:52:56 -0500
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by mx0a-00128a01.pphosted.com with ESMTP id 34td1999wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 08:52:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fI2XhJgdFoJ7JriGuj47qhrY1rDNpyfWsnciz1s+LEFS958WHCGUszlbXBPV89STVXU1xM7Jw5TeuHGRaLNn/1H0PImX6AnJaws8cgUtiWZqrCuZ+Y73AaiOd7sJ0KR6LqQuXccCqgMADQOMZJPsmorh2tHg8KPpNlhPCSuuVVxWWrP7d5KLnV3GL3dSNrXbKdc6iKgVx1pfublzfCAdCH0KPVmeyKN7cOP0MWL9r4NnHJFLNUMQKFlRSL2Q1d38EV2CutWppw3AtD5fOlEBR20WM7Kz6Bfplic7EHY6GpgCs3FnBZJ5WdzWI3y8EQdzddLi6dP35DaI/3ZbIwd8DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nj7OtAaXuRaWh4sGyypX/VGJXozCOjy0b/yDpCkAi/s=;
 b=Nuy0rem3DMT9f2gF1/VivzwSXhNCHhuxL090lOgDCNKX+xfRHcIOvovSJFKmVgvSH4v0X4HCuJjpO/UX6RC0vN1diMWoaLPa5LpsNPy+46LAKJMuVR5M2yV50jS0y+/tzFbq8Km8MehCm1+vvVsJTy05F4wCLaqqrCwKpwu59dHU/WFm1uXTwGF/gwmS8WyIodwsroAWBMM21CUBFrVLTk0IAkv43omBvbwNuJFNd8/lbyS98R7aAeerXRpB9ZZ2WzYihWd1G3TIfy8JMq5PG3wmAfewVu5cxx2Ju2Lk10rvXJFlNGoEzYD+Tp649n6JCxt6RzTLmw4qPn5x9hb9KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nj7OtAaXuRaWh4sGyypX/VGJXozCOjy0b/yDpCkAi/s=;
 b=nxigKY00wWbqhawRgyoKbUs72KQm8yKQx282CY+NNRRDv/mzdUUxOZH/J8EfpbMSK4V7oUJkAi3g46qxcCRUA5Oj8/UrcM1z1xvajQfTGoGERLfQrSfg6RI38vEe915l8G13hHE22KiZDcBotLKJ4iygXrZhaTK9NGRZNMq/hLQ=
Received: from DM6PR03MB4411.namprd03.prod.outlook.com (2603:10b6:5:10f::14)
 by DM6PR03MB3772.namprd03.prod.outlook.com (2603:10b6:5:48::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 13:52:52 +0000
Received: from DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::f99d:8928:7e14:1a62]) by DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::f99d:8928:7e14:1a62%5]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 13:52:51 +0000
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v2] dt-bindings: adau1977: convert text binding to yaml
 format
Thread-Topic: [PATCH v2] dt-bindings: adau1977: convert text binding to yaml
 format
Thread-Index: AQHWtz2F2OHInY62iU6R470BEYQkEqnLTbMAgAEUnaA=
Date: Tue, 17 Nov 2020 13:52:51 +0000
Message-ID: <DM6PR03MB441127479BF5958B8871584AF9E20@DM6PR03MB4411.namprd03.prod.outlook.com>
References: <20201106102052.32582-1-alexandru.ardelean@analog.com>
 <20201110084754.46756-1-alexandru.ardelean@analog.com>
 <20201116211856.GM4739@sirena.org.uk>
In-Reply-To: <20201116211856.GM4739@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jWVdGeVpHVnNaV0ZjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTB6TXpJNU9XTmpOQzB5T0dSakxURXhaV0l0WVRWak5DMDBNVFUy?=
 =?utf-8?B?TkRVd01EQXdNekJjWVcxbExYUmxjM1JjTXpNeU9UbGpZell0TWpoa1l5MHhN?=
 =?utf-8?B?V1ZpTFdFMVl6UXROREUxTmpRMU1EQXdNRE13WW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXhORGMzSWlCMFBTSXhNekkxTURBNU5EYzNPVEUwTkRjNU5UUWlJR2c5SW1N?=
 =?utf-8?B?eFdrdGtRa1JzUm1JelJIWmpiVlJ4UlV4cVJtMDNhSGRoWXowaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUTFOQ05GQXhOa3g2VjBGa0wxRXJhM016TVZwRVlU?=
 =?utf-8?B?TTVSRFpUZW1aV2EwNXZSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRklRVUZCUVVSaFFWRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRlJRVUpCUVVGQlMxWkpWMkpuUVVGQlFVRkJRVUZCUVVGQlFVRkJT?=
 =?utf-8?B?alJCUVVGQ2FFRkhVVUZoVVVKbVFVaE5RVnBSUW1wQlNGVkJZMmRDYkVGR09F?=
 =?utf-8?B?RmpRVUo1UVVjNFFXRm5RbXhCUjAxQlpFRkNla0ZHT0VGYVowSm9RVWQzUVdO?=
 =?utf-8?B?M1FteEJSamhCV21kQ2RrRklUVUZoVVVJd1FVZHJRV1JuUW14QlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlowRkJRVUZCUVc1blFVRkJSMFZCV2tGQ2NFRkdPRUZqZDBKc1FVZE5RV1JS?=
 =?utf-8?B?UW5sQlIxVkJXSGRDZDBGSVNVRmlkMEp4UVVkVlFWbDNRakJCU0UxQldIZENN?=
 =?utf-8?B?RUZIYTBGYVVVSjVRVVJGUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRMEZCUVVGQlFVTmxRVUZCUVZsUlFtdEJSMnRCV0hkQ2Vr?=
 =?utf-8?B?RkhWVUZaZDBJeFFVaEpRVnBSUW1aQlNFRkJZMmRDZGtGSGIwRmFVVUpxUVVo?=
 =?utf-8?B?UlFXTjNRbVpCU0ZGQllWRkNiRUZJU1VGTlowRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZDUVVGQlFVRkJRVUZCUVVsQlFVRkJRVUZCUFQwaUx6NDhMMjFs?=
 =?utf-8?Q?dGE+?=
x-dg-rorf: true
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=analog.com;
x-originating-ip: [188.27.128.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a23b646d-70e5-4c2e-00e0-08d88b0013a2
x-ms-traffictypediagnostic: DM6PR03MB3772:
x-microsoft-antispam-prvs: <DM6PR03MB3772899B715681214EED567EF9E20@DM6PR03MB3772.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:422;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qk5NOJQADIqBrHCfUfcPA2nprSkFfR1/oLGDpLdRaTCVACfDhuqLc+V0zxvaIK0cV0deqzcnGV/3OnFXtAPIffiPxKcB7UNkjSSQstAyiSr6CvtiX44Tg4pkRxioY5njc+TvJoFhAcQwYxK3eG2LROgVK0066Eyxs48qs8QugvMOQHjSop8dRWvJpPSWmh7ziSDFi1Sw+mn30j1wpQCrjI4US7gxCUDeWxrs8YFT5T59NaR4s3o1XWEt6Q79wx7d5ej8N9jfkIiSzbyS5wgNkzm1ykDS9THsPFGLXEmpNQZymAdEkqLBvuyrF5sl3Ag/WZv3feijeS7t2k5B8qk+fQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4411.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(86362001)(83380400001)(52536014)(66946007)(66446008)(33656002)(71200400001)(5660300002)(76116006)(66556008)(64756008)(66476007)(53546011)(6506007)(4326008)(8676002)(9686003)(2906002)(316002)(6916009)(54906003)(7696005)(26005)(186003)(8936002)(55016002)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 1eSvLiMJTmf400Z418PMkjWcKFMdTWbjSUn77P+wpJAFsfZGv/2hCzFbXlKY2/LZYIYdAefGSNJ2KbmMqi2BRDF13HKaePOo5DNWJncDlucKg7nAR3Az9vVr19G/AKizFhJbfypP4SVDBhytLoLqhlxW3MCMmhjyb5hPXQ8Hp8ozDZIPoJ1rvz54a8ufU5IJwWq/qzlKExlHqnzrq0rR0VMFSpKsMzBZDFwC+lm4MlXPMBUOzOAnOp0FT5XIXO9yADHFKEueaTyjGRLCm1Y20e4ZNdcQGcPb4sqoo7Lg3VtnaMNbe23xtSlpsQO9ooI2CXwhmi6scMmbGe0MOrV27blteTebgWDr3MthiQOaNpKpLnFzh+gVCkvuvoYBlyEpEtHq9QCbA4eeUlH3hGGfObVsqBuf1a8F9T2EUMHx0Rqr1dEYEynJziRnyyJ3dlgwHy75Rm02Ssusl+Fy5Z46UNX6eW2fDKDFcg1eE3gtYWasdbJpqAJ1vLxE1VwAyElnXnoe41h13vYemNGe3Pw2shuCVHAhfZYU4579PKjBNpKlDpoLe3YT6CNCJ8wDQmsmw13bGdckJp33KcAkZ2VfUVxu2Qopm/na4HPnWBaPKmREkrShYkAfqm4dxT2wQqmPDvBnlwj9AiynBnBlBbVs3A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4411.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a23b646d-70e5-4c2e-00e0-08d88b0013a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2020 13:52:51.6311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BllKNaUyBU7x7ytdXn3BmiJkCs1M0jvSleGqgMchj0Fz/ytGTKUTS0Ql6Rt8zT4GvPFMpP2Yp9Tf/oCS2ksPtVhtL6W9j6Q0aEYGugfxRxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3772
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_03:2020-11-17,
 2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170102
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyayBCcm93biA8YnJv
b25pZUBrZXJuZWwub3JnPg0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDE2LCAyMDIwIDExOjE5
IFBNDQo+IFRvOiBBcmRlbGVhbiwgQWxleGFuZHJ1IDxhbGV4YW5kcnUuQXJkZWxlYW5AYW5hbG9n
LmNvbT4NCj4gQ2M6IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsYXJzQG1ldGFm
b28uZGU7IHJvYmgrZHRAa2VybmVsLm9yZzsNCj4gbGdpcmR3b29kQGdtYWlsLmNvbQ0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYyXSBkdC1iaW5kaW5nczogYWRhdTE5Nzc6IGNvbnZlcnQgdGV4dCBi
aW5kaW5nIHRvIHlhbWwNCj4gZm9ybWF0DQo+IA0KPiBbRXh0ZXJuYWxdDQo+IA0KPiBPbiBUdWUs
IE5vdiAxMCwgMjAyMCBhdCAxMDo0Nzo1NEFNICswMjAwLCBBbGV4YW5kcnUgQXJkZWxlYW4gd3Jv
dGU6DQo+ID4gVGhpcyBjaGFuZ2UgY29udmVydHMgdGhlIG9sZCBkZXZpY2UtdHJlZSBiaW5kaW5n
IGZvciBBREFVMTk3NyBmcm9tDQo+ID4gdGV4dCBmb3JtYXQgdG8gdGhlIG5ldyB5YW1sIGZvcm1h
dC4NCj4gDQo+IFBsZWFzZSBzdWJtaXQgcGF0Y2hlcyB1c2luZyBzdWJqZWN0IGxpbmVzIHJlZmxl
Y3RpbmcgdGhlIHN0eWxlIGZvciB0aGUgc3Vic3lzdGVtLA0KPiB0aGlzIG1ha2VzIGl0IGVhc2ll
ciBmb3IgcGVvcGxlIHRvIGlkZW50aWZ5IHJlbGV2YW50IHBhdGNoZXMuDQo+IExvb2sgYXQgd2hh
dCBleGlzdGluZyBjb21taXRzIGluIHRoZSBhcmVhIHlvdSdyZSBjaGFuZ2luZyBhcmUgZG9pbmcg
YW5kIG1ha2UNCj4gc3VyZSB5b3VyIHN1YmplY3QgbGluZXMgdmlzdWFsbHkgcmVzZW1ibGUgd2hh
dCB0aGV5J3JlIGRvaW5nLg0KPiBUaGVyZSdzIG5vIG5lZWQgdG8gcmVzdWJtaXQgdG8gZml4IHRo
aXMgYWxvbmUuDQoNCkFwb2xvZ2llcy4NCkkgZGlkIGxvb2sgYXJvdW5kIGFuZCB0aGUgZ2l0IGxv
ZyBvZiB0aGF0IGZvbGRlciBhbmQgbm90aWNlZCBhIGJpdCBvZiBtaXhlZCBzdHlsaW5nIGZvciB0
aGUgY29tbWl0IHRpdGxlLg0KSSBhZG1pdCBJIHNob3VsZCBoYXZlIHByb2JhYmx5IHRha2VuIGEg
Y2xvc2VyIGxvb2sgYW5kIGJldHRlciBndWVzc2VkIHRoZSBzdHlsaW5nIGEgYml0Lg0KSSdsbCB0
cnkgdG8ga2VlcCBpbiBtaW5kIGZvciBBU29DIGJpbmRpbmdzLg0KSSBkbyByZW1lbWJlciBSb2Ig
Y29tcGxhaW5pbmcgW29uIHNvbWUgb2xkZXIgYmluZGluZyBwYXRjaF0gdGhhdCB0aGUgc3R5bGlu
ZyBmb3IgYmluZGluZ3Mgc2hvdWxkIGJlIGluIHRoZSBmb3JtYXQgSSBqdXN0IGRpZC4NCsKvXF8o
44OEKV8vwq8NCg==
