Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 330CD3F7016
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 09:05:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABF74167E;
	Wed, 25 Aug 2021 09:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABF74167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629875113;
	bh=6/1M/fpeuHjrAsfurcehd1HE6ZIAQVHcatB/zdGJ8aY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vEVl7XKGi0DzA8r45p3Xg7/pbsPKB288XqHC4sZ7q8m1ppgpQ/FBSUocbIN7RvVbZ
	 jTSnFFT/w/BuQEi41+sAH+CD4uYvVb2Yt7KjF6dHQTNomNRRf3/LO7n1P/4z9dQnnC
	 onzLe1oUSqodK787a6CDI8II3KIzSlID6iq4EWxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DC5CF800AE;
	Wed, 25 Aug 2021 09:03:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84012F8020C; Wed, 25 Aug 2021 09:03:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FAKE_REPLY_C,HEXHASH_WORD,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECFF5F800AE
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 09:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECFF5F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="yq8toqiM"; 
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="jdljPEYm"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="wRT1sC+T"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17P6aw3k030398;
 Wed, 25 Aug 2021 07:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=kGeQ6Vj267r2bdKScaHCXYRPX1mvrSL3256DxbIRaL0=;
 b=yq8toqiM7VB+vL3VT4GGcoLqum/m7IQ5Hv1lGyB1ofCTdUGBWlw0QjKSQNxfU3U2DfI3
 yDOvlg2R335bLExaVgWLI/kD4sswVx56QZv2UHpOWhZ9bdXeeRLIEEgmPXw3ZwWmOxhe
 tbZ35A5V9RecYTWvAuK31lY6p9LQs6CuoD1yemgiNuSIlzyYxl+noR9RAreaQ08IqMiC
 IX49fcBpQ6STvLVLQTZIssxH9ww9J6IaCqxOE3Lck/DqhQ1oiEjSUuH7FoKakbPwoPuH
 qK3GBkiR6eT7s53jHB1W2o0C53QkxaoZt2O04GTbaHlwFKicJ7E0/kceWML3k8JB6BCo 6A== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2020-01-29; bh=kGeQ6Vj267r2bdKScaHCXYRPX1mvrSL3256DxbIRaL0=;
 b=jdljPEYmTxHUFYQqs4ffOxdwJvB5GswYK2w9dODZeVZApddrrcFV07NfKJjmscTQiNpp
 h0Owx9p5ursHAj7Y96+dAC2u1nF/ioLSFk+Kds981HI+2QfAWeYF62pCMFk4UpXe4KnQ
 vfUir3pBDrMZvvwTMXMP+5j7xSE0i6LYe0GzxstxK/pKcYRzTa5omXtz/ChDUCfg5rkx
 qJNOS+HAVuVa/6w30rDs2/Q56WoU5QwRyEsB0Syw/fYQwgUIK0g/35Mq6KAhT6NXWo9L
 DwI3VuPiRLG/C4jXsf/ashwNluzsXwU81HS+GQHx9WpqF2xUSgmjn1bUSbUDuiGgCfc1 lw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3amv67avvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Aug 2021 07:03:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17P71TkL035500;
 Wed, 25 Aug 2021 07:03:42 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3020.oracle.com with ESMTP id 3akb8w9nj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Aug 2021 07:03:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsqpJIaxWcFHF6sDPYB9HlLiZ/PbsiQSkL/+4VvjR2Bq+wgRzEAE1K0pmXMdS4V9xcejxpwLl6vBEyq5AGuQyojJjay73oHUTYV/56YONIgs7c9XQ30Qf7YnwArnKomBY3fdFus7p6b474vrz95hLmR0lnhSBy1FZJ3kL9K3nQOqiMYoz9rDxZ4zuPgKKqIrCABL5NaiUcQjvPuQw3gRyTWe7TS8JjpCssJGmXouD6pXPEQpF2VVMmgFgRUuo/JXeRIP+McZkh6+qNcr+ee6qcd5SVm6QG+M3gbyKzyD2oTCp7modaBZjk3brfH9Zr3srMco0V23tOA5K2c680tssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGeQ6Vj267r2bdKScaHCXYRPX1mvrSL3256DxbIRaL0=;
 b=P6j8SU9tjorvRVcbj7yLyG4kYvOLVBZ6TKLwfQ1biHkZ48G47wSYBQOGbENzUgWcmNdjaYDuaqd4dEzIUheI1s8uY96qd7dimx2dlrna5nATVwXGpqiqWBktUjfteLzxKedkSy3D10ezHNKdCKfxIt3WrI1uFEv6mHdvAgzbB/Z67rT4mAh27dKLoQDnvJn9O9qeMy2qX6dXsdHfBBr534X2Q4zfWyjcdK2iwa+m8k9Ot704m8KzEsHEkFxJs1EO2KjYHbxf0TpivHS1uU0+xeVZG+zhsNXTfYl9V5Wp9ShFCfV9thVwaL7USqhmRqSJHkirmM0IEuw1BFNqDVCJWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGeQ6Vj267r2bdKScaHCXYRPX1mvrSL3256DxbIRaL0=;
 b=wRT1sC+TLywDr6Vm6qnnR8cEieDN3+K2a3eIu/mBL6IDsUuSJPMVbvQ2saugYehteTGEEhOS704uZk4F1sZHPK3ErUWeCOcoiW/5FcLjTNASkvy0i7+1sQ5M8qyhXm+gSdw8J3Exu6k7kM+P0uP4fU6x8H2cDew7ivqaJZ8ysKA=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2096.namprd10.prod.outlook.com
 (2603:10b6:301:2c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 07:03:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4457.018; Wed, 25 Aug 2021
 07:03:39 +0000
Date: Wed, 25 Aug 2021 10:03:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Seven Lee <wtli@nuvoton.com>, broonie@kernel.org
Subject: Re: [PATCH] ASoC: nau8821: Add driver for Nuvoton codec NAU88L21
Message-ID: <202108250013.326roo2Z-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824041647.1732378-1-wtli@nuvoton.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0046.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::34)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (62.8.83.99) by JN2P275CA0046.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 07:03:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29b20147-74f6-4492-2ca1-08d9679676f9
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2096FB5AAFAB23D6FA735FFA8EC69@MWHPR1001MB2096.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qbu2L7/Hyqxty/lmW+qxVbbJR6ithY9dOkjT01aBzyGAQ2dL7e39NphtYH1sj5zB/xG35YnvDCF9YW2aUS8x8KPYqdrDDZkydMiI5TnUniZSHVaCtO62FxR4FJM9oGeflv8gJog0oO9UY8dYgv0sSzHKXwpfk6G6k3oPqeLOC/I7oQ5CSgCyI3pMThwh0UQdKpoN6x6CHMG8QsslnSWdZZkDWnej0uW8IxFk+c7Upg1tSW+F23/RxeZIfcc1mfUHDz4sjjYUHSWasNYDi5BIb2rKViGFsa1zOJYTzoaQRcEunW4+jXQHlqoTBU78xYUqeX3hg697JwKIzNYRnRuYc/M4SEoXNYGbs9l8BDlSAGNxIldjwurHzmiRBRQSBrSfupotS5utAlLBuuWc4tbF2FXc/+/IMkgJaWXnZGrRuw8NQdLZoTVNjqFvKI0R7zGmThFYn7iM3Yx4prAlpp73o7wRUZBOwWpj64pmtZkzdLv/fo4EccTREWMq8oMQFlQMD5kPV7Js71bj4EsYw4pBJZ4XCr6xOlwGc1K51/OGM3PA/yxIeG+3wI4hn7X5FYjYjwK/MMVNgFLQfGcWRfy5DEKMdr5LxyNcRzAnGZXdODru8+L2ajoCxoNar0GrhpgxtNwwpf3sPlTcxh8e9/aK1O/QCU3fpTPzAr9GuJrxuYpjPkiWaQ+pFriVQzNE9rrrZZMQ9iV429cIlxSkou1laweRkeYicpX3WKYee8RoOSeqcq+GqVBoJAiguY+tx6i8MyA5IRtZVu10lq56oxhXfZ27W7An1oldmd5XxUrbuypPLWGk4/ansgUmjZwv78On
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(39860400002)(396003)(136003)(376002)(316002)(7416002)(44832011)(6496006)(4326008)(36756003)(6486002)(52116002)(2906002)(86362001)(6666004)(478600001)(66476007)(66556008)(956004)(38350700002)(186003)(66946007)(1076003)(26005)(8676002)(966005)(38100700002)(83380400001)(5660300002)(8936002)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DyOVMbe2zK18+Y7M9JwTAgt3JNyJK/XDXHI5LtCmnbaHkpTtQERusPWuZS/Q?=
 =?us-ascii?Q?cfO+GiHk4nttNL7p935oI+jNqRddwevegfi0SHlS54eO8N4ZYl3PM/+Nr7pj?=
 =?us-ascii?Q?peyBNjj+Y0VsrBQJk+iA5GsQRTjZACtAOL2hwxl/IVJHxmSduYEQ5dzSEuyQ?=
 =?us-ascii?Q?dYjvYSG+G4MS4Q758a14II5mUkW+8auWsGk+kh8Yf4zJ4KdXuj+iZW9q4URb?=
 =?us-ascii?Q?9rYP9D+234pLLOl0Sfdt/81Osxir7Leckv4sxd6rbzd1nxrrCzy26PLM9nKV?=
 =?us-ascii?Q?tUa9TnvGvP40ZujsBi0OWWmM5ZgQe1caKYoIpgRQ4vvVaeusMv/Am1n4qFXZ?=
 =?us-ascii?Q?+XHZ5mqiZ0y4p2ydhj3kdwJtKseMsDjm+Qg6H/pIjLuyS8WzpYUs23feCggV?=
 =?us-ascii?Q?1oNB2cBVb7CH/5F1FDx5h4Hyks7dddQFG+ywpBADgeZneG3NV7JPSvmBEYqX?=
 =?us-ascii?Q?/SBJcAQH0Yi0ftpoyZN1QUKLjkzF9vAa57mFqLgUi1MRSFGvfKTfFLgeLPvB?=
 =?us-ascii?Q?eza16e5HH8CVWPF/qwVVo8jq38HOTqc02QOJ+fw/sLxEuIZguFtoLLqSzknj?=
 =?us-ascii?Q?BOWrVsqahp4gBU4YQjsi1qyLaocT4uh9wyjDdK26UidlPEM983CIsL6/1Cmq?=
 =?us-ascii?Q?8fg7Euqvatr+0On/1FoNqypm4EBi5B9rnPnCjGV3IvIidHDN8kTH3kUcvw7u?=
 =?us-ascii?Q?WYh006wLJ9Q6dUSM05bdInCgYtCwgRUa1p1hgxbMfSzU1MBp/pBNpQGZ29VB?=
 =?us-ascii?Q?5FMq3+INN5UBvO+MsFo5s7glQ8O4eC5ix0gFoF7sBb4qiLLzURIxuojmUCAH?=
 =?us-ascii?Q?JnJli9X8rtCzTl7Ci+60S8kLS4Wckix0WFA33//b4t6yMzPp+7fuMptDUMs3?=
 =?us-ascii?Q?yinowUG3GMLhl+3ULLM1A3yI1FcObHFQbS9q2SD2QP8QG6O9xXs2NF2ZRkSQ?=
 =?us-ascii?Q?j7BXdhVPDFAfNj4rhBkPgHDRMEJ/MiXkkntTU6TWG5T+VKg3AsIfSk60+MaF?=
 =?us-ascii?Q?u0t2yNPpB3ZTW3ueGeAM/W5qdxqJOAEbjCwltFYYleOr2ToBD2mb7jT3BUFM?=
 =?us-ascii?Q?ZCjG3i9D2niuwqBxeHwhyodaikoZNorgyODZz+P8/7yP3Q9YsSFpTcKXN7n+?=
 =?us-ascii?Q?Wv5BFBVUaaxAfXlsbpUm6rXVbCUBCyGlH0ZohaZ3v7pDKXEy8Xw0SYdcwEyn?=
 =?us-ascii?Q?a9uusC8XL9aHkVqwGyFX6wwcgzXzlGUkVZlUXTgu6CCQzLmnNT5DigxAB6TO?=
 =?us-ascii?Q?Qz0Ul9+gsMlnpCtcqWBOJU6cexPRx3Hwt+D2EUNlfKwCECnLmCHZT88zRgOt?=
 =?us-ascii?Q?haf7KeltcEDlt1ZBWiqQCaTG?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b20147-74f6-4492-2ca1-08d9679676f9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 07:03:39.4810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aL/AmFISRcU8HUBhyb0nNIQfKrGD649UGckJvlP/r6NJjFIvl3uw21tjwbfu6BlYb1tv6rAUMlPdmocc/5KKxUxmq08EUw3q5Os405SSSjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2096
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10086
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250041
X-Proofpoint-ORIG-GUID: YjPfbxMS9Zjh-vn2o-VJmKl3a6BmP2xs
X-Proofpoint-GUID: YjPfbxMS9Zjh-vn2o-VJmKl3a6BmP2xs
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, lkp@intel.com,
 Seven Lee <wtli@nuvoton.com>, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com, CTLIN0@nuvoton.com, dardar923@gmail.com,
 kbuild-all@lists.01.org, supercraig0719@gmail.com
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

Hi Seven,

url:    https://github.com/0day-ci/linux/commits/Seven-Lee/ASoC-nau8821-Add-driver-for-Nuvoton-codec-NAU88L21/20210824-121846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: openrisc-randconfig-m031-20210824 (attached as .config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/codecs/nau8821.c:456 dmic_clock_control() error: uninitialized symbol 'speed_selection'.

vim +/speed_selection +456 sound/soc/codecs/nau8821.c

429cd8c43255317 Seven Lee 2021-08-24  419  static const struct snd_kcontrol_new nau8821_adc_ch0_dmic =
429cd8c43255317 Seven Lee 2021-08-24  420  	SOC_DAPM_SINGLE("Switch", NAU8821_R13_DMIC_CTRL,
429cd8c43255317 Seven Lee 2021-08-24  421  		NAU8821_DMIC_EN_SFT, 1, 0);
429cd8c43255317 Seven Lee 2021-08-24  422  
429cd8c43255317 Seven Lee 2021-08-24  423  static int dmic_clock_control(struct snd_soc_dapm_widget *w,
429cd8c43255317 Seven Lee 2021-08-24  424  		struct snd_kcontrol *k, int  event)
429cd8c43255317 Seven Lee 2021-08-24  425  {
429cd8c43255317 Seven Lee 2021-08-24  426  	struct snd_soc_component *component =
429cd8c43255317 Seven Lee 2021-08-24  427  		snd_soc_dapm_to_component(w->dapm);
429cd8c43255317 Seven Lee 2021-08-24  428  	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
429cd8c43255317 Seven Lee 2021-08-24  429  	int i, speed_selection, clk_adc_src, clk_adc;
429cd8c43255317 Seven Lee 2021-08-24  430  	unsigned int clk_divider_r03;
429cd8c43255317 Seven Lee 2021-08-24  431  
429cd8c43255317 Seven Lee 2021-08-24  432  	/* The DMIC clock is gotten from adc clock divided by
429cd8c43255317 Seven Lee 2021-08-24  433  	 * CLK_DMIC_SRC (1, 2, 4, 8). The clock has to be equal or
429cd8c43255317 Seven Lee 2021-08-24  434  	 * less than nau8821->dmic_clk_threshold.
429cd8c43255317 Seven Lee 2021-08-24  435  	 */
429cd8c43255317 Seven Lee 2021-08-24  436  	regmap_read(nau8821->regmap, NAU8821_R03_CLK_DIVIDER,
429cd8c43255317 Seven Lee 2021-08-24  437  		&clk_divider_r03);
429cd8c43255317 Seven Lee 2021-08-24  438  	clk_adc_src = (clk_divider_r03 & NAU8821_CLK_ADC_SRC_MASK)
429cd8c43255317 Seven Lee 2021-08-24  439  		>> NAU8821_CLK_ADC_SRC_SFT;
429cd8c43255317 Seven Lee 2021-08-24  440  	clk_adc = (nau8821->fs * 256) >> clk_adc_src;
429cd8c43255317 Seven Lee 2021-08-24  441  
429cd8c43255317 Seven Lee 2021-08-24  442  	for (i = 0 ; i < 4 ; i++) {
429cd8c43255317 Seven Lee 2021-08-24  443  		if ((clk_adc >> dmic_speed_sel[i].param) <=
429cd8c43255317 Seven Lee 2021-08-24  444  			nau8821->dmic_clk_threshold) {
429cd8c43255317 Seven Lee 2021-08-24  445  			speed_selection = dmic_speed_sel[i].val;
429cd8c43255317 Seven Lee 2021-08-24  446  			break;
429cd8c43255317 Seven Lee 2021-08-24  447  		}
429cd8c43255317 Seven Lee 2021-08-24  448  	}

speed_selection is not initialized if it exits the loop with i == 4.

429cd8c43255317 Seven Lee 2021-08-24  449  
429cd8c43255317 Seven Lee 2021-08-24  450  	dev_dbg(nau8821->dev,
429cd8c43255317 Seven Lee 2021-08-24  451  		"clk_adc=%d, dmic_clk_threshold = %d, param=%d, val = %d\n",
429cd8c43255317 Seven Lee 2021-08-24  452  		clk_adc, nau8821->dmic_clk_threshold,
429cd8c43255317 Seven Lee 2021-08-24  453  		dmic_speed_sel[i].param, dmic_speed_sel[i].val);
429cd8c43255317 Seven Lee 2021-08-24  454  	regmap_update_bits(nau8821->regmap, NAU8821_R13_DMIC_CTRL,
429cd8c43255317 Seven Lee 2021-08-24  455  		NAU8821_DMIC_SRC_MASK,
429cd8c43255317 Seven Lee 2021-08-24 @456  		(speed_selection << NAU8821_DMIC_SRC_SFT));
429cd8c43255317 Seven Lee 2021-08-24  457  
429cd8c43255317 Seven Lee 2021-08-24  458  	return 0;
429cd8c43255317 Seven Lee 2021-08-24  459  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

