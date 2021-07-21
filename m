Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 340FC3D1031
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 15:47:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B457F16EE;
	Wed, 21 Jul 2021 15:46:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B457F16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626875263;
	bh=gHJAIPsh7B/UJq0iJ6fyaC820WyFDwAek+LpwBFJodY=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GZAOtC3R6mp60zynci2YFbLTJYbmktK8azYIpSJ8VK+tnJFyZ6EY8nS6kL9bUGARL
	 TcHcQ/hTe23WhGLRjIBZTRZjGdZSXf/eaG1a+xfbnbQZmP9s8LqgLU7mxmWEXL6zy7
	 1n38lMEJCKV8MPkAEDUWq2XJ3Z94tFR35WlNUZWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19AC7F804AD;
	Wed, 21 Jul 2021 15:46:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5A93F804AC; Wed, 21 Jul 2021 15:46:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74658F800FD
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 15:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74658F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="0PpnC89h"; 
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="AlS4y+2x"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="Ud0fD5Qc"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LDgHt2025905; Wed, 21 Jul 2021 13:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=9btU6Zlii833oYrfI1QAUjb+FfnoXyopR0Plp2RGf8M=;
 b=0PpnC89htSju3QrGKm6cHcw35Z5KijnCGysnAZIBFhEwez2wSizTUtoqaNLezX9cyHig
 ngXBpvjSYD2Vz/P3yCNVymfMmgStkXAh4YS2EiUP2tv+LlK8iNrSJ+Uo8lwg7J1EHddF
 eQts5ShdWok/eDKxWwxDtZYbM+06h4xyRKKICSvYD7ieFxLtJgbdKQieHzHY8WF2vCUJ
 /5+SACQQi7VwCCgNKrELqnmB2dBXDMxh9Daa+WjMBnTVEieXoZM59zHAodgcENh4n2dD
 5d8UaQ0K2W9UGUgJqfD2QBg7naTcLGmdqdJxwin0pHW7mmgYb94p2KAZZQH77Dbq0bLc Yg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=9btU6Zlii833oYrfI1QAUjb+FfnoXyopR0Plp2RGf8M=;
 b=AlS4y+2xihBrxCEHJ0l7axgoC0g/xRDAxPKuRpZg4/iHjEBRUSifw8NKI7l27iHEYIyE
 dBMZsTtCnN53lXKQE41a2JDvGf1WCTK1OT6uBRyWkcZUteTQ+g3636Mwwf3FCE2gPfdz
 yv31gRVXmu2HrUVbW2jn7+KVlygy2cMEvgIhLHu+6ND8ANH/G55JC1DXDEU4KeKNK2KA
 cnzZxPNdm2hafsavrSvS+b9Kr0JARJ/sATSX3+aIinkJt0bm0iuwNipAQPFYyb4+2yEW
 7xnS8A6zQM4Q8EbsmtXWLwCmpyYZ6xqU8RJRugo4XbjOCRj8dWAOy9U2ILil5iS3ZqNv Eg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39w9hfwaar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 13:46:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16LDeORZ032305;
 Wed, 21 Jul 2021 13:45:59 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by userp3020.oracle.com with ESMTP id 39v8yxeps8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 13:45:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgw35kYhqxKwyBeHXeTgfIwC/TGKyHlpB52YD1RMyfLwQXGJdsfzCYyl5a/DC1uSKNAbxhjxBc1ryxtMnqcoND0i/0hPPe3Pg9cjw32jmRaey4I7PQZOk1wnhGfY1H1gAx+tJhLFYSJbAbbDuhR+cDSj6Bj98Xm70jMKFARZFWH+IxNuy43BCY+vT6yzV6ZKV+gby/K5+PFsJLWG6/w+Hp/C+jknS0KkkZtsVaDNFKpQrVEPRzYDLJkE7Lh1/O2f1jw6QiNiPsXruFILXGUfV6PwMwNmWbVyD0VVrKDF+KztB/KmpMAR5irUa8o0JTPVH1DY8XNdLmGiTRye/YR8ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9btU6Zlii833oYrfI1QAUjb+FfnoXyopR0Plp2RGf8M=;
 b=P8W2YSgxN/PSgepk9hv6vAV7G+kEWOfwx8zj7rcTFfV5pmUzlh8OY9cu2+PIWIRZ4uHCwzorUpSy8zmiHbd8hUzM5yi5BW4wGrAncWrrN2IRZZjV4FVRyHqRWLUK3HDWUwoo8fUwzOkVOFoqpczoqnekL4XxxTIl4/d+F/bL27f8StdknSjbxcDLllkf5mk707J5N8/MTD8gxYXtoIiaIq4jn00Y9747ZIODch7xrM93dzHGatzU6GEF3J4RufJZfRzgGK7xoq8wevf2qbMKQNkMrsyZdMNtwCdkWwsRrZLvPti6UxwR/k7FN3+9RbfZtoPgzytTSZ4U6W8dZWnMfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9btU6Zlii833oYrfI1QAUjb+FfnoXyopR0Plp2RGf8M=;
 b=Ud0fD5Qcz6ql9i46BnmIVHnpZlIGX4eAH+ELijTzgMTiklUbAp+velDOO61i4qgFKyATXrhw9YOStY1tHoSEIGwqQHrGhmENF22zZ/E+AoWNgQVE9qrLVtYNh3poCESXB+R+D08z0EW819Pod2KzDhvz9YDK5k6n+TZ0MbHEYvE=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1949.namprd10.prod.outlook.com
 (2603:10b6:300:10c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Wed, 21 Jul
 2021 13:45:57 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 13:45:57 +0000
Date: Wed, 21 Jul 2021 06:45:20 -0700
From: Dan Carpenter <dan.carpenter@oracle.com>
To: tiwai@suse.de
Subject: [bug report] ALSA: als300: Allocate resources with device-managed APIs
Message-ID: <20210721134520.GA2850@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: LNXP265CA0090.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::30) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (2a02:6900:8208:1848::11d1) by
 LNXP265CA0090.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 21 Jul 2021 13:45:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d59d3b6a-2c0d-44cb-af02-08d94c4dddf1
X-MS-TrafficTypeDiagnostic: MWHPR10MB1949:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB194964AFDFBBB90C6F75EFE08EE39@MWHPR10MB1949.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vwjh4OZ3QvoPWZrQb1wUER7BckrPV57VZeirw4DrqMRkyRwK6AKKOEcuytrqVbRv1/Nrm26wf69Wx6OVkZrtOkDBPDjsmaGsbV9dV8wmmkJkzkx+yJ251SWf1I2YI6X6apzq5dJaFAnJdl1bSuoVBJKw1iu+i2kt/2rY5wxpuqXzRRz3VzxGJ2wlyRcD2lns/VDWm8XCDdPj9yvEg9nTQ9nRsnWRIOxK0ygGE4hSDqWK3tqeVURh9pM6CD5usnyAqLEOgPfgGTx3a2d8I0f1ND0YAn9eFZ4KU/hZdR8+SYRTWugILWOYjs6RVvivb0P0wACH8qZBeJwqbA3hDUtLq1nDFX46sGbcP8XM+U1cmcofki1CgtjF2C4uYmaNhpugkfe/RjQOc3ptg4W+iOOGOGoEbruMHHll37dLWOMB4Hlqtz9SNZpGwjQeYAxotjlh8YUdj3Cip7Gc6mcVxfdofSO2EeYwAqGG/QRHXr7ku8WukvMsoSJ2D91J1VdJPTJAs3I3ZBtrNCE3+XD8QqqAqPauukOjXmn93k+yGbMZmUxCpG59nVXLw1OuAVmW5LaWiJuXZpiX2RiPLXH+8zLmtirKFReIXhhJxntEIuguOS6hzHgMSDUVRE1N5STmQxFwCskPlj3+yjWQz1y0Xq2yZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(39860400002)(136003)(396003)(366004)(2906002)(6496006)(5660300002)(8676002)(86362001)(38100700002)(55016002)(316002)(33656002)(33716001)(1076003)(4326008)(478600001)(66556008)(66946007)(66476007)(186003)(83380400001)(6666004)(6916009)(9576002)(9686003)(8936002)(44832011)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GGjiPxaxiyzOsNL9U6dPbeckMVZX3ekrVhKIS/laa/b3V0COeGe1kZlkfo9H?=
 =?us-ascii?Q?2/onFqmQdVt3y8P0MKypleVFIzImVJcY9inEq4due/2JL2TGQXXZOJKX9i10?=
 =?us-ascii?Q?K8rPthXJ9knxasXZATzoKyM4R50t6uduRn9AKF5J78tuCcA5Yh4MI5jhR1yt?=
 =?us-ascii?Q?2GsLdK2+Hp5K6pE2iVl30jK/KO8Hlo6+q+VXWR0bYxx5nJ6lYGxKxOI4kHoG?=
 =?us-ascii?Q?9uRRI9jkzWii3aCETwWgKrcTEGIH5eQYwIvyUvaa/RbtB+jiID9OTNP4IvTj?=
 =?us-ascii?Q?JSCFyAGpcnqNPf2RlUWJa/sh9iYCUH6pvhlKBJWBzGEPCnAOmfljvuo+voFN?=
 =?us-ascii?Q?pV6zbWMA4BbaOQQrL0jL6GdFp483Q5w+Fpv6UFjLvDHpXGzMYUEz40KIczDh?=
 =?us-ascii?Q?y5DE3UdsjbkGlWkrw1fWYy4mvCIPoJoeDWn9E6n6fI9NTaa3PG01Bn8zySOJ?=
 =?us-ascii?Q?62hGy4tc45mc8hvSUNzCnw4zlucmXygsUMiNN4jYHNqiLFgz6ndrjBA6PlBk?=
 =?us-ascii?Q?50h/2vNcvbDGeDK/IViZ9DRIOzL6jBW4+jysHNpzu3wu5uCAQPcIg9tJ+9Z6?=
 =?us-ascii?Q?iZpfUeKO9dV2SRjK0UcWl+sA+vMeAlPMsW3avcgUz0fBPsmhP20NhgiD9mRS?=
 =?us-ascii?Q?V8djxcwbD2J9zalzKCCb6LXcaEj+BvLvlF8wIK8l760A4efAqPLdunWnq4rA?=
 =?us-ascii?Q?zoIauh+RgEVHwZ26ODb5uQ3YoBroLsh/KSM9Mochy/7rdcaPhqJ0HDFn294W?=
 =?us-ascii?Q?a/IjI1dxAHV1fhhnc3KtqC5npjokPM/aMIKQp9zrJ9OiLz07/Il965cB8VYR?=
 =?us-ascii?Q?CagUuEBTkV1IZGHdsiGuUtAUnu0t6TEZjpYQhfNzpwdnq5AZLMc7whF/xCsZ?=
 =?us-ascii?Q?veGOunSurQ9RZ/EMOdFrxUsxJvOykHTDb3pcocHp2Y+L95ZLD8A2HNk8BN54?=
 =?us-ascii?Q?rvbsADr5oxFpPRo9HN7KU4LD/M+nVysBMsEiMi9MXMkma6GqyonWbCFxAaIi?=
 =?us-ascii?Q?zuRQQZbPhLpG646biRNb5jEujPlozMarAGKtWKOItZxmulkxc1z78TQ4qmWR?=
 =?us-ascii?Q?MJSSnKon3wdxjwHYrOPMtanzt/3uYkqTggVo98QpOmWOwuPIo+YzswO/FHM5?=
 =?us-ascii?Q?a9t44Zf6Yg9oyQWlblvuSNZuRxnHqYJVRNt3a34XaJdk3216OpdjyDjM1e+J?=
 =?us-ascii?Q?AjJTFDN3H9HVagraS2oXvn1KNBxdxDv8m0LEjbK83t7s1tSD+Yy8Cyadhmuq?=
 =?us-ascii?Q?LEy7X8FmE5sr9wT8jghsAOL8HNbRMz/4HmXLyH9XMCbzapKQtT5mmQgbFufb?=
 =?us-ascii?Q?tEKqvlXbxHWKGiHWy+SNoJDqaem449EqttPjJSUh+ZMEIDx1SsMZZdFvZuVt?=
 =?us-ascii?Q?1z7RgWE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d59d3b6a-2c0d-44cb-af02-08d94c4dddf1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 13:45:57.0391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1gCSvs9pd9f3+h72WPqpi0zuz9yld0WdjHoahIgGYhJWKEcJKjgfuBo7lAuKtAHfztj7m+244uxTh3pLiSSesDOVq7UoeNu7aVI44nLD0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1949
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10051
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210079
X-Proofpoint-GUID: d61TK_CfWYl2HJQJFWH5N7bA1uVWpr5n
X-Proofpoint-ORIG-GUID: d61TK_CfWYl2HJQJFWH5N7bA1uVWpr5n
Cc: alsa-devel@alsa-project.org
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

Hello Takashi Iwai,

The patch 21a9314cf93b: "ALSA: als300: Allocate resources with
device-managed APIs" from Jul 15, 2021, leads to the following static
checker warning:

	sound/pci/als300.c:713 snd_als300_probe()
	error: potentially dereferencing uninitialized 'chip'.

sound/pci/als300.c
    686 static int snd_als300_probe(struct pci_dev *pci,
    687                              const struct pci_device_id *pci_id)
    688 {
    689 	static int dev;
    690 	struct snd_card *card;
    691 	struct snd_als300 *chip;
    692 	int err, chip_type;
    693 
    694 	if (dev >= SNDRV_CARDS)
    695 		return -ENODEV;
    696 	if (!enable[dev]) {
    697 		dev++;
    698 		return -ENOENT;
    699 	}
    700 
    701 	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
    702 				sizeof(*chip), &card);
    703 	if (err < 0)
    704 		return err;
    705 
    706 	chip_type = pci_id->driver_data;
    707 
    708 	err = snd_als300_create(card, pci, chip_type);
    709 	if (err < 0)
    710 		return err;
    711 
    712 	strcpy(card->driver, "ALS300");
--> 713 	if (chip->chip_type == DEVICE_ALS300_PLUS)
                    ^^^^^^^^^^^^^^^
chip isn't initialized now.

    714 		/* don't know much about ALS300+ yet
    715 		 * print revision number for now */
    716 		sprintf(card->shortname, "ALS300+ (Rev. %d)", chip->revision);
    717 	else
    718 		sprintf(card->shortname, "ALS300 (Rev. %c)", 'A' +
    719 							chip->revision - 1);
    720 	sprintf(card->longname, "%s at 0x%lx irq %i",
    721 				card->shortname, chip->port, chip->irq);
    722 
    723 	err = snd_card_register(card);
    724 	if (err < 0)
    725 		return err;
    726 
    727 	pci_set_drvdata(pci, card);
    728 	dev++;
    729 	return 0;
    730 }

regards,
dan carpenter
