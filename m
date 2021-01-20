Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A8D2FC8D6
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 04:28:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD0AF18EE;
	Wed, 20 Jan 2021 04:27:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD0AF18EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611113284;
	bh=yxt1cfVudGsm5ydn/ANVWZ8Y+HeOziVSqQOsWG+94KQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OdZRi8paUkX6X/OcEaKu+cPx8LMKJfSONM9b/Q+I+S8Blm++GKqwcG/K8XFhP6wKT
	 6Ar8lur/r0l4ZUA+GLb3A+dBikZROzRYWh7z4aiWIQkyzWI88jm13I4of7htKqHR+6
	 avznBm9GOZzYHIuK2JIXUFDMsOehc0QmtgOvmsbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E805F8019B;
	Wed, 20 Jan 2021 04:26:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1535F8012C; Wed, 20 Jan 2021 04:26:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06ADFF8012C
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 04:26:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06ADFF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="a1fcikHg"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com
 header.b="XNrWj1ho"
Received: from pps.filterd (m0170391.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10K38b2X023858; Tue, 19 Jan 2021 22:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=yxt1cfVudGsm5ydn/ANVWZ8Y+HeOziVSqQOsWG+94KQ=;
 b=a1fcikHgy4Q9NJbxbFny9GkCqB1s/L5lL4t+ymMqOH0Nssy66CrYRxJCN3IRHcpkssMe
 LRuT/wbYk48bBqFQfxVky5oZuIQK1C+wLdXR4OmSoAgBeByKol+VF/zIFpB/vr8HU0qI
 KjqvIK/+7yeB/EHOsJJjywYaRcj0FiocTm7FD951OsVM+0nMJTTbVazQe+1/aFbeUvw4
 5LonsKS3CU8QrUrg99dz5sJoRl+DWhqyBur/SuO/F5+Yr14+r+nyvYt5Xzek/Quj39yK
 5sh4+rltUtb11/NpFBPeCz2hpbpe5ldrXMoWXMzx+YJnpb/i4VSy6Roa6M3l69mXBDdZ PA== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 3668purn19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 22:26:17 -0500
Received: from pps.filterd (m0133268.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10K3ALKw126097; Tue, 19 Jan 2021 22:26:17 -0500
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx0a-00154901.pphosted.com with ESMTP id 3669pe225q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 22:26:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9zBQxD6iLdHqypPF/8chX85CP4C/+vpecahveSshVdY04TxdNBLNOVBy04DNlyOVVJYNncThEYCtaX/BBbOo8DxTJtgYXhCujF3ujcugisZkxKoGTBx4fHXmaHNl6+CWRz5J96tQevF9O12se9Uoit7Ctaqt/Knb75vf8fP1Ulr7X+v6qYeHyCVIubT8l3E8KObdDFD7BjKTrqF1daF7LmV52+aRoula1iZwNU3pU/Mpeo/P7zP53z5R9UmRItGBQiID0UYgS0+kiqQxPPDxK4PZzNcSMF782PxLaICxoJh4PP2YW+WZWeJ9Unl5K69sxNGgVDHs5rJHBiREDwlxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxt1cfVudGsm5ydn/ANVWZ8Y+HeOziVSqQOsWG+94KQ=;
 b=Hnvs9ioLjDpt2DJSzLJSXsgBlZQFm57KmO20fbaeW5fQKpmPCbPkUPCOq8nWJvc3U3WlzHrlhnoZiLzJs4wbP4RGJZqJWNe1sFB5KdWHPx2TqW5XN8Shgyzt9Qvyjatn8XC7XccClvNsB5pICWdIYo+eJgpZ2PXn44cYKIXc7DZImIXS/h0fvqRe8K5cfOFeOByOlrPxBeNdbWXmsL6WT89pqGDUnD3NSE3wNOv4Xjd7dkQgnNiR2qpCLlLq/9/TCx5mt0zCTqnD3OHAatFe6X8181skU1lY6iqxJ49ahn+Z3PiBPXZ6JS/c6eW7KawlctG/MUM29DKw2Q5Lwdy3Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com; 
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxt1cfVudGsm5ydn/ANVWZ8Y+HeOziVSqQOsWG+94KQ=;
 b=XNrWj1hou2b2uea77MXldyaHGlT4RVDquOnowfRH6ZmuhXpLs4VdhZmwoxlZNDbD8k8hnyVZpdv2GoVEDt0DYaKwuCy7v2A5Gt6NdltcDKZM5mGfXbV7QZ7VKUWVi9rHry9xTUQGEEI2sbAbyR+SA+hi+Jk24SOiiMm2QBWpr84=
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by BYAPR19MB3045.namprd19.prod.outlook.com (2603:10b6:a03:12d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 20 Jan
 2021 03:26:15 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::f49a:eb87:f48b:9e13]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::f49a:eb87:f48b:9e13%6]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 03:26:15 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: "Limonciello, Mario" <Mario.Limonciello@dell.com>, Perry Yuan
 <perry979106@gmail.com>, "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>, "mgross@linux.intel.com"
 <mgross@linux.intel.com>
Subject: RE: [PATCH v3 3/3] ASoC: rt715:add micmute led state control supports
Thread-Topic: [PATCH v3 3/3] ASoC: rt715:add micmute led state control supports
Thread-Index: AQHW6Qbwi41yhwvxwkmTUV59e6cBoaokRLGAgAYgxQCABMn9gIAAsBcA
Date: Wed, 20 Jan 2021 03:26:15 +0000
Message-ID: <SJ0PR19MB45280109DC3203B6A9B1A4DA84A20@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20210112171814.5404-1-Perry_Yuan@Dell.com>
 <BY3PR19MB49131AA4EAE7C24D365FAC8DFAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
 <44d8e280-c8f3-4e3a-7ef7-b68224c96def@gmail.com>
 <SA1PR19MB4926382ED61402D0F0BFA3B3FAA30@SA1PR19MB4926.namprd19.prod.outlook.com>
In-Reply-To: <SA1PR19MB4926382ED61402D0F0BFA3B3FAA30@SA1PR19MB4926.namprd19.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-01-19T16:32:52.9490236Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=311f12a0-af1f-4167-aca5-f17aad8b2065;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: Dell.com; dkim=none (message not signed)
 header.d=none;Dell.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [163.244.246.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cce5ced-3851-4b06-95d1-08d8bcf324f7
x-ms-traffictypediagnostic: BYAPR19MB3045:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR19MB30459C83628681F2B4A8041D84A20@BYAPR19MB3045.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xLiBzC0jWPvO1WZ/EdH+5vnD6U1jixVBhaTtAu55wLpMU32/UhMB2ApkLP+zI8KOMGlMKEvpBocdgQcwBXOeu57rqUIKu7gnGIVcSH3Nax3MPriqLqWl2p2uROLAsNxQaj6U69D47vfwhFL9KxnPied0dn7zeX+LRV/RpnhzOLIZBI1DjHmusZXqYVlxRbOk8aSTEySIlMMkdsMQ+spduV6H9eFN/GfQFp0Gh9Zo7r5xPZsO5FUzBB2aaM/k328sz4SA0NTbMLf99WZCJ7nQOD1O6VzzoLBdyGwQta5Ykw0WK+zD68htrdGtgdMVv7Tp+kkgcIaorhpuFVbubfBKR7sfL2i7tlC+CWQhXw4CjkW7+TxT8VjiBJBvyKJ2KMfsv4/zq7Zf0By1nsv1lvSOPd5UV+Klv59sZ5jlf7p32ylsQlwwYfyhRwbaGLTMV8ea50mHvXu7JJRFmmRp8y48zQ3I1Fg9vOmpwvI7aQLLcG4GxC5Q4oPEo/gf+cU7KeGldek/13WanHqZShckhCswpA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(86362001)(52536014)(7696005)(76116006)(33656002)(316002)(8676002)(9686003)(786003)(110136005)(55016002)(5660300002)(6506007)(54906003)(66446008)(64756008)(186003)(71200400001)(2906002)(66556008)(66476007)(4326008)(26005)(7416002)(53546011)(478600001)(8936002)(66946007)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?alcyUWNXZ01RYzkyK0VmOFdHbWIzTTl4Ti94RE9Fc1lXaHpISUNFOHhrOXBQ?=
 =?utf-8?B?VzhFNXFmb1FRbHJSdGNQRDlzWXozc3QrUFlwci83dW5zQ3E4L0w0U3NDWVcw?=
 =?utf-8?B?bG5Pc2RvK21weWtlYUFxZ0gxQm9rc0pHOHBJM0xFb21vK3Mwc3gxelpOOVBa?=
 =?utf-8?B?NlFGVm8ySko3cEFyNWxzRk1wZXg4aUhaUVlvMDZ2YUo1UXdMY0d3Q0srK2lh?=
 =?utf-8?B?ZDFKSWZDWHI5eXV6V0xYL3RtQVNUTDRhYThNZE40OThTczB0NEtDME56RElE?=
 =?utf-8?B?U1F0cWxNSW1YdWpQMEZEelMrL0dISEJTZDFIK0hXdjM0QXZOM1lnMW14QXk5?=
 =?utf-8?B?bTk5MTd4bEpycUhmNk5ZQ3JIYmxKbVlYWjhXYUhWZlVHK3cyUFdFWkxCQ2sz?=
 =?utf-8?B?NkhtSy9oYjRnZ21GN3plQ2c5NFRsVm85K0lzRm5HTmdIVGVrVmgySkgvdld0?=
 =?utf-8?B?VXlDcE1xNUttNmxFMXIycXhHRjJJM2tmcjFERTFnUEpNSzAyN2p6czRQZXp3?=
 =?utf-8?B?N2dXeUI4Ym9JN21NYjJyR08xcDUrenJwQmxGVEdzMy9mbWNPOU1TUGJiTjR6?=
 =?utf-8?B?VVZRckYva2ZJeGZzbmxWWXlqdE5QYVJsbXo5Qi9vUGZPVHRNTkcvMHFYT0hN?=
 =?utf-8?B?OEFpWVlzZVR2VjBxRkNFRldGbm5UNG16KzRONVRXZkpkMGVZYUt2UllzWGZ3?=
 =?utf-8?B?QWhzcVh6TTVSNFIwemZwS1lGY0NyRzJkNjdyK2g0RXhTRW14eTZsbjJSWTdz?=
 =?utf-8?B?RnhGWUVkVWliQ08vTDBEY2VMRDFidUtkRzRzY2FOQ0JvbHB1YU1yc3NBMHlT?=
 =?utf-8?B?cDVpcjZmTURXbUhlaUZpOHNTT1VCODVQOXpsTnpUanNINDNUR1JtSVZKZ2RE?=
 =?utf-8?B?V2VOTG9OMk5ENVpHNWFwTU5NdGxjQ3ZVeU9pNnR5emNHTnM3RTNOWHZ4NVo1?=
 =?utf-8?B?M2hoc0owbndpaU02WDJld3lNajhiWUZ4SVB0Rm9hUEFKR0xZaDVzVm5hSHJG?=
 =?utf-8?B?aWtIRlpqclhEaTFybmFXekhiN0FSbW8xTjZGbHQzS1BYREZmWjZhdFVrS3Ax?=
 =?utf-8?B?cWZDQ0Npb2lKNXBtbG56aElsQzhXVElYeVRjU3Y2YkFJV3VDd3l3emFIL3dZ?=
 =?utf-8?B?WXBpVXByMWcxTzdaTEIzS3B2bWY4bFhoQTdSeVRIWmZBeW9lZEdMdC9qM1JG?=
 =?utf-8?B?ZGhrMHN3T1BUY1RzaDZndldlMlpFTHM1UWwxVVBzMXR4TUdkL2Q0d3lIWGZ4?=
 =?utf-8?B?V0pqOFFUOWdSU1hMYmhySTRsemFNazVqOERTR3hpSXFpbCtJOW16N2ZpV1Nn?=
 =?utf-8?Q?XdqsHhonYzpAw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cce5ced-3851-4b06-95d1-08d8bcf324f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2021 03:26:15.5428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0QUM8e076uWPzIVEn2IPH5rf3vjiYSoQRBO2oV/srzy1wL4JzhS0hVtwJxV7qOMURJcAvjhZC3qe876440a3tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR19MB3045
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_15:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101200018
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200018
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaW1vbmNpZWxsbywgTWFyaW8g
PE1hcmlvX0xpbW9uY2llbGxvQERlbGwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkg
MjAsIDIwMjEgMTI6MzMgQU0NCj4gVG86IFBlcnJ5IFl1YW47IFl1YW4sIFBlcnJ5OyBvZGVyX2No
aW91QHJlYWx0ZWsuY29tOyBwZXJleEBwZXJleC5jejsNCj4gdGl3YWlAc3VzZS5jb207IGhkZWdv
ZWRlQHJlZGhhdC5jb207IG1ncm9zc0BsaW51eC5pbnRlbC5jb20NCj4gQ2M6IGxnaXJkd29vZEBn
bWFpbC5jb207IGJyb29uaWVAa2VybmVsLm9yZzsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Ow0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBwbGF0Zm9ybS1kcml2ZXIteDg2QHZn
ZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHYzIDMvM10gQVNvQzogcnQ3MTU6
YWRkIG1pY211dGUgbGVkIHN0YXRlIGNvbnRyb2wNCj4gc3VwcG9ydHMNCj4gDQo+ID4gPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+PiBGcm9tOiBZdWFuLCBQZXJyeSA8UGVycnlf
WXVhbkBEZWxsLmNvbT4NCj4gPiA+PiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDEyLCAyMDIxIDEx
OjE4DQo+ID4gPj4gVG86IG9kZXJfY2hpb3VAcmVhbHRlay5jb207IHBlcmV4QHBlcmV4LmN6OyB0
aXdhaUBzdXNlLmNvbTsNCj4gPiA+PiBoZGVnb2VkZUByZWRoYXQuY29tOyBtZ3Jvc3NAbGludXgu
aW50ZWwuY29tDQo+ID4gPj4gQ2M6IGxnaXJkd29vZEBnbWFpbC5jb207IGJyb29uaWVAa2VybmVs
Lm9yZzsNCj4gPiA+PiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPj4gcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5v
cmc7IFl1YW4sIFBlcnJ5OyBMaW1vbmNpZWxsbywNCj4gPiA+PiBNYXJpbw0KPiA+ID4+IFN1Ympl
Y3Q6IFtQQVRDSCB2MyAzLzNdIEFTb0M6IHJ0NzE1OmFkZCBtaWNtdXRlIGxlZCBzdGF0ZSBjb250
cm9sDQo+ID4gPj4gc3VwcG9ydHMNCj4gPiA+Pg0KPiA+ID4+IEZyb206IFBlcnJ5IFl1YW4gPHBl
cnJ5X3l1YW5AZGVsbC5jb20+DQo+ID4gPj4NCj4gPiA+PiBTb21lIG5ldyBEZWxsIHN5c3RlbSBp
cyBnb2luZyB0byBzdXBwb3J0IGF1ZGlvIGludGVybmFsIG1pY3Bob25lDQo+ID4gPj4gcHJpdmFj
eSBzZXR0aW5nIGZyb20gaGFyZHdhcmUgbGV2ZWwgd2l0aCBtaWNtdXRlIGxlZCBzdGF0ZSBjaGFu
Z2luZw0KPiA+ID4+IFdoZW4gbWljbXV0ZSBob3RrZXkgcHJlc3NlZCBieSB1c2VyLCBzb2Z0IG11
dGUgd2lsbCBuZWVkIHRvIGJlDQo+ID4gPj4gZW5hYmxlZCBmaXJzdGx5IGluIGNhc2Ugb2YgcG9w
IG5vaXNlLCBhbmQgY29kZWMgZHJpdmVyIG5lZWQgdG8NCj4gPiA+PiByZWFjdCB0byBtaWMgbXV0
ZSBldmVudCB0byBFQyhlbWJlZGRlZCBjb250cm9sbGVyKSBub3RpZnlpbmcgdGhhdA0KPiA+ID4+
IFNXIG11dGUgaXMgY29tcGxldGVkIFRoZW4gRUMgd2lsbCBkbyB0aGUgaGFyZHdhcmUgbXV0ZSBw
aHlzaWNhbGx5DQo+ID4gPj4gd2l0aGluIHRoZSB0aW1lb3V0IHJlYWNoZWQNCj4gPiA+Pg0KPiA+
ID4+IFRoaXMgcGF0Y2ggYWxsb3cgY29kZWMgcnQ3MTUgZHJpdmVyIHRvIGFjayBFQyB3aGVuIG1p
Y211dGUga2V5DQo+ID4gPj4gcHJlc3NlZCB0aHJvdWdoIHRoaXMgbWljcGhvbmUgbGVkIGNvbnRy
b2wgaW50ZXJmYWNlIGxpa2UNCj4gPiA+PiBoZGFfZ2VuZXJpYyBwcm92aWRlZCBBQ1BJIG1ldGhv
ZCBkZWZpbmVkIGluIGRlbGwtcHJpdmFjeSBtaWNtdXRlDQo+ID4gPj4gbGVkIHRyaWdnZXIgd2ls
bCBiZSBjYWxsZWQgZm9yIG5vdGlmeWluZyB0aGUgRUMgdGhhdCBzb2Z0d2FyZSBtdXRlDQo+ID4g
Pj4gaGFzIGJlZW4gY29tcGxldGVkDQo+ID4gPj4NCj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBQZXJy
eSBZdWFuIDxwZXJyeV95dWFuQGRlbGwuY29tPg0KPiA+ID4+DQo+ID4gPj4gLS0tLS0tLS0NCj4g
PiA+PiB2MiAtPiB2Mw0KPiA+ID4+ICogc2ltcGxpZnkgdGhlIHBhdGNoIHRvIHJldXNlIHNvbWUg
dmFsIHZhbHVlDQo+ID4gPj4gKiBhZGQgbW9yZSBkZXRhaWwgdG8gdGhlIGNvbW1pdCBpbmZvDQo+
ID4gPj4NCj4gPiA+PiB2MSAtPiB2MjoNCj4gPiA+PiAqIGZpeCBzb21lIGZvcm1hdCBpc3N1ZQ0K
PiA+ID4+IC0tLS0tLS0tDQo+ID4gPj4gLS0tDQo+ID4gPj4gICBzb3VuZC9zb2MvY29kZWNzL3J0
NzE1LXNkY2EuYyB8IDE2ICsrKysrKysrKysrKysrKysNCj4gPiA+PiAgIHNvdW5kL3NvYy9jb2Rl
Y3MvcnQ3MTUtc2RjYS5oIHwgIDEgKw0KPiA+ID4+ICAgc291bmQvc29jL2NvZGVjcy9ydDcxNS5j
ICAgICAgfCAxNCArKysrKysrKysrKysrKw0KPiA+ID4+ICAgc291bmQvc29jL2NvZGVjcy9ydDcx
NS5oICAgICAgfCAgMSArDQo+ID4gPj4gICA0IGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMo
KykNCj4gPiA+Pg0KPiA+ID4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LXNk
Y2EuYw0KPiA+ID4+IGIvc291bmQvc29jL2NvZGVjcy9ydDcxNS1zZGNhLmMgaW5kZXggYjQzYWM4
NTU5ZTQ1Li44NjFhMGQyYTg5NTcNCj4gPiA+PiAxMDA2NDQNCj4gPiA+PiAtLS0gYS9zb3VuZC9z
b2MvY29kZWNzL3J0NzE1LXNkY2EuYw0KPiA+ID4+ICsrKyBiL3NvdW5kL3NvYy9jb2RlY3MvcnQ3
MTUtc2RjYS5jDQo+ID4gPj4gQEAgLTEyLDYgKzEyLDcgQEANCj4gPiA+PiAgICNpbmNsdWRlIDxs
aW51eC92ZXJzaW9uLmg+DQo+ID4gPj4gICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+ID4g
Pj4gICAjaW5jbHVkZSA8bGludXgvaW5pdC5oPg0KPiA+ID4+ICsjaW5jbHVkZSA8bGludXgvbGVk
cy5oPg0KPiA+ID4+ICAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPiA+PiAgICNp
bmNsdWRlIDxsaW51eC9wbS5oPg0KPiA+ID4+ICAgI2luY2x1ZGUgPGxpbnV4L3NvdW5kd2lyZS9z
ZHcuaD4NCj4gPiA+PiBAQCAtMjQ0LDYgKzI0NSw3IEBAIHN0YXRpYyBpbnQgcnQ3MTVfc2RjYV9n
ZXRfdm9sc3coc3RydWN0DQo+ID4gPj4gc25kX2tjb250cm9sICprY29udHJvbCwNCj4gPiA+PiAg
IAl1bnNpZ25lZCBpbnQgbWF4ID0gbWMtPm1heDsNCj4gPiA+PiAgIAlpbnQgdmFsOw0KPiA+ID4+
DQo+ID4gPj4gKwlwcl9lcnIoIisrKysrK3J0NzE1X3NkY2FfZ2V0X3ZvbHN3KytcbiIpOw0KPiA+
ID4+ICAgCXZhbCA9IHNuZF9zb2NfY29tcG9uZW50X3JlYWQoY29tcG9uZW50LCBtYy0+cmVnKTsN
Cj4gPiA+PiAgIAlpZiAodmFsIDwgMCkNCj4gPiA+PiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4g
Pj4gQEAgLTI2MSw2ICsyNjMsNyBAQCBzdGF0aWMgaW50IHJ0NzE1X3NkY2FfcHV0X3ZvbHN3KHN0
cnVjdA0KPiA+ID4+IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsDQo+ID4gPj4gICAJc3RydWN0IHNu
ZF9jdGxfZWxlbV92YWx1ZSAqdWNvbnRyb2wpDQo+ID4gPj4gICB7DQo+ID4gPj4gICAJc3RydWN0
IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQgPQ0KPiA+ID4+IHNuZF9rY29udHJvbF9jaGlw
KGtjb250cm9sKTsNCj4gPiA+PiArCXN0cnVjdCBydDcxNV9zZGNhX3ByaXYgKnJ0NzE1ID0NCj4g
PiA+PiBzbmRfc29jX2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjb21wb25lbnQpOw0KPiA+ID4+ICAg
CXN0cnVjdCBzb2NfbWl4ZXJfY29udHJvbCAqbWMgPQ0KPiA+ID4+ICAgCQkoc3RydWN0IHNvY19t
aXhlcl9jb250cm9sICopa2NvbnRyb2wtPnByaXZhdGVfdmFsdWU7DQo+ID4gPj4gICAJdW5zaWdu
ZWQgaW50IHZhbCwgdmFsMiwgbG9vcF9jbnQgPSAyLCBpOyBAQCAtMjY4LDYgKzI3MSw3IEBADQo+
ID4gPj4gc3RhdGljIGludCBydDcxNV9zZGNhX3B1dF92b2xzdyhzdHJ1Y3Qgc25kX2tjb250cm9s
ICprY29udHJvbCwNCj4gPiA+PiAgIAl1bnNpZ25lZCBpbnQgcmVnMiA9IG1jLT5ycmVnOw0KPiA+
ID4+ICAgCXVuc2lnbmVkIGludCByZWcgPSBtYy0+cmVnOw0KPiA+ID4+ICAgCXVuc2lnbmVkIGlu
dCBtYXggPSBtYy0+bWF4Ow0KPiA+ID4+ICsJdW5zaWduZWQgaW50IHZhbDAsIHZhbDE7DQo+ID4g
Pj4gICAJaW50IGVycjsNCj4gPiA+Pg0KPiA+ID4+ICAgCXZhbCA9IHVjb250cm9sLT52YWx1ZS5p
bnRlZ2VyLnZhbHVlWzBdOyBAQCAtMjg3LDYgKzI5MSwxOCBAQA0KPiA+ID4+IHN0YXRpYyBpbnQg
cnQ3MTVfc2RjYV9wdXRfdm9sc3coc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsDQo+ID4g
Pj4gICAJCQlyZXR1cm4gZXJyOw0KPiA+ID4+ICAgCX0NCj4gPiA+Pg0KPiA+ID4+ICsjaWYgSVNf
RU5BQkxFRChDT05GSUdfREVMTF9QUklWQUNZKQ0KPiA+ID4+ICsJLyogZGVsbCBwcml2YWN5IExF
RCB0cmlnZ2VyIHN0YXRlIGNoYW5nZWQgYnkgbXV0ZWQvdW5tdXRlIHN3aXRjaCAqLw0KPiA+ID4+
ICsJaWYgKG1jLT5pbnZlcnQpIHsNCj4gPiA+PiArCQlpZiAodWNvbnRyb2wtPnZhbHVlLmludGVn
ZXIudmFsdWVbMF0gfHwgdWNvbnRyb2wtDQo+ID4gPj4+IHZhbHVlLmludGVnZXIudmFsdWVbMV0p
IHsNCj4gPiA+PiArCQkJcnQ3MTUtPm1pY211dGVfbGVkID0gTEVEX09GRjsNCj4gPiA+PiArCQl9
IGVsc2Ugew0KPiA+ID4+ICsJCQlydDcxNS0+bWljbXV0ZV9sZWQgPSBMRURfT047DQo+ID4gPj4g
KwkJfQ0KPiA+ID4+ICsJCWxlZHRyaWdfYXVkaW9fc2V0KExFRF9BVURJT19NSUNNVVRFLCBydDcx
NS0NCj4gPm1pY211dGVfbGVkKTsNCj4gPiA+PiArCX0NCj4gPiA+PiArI2VuZGlmDQo+ID4gPj4g
Kw0KPiA+ID4+ICAgCXJldHVybiAwOw0KPiA+ID4+ICAgfQ0KPiA+ID4+DQo+ID4gPj4gZGlmZiAt
LWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvcnQ3MTUtc2RjYS5oDQo+ID4gPj4gYi9zb3VuZC9zb2Mv
Y29kZWNzL3J0NzE1LXNkY2EuaCBpbmRleCA4NDBjMjM3ODk1ZGQuLmY4OTg4YWI4OGY4MA0KPiA+
ID4+IDEwMDY0NA0KPiA+ID4+IC0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvcnQ3MTUtc2RjYS5oDQo+
ID4gPj4gKysrIGIvc291bmQvc29jL2NvZGVjcy9ydDcxNS1zZGNhLmgNCj4gPiA+PiBAQCAtMzEs
NiArMzEsNyBAQCBzdHJ1Y3QgcnQ3MTVfc2RjYV9wcml2IHsNCj4gPiA+PiAgIAlpbnQgbF9pc191
bm11dGU7DQo+ID4gPj4gICAJaW50IHJfaXNfdW5tdXRlOw0KPiA+ID4+ICAgCWludCBod19zZHdf
dmVyOw0KPiA+ID4+ICsJYm9vbCBtaWNtdXRlX2xlZDsNCj4gPiA+PiAgIH07DQo+ID4gPj4NCj4g
PiA+PiAgIHN0cnVjdCBydDcxNV9zZHdfc3RyZWFtX2RhdGEgew0KPiA+ID4+IGRpZmYgLS1naXQg
YS9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LmMgYi9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LmMNCj4g
PiA+PiBpbmRleCBjZGNiYTcwMTQ2ZGEuLmI0ZTQ4MDc0NGM5NCAxMDA2NDQNCj4gPiA+PiAtLS0g
YS9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LmMNCj4gPiA+PiArKysgYi9zb3VuZC9zb2MvY29kZWNz
L3J0NzE1LmMNCj4gPiA+PiBAQCAtMTMsNiArMTMsNyBAQA0KPiA+ID4+ICAgI2luY2x1ZGUgPGxp
bnV4L2luaXQuaD4NCj4gPiA+PiAgICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPiA+ID4+ICAg
I2luY2x1ZGUgPGxpbnV4L2kyYy5oPg0KPiA+ID4+ICsjaW5jbHVkZSA8bGludXgvbGVkcy5oPg0K
PiA+ID4+ICAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPiA+PiAgICNpbmNsdWRl
IDxsaW51eC9wbS5oPg0KPiA+ID4+ICAgI2luY2x1ZGUgPGxpbnV4L3NvdW5kd2lyZS9zZHcuaD4N
Cj4gPiA+PiBAQCAtODgsNiArODksNyBAQCBzdGF0aWMgaW50IHJ0NzE1X3NldF9hbXBfZ2Fpbl9w
dXQoc3RydWN0DQo+ID4gPj4gc25kX2tjb250cm9sICprY29udHJvbCwNCj4gPiA+PiAgIAkJUlQ3
MTVfU0VUX0dBSU5fTUlYX0FEQzJfTH07DQo+ID4gPj4gICAJdW5zaWduZWQgaW50IGFkZHJfaCwg
YWRkcl9sLCB2YWxfaCwgdmFsX2xsLCB2YWxfbHI7DQo+ID4gPj4gICAJdW5zaWduZWQgaW50IHJl
YWRfbGwsIHJlYWRfcmwsIGksIGosIGxvb3BfY250Ow0KPiA+ID4+ICsJdW5zaWduZWQgaW50IHZh
bDAsIHZhbDE7DQo+ID4gPj4NCj4gPiA+PiAgIAlpZiAoc3Ryc3RyKHVjb250cm9sLT5pZC5uYW1l
LCAiTWFpbiBDYXB0dXJlIFN3aXRjaCIpIHx8DQo+ID4gPj4gICAJCXN0cnN0cih1Y29udHJvbC0+
aWQubmFtZSwgIk1haW4gQ2FwdHVyZSBWb2x1bWUiKSkgQEAgLTk1LDYNCj4gPiA+PiArOTcsMTgg
QEAgc3RhdGljIGludCBydDcxNV9zZXRfYW1wX2dhaW5fcHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wN
Cj4gPiA+PiAqa2NvbnRyb2wsDQo+ID4gPj4gICAJZWxzZQ0KPiA+ID4+ICAgCQlsb29wX2NudCA9
IDE7DQo+ID4gPj4NCj4gPiA+PiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0RFTExfUFJJVkFDWSkN
Cj4gPiA+PiArCS8qIE1pY211dGUgTEVEIHN0YXRlIGNoYW5nZWQgYnkgbXV0ZWQvdW5tdXRlIHN3
aXRjaCAqLw0KPiA+ID4+ICsJaWYgKG1jLT5pbnZlcnQpIHsNCj4gPiA+PiArCQlpZiAodWNvbnRy
b2wtPnZhbHVlLmludGVnZXIudmFsdWVbMF0gfHwgdWNvbnRyb2wtDQo+ID4gPj4+IHZhbHVlLmlu
dGVnZXIudmFsdWVbMV0pIHsNCj4gPiA+PiArCQkJcnQ3MTUtPm1pY211dGVfbGVkID0gTEVEX09G
RjsNCj4gPiA+PiArCQl9IGVsc2Ugew0KPiA+ID4+ICsJCQlydDcxNS0+bWljbXV0ZV9sZWQgPSBM
RURfT047DQo+ID4gPj4gKwkJfQ0KPiA+ID4+ICsJCWxlZHRyaWdfYXVkaW9fc2V0KExFRF9BVURJ
T19NSUNNVVRFLCBydDcxNS0NCj4gPm1pY211dGVfbGVkKTsNCj4gPiA+PiArCX0NCj4gPiA+PiAr
I2VuZGlmDQo+ID4gPj4gKw0KPiA+ID4gWW91IG1pZ2h0IGhhdmUgbWlzc2VkIG15IG90aGVyIGNv
bW1lbnQgb24gdjIgZmVlZGJhY2ssIGJ1dCBpcyB0aGVyZQ0KPiA+ID4gYSByZWFzb24gdG8ga2Vl
cCBpdCBiZWhpbmQgYSBjb21waWxlIHRpbWUgZmxhZyBmb3IgZGVsbCBwcml2YWN5DQo+ID4gPiBt
b2R1bGU/ICBJbiBwcmFjdGljZSBhbnkgb3RoZXIgZnV0dXJlIGxlZCBiYWNrZW5kIHByb3ZpZGVy
IHNob3VsZA0KPiA+ID4gd29yayB0b28uICBBbm90aGVyIHdheSB0byB0aGluayBhYm91dCBpdCAt
IGlmIGRlbGwgcHJpdmFjeSB3YXNuJ3QNCj4gPiA+IGVuYWJsZWQgd291bGQgdGhpcyBjYXVzZSBh
IHByb2JsZW0gdG8gcnVuIHRoaXMgY29kZT8gIEkgdGhpbmsgaXQgd291bGQganVzdA0KPiBiZSBh
IG5vLW9wLg0KPiA+ID4NCj4gPiA+PiAgIAlmb3IgKGogPSAwOyBqIDwgbG9vcF9jbnQ7IGorKykg
ew0KPiA+ID4+ICAgCQkvKiBDYW4ndCB1c2UgdXBkYXRlIGJpdCBmdW5jdGlvbiwgc28gcmVhZCB0
aGUgb3JpZ2luYWwgdmFsdWUNCj4gPiA+PiBmaXJzdCAqLw0KPiA+ID4+ICAgCQlpZiAobG9vcF9j
bnQgPT0gMSkgew0KPiA+ID4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL3J0NzE1Lmgg
Yi9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LmgNCj4gPiA+PiBpbmRleCAwMDlhODI2NmY2MDYuLjU3
YzlhZjA0MTE4MSAxMDA2NDQNCj4gPiA+PiAtLS0gYS9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LmgN
Cj4gPiA+PiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LmgNCj4gPiA+PiBAQCAtMjIsNiAr
MjIsNyBAQCBzdHJ1Y3QgcnQ3MTVfcHJpdiB7DQo+ID4gPj4gICAJc3RydWN0IHNkd19idXNfcGFy
YW1zIHBhcmFtczsNCj4gPiA+PiAgIAlib29sIGh3X2luaXQ7DQo+ID4gPj4gICAJYm9vbCBmaXJz
dF9od19pbml0Ow0KPiA+ID4+ICsJYm9vbCBtaWNtdXRlX2xlZDsNCj4gPiA+PiAgIH07DQo+ID4g
Pj4NCj4gPiA+PiAgIHN0cnVjdCBzZHdfc3RyZWFtX2RhdGEgew0KPiA+ID4+IC0tDQo+ID4gPj4g
Mi4yNS4xDQo+ID4NCj4gPiBQaWVycmUgTG91aXMgc3VnZ2VzdGVkIHRvIGp1c3Qgc2V0IHRoZSBt
aWMgbXV0ZSBsZWQgc3RhdGUgdW5jb25kaXRpb25hbGx5IC4NCj4gPiBJdCBpcyBtb3JlIGNvbW1v
biBpbnRlcmZhY2UgdG8gYWxsb3cgb3RoZXIgcGxhdGZvcm1zIHRvIGNoYW5nZSBtaWNtdXRlDQo+
IGxlZC4NCj4gPiBUaGUgZGlzY3Vzc2lvbiByZXN1bHQgaXMgZnJvbSAiW1BBVENIIHYyIDIvMl0g
QVNvQzogcnQ3MTU6YWRkIE1pYyBNdXRlDQo+ID4gTEVEIGNvbnRyb2wgc3VwcG9ydCINCj4gPg0K
PiA+IEhlcmUgaXMgdGhlIGNoYW5nZSBjb21wYXJlZCB0byBWMyAsdGhlIENPTkZJR19ERUxMX1BS
SVZBQ1kgd2lsbCBiZQ0KPiA+IHJlbW92ZWQNCj4gPg0KPiA+IC0jaWYgSVNfRU5BQkxFRChDT05G
SUdfREVMTF9QUklWQUNZKQ0KPiA+IC0gICAgICAgLyogZGVsbCBwcml2YWN5IExFRCB0cmlnZ2Vy
IHN0YXRlIGNoYW5nZWQgYnkgbXV0ZWQvdW5tdXRlIHN3aXRjaCAqLw0KPiA+ICsgICAgICAgLyog
TWljTXV0ZSBMRUQgc3RhdGUgY2hhbmdlZCBieSBtdXRlZC91bm11dGUgc3dpdGNoICovDQo+ID4g
ICAgICAgICAgaWYgKG1jLT5pbnZlcnQpIHsNCj4gPiAgICAgICAgICAgICAgICAgIGlmICh1Y29u
dHJvbC0+dmFsdWUuaW50ZWdlci52YWx1ZVswXSB8fCB1Y29udHJvbC0NCj4gPiA+dmFsdWUuaW50
ZWdlci52YWx1ZVsxXSkgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBydDcxNS0+bWlj
bXV0ZV9sZWQgPSBMRURfT0ZGOyBkaWZmIC0tZ2l0DQo+ID4gYS9zb3VuZC9zb2MvY29kZWNzL3J0
NzE1LmMgYi9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LmMgaW5kZXgNCj4gPiBiNGU0ODA3NDRjOTQu
LjYwYmIzZDk4MTAzZSAxMDA2NDQNCj4gPiAtLS0gYS9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LmMN
Cj4gPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0NzE1LmMNCj4gPiBAQCAtOTcsOCArOTcsNyBA
QCBzdGF0aWMgaW50IHJ0NzE1X3NldF9hbXBfZ2Fpbl9wdXQoc3RydWN0DQo+ID4gc25kX2tjb250
cm9sICprY29udHJvbCwNCj4gPiAgICAgICAgICBlbHNlDQo+ID4gICAgICAgICAgICAgICAgICBs
b29wX2NudCA9IDE7DQo+ID4NCj4gPiAtI2lmIElTX0VOQUJMRUQoQ09ORklHX0RFTExfUFJJVkFD
WSkNCj4gPiAtICAgICAgIC8qIE1pY211dGUgTEVEIHN0YXRlIGNoYW5nZWQgYnkgbXV0ZWQvdW5t
dXRlIHN3aXRjaCAqLw0KPiA+ICsgICAgICAgLyogTWljTXV0ZSBMRUQgc3RhdGUgY2hhbmdlZCBi
eSBtdXRlZC91bm11dGUgc3dpdGNoICovDQo+ID4gICAgICAgICAgaWYgKG1jLT5pbnZlcnQpIHsN
Cj4gPiAgICAgICAgICAgICAgICAgIGlmICh1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52YWx1ZVsw
XSB8fCB1Y29udHJvbC0NCj4gPiA+dmFsdWUuaW50ZWdlci52YWx1ZVsxXSkgew0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICBydDcxNS0+bWljbXV0ZV9sZWQgPSBMRURfT0ZGOyBAQCAtMTA3
LDcNCj4gPiArMTA2LDYgQEAgc3RhdGljIGludCBydDcxNV9zZXRfYW1wX2dhaW5fcHV0KHN0cnVj
dCBzbmRfa2NvbnRyb2wNCj4gPiAqa2NvbnRyb2wsDQo+ID4gICAgICAgICAgICAgICAgICB9DQo+
ID4gICAgICAgICAgICAgICAgICBsZWR0cmlnX2F1ZGlvX3NldChMRURfQVVESU9fTUlDTVVURSwg
cnQ3MTUtPm1pY211dGVfbGVkKTsNCj4gPiAgICAgICAgICB9DQo+ID4gLSNlbmRpZg0KPiANCj4g
SSdtIG5vdCBzdXJlIHdoaWNoIHRocmVhZCwgYnV0IEkgYmVsaWV2ZSB0aGVyZSB3YXMgc3RpbGwg
YWxzbyBhbm90aGVyDQo+IHN1Z2dlc3Rpb24gdGhhdCB0aGlzIHNob3VsZCBiZSBtYWRlIG1vcmUg
ImdlbmVyaWMiIGFuZCB0byB3b3JrIGZvciBhbGwNCj4gY29kZWNzLiAgU28gdGhhdCB3aGVuIHdl
IGhhdmUgbGV0cyBzYXkgYSBoeXBvdGhldGljYWwgcnQ3MTcgd2UgZG9uJ3QgbmVlZA0KPiB0aGUg
c2FtZSBpbiB0aGF0IG1vZHVsZS4NCkhpIE1hcmlvLg0KSmFyb3NsYXYgc3VnZ2VzdGVkIG1lIHRv
IG1vdmUgdGhpcyBwYXJ0IGNvZGUgdG8gZ2VuZXJpYyBjb250cm9sIGxheWVyLg0KSSB3aWxsIGFk
anVzdCB0aGlzIHBhdGNoIGFuZCBkbyBzb21lIHRlc3RpbmcgZm9yIHRoZSBuZXcgcGF0Y2guDQoN
ClBlcnJ5Lg0KDQoNCg==
