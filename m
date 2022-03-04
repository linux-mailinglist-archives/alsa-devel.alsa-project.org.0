Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E834CD4EF
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 14:14:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 245F5190B;
	Fri,  4 Mar 2022 14:13:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 245F5190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646399669;
	bh=JHCDWFBxrQjIhWTatbkxaAtDEpmE9GR8o0JCQWB19hY=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N1K4q1siEArLeoiGC43vKpzQz2nT7pSRAoL5CvOsac8+wh8jxVqUqBDi1xCuJzXrx
	 orr+2iqjqlbSxGpFTKdBAc9gn+tMOKkY9MMck2XRoFMCNazJ1ndzJz0iPjatXbI0nB
	 CzoH68CNR0gRJE5RtvkjeVjiZCE6WD76Vxj9SJh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 831ECF800F2;
	Fri,  4 Mar 2022 14:13:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 512CEF801EC; Fri,  4 Mar 2022 14:13:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95CFEF800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 14:13:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95CFEF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="bkf6bJC5"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="Ke67T8UY"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 224A61WC019468; 
 Fri, 4 Mar 2022 13:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=c8837bD04RWOWbGk2oP9ZX+VqRSMCnnb22sNTCCOa3E=;
 b=bkf6bJC5k8tz1mdCuIyMcNIxxxLCQJmpFRflOMrsKMi/Wju8L9l9ggTstSMO80p1oqaw
 TyFZ2DQQN5DrenzwVS9VUCSP6L7YjqXFiAbd3e9imOyxmBKcvRWFdl431HcRx9DuiBpZ
 7SQ7RFeIsNCKk1UPIbMZRhv0i8EWFM3xonUrY62r8biHqsmlHuUpFgIp85D8u52g9mUo
 pBeLf96zoA5+HVOyeCvi/+rByM7/6KcK/+IgQnMnEtUB6Wnz3ahqX0X4OFATWrq4GI9h
 p9iQdYkX9tAm7jY5mw+hMbL5C9WPqpjX4zHd0O6oj+L/5n+pqob7pgrBmIduqm9zr5cD Qg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ek4hrsrb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Mar 2022 13:13:13 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 224DB865080637;
 Fri, 4 Mar 2022 13:13:12 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by aserp3020.oracle.com with ESMTP id 3ek4j8tw0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Mar 2022 13:13:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ky0iTpw7DBPxiToxaFIrfm4pmTgK0KmzwjM3f/Nb3gv/Mt7GDMPKgPddauHvDOS5rCtcW9r5VD+n8WbhspjgEBLvBBUe+P13LW8WDIn3SrnokUOb2ZR9E2VsQM4uaOl4/iUSrJIUqoE6TVH51qZnnxVB2GzWgMcU0TV6CWrkeIMxA7S6VBjha5jRyl+i2amCFffpFjGZfKAZL+HB+moIGUBjrHWLZG02OelMJe9nF74ZvfMkeIiLoPayySvI6v20RMOGM6Fs2DkdQfKb4OyRUXoQ4+L4ZzshYFM7hUmlwgWWJwaJOwkeo82qghFvIdj1x4R6Wek2lm6WLBypqOmhKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8837bD04RWOWbGk2oP9ZX+VqRSMCnnb22sNTCCOa3E=;
 b=Dmsz77WL2c1PbR/h1dbHhz1VAWcDAeVVRFNkNaSM2/+19dqN28pkZVNCwRriwnEk9lMXeOyyqA5otqeC1W40AirOvF2Ov81JFQJXM0QtYCowbJKp4CbMSzFsZvXAU0ThVFBmFbV7T40TxJUjAMhlFrtXtr9mxPcaa0w1IkhU9nlNrVrZX4AmSIqkgFC4eAxFfibqszFyW8Tmloc99Ix62DgnTjNcxg/jkxFKDfzSX14mklWn2juGvK5A4BuL9g02Q34XA9L33+wXCQEHq0IHEOimzsduynSoTn3QnNlLLebJH8bCG+dQrp1dM2s3KbHAXVAPxfeL7+HMX1NXRXtUFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8837bD04RWOWbGk2oP9ZX+VqRSMCnnb22sNTCCOa3E=;
 b=Ke67T8UY6yaaduWQ52TcY5lGD38ZBVEyMKtvQ/IiVjMcEyeyzjpNYQkjfTBU01XMLSq6NGy7qxXwg5NUlWf14sGrTTuMyFFoxF39xo1m1x1gX88hv9XZOQYcaZxaucaA//p3xnjZ7mmTzNfMIglQ4e72POXwLg7qibMAwQraRI0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3142.namprd10.prod.outlook.com
 (2603:10b6:a03:14e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 4 Mar
 2022 13:13:10 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.027; Fri, 4 Mar 2022
 13:13:10 +0000
Date: Fri, 4 Mar 2022 16:12:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Meng Tang <tangmeng@uniontech.com>
Subject: [PATCH 1/4] ASoC: amd: vg: fix signedness bug in acp5x_audio_probe()
Message-ID: <20220304131256.GA28739@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0001.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f05a15c0-3f23-4008-561b-08d9fde0babb
X-MS-TrafficTypeDiagnostic: BYAPR10MB3142:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB31427AFED6333D96EF5D0C1B8E059@BYAPR10MB3142.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFo5vwfVmMjqYcjKEsZgZbULUGTjSimPrlDG2X+gQ36YVPfJqybCcPLAnlNCcmE4iOofzzadDO52fUecUYs8ZZ2Ctec4LjGjPH86gYyGUm8txkucka8M4aUpUvzc5Cv8aqtnB3Eo0cXT0S8QBvzvmH3LvP4NERqe8yHa29KW8IrhC9rAiwowC+P7xSkhZzAnoeKL5M9vN0JF2lqyqCvwlkE/YKZQ6A4CfLSh+N7g1gQKQH+pitXcnFuhD5tZzbx+cZzldLwLUDgL3bUmySkEe9+9gJIpyqhX6xOPY0SzFG4vUT3YWPwyIa95Mw7fXtWaHORz/aO0iVx2qo3DI/RylFN6w75QUZSEk1WIIp708Z9CFadstSCgYivY1xE7ls7BYyiJ9mVPn1jsQ3wWIuWYIun/lYXWUQwFyIusJ6pToUEuEA8wuT1SDCbb4dg5ORKtYwkgBlKIjVAek4dKFbGhIiHep1MRZY8Mk7hdgn4W+qwGzPqN14YHh7cMAPrIY9poFd5WME4EGgx3jsScqRmGwTxgEm+FtG3UlBr4k3BQVW5K5Pt6w4tgyh2pi9qH6sEnkI2kNByym3VtQC3UDy74UJyNp745lrA93rDDy+dInJRL4ZAODF4bN3FKfxtgja2LSSow5olFzb4FRxi+9rtRPhh2rzVWuV4yYUKBvZYhT/0EZ/Mugnj2nyj4F7WN1wm4KC5zI7Mg4n5v5BnFuKxhkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6486002)(83380400001)(186003)(26005)(1076003)(33656002)(6666004)(508600001)(52116002)(110136005)(2906002)(316002)(33716001)(54906003)(38100700002)(38350700002)(9686003)(6512007)(8936002)(6506007)(4326008)(4744005)(8676002)(66946007)(66556008)(66476007)(86362001)(5660300002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u9VcDKZrWNSMDejvoiFTXw4bHJwDI6hAZqV61PGEygpEzZBBFm5wsNRlj2+n?=
 =?us-ascii?Q?658tf7laI+B9AwdcTiI15AcFP2kVRlNSSJgqXlCB9k49ne+Y7fI0mWFTFFlY?=
 =?us-ascii?Q?xAC/XYkvytWcV7bhpcMSTIj6NUsmQFPCZwdYky0yxlJAmeScza2BhtoZ7Vev?=
 =?us-ascii?Q?CqxlXq+rBPVWb6qkLmS4c/v5OGlEm3boTDAt9LxCuAEaR2VdCQZ1xM2Ha+5I?=
 =?us-ascii?Q?VCdJwbwJ0vIUhdjcCwSSgqIP55gzytuSBPHkSSIIs3649n6QvLiCPAaKm5V4?=
 =?us-ascii?Q?8dzHO1jP0BZFyYBPsfF3NaWzVAty/ABWf2eG0JXC6Hv12XeGXQULv+p9wJC0?=
 =?us-ascii?Q?U3kEaOt5gWNvAWdVzbHLmlu8WZDW/k2RDbw7mi8NHZiYCQdb9tWiYQ8/spPR?=
 =?us-ascii?Q?UglqEL+t8QPy+MTM55VCm1+RFEnZGL8GJdcZCjHHTlV52T78zrK0/M2CQ5Zm?=
 =?us-ascii?Q?xUfao3slGrYzdxkDgAdlKd87ycDkBZCuViyyHfkK5hQcSm61gs4zu5IIHyhk?=
 =?us-ascii?Q?S6UCswgk21DmF4Yb1MvLmvdLHbYUHRCReCfi2Qv2v8WbKKTdcB9i1lHJqFn3?=
 =?us-ascii?Q?l3dYbCtduUsBAyasce7apMVphbjVwntF0SvwCiSJkurJLd6ExObdkJhVLcVp?=
 =?us-ascii?Q?RsS0Z8WaREXOASv1RUG0gIV/u4dFOEZFUWO9jUExZ4IjJPoLQU/VM/xP0LVo?=
 =?us-ascii?Q?PJjDJUjXVDKkkf8mqRNuDqEF4KRMg9FDgDe2L2EpoOpavVG3cnORZB3IrHev?=
 =?us-ascii?Q?nNIFigp2OpoJcAynHq31OpXWAg2X+SgQoIU59tEV1GwXWQMAHwcJ1Czp0CGb?=
 =?us-ascii?Q?0OYHLEMxueP312TWRvGKHuQ4qyEVreAaeFK0XzpNLZD/o0pjeEbayztCDbVk?=
 =?us-ascii?Q?lqPyFznP90BE5UrZIrbgSPcDb1TDc/Y9EhcY2c4o80WaquOZtl95CxYufP6y?=
 =?us-ascii?Q?hS4z8PwFUuyBLyeSpTWSHEKDqpSNTOf8yFI2W1iguB5nlmS8MwWzxhUh0Gmx?=
 =?us-ascii?Q?xvMj4gD1YcDtUSOtOeBxeOWXarFxh07TxMPzwGHmYAYpEtfWalqQf8H9xSX1?=
 =?us-ascii?Q?XCEav19Iy4MxRN9O2lu82BKNp7l1KISTUxNgJVzJcGQ6dSp1VeBRkqp6408u?=
 =?us-ascii?Q?ZbJbW7w5sLEcwTiRl2DbIJq+Nm/o+L8iGZFbs/f60ZtmuxfJvcLAez3pXlxV?=
 =?us-ascii?Q?rjXUeLovOojTDjitLBYfWQRVy8gqzGO/IlvJnlCGz7Vl2iOqBatGaU2JSrA/?=
 =?us-ascii?Q?ta+bc/eFTPfjKtTcLDlDyrB9knfcKCa7FlTizh2wX1JQ3QG4UrFL392djhFY?=
 =?us-ascii?Q?qahYXwOTJV6poh1sZ0sVkCZ+DQQGXnYjMRq4vxzPO8j8M9GpWi4aoBaRu6w9?=
 =?us-ascii?Q?IeIEqLJoAtlhhJ61APsakAKZPODkluRBtHDqMmouXbl+B1GH74XZv8y8KJk/?=
 =?us-ascii?Q?vFcVGogMEwcITLNBcgpfF/1P5EF/SbMCfI8UrzgLS2vMbFHyIn3zEY49gvtP?=
 =?us-ascii?Q?H92vZuuWQX3LzyHbhMQx+CqIASc7A10Q2e+tHewI023gAy3ENHCKgTH/BIV+?=
 =?us-ascii?Q?P7x3urPwVVgsddB4jfg2xa3dBhDb4XGzdbeA7JCQRP782S+25AHvnyMUEgS+?=
 =?us-ascii?Q?bN7t724nHrxb6NAdBmLAfC695gNjyO3DQ9HZpB5sf0P3D3gNk/TYnbPP/g4U?=
 =?us-ascii?Q?sM2vCw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f05a15c0-3f23-4008-561b-08d9fde0babb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 13:13:09.9476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4ZpkeXN1rcjAkQgkn2zCdwDfGTiWEAcL/YblksHlOg8OxMzZ4lyxVpmTFxw8v300ZVm4GK248zWrZeBTIzvBbL4rvWInGqiUUnR8ylbUBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3142
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275
 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203040072
X-Proofpoint-GUID: B1boqkyGN3D47lAmkaAEBcbmzBxBX-XO
X-Proofpoint-ORIG-GUID: B1boqkyGN3D47lAmkaAEBcbmzBxBX-XO
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

The "adata->i2s_irq" variable is unsigned so the error handling
will not work.

Fixes: 87d71a128771 ("ASoC: amd: pcm-dma: Use platform_get_irq() to get the interrupt")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index e4e668593b3d..31fa166df98a 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -388,9 +388,10 @@ static int acp5x_audio_probe(struct platform_device *pdev)
 	if (!adata->acp5x_base)
 		return -ENOMEM;
 
-	adata->i2s_irq = platform_get_irq(pdev, 0);
-	if (adata->i2s_irq < 0)
-		return -ENODEV;
+	status = platform_get_irq(pdev, 0);
+	if (status < 0)
+		return status;
+	adata->i2s_irq = status;
 
 	dev_set_drvdata(&pdev->dev, adata);
 	status = devm_snd_soc_register_component(&pdev->dev,
-- 
2.20.1

