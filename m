Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB88D5485A8
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 16:12:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4020A16A9;
	Mon, 13 Jun 2022 16:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4020A16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655129538;
	bh=Ka7cuPZbx+R3RPLLyLH1LB0TH8k1bZTXU/aSCm4ry+I=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aEjfpYGLn3CzsgCYEHXLC1FOzvebquTkqcnB/nYX/aEeMVmHtjMZyq2lge6TMNgqM
	 mSfQOsJTZAWHtmzS2/tfEvGQxJ5wNy1S7MIHNVzuydggcJ94kn5Tp0gLMb7AoPZRci
	 PSyWz13nmXuX5re8oDWunKzLL5jO/nyyNcGX0Lgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74EDFF804CC;
	Mon, 13 Jun 2022 16:11:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BE82F804C1; Mon, 13 Jun 2022 16:11:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83967F800D8
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 16:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83967F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="ZurQArc4"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="l1PVkjaz"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DDYQeM029283;
 Mon, 13 Jun 2022 14:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=b/l3yrycg3WPa36WCnWRvTrdUBKt6NjAXtQe2Aqu00I=;
 b=ZurQArc4tQ5MHX/fEGd3MDPQmo1BZlUx4Ut7FGOC+msp2gOvcxRhg5bNK2lH2ZEYStcy
 QaNI8gyy3U/rZZVi8C/jYvHczO8uvCeW+QSgoD/FaQaTe5klEXybODtNA2/Gzaa5YVMo
 a1nyksbdOxb09LWlqupPmUBB2qyFNrOp5G+10Jh9cV9BO/983AOZm7gGS0QCflc2hGls
 JngLepnO7X8bLMxcUTJXd0A9xGm1w2vdWRyTL6BTXrj6Ljf4WSUUsRY3ywaoHZzwTv2P
 0mw+6ccRAbjP2XMpgIKZ+R4+wamKmURz23gex4f0B5OhfkGcCfX5dUNqNWdMU32hVliR dA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfck707-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 14:11:07 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DEA6XO011191; Mon, 13 Jun 2022 14:11:07 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2043.outbound.protection.outlook.com [104.47.51.43])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gp6me0a48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 14:11:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9iyG9AExM6joDlFMq2R3MuE9uNKsX54/UJb4Dm+X1cvaosa9QCuGjoe+S6GOlqT7GnwsMfVxJrcc3mVwYD2cvfH1oq75hHtZH1FHhlLHzUFExRf73mTsUEECk3e0y4gTERPZ7gxKYZw8BQBsG/3PbwNhtVEpsrBT1jpX+Gqx5wF0jdi6VSEzHq1VOhSQIovZ3iD3vutTCOBU/aWGFC1CL77Xv1vq8Ey7cXkOg6x9LXhHKgsu4mZg6qkLAvUG/ogQpZGfULWo+o/Io/zcvFNRfvolfMV0Ui8Sl8Y6ngRsLoBC39toC/qaKXKiV20AefbsEP1uXxhwCCV6X54GMeiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/l3yrycg3WPa36WCnWRvTrdUBKt6NjAXtQe2Aqu00I=;
 b=KK34912u3vNk4aV+EEByxB7HrWSNrSeVi0KlzBn6bGSmTHdl/lDWTfK5r1rbaxE/LtPFwE2Hfa1YkU0TtKfvnxoYC3XTA9gUlBxndXtgn5ji7/YBCKHwb01wwuIDKRf5JJlQw1eYXbuQo9Q7Wnzse1xxWDAugrw23P4KqGn4MiUQBqNlq+qt7HtCJxxXoiJXwSX+uFrZ40cV27fHs/tapL8QUiCQniU8NOg5w3D4c/89zstpMnukmNEd8kTB8PtZzn+3t1jHS5NKgqV/u3kYrqZxa+71ZkQDM14q2yImoqC1SRrzucqdhf/7SvxTtJn9QSoirOzBTHMDH13nkG0qrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/l3yrycg3WPa36WCnWRvTrdUBKt6NjAXtQe2Aqu00I=;
 b=l1PVkjazVVXeN2ecy863iP7TH0nu4TyqJtc56ocJh9K6BlCyNQQFV0511r2uqaS3wsq2GaZQIjSotXcJ/t5ZQULHM06VW+xElBJx5zc1L6Bzx8qup0uIN49iJGdNFXdzEjIjhHvIRMqo8forVsQYK8SBTX3mmupE4qbYsvwNiEA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB4904.namprd10.prod.outlook.com
 (2603:10b6:408:125::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Mon, 13 Jun
 2022 14:11:05 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 14:11:05 +0000
Date: Mon, 13 Jun 2022 17:10:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: spujar@nvidia.com
Subject: [bug report] ASoC: tegra: Add Tegra210 based OPE driver
Message-ID: <YqdFcPETMQGZm9AK@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0133.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b51d9487-553b-43ce-1b14-08da4d468e12
X-MS-TrafficTypeDiagnostic: BN0PR10MB4904:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB4904EEB4343AE063D0AFFC448EAB9@BN0PR10MB4904.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wL6zbtX6YmqXk8a5llIuljta4WxRgTJeOV9X4rYMJzWNtqyX5OH7Rhb5rowd20urFcqN+e9uHm7EIw/2yfslmn9df6LgiAVlup7ZEtRZZVQ6mVmNCop0M/a2B8g4F/2VXc/4qL5KA96k+uXp1PpUy52yN6tGXE7TR5jK8swmNxkvdRDDX4+T3V5NyvdCf6ahHkxXKRXyvFl35zLo5EmHFfuyvAFUb7mmmKPMgtEu1qwaYahjpKAqGMPsbONQraOvZ0gW+ZLh9WAOfac6YkHa67jx9hz57zXjj+GYR0Z2NPWnHE4+DhTt1vLP48z/UHAw6aAm1DesRD7y6LCD2ie74ABPn58JnfZJCxIeS6Ytjg2cYw5mxa7bt1OueLr9ymJn87wCCKc88iLe4BS2Xk15WVST4sBL01dfPIJUnWxAfbMXw21gl8/1eDLOajGN5zfkZJ/iMUgvlrp38FjImhlb8W8nwAuR/HyAyNOfatpndMnTJt3t+q6MWFDOMEkd+Uz+ShH8Gn/GXx/k4248gObeGEbOLyCheIpf2SstURn9J5cfzweO0zQYhs9fRBiiLkjl/OV05IW+7WsAt4F+5qLOnL/uTRx0tfVcKdGegsWqaZMbtW3kCOxYxrAc8A8E83rtR86lNbte1m8h425FQxbiZ6PlKEUQED6a36PJjDsAq6dXq6WcX8mB/YAyIIaBpVlGCaCJw7qodRd6VejPxIp7Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(44832011)(6666004)(2906002)(5660300002)(9686003)(8936002)(26005)(186003)(6512007)(6506007)(52116002)(86362001)(6486002)(508600001)(38100700002)(38350700002)(66556008)(66946007)(316002)(66476007)(6916009)(8676002)(4326008)(33716001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SN/HdcBteCtPdEQCdtdNtzWopE2uTj6Pe+HWKpXnY2t/QrgAFZ3iS6Ers/jk?=
 =?us-ascii?Q?+Y2v14/uidojVRxZ1BL6qLbVvEeBecPk9yYp0A4zCKo9r5KBEjHV8jnGgx3f?=
 =?us-ascii?Q?fHGuCnWkRaTZmfLUNZN6M1ck8L/6GnytFgkLz/T1uK32vlx7tTWgY6F3rEI3?=
 =?us-ascii?Q?R/Ksp99b/OLYQUDVb39pEDA6xIV3hee6CuUMavlqqr0Bh18S6CG1cWrlkQPO?=
 =?us-ascii?Q?nF6+QbflfUlabR/6ZQulAwXlo/7cLID0HUMZTwr66jP2o4a4NQ7xtRxFK3Jy?=
 =?us-ascii?Q?FIHtAw90M4ucyZNw8y9vQ8auhLN/FFeVTUN9ELNV9Np8Z0coz/C9pOhAkeHj?=
 =?us-ascii?Q?f772uZT4faRSjayiObBazRJpud4hGcMZD9jlyQ1XZQ8Wg3ay47b5Bn2jDilR?=
 =?us-ascii?Q?6UPBr2o3ycd425vweAQF5md2yN5dcRLs4PffEI5EwHSpCcSyz31yQoTrbD5W?=
 =?us-ascii?Q?VwpWvie+qWK3k8fzGGHpEFrw1e4Wm4C3L6pM3IEzyVJdHL9CaJuvx0d11Kv5?=
 =?us-ascii?Q?HzS2pxeT0Z1MZLu8n3w7Yxjmak6AQFdgs1fn86NwMx5ESCCe07j1nq7+NuNB?=
 =?us-ascii?Q?jnVi4twHcejjB4J0dJIoNNDemgA0Hf5u12x7hxKufXYGmmLNZfhUjXY25UQd?=
 =?us-ascii?Q?+A8XnOEOgnYYj+oAdYCT8k0LXsVqZOpX2kK/9IXWw3dpnWH0Fk9+MY1kPgpk?=
 =?us-ascii?Q?63iuVwDeSh5HIeHEbZzXMgkDhBQX3DogrFX5aAeDe2a2clu9p7e2MpicCH+L?=
 =?us-ascii?Q?RyFygq1P4MBZOEgzy528XdVBOhLWhYkQKqfR6czw5UD35a275dILZgdD6Ara?=
 =?us-ascii?Q?qmUClAHfIoTRCbDl7p9iGWb1cEA21S3+qsISRTwsTnxXrn/olxw8ny3dXGJr?=
 =?us-ascii?Q?TFpc07TTgPjVETqs48qJsORPaKOtHNDXzX1lBqmq4xJ9cUh0lMWY1gL7M8zB?=
 =?us-ascii?Q?n/jP1hLpyVskU4YhwUd1qgRxPn7fKbsLqEI0awGAQRfItc51+cXoe2MO9GXa?=
 =?us-ascii?Q?DG2MsoECSG96Tn6/+qtf/WK1JBKSX0TBIFrSKOC15TV5tZFP63xKWKy8GYjx?=
 =?us-ascii?Q?sh8Ofrhh2rX+Inu8UeL9aRQ2f9S5uCeRVDFgvwNmBZPzqnq0JP40XY/1i6BF?=
 =?us-ascii?Q?ImA+LXjKuLhMfckUb22EtNmhj39XZVUJgZxMdpc8Zp2JXq24mHRVvUivarY6?=
 =?us-ascii?Q?cJPklsA5bnokZZBT2ihY7zi+hmrUCZAgO+Ec7tBRRLGT1n158mGtiaa3r+4W?=
 =?us-ascii?Q?CRI5jTZxMJwtG4LosI7bd6p2g9FLMp42tVunFB5PtfsYjHHyj484TQ3E7ij8?=
 =?us-ascii?Q?rvlhGOxyx6Ovtl9Uf8ik/bPDWzIO4u6yoyznrPuscQIu2zPeCMywrkV9rfHv?=
 =?us-ascii?Q?3zzH7P6P2HDNl/KM9c5FoYRXM58xJICbWGU+uA+Avmmqb3XESvShL5ZoffJk?=
 =?us-ascii?Q?+hQAhwva9zN6bKzjkCtGG9e8fwl+nvh7yJwYNGcEOX9ad0yrrC8O900jCeVF?=
 =?us-ascii?Q?tNh2/CQs2w0chh8nFndEPDcmsvVUxSjqctt0GBjJ6SMgI7BDlDB+5WX0d60G?=
 =?us-ascii?Q?k/qezwOAyv08vjozq8L8AU8sUgYVBDSCic86/SPMuOX2oc3ZUYrR5FFfrigw?=
 =?us-ascii?Q?VQuTfxKLVkl2oaMH+6vm+hMgHoDtPWjN9ZoiD2XzZU1VeAWK/WPy2P+xjZ2g?=
 =?us-ascii?Q?6WI/n+DleMzUbiEGC7E4Rp7BS9lhebQntLCyXr3MPFn2RDI7Ba2m2SAhgiVf?=
 =?us-ascii?Q?FFr01M4wxft5FiCSQCN+x0GGpMQuTBc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b51d9487-553b-43ce-1b14-08da4d468e12
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 14:11:05.4822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZul3VUci/4AZc1y4FAl11mdNPAbmHMT9r0wFUY+gms9b1HkTQkaa6eO2ipEpw0uIxEgh3iit45N2V3UJnD4c4TQQmujt2sggHNvD+xzSDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4904
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_06:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=874
 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130064
X-Proofpoint-ORIG-GUID: UR4Z_UqxoRf1EQ-FfGOnqxQFCxBtEhfF
X-Proofpoint-GUID: UR4Z_UqxoRf1EQ-FfGOnqxQFCxBtEhfF
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

Hello Sameer Pujar,

The patch 7358a803c778: "ASoC: tegra: Add Tegra210 based OPE driver"
from Jun 3, 2022, leads to the following Smatch static checker
warning:

	sound/soc/tegra/tegra210_mbdrc.c:778 tegra210_mbdrc_hw_params()
	warn: bitwise AND condition is false here

sound/soc/tegra/tegra210_mbdrc.c
    769 int tegra210_mbdrc_hw_params(struct snd_soc_component *cmpnt)
    770 {
    771         struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
    772         const struct tegra210_mbdrc_config *conf = &mbdrc_init_config;
    773         u32 val = 0;
    774         unsigned int i;
    775 
    776         regmap_read(ope->mbdrc_regmap, TEGRA210_MBDRC_CFG, &val);
    777 
--> 778         if (val & TEGRA210_MBDRC_CFG_MBDRC_MODE_BYPASS)
                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

TEGRA210_MBDRC_CFG_MBDRC_MODE_BYPASS is zero so this can't be true.

#define TEGRA210_MBDRC_CFG_MBDRC_MODE_BYPASS            (0 << TEGRA210_MBDRC_CFG_MBDRC_MODE_SHIFT)

The common false positive with this warning is that the macro is
something which depends on the .config and in that case I just add it
to the list in smatch_data/kernel.unconstant_macros.  But in this case
the macro is just always zero...  Is there a plan to make it
configurable or something?

    779                 return 0;
    780 
    781         for (i = 0; i < MBDRC_NUM_BAND; i++) {
    782                 const struct tegra210_mbdrc_band_params *params =
    783                         &conf->band_params[i];
    784 
    785                 u32 reg_off = i * TEGRA210_MBDRC_FILTER_PARAM_STRIDE;
    786 
    787                 tegra210_mbdrc_write_ram(ope->mbdrc_regmap,
    788                                          reg_off + TEGRA210_MBDRC_CFG_RAM_CTRL,
    789                                          reg_off + TEGRA210_MBDRC_CFG_RAM_DATA,
    790                                          0, (u32 *)&params->biquad_params[0],
    791                                          TEGRA210_MBDRC_MAX_BIQUAD_STAGES * 5);
    792         }
    793         return 0;
    794 }

regards,
dan carpenter
