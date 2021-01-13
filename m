Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D89B62F448D
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 07:30:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7054016E2;
	Wed, 13 Jan 2021 07:29:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7054016E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610519402;
	bh=RuhS2s3YKYVFNaRP5+ACHQjgvP+R67knH8gqimARRII=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NHlISa7DXbaOflPMWD8xGTYsjFzO9pStlxPtyEJx2Q6nOwvDfukRLTjYPH12ZUO8w
	 wwqFhrAlWIszdGk0RoR2KUWFlgilG8FMLaurv8I7GS/YgO6n+oeT0HGKDdLTFFi/wl
	 013ZC3USiuTGx3MBQ4pgO14mNcVprduelPVc5UG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15B81F80085;
	Wed, 13 Jan 2021 07:28:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41004F801ED; Wed, 13 Jan 2021 07:28:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 511EBF8014D
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 07:28:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 511EBF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="gIBOCSlT"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com
 header.b="GQaAVDSW"
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10D6NY6M008099; Wed, 13 Jan 2021 01:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=RuhS2s3YKYVFNaRP5+ACHQjgvP+R67knH8gqimARRII=;
 b=gIBOCSlTNONrujLfglGdid0GsBCsIxqR2EAN6R1CvR0xx3j+FfCCVGqJef/Js/zMAy3Q
 ZVFpc2aMi64sID0KLhyUPnuxplpOlq8WM/40mT3yTgEZYTSzK9/73X8itoVrVt7tobSI
 PjGCzy0EYzyBR0YOnQzicDbDN58xKdrnojOFYOTt5xWjoPUVJteFtWKi4th5lBpxUdrX
 AI5cc9ZVboz5+E3lO8whlbxRER6lXrWlXT1sJQyqTjW8S4vNTNdXRZ74bgAtgm+acnzw
 9kgCGoSqOgfd3wIF4an/xkQBtYqZvzTUWKH2hTxI1hIH1R9JiVDcBoOorb8p8h05YaAP yg== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 361fy9j42u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 01:28:06 -0500
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10D6OuRZ082647; Wed, 13 Jan 2021 01:28:06 -0500
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by mx0b-00154901.pphosted.com with ESMTP id 361tsw0hv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 01:28:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jShAjPGBqPPmdLmrR+iHft0ChxzcgZf7xlofUZmidOb958qJvrTuSNFyngwrYNdq0+Xxu5rXFJ3jZZZN5UmtCl6hk+pQe6XRKTZCX6ZOlQ/H5FtVDDucd6C1wFSlTkgKt+qFXhyNGNZ8VxHjqNrPqcz/Dz4AhIJN13O/JumdmamRRcA0fv6uAVIe6dHhmaEBeKOywAuSWyvyE2gshmP0Wungzy9hSIg38tSFf9PlDGrZqx7HaPOcl33DPl7qcZFJv/29W9ypF5wRV26gBXqnajAI2PTPB4gMSaRMUaKBAD/W/YBCq3yeKwutmXUD+ptMWCGaM9px29b+8AB3k2btYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuhS2s3YKYVFNaRP5+ACHQjgvP+R67knH8gqimARRII=;
 b=kAsBmQ8IG9f9y0KBE28vlvuMWGo2EgEzadKd3Kt1tbclRLzkOBx3OJO++P2Tpq6AQDjbu0cH+/DeRKMKdXRFSD9k73ew517t9eZOs9BqKEDgFztWEpsgkV+egZmrDnNQMHwIX84BGqdqkPAzS9DH1PiFsUAEuSu6ZZH11ONtZkcVwMgzy0q6UhMzRlR6gdNjYV2MDSWHPmnUd6rbrqCWe6okH9h7hnQHlKEt/nPudkvr7BVhqBT1vn/4wvm4SkePFVxw3eJ7qx2fybj8frxZF6aypkHQNA4v89EdrB6I+vhv5G6ON+uX4sta/1MUVJ91q7NQAPvcdJCFXI2qXxQudQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com; 
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuhS2s3YKYVFNaRP5+ACHQjgvP+R67knH8gqimARRII=;
 b=GQaAVDSW6Gff8K8a0u5shvfnfHwCfbsnfAsxil/st3/QcUZOfUq6AYdrfN+H1bpTvE3bR9dw4uIYRulUmA2S7/tBCAKgLGlGmG81mtGdF3Ul5NBDlEk8yFfr4WPCFD+PkvGmpxzMCo8TJF38tobZ1B15YkThYEvAYhPf7JClbSg=
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by SJ0PR19MB4542.namprd19.prod.outlook.com (2603:10b6:a03:28b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 06:28:04 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::f49a:eb87:f48b:9e13]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::f49a:eb87:f48b:9e13%5]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 06:28:04 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Limonciello,
 Mario" <Mario.Limonciello@dell.com>, "oder_chiou@realtek.com"
 <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Subject: RE: [PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control support
Thread-Topic: [PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control support
Thread-Index: AQHW3R7JEBZDYV5120aC5Vics2sfNKoizuyAgAC7FFCAAJ95AIAAtLhQgAASy4CAAD76AA==
Date: Wed, 13 Jan 2021 06:28:04 +0000
Message-ID: <SJ0PR19MB4528CF1FC801D7E3A253F20984A90@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20201228133831.17464-1-Perry_Yuan@Dell.com>
 <a12075b1-09f3-a993-eace-008224ca5f52@linux.intel.com>
 <SJ0PR19MB4528225B226C4F9AA7F7ECBE84AA0@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <BY3PR19MB49130372226D65A235757BA1FAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
 <SJ0PR19MB4528FA846E29C0BB197725CA84A90@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <d133c0fe-c9c6-fc55-8c08-5e9a3cf0d6e7@linux.intel.com>
In-Reply-To: <d133c0fe-c9c6-fc55-8c08-5e9a3cf0d6e7@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Perry_Yuan@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-01-13T06:28:02.4069049Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=c08def18-07fb-48e6-a39d-5c6e1d60fc92;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [114.84.248.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f96705be-0719-449b-bc52-08d8b78c6253
x-ms-traffictypediagnostic: SJ0PR19MB4542:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR19MB4542FE3D627FDD98B834E2FF84A90@SJ0PR19MB4542.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SJhYz2exWEIsjv1Q8pyMGLPRAD0S+cSLFG7PQanpyo85prbwHb9oAgz5km1D4lfC7TcjiL68zsLh3+lMqmwUlflsvV4GCb+x8EM4yUQhxkS3vcg0Fr8khZC5clZvjdvFHeAmMzChyUnsRN8XerQtHGELLBXt0i2FYgWgGpGuEdYW7pJbgYtmtsVGWuv2IxzTq71u4QZdOc91yCA9MiqNSzfDJ1Rxa0vhyvsy9M3ClZ8oLdRSHVQfITHgd5ov63CRPLsQRK9gcUdbFNkKidk/pJBoPYerhSuuJtT2JkU0sHZBkVFUP9Qc4bD+SdlbvEu1292n1MrLRQG66PfVus5NtkzNmbajA75XYwRTeFQtTJxl845tltwaxnt7XFG5ati6vQH4AE1NmG/HiPefPXNUtg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(55016002)(26005)(478600001)(53546011)(316002)(52536014)(64756008)(54906003)(7696005)(71200400001)(8936002)(6506007)(186003)(66476007)(33656002)(83380400001)(8676002)(66946007)(66556008)(66446008)(786003)(9686003)(76116006)(5660300002)(4326008)(2906002)(110136005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Wmt0MnhDMEgwY3FpcEhMeTJpMUkzVnUwZ3RVcE01QUljenlNRmUwemYrUEta?=
 =?utf-8?B?RVVIdWwzcHZ4UVpBZVRHa3E2dzF6a0ZxSm9BeG8rUEVkWEVXTEpRdWU1dUFM?=
 =?utf-8?B?b1RoQk11ZlZXOFlrSHJwOEwweWtlM2FvalR6ZFhkT2lPdTlRRTI0cFZoNktY?=
 =?utf-8?B?K1MxbndGNXFlNUdOYjVUZFNFbFQwWlZ4d1VLSFNBdU9ORjIrNnRmeTVLNjkr?=
 =?utf-8?B?WE5sNEZ0WktucExWd0IrRzhkd3lnaDJsNjIvZ1Q5ZFlUL1VqRUhJQ1pXWit5?=
 =?utf-8?B?aWVZcG8rV0dMaFVBQ3VKcFNTWkdGNXRFZzl4VXl5S2tKMzI0Q1Q4OWJjeUVr?=
 =?utf-8?B?T0E1TmRvL1lqUXpVM0kvODZmd0pCS250eGJSV2gzWXFoVWRPSUI2RDBsd1RH?=
 =?utf-8?B?WlpxVlVaaitoSkZMR2l6Q3VkL0RFYUhrZUlFV1pQbGNWNkh2dWNzMXUvcnhs?=
 =?utf-8?B?OVJvajM1aEkwdk11czZjYXkxNnVSTkJzUlVqL0YyZjAza0VaNDc4OFR4Y1dV?=
 =?utf-8?B?L0d5WGd6bEp1UEJPMTlFdGpTcWNaOFgzcXJZQWdwS0FIK21kQlRCbjNMQm5L?=
 =?utf-8?B?S2o4UmJBYjdCVWFDSGNvanNoV1RLd0tUWmRaR3F3QlJLb09NZjhLZ1FvOFVK?=
 =?utf-8?B?bU1pbkNjdnRhaWZNNmt5Sk9YZnA4V1JTR0ZxazYwd0JXdENBZDM1Nk54eFEx?=
 =?utf-8?B?VlovdGZYNzBrZEVVeGlGR0dWZmMrOGVEUkNwRk0wNkwxQVBEdFg5VjZwaGxt?=
 =?utf-8?B?ZFczSzljQ1pLa2YzSDlBUjNtZDJqUkZyTGJ1cjVuUWpTbW1PRW1BTkh6UGxF?=
 =?utf-8?B?YXpiYjQxVWdnMXFzNkY3UDByVnhLZzFXSkcvanY4OVIyUnVQeDQxOFJCMmpP?=
 =?utf-8?B?dnR4dk1FaUQyUi9YM2ErNWt6ZU1jbTFsdWJ1VVlaQit6ZzJSeXpqamt0OXd1?=
 =?utf-8?B?d21YL2NFemYxcitGcExrZ2NhcXNzQnJRd3M4TnZGeXBML2lTS0ZtUUlvZzZv?=
 =?utf-8?B?NGpFZlJMZkdLL2lvN3pFaGhuVlFDb2EyeGwrbEh4bm5CUkZVQzVJWGs3QmdP?=
 =?utf-8?B?MHBoSU5pbVd3RmMyeEpGcVZBNkUyS0M5SW9SS2FOODhPVE5pdEl5cFRTWEFn?=
 =?utf-8?B?aHlJcGR4VUl2QkkvQjlyRGphTHQ3VnY2OStpeWFGWVI1STc5WllOaUlJY1VI?=
 =?utf-8?B?MXgxZ0JhQ05RWGJnSTZ2cVo4SVRZdS9PdGxRVTBEdzN6dWUrZlVZVkdNc2l3?=
 =?utf-8?B?ZzkxSkI2NDA3NzkrZmFIeDRZVHpHMEkzMmV4SW83aHRUalZ6aUxYQWFKOUhN?=
 =?utf-8?Q?NTCPG9axu6uz8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96705be-0719-449b-bc52-08d8b78c6253
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 06:28:04.5038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cfjECXwEH79gEXIwqa8UbTCCo+w/aVeioeUWCwDJt4xi+ptbMJRtS6hM9+4N8rk8ujNv8F4hzUsxPwxJQL8scA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4542
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_02:2021-01-12,
 2021-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130038
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 mlxscore=0
 spamscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130038
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBpZXJyZS1Mb3VpcyBCb3Nz
YXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IDIwMjHl
ubQx5pyIMTPml6UgMTA6NDINCj4gVG86IFl1YW4sIFBlcnJ5OyBMaW1vbmNpZWxsbywgTWFyaW87
IG9kZXJfY2hpb3VAcmVhbHRlay5jb207DQo+IHBlcmV4QHBlcmV4LmN6OyB0aXdhaUBzdXNlLmNv
bQ0KPiBDYzogYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOyBicm9vbmllQGtlcm5lbC5vcmc7
IGxnaXJkd29vZEBnbWFpbC5jb207DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIEFTb0M6IHJ0NzE1OmFkZCBNaWMgTXV0ZSBMRUQg
Y29udHJvbCBzdXBwb3J0DQo+IA0KPiANCj4gW0VYVEVSTkFMIEVNQUlMXQ0KPiANCj4gDQo+ID4+
Pj4+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfREVMTF9QUklWQUNZKQ0KPiA+Pj4+PiArCS8qIFBy
aXZhY3kgTEVEIFRyaWdnZXIgU3RhdGUgQ2hhbmdlZCBieSBtdXRlZC91bm11dGUgc3dpdGNoICov
DQo+ID4+Pj4+ICsJaWYgKG1jLT5pbnZlcnQpIHsNCj4gPj4+Pj4gKwkJdmFsMCA9IHVjb250cm9s
LT52YWx1ZS5pbnRlZ2VyLnZhbHVlWzBdOw0KPiA+Pj4+PiArCQl2YWwxID0gdWNvbnRyb2wtPnZh
bHVlLmludGVnZXIudmFsdWVbMV07DQo+ID4+Pj4+ICsJCWlmICh2YWwwID09IDEgJiYgdmFsMSA9
PSAxKSB7DQo+ID4+Pj4+ICsJCQlydDcxNS0+bWljbXV0ZV9sZWQgPSBMRURfT0ZGOw0KPiA+Pj4+
PiArCQkJbGVkdHJpZ19hdWRpb19zZXQoTEVEX0FVRElPX01JQ01VVEUsDQo+ID4+Pj4+ICsJCQkJ
CXJ0NzE1LT5taWNtdXRlX2xlZCA/IExFRF9PTiA6DQo+ID4+Pj4gTEVEX09GRik7DQo+ID4+Pj4+
ICsJCX0gZWxzZSBpZiAodmFsMCA9PSAwICYmIHZhbDEgPT0gMCkgew0KPiA+Pj4+PiArCQkJcnQ3
MTUtPm1pY211dGVfbGVkID0gTEVEX09OOw0KPiA+Pj4+PiArCQkJbGVkdHJpZ19hdWRpb19zZXQo
TEVEX0FVRElPX01JQ01VVEUsDQo+ID4+Pj4+ICsJCQkJCXJ0NzE1LT5taWNtdXRlX2xlZCA/IExF
RF9PTiA6DQo+ID4+Pj4gTEVEX09GRik7DQo+ID4+Pj4+ICsJCX0NCj4gPj4+Pj4gKwl9DQo+ID4+
Pj4+ICsjZW5kaWYNCj4gPj4+Pg0KPiA+Pj4+IFNob3VsZCB0aGlzIGJlIGFjdGl2YXRlZCBmb3Ig
c3BlY2lmaWMgRE1JIHF1aXJrcz8gVGhpcyBkcml2ZXIgaXMNCj4gPj4+PiB1c2VkIGluDQo+ID4+
PiBub24tRGVsbA0KPiA+Pj4+IHBsYXRmb3JtcyAoSSBhbSB0aGlua2luZyBvZiBJbnRlbCBSVlBz
IG9yIFJlYWx0ZWsgZGF1Z2h0ZXJib2FyZHMpLA0KPiA+Pj4+IEkgYW0gbm90IHN1cmUgaWYgYSBi
dWlsZC10aW1lIGJlaGF2aW9yIGNoYW5nZSBtYWtlcyBzZW5zZS4NCj4gPj4+Pg0KPiA+Pj4+IE9y
IGNvbnZlcnNlbHkgY291bGQgd2UganVzdCBzZXQgdGhlIExFRHMgdW5jb25kaXRpb25hbGx5IGlm
IGRvaW5nDQo+ID4+Pj4gc28gaXMgaGFybWxlc3M/DQo+ID4+Pg0KPiA+Pj4gVGhlIGN1cnJlbnQg
bWljIG11dGUgbGVkIHNldHRpbmcgcGF0aCBpcyBub3QgY29tbW9uIHVzZWQgZm9yIG90aGVyDQo+
ID4+PiB2ZW5kb3JzLCBqdXN0IERlbGwgcGxhdGZvcm0gc3VwcG9ydCB0aGlzIG1pYyBtdXRlIGxl
ZCBzZXQgb3BlcmF0aW9uLg0KPiA+Pj4NCj4gPj4+IERvIHlvdSB0aGluayB0aGF0IEkgbmVlZCB0
byBhZGQgb25lIERNSSBxdWlyayBpbiB0aGUgbmV4dCB2ZXJzaW9uID8NCj4gPj4+IElmIHNvLCBJ
IGNhbiBhZGQgdGhhdC4NCj4gPj4+DQo+ID4+Pg0KPiA+Pg0KPiA+Pg0KPiA+PiBJbiB0aGUgSERB
IGF1ZGlvIGNhc2UgdGhpcyBpcyBtb2RlbGVkIG9mZiBvZiwgdGhlIGNvZGUgcnVucyB3aGV0aGVy
DQo+ID4+IG9yIG5vdCBhIHZlbmRvciBoYXMgc3VwcG9ydCBmb3IgYSBtaWMgbXV0ZSBMRUQuICBU
aGUgY2FsbHMgdG8NCj4gPj4gbGVkdHJpZ19hdWRpb19zZXQgc2hvdWxkIGJlIGEgbm8tb3AuICBJ
IGFncmVlIHdpdGggQFBpZXJyZS1Mb3Vpcw0KPiA+PiBCb3NzYXJ0IGluIHRoaXMgY2FzZSwgd2Ug
c2hvdWxkIGp1c3QgYmUgcnVubmluZyBpdCB3aGV0aGVyIG9yIG5vdA0KPiA+PiBkZWxsLXByaXZh
Y3kgaXMgY29tcGlsZWQgaW4uICBJZiBhbm90aGVyIHZlbmRvciBjaG9vc2VzIHRvIGFkZCBMRUQN
Cj4gPj4gc3VwcG9ydCB0aGV5J2xsIGp1c3QgbmVlZCB0byBzZXQgdXAgdGhlaXIgbGVkdHJpZyBz
dXBwb3J0ZWQgYmFja2VuZCBhbmQgbm90DQo+IGNoYW5nZSBjb2RlYyBjb2RlLg0KPiA+DQo+ID4g
SGkgQFBpZXJyZS1Mb3VpcyBCb3NzYXJ0DQo+ID4gU2VlbXMgbGlrZSB0aGF0IHdlIGhhdmUgdHdv
IHdheSB0byBnby4NCj4gPiAqIERNSSBxdWlya3Msc2VlbXMgbGlrZSB0aGF0IGl0IG5lZWRzIHRv
IG1haW50YWluIHRoZSBxdWlyayBsaXN0IHdoZW4gdmVuZG9ycw0KPiBoYXZlIG5ldyBzeXN0ZW0g
dG8gc3VwcG9ydC4NCj4gPiAqIFdlIGp1c3Qgc2V0IHRoZSBtaWMgbXV0ZSBsZWQgc3RhdGUgdW5j
b25kaXRpb25hbGx5IC4NCj4gPg0KPiA+IFdoaWNoIHdheSB3b3VsZCB5b3UgcHJlZmVyIGZvciBu
ZXh0IHBhdGNoIHJldmlldz8NCj4gDQo+IE1haW50YWluaW5nIHF1aXJrcyBpcyBhIGhhc3NsZSwg
aXQncyBtdWNoIHNpbXBsZXIgYW5kIGNvbnNpc3RlbnQgd2l0aCBIRGF1ZGlvDQo+IGlmIHRoZSBs
ZWRzIGFyZSBzZXQgdW5jb25kaXRpb25hbGx5LiBUaGFua3MhDQoNClRoYW5rIHlvdSBmb3IgeW91
ciBjb25maXJtLiANCkkgd2lsbCB0YWtlIHRoaXMgdG8gbmV4dCBwYXRjaCBWNC4NCg0KUGVycnkg
IFl1YW4NCkRlbGwgfCBDbGllbnQgU29mdHdhcmUgR3JvdXAgfCBDREMgTGludXggT1MgIA0K
