Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB353486DC2
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 00:26:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DA4218DC;
	Fri,  7 Jan 2022 00:26:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DA4218DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641511610;
	bh=aD/5dVaipCGzNReEbk89Dk0j/Tns9GNNldqdtLRY7v4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n+XCUoIicYQeozCiBg+aHG/FoXxb0imtF9dA4+OCjDk8Bbn/ba3t8V4HasrDQr7XS
	 igMkAwsTV0v4i9vpQ/i8fstKGLcYebDptPwRiN9Wj4lGzfPRr/BdJYsMLS/3lSqcyL
	 tlyYnnPCF79KXRXELbbw12Hf2dzxT7OrUorldtpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4D0BF800AE;
	Fri,  7 Jan 2022 00:25:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FFABF80155; Fri,  7 Jan 2022 00:25:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com
 [67.231.159.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CC41F8007E
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 00:25:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CC41F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="D/PO/Dc5"
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 206HU812012676;
 Thu, 6 Jan 2022 18:25:30 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2055.outbound.protection.outlook.com [104.47.61.55])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3de4vpr7n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 18:25:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHK7fsAHraS+tJow4LULlDqaVF9dKbUyViQUqMBvjVMwGezhOz0JDkpjeN5qWZD4e0he33HyxqfBVJV00lFTX4dVHSEpKcjGS/np3k6iamwKAfw59zJTMqVPEBI8Qtrd9IGDVPUwDYJWyhR4RphLrE/3yi0w90UkYeazN2YcuPWFiZYepPWtgch40oJp98zVbNshSzsEgjyA7UYDUuKFMdgE7FgzLaymGUxRJsLVIFg8kbZPGdKXnkrY9waebFfdH6n/aGc7929UGza4J4g0YlG/3DyJ+EQIvTTkIyJsumLV2/WElULV39loX0xERmepJbJbVjt2s2e0oTURfA/mSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aD/5dVaipCGzNReEbk89Dk0j/Tns9GNNldqdtLRY7v4=;
 b=WWQWL9QmVi89J9NxWCvUAQdt4HLyW5INIrfzi/95WkkagvbATkQbLOto4kmzizSngqhALnNCoAKhs4lGgR6YOR+39qhLR+eqQrBOBXd6zlKJgVvHQPFOPq0xMwUyCZ5uoce5y5dOsNmrI1uI+7IH+RDUSSCbZ/MgebyThhyRVwfGEWZ4lQoBErHgHH+Q+PpEP1z6KKuuIrw9q4/zWLbJYRyr9vssXbHboCleAQsxZqk2L3WBl/mzxRN0f5C0IvfG5+R3gPBo2od38dYh22YiqZiCehVAEwwoEg9XZCqSE4UKOjb/tk5yvXpTuA69GCZSnjFE1nnw+c5RglasuIYoJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aD/5dVaipCGzNReEbk89Dk0j/Tns9GNNldqdtLRY7v4=;
 b=D/PO/Dc5cctR46paFCJ482NjfpYbgpYGboXY6qc7FBq6ZyzaonbOqNaz9TzJn4uCB5OPaV0BO2ZOnSG2SHbWvEdSNv1bDYWITORUmqphZWoNhx85GzGluYSxzC+frsqy+e3lTBrFfpnnJ4pATTRKDjl6G/SbARu4mqOXAiNWSY8=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT1PR01MB2587.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:12::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 6 Jan
 2022 23:25:28 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Thu, 6 Jan 2022
 23:25:28 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH 3/5] ASoC: xilinx: xlnx_i2s.c: Handle sysclk setting
Thread-Topic: [PATCH 3/5] ASoC: xilinx: xlnx_i2s.c: Handle sysclk setting
Thread-Index: AQHYAobl0nvoH60GkESJa/lVtXPGyaxV8JWAgACzvIA=
Date: Thu, 6 Jan 2022 23:25:28 +0000
Message-ID: <1265a3bbd578a3bd2350bc44b9e77de4f46c3f84.camel@calian.com>
References: <20220105225146.3517039-1-robert.hancock@calian.com>
 <20220105225146.3517039-4-robert.hancock@calian.com>
 <YdbjoQGKGedGLl/d@sirena.org.uk>
In-Reply-To: <YdbjoQGKGedGLl/d@sirena.org.uk>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47305443-ade4-4a93-ee7a-08d9d16bd32d
x-ms-traffictypediagnostic: YT1PR01MB2587:EE_
x-microsoft-antispam-prvs: <YT1PR01MB25877E5CF2C792F3483A8F1BEC4C9@YT1PR01MB2587.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WrX8/R0y2MHLAgr0q9ZB2C4WFA7dsb6FdLlkIzDbez4F23R3WXLNVrYo0U+4Xs/aqaDaFS+ZBBLgja3CDOt6NwjbtR7ArKI5sqpBFmMoKRvR01LLOMIiYK+8mGjfxeJfJ5PwN8yU6vmkvZEfL2XNYzcJbq08OERE7Eoqmxg9vgoaZkXD6359YzfnjLsTgsW948DzMYh5fUsk+wK6iyP32zso1jHOkkFUlJSy+JAE2fxlbMLOHkehP7Po/Eay3VirXlcD3q6VS1MbCzMAnluo+IS7Fzp7vO34OH/EmBGcu9R0qAZinIPS0Y13RW+L52ZiB4LH36UPBmdijsmgnaH/wxPeOVxURGsfBjfKYBJ5WJ5Ph3OZJ9gHWO6rKFtTfiWoiDGsRpdGs0ucpHFTV7yLygPedL/oYeG/KW5B4Y4eiAbxxDsJXao0kc3+aAmqM1NZsq/gh32vC/TtPadXoVZHzFVsnsr2kuscqXYNzGiVIbleiI2tfi2T81j+ZKC5Nx3QAzAOZvLVbZKHsWlyOKzXPlX+rUQvTCNp2Ru7k2lHAUp5QOt0HRss2gsl9ZpuMuo/WNqvd9eg83vVVKZfbuubim8Xr7kxqIGAIbA4j03qx/8G2upobtoswmC0BLI/haXFvhgzjz1hGvdoKtN79LBwfqgiYkloXqkaVKwWdzPOr4IeQAoFgtW8af9u52YMl53XsTjoFfkYZsDWmVe6WNDk8iZ+EAbxzM7VaZpEf/E9fAJ5LegtkJ6l0wgoxfvHpPHg6g05XxJHZ3ofNYArZxohBl++ptkHUhVrx2XI7vJul2U5vRiJXDhdbARhQ3VMldpqzB9ib3tLMYu7C311Vamlgs6m7oHUBOqqgh3mbCncy9rP6+xKSr4kDB6/Ke36O4Rt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(6512007)(6506007)(54906003)(508600001)(6486002)(36756003)(122000001)(38100700002)(2906002)(4326008)(15974865002)(316002)(26005)(8676002)(8936002)(83380400001)(91956017)(86362001)(64756008)(66476007)(44832011)(66556008)(66446008)(38070700005)(186003)(71200400001)(2616005)(66946007)(5660300002)(76116006)(70780200001)(99106002)(18886075002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekZWY3hFWndRU05CUEVFOWs5WEQzTlVXcGZVRzFLRFJ3VjBwVUNHQ2R1cksy?=
 =?utf-8?B?cTdyeVRVWmxpMmRma0VxQ1Y1VWV6UWhOWGNkQnMrZnZMYmJFQXBZckdBRG5N?=
 =?utf-8?B?cDRIUC9HTkVNNVVFOUdaSU5FY2RYc2NaNXVacXhlOWY4Ni81R2FOajVUODRU?=
 =?utf-8?B?UEVEcmdlUHJJSWRhaWlaT1R4c25ZSy9rMDNWT3V2WFdZcXBlVUVnTndtV2tl?=
 =?utf-8?B?cWRzK1lqVGhUblNDQUxiYkhMMml6ZThnazBIelNyODJHUnBuWVZRK0UxV1dm?=
 =?utf-8?B?d0pXOG5WK3puMUo5ekY2eml0SHZ6b041YVdGNXY0OERYcm1kbVBoS1I3ekhw?=
 =?utf-8?B?LzhqaEFhNkJkTXVDNkxZb2Jxd0twendmUDAyblMxTklIYXYzQVpiQVBuckJ4?=
 =?utf-8?B?TGt0T0M0V3JqV1c1bTlkaVJRTTBScHBZUEFaaDVNbWNqaG1Xb0VmY2Nnb1Ri?=
 =?utf-8?B?cS9KVUtCYW1oVlM1Q2VjT2IvNDNiajZKczR0VklDT09YVVNtK2F6amFMRnZ5?=
 =?utf-8?B?MHRCNVJFTWsrZHQ0ekhnaExxVTBlQWd0dHBkb2J0RmlCdUZLNG1aSHhuUjhG?=
 =?utf-8?B?bHJoVDFiYWs0eTB5dTVuQlpjMmJ3ajlFUlMxMU14MmFHQWs0MCsrWHhlWThD?=
 =?utf-8?B?K2pUVnJwNktqVU9YYnlEdnkzMEhSWjJ0N2dmdXZlVktrU3RXZnhldkViMFd3?=
 =?utf-8?B?T1FXK2FzaTJHZzBDNW1hNk1GcCtZMlVveHp1MlJvTGt3bFA0TmpoVGpnaEpH?=
 =?utf-8?B?Q2pJQk9SMnAwOTVHY014M0F6MkFIcnRtNGIwVHVFK1l3dmZPeTlPQTVRRnFI?=
 =?utf-8?B?c0FKVmI1d0tLM0xnRzZibDRGVWx2cEc0SWIybDhZd2k1bUt0TzB4N3N5d2Vs?=
 =?utf-8?B?ZG1WWXB5eStRVENFSEtWSnlkTDVCQzhYc2JWa1lnSHRHc0s5aW9NZHdsd0Ft?=
 =?utf-8?B?ZFV1cUl0dlJrYU02ZzFPTi9qbzBVZ0MwWUxjdVArK0RnbWQ3NUdOU3gzSEla?=
 =?utf-8?B?cEVLRFVVc0lGU1lDTityTEJoZlpjS1R6eW5JTGE1WnhqRGZwK1NMTElaY01w?=
 =?utf-8?B?MGk1QjBGNStlS3JDUis5Z3RLbU81WkFEajkycElXL1hqN3k5NlVMZ1pFOTVC?=
 =?utf-8?B?QWpCR2FvMjltVmxCUFFidld1UUl0bXhhNU40eU5oZTRWWlplbS91OC80N05H?=
 =?utf-8?B?QTZ3eExaTGIrbXh3Qnp5RDBVRDdjeW1nRXRWNmcyZEovcERFejdsdGhKODVF?=
 =?utf-8?B?a053Wi9SMHdNRGFtYU9kZWg3SHFTdDBWYzZQMmhlRW9PUXIvQ1QyVjBQTUtS?=
 =?utf-8?B?NEMwaXNYZlpwZVpCai9kT0hXMXBPOU5nbklUWVAySDJPeEJpNkJCNno4Z085?=
 =?utf-8?B?R1NndDF2WU9YR2tLOGRHdWtCeHlTa29pZVJkYkFmUFo5TkFDQ1paL3k4bTh5?=
 =?utf-8?B?NDFXMWdMRytidWlWQWVPakpGTkNldmlneFJOQjVHUkdpclByeVMyNmJWTE9u?=
 =?utf-8?B?VStDNDB1S1dDSzQ1UDdTMzFlWVJEQ1NJelgzSnU0UXJ6WldQak44VWRIaHNO?=
 =?utf-8?B?b1BxUVU3ajdJbWcvTVV3amJZUHpQUTE0TW5DT1haMEVPRU93b1d3cGtHcmZm?=
 =?utf-8?B?d01LakVIZG91RndGeUhTK21yZHVhaGxkQWdzTmpCcFlRZzR4Q1dzMXBMNlIz?=
 =?utf-8?B?NURscis1d3JCOHZ3MEhDM2R4Q1JvaXdIcDFEVlBwOVJSTmtqL0tFbWszMlp2?=
 =?utf-8?B?NmdUcHUyM0dKSnNEcUY0U0ZzWjFGQkhBWnZFaHRlSUdLcXNBSk5PUTBWTHR6?=
 =?utf-8?B?SkJYREJ1c0U3OEVaSDMwOFYwWjFVMjM0WDNTK2J6Nm1WcnVKM2Y4M3dBMkVT?=
 =?utf-8?B?cU96STU2SHM3cFhzbXNRL3ozck1HSVlVR0FaM0s3NVhpb0JpWUZGWkNEc0lF?=
 =?utf-8?B?MUFIREZpUGVQZ2RtZFY4aDZlNGlXUWFXeW1sZzE2c05MUDdrcElGTEloOStI?=
 =?utf-8?B?OXNtUkRJTmNmN0FIV0lzcEJSTE15ZGp5UkpVQ3J4V3E4NjdIR1dSVC9BK1BQ?=
 =?utf-8?B?NEhNTlYwRE9YbE00ZDVZVXBUVlZGbnR4cldBS2x0MGVsMGlQbCtKSkMwdzN4?=
 =?utf-8?B?ZHpQVVV6QVp3a3podzBpK3I4d0JOd1h1a2VRUEVRNk4vNnVBMnR5czR1Umwx?=
 =?utf-8?B?cUV1V0d3V3lodGo0ZElkbnVYY2hqeVpOVkdaRmhiRStsTTVSL0JtSFZVNmdZ?=
 =?utf-8?Q?et7HmL0BQFPWZINChOvsfnoexsDGgTB6OHI7jSNlFg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC6A86478628864C9C13BB0418D40619@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 47305443-ade4-4a93-ee7a-08d9d16bd32d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 23:25:28.3563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DZ4h6XcQmBBvyORl2q1DVl8Xmbu5mbQ4hJNQMLzOx1grFAUGIgKLsXgNjkjLuemPZnJ1WdrjWmPYZBm842iPnEQmotOaY+d3r7M75G67QfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB2587
X-Proofpoint-ORIG-GUID: XKyrPYzVGF87dJWnSh6ET2ljA3QB_JZ6
X-Proofpoint-GUID: XKyrPYzVGF87dJWnSh6ET2ljA3QB_JZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_10,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201060142
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "maruthi.srinivas.bayyavarapu@xilinx.com"
 <maruthi.srinivas.bayyavarapu@xilinx.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>
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

T24gVGh1LCAyMDIyLTAxLTA2IGF0IDEyOjQyICswMDAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBXZWQsIEphbiAwNSwgMjAyMiBhdCAwNDo1MTo0NFBNIC0wNjAwLCBSb2JlcnQgSGFuY29jayB3
cm90ZToNCj4gDQo+ID4gKwl1bnNpZ25lZCBpbnQgbGFzdF9zeXNjbGs7DQo+IA0KPiBTYW1lIG5h
bWluZyBpc3N1ZS4NCg0KV2lsbCBzd2l0Y2ggdG8gc3lzY2xrIGhlcmUgYXMgd2VsbC4NCg0KPiAN
Cj4gPiArCWlmIChkcnZfZGF0YS0+bGFzdF9zeXNjbGspIHsNCj4gPiArCQl1bnNpZ25lZCBpbnQg
Yml0c19wZXJfc2FtcGxlID0gZHJ2X2RhdGEtPmlzXzMyYml0X2xyY2xrID8NCj4gPiArCQkJCQkg
ICAgICAgMzIgOiBkcnZfZGF0YS0+ZGF0YV93aWR0aDsNCj4gDQo+IFBsZWFzZSB3cml0ZSBub3Jt
YWwgY29uZGl0aW9uYWwgc3RhdGVtZW50cywgaXQgaW1wcm92ZXMgbGVnaWJpbGl0eS4NCg0KV2ls
bCBkby4NCg0KPiANCj4gPiArCQl1bnNpZ25lZCBpbnQgc2NsayA9IHBhcmFtc19yYXRlKHBhcmFt
cykgKiBiaXRzX3Blcl9zYW1wbGUgKg0KPiA+ICsJCQkJICAgIHBhcmFtc19jaGFubmVscyhwYXJh
bXMpOw0KPiANCj4gc25kX3NvY19wYXJhbXNfdG9fYmNsaygpLg0KDQpJIGRvbid0IHRoaW5rIHRo
YXQgd29ya3MgaGVyZSBzaW5jZSB0aGF0IGRlcGVuZHMgb24gdGhlIHJlc3VsdCBvZg0Kc25kX3Nv
Y19wYXJhbXNfdG9fZnJhbWVfc2l6ZSwgd2hpY2ggZG9lc24ndCBhY2NvdW50IGZvciB0aGUgYml0
cyBwZXIgc2FtcGxlDQpiZWluZyBmb3JjZWQgdG8gMzIgd2hlbiB0aGUgMzJiaXRfbHJjbGsgbW9k
ZSBpcyBhY3RpdmU/DQoNCj4gDQo+ID4gKwkJdW5zaWduZWQgaW50IHNjbGtfZGl2ID0gRElWX1JP
VU5EX0NMT1NFU1QoZHJ2X2RhdGEtDQo+ID4gPmxhc3Rfc3lzY2xrLCBzY2xrKSAvIDI7DQo+IA0K
PiBTYW1lIGlzc3VlIHdpdGggX1JPVU5EX0NMT1NFU1QoKQ0KDQpXaWxsIHVwZGF0ZSB0byByZXF1
aXJlIGV4YWN0IGRpdmlzaWJpbGl0eS4NCg0KPiANCj4gPiArDQo+ID4gKwkJaWYgKCFzY2xrX2Rp
diB8fCAoc2Nsa19kaXYgJiB+STJTX0kyU1RJTV9WQUxJRF9NQVNLKSkgew0KPiA+ICsJCQlkZXZf
d2FybihpMnNfZGFpLT5kZXYsICJpbnZhbGlkIFNDTEsgZGl2aXNvciBmb3Igc3lzY2xrDQo+ID4g
JXUgYW5kIHNjbGsgJXVcbiIsDQo+ID4gKwkJCQkgZHJ2X2RhdGEtPmxhc3Rfc3lzY2xrLCBzY2xr
KTsNCj4gPiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKwkJfQ0KPiANCj4gVGhpcyBpbmRpY2F0
ZXMgdGhhdCB3ZSBzaG91bGQgYmUgc2V0dGluZyBzb21lIGNvbnN0cmFpbnRzIG9uIHNhbXBsZSBy
YXRlDQo+IGJhc2VkIG9uIHN5c2Nsay4NCg0KSXMgdGhlcmUgYSB3YXkgdG8gZG8gdGhpcyBhdCB0
aGlzIGxldmVsIGdpdmVuIHRoYXQgaXQgY2FuIG9ubHkgYmUgZW5mb3JjZWQNCmFmdGVyIHNldF9z
eXNjbGsgaXMgY2FsbGVkPyBNb3N0IG9mIHRoZSBvdGhlciBkcml2ZXJzIHRoYXQgZW5mb3JjZSBy
YXRlDQpjb25zdHJhaW50cyBzZWVtIHRvIGJlIG1vcmUgb2YgYSBmaXhlZCBsaXN0Li4NCg0KPiAN
Cj4gPiArCQl3cml0ZWwoc2Nsa19kaXYsIGRydl9kYXRhLT5iYXNlICsgSTJTX0kyU1RJTV9PRkZT
RVQpOw0KPiA+ICsJfQ0KPiANCj4gRG9lcyB0aGUgZGV2aWNlIGFjdHVhbGx5IHN1cHBvcnQgb3Bl
cmF0aW9uIHdpdGhvdXQga25vd2luZyB0aGUgc3lzY2xrPw0KDQpJdCBjb3VsZCB3b3JrIGlmIHNl
dF9jbGtkaXYgaXMgY2FsbGVkIHRvIGRpcmVjdGx5IHNldCB0aGUgZGl2aWRlciwgcmF0aGVyIHRo
YW4NCnNldF9zeXNjbGsuIHNpbXBsZS1jYXJkIGRvZXNuJ3QgZG8gdGhhdCwgYnV0IHBvc3NpYmx5
IHNvbWUgb3RoZXIgc2V0dXAgd2hpY2gNCnVzZXMgdGhpcyBkb2VzPw0KDQo+IA0KPiA+IEBAIC01
NiwxOCArOTAsMTggQEAgc3RhdGljIGludCB4bG54X2kyc19od19wYXJhbXMoc3RydWN0IHNuZF9w
Y21fc3Vic3RyZWFtDQo+ID4gKnN1YnN0cmVhbSwNCj4gPiAgc3RhdGljIGludCB4bG54X2kyc190
cmlnZ2VyKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLCBpbnQgY21kLA0KPiA+
ICAJCQkgICAgc3RydWN0IHNuZF9zb2NfZGFpICppMnNfZGFpKQ0KPiA+ICB7DQo+ID4gLQl2b2lk
IF9faW9tZW0gKmJhc2UgPSBzbmRfc29jX2RhaV9nZXRfZHJ2ZGF0YShpMnNfZGFpKTsNCj4gPiAr
CXN0cnVjdCB4bG54X2kyc19kcnZfZGF0YSAqZHJ2X2RhdGEgPSBzbmRfc29jX2RhaV9nZXRfZHJ2
ZGF0YShpMnNfZGFpKTsNCj4gPiAgDQo+ID4gIAlzd2l0Y2ggKGNtZCkgew0KPiA+ICAJY2FzZSBT
TkRSVl9QQ01fVFJJR0dFUl9TVEFSVDoNCj4gPiAgCWNhc2UgU05EUlZfUENNX1RSSUdHRVJfUkVT
VU1FOg0KPiA+ICAJY2FzZSBTTkRSVl9QQ01fVFJJR0dFUl9QQVVTRV9SRUxFQVNFOg0KPiA+IC0J
CXdyaXRlbCgxLCBiYXNlICsgSTJTX0NPUkVfQ1RSTF9PRkZTRVQpOw0KPiA+ICsJCXdyaXRlbChJ
MlNfQ09SRV9DVFJMX0VOQUJMRSwgZHJ2X2RhdGEtPmJhc2UgKw0KPiA+IEkyU19DT1JFX0NUUkxf
T0ZGU0VUKTsNCj4gPiAgCQlicmVhazsNCj4gPiAgCWNhc2UgU05EUlZfUENNX1RSSUdHRVJfU1RP
UDoNCj4gPiAgCWNhc2UgU05EUlZfUENNX1RSSUdHRVJfU1VTUEVORDoNCj4gPiAgCWNhc2UgU05E
UlZfUENNX1RSSUdHRVJfUEFVU0VfUFVTSDoNCj4gPiAtCQl3cml0ZWwoMCwgYmFzZSArIEkyU19D
T1JFX0NUUkxfT0ZGU0VUKTsNCj4gPiArCQl3cml0ZWwoMCwgZHJ2X2RhdGEtPmJhc2UgKyBJMlNf
Q09SRV9DVFJMX09GRlNFVCk7DQo+ID4gIAkJYnJlYWs7DQo+IA0KPiBQbGVhc2Ugc3BsaXQgdGhl
IGNoYW5nZSB0byBoYXZlIGEgc3RydWN0IGZvciBkcml2ZXIgZGF0YSBvdXQgaW50byBhDQo+IHNl
cGFyYXRlIGNoYW5nZSwgaXQncyBhIGxhcmdlIHJlZm9ybWF0dGluZyBhbmQgaXMgYmlnIGVub3Vn
aCB0byBqdXN0aWZ5DQo+IGl0IC0gbW9yZSBvZiB0aGUgZGlmZiBpcyB0aGF0IHRoYW4gdGhlIGNo
YW5nZSBkZXNjcmliZWQgaW4gdGhlIGNoYW5nZWxvZw0KPiB3aGljaCBkb2Vzbid0IG1lbnRpb24g
dGhpcyBhdCBhbGwuDQoNCldpbGwgZG8uDQoNCi0tIA0KUm9iZXJ0IEhhbmNvY2sNClNlbmlvciBI
YXJkd2FyZSBEZXNpZ25lciwgQ2FsaWFuIEFkdmFuY2VkIFRlY2hub2xvZ2llcw0Kd3d3LmNhbGlh
bi5jb20NCg==
