Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CD35827E0
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 15:41:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED843163E;
	Wed, 27 Jul 2022 15:40:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED843163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658929287;
	bh=0KijlWNAxbdnxytXxL0SoGZoffqjkdSX56VAVG8cLdY=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pIWOu2STXPZAUtsZ1L3Kd8CGKGuLOe8PsOr9l47wAtpfjxu65viO/PJbqAyP4bI0n
	 1rIbzHTE5OxQXk/Trx3JqGpc3ZGpcBNvf2+wz2YfuK0pjYkxW/YU4FNWmc6SSeX/7D
	 RKCzThf6UzFRb8g6217u5qkFdsO9lo2PV5SKmPDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 790D4F800C9;
	Wed, 27 Jul 2022 15:40:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01615F8015B; Wed, 27 Jul 2022 15:40:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61123F800FA
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 15:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61123F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="sSKY9gpZ"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="AN8aHrSx"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RDUCrG003478;
 Wed, 27 Jul 2022 13:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=CQyxLO6bhQfnom/WWekfPNG6GPZLEdZ8A4gt6iDb+VI=;
 b=sSKY9gpZ/YRHvXJ/uQk4s37J5SxaI8n2PNtdFJdfmlqo0Xh66kTp3/FmNBzY5U2PNo96
 R7jU0jKBitnVti+1u8mJz+JDTE2tbq+fFpggywLz7UR6h/J9k9IwnFk3jQZbC3wfWzH4
 a/Z2WJL/1O1SFfBqEMvRl2ZAgu6UIP0PuU1etnDUGkvgAuRQECVAf3nNPDW+6VyTL8+n
 fFcUfuGvk/ulQsyGXalXXsoZCce7wz1FFCp/QPUHAlZvINfzmKQAo7+FvJu00zf75kQP
 Q5XRXMlbwC8xoSfA+UPZMY+e8XbaaH5fPzJ5kFtkW28HFyxDRVEB2sdJ6eLrqWXAUyCf aQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a9hmqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 13:40:21 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26RBvt0i019959; Wed, 27 Jul 2022 13:40:20 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh6398s7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 13:40:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHylKlX2du3s2DgilcLEWUnUqJcAnsUKZpFDUNacTKJxHdz7o21m6fIU70hdpoCeqPIpHgKdO11iAZIL/CM8rfgq2wq9308kvpwVKfXxuE0RZGV9nP25yg7qhKrWb/Vcy67HH1fP9lGFNM+6nvXpH80n8ynsjRn4vy3/rxS+QcelgqcNURo9Tu7SNa/4G3j/BiwI7qxiXMhRpbv2+sZag66R9FJnQjedRIAUKnEPTV6Aie5a89aFR6AWezxMFhF0y/cj/yo2MG8xU4/b6mMGR2ILHddiHn4KN65C2jB4LaaCOvxSUnDMIbK9uS2vpmWDHrSi7Y7lmxe137M6Cgpn8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQyxLO6bhQfnom/WWekfPNG6GPZLEdZ8A4gt6iDb+VI=;
 b=I4B1vMVNxrpaBekdlOvKdr3z3C3105x79QV/kgTsx5PRV4iJF0OL9Fr1H+r/XA6FV6cmVGmXuctx51FMpWxQnN5h24TEgZer9bKT/6Mibxs0fu63MI5wLwRWJ9qX1OXp2nHRliftBwn041THUK9wv/K0OBz+FYdckHxWDOigyj/OXUx2rewudl7C28k1S27rmxyJD0hTA8kAEdGpNrbZ1gj7PfUBcWAep+v0Evr4/NUe5cAiZpdwKuRjU/iBJlPz/n+y+/rOs4p9nJrzCQzTba2kIiVtv49RsDX0wCF+YKjjCB4a+4feCGiruB4N1vdTdDLddQPCqVugEG2YI3xnpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQyxLO6bhQfnom/WWekfPNG6GPZLEdZ8A4gt6iDb+VI=;
 b=AN8aHrSx5oeHRLW7/tLuTgMjaHYLDwojg5MmAqsuwcIxclK2Tw1p7jwuG1zpdxv1zpUYwfOU2hG7r7IhCfFczIMcf0YdgVuz4MuJ1IdHjfSz0GuvCLmJYhTlCUdDwCYeE06ux3Z7ppyhpJ5+OGZuMsQFD0Y1FRIe6rbPUc0ufNk=
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by CY4PR10MB1670.namprd10.prod.outlook.com
 (2603:10b6:910:e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Wed, 27 Jul
 2022 13:40:19 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::eccc:6ecd:41f7:ed02]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::eccc:6ecd:41f7:ed02%5]) with mapi id 15.20.5458.024; Wed, 27 Jul 2022
 13:40:17 +0000
Date: Wed, 27 Jul 2022 16:40:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: [PATCH] ASoC: amd: acp: uninitialized variable in i2s_irq_handler()
Message-ID: <YuFANcpt9Z8X9L5n@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0069.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::20) To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34bfba7b-a676-45a9-06ba-08da6fd58aa5
X-MS-TrafficTypeDiagnostic: CY4PR10MB1670:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kTSh0W5LMj12MJuoYZEmmb6080IJHuVgmzuNbT5CwfH45ikV4V6xXhDPn4+YCUN6Vef1JNKc0W8xsygUmLDIG8mp9jBNhOEY86jBoObFpk8WIpmW8ffeYAC+lUlM+5tg9c/SRW20i0CnycUobfH5mqDtX1dTWf9C4uODP9oOkabRvXLQBwWuSUqb1jD5nchI9iJd1QBhh5Sbcv/pCGsJNU4Fl3XQwrrPjAVu941Wj5dL1xeF04EJK8SxFm911XNISfL21V3wQelIyZMcqWpO5lHyfjPJ0lSMWc6Xil5caiGweJ9yzn/HG2qliGtxYIs3knEZaXvwwmIx2by3xIrA9uKaqufj/7pWQIk6o1ZyjKYYOvEPeDNLGtxMCPAEvwbsdPWU8f/IZFONHT+2LBW9hXWdpSuqm/r6FXcvp4+c62E/1f/Z9jdArsfTvIKxYrKjXUPHuU49uCni2/3bL9UvntXCRNPzMqx5vJhU87Kv7AFo9COZkU8QbXysITgcN2C0CwptHFIihW39wM3+gaHrHMp4lr9GZRq0fZjjyhxPQr0oydLxaP55hyWcp6LU9avoc15cV7dOqplv4Pb1m1hctEAJ9IDHwv5xeC214yuCN0IyO5RIGPOQjLFNTZ7tmdyvDgBcra1rT98mDST0YUwptp8IgQ6HTbIKe2iCnwONoL8GTwYnlYrzv6j8v9ooEyq6zNly3i1qUJFozn19oHrsDSxrMt7vf6Q65mi/7zbVnKYQ4DUtYttWRD2arTx5mY/F7uVEb0sc4irX6ADlAGfLJnU4zbgwFXztTp8MhTxI6K0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2358.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(39860400002)(396003)(136003)(346002)(376002)(4744005)(8676002)(52116002)(66476007)(66556008)(110136005)(6486002)(66946007)(478600001)(44832011)(6666004)(4326008)(26005)(2906002)(54906003)(316002)(6512007)(9686003)(33716001)(8936002)(6506007)(83380400001)(5660300002)(186003)(41300700001)(86362001)(38100700002)(38350700002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YBYz/nU9dZ/CJnezveMhSJPKKBMoLh29+wrZsaZyMfuUzo5g7+y3qDv8gwuJ?=
 =?us-ascii?Q?C+75fPMHUPdOAXNiaufQbIS0JBlXnLEPnXf90wLG5oL/PRQfN/3KGddTAxqq?=
 =?us-ascii?Q?L5KD4vkDJ2PWHVps/aZHilsxgeWrUAXPIPBLGQTF0mnJ+gaZIpjMlnefwuSb?=
 =?us-ascii?Q?xvEUFkfl2vN0ew5UIy4hBpc7FAgtpM4B4PCAVig4P+93qUOPy4h/AP5YRQju?=
 =?us-ascii?Q?F3cG+oj2/8raUcL+nqxXrC2uuoDWNCnEVJlKzaaZJlBXMw38nJ+m/nnNu0hR?=
 =?us-ascii?Q?u/DIIJR/HLAq2kRHsN76R2Y6gYLjm5ZrW6UHSugxGwygu+bKqUbpghXG/uRL?=
 =?us-ascii?Q?ZuzOkYisnaIvJ/DHvZkUGkQ8o2xfjdZbcLsNoLJcrl6bI36LdFbYygHJaamM?=
 =?us-ascii?Q?CDrOZGGwliqsBw620+uPwOl467htkho5MRcLAe5hGnHafZnRhuK5KkfnomDW?=
 =?us-ascii?Q?sh8BSwd/bfdzJNJi8Ew7zhIq0kvFxoOYlro+iWwqo9nd8Rhf9SdCS0Sh9XxX?=
 =?us-ascii?Q?9vvwieU73sjZO8NRxWQo8U5x0d4ylYlKIZhhSbbdrWhjUwb2kqcMThT5Ounz?=
 =?us-ascii?Q?15DsTiiPi2wn2RZz1bW7G7r9+gxyzKPzD+ZCKpd4oR1ajWTz6wvT6L5Vw93+?=
 =?us-ascii?Q?Kz3wBci5VvDHvMomna2i099HWdIhG0+Lbt46PffNxhPzWfLifRZ0atBFF/Ku?=
 =?us-ascii?Q?amrJn2Rh/e/yLcpm4YObW3J1DSCDpkdbxI/n+am9fAcamgz7pxu90lN47vqQ?=
 =?us-ascii?Q?zQShc8VYmtzywEPXGlKznkxk4CFpRpHBoEDvS371tJG/G/6lV6ewKJDhjV3f?=
 =?us-ascii?Q?G10buf0VGFvag5cBKXiSUPQu2D0fiGoT3YEXysAcb2THYBWLfzp1Y/Jx2/Br?=
 =?us-ascii?Q?uSvHwbz9Kr7txGbEWl2zzOcu/6gKEtNiYirHkQ68oUXI77Zo+n0liU+r0UVu?=
 =?us-ascii?Q?D2uMSE1rvoeFr+FhFRpO4toYr0cOjY9h6EpMKHcYC1FTCmihUvidNVXaZizC?=
 =?us-ascii?Q?1Gk/vnDuQiA7/Ip30ftTPfd/H7B/UJN5/nFIpJSxmlhcAxn66riDSgMz+cu0?=
 =?us-ascii?Q?PRIaLTVH72+mv8xe7rtlKh65l9SiF7t9KDCtwyLUhLz628J4lOA20DA75M2x?=
 =?us-ascii?Q?71AOEH7Svb9gjcKUCnOXwK94Op2ljlk+hrYP8B0A71oJDzHZ+eb0buNkL5wN?=
 =?us-ascii?Q?cGNtEoD7jGK1spwsFFSF9e/105UuJreXYtOhPl2SEqS+zqhA08dBRaLxF/mL?=
 =?us-ascii?Q?Rvk2y7irch9Hh4aVlzXQk1Q/H7GE400duwKmHAt+UKMOjq68tegCSLL0+NgK?=
 =?us-ascii?Q?8/lRkOBRfBNaHa6FwzSKogx7TRjAwCwwN9p8SEO7BJXnum5dCuQAo2bCTHRi?=
 =?us-ascii?Q?90VC2g/0mqpLgrUbC8fQpqL+XpJ7dEJuXL4GUdp2fAO4Pp5RcQ35lMxF66ew?=
 =?us-ascii?Q?SuPRn6q0+PDJwjfcCnkqKV7zjoch3+KVdbXx7rI9Qn/kChso8myyJqfmmsZZ?=
 =?us-ascii?Q?Pl+tFr9h9IQtrbFwSk/wg7sRFZ4FV9Cpjb+x2w2pC0RNXZC5iWLFnoBYWQ9h?=
 =?us-ascii?Q?bd37z6nobDnsYnVSer55mt8pjl+dNUAIKy+MkCkxF4AprrTVwid34uRvfzxH?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bfba7b-a676-45a9-06ba-08da6fd58aa5
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 13:40:17.2540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6H6NVQolv14Wd5853/riCXgkoui8NFKaYqiKIHmkbCGe+BYf1N4SNrHIkXiGn37g8YSEYQYjgJIVlZ2wAFk9tZNXQT/zShpkCMk3lGxibXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1670
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_04,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270056
X-Proofpoint-GUID: DKEKPMjwaunpKzwCAkrYn63hr9DJ6bvQ
X-Proofpoint-ORIG-GUID: DKEKPMjwaunpKzwCAkrYn63hr9DJ6bvQ
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Yang Yingliang <yangyingliang@huawei.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
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

The "ext_intr_stat1" is used without being initialized.

Fixes: 93f53881473c ("ASoC: amd: acp: Modify local variables name to generic")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/amd/acp/acp-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 10730d33c3b0..f561d39b33e2 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -100,7 +100,7 @@ static irqreturn_t i2s_irq_handler(int irq, void *data)
 		return IRQ_NONE;
 
 	if (adata->rsrc->no_of_ctrls == 2)
-		ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(adata, (rsrc->irqp_used - 1)));
+		ext_intr_stat1 = readl(ACP_EXTERNAL_INTR_STAT(adata, (rsrc->irqp_used - 1)));
 
 	ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
 
-- 
2.35.1

