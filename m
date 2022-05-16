Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8CF528048
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:56:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA4BF1666;
	Mon, 16 May 2022 10:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA4BF1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652691380;
	bh=/mNBGkYUhb//xLhEsKiHbauhwUEVXHF23nj9NGbxVJE=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WU/WefXcDAM4mxHS5uAZXd7/2GrG95lzxBCJR8LDYGNAZpstXqsiUiOOh/efI1dm3
	 VmS6JZNLYq+vI/rKP9GUpfIf5iOnobQFVzptuCfM1zEY2tngnR+ETFP7BALnm944g0
	 zbJW2h5HhWtDESdr9Wto7w/ULzjffyIqZRkTTmcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5310AF80171;
	Mon, 16 May 2022 10:55:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4014F8014B; Mon, 16 May 2022 10:55:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FE50F800F8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 10:55:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FE50F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="IyDGbfJO"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="KB4sKrn4"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24G8iX72020796;
 Mon, 16 May 2022 08:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=QJ/z+bRqmjJiUjImAJv7D5GACrt/T6itupzqqBchyD8=;
 b=IyDGbfJOqY1iG+NMhPs5Ft7lm5fRR5awqV1/zy2vWr4h0naFTXxsJwBbRzNdHLjdL/P3
 bEtrVIqQQAZi8l18rUq2X6xsP7sJxQkijrs+7uBMUb3MLMc+LARU4ttPOwvi8CMl6eq/
 vPs7sQLER5fVaNWqnaC9cBB/b6hW3voZkzzFByn/Mc2YRvHDNSO0f+f5C+NXQX2B7fwq
 ivEb0VFO/Iv/CweTv4FPdn3LhO6XwrIEEGAB1QFoEbMaQVYhOyTz7ZEC/DCoiPDkTki/
 OQE4pHhyxPvbGds2AlsnLS84m+rvDPXY2aWg8gavYypnAdIb7SRlmX+2o8pRYc/CWDfo wA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g2310jq0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 May 2022 08:55:12 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24G8pbU4027982; Mon, 16 May 2022 08:55:11 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g37cnnk7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 May 2022 08:55:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXYzL+RNEsjHOnq5lgs5eMpUaz3Quiozq3Pv7RnjR/0MHD0CpzTIKj59oHNHsKcCI+NGi0bI4XvJ60f8kUA92e7TO+49RLQ2dIH3Rxdovxz/yB7I9+/y6uKUhJ/ZfY9RaKPLdz8CNQAhiHFN0Ab7Pd91GQlzd3WI5CdEB9HacTNNf2la7ITjZq6SzhTUkQNdmg+tWtMDCFRnjlEe+LvupXn96rFyzkXK76N4wVNA/7CGbSoLySi3UvzJRrWdCjzqkuc8cj3uvBBCxU5WDG40q/eDwgymCoXZrM37IG8tVi5jqvFR1wGmIZl3t4amdRHsdKAHg7xg6GwxU5oG0zqRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJ/z+bRqmjJiUjImAJv7D5GACrt/T6itupzqqBchyD8=;
 b=UfCuuHVD7xxks0kuZ/meD80tFpD6iH6XgaTdPY9LKHLIwvXFuwcK1Ui+maLR23m67JojJImQFFb7ViSM508ragE5jHhG5Lv3dSBwJCey3MwFFA4L2TkqDrh8ovfK7aOHQ7ETiASdRsujjJtlb6z3QZKn5knT4ddyt8jHsaquwCRl/4a4mslb7EYCDWyHA9NtZES00In+GX1/VpoLAwczhdChlE28yI/V4kLxoGsy2xt/+73pt0n7R0WKGFMvILNxp+B3YcT7fOP0QlnDVfH7/Ax+Ikaq7Ui3VPT9B0uXwT1AA7xLsuBiIV5mOvIJPIFz+HJ5SglORtQ3qGEjhinIWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJ/z+bRqmjJiUjImAJv7D5GACrt/T6itupzqqBchyD8=;
 b=KB4sKrn4Ep5tXpgNt99BU6lnKIVQssp4E57x4wHnC4Dk74yLMX12J9249ND7Ci2PaHeM7xsFoW1ZXAbl/PwsGNivmAts4cJd1/Z7VEQv+M6m1Q14P/j61yYfKiBij/Z/rexapZK0UyhkV5h5PKEga8rMH6AZzLZwtH3BdDoRC0g=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB3853.namprd10.prod.outlook.com
 (2603:10b6:208:180::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 08:55:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 08:55:09 +0000
Date: Mon, 16 May 2022 11:54:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: peter.ujfalusi@linux.intel.com
Subject: [bug report] ASoC: SOF: ipc-msg-injector: Add support for IPC4
 messages
Message-ID: <YoIRY9gXIlSK+BLb@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0107.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e7ab93b-746a-4c0d-361a-08da3719c788
X-MS-TrafficTypeDiagnostic: MN2PR10MB3853:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3853CBD15ED6F8A53EE00BB28ECF9@MN2PR10MB3853.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qvxmboc0eh3I94p3F/sv5m4/88aO2lib/5l30G/BfojuT8MUCGqUL33NCfJJFeEwz0297rZwDZk2P5B1rAePeLP/bf+5C14Pd269w/frRTwM0zN3DVIaCj7BsRAsGZAomAh8OwEIk2zsYC0cAK0LmxqLkMuVZ+sru22dXhvWxYff/BtHthomuRScnsyerbGJTme7KIcxh3eru31mjuK6Q4yoHFXoD7vaRR8Wo8roZvg3gINOIiTknZqKjfesIqeSUZNfmsyJ/NFAIn98b+4OgYaaYOkULUSxV4UUCTvOuZCReJy4fgbqKFjXwDJfp/y5VueN6Wlukgq6/Z5INCijv9c5hN/K9NSa4bYHbPh2jlphpSBSIfPnjbmJBE523+I7SiyIiVCkHVKCzZ710DxITgCWKe4x/SboNKc3dltflRnT/68Wxm+7OJfJ3EFXDtS96wNOYOoYr2elDF0Xc4qCW2d2IbH4qalyGb/tdUAo9x7me72NOx8i3vQhPFiF16srTp9WbDEVx873lmn4rqoRhcNm6Xycn/YpTBPJXkqBhl7e7jb4+7TE+w+6VPhRKykE3bHHvcFqWXXSG4krHZnMYDREi1RXZcuWRgIFf4iqS56bnC+sMqgUUO3G7DZPER1bEOOGzifr1unCHoOAto3ur53D2FbQCYjD8zclK204ALpMXSz0a9+FT+5ePZboLX4P3UA5jafW7gIVNeyP0fnMgQRDBRku8Jo3tAkwOXQ5otg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(2906002)(38100700002)(6916009)(6666004)(186003)(9686003)(38350700002)(26005)(316002)(6512007)(4326008)(86362001)(5660300002)(44832011)(6506007)(33716001)(6486002)(8936002)(66476007)(66556008)(508600001)(8676002)(66946007)(83380400001)(52116002)(15650500001)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zWeDqWZFGvBuK9DyjqCyUiIGW+hSU+T3i23F7554ZiGRyuV9VboLTvz3++UO?=
 =?us-ascii?Q?hwKX8kb1iLYcPi0cHJPMvvC9X7VSnqEnlYZ3TonAqddK67yxfPCF175Ym6QD?=
 =?us-ascii?Q?v1ry5rClD1WUm2OpZgr3xPRsD6TRCdMWvE9AynMQCbY2oh47eaO9YF8b/x9Z?=
 =?us-ascii?Q?jO0s3/1Wo6l/Kwk823pdVOnmBC18k73mahFKDU5M5CO3LZov8bXkdvC6Oyfj?=
 =?us-ascii?Q?vagHSTsmYjmFFjUQpai6OAMizgHOJiSOLCXrv1ZypoKHKR9ldkQ8NDzeeR0s?=
 =?us-ascii?Q?i7LaLka625ZUWQg7OuLjBfOnLmsxiAQHpD7tsZV+sopNkX+n9fXFCi5HpQOz?=
 =?us-ascii?Q?7bF7qkRaZoCHCtUfoPV5dEuOaT7Jou5GTp7DOcYVboE2nC/76YP3qwTr/68P?=
 =?us-ascii?Q?fXRrXLFKHV0bgxqY8O9Us6eiL65s6a5uG++CX56wuOv7N3Ep/gLFCRlwhWzZ?=
 =?us-ascii?Q?STRMnZMGQJSmX2EoaHXYwJTFH/d1XXkneXN+JsCiQE242YRB+1t3ccyLSWaF?=
 =?us-ascii?Q?6ltcZusQ01P8w6txQ5bL61jJGLqkkLKRFvj9Z3ukH/JswblQCDLSR7nfnuWT?=
 =?us-ascii?Q?UeqKj23PMf1BKduInvlHk5PDvwX/jSdgZUC4wPX+ZTZUA2megKJkvOka41PI?=
 =?us-ascii?Q?woj+VI/gUP0yPeZLFwxczLkEx0jeU8gL/o1BHVPCKx6EofIA9/VyJ7PmIl3n?=
 =?us-ascii?Q?fcZyNmAPxRXKnqURA0DYQwtx3E93qj3zyKXfw3B/osX+2Lai6P0V7/PB7ed8?=
 =?us-ascii?Q?5Ebc93e/8bAgSjBGlbW0dSrVlFXQZvPLb/vkLlXeDLir/v99YinWSnBcwTCv?=
 =?us-ascii?Q?U5o7OqkzA5wQSfkrpje06JAroR6rgCCMLml+CbTOxo9CfSqvpcJwpxFVUVHt?=
 =?us-ascii?Q?iKwS0ok6pUogPlL770B1kKanN2BkZLBGkENM0E+pKmGD5K1xRi3eTglye/7W?=
 =?us-ascii?Q?yVanQG08HkKrVJXE9XJLCLRh9/8j/WzTNdhQU5pUGivDtxgzhFPyGk4ss92W?=
 =?us-ascii?Q?+y8Je02xxWrOOaGPevrXzf5Dv682dnYRXVWuGQ627DWREUPEgXKOxNbBXbdP?=
 =?us-ascii?Q?x6TOpmINnQlnH5RNJAMsStM7WH6vZjmWfmRlzRPpycoofrZHUvu9YHcFN0hT?=
 =?us-ascii?Q?QKiE9B0NP8+cqPpT5LGqhTIadTO5yaqvJD70J5M1QHx6tjpGqziwUTVhl8yk?=
 =?us-ascii?Q?gjOb5+pmmjMQVbaMiv6REOOcrDoHPF6QjZuN6h+h1jFaG7++RCOP0AQ+hRwJ?=
 =?us-ascii?Q?sSZqK3vprERiATtgwWJjgqXwLLt+A52taH0Jrd6SlLiS7/gP8hp4tt0UHjiq?=
 =?us-ascii?Q?ImK+RSDBlwD1204J5sZECoRHiBEAyfeev19niEyYawmZksIJujsd7xxz/Ar/?=
 =?us-ascii?Q?ZDHGFNmL4EZ1MbBmocHqkJeWv403HYGFjzUk9Zy2EI2euu5aHuZMT0ywK9At?=
 =?us-ascii?Q?9c+6q54r/XVroE11n7Bbm53SsdCTUmoAodbhwlQe/tRErt0lTb7H1rj91v7/?=
 =?us-ascii?Q?7OrCVL1HZ5oVYx7UBlgVzPYmIZA1zG6zJIGptr8o0FxcCwPxJ1AFpcuxMUJa?=
 =?us-ascii?Q?1KJ36MZJYSdwZUdwJMbWLowlQa1s/jC1LnBGU6pbL1k0LCK4UOb94mBaNdiU?=
 =?us-ascii?Q?1xGrGeWJ7UNT97D9ekGpS8JMzq24sBJ7IXRvyxknTH+Cl/mCp/VPsb6vFe9C?=
 =?us-ascii?Q?PFS0EU4rq17ze0bjCBV4S9bYf2U2VHhXR6tQAuAaqGVoyaX0EQNHDsIvc3AL?=
 =?us-ascii?Q?fUGloxFVRL42QBw2jEvzzNv6yd/mWSA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7ab93b-746a-4c0d-361a-08da3719c788
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 08:55:09.0930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bArd3N9nG7e6IqAsTG9cjrGbDq5WNHjLe/UmWFXl3ewexFaBY3ynIFeF4EcYRA57M5mll1qRAAtsUY2N3qbzAmJLy4stg6cogUzlrUj+AOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3853
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-16_03:2022-05-13,
 2022-05-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205160051
X-Proofpoint-ORIG-GUID: YZs4mRYZQScZ_p4MycRDanQv_lb15hua
X-Proofpoint-GUID: YZs4mRYZQScZ_p4MycRDanQv_lb15hua
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

Hello Peter Ujfalusi,

The patch 066c67624d8c: "ASoC: SOF: ipc-msg-injector: Add support for
IPC4 messages" from May 6, 2022, leads to the following Smatch static
checker warning:

	sound/soc/sof/sof-client-ipc-msg-injector.c:95 sof_msg_inject_ipc4_dfs_read()
	warn: userbuf overflow? is '8' <= 'count'

sound/soc/sof/sof-client-ipc-msg-injector.c
    72 static ssize_t sof_msg_inject_ipc4_dfs_read(struct file *file,
    73                                             char __user *buffer,
    74                                             size_t count, loff_t *ppos)
    75 {
    76         struct sof_client_dev *cdev = file->private_data;
    77         struct sof_msg_inject_priv *priv = cdev->data;
    78         struct sof_ipc4_msg *ipc4_msg = priv->rx_buffer;
    79         size_t remaining;
    80 
    81         if (!ipc4_msg->header_u64 || !count || *ppos)
    82                 return 0;
    83 
    84         remaining = sizeof(ipc4_msg->header_u64);
    85 
    86         /* Only get large config have payload */
    87         if (SOF_IPC4_MSG_IS_MODULE_MSG(ipc4_msg->primary) &&
    88             (SOF_IPC4_MSG_TYPE_GET(ipc4_msg->primary) == SOF_IPC4_MOD_LARGE_CONFIG_GET))
    89                 remaining += ipc4_msg->data_size;
    90 
    91         if (count > remaining)
    92                 count = remaining;
    93 
    94         /* copy the header first */
--> 95         if (copy_to_user(buffer, &ipc4_msg->header_u64, sizeof(ipc4_msg->header_u64)))
    96                 return -EFAULT;
    97 
    98         *ppos += sizeof(ipc4_msg->header_u64);
    99         remaining -= sizeof(ipc4_msg->header_u64);
    100 
    101         if (!remaining)
    102                 return count;
    103 
    104         if (remaining > ipc4_msg->data_size)
    105                 remaining = ipc4_msg->data_size;
    106 
    107         /* Copy the payload */
    108         if (copy_to_user(buffer + *ppos, ipc4_msg->data_ptr, remaining))
                                 ^^^^^^^^^^^^^^^
Potentially writing more than count bytes resulting in corrupting the
user space memory.

    109                 return -EFAULT;
    110 
    111         *ppos += remaining;
    112         return count;
    113 }

regards,
dan carpenter
