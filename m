Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7A64963F4
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 18:29:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DF752B52;
	Fri, 21 Jan 2022 18:28:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DF752B52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642786146;
	bh=aOkLLP9O1sJu2pWGhWDNKKTgF7+RvlcT0N1S22zw1C4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i0Jw3zKLDl59TOMfXg4UaLKiQwDf2mKg1ZAa0NgkqvxadmInoAFzKIJavM5Suw5tZ
	 NGl2oOlBbI2HvPnPEJG4D3pOiu8/YssEwjgRMveWT8v7M21rbbDEUWtdkpnXZ2DZfy
	 PPbQ45K6fCtBUek092DsbmQ5B/AO78i907NPJB7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EAAEF800F8;
	Fri, 21 Jan 2022 18:27:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C30FF80430; Fri, 21 Jan 2022 18:27:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A59EF80125
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 18:27:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A59EF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="pqwvoOCg"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20LD0UOG024225;
 Fri, 21 Jan 2022 12:27:02 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2055.outbound.protection.outlook.com [104.47.61.55])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dqj6j8aqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 12:27:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJv/2/ui9nKUO/C02QL7MmkmkLu2PIUZcPwvzUTyqmNB6fYMYSgq9UXfzfEaBmX10Ysiv05lazFu9UVSF/2E178DEOIze8RZg64545tHpZJH+KHDS2jKSVMwrQRkB81FK2wZBEdBvw5LxKyyqjcgUTK+UMhYSM74HQ4lxFMtYeKAVZejui3hgs4xS7vwePiQ6OIWMy7y56XndzF4Pe+ZPRC7RpICuWeITyk+Z2i/48NyUWxPbKGeH29HOcOpkm7rVt1w8ZoeztOfno4k9GxPv/vwqjjkICMTu4ugEz+KGdkGyBiB4GPaDPjBL3wFre1mBmEYMkbq/0DJDF9KxiuWCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOkLLP9O1sJu2pWGhWDNKKTgF7+RvlcT0N1S22zw1C4=;
 b=Fk4yeq3dLoOj3vJR0vzvEU7yQzj4MS8KwEGGYSB8eeLh2wUzh51sHn7txoTsoGrwXM4phWx7GTgX+uSRGtCQDnbxUtJUE8e/Da4a9ifxv//7/U6on0kPvbPHAp79bmXDkQ2GdRmR8opve96gc4S8UO6amIm+Mm1CvI40wkDqF67GAr0Xj5MKzRHX4ihUIEQ7gGNX2ZwPWMJzHsLOag+A9u+2h8e1VZ1jXbg4922vHElFVq2Fzdo8L6IDBsdESLvTZScKgbTkiPGTu3ILB83sEPQSwoTiJtmuNEihpYFQkiE5BT1E/9hpsDf5H1m2YNDvJpb6Wu0yA3RHT0S/CWsVbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOkLLP9O1sJu2pWGhWDNKKTgF7+RvlcT0N1S22zw1C4=;
 b=pqwvoOCguqj5bHr/tmWjyVgjPVNTXzJRmqBWyU7VYVWI12etAENaGYOa6Q9e6z4FqczeKWoFX5R6kMDL/iWenMG/tnmiqjb6aGpE7J8hPVacpysFofbc+KgEnSlQhwdhWHgYEhbCPCdgPWSeH8Ut9WlKi1GH32WtHjpsTumtS+A=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by QB1PR01MB3378.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:3d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 17:27:00 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Fri, 21 Jan 2022
 17:26:59 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "amadeuszx.slawinski@linux.intel.com"
 <amadeuszx.slawinski@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v3 2/6] ASoC: xilinx: xlnx_i2s: create drvdata structure
Thread-Topic: [PATCH v3 2/6] ASoC: xilinx: xlnx_i2s: create drvdata structure
Thread-Index: AQHYDjgnTYC7rljFmkS9WajwI1pSAqxtL+MAgACL3YA=
Date: Fri, 21 Jan 2022 17:26:59 +0000
Message-ID: <c4c59c75e30238a7582584e187b8852808a1bfc3.camel@calian.com>
References: <20220120195832.1742271-1-robert.hancock@calian.com>
 <20220120195832.1742271-3-robert.hancock@calian.com>
 <aa839d9e-76b8-1ee2-048b-1982ff9bdb31@linux.intel.com>
In-Reply-To: <aa839d9e-76b8-1ee2-048b-1982ff9bdb31@linux.intel.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f13c4364-b802-4e1f-02c0-08d9dd033b54
x-ms-traffictypediagnostic: QB1PR01MB3378:EE_
x-microsoft-antispam-prvs: <QB1PR01MB33785AD9FA38C8A7F402C479EC5B9@QB1PR01MB3378.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:605;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PFwnzhPH0Wql2E96lZihgASY2tDQCfO64X8HEnF5Xni7SU0imnKqKneE9/JvYrO3dP2Ar5Urtkr+r+XWwzbe8B1DglZUMJb6KkbhYKipK0pwHNvaAc60oUurtAHPBVO58owbZicZs2mlnN53yDCLYvkK46qEoHx8KqcWoSG2s+b69lVIP4EY0JMl/b7exxQ1ArxsXktcLjhf5mFUVbPRbu8F76qC2vbcqXVygr60ga3CITOT2OVqmfT7ykszd9/9eLZxVwbVnvE3j/f2VkfwWwr6l5hkCY83WeUEeBXn7wYTyNw6zqiRGk4uvfjF5EkDgvW7SxzKWQOPFzla9QoU498ADyv4GZOXID2HhYahJO/pFl9jSBsMgFUhkjGsFzsRv3UhUNbBLbk4Xxwp5TmCPBUaKxXwauUS6/Anj6xFHtWdWQtSfO6Fm9JrhINMlvYll8BRDiAYQe5IIbdzd2HiqtWg3B0j94pGINmfszBCuTt9FYwkwh/FdXPQ4N8C1tgZR4ntxha4S0Q4YRwdU/S6IxaMuVOSCPJwNQSKjXNhl0w9vGH5SMKUMyD6Wo66HDaFXKJBe6KTjiiPFKJL+JN4BL+OvnUKG6SPFVo9rxfho1C8/TSZJMz+c2hzMUIauCjzrSwzpl0O5KSbpZ2DbXdForsMPZN+0UcEe4MiUluWQdV8onIOAdIMWSSJ3aiGZtZalxwD9/ttUkpwkStTfAp0Vc4kvEsuxagmywQ8VIeMaZLoiVg/XWzhXQMs4XEd1RGUAZUuGuHlsRJmH9EeZaCZulkFqEETebCFZjDFjv5RCDYBhosw9xVgZ3H6x4w1aOvajbzrRq1CKEHLqcL8BneC+BOKn9EasEJx6obWs/a0C/4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(966005)(122000001)(2906002)(5660300002)(508600001)(44832011)(38100700002)(66574015)(83380400001)(6506007)(71200400001)(53546011)(7416002)(2616005)(38070700005)(8936002)(15974865002)(6512007)(8676002)(66946007)(54906003)(36756003)(76116006)(4326008)(91956017)(6486002)(186003)(26005)(86362001)(110136005)(66476007)(66556008)(64756008)(66446008)(316002)(99106002)(18886075002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anpPQVIwcThPSm8yaXh2TEFMUE4zN0Q2YXhIK0xKSk0yMC9pY3o4QVFPYS9w?=
 =?utf-8?B?cTdLYmo0eVdWWk50ZjdBUEdaTERzR2NNcUxoZzdlTFVKQTlvamZzd0hyMWZw?=
 =?utf-8?B?QXV6WFlFN1Z5MXNPZjMvZktCMFdVR3ptUzh0UVljeUlJb1BMcFRELy9HNWFI?=
 =?utf-8?B?NTFPa010U0NmN1lRVUFBeEVCdE9qQ1A1WkMxOHF1M3VXMjZFNnQvYjlCV2JN?=
 =?utf-8?B?UHVuTC93TmFWZ3hYZmFRWmhGNEdpY2NqMjB4NE82dm1TRDRNM3hwUWVCTGEz?=
 =?utf-8?B?eTI1QXlZcVFQWlhLVFY1Wlg2bWJ3T0NOUktHZnVpSG9vVTZPeFZHNXViaEdZ?=
 =?utf-8?B?RGE2UFB4QjhxVHpHWWJVUnRtY1VCcmgrY2VjdVNsbjFVZ1Jya0xDUW9tY1pX?=
 =?utf-8?B?cVVVTlE1dGpBTEI0Yk9sQjNsN1FmVVUrbzQzT1VydXNmUDIvMVlZQ2x3NklX?=
 =?utf-8?B?TG91eDlONnNZTzREMHJoOTdDNEFCMC9HdzcrUmRCYVVWa0prRldhWHhpU3FV?=
 =?utf-8?B?ZERScnVkRndoNkZPUVU0RXh3eVBROEkxbjBPdFNHR01UOEJhVXFINzFIN09N?=
 =?utf-8?B?V1hxS1dlS3htRmtlc2ZJbmRlN1JzUExST2pUenBYNWNnZHJzMUtwVmp0UWFo?=
 =?utf-8?B?aWFSWjJ4eDZsOWdoT0laT3lBazBsc0lKQk5zTUxpTFN4bFRTRWJvd1NVVDBM?=
 =?utf-8?B?WFF5clBGd1ZNSzd0NjEydFlLc3NVUHZ4NU9leUlNQ0FJeHcyM2Y4QWJkbTJw?=
 =?utf-8?B?QS9Xa2xTSWVIWEpXSUJ3aDl6WWFIYVlCSkljbUhTN3hLQ2JCVm52VFJabG5Q?=
 =?utf-8?B?cjZFYWJTbDZ4empkeDdpc1dWMVhqWWU1c1VQMkRNTmFIS3RmV0wvQUxhelRU?=
 =?utf-8?B?ait3V1dlbVl2WCtCZW1rUnRPc25CdDNnZGpZelN3QUtQWWk1MWJONFg2RVFK?=
 =?utf-8?B?QmNzRCsvQURFUVJVL2lSRlZtVmdiamw5anNNQnVya2pKNy9WN3p6RnJzWkVo?=
 =?utf-8?B?VW12NHZyZ2Q5SHFpYVV6VXI5ZlF5UUF2NllCL0l2V0t3Tmd1dDQxdy9UU05S?=
 =?utf-8?B?UC80NUovNHJGWTlWZTZSMWs2TitKdkdBNnE5SHRIaGhxQm0xMUFMQ1ZFQWox?=
 =?utf-8?B?QjB5OWR2dkR0OXl5Rk9BYTU0QlZ0Z2gzMWNsWEZyemV1MnBzbWMzN0FQK2Za?=
 =?utf-8?B?WkxjazZQWlhhSzhBeFlxYlhmbjFFMGhoSm5Mcy9aTGRNVVlYQ1czdUFKZGs0?=
 =?utf-8?B?MjlYL2FpekdZSzAzbGxsVSs1RitMYVUyVzQ5dC9iaVhUWmpjVXlJc01YR1VL?=
 =?utf-8?B?YldzZmwvTlNBY0U1WjR1UEgxVlZzVDBNeElPRXF0cVhIUGNpQWVSNDFDSUFQ?=
 =?utf-8?B?Y1ZVVHVyTDVReVhFbk1WTFM2Uk8xOGxNdTZlbUtvN0dWQ2l0VHNCckluVldY?=
 =?utf-8?B?U2k5SVFINTVCbzMzWWN6YnUvWHNkMkRuc1VHQ2VCVE5zUE1UYjluTHRrRGht?=
 =?utf-8?B?M1ZrYjZqMS9pdzdZUWN3VXBkNTkxb3BramI3RnVPeWNvSzJUdVpZaGVVR29o?=
 =?utf-8?B?bFlkL3RidFVrZUpGd2ZCc2pzMklGb2did3BSV2cxMjlTMUFFeDFTa1g1Yzdp?=
 =?utf-8?B?eDRLVk0xMncrL0V3a2hhRk15N2FldWVzdzRhRCtzV1Badm95a1ZKOHVLZlVS?=
 =?utf-8?B?K25zRm9Sd1NXa2EzNjhhVGQ3K3ZKdHNXZ3A5T1pWY2VOS29NM2N3RjBtK0hR?=
 =?utf-8?B?SnFKRitKS3lNMGs2c0ZZQVZ4Mm1IdGNFS1lBcEZ5L3BJaWtRbmVzeit0NGFX?=
 =?utf-8?B?azl1VUZxa1NJSjlaT08xbFRndDJhUC92dVROaHp1VE43anpBS1NFZDN4V0RP?=
 =?utf-8?B?aXZ3TUlqaDY5VXV3SXR2b2JBRTFYSGRtR25NT0x5MnJwUkhtanB3L0llVjNu?=
 =?utf-8?B?MS9Pb0VQb0w5Tm03NlFvM2F5UjFUL1RSSFJnT3RyU3lVWnFnZ1N0MFFDUElW?=
 =?utf-8?B?Rll2Um9tUkZGUFNZcHhGWDcyRWc0c2JKeStZd1JVZGNTNHk5QUxVaU9pb2xs?=
 =?utf-8?B?UXMwSnFHZU9LSUdDbmllZ2VsUjNtOHY0b1Y3OVR2K1ZINVJVcFBNQXk2dHdx?=
 =?utf-8?B?VCszUCtqY2xWL2loSTRjd21seG54T1dKVzNNejV2clBPMzRqY0tBVHdvbXVn?=
 =?utf-8?B?VVlLcERCYk8rdlIwMUJXV1YxbFlCMTdocmNSa1lteDJ6WkVwYS9leFlmdGl3?=
 =?utf-8?Q?VZotYkx0qhPykoJzgyMh7AQxqTBXojuL9HrWW8yj3c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA298CD3754B2145B54C280E48F9374E@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f13c4364-b802-4e1f-02c0-08d9dd033b54
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 17:26:59.8700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xzu/RXUSZA7oJcHVlV7/3KGc5BIpN9tiqTxGaq/8mmk4B6KRTyrWh7IuRBpXwHPcQvU7TD6z620iI8QWPnCnEhkD2y2jeXD+ZW2oFQTd4qI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: QB1PR01MB3378
X-Proofpoint-GUID: TeYGt0_Yik0_ICLPLUCTpBuofI9ChOeb
X-Proofpoint-ORIG-GUID: TeYGt0_Yik0_ICLPLUCTpBuofI9ChOeb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_09,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1011 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201210113
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "maruthi.srinivas.bayyavarapu@xilinx.com"
 <maruthi.srinivas.bayyavarapu@xilinx.com>
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

T24gRnJpLCAyMDIyLTAxLTIxIGF0IDEwOjA2ICswMTAwLCBBbWFkZXVzeiBTxYJhd2nFhHNraSB3
cm90ZToNCj4gT24gMS8yMC8yMDIyIDg6NTggUE0sIFJvYmVydCBIYW5jb2NrIHdyb3RlOg0KPiA+
IEFuIHVwY29taW5nIGNoYW5nZSB3aWxsIHJlcXVpcmUgc3RvcmluZyBhZGRpdGlvbmFsIGRyaXZl
ciBkYXRhIG90aGVyDQo+ID4gdGhhbiB0aGUgbWVtb3J5IGJhc2UgYWRkcmVzcy4gQ3JlYXRlIGEg
ZHJ2ZGF0YSBzdHJ1Y3R1cmUgYW5kIHVzZSB0aGF0DQo+ID4gcmF0aGVyIHRoYW4gc3RvcmluZyB0
aGUgcmF3IGJhc2UgYWRkcmVzcyBwb2ludGVyLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFJv
YmVydCBIYW5jb2NrIDxyb2JlcnQuaGFuY29ja0BjYWxpYW4uY29tPg0KPiA+IC0tLQ0KPiA+ICAg
c291bmQvc29jL3hpbGlueC94bG54X2kycy5jIHwgNjYgKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDMx
IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MveGlsaW54L3hs
bnhfaTJzLmMgYi9zb3VuZC9zb2MveGlsaW54L3hsbnhfaTJzLmMNCj4gPiBpbmRleCBjYzY0MWU1
ODJjODIuLjNiYWZhMzRiNzg5YSAxMDA2NDQNCj4gPiAtLS0gYS9zb3VuZC9zb2MveGlsaW54L3hs
bnhfaTJzLmMNCj4gPiArKysgYi9zb3VuZC9zb2MveGlsaW54L3hsbnhfaTJzLmMNCj4gPiBAQCAt
MjIsMTUgKzIyLDIwIEBADQo+ID4gICAjZGVmaW5lIEkyU19DSDBfT0ZGU0VUCQkJMHgzMA0KPiA+
ICAgI2RlZmluZSBJMlNfSTJTVElNX1ZBTElEX01BU0sJCUdFTk1BU0soNywgMCkNCj4gPiAgIA0K
PiA+ICtzdHJ1Y3QgeGxueF9pMnNfZHJ2X2RhdGEgew0KPiA+ICsJc3RydWN0IHNuZF9zb2NfZGFp
X2RyaXZlciBkYWlfZHJ2Ow0KPiA+ICsJdm9pZCBfX2lvbWVtICpiYXNlOw0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiAgIHN0YXRpYyBpbnQgeGxueF9pMnNfc2V0X3NjbGtvdXRfZGl2KHN0cnVjdCBzbmRf
c29jX2RhaSAqY3B1X2RhaSwNCj4gPiAgIAkJCQkgICAgaW50IGRpdl9pZCwgaW50IGRpdikNCj4g
PiAgIHsNCj4gPiAtCXZvaWQgX19pb21lbSAqYmFzZSA9IHNuZF9zb2NfZGFpX2dldF9kcnZkYXRh
KGNwdV9kYWkpOw0KPiA+ICsJc3RydWN0IHhsbnhfaTJzX2Rydl9kYXRhICpkcnZfZGF0YSA9IHNu
ZF9zb2NfZGFpX2dldF9kcnZkYXRhKGNwdV9kYWkpOw0KPiA+ICAgDQo+ID4gICAJaWYgKCFkaXYg
fHwgKGRpdiAmIH5JMlNfSTJTVElNX1ZBTElEX01BU0spKQ0KPiA+ICAgCQlyZXR1cm4gLUVJTlZB
TDsNCj4gPiAgIA0KPiA+IC0Jd3JpdGVsKGRpdiwgYmFzZSArIEkyU19JMlNUSU1fT0ZGU0VUKTsN
Cj4gPiArCXdyaXRlbChkaXYsIGRydl9kYXRhLT5iYXNlICsgSTJTX0kyU1RJTV9PRkZTRVQpOw0K
PiA+ICAgDQo+ID4gICAJcmV0dXJuIDA7DQo+ID4gICB9DQo+ID4gQEAgLTQwLDEzICs0NSwxMyBA
QCBzdGF0aWMgaW50IHhsbnhfaTJzX2h3X3BhcmFtcyhzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0N
Cj4gPiAqc3Vic3RyZWFtLA0KPiA+ICAgCQkJICAgICAgc3RydWN0IHNuZF9zb2NfZGFpICppMnNf
ZGFpKQ0KPiA+ICAgew0KPiA+ICAgCXUzMiByZWdfb2ZmLCBjaGFuX2lkOw0KPiA+IC0Jdm9pZCBf
X2lvbWVtICpiYXNlID0gc25kX3NvY19kYWlfZ2V0X2RydmRhdGEoaTJzX2RhaSk7DQo+ID4gKwlz
dHJ1Y3QgeGxueF9pMnNfZHJ2X2RhdGEgKmRydl9kYXRhID0gc25kX3NvY19kYWlfZ2V0X2RydmRh
dGEoaTJzX2RhaSk7DQo+ID4gICANCj4gPiAgIAljaGFuX2lkID0gcGFyYW1zX2NoYW5uZWxzKHBh
cmFtcykgLyAyOw0KPiA+ICAgDQo+ID4gICAJd2hpbGUgKGNoYW5faWQgPiAwKSB7DQo+ID4gICAJ
CXJlZ19vZmYgPSBJMlNfQ0gwX09GRlNFVCArICgoY2hhbl9pZCAtIDEpICogNCk7DQo+ID4gLQkJ
d3JpdGVsKGNoYW5faWQsIGJhc2UgKyByZWdfb2ZmKTsNCj4gPiArCQl3cml0ZWwoY2hhbl9pZCwg
ZHJ2X2RhdGEtPmJhc2UgKyByZWdfb2ZmKTsNCj4gPiAgIAkJY2hhbl9pZC0tOw0KPiA+ICAgCX0N
Cj4gPiAgIA0KPiA+IEBAIC01NiwxOCArNjEsMTggQEAgc3RhdGljIGludCB4bG54X2kyc19od19w
YXJhbXMoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtDQo+ID4gKnN1YnN0cmVhbSwNCj4gPiAgIHN0
YXRpYyBpbnQgeGxueF9pMnNfdHJpZ2dlcihzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0
cmVhbSwgaW50IGNtZCwNCj4gPiAgIAkJCSAgICBzdHJ1Y3Qgc25kX3NvY19kYWkgKmkyc19kYWkp
DQo+ID4gICB7DQo+ID4gLQl2b2lkIF9faW9tZW0gKmJhc2UgPSBzbmRfc29jX2RhaV9nZXRfZHJ2
ZGF0YShpMnNfZGFpKTsNCj4gPiArCXN0cnVjdCB4bG54X2kyc19kcnZfZGF0YSAqZHJ2X2RhdGEg
PSBzbmRfc29jX2RhaV9nZXRfZHJ2ZGF0YShpMnNfZGFpKTsNCj4gPiAgIA0KPiA+ICAgCXN3aXRj
aCAoY21kKSB7DQo+ID4gICAJY2FzZSBTTkRSVl9QQ01fVFJJR0dFUl9TVEFSVDoNCj4gPiAgIAlj
YXNlIFNORFJWX1BDTV9UUklHR0VSX1JFU1VNRToNCj4gPiAgIAljYXNlIFNORFJWX1BDTV9UUklH
R0VSX1BBVVNFX1JFTEVBU0U6DQo+ID4gLQkJd3JpdGVsKDEsIGJhc2UgKyBJMlNfQ09SRV9DVFJM
X09GRlNFVCk7DQo+ID4gKwkJd3JpdGVsKDEsIGRydl9kYXRhLT5iYXNlICsgSTJTX0NPUkVfQ1RS
TF9PRkZTRVQpOw0KPiA+ICAgCQlicmVhazsNCj4gPiAgIAljYXNlIFNORFJWX1BDTV9UUklHR0VS
X1NUT1A6DQo+ID4gICAJY2FzZSBTTkRSVl9QQ01fVFJJR0dFUl9TVVNQRU5EOg0KPiA+ICAgCWNh
c2UgU05EUlZfUENNX1RSSUdHRVJfUEFVU0VfUFVTSDoNCj4gPiAtCQl3cml0ZWwoMCwgYmFzZSAr
IEkyU19DT1JFX0NUUkxfT0ZGU0VUKTsNCj4gPiArCQl3cml0ZWwoMCwgZHJ2X2RhdGEtPmJhc2Ug
KyBJMlNfQ09SRV9DVFJMX09GRlNFVCk7DQo+ID4gICAJCWJyZWFrOw0KPiA+ICAgCWRlZmF1bHQ6
DQo+ID4gICAJCXJldHVybiAtRUlOVkFMOw0KPiA+IEBAIC05NSwyMCArMTAwLDE5IEBAIE1PRFVM
RV9ERVZJQ0VfVEFCTEUob2YsIHhsbnhfaTJzX29mX21hdGNoKTsNCj4gPiAgIA0KPiA+ICAgc3Rh
dGljIGludCB4bG54X2kyc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+
ICAgew0KPiA+IC0Jdm9pZCBfX2lvbWVtICpiYXNlOw0KPiA+IC0Jc3RydWN0IHNuZF9zb2NfZGFp
X2RyaXZlciAqZGFpX2RydjsNCj4gPiArCXN0cnVjdCB4bG54X2kyc19kcnZfZGF0YSAqZHJ2X2Rh
dGE7DQo+ID4gICAJaW50IHJldDsNCj4gPiAgIAl1MzIgY2gsIGZvcm1hdCwgZGF0YV93aWR0aDsN
Cj4gPiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICAgCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSA9IGRldi0+b2Zfbm9kZTsNCj4gPiAgIA0KPiA+IC0JZGFpX2RydiA9
IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmRhaV9kcnYpLCBHRlBfS0VSTkVMKTsN
Cj4gPiAtCWlmICghZGFpX2RydikNCj4gPiArCWRydl9kYXRhID0gZGV2bV9remFsbG9jKCZwZGV2
LT5kZXYsIHNpemVvZigqZHJ2X2RhdGEpLCBHRlBfS0VSTkVMKTsNCj4gPiArCWlmICghZHJ2X2Rh
dGEpDQo+ID4gICAJCXJldHVybiAtRU5PTUVNOw0KPiA+ICAgDQo+ID4gLQliYXNlID0gZGV2bV9w
bGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiA+IC0JaWYgKElTX0VSUihiYXNl
KSkNCj4gPiAtCQlyZXR1cm4gUFRSX0VSUihiYXNlKTsNCj4gPiArCWRydl9kYXRhLT5iYXNlID0g
ZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiA+ICsJaWYgKElTX0VS
UihkcnZfZGF0YS0+YmFzZSkpDQo+ID4gKwkJcmV0dXJuIFBUUl9FUlIoZHJ2X2RhdGEtPmJhc2Up
Ow0KPiA+ICAgDQo+ID4gICAJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgInhsbngs
bnVtLWNoYW5uZWxzIiwgJmNoKTsNCj4gPiAgIAlpZiAocmV0IDwgMCkgew0KPiA+IEBAIC0xMzQs
MzUgKzEzOCwzNSBAQCBzdGF0aWMgaW50IHhsbnhfaTJzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UNCj4gPiAqcGRldikNCj4gPiAgIAl9DQo+ID4gICANCj4gPiAgIAlpZiAob2ZfZGV2aWNl
X2lzX2NvbXBhdGlibGUobm9kZSwgInhsbngsaTJzLXRyYW5zbWl0dGVyLTEuMCIpKSB7DQo+ID4g
LQkJZGFpX2Rydi0+bmFtZSA9ICJ4bG54X2kyc19wbGF5YmFjayI7DQo+ID4gLQkJZGFpX2Rydi0+
cGxheWJhY2suc3RyZWFtX25hbWUgPSAiUGxheWJhY2siOw0KPiA+IC0JCWRhaV9kcnYtPnBsYXli
YWNrLmZvcm1hdHMgPSBmb3JtYXQ7DQo+ID4gLQkJZGFpX2Rydi0+cGxheWJhY2suY2hhbm5lbHNf
bWluID0gY2g7DQo+ID4gLQkJZGFpX2Rydi0+cGxheWJhY2suY2hhbm5lbHNfbWF4ID0gY2g7DQo+
ID4gLQkJZGFpX2Rydi0+cGxheWJhY2sucmF0ZXMJPSBTTkRSVl9QQ01fUkFURV84MDAwXzE5MjAw
MDsNCj4gPiAtCQlkYWlfZHJ2LT5vcHMgPSAmeGxueF9pMnNfZGFpX29wczsNCj4gPiArCQlkcnZf
ZGF0YS0+ZGFpX2Rydi5uYW1lID0gInhsbnhfaTJzX3BsYXliYWNrIjsNCj4gPiArCQlkcnZfZGF0
YS0+ZGFpX2Rydi5wbGF5YmFjay5zdHJlYW1fbmFtZSA9ICJQbGF5YmFjayI7DQo+ID4gKwkJZHJ2
X2RhdGEtPmRhaV9kcnYucGxheWJhY2suZm9ybWF0cyA9IGZvcm1hdDsNCj4gPiArCQlkcnZfZGF0
YS0+ZGFpX2Rydi5wbGF5YmFjay5jaGFubmVsc19taW4gPSBjaDsNCj4gPiArCQlkcnZfZGF0YS0+
ZGFpX2Rydi5wbGF5YmFjay5jaGFubmVsc19tYXggPSBjaDsNCj4gPiArCQlkcnZfZGF0YS0+ZGFp
X2Rydi5wbGF5YmFjay5yYXRlcwk9DQo+ID4gU05EUlZfUENNX1JBVEVfODAwMF8xOTIwMDA7DQo+
ID4gKwkJZHJ2X2RhdGEtPmRhaV9kcnYub3BzID0gJnhsbnhfaTJzX2RhaV9vcHM7DQo+ID4gICAJ
fSBlbHNlIGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShub2RlLCAieGxueCxpMnMtcmVjZWl2
ZXItMS4wIikpIHsNCj4gPiAtCQlkYWlfZHJ2LT5uYW1lID0gInhsbnhfaTJzX2NhcHR1cmUiOw0K
PiA+IC0JCWRhaV9kcnYtPmNhcHR1cmUuc3RyZWFtX25hbWUgPSAiQ2FwdHVyZSI7DQo+ID4gLQkJ
ZGFpX2Rydi0+Y2FwdHVyZS5mb3JtYXRzID0gZm9ybWF0Ow0KPiA+IC0JCWRhaV9kcnYtPmNhcHR1
cmUuY2hhbm5lbHNfbWluID0gY2g7DQo+ID4gLQkJZGFpX2Rydi0+Y2FwdHVyZS5jaGFubmVsc19t
YXggPSBjaDsNCj4gPiAtCQlkYWlfZHJ2LT5jYXB0dXJlLnJhdGVzID0gU05EUlZfUENNX1JBVEVf
ODAwMF8xOTIwMDA7DQo+ID4gLQkJZGFpX2Rydi0+b3BzID0gJnhsbnhfaTJzX2RhaV9vcHM7DQo+
ID4gKwkJZHJ2X2RhdGEtPmRhaV9kcnYubmFtZSA9ICJ4bG54X2kyc19jYXB0dXJlIjsNCj4gPiAr
CQlkcnZfZGF0YS0+ZGFpX2Rydi5jYXB0dXJlLnN0cmVhbV9uYW1lID0gIkNhcHR1cmUiOw0KPiA+
ICsJCWRydl9kYXRhLT5kYWlfZHJ2LmNhcHR1cmUuZm9ybWF0cyA9IGZvcm1hdDsNCj4gPiArCQlk
cnZfZGF0YS0+ZGFpX2Rydi5jYXB0dXJlLmNoYW5uZWxzX21pbiA9IGNoOw0KPiA+ICsJCWRydl9k
YXRhLT5kYWlfZHJ2LmNhcHR1cmUuY2hhbm5lbHNfbWF4ID0gY2g7DQo+ID4gKwkJZHJ2X2RhdGEt
PmRhaV9kcnYuY2FwdHVyZS5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzgwMDBfMTkyMDAwOw0KPiA+
ICsJCWRydl9kYXRhLT5kYWlfZHJ2Lm9wcyA9ICZ4bG54X2kyc19kYWlfb3BzOw0KPiA+ICAgCX0g
ZWxzZSB7DQo+ID4gICAJCXJldHVybiAtRU5PREVWOw0KPiA+ICAgCX0NCj4gPiAgIA0KPiA+IC0J
ZGV2X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGJhc2UpOw0KPiA+ICsJZGV2X3NldF9kcnZkYXRh
KCZwZGV2LT5kZXYsIGRydl9kYXRhKTsNCj4gPiAgIA0KPiA+ICAgCXJldCA9IGRldm1fc25kX3Nv
Y19yZWdpc3Rlcl9jb21wb25lbnQoJnBkZXYtPmRldiwgJnhsbnhfaTJzX2NvbXBvbmVudCwNCj4g
PiAtCQkJCQkgICAgICBkYWlfZHJ2LCAxKTsNCj4gPiArCQkJCQkgICAgICAmZHJ2X2RhdGEtPmRh
aV9kcnYsIDEpOw0KPiA+ICAgCWlmIChyZXQpIHsNCj4gPiAgIAkJZGV2X2VycigmcGRldi0+ZGV2
LCAiaTJzIGNvbXBvbmVudCByZWdpc3RyYXRpb24gZmFpbGVkXG4iKTsNCj4gPiAgIAkJcmV0dXJu
IHJldDsNCj4gPiAgIAl9DQo+ID4gICANCj4gPiAtCWRldl9pbmZvKCZwZGV2LT5kZXYsICIlcyBE
QUkgcmVnaXN0ZXJlZFxuIiwgZGFpX2Rydi0+bmFtZSk7DQo+ID4gKwlkZXZfaW5mbygmcGRldi0+
ZGV2LCAiJXMgREFJIHJlZ2lzdGVyZWRcbiIsIGRydl9kYXRhLT5kYWlfZHJ2Lm5hbWUpOw0KPiA+
ICAgDQo+ID4gICAJcmV0dXJuIHJldDsNCj4gPiAgIH0NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhp
cyBwYXRjaCBpcyBuZWVkZWQsIHNuZF9zb2NfZGFpLCBhbHJlYWR5IGhhcyBwb2ludGVyIHRvIA0K
PiBpdHMgc25kX3NvY19kYWlfZHJpdmVyLCBzbyB0aGVyZSBpcyBubyBuZWVkIHRvIGtlZXAgaXQg
YWRkaXRpb25hbGx5IGluIA0KPiBkcnZkYXRhPw0KPiANCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNv
bS92My9fX2h0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC90cmVlL2luY2x1ZGUvc291bmQvc29jLWRhaS5oP2g9djUuMTYqbjQz
MV9fO0l3ISFJT0dvczBrIXdLLVZZR3ZuZGgyOWVCbzNDWklQbjd4R19YN2liNFI4LWhFVkV5SmM4
YVhrR29ZT1JKOGNMSDI1dS1LMzFlWkFZZTQkIA0KPiANCj4gDQoNCkl0J3Mgbm90IGEgcG9pbnRl
ciB0byB0aGUgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlciB0aGF0J3MgaW4gdGhlIGRydmRhdGEN
CnN0cnVjdHVyZSwgc25kX3NvY19kYWlfZHJpdmVyIGlzIGFjdHVhbGx5IHBhcnQgb2YgdGhlIGRy
dmRhdGEgc3RydWN0dXJlLg0KUHJldmlvdXNseSBpdCB3YXMgYWxsb2NhdGluZyBzbmRfc29jX2Rh
aV9kcml2ZXIgYnkgaXRzZWxmLCBhbmQgc3R1ZmZpbmcgdGhlDQpiYXNlIGFkZHJlc3MgaW50byB0
aGUgZHJ2ZGF0YSBwb2ludGVyLiBOb3cgaXQncyBhbGxvY2F0aW5nIG9uZQ0KeGxueF9pMnNfZHJ2
X2RhdGEgc3RydWN0dXJlIHdoaWNoIGNvbnRhaW5zIGJvdGggKGFuZCBtb3JlIGF0dHJpYnV0ZXMg
dG8gY29tZSkuDQoNCi0tIA0KUm9iZXJ0IEhhbmNvY2sNClNlbmlvciBIYXJkd2FyZSBEZXNpZ25l
ciwgQ2FsaWFuIEFkdmFuY2VkIFRlY2hub2xvZ2llcw0Kd3d3LmNhbGlhbi5jb20NCg==
