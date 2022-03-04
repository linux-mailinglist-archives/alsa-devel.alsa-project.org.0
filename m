Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 804774CD4F0
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 14:15:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04DCD1A2C;
	Fri,  4 Mar 2022 14:14:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04DCD1A2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646399704;
	bh=Te9N51vVYwGUDdTzpmgXcx0jUao+FIWMyxo9IlrHnL4=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=M1loNUR4J9T2nQ4L67TodgDrDN2FelAqA193dM1vXAAfgwZwPcxNzYEyVGTyc+FmP
	 3rRa1wPPsosFmjXwQ8HRMMWYr334SAS9sMr7l0lXNmaBpdzTZ5+Un9ipPfmdz1ISHV
	 IXOkgc5+eev+wj/uDlnGVjuDDEiCPI6s+ErqMH9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB38F80139;
	Fri,  4 Mar 2022 14:14:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6894EF801F5; Fri,  4 Mar 2022 14:14:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D931F800FA
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 14:14:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D931F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="xvac83cy"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="HoKgtxfE"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 224AB5uG028323; 
 Fri, 4 Mar 2022 13:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=Ir1WHdhUTxtlpTlNhlwajmOOSW0sEgl6p+SRqxhLYto=;
 b=xvac83cyJeL65+GjOj9mo9yE5O6DA1h1tPTsJVvO3ACwiguaMcm1KUbE2topwAk9mVYz
 hEpLHRUaWv3NZc54GQgFjsPnWmGnA5YalyO0DzD+9XkGHMzxXIqBSf916XCsEJ2Olldf
 HDBiR1EDyPVhQlUNEdHhPmfNL8wTgF0Xt7gOyxJ9mew7/8R0HKUDK6O3p38Zr4WtsQhF
 ImYDze9SKDheHOsDww6gK887hBjZsLWzFL4M4S5MdKxJgj2lG8zJI90pZ+hJrc9ANaG+
 NtxdOMIl1ERW/0u55BBO2ZT24L729R/Nob/2HJGay+0LhSoaYDJLTtF9aS4P4BPG/4+H Ww== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ek4hw1r0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Mar 2022 13:14:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 224DC8P9045081;
 Fri, 4 Mar 2022 13:14:05 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by userp3030.oracle.com with ESMTP id 3ek4juacv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Mar 2022 13:14:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pqz2xM8rZuknsRPPF2tlqR/HYCS1lW+aXawadkzKWJSztPiK5PScJ0akUaanCKYTCGqhP78D94mjYhk3XY2Dltzq4BNVwjsqOjyDQl0hF/r5EPF+ksfk1fY4KAtb76DEovV16QH9PLO/EY7J0ukQ9A42i3YZ2UvI202dVAyLl797Q1PPup1KaLXcW+hEkBrEeioMQWG6PKaQWEnlILEfcWGuRJODc80mnY+gkGzxxVZXZeEipmYAwVuCm9ryYn4uzSPhS2ggW9ru2SP2eTkEBOvXuYD45nVZp/02PlbAjB3E9jOxjvg60pmr/8IY9kF5VB+l/irQW11QV29BV3TMMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ir1WHdhUTxtlpTlNhlwajmOOSW0sEgl6p+SRqxhLYto=;
 b=huj+jN+atVeCoY4eeqpNsf4dIY/K5qWWyeTq4qJKPD5Q0D3x9Uei0JYKH2tqYcrtuRV3v+W9lYEVWABan1Mg4BH+sSDLA6P/YVm3cXtancBIxZTG5y/YwfgoEOuCFC6wJUb3+DvjdRLvbVxpALYRDA1itVcJ46uSxBjeXkWN2mmV7NPy5LuWhEXfcwPfuCoR1KMWkCqG54CtQxsKA9qFnC/CxkGsc9OLITukDxgvvyvIYYPTDq2RNHHdsTeU9zkfq357oSpCz4QpbzuMedS27SY8EmdgVO+0SrH/DXIgS+YBTFY7Va2tBqXMiBXZE3HDJz8wQo6J5XyjQgwjvCP9Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ir1WHdhUTxtlpTlNhlwajmOOSW0sEgl6p+SRqxhLYto=;
 b=HoKgtxfEVZfHKnRWytxTKwJZzzPebSChnxopcC+kdEVoq1yec0bjkSIgYiENOOhl4r/fsda+8yvIhX1ecPHEwZAGEOl8rPHyNyB7xsHhmn0AwOzto/cUGJVE2GWt+gsHujiiOhCWGNkAnklF6yTGtOUwjXWqTPIYmnOFiwsgM1I=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3142.namprd10.prod.outlook.com
 (2603:10b6:a03:14e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 4 Mar
 2022 13:14:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.027; Fri, 4 Mar 2022
 13:14:02 +0000
Date: Fri, 4 Mar 2022 16:13:35 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Meng Tang <tangmeng@uniontech.com>
Subject: [PATCH 2/4] ASoC: amd: pcm-dma: Fix signedness bug in
 acp_pdm_audio_probe()
Message-ID: <20220304131335.GB28739@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304131256.GA28739@kili>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0102.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06e5f7a3-2916-4de8-682d-08d9fde0d9c0
X-MS-TrafficTypeDiagnostic: BYAPR10MB3142:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB314261A1E5AF85AAC3068C308E059@BYAPR10MB3142.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yXyhPLOpm4G/QOSGZXU9k9W1RRhRS7zpISLoumMij2xeV1C3uw1383JNHsfaCj0TV7fs9FNfQioQfcQJjkQSa1Z+6+ksa83f3nt4yJXea52mdKaNpNrlTntfkAYMxdPPLMmqvCr5of6Zzt1Sz/RwGYHsG1ybOMTa9SsXP3uk7SUAfn1OeR4b60Q2vgpB6L1yiShXensB5FKLZPGxUQxBr2yFts14jgGOzOGXuaUvV4evEaxI98ZDZyUUntfq7zi5kz4vGxWktco9UQV2okv7TdHkYgtiWPTviMmgnsmI0Gwdgdop7PtewZhWneIRknT5+nUujJNfpTbZYS7cjyzmMmdwzMNF5Jn3FFjewPKzSaXgRKp5+NeaEgof6UTbjS3PRvb+a8k3sDuFfLL8/tJo8LZCx0PjW3IQpyDl0AJxLPGphm+sIIIQImbY/7H5To9IbtqJZbOpuq3HJudBT65m/t0Qq5uiIA9QJh8yqpNGekLkBsm6U5ekm0UMOzmDi0nWKpBA3/MpzH9reHsUsE4IjEpjCcqy1RywD9tJa1qgLhNm7+NLyj6MSe4rkskSMceH4LlMHBGq7LtsHyB9aAYnFh2Ue5xh7iUMilpR4PwlbS3tkkAEaax8snzUC4KSV3QPuWzOs9o4jL+ToG5CgDdVEsC8M1IhVmDG5AK9DDEYGIvu3XJ379V/7exFw/5HnzDiQbw9+p5lPyY2Q4llex6WOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6486002)(83380400001)(186003)(26005)(1076003)(33656002)(6666004)(508600001)(52116002)(110136005)(2906002)(316002)(33716001)(54906003)(38100700002)(38350700002)(9686003)(6512007)(8936002)(6506007)(4326008)(4744005)(7416002)(8676002)(66946007)(66556008)(66476007)(86362001)(5660300002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?StZdT22dmXEO6k+pqMVH53fRPBlW97nDDVuUGUdaXkW3sbkiDh4FUw0wOee5?=
 =?us-ascii?Q?r91DKZhdbQXYv9x/ZqoSAJhuLJ9GcgVUe0/RNKibP/9fPdmm412ciVPksk/f?=
 =?us-ascii?Q?p4i7Cl9R+aipC/OncZmW/DTipJD2MdqBsFpTXwwxj5kGtvmRnI7R6tLeFJ46?=
 =?us-ascii?Q?3spwD6s50+hh9JHkanhcL8ONUd5EcDviBrwCFVsNM5HADMGo6gIBJReAWCMn?=
 =?us-ascii?Q?qi4Pt11trLjfpIcDOqbZTP+EiI9G4jjajd6tu2K+Q3rjcHBjNSmcHZkiJWJw?=
 =?us-ascii?Q?LzVl1w2+9AH2n8bOckJD4zzoQeIQlZpbr6MtCA4d23X0Yy8Jdi+w6J7n7STo?=
 =?us-ascii?Q?J3tw5GFwh51lnH9k+jOPhDaH9s3pM4VaWUnIfBP0NvWYwJKBT3ajBYW95Haa?=
 =?us-ascii?Q?nduYTYJMp0ppxfZmj7jX0By/gKtacsT7bxoVsOGrOnz45NmNjRE7EFNkYTi6?=
 =?us-ascii?Q?GSO4SAdsokdSvMzU8pf6P7c91+gQ9mUAnbORkJGcyRchQ9oXW/BUPb2u/Zdh?=
 =?us-ascii?Q?tXuJM2E7pJiFNC4bNzUk6ss31Ui87u251a9dhRe5U7zy9YUrqr6kwnZEfgxl?=
 =?us-ascii?Q?zzmsybubU9ByDjFjh5Ea5CLN9Jdg+/z+L0fPWMHNqLxOYXvBO5qDy0d0qdLP?=
 =?us-ascii?Q?FYU20W0B/dd0ZlKwvbtZINXHdK3+Cpqcw5PtgtDIinsFDpNs0i2xw0MB8v8D?=
 =?us-ascii?Q?DigTIvZLUTQoCnxO7FeKxj9H8NCPdBR+ybwgmOnKRnEzVnkuWMsmUFL2RNYe?=
 =?us-ascii?Q?CRZBeKEEt/FZ0oBiH0MEPOLcoZUx7Thrc9yG0zO1Q9WbJHt67MIJ8MIZKFqb?=
 =?us-ascii?Q?U890lkXQ2ByD9GVU2FtXovi3SUiYjvw5eqBUwOQX9qoBxp59EH5tam6ykVPo?=
 =?us-ascii?Q?3rpdpYR+HAjbaHBeXPGIHcN7lh4g1bchKs0PECRz3+PkK0PoB2aOePBLwO/f?=
 =?us-ascii?Q?mKE/IAyxhQDUrt+k35mTZWhGOqTyn9EuKhAwNM7uZzpn2bododBwBTm12dP0?=
 =?us-ascii?Q?tQLYwqOPtbWmfEw29YMJ+oITRb0fHiqQfmtmX4a38B/AqG7i6UsU9vDXEtzH?=
 =?us-ascii?Q?digBYadPYYw9mWUTk/wapJzvfj/n8BD0cxHDSJRnElfCP9+7mOPOUz7AItA+?=
 =?us-ascii?Q?QUEePk9nevINURoR/wUGQZBitgr7I8P8TY+fxezEwFciC+DniXdcyAfsYbfn?=
 =?us-ascii?Q?fUzpf4Qk2urmInRmIiM2tW4xguvGKMzNgmWbCpIKWLodG1iE2EbL85jWHDjZ?=
 =?us-ascii?Q?pbSNq7PQraF7DJaKyJHvXebHuC9RUIdvajuJLsb37iIYmcvuHS6cOi2Jjwna?=
 =?us-ascii?Q?OZsrXEl/NlDqfP1z2ZPeEp/iEbY4Q9f9oPucrhyS4BtCJR1TSy89E1JP73xV?=
 =?us-ascii?Q?pZcbcryhNsxv7UrBaqMKkA3BZgZbGh1ZEkAjKhaegl+xd4sAdA3o9SXPoYvC?=
 =?us-ascii?Q?b4WdyGMiMILO+rt4Z1qRnUr97v8uOFeihR/WrtxMNPLG7Z8njbhAs/VMUOKv?=
 =?us-ascii?Q?QSZZ7DLNbVyIMFFqUlBXEenV8H3At8dYp0r/7VQ5edeKLKSXdMtz0ymZB621?=
 =?us-ascii?Q?dyfs0QDxKjDdyeBKQbfLGNmxTzLBoV3BmlIv55y2uwFeHMxzVQwkrDrIEWce?=
 =?us-ascii?Q?aISsK7EUZEg6n+MuwOoaxue0Da6YXJYt6gaTdHfcxTvKqBOULWg4d7CUBFQm?=
 =?us-ascii?Q?FNrXkw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e5f7a3-2916-4de8-682d-08d9fde0d9c0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 13:14:02.0840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZkyZX73YdgPScEvEXM0hXo0mwW2WeVI2JDduNdHMtD5bKIZHpW/RlDU8q56UTqbYKP8QcJjgk5Ja7d7biKyhPwzi7HYhGsl/NBETGPtNjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3142
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275
 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203040072
X-Proofpoint-ORIG-GUID: tX19RxmE3-2sSlCV6nSCWR8qXg-IITla
X-Proofpoint-GUID: tX19RxmE3-2sSlCV6nSCWR8qXg-IITla
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Ye Bin <yebin10@huawei.com>
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

The "adata->pdm_irq" variable is unsigned so the error handling will
not work.

Fixes: 87d71a128771 ("ASoC: amd: pcm-dma: Use platform_get_irq() to get the interrupt")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 88a242538461..8c42345ee41e 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -399,9 +399,10 @@ static int acp_pdm_audio_probe(struct platform_device *pdev)
 	if (!adata->acp_base)
 		return -ENOMEM;
 
-	adata->pdm_irq = platform_get_irq(pdev, 0);
-	if (adata->pdm_irq < 0)
-		return -ENODEV;
+	status = platform_get_irq(pdev, 0);
+	if (status < 0)
+		return status;
+	adata->pdm_irq = status;
 
 	adata->capture_stream = NULL;
 
-- 
2.20.1

