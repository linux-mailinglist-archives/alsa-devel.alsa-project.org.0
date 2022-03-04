Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EAA4CD4FC
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 14:17:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C83E31924;
	Fri,  4 Mar 2022 14:16:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C83E31924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646399820;
	bh=Kqm3fs4QEjHyEvgtcKu3V2lcLTsUJQjiZXcQC/KeCoY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=M7RpO/ysFKVndbkvuWAm2hRkLS3J3AiUjWyijMR5pXnUjl+dJrfB6L3eONeYTfD9z
	 GSfL1LSri6WlycXq7TrXJ6P5WiFWJKsdHwRiVly2gqdGj85l+8EMkRrTewvZqNCp14
	 xv0ZDf8L3ql7lM1ms9VGNjo+GHfg1AneyM4dt4Zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01CBFF800F2;
	Fri,  4 Mar 2022 14:16:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDC94F80311; Fri,  4 Mar 2022 14:15:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BE10F800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 14:15:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BE10F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="jTVQ/tV4"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="K8hbnpGb"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 224A9Lae028272; 
 Fri, 4 Mar 2022 13:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=eY1gZ8UbbjgFCDtXaW85iIDld65zwW49KhHxgCBcH0I=;
 b=jTVQ/tV45KP/M4+yCSLTNYuAJ+QEprRpYupvAGj1Akn4/ppCsJVZtthsp7aoMUXBvsXL
 48G713XnO3xLNFUthSTFlDLDJiMSuMc1U5yP82/bCKcmoe0473aV/6V/h2UH1ee2fxd6
 AoU3wT8E9BoYaNrBaVnO8Gxf3RNn4uN1RGiY9p4kssD04FBqJGXEPUGprFEepV9IFexA
 P+YdH99pSCWcyYh6abu7tsXelxIQkeX5lgAR6GRe6+orJDWB3ANiDFqF57tam86S+RDe
 deoQoAt+gnbNJaE5cf59twYn2T/or+Rgyx83d/9JCi1F5sXGhze5uxKizMHL1JwUhTho wQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ek4hw1r37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Mar 2022 13:15:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 224DC8Nl045150;
 Fri, 4 Mar 2022 13:15:51 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by userp3030.oracle.com with ESMTP id 3ek4juafvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Mar 2022 13:15:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URX3HbCH2nneibi1FKWhu9EQUAe1jxK041gs0SUPSfzvdF64GrXNTqICl+9Y0w75oubmBUd7knDH0XlCs+vPvwvLinfxlX/tU60JRiHgogDZz65CuTF6A9Xj6EpV81msRoEeElHDHm6E8x27it/475fmzuqltq4fJ1bjgVFOhoPIiIXUyesymzggs2QLj1ONwHQwy97kBdR5m7FhaEi1E265LwUip5hbBcW2Fmn1m/DxTo03Iirzpa7+G93tp+NK/+/YB/y9a+kaQ7XI5HX1TtpngW0H4oLgI3+kmRR7iMniI/4fRwtD8UU+luntdbDD09KH7aQPFjVbbMtZBObEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eY1gZ8UbbjgFCDtXaW85iIDld65zwW49KhHxgCBcH0I=;
 b=JXGySqR4alVMf2mshZi8oLWLZEAJDRP8xZE6AtI8ccev2E8YTyqB9iL2lBGL2Ibi9dUYaHoDWhSuO6IzOn97QpUk8O/eX2NuIFbu8LP3gBrmc6DgmPz3nbjr0Ne8nPvc/0uwL6YiUnB6VCDwytlnPjEXn7ZyC91RaE+8LMTW85diMmrmH8JOamfeZPrE30luquQPOKcL1RF073qNwsSDz7t/U9wDeuY6bN+1zi8LI8by+hYkKG5+Uwa+BpXqqDI5FpfAvn056Q+tC1aFYdPq83h7G0I0O36cma1oUyDwCcAPckoM/lZT4PyzM0a5fRlVVMROJ9L8edZBnJLxnaOgvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eY1gZ8UbbjgFCDtXaW85iIDld65zwW49KhHxgCBcH0I=;
 b=K8hbnpGbNxPrFsT8xGGcfTCoq+nxt6QPK0ICbDzuFUe+XGf+mlp9KFt1LCKftyMuGSIgbVX+Jo65/V97neb/fZqBCjDhzGTz5aKOtIfOjKIg7xRQPLDIYy7yp7YDTl1tXHwghV1itKSxEkPyQEGqbkX/SrN524rHJsy1+IkW3l0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS7PR10MB5117.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 13:15:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.027; Fri, 4 Mar 2022
 13:15:49 +0000
Date: Fri, 4 Mar 2022 16:15:34 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Meng Tang <tangmeng@uniontech.com>
Subject: [PATCH 4/4] ASoC: amd: pcm-dma: Fix signedness bug in
 acp3x_audio_probe()
Message-ID: <20220304131534.GD28739@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304131256.GA28739@kili>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0141.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b98e40f-ebfd-4192-4b5c-08d9fde119a7
X-MS-TrafficTypeDiagnostic: DS7PR10MB5117:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB5117AD3D10FD1B01B84DAEF28E059@DS7PR10MB5117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ESCXnAVY4GkktGYGTJM1bRZV/0QJPbFIEgw56G+O0ei2KVwLi2bwMOiZ2WHRr3s18/80YyMsKhrdiqXwrsFHWuHZ9jZ4V5Ftd4StLL5tbnNn+qvh20TgNLfNZmoDV/90KR8eKF10x7gbHyYJBOKRtnvjkrqsrx1zPwZ17mypGpClPJr3HkLHfsRSRmx0pj9/o4md5CAIgGn5WB79hVLa1QWSHA1m674h2KpRrf1NBIHL4l/tdHf1VCVtEoXYGzR5RZZTHabvi9nTCNmh5nxB8YN2Z2FNDdY+bBTzLedK8V+CE9etJ+Jo8xvePuw7ZPUGmbu/uI8hwxXT+dDIuKOUli2SEd064r7qECFjGPrTVQRF4rodxtFOpUMFoTpsrpAb1/CC04w23El5qwX/U4csxQLECufDV/fkAaZ1yJfh+2TAoy/YvIkZXW0bTtkrapzDJJle+p7U17ycXtHC4wxKSsDdOzM3yjhhawyhIqW1BrzAqafYHN9NnGWDuWlpOzjnYw4vj1mFhH8JUYQjhmNfiL3prUL4Y4dh3YbibUIPUJgjyZgbIPDKksgeOreGHfMDUFK7dqUNZ5W6ioCoVwUmbLXZK3tb2GGjPGvGmBtG+/7G4sVi+taOkvLaf60GWLvHvG0yOdC/LtzLwlzCvH8rUYY9aZfPzzM6HsKyaSjTl2cEkPF7+3iJX6fXEKXP41Bw3+9Z4ALxcdsVV2v6Upo2sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(54906003)(33716001)(4744005)(316002)(66476007)(66946007)(66556008)(44832011)(38350700002)(1076003)(38100700002)(5660300002)(33656002)(508600001)(6506007)(83380400001)(6512007)(9686003)(8676002)(86362001)(26005)(6666004)(6486002)(186003)(4326008)(52116002)(8936002)(110136005)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+4iUGbkEbLHRBYhH7LvQbiVJwYb6QDQG9ab/b0So7hzOqSUf8RFHc65Au1in?=
 =?us-ascii?Q?YPINk4wVmxMhDF99Frzs8So7BVh4+mYvs1lJC79oFiSlj1ylbCoh4McY2Ntk?=
 =?us-ascii?Q?oDZG5JK0MSu6fo735k+aVV4tgJXXdFYHMZZy7jEE13n4r4hrRoggrefP+c/Q?=
 =?us-ascii?Q?Ccg9bvYRKhpFVrPva+b53c3CLoC7NufgT2+ccPw3ywGSrHg6vsITFSzuNvyu?=
 =?us-ascii?Q?fsV5+3YRnu9LMquW8+ew3P17mSeV5oxXEhQK2+5v57DdUF2Y3jRxlujXNb2P?=
 =?us-ascii?Q?4X7Fezn5t8tP+dRisi/CJE7or0EIpG9wJNdCILu2PUiAiiCMLUIPIeiMMr+n?=
 =?us-ascii?Q?Q7+NZr3B1ntvZHzQAKWHBQncFKF+EyDJeAqhqwMRL/HnJYI8k7+P+PV7vFIR?=
 =?us-ascii?Q?4uoLON99z31k4hmPA5c7yPRb0/qpZotHw5O3SfQ2vx/ATHM3viQVZ1TGjIE9?=
 =?us-ascii?Q?lNup7ax0W6wgouVC/N7yFRZOQWj0BnpTwNYXiLcNtHsz81JhY43O1s3mN19r?=
 =?us-ascii?Q?P7Czf/T7803YRhSI+jZpBcZeOkeBvoTm8ak2Oc5CViJ1nz8M+lhcmvCnq3iC?=
 =?us-ascii?Q?/DKMmRO/qKVnX/kCxQHKiwW4RLTVLX5Y7u58YVZf+Z9GA/2LRu1aqT6eE/8E?=
 =?us-ascii?Q?NC3KErUgpZm+IT6jzvFgQefbEnDqnM36KKLS1cQm8tJuNj+vOb/EdoO5CjWF?=
 =?us-ascii?Q?CfRTvw/fBj5oB5gqdlwF7+MBcT7hfGiuTP9E/w+A4onNcte2BCk1nJTyrc36?=
 =?us-ascii?Q?FdJ57SMSojBA+D4kDVTTPNmzD86djLSPLhnnzUCVdOIKTdq0wsSpqSax9dpR?=
 =?us-ascii?Q?BMioK8r/rz8Yd3m6rQaJlZpPmDl0+k9bCHvagdz519SXqazZY/zvyRvXbDrR?=
 =?us-ascii?Q?NQBl8aw/zQPdfhKwr8zOdIIK9hrnOlLNOYxHV/OyD4fSo1+ppP4FPoc3bE2B?=
 =?us-ascii?Q?CUGm1DfZS0mD3NTsQRjJyV3VUA/6YvbnCQSuSXnjPG/GKz+LFuKR8ioVmSxn?=
 =?us-ascii?Q?LGCTsgSy2anW5A74RuXdPazeeL2NwYGv9QUQy/hqaAVE/lixyf+5gd6AbKzV?=
 =?us-ascii?Q?r4kiYXBumAd0esuRXKwz3UPKTv64zcfzdZ0XIYwqBMQtBd7wVI++XA9RTKfr?=
 =?us-ascii?Q?hFqGu62HM5zMf+AuNy2AqcICjzjPP3S/l+Lfx1UcYT4qsQzoQICoGwYSqmKa?=
 =?us-ascii?Q?jXQ7E87TFsxbeFMIqliw1RG+KlrZn8X5cCsaw4K5gUg0EynvilPlw47I6pG4?=
 =?us-ascii?Q?UgzB3o3YIXzIs5KEz29WZNhA/ftqGBaZZgRhqm7xMlnjqMOL8QGL90v66Uvu?=
 =?us-ascii?Q?CRk8HAYCYd/AqyTrDXT5qLPqw/s11gH79P/t5iO9l0A+Jip3y+qpyg3FrNNU?=
 =?us-ascii?Q?QXU9sdpW2zpDHMoUfZX2Rrm1i9lex1tRrYjjAvOTaE+HrD5VAXwxqhfVHMP5?=
 =?us-ascii?Q?zflm1Bhx9/neKRUz4U1R2Ie8KEY7/1+hG90MvVVsV0+Vw/sIpwg8vX3tKmps?=
 =?us-ascii?Q?1S3vgOXCKfkiqTug1rppo5ip2oPB7nWNSzjCyfjtfqKs3KWVlQEf2smne6XK?=
 =?us-ascii?Q?dIrUF1ucui5MsBlFDXjgy6+p4ixo/4eniWgl8oLrspUKMeRMPffXw5t+9Ah6?=
 =?us-ascii?Q?R5ECSuA0IsIFNZ2HaJbh59PxK06efTX733dvwOkTLFhYJhapxyFxYPEDWqPw?=
 =?us-ascii?Q?eCxLYQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b98e40f-ebfd-4192-4b5c-08d9fde119a7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 13:15:49.3404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jn7F7wYltrfFU+8zx5gTbdZHcwsRl6ggUOWQ7uN5gZjhr1ufa69x/kmMT8iAFtXAoGUSHtQyD8nEh6QOeiQvP2vgwtyI49hRcZGdcH5mOug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5117
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275
 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203040072
X-Proofpoint-ORIG-GUID: 6VDcKY3VjnEFbkDhmvV2NgLPmja5v7gb
X-Proofpoint-GUID: 6VDcKY3VjnEFbkDhmvV2NgLPmja5v7gb
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Gu Shengxian <gushengxian@yulong.com>
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

The "adata->i2s_irq" variable is unsigned so this error handling
code will not work.

Fixes: 87d71a128771 ("ASoC: amd: pcm-dma: Use platform_get_irq() to get the interrupt")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index e4f8dbf0d11d..6aec11cf0a6a 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -394,9 +394,10 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 	if (!adata->acp3x_base)
 		return -ENOMEM;
 
-	adata->i2s_irq =  platform_get_irq(pdev, 0);
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

