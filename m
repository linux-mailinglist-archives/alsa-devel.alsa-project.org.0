Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0382F46749D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 11:16:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68A5321AE;
	Fri,  3 Dec 2021 11:15:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68A5321AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638526598;
	bh=Ssg0s3UHD8N/nZoEiErJ+pr9C+On44wAGCCjQ2gOeFo=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JCaqzvYfQxFIF27wTLxiBhMuyWsH8hfFdivAbhWzx5c5QQUrNFrK/hpqyKiEOvk8s
	 5VEjN6mz1+2KZjWS/4BkjKc3yGuwvuD4ekvtW+bLKXv8gAOz6f0BR1TCE7hnuJjsP0
	 yI1gq/pb/ktg3fGQaLCnjZOTu8K/TwlgIxsHGU7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C01B3F80249;
	Fri,  3 Dec 2021 11:15:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 916EDF80246; Fri,  3 Dec 2021 11:14:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DDFCF80085
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 11:14:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DDFCF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="b65hEeUG"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="ruhQr4/O"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B38iN07032625; 
 Fri, 3 Dec 2021 10:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=nA7bSn5T4HS/teV2pJD+R5rNHNDNaMB0T0Xq6i2jL+w=;
 b=b65hEeUGV2JkkrWcYlNOJIo7j76J7eSdTGU5IADAO9uEr20fUqo/EH8Pq3AzLZxnZGki
 SIViB6zmJIEuFG8gGsQJBHkteS/4iy/hB3iQhcqmJZbuEyYn2FioMB2RcGywmRiCI2Jy
 rFHxV4bVqE7/8DF/O9Xw0EUt087rb6R5HVSIdjQN/buVGTK2qpRg7VYifOxqoBeZO2E9
 y1GOq7KhxrUc/TYJcFsB3TB1hxHbvulNiKz0pvN6tqMtjlm+EVGj8WASBc69MkZSqu7f
 JaOJgQlINXjxWfoT6QgzO8CT1irkvQjTUjr/cIMeldPgZQgRo6Fo833nS6SHkrJ4m9U4 9A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cp9r5ekwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Dec 2021 10:14:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B39uRmh149026;
 Fri, 3 Dec 2021 10:14:07 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by userp3020.oracle.com with ESMTP id 3cke4w11xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Dec 2021 10:14:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6SFs77hRGDMe8rTEBpqYwuuiY65Oh04XJKhi4vDD+cfHvO8H7+AIOAAHvwbfkgDOWfvxJNSo515aKmQNiK86oS01e6HkvOphPZZZXRhSkbp4YbyUenZpUJpdOl6hMeI+8QQFyAQ/agvn3ALpU8MYStZCBxzbbdjobQ1rFB6gNLO3L4GjQlUMbK3SUAD+0NTvzJCNtYoAo+PM8R7VqR1IMoJRYcnkI4gccFMsRPFw2ey81kPbFik8xpT8Z8pATthnvVL/+Ot1+DW+0OS/MmZuL23Twk3m1h7CyqxR3bvMFEO6hHQGX+C4MCZHPnnQLpYVhcYeOBwxbqaOV95lav49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nA7bSn5T4HS/teV2pJD+R5rNHNDNaMB0T0Xq6i2jL+w=;
 b=PJ2zkdtc7YUbG7Uoz5ZHFgiuk+Lo4V3lumKyhXsTZrX1LnMO/+qjbQ8zrZF3tI2rEDLI2zYFB4rLHJe61QK0TXOw9qOxzF2/y8hoon4Rm/cEa2ZeGnR+FpvJ6QDeUL6XXq5dqGMyR2nxhruXp06iIOW5YnXgVW1qmJgyaQGBZ2pAGYYPsmDk5Cf98m7zSvR/lt6k4BJ3DTgh521uikHW9mI/Uu1/i1ZbqZDEl95IUqYVNoUlpLrVsHp3C+U9v9wgUshSpeNT6ecVRLWJ+wC3UW52mWNe+RJJaoroNJA39q+vWekEDE6hE/TOqOW7tb9ag2voymmapgU+yWTDOxvxxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nA7bSn5T4HS/teV2pJD+R5rNHNDNaMB0T0Xq6i2jL+w=;
 b=ruhQr4/O2lees5ZodqCVfKdbCsr8Q7XlVBsDPQWUoXDskrkJ16YckRhmrQ0ycsyrOohlDgms3TnJej8UzvOHJlXLdibFY/3OIKRyoe+cVo3ox47M2534wOo8VPbC3n7xKVyAALykNq7vv27sr7b5eGS2B1q5ThWY1svotP8kDoI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2158.namprd10.prod.outlook.com
 (2603:10b6:301:2d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Fri, 3 Dec
 2021 10:14:05 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.027; Fri, 3 Dec 2021
 10:14:05 +0000
Date: Fri, 3 Dec 2021 13:13:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: vkoul@kernel.org
Subject: [bug report] ASoC: Intel: mrfld - create separate module for pci part
Message-ID: <20211202151322.GA21325@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0048.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0048.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Fri, 3 Dec 2021 10:14:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 674d29c4-ea86-444d-8b05-08d9b645a2b3
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2158:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB21580889511AB31A42610EDE8E6A9@MWHPR1001MB2158.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M4ktCsxAQE3ZBEXeP8lhwzN3kUs6WOKnEiFKOrYl3m7jHW7fBDdR0gh+2PO/BXgwbytRvM8nAnEIfrhdQXXMTwfJVprZoRYsELJa8kCYtmtTGY7M3ULJM4odsEVtC5jcqawqEt8sKBg7zmI08m6NNa8uEnao1hF0mpr+xmjXkVU5DItXl3QXD9UPFxWt5T5VlpnaFrsf53yVVeyU7p/DxomFasE8inEZ52CsIogNFPW/CkFeAWpXuphct2TxxqI8uUYQ/NpDBCrkqzD7XVF3vXiU4MPIeAHKwoJ8Xe8awBnMH1bwfNdIilZ205vV0xwuzuf/bHuuN91SdoKxzRnG307T6qJdTE4RSsIAmiQX0TSvhzZwjbItOk/OAKIUMWih8IC98Ook/Mx4RmL0iXK7AWP6lJFx9gcEKlUiq0NjJkxsvE9GZORJdB6KBhyzIRGEQW5eOvpyS/aRRkfMjF2Xy5zA58Wj2rJuYWIXlnOfnTalKfzTzk0tmdrx4LoVmztz0waCWG8OOYSb8WxmOpW2+dnyNvg846bvb+2R9cBT1s+dm9e8Fx/jKWB39BmCb4QtReIehpayTBJcHsKubhFDFURZp2yYM/6+CJQhnDEB1c8fMPVYi2SZajQGDoBDeomMQvjxTCmoTKM/U05iP9mL2gfvq2rvAnDaKNBzcxeafMZ/pvJjIWiccg2/5yEnyHazLSgmXX+fCHRTt+jQETYfaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(26005)(38100700002)(38350700002)(6496006)(52116002)(956004)(186003)(9576002)(2906002)(8936002)(66556008)(66476007)(66946007)(1076003)(44832011)(6666004)(86362001)(83380400001)(508600001)(316002)(9686003)(33716001)(6916009)(33656002)(5660300002)(55016003)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MBxdLCuGy6RaKR9+Kuxh8fyLWWdj+y0ScmBBhwTqaljJ8DSbNNWqhnAiFj/R?=
 =?us-ascii?Q?R/bynmVYzC4ZvEO3a1vJYHLQYKvAiw80U7q7UHqAbJfwjLyWvj0pCkHFnJNe?=
 =?us-ascii?Q?91xG76lyo8gOJ1xQo/dyqZBriDZeVj9AKN4jyWRuB1TRHy72PpPrTTExMj1U?=
 =?us-ascii?Q?dNg5+H4zwTu7RO4y6H93Gejuf3eacRGcQbTOpPCi/NZtkJ9zyPcfKJIHn86a?=
 =?us-ascii?Q?5xp5Jqg52w+PANAXfuG5H4QzmOZB8179/LMBO1tcgMCPUhSd36cy4KgzifFB?=
 =?us-ascii?Q?kq9I8vVTbDrVMeBWk1dsUtvYEYli8V8u+5wjkWKbZs2GaAIfvnWlBBq3xTr8?=
 =?us-ascii?Q?gIQgn7FnLg4xr7dQYPpJlCBI8/w53VKgv+3vSW5NrtI8+R5dRVH0xmDK5bWK?=
 =?us-ascii?Q?U3N72BmACe8auTQwEsisrLiEXufo/NTX47P/4ZN2vMDQbSjpuBAn8HGMjAS3?=
 =?us-ascii?Q?KHWZ5ty4uSUreVk9Vh/0mG6z20gxc9qsHeel4HWdQF56NvhAt2GwjgCmVUw5?=
 =?us-ascii?Q?i2lpIG3bJUkIQwRReMBKuojNq+QjfpgiyzRfjZsu0WcvghbLQs001HNaJpL2?=
 =?us-ascii?Q?KclUYeCH5/1+XyZMdJ4Bc7L3ek9YszVS7mNV8njcebo3PcL/KXrCRnQWffNS?=
 =?us-ascii?Q?bDgDDtxO6niHb1y5vDLXVGzQNv8kLPo3803RmH8gAtkyPIztPjlrqzz1IHAc?=
 =?us-ascii?Q?NhrpduZuSubWMBE/cxmkEIPyi15wSHetjTTksfkXsip2gomeX7FFTIIOhW6I?=
 =?us-ascii?Q?9bUBAkQjtFMrbYd6IM2KCuUpFJhpSXBvP815KnncHc+g0O+yULi9eTlHcyu7?=
 =?us-ascii?Q?WGoI5qvuOyEksBuYF9f0njTmnEAD3CZpZvi15zEQGI4as59LqOMSZ9xKaPt4?=
 =?us-ascii?Q?tLvUc0rTesuW04tvsC4MS65VWFkSc71VYJ51GpDYiMRifDgLv9AMsqQbGFED?=
 =?us-ascii?Q?1nkj/eXnwJJfrowDPteSVAhpOVwiSdunmsSpE3LNROoksNKJNSOc43z6oy1f?=
 =?us-ascii?Q?p/Bwu1q3hUKq3rQZF629hd1WcUzGu4vZEX3iXLJ7lRQBezqVyg2yHux23qj4?=
 =?us-ascii?Q?rQy9d8wSue7sASxm/s1eGB85BoA/brH431nHpZ68shjUNqRsywD1OWi3BrvH?=
 =?us-ascii?Q?8R2drRkm/aFc44YgDNyeBt4QMrxTczbu83/W0R5sV26bms5Y3CDzYMfcQZ8S?=
 =?us-ascii?Q?SsBCrs2Uxr36vj17uGoj+XJZsUYt8eIGn9CTzUma0nK3F1AYF5lf35iM1Uhx?=
 =?us-ascii?Q?yfiAQ2uYhpkFGi4vXQHMbA9OlMA//Ndr7FuQSg2fKoieFslIt9pUPB3mBYMi?=
 =?us-ascii?Q?jcvvU6ISGi8xmJ3OUeqX7bPkbLfyVNAf7oe1cCuWq29djdJEIkV/wrrFPkUy?=
 =?us-ascii?Q?JbjJRX+vZYEe5J1cInDOTi13NfbepkMWcECkFMZWB7C5MrJG3JrzojxqsHW+?=
 =?us-ascii?Q?oEcwzXYZOQP9VbBnIEofHnSUdmAdZuHGU4lI4ET+0PRY+nZC5U4AqnoqjtT3?=
 =?us-ascii?Q?Xf8+jApf/gEiWLygQ09N+gB4s6bR1kDxu+kazLHK38RgWd3yMahrLQyCc9i9?=
 =?us-ascii?Q?LJZ1VQ6Vi1A1aSTLS8ahVo0CxWnwRqhqyrM9ga/MDCkkpPVZGyxxLz8TNxPH?=
 =?us-ascii?Q?3oHBVBTnGXuF+JCvirhqBOLwBIsnf8fDHjKj/M9dF5GRNkDypAFokR4dBzWq?=
 =?us-ascii?Q?0m0zwSMseULMHvzMqRLgwzpEIRw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674d29c4-ea86-444d-8b05-08d9b645a2b3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 10:14:04.9429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94f5PE+2YOU7lkz0na5VzLxJrbTJXNo1sXm7xuYxJ9BRMHJDxVgzUDByFuCa9tj698SVgVN8Aka2lH2PNutqfsPf/csOXxljTmip8hQqtDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2158
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10186
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=617
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030062
X-Proofpoint-ORIG-GUID: Fo-GcoVptRubMOuRMnxN7ZbBWnk0mQrg
X-Proofpoint-GUID: Fo-GcoVptRubMOuRMnxN7ZbBWnk0mQrg
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

Hello Vinod Koul,

The patch f533a035e4da: "ASoC: Intel: mrfld - create separate module
for pci part" from Nov 4, 2014, leads to the following Smatch static
checker warning:

	sound/soc/intel/atom/sst/sst_pci.c:102 sst_platform_get_resources()
	warn: resource freed on success: 'ctx->pci'

sound/soc/intel/atom/sst/sst_pci.c
    25 static int sst_platform_get_resources(struct intel_sst_drv *ctx)
    26 {
    27         int ddr_base, ret = 0;
    28         struct pci_dev *pci = ctx->pci;
    29 
    30         ret = pci_request_regions(pci, SST_DRV_NAME);
    31         if (ret)
    32                 return ret;
    33 
    34         /* map registers */
    35         /* DDR base */
    36         if (ctx->dev_id == SST_MRFLD_PCI_ID) {
    37                 ctx->ddr_base = pci_resource_start(pci, 0);
    38                 /* check that the relocated IMR base matches with FW Binary */
    39                 ddr_base = relocate_imr_addr_mrfld(ctx->ddr_base);
    40                 if (!ctx->pdata->lib_info) {
    41                         dev_err(ctx->dev, "lib_info pointer NULL\n");
    42                         ret = -EINVAL;
    43                         goto do_release_regions;
    44                 }
    45                 if (ddr_base != ctx->pdata->lib_info->mod_base) {
    46                         dev_err(ctx->dev,
    47                                         "FW LSP DDR BASE does not match with IFWI\n");
    48                         ret = -EINVAL;
    49                         goto do_release_regions;
    50                 }
    51                 ctx->ddr_end = pci_resource_end(pci, 0);
    52 
    53                 ctx->ddr = pcim_iomap(pci, 0,
    54                                         pci_resource_len(pci, 0));
    55                 if (!ctx->ddr) {
    56                         ret = -EINVAL;
    57                         goto do_release_regions;
    58                 }
    59                 dev_dbg(ctx->dev, "sst: DDR Ptr %p\n", ctx->ddr);
    60         } else {
    61                 ctx->ddr = NULL;
    62         }
    63         /* SHIM */
    64         ctx->shim_phy_add = pci_resource_start(pci, 1);
    65         ctx->shim = pcim_iomap(pci, 1, pci_resource_len(pci, 1));
    66         if (!ctx->shim) {
    67                 ret = -EINVAL;
    68                 goto do_release_regions;
    69         }
    70         dev_dbg(ctx->dev, "SST Shim Ptr %p\n", ctx->shim);
    71 
    72         /* Shared SRAM */
    73         ctx->mailbox_add = pci_resource_start(pci, 2);
    74         ctx->mailbox = pcim_iomap(pci, 2, pci_resource_len(pci, 2));
    75         if (!ctx->mailbox) {
    76                 ret = -EINVAL;
    77                 goto do_release_regions;
    78         }
    79         dev_dbg(ctx->dev, "SRAM Ptr %p\n", ctx->mailbox);
    80 
    81         /* IRAM */
    82         ctx->iram_end = pci_resource_end(pci, 3);
    83         ctx->iram_base = pci_resource_start(pci, 3);
    84         ctx->iram = pcim_iomap(pci, 3, pci_resource_len(pci, 3));
    85         if (!ctx->iram) {
    86                 ret = -EINVAL;
    87                 goto do_release_regions;
    88         }
    89         dev_dbg(ctx->dev, "IRAM Ptr %p\n", ctx->iram);
    90 
    91         /* DRAM */
    92         ctx->dram_end = pci_resource_end(pci, 4);
    93         ctx->dram_base = pci_resource_start(pci, 4);
    94         ctx->dram = pcim_iomap(pci, 4, pci_resource_len(pci, 4));
    95         if (!ctx->dram) {
    96                 ret = -EINVAL;
    97                 goto do_release_regions;
    98         }
    99         dev_dbg(ctx->dev, "DRAM Ptr %p\n", ctx->dram);
    100 do_release_regions:
    101         pci_release_regions(pci);
--> 102         return ret;
    103 }

Surely there should be a "return 0;" before the do_release_regions:
label?  How does this code work?

regards,
dan carpenter
