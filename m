Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E11F2F37BC
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 18:56:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04AE01724;
	Tue, 12 Jan 2021 18:55:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04AE01724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610474199;
	bh=jiFDGPaCyxSF4MyVC3IMOuHBRRodoWvjQ0jiZ9n4D9Y=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I51g+LGE/K7sXc4ekdoK3LxOxk9WLkloZ6+S6r0biqG8N1rL2Su2aVPvfqaKMnqDN
	 XXdf2UmXO0bIK1AtMKhu3RCtKduIyE58O0o9/BEegBpUamuptnIaYe/7LPb1RvthlF
	 H7U9vSKAJkMsBgoES2GFL8rp8HbQYnET4iiQgTPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2618EF804CB;
	Tue, 12 Jan 2021 18:55:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A538F804CA; Tue, 12 Jan 2021 18:55:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A15D2F804C2
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 18:54:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A15D2F804C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="D1VPr66O"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com
 header.b="QcijevlI"
Received: from pps.filterd (m0170397.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10CHpb5p018213; Tue, 12 Jan 2021 12:54:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=jiFDGPaCyxSF4MyVC3IMOuHBRRodoWvjQ0jiZ9n4D9Y=;
 b=D1VPr66OvQJPy3TDm9JL/O2O0Mh5/HljxR2n4kFZeKmKNO1CpHKNEosVbkbNDt/DLL6I
 79e8adOhJziio9ZpzEKxbchoICgFFoZii0XXRKMHco5RykWzoqr0DaEBzw3Hsy3BC9Am
 08/k1Ft+c0B9k00M/9o67k1P/TWCWoLR3l5RdeaxG6RlZ0vUjExZtuGtLfDeMo56ajiB
 tNUkWb1o3ZwAaJGrJCQ0i10w6IuVfmDq0CM/yVhX5q7Tf2wX/3WnF4I7pCCJueYADbXC
 rbLG7+EKv/qBTgDk1N4XYd533oTAZwEQ/bk9fVV4kBk9HJAFjL6SAxe+CAyzNUMKcuVz UA== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0b-00154904.pphosted.com with ESMTP id 361fyu8504-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 12:54:55 -0500
Received: from pps.filterd (m0144102.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10CHrOxb008098; Tue, 12 Jan 2021 12:54:55 -0500
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2059.outbound.protection.outlook.com [104.47.36.59])
 by mx0b-00154901.pphosted.com with ESMTP id 361fr6gvhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jan 2021 12:54:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6sa1e6DEZY9w5QIFj79rTteVwVUqzSHrRyscwSPE+q7iwb79d5SDemO1JwKlIyTydvGgSrWqV4LnUly3ezRgq6zTGCj7g8DQdp1w17wPp9Oig9Lehyuau4nDP9VOjHMcga/QafXtRYPR0en7EJPj8MPXc3I6MVq87KTI829qlVfV2W+kh+35IaS6wqemtynNCblEMh+w0RwjKzKyvArE73L1C4jYxgIffGduCgk1zVifFrsiKz0MzUp2hGeEDdYkCdXUe0a4PUlORWZoZ9F2+QoIoJOR5Qq8OoXIgxlMTMG0s8iPQc6qiEwy0Z+d1HNK54d+SWSLkgKg0E63EmSQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiFDGPaCyxSF4MyVC3IMOuHBRRodoWvjQ0jiZ9n4D9Y=;
 b=RyIflZN+DWmHJXHwraignuhRjQTd6XDiW6wZRQYrzSZfBguTnzy+tqDjMF5TbdHh6d8oZX/9UE4DtnbZp9qijAo6jgbp8aEhNKPhnFIrwDqyybs0uy/TeheuoNbVJfZGQh4OyZKFdedi8Zp8e2g/+AXpN4VEFOADU3GUIiDxYgMrquSUAN/m0zpOK4ATvMmNhgB2oOrreDHT+e00Om91F6yCgHg1Egmd7tdAceDz4dP0yRUgqxQfmK8llto2r2FVAjqcBbvGxSPjubWTRgb3m8AQTQguweQftj1TJpeSb+iMDHNaNkwSlSWknfh6hCsWzcLGzAHHRFNaH5DFykNEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com; 
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiFDGPaCyxSF4MyVC3IMOuHBRRodoWvjQ0jiZ9n4D9Y=;
 b=QcijevlIo8t22nP//8pqqfXhlevP7UWpC9d8dsZc4iuss6bW5ph8zJzuUu0n2tJzzx1ilkYzA+WAH2WgEBqR4m3LabKRQTtT4gZX8XQZKL18Bpb2BW7wNqIAdLkA1+Cz3eUTJHMN+BpkpipUQqroFaovTn6kV+eDnK20+VA/9bU=
Received: from BY3PR19MB4913.namprd19.prod.outlook.com (2603:10b6:a03:367::23)
 by BY5PR19MB3940.namprd19.prod.outlook.com (2603:10b6:a03:227::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 17:54:51 +0000
Received: from BY3PR19MB4913.namprd19.prod.outlook.com
 ([fe80::7572:e4d1:248f:95e7]) by BY3PR19MB4913.namprd19.prod.outlook.com
 ([fe80::7572:e4d1:248f:95e7%3]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 17:54:51 +0000
From: "Limonciello, Mario" <Mario.Limonciello@dell.com>
To: "Yuan, Perry" <Perry.Yuan@dell.com>, "oder_chiou@realtek.com"
 <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>
Subject: RE: [PATCH v3 2/3] x86/platform/dell-privacy-wmi: add document for
 dell privacy driver
Thread-Topic: [PATCH v3 2/3] x86/platform/dell-privacy-wmi: add document for
 dell privacy driver
Thread-Index: AQHW6Qbl0IaMav/vH0uA5O85vHm+m6okRNKQ
Date: Tue, 12 Jan 2021 17:54:51 +0000
Message-ID: <BY3PR19MB49137D1D7508190AF87655FEFAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
References: <20210112171755.14408-1-Perry_Yuan@Dell.com>
In-Reply-To: <20210112171755.14408-1-Perry_Yuan@Dell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-01-12T17:52:37.3114724Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=2be014bf-2f94-4f92-bbdf-a39f4aee6703;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: Dell.com; dkim=none (message not signed)
 header.d=none;Dell.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4972aae1-811b-4ac2-d2bd-08d8b7232956
x-ms-traffictypediagnostic: BY5PR19MB3940:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR19MB39406BDDD99B39C9DB497A87FAAA0@BY5PR19MB3940.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B09mzOgdCZxZNzJxUQ7g/4AYp+WUbVUSWS0zq/Cg+nSdZ05d//35FwwEJ6nkL9HdqWh4VvYnWF76xcDvCbXpz1A4i/r5Rl7cGOj2jRiulqE5s7VsscL1k0Y+Z2vAakNM6EOs2YqioWddsSEaj0W+x0HeJTAX7+cAiFUqIfy+4W6HUjt8ePV6QaDBTKejJfXIFLaqU0cnxpw96ov4ywJZJwwve9288HTtOXB5SkVgAHnh4EAh89FcMJcKjVnG+sXl8ZW4OYdHKbj/CoQoeN83Zn3N7KpXyqaUFqDGdH3b1wlVw8ePKjZTwWNvZH+9lHfybNoMGGLIvsLZJUrRyJwpoeMQ+zaAfy1JA3IvtqUSyiDBanxn4oQiAYITRp3/wEEGsrUIVqDhvtOGZeCS7rIpAw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY3PR19MB4913.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(5660300002)(53546011)(7416002)(8676002)(26005)(6506007)(2906002)(110136005)(71200400001)(66946007)(66476007)(52536014)(64756008)(76116006)(8936002)(55016002)(478600001)(66556008)(83380400001)(54906003)(9686003)(33656002)(7696005)(4326008)(86362001)(316002)(66446008)(786003)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?T0hLdjBBd2ZackFLOHk1T0NRaGNuUkJLM2JjbWo5dVBVWTEzLytoRU5kQXB0?=
 =?utf-8?B?SHhrdEVUWUxiQjFmT09xYldBTDZLbTU2bGxmV2xDckJZMldTdjExNmIwM2pv?=
 =?utf-8?B?V0FOMkZ4TGpyMkdBaElNeEQwbnZicEJlR2haODZZcDZVRjNFeFgvREJwbzJt?=
 =?utf-8?B?NTIvUmp5K1ZDZ2tTS3Ezbmx5YjVFY3hSakdFaVRJbjJLWnNVRUk4SUV1OUZY?=
 =?utf-8?B?TmpJMlBZUElheWo1Zmk3a09GYi9wVUhUU0Z1T0VRUXJmR3diTFRrbko4RVZW?=
 =?utf-8?B?Y3hTVFZ1elNMMHlPTnBKekhzeCtINWx6YS9QZ252OGRockxEQ3hMUlhXZHN3?=
 =?utf-8?B?RjFuQmpNVk04L05Dc1BHb3RKYU9PRWwzcVdHUW05dnI3RzdKZldnRTNjU1NS?=
 =?utf-8?B?ejJyZ0RBemRlOGJyQVBzTnJxRVYxb2VSV1hoYThxOStxRDJ3VnZyTkoxNFY0?=
 =?utf-8?B?L3pFN3JCTkVicFpWelNxa1BCdTIvN2ltRkswa3ErZy9vUEt2aVltaTY0cWdm?=
 =?utf-8?B?cmpJK2VJOEVDV0RmK01tUDVsQ0RIZHo3TXNHWFBKTHRIcVFzeU00VXFuYUtD?=
 =?utf-8?B?WFNmYjdqcUowTEQ5UkppaEtOc1NsYmRKUE16YWpWM08wSW5rbjhNNHdpOTBE?=
 =?utf-8?B?MXp1REhrMUQybjgzNUFSb0Ziams5T0M0eW5sRkxYVjN3TUtXVG01NEZramNN?=
 =?utf-8?B?cVcrcHNKLzhxUTR6Z2liNWREWDJyUm9LcjdUdzkyaktFWW1wclZ3bk8wZGEr?=
 =?utf-8?B?VHRCZGl5aU52Q0JGWmpLZDJtZWRBSFZwb0UvYzBOaUcvTllBSnZmazBBYVU2?=
 =?utf-8?B?UWQvZVRFL3ZZK2FVNlI0WUpmdVJ5N1JXNEhmM0VTakt3dWJnOFU3Sm5VT2hM?=
 =?utf-8?B?a1k5Y2llUTZSd1NDZUVtbEZ1amxEcEY4WjZ2VTZwbWZKVzJDRjVXZUdTM3Zs?=
 =?utf-8?B?dU54UG54R0k5V2xJVWlJUzZpVnA2L2grUVlPNURiRkFpS29SM3p3ZzVlb1RU?=
 =?utf-8?B?Zm9GbDlKWXRzRk5IeVBSM2YzYjNnbmlWWmcvQlNtMEFWU2piSWhhbWdiaGtB?=
 =?utf-8?B?MnBsNUpnZHRSbDZHRW9XZGVIK2o4YnhaNWNCVVErMlRNc1FpNDEwRXhaK3Rs?=
 =?utf-8?B?aVBzUkhVTUc4UnNGa2dXYXg1dXRPbUdFSm90eGF1dEg5cVZtcXNJYWprbGww?=
 =?utf-8?B?QWZuM21Yb3hQa2dDeTZWYllWVDVSUHcza2k1ejE1UjZncWFEZWFOZERCNG5u?=
 =?utf-8?B?N1E0REIwU3hPZDU2VEtDZ3ZyM2o4NWRNNWZLdUNKRWlCUjh2b2F1SUR0Y3FH?=
 =?utf-8?Q?shkVgGeiXv8SI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR19MB4913.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4972aae1-811b-4ac2-d2bd-08d8b7232956
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 17:54:51.6506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AUnHiiDgNimj6D+gU/Mj1L+yg0rX/98GAPAzZNgbIRZSoJwe398VV1FYNGzYtgd62+2+gvkT0YL60g05xIgjZ15eixvccU4fPhlFhO5RdFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3940
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-12_12:2021-01-12,
 2021-01-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101120105
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101120105
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBZdWFuLCBQZXJyeSA8UGVycnlf
WXVhbkBEZWxsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAxMiwgMjAyMSAxMToxOA0K
PiBUbzogb2Rlcl9jaGlvdUByZWFsdGVrLmNvbTsgcGVyZXhAcGVyZXguY3o7IHRpd2FpQHN1c2Uu
Y29tOw0KPiBoZGVnb2VkZUByZWRoYXQuY29tOyBtZ3Jvc3NAbGludXguaW50ZWwuY29tDQo+IENj
OiBsZ2lyZHdvb2RAZ21haWwuY29tOyBicm9vbmllQGtlcm5lbC5vcmc7IGFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgcGxhdGZvcm0t
ZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7IFl1YW4sDQo+IFBlcnJ5OyBMaW1vbmNpZWxsbywg
TWFyaW8NCj4gU3ViamVjdDogW1BBVENIIHYzIDIvM10geDg2L3BsYXRmb3JtL2RlbGwtcHJpdmFj
eS13bWk6IGFkZCBkb2N1bWVudCBmb3IgZGVsbA0KPiBwcml2YWN5IGRyaXZlcg0KPiANCj4gRnJv
bTogUGVycnkgWXVhbiA8cGVycnlfeXVhbkBkZWxsLmNvbT4NCj4gDQo+IERlc2NyaWJlIHRoZSBE
ZWxsIFByaXZhY3kgZmVhdHVyZSBjYXBhYmlsaXRpZXMgYW5kIGRldmljZXMNCj4gc3RhdGUgY2xh
c3MgZXhwb3NlZCBieSBCSU9TDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQZXJyeSBZdWFuIDxwZXJy
eV95dWFuQGRlbGwuY29tPg0KPiAtLS0NCj4gIC4uLi90ZXN0aW5nL3N5c2ZzLXBsYXRmb3JtLWRl
bGwtcHJpdmFjeS13bWkgICB8IDMxICsrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzMSBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9BQkkvdGVzdGluZy9zeXNmcy1wbGF0Zm9ybS1kZWxsLXByaXZhY3ktd21pDQoNCkkgZG9uJ3Qg
c2VlIGEgcmVhc29uIHRoYXQgdGhlIGRvY3VtZW50YXRpb24gbmVlZHMgdG8gY29tZSBpbiBpdCdz
IG93biBjb21taXQuDQpJbiB2NCwgSSB3b3VsZCB0aGluayB0aGlzIGNhbiBjb2xsYXBzZSBhcyBw
YXJ0IG9mOg0KIkFkZCBzdXBwb3J0IGZvciBEZWxsIGhhcmR3YXJlIHByaXZhY3kiDQoNCj4gDQo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLXBsYXRmb3JtLWRl
bGwtcHJpdmFjeS13bWkNCj4gYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLXBsYXRm
b3JtLWRlbGwtcHJpdmFjeS13bWkNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAw
MDAwMDAwMDAwLi4zZGJjMmQyNWI2MGUNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVu
dGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLXBsYXRmb3JtLWRlbGwtcHJpdmFjeS13bWkNCj4gQEAg
LTAsMCArMSwzMSBAQA0KPiArV2hhdDoJCS9zeXMvYnVzL3dtaS9kZXZpY2VzLzY5MzI5NjVGLTE2
NzEtNENFQi1COTg4LQ0KPiBEM0FCMEE5MDE5MTkvZGV2aWNlc19zdXBwb3J0ZWQNCj4gK0RhdGU6
CQlKYW4gMjAyMQ0KPiArS2VybmVsVmVyc2lvbjoJNS4xMQ0KSSB0aGluayB0aGlzIGlzIDUuMTIg
bWF0ZXJpYWwgbm93Lg0KTmVlZCB0byB1cGRhdGUgdGhpcyB0byBhcHByb3hpbWF0ZSA1LjEyIGRh
dGUuDQoNCj4gK0NvbnRhY3Q6CSJwZXJyeV95dWFuQGRlbGwuY29tPiINCg0KSSB0aGluayBEZWxs
IGFkZHJlc3NlcyBwdWJsaWNseSB1c2UgYSBwZXJpb2QgcmF0aGVyIHRoYW4gYW4gdW5kZXJzY29y
ZSwgbm8/DQpTbyBzaG91bGRuJ3QgdGhpcyBiZSBwZXJyeS55dWFuQGRlbGwuY29tPyAoQWx0aG91
Z2ggSSBhY2tub3dsZWRnZSBpdCdzIGFuDQphbGlhcywgSSBkb24ndCB0cnVzdCB0aGF0IEkvVCB3
b3VsZG4ndCByZW1vdmUgdGhhdCBzb21lIGRheSkuDQoNCj4gK0Rlc2NyaXB0aW9uOg0KPiArCQlE
aXNwbGF5IHdoaWNoIGRlbGwgaGFyZHdhcmUgbGV2ZWwgcHJpdmFjeSBkZXZpY2VzIGFyZSBzdXBw
b3J0ZWQNCj4gKwkJ4oCcRGVsbCBQcml2YWN54oCdIGlzIGEgc2V0IG9mIEhXLCBGVywgYW5kIFNX
IGZlYXR1cmVzIHRvIGVuaGFuY2UNCj4gKwkJRGVsbOKAmXMgY29tbWl0bWVudCB0byBwbGF0Zm9y
bSBwcml2YWN5IGZvciBNSUMsIENhbWVyYSwgYW5kDQo+ICsJCWVQcml2YWN5IHNjcmVlbnMuDQo+
ICsJCVRoZSBzdXBwb3J0ZWQgcHJpdmFjeSBoYXJlZHdhcmUgcHJpdmFjeSBkZXZpY2VzIGFyZToN
Cg0KWW91IGhhdmUgYSB0eXBvIGhlcmUuDQoNCj4gKwkJICogMHgwIC0gTm9uZSwNCj4gKwkJICog
MHgxIC0gTWljcm9waG9uZSwNCj4gKwkJICogMHgyIC0gQ2FtZXJhLA0KPiArCQkgKiAweDQgLSBl
UHJpdmFjeSBTY3JlZW4NCg0KU28gdGhpcyBpcyBhbiBiaXRtYXAgZW5jb2RlZCBpbiB0aGUgaW50
ZWdlcj8gIEkgdGhpbmsgdGhhdCBuZWVkcyB0byBiZSBtZW50aW9uZWQNCmluIHRoZSBkb2N1bWVu
dGF0aW9uLg0KDQo+ICsNCj4gK1doYXQ6CQkvc3lzL2J1cy93bWkvZGV2aWNlcy82OTMyOTY1Ri0x
NjcxLTRDRUItQjk4OC0NCj4gRDNBQjBBOTAxOTE5L2N1cnJlbnRfc3RhdGUNCj4gK0RhdGU6CQlK
YW4gMjAyMQ0KPiArS2VybmVsVmVyc2lvbjoJNS4xMQ0KPiArQ29udGFjdDoJInBlcnJ5X3l1YW5A
ZGVsbC5jb20+Ig0KPiArRGVzY3JpcHRpb246DQo+ICsJCUFsbG93IHVzZXIgc3BhY2UgdG8gY2hl
Y2sgY3VycmVudCBkZWxsIHByaXZhY3kgZGV2aWNlIHN0YXRlLg0KPiArCQlEZXNjcmliZXMgdGhl
IERldmljZSBTdGF0ZSBjbGFzcyBleHBvc2VkIGJ5IEJJT1Mgd2hpY2ggY2FuIGJlDQo+ICsJCWNv
bnN1bWVkIGJ5IHZhcmlvdXMgYXBwbGljYXRpb25zIGludGVyZXN0ZWQgaW4ga25vd2luZyB0aGUg
UHJpdmFjeQ0KPiArCQlmZWF0dXJlIGNhcGFiaWxpdGllcw0KPiArCQlUaGVyZSBhcmUgdGhyZWUg
Qml0cyBmb3IgYXZhaWxhYmxlIHN0YXRlczoNCj4gKwkJICAgICogMCAtPiBPZmYNCj4gKwkJICAg
ICogMSAtPiBPbg0KPiArCQkgICAgKiBCaXQwIC0+IE1pY3JvcGhvbmUNCj4gKwkJICAgICogQml0
MSAtPiBDYW1lcmENCj4gKwkJICAgICogQml0MiAtPiBlUHJpdmFjeVNjcmVlbg0KPiArDQo+IC0t
DQo+IDIuMjUuMQ0KDQo=
