Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BB94634F4
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 13:57:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 098662005;
	Tue, 30 Nov 2021 13:57:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 098662005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638277072;
	bh=SC74+cOXaNrGuL8JUwOK7GWoaFJ5En6why6S6Ma26Eo=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g15cm0moIWh79d/6xA7X4WKlroRKgGVOWC6OQV1RvXRq08e91nZnCioB7v05e0rzX
	 fhNKy24Yc86BpjLp6Wto6CsoI3tohAU9SOEqgmOIQ3MrPHXXt5Oo21BBKr7gRVkVP9
	 gMxcNleyYe3MwziVCqjOJ2l2dXkSFJUIqYr8BX+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE159F8020D;
	Tue, 30 Nov 2021 13:56:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD1E4F804AD; Tue, 30 Nov 2021 13:56:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE1E2F802A0
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 13:56:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE1E2F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="gokH32I9"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="ZjzOOuz1"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AUC45w6021038; 
 Tue, 30 Nov 2021 12:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=cGQMWal/rkHk/4RDfDTpNDfhrlEoQUwycjD+FoufjoA=;
 b=gokH32I9JCbc/o5SmjSqzPN74vZ8N66UePsArMoxWegU6V5+BXXwslnfdfxVR91vAF4o
 0wVw643mzeTF0e2Df0pV1OjTX0K/LTISa1FvSklNUKvRZwLXl5xHErmJpQHVmpA3CJOW
 Y6SjtSJPMQ4i3jHrU9B3EoKcwcysapOb6cpiYeT1JiK3lEMzmqHYv9FH1GJhI8h4DrFi
 tcLgImg6q8DfqRPN5aGOtqYXzTYHQsAb9qUN8SZRYAlLp7LUmwRjScQr15SXV3kuBI2E
 pJPyFxRYcr+IAZq7G4FiRnWa2DtfJHYdlbmihE3Ts7+h074k0xXQicsm+zgWio1PZUOS Vw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cmvmwrynx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 12:56:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AUCqMtm068487;
 Tue, 30 Nov 2021 12:56:47 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by userp3020.oracle.com with ESMTP id 3cke4pgmvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 12:56:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zzz36gt6O2FCzj9zn6D74o8n/s3A0yJDdxWsIzbKRKzZf5XyxYKh09UzwknPY6Ok6Y27ZmvDycsPVZmSHikhLRJISFFmrhLlbEAK07VH/mW4I0POOBv9pF8d/Mzfeu+xvLeL5AJE3Ke7Nz17d2/CXMtKI6SfLXOqa5jf5CuHSogop1NgNTHkGa+1Niy37USW9jeGFlfWnhPnffPeaRs3JVWUOQM4IZt6z9Ia7vWKj4UzgVv3nTUS1oU3TpgQ/JM26QN2QTDgt6vNNk4SxFs/bdv1lp4BxeDvobjCr/leuSbuTl68uag27+cgn6djOfCMnUEqJPZ0tB7Gn/WP7JSbiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGQMWal/rkHk/4RDfDTpNDfhrlEoQUwycjD+FoufjoA=;
 b=cFfoCmCI5VNDY9Oe9gxT0wf/ADS/jBwfUbbKbTdOUYEWpfdvUUf3POUVw+iegihOOC8yK5EmgrA6OyVJJH+IKP2j8xAjN9Jd/JG4jGcAeaszk9t3YoRNCxED3ebulDa8zJJC+LomV1Vv4MsSHgfd74EWagol15mYkAduUCUrXSbNKtkBwpa0jQF1pBqAschfE2HxtI07zOqmz4ZkA1CGlUA71UlNDJ90O9pejcteIme8oMwYkuSfWtIw5gqBXqbiwGsQTWa1E6LTppwlROHSiaowewx0uL7ooK8sX49Y867EpCMNjBm+W17Sr3ytfj5JHSdn5WirD44q1Tq/lZtTiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGQMWal/rkHk/4RDfDTpNDfhrlEoQUwycjD+FoufjoA=;
 b=ZjzOOuz1QK5MteRFUwz20KAwYbe/mIwe4NATJ6coVJt+W/VxDwKk/XeDfyQjR+9vRiFiXkBovMudeqEaB8nidvkdXeeUO+xcmaKKvnYHyn+1uwv82xQIqbUXcJJcFVVgV/Pjyqmpo36yyX4/gmphjg1D9Lg+gaJi4l2CNHfZmz0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5677.namprd10.prod.outlook.com
 (2603:10b6:303:18b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 30 Nov
 2021 12:56:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 12:56:45 +0000
Date: Tue, 30 Nov 2021 15:56:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH] ASoC: amd: fix uninitialized variable in snd_acp6x_probe()
Message-ID: <20211130125633.GA24941@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0141.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0141.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Tue, 30 Nov 2021 12:56:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bfba7b0-a723-4225-82cf-08d9b400dcfa
X-MS-TrafficTypeDiagnostic: MW4PR10MB5677:
X-Microsoft-Antispam-PRVS: <MW4PR10MB5677F2F92B69E6ECE1BE1B218E679@MW4PR10MB5677.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WIm5zWBxl1ZvQurXKa8IvW8PC/ur+R7NpUN3J7VkuW2I85NvTpnQk4vhYnjIZMI4xLjRT73/jnZZMGa9D7WUsD2IQFMiuGNhjhD5+pv+LAQxbezXoJyGeyhw3OK3ce5zznBDsotugccTsV0BtDOGyjikgcsn4p2oz/SddK+7ztGOaoTVW8WdUwDPj1pXsiIkSHcZnlqL7Ee0HBwVEYkyc7RN9ACCz+aMX+GPyHAbD2X+FFp0Q/BSw1AsvqHIcMeyzHl0gBvlg02gxEYHFEN7du5GQcQlMrWJCHUh7Hh6dBw6Mzy28a8iK5PNBvkBo88+ApzDEbz3I3A+EYrmqHaJpfdWeT4XbKlhdCK+A3Zu29eVEmh3wnMZTtxESduPwavbHAXApgTy92M+JqKRdB4baX0MLn2N+vZuvavUoe/msdU6sBddv74OUoT8URRvu0RgYjWyuV+bpYM2Zsa2yHI75fC1/gz11nrUQrDdW3nLPCRm4j99dB3+ZKPALT2UhgGOBQ8ju3tvYXbRFDzHWHh/OvBDwf2rim0Q6S/4d7hU8PD643He/NpL7FbHnUamLRPl/gCsYLxgTKaqJ1F6Wmk0X4oNTQ8TAySqCH54Y81Z4f88lOwXsAzp/UmnL+wX6dooRDKakB3yMCpDp8fxeow5hQOd8CYckjrhB+/VjthEqaeuvzvb6foXg8MyXE4KV1n830Ct0WxrxYiUOA9ebpSC+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(33716001)(44832011)(38350700002)(38100700002)(956004)(316002)(54906003)(110136005)(52116002)(26005)(186003)(33656002)(2906002)(6496006)(55016003)(1076003)(508600001)(4744005)(86362001)(9686003)(8936002)(66946007)(6666004)(66476007)(8676002)(66556008)(4326008)(9576002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kN0VadTT+oTGX6f52Xe5PtX0POpIxSWXFcxHK4PWjIcGaTiu8GByuYa2XtCi?=
 =?us-ascii?Q?eel3JYJwRoLBUOpGgVUDV52VgOpfcWpXzeh4eDmeyG7Sa8qIQQvCs6vxvvki?=
 =?us-ascii?Q?EBzQjRm/WOgqPbmZRZwWSiHv1gCv83UfM7XG4sgcd8o7NULTlHQg46bs2jg1?=
 =?us-ascii?Q?ADVmLJJ/hB2q6xFuK8Gm3LNaqyTHGKT7BzqlwOi16Csfy0BPmsmPxNhsSMvE?=
 =?us-ascii?Q?brKFb1SnoggW3Hgi70jUunWyS1LlFd7BuN/Kp0sDAbbJRj+SdCiiS807iqIn?=
 =?us-ascii?Q?z29zBUBKHdJmRvU2oNCuhDMNp7PwxwOc8ccoe/FPCAGjRSPh6HCCGw5H0wmk?=
 =?us-ascii?Q?hmH76ALWO4tHgBkeOLNmHuP+EAYSc6vrDMcR0FKdt9Hflqby2EPa0ecVDP9j?=
 =?us-ascii?Q?N4wxvhLODNo3qWlZzjUuIV0yP/h4PH2E8sGhla5/cyAYU50brPgFU47PKynv?=
 =?us-ascii?Q?tIZz2hxFl7yoFsAz3vtgJg3kSrmvqzxYbEQkqmTULBogwXjG2xEiAPZImjfB?=
 =?us-ascii?Q?1lD7DlaKv2eR5FvhcaS90JjasHfCEXSWEAJnOkUr4nqEJBhBKoYXyJfn5exp?=
 =?us-ascii?Q?W3DMm08Ht1133KDIAS/LfFv5G1Ur00QNiNss7ALsCh+2eBnNsi7KjZq7EyOs?=
 =?us-ascii?Q?iTzeezYdvgGTxr3PWIynYj7Wr9AslXIXjdssNlM8dqAri4qU5er8qokv9fuG?=
 =?us-ascii?Q?cMnjC5Ru8BJYy2Jub9akScIda/JsIYf9JkMLHn8Fu9syRsU678dtIrwUL0H1?=
 =?us-ascii?Q?OjHNaLn5rfo+HRJ16Mp6VcBcBtNBgjAij6YdCCRt/BxKiirIocFChYWa+ywY?=
 =?us-ascii?Q?60JBT0TzBnFeVRKgs6uB086AYeLpbjjgZlyjyJhDPlv3hlkGrcPzydzufgAa?=
 =?us-ascii?Q?Z97Igv0+4tuHxLRfZGVlGdUvMVb3ABv8KPa8n8i+0PwqiHoBirFn8X8GvtXg?=
 =?us-ascii?Q?GDiVFD83hE/5GhAtW7c2DoCyeTqg5Y1DTLM8ShiebIGAZF3tszbbMO2BjRvX?=
 =?us-ascii?Q?apXnX6JmvPNsE5e6DwI2i9tuqOrlEcnUHmtyXaANID466qj6kBoeOA8+DM7Q?=
 =?us-ascii?Q?3/zEFh78NMfcdKIuSxCXhYuaT+dlvy42KBH6RVbx/bi8sl4P4mgAvc9asaOa?=
 =?us-ascii?Q?jb2wqXa7E2MmlSAZXx+kR8jM5SEVxnG/SKmlsyqMIDFrwbMCj43VA9hKMCmu?=
 =?us-ascii?Q?fwM/lI5oIDrDPEKgRx/NLimYQUU714afhMOMAIC80O7PyOXANUW4BdFG+Zic?=
 =?us-ascii?Q?BxqQTUdXwC65aogwJYZZJhGgpHyf2mIoaocy4veaMOatZWVlxDwSATOMV0tU?=
 =?us-ascii?Q?y8GIhODQVtAxhnjdHHPR8JXiwdmTBC0a7EsuvW9fGSJXzbfN/0CqeHIlKzJV?=
 =?us-ascii?Q?Bj72U7EGeMFVBba/78HDN0ym+BqMDbOdvFAoYjzQpp6vHFHvViHw/KxU/QBl?=
 =?us-ascii?Q?rl+Bqh2mPq2YI3uT0zPflC747BIwWb/wroentzfroxBXmKA+Nsy4iSMwf75M?=
 =?us-ascii?Q?7PdnITBgrOytQsg33SEDpXCSoeUX7Qj7PyqWgYcdqG3F7BGLtUYnP5SJEy9a?=
 =?us-ascii?Q?gKWuhR/Qo0pc7LBf7NrkGd/9idnhr+JA9vjg1KAfylmI6ryn1q73Shm/y3oT?=
 =?us-ascii?Q?+2hRVtdjLGapseX6AoOj267gmED+9MXr+MymDFaL+tY25tLpge3zV5vY/zmK?=
 =?us-ascii?Q?SxJzFqwGv4BbS0TGP60nu3258eQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfba7b0-a723-4225-82cf-08d9b400dcfa
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 12:56:45.2778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A83JWbmXlP/hSug1X7KR+kqRD2zfPVaI1L9/TLnfcj9B3Yr19NqSk+UT1NY1l7+H0YkXlz5pc9H86PbcYTfj71oQIku3HkKHo14M+dNO1QA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5677
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10183
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111300074
X-Proofpoint-ORIG-GUID: a8t7nH40xNCz4lD3H5Zv-NdJZ4CWC0dU
X-Proofpoint-GUID: a8t7nH40xNCz4lD3H5Zv-NdJZ4CWC0dU
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
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

The "index" is potentially used without being initialized on the error
path.

Fixes: fc329c1de498 ("ASoC: amd: add platform devices for acp6x pdm driver and dmic driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/amd/yc/pci-acp6x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
index 957eeb6fb8e3..7e9a9a9d8ddd 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -146,10 +146,11 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 {
 	struct acp6x_dev_data *adata;
 	struct platform_device_info pdevinfo[ACP6x_DEVS];
-	int ret, index;
+	int index = 0;
 	int val = 0x00;
 	u32 addr;
 	unsigned int irqflags;
+	int ret;
 
 	irqflags = IRQF_SHARED;
 	/* Yellow Carp device check */
-- 
2.20.1

