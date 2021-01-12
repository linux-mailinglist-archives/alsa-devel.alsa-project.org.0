Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D372F3331
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 15:49:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6158516EC;
	Tue, 12 Jan 2021 15:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6158516EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610462964;
	bh=RtlkK+X1V1xgGXYjOEE0Ahu0+jwv1b1jrLyhQl3x7QI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HGSdha4zKO/TkmKx4vfyZ1z500hM+2yEEqZFgF1em2XemCKrtOlJoAAAt3aMeUKB7
	 hyyLHV6BAiHqKbnJjNvTO/AQSqxrdQgMWdsLcZaw8tC9775lkRY6AeW/1WiuzP3HZP
	 +pF5jVvV8Uj23rFnJXbyMAmP0DUNuG57adPVEQM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97819F800B9;
	Tue, 12 Jan 2021 15:47:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B34A4F8025E; Tue, 12 Jan 2021 15:47:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13A53F800B9
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 15:47:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13A53F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="EgEcAR0k"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com
 header.b="eh0qjHgD"
Received: from pps.filterd (m0170389.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10CEfhni013108; Tue, 12 Jan 2021 09:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=RtlkK+X1V1xgGXYjOEE0Ahu0+jwv1b1jrLyhQl3x7QI=;
 b=EgEcAR0keGDLMaUuSt/+uEQ5oKPlWK6zefRUydCrrL6doc9YjIr4FxVBVkFaRpRUj3Kg
 vt+UclowU/qDq/MJTcyMBVTeu0DmTeRwm+nb4jRcgCCt2dyfcXJl0BXZgafhB2Zf++Kg
 g51BXsX8M91E8EZnub4v9k0Sl3IltM8kmY6jtcXEHYTQDq7F6BH9s1kweIvqKU22zMuc
 8e9kBd+RFZDBqlecFW8XvjV0hRcNM6oJa7Afb7PQFiG2KUGSbkInHTPYYZdSMgLSKGpk
 SQj0pHN+pLGj+Rqk/ABRDTuJMxCcN8JYAc7Hy1fU8FYJ20OW9ZCa0lvITvCCJJUymrY3 rA== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0a-00154904.pphosted.com with ESMTP id 35y9cpsamv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 09:47:36 -0500
Received: from pps.filterd (m0134318.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10CEio83068110; Tue, 12 Jan 2021 09:47:35 -0500
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by mx0a-00154901.pphosted.com with ESMTP id 3617eunmqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jan 2021 09:47:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4ZP9TKgec+rPpdWPbHpJs3Zfb+Q/rvBf9ylALo8MvETqee+2C38dR9Uiqbs8J101aYv+TWYxkl0X/5jPWCX555mzMOem9qhps4xXSjoBtng27ul1zDaVNBPmzkp66ECCChP465kT+55mLp04bEflRZSFVZrK3GrqldfN2+QypduelkaLRl+73J8VTr3fJHwiw8Yob3QuWls73UG9wazMI65Ux2her/gFhZHdpDn18FybYWKo7FjrZ8/6wfvkcpRWzkJL18XTlFa1oB2nkB707XmMsLOr84pr6HP1VVlYbT49ZOy9k5oPO62vsP8EO7i1n4cK8mqiPI0/65BSq0YiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtlkK+X1V1xgGXYjOEE0Ahu0+jwv1b1jrLyhQl3x7QI=;
 b=OxC9nMiJ9DVCEutrNDKQbjROV7Ebcug3bYBfYDYMzN0WfUiTb+RWAnpDi26+cHj/zD7+z6iSn3NyUSMyKCl0xphNcz8cP583GtkNr5Q2LjarSusyf/l9LpwKJHlDLYWNFVWluMLo3YGtTbdcqCEBU9OLi8CL05UAUK+vdIB27qot8EYljWpZKPk2+KBBzS0eTjBUO8fJnYSykM0PvRVTWK9BPs2xsjv8afMhELjMpFGdKJ+uSElHS4q6wmm2nreAxWWI/sj67GVjOlOx8WAZzJAAYUiEPGxGEyfs+2xpYNwJRFKjJdZgKphISL8DuHGb/A/xN5NMDX5QFQcB0Tc6EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com; 
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtlkK+X1V1xgGXYjOEE0Ahu0+jwv1b1jrLyhQl3x7QI=;
 b=eh0qjHgDFTO/kvPEL9JQaVYycEdurCtC5axU9Xs+Dp3dA9+j+aE+dZWcj00xeOs9vxg7DqX2+0OBfs1yiFDVZVptnV2gsA+CeYb687gSanTdbp7wRPPfHlWFGHDlLw2qWCIOcJC3eFL8pFrZEETH9kCosYpt6LiGVZcIENV9UaM=
Received: from BY3PR19MB4913.namprd19.prod.outlook.com (2603:10b6:a03:367::23)
 by SJ0PR19MB4624.namprd19.prod.outlook.com (2603:10b6:a03:286::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 14:47:32 +0000
Received: from BY3PR19MB4913.namprd19.prod.outlook.com
 ([fe80::7572:e4d1:248f:95e7]) by BY3PR19MB4913.namprd19.prod.outlook.com
 ([fe80::7572:e4d1:248f:95e7%3]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 14:47:32 +0000
From: "Limonciello, Mario" <Mario.Limonciello@dell.com>
To: "Yuan, Perry" <Perry.Yuan@dell.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "oder_chiou@realtek.com"
 <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Subject: RE: [PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control support
Thread-Topic: [PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control support
Thread-Index: AQHW3R7JM+4Y3CMF4UaqpPGWNyPaH6oizuyAgAC+NICAAJu2UA==
Date: Tue, 12 Jan 2021 14:47:32 +0000
Message-ID: <BY3PR19MB49130372226D65A235757BA1FAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
References: <20201228133831.17464-1-Perry_Yuan@Dell.com>
 <a12075b1-09f3-a993-eace-008224ca5f52@linux.intel.com>
 <SJ0PR19MB4528225B226C4F9AA7F7ECBE84AA0@SJ0PR19MB4528.namprd19.prod.outlook.com>
In-Reply-To: <SJ0PR19MB4528225B226C4F9AA7F7ECBE84AA0@SJ0PR19MB4528.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: pierre-louis.bossart@linux.intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Perry_Yuan@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-01-12T05:27:54.6998913Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=1db1f06f-0d4f-4b2c-88ae-b672c477372f;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: Dell.com; dkim=none (message not signed)
 header.d=none;Dell.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 645c9bc9-a308-4d19-db68-08d8b708fe58
x-ms-traffictypediagnostic: SJ0PR19MB4624:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR19MB4624D48A590AEBE1983483DAFAAA0@SJ0PR19MB4624.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q63vK/xPMuM+O36QfN6QNKAYlsYMpcNk5/k0cHdIs6U3JNB3vFwQMUyks4S2e9gSu3vj76QwcttYYAIEnnuoQhN9MyzNha0LkRwZG3avArbuOyJQ8cdYJBsnEh2x+b+tKX+c2Js5ItXd9l8a3mvD+aOs8F8Gd7i3fOPRL5QWvCG4BOFWuDq2Flr7UXGiNVZIYKc+7PMtUr0pPmrYUtibTvQMTqoggascT8vMaUcCBaZgXxbPIUsb3S3yAWf865tuIYlFyfXt2gvoqzBo7jQYf6eo9UqQcy17pr22TGW5JZl/3E7n43tHLvanSgc93Ch/CeXUDl0+ZqUjrZUAIv6ik2U/Mit7FN0bH9fkW9MS8RTsr0QwSm6c8Y1An0sa1Qd3Xn3UOWFYV0dN3mtT1sscuw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY3PR19MB4913.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(83380400001)(66946007)(86362001)(55016002)(186003)(8936002)(26005)(53546011)(2906002)(9686003)(71200400001)(8676002)(64756008)(4326008)(33656002)(66476007)(786003)(52536014)(54906003)(316002)(7696005)(66556008)(6506007)(5660300002)(76116006)(110136005)(66446008)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MElrTUFZaFM1M0NRcXpZbkdLd1RRbEZ3WVphWEhZazIzbzlxcE9HdXFkQ0lG?=
 =?utf-8?B?UFFyWFl6eTR2ZnBxVU1WUjI3cGltNlduazNMMDdRZG5HaUQ3Y3pONXJTSDlD?=
 =?utf-8?B?Q01WRG9yMUh1SVBZZWxtZkhXOEVxdjhONURrNVBhN21GTU9EVVR6bDh3MFBu?=
 =?utf-8?B?QXlnZ2luSWRGZW5rU3NURENMS2I2bTB4dVEwWEYwOWswWTNzckhSTys4K1BM?=
 =?utf-8?B?bGw0YWtuTml3YnV3TE1LakxKMUJVMmFaYTFLMVRRNFR0VkxVdnVBcjlPcjFY?=
 =?utf-8?B?QS9acitjV3FET0dINm90enpuT1hOc1BpS055Q0xoNVFoSVhKcWJtZ2c2Q0Q1?=
 =?utf-8?B?NU1uN1lxS1hMWWdMRSt5WkUwVTZrNFJab0xaQUZNU0wvMmIrSGlHZGdQcTNk?=
 =?utf-8?B?dmxyMVQ5RXd6RXlVVVRJUlhEQXNFeWJBcmxFZ2RaVmJZZGhaWWZYZGZiUkxI?=
 =?utf-8?B?ZkNzalE0alFTcWdOb1Z2OUxoTjZhcUFnU1JlWWpwMERSWnVrYjdzMjdnN2h4?=
 =?utf-8?B?d21TNmdxSmpGQ2F5TjBqdnY4KzFDdjBIb1dDdHY0MG5RdE9TOElRR0U1ZmpD?=
 =?utf-8?B?WEkrZUs5WDBrZVRJanBNOXdSd3pYdmdDaDlTTHJveEFERXJteFlLSjl3NExk?=
 =?utf-8?B?aHNwbWdKVnN3VCs3UHJHWlA2bG4zWUl5NXRRV0hITnFSbGRPL0JFUjhtSmFu?=
 =?utf-8?B?L29tRVdZQ3NFZkVhRmwvTGQrdlhzejVseloyZmM4dDFBOEhTMUoraXJkVi9D?=
 =?utf-8?B?VEZXRjdmNFB2VmNhN2hCbWw4OUVSeUxrN3hOenhoWEFoaFZvNlBOSko0dXEx?=
 =?utf-8?B?TzFEN0RySndHVG5XL2kyYmxxUUp2aXdZbWEzeGkxY1FEY0dkS3pjNVpHVVp1?=
 =?utf-8?B?R2tqb3pYb2kzdW1MaVpoVW5vdDVQWXVLVE5TeENsUHFRVnYvYjBSQWhiTnpm?=
 =?utf-8?B?MFQ4bUVqbEUzV3JGTnlwaGswNS9ST0FMTjN1QjFaSVRJOVBZTHlUalNrRGNW?=
 =?utf-8?B?ZGh3UktoUytRR0FrWVc0WTZRUkt2c0V5UGNnM0h3SFNUY0Q2NG8yemxJSDBD?=
 =?utf-8?B?R0tXKzhTblNqR1NuTFNMaUg3Ukw2ZDUyelZLbzFsZVQwZysrdm1sT0lmSklN?=
 =?utf-8?B?V2JkdGhmRmpBMm14TUpEeGNFZ3BhZHJMVHdMemgwKzVLMjdSVENuUUo3T0hi?=
 =?utf-8?B?ZmpBSTFHVEJOK1NKaEpNWmpMQXp6QVZlYmk3cG0vRVRwc1ZmM2wraVBGc1Zx?=
 =?utf-8?B?dUkvdjBpQjJyT2V3L09SVFZtaWJIZEI4Q3Z5blUxMyszaHpyd0VtWHVtTnlw?=
 =?utf-8?Q?jOzWY4MSd6TaQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR19MB4913.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 645c9bc9-a308-4d19-db68-08d8b708fe58
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 14:47:32.6588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lIK202uoJeLur63Imzq0sgwCkfNRa7RPrX9JaOoqJ2JTILT88Wm2qAA+eKL6bez2AHFQGwmRDpuZDeIfesuuD+dOxiu+LvFOgRf8K7KlNY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4624
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-12_10:2021-01-12,
 2021-01-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101120085
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101120085
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

PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gPiBTZW50OiAy
MDIx5bm0MeaciDEy5pelIDI6MDcNCj4gPiBUbzogWXVhbiwgUGVycnk7IG9kZXJfY2hpb3VAcmVh
bHRlay5jb207IHBlcmV4QHBlcmV4LmN6OyB0aXdhaUBzdXNlLmNvbQ0KPiA+IENjOiBhbHNhLWRl
dmVsQGFsc2EtcHJvamVjdC5vcmc7IExpbW9uY2llbGxvLCBNYXJpbzsgbGdpcmR3b29kQGdtYWls
LmNvbTsNCj4gPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBicm9vbmllQGtlcm5lbC5v
cmcNCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gQVNvQzogcnQ3MTU6YWRkIE1pYyBN
dXRlIExFRCBjb250cm9sIHN1cHBvcnQNCj4gPg0KPiA+DQo+ID4gW0VYVEVSTkFMIEVNQUlMXQ0K
PiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4gPiBAQCAtMjY4LDYgKzI2OSw3IEBAIHN0YXRpYyBpbnQg
cnQ3MTVfc2RjYV9wdXRfdm9sc3coc3RydWN0IHNuZF9rY29udHJvbA0KPiA+ICprY29udHJvbCwN
Cj4gPiA+ICAgCXVuc2lnbmVkIGludCByZWcyID0gbWMtPnJyZWc7DQo+ID4gPiAgIAl1bnNpZ25l
ZCBpbnQgcmVnID0gbWMtPnJlZzsNCj4gPiA+ICAgCXVuc2lnbmVkIGludCBtYXggPSBtYy0+bWF4
Ow0KPiA+ID4gKwl1bnNpZ25lZCBpbnQgdmFsMCwgdmFsMTsNCj4gPiA+ICAgCWludCBlcnI7DQo+
ID4gPg0KPiA+ID4gICAJdmFsID0gdWNvbnRyb2wtPnZhbHVlLmludGVnZXIudmFsdWVbMF07IEBA
IC0yODYsNyArMjg4LDIyIEBAIHN0YXRpYw0KPiA+ID4gaW50IHJ0NzE1X3NkY2FfcHV0X3ZvbHN3
KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLA0KPiA+ID4gICAJCWlmIChlcnIgPCAwKQ0K
PiA+ID4gICAJCQlyZXR1cm4gZXJyOw0KPiA+ID4gICAJfQ0KPiA+ID4gLQ0KPiA+ID4gKyNpZiBJ
U19FTkFCTEVEKENPTkZJR19ERUxMX1BSSVZBQ1kpDQo+ID4gPiArCS8qIFByaXZhY3kgTEVEIFRy
aWdnZXIgU3RhdGUgQ2hhbmdlZCBieSBtdXRlZC91bm11dGUgc3dpdGNoICovDQo+ID4gPiArCWlm
IChtYy0+aW52ZXJ0KSB7DQo+ID4gPiArCQl2YWwwID0gdWNvbnRyb2wtPnZhbHVlLmludGVnZXIu
dmFsdWVbMF07DQo+ID4gPiArCQl2YWwxID0gdWNvbnRyb2wtPnZhbHVlLmludGVnZXIudmFsdWVb
MV07DQo+ID4gPiArCQlpZiAodmFsMCA9PSAxICYmIHZhbDEgPT0gMSkgew0KPiA+ID4gKwkJCXJ0
NzE1LT5taWNtdXRlX2xlZCA9IExFRF9PRkY7DQo+ID4gPiArCQkJbGVkdHJpZ19hdWRpb19zZXQo
TEVEX0FVRElPX01JQ01VVEUsDQo+ID4gPiArCQkJCQlydDcxNS0+bWljbXV0ZV9sZWQgPyBMRURf
T04gOg0KPiA+IExFRF9PRkYpOw0KPiA+ID4gKwkJfSBlbHNlIGlmICh2YWwwID09IDAgJiYgdmFs
MSA9PSAwKSB7DQo+ID4gPiArCQkJcnQ3MTUtPm1pY211dGVfbGVkID0gTEVEX09OOw0KPiA+ID4g
KwkJCWxlZHRyaWdfYXVkaW9fc2V0KExFRF9BVURJT19NSUNNVVRFLA0KPiA+ID4gKwkJCQkJcnQ3
MTUtPm1pY211dGVfbGVkID8gTEVEX09OIDoNCj4gPiBMRURfT0ZGKTsNCj4gPiA+ICsJCX0NCj4g
PiA+ICsJfQ0KPiA+ID4gKyNlbmRpZg0KPiA+DQo+ID4gU2hvdWxkIHRoaXMgYmUgYWN0aXZhdGVk
IGZvciBzcGVjaWZpYyBETUkgcXVpcmtzPyBUaGlzIGRyaXZlciBpcyB1c2VkIGluDQo+IG5vbi1E
ZWxsDQo+ID4gcGxhdGZvcm1zIChJIGFtIHRoaW5raW5nIG9mIEludGVsIFJWUHMgb3IgUmVhbHRl
ayBkYXVnaHRlcmJvYXJkcyksIEkgYW0gbm90DQo+ID4gc3VyZSBpZiBhIGJ1aWxkLXRpbWUgYmVo
YXZpb3IgY2hhbmdlIG1ha2VzIHNlbnNlLg0KPiA+DQo+ID4gT3IgY29udmVyc2VseSBjb3VsZCB3
ZSBqdXN0IHNldCB0aGUgTEVEcyB1bmNvbmRpdGlvbmFsbHkgaWYgZG9pbmcgc28gaXMNCj4gPiBo
YXJtbGVzcz8NCj4gDQo+IFRoZSBjdXJyZW50IG1pYyBtdXRlIGxlZCBzZXR0aW5nIHBhdGggaXMg
bm90IGNvbW1vbiB1c2VkIGZvciBvdGhlciB2ZW5kb3JzLA0KPiBqdXN0IERlbGwgcGxhdGZvcm0N
Cj4gc3VwcG9ydCB0aGlzIG1pYyBtdXRlIGxlZCBzZXQgb3BlcmF0aW9uLg0KPiANCj4gRG8geW91
IHRoaW5rIHRoYXQgSSBuZWVkIHRvIGFkZCBvbmUgRE1JIHF1aXJrIGluIHRoZSBuZXh0IHZlcnNp
b24gPw0KPiBJZiBzbywgSSBjYW4gYWRkIHRoYXQuDQo+IA0KPiANCg0KDQpJbiB0aGUgSERBIGF1
ZGlvIGNhc2UgdGhpcyBpcyBtb2RlbGVkIG9mZiBvZiwgdGhlIGNvZGUgcnVucyB3aGV0aGVyIG9y
IG5vdCBhDQp2ZW5kb3IgaGFzIHN1cHBvcnQgZm9yIGEgbWljIG11dGUgTEVELiAgVGhlIGNhbGxz
IHRvIGxlZHRyaWdfYXVkaW9fc2V0IHNob3VsZA0KYmUgYSBuby1vcC4gIEkgYWdyZWUgd2l0aCBA
UGllcnJlLUxvdWlzIEJvc3NhcnQgaW4gdGhpcyBjYXNlLCB3ZSBzaG91bGQganVzdA0KYmUgcnVu
bmluZyBpdCB3aGV0aGVyIG9yIG5vdCBkZWxsLXByaXZhY3kgaXMgY29tcGlsZWQgaW4uICBJZiBh
bm90aGVyIHZlbmRvcg0KY2hvb3NlcyB0byBhZGQgTEVEIHN1cHBvcnQgdGhleSdsbCBqdXN0IG5l
ZWQgdG8gc2V0IHVwIHRoZWlyIGxlZHRyaWcgc3VwcG9ydGVkDQpiYWNrZW5kIGFuZCBub3QgY2hh
bmdlIGNvZGVjIGNvZGUuDQo=
