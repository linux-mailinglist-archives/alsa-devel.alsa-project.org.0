Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0466C58891D
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Aug 2022 11:10:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8654315C3;
	Wed,  3 Aug 2022 11:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8654315C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659517841;
	bh=03R8184JvOoynRO+ylRSMOQ/ah4Azw0MyISO0lNLBHI=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HLSKmfmSMRo9WXBNLq1Be+o04SsxeyGlcaBnRNFwPXFHoidgJTrhSC5iFW0lRnrI+
	 8lvPYDmbZ6H0YMQUULviyTR8GcR+FLtJVsJ7122xUwsn6MFrEJZwGi8bMTEPgLEg4h
	 WBSoiwPByeBeXtC79Z0kkwUQFESFa7ULWOq6+mRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 072A8F80166;
	Wed,  3 Aug 2022 11:09:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EF17F8016A; Wed,  3 Aug 2022 11:09:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FDC5F800B8
 for <alsa-devel@alsa-project.org>; Wed,  3 Aug 2022 11:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FDC5F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="k1FeR8vg"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="y6LZDtkz"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27393NkH031998;
 Wed, 3 Aug 2022 09:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=nKI8iBcyq4xpLhFyd1EQPSvuI0csVkYUK7LD+N1kt5Q=;
 b=k1FeR8vgIixNWPtVb3+cuvEjxFn5xI5Y3yXVHEooHJIsPLgflrklfKO4pM7+3vjXXnL/
 MaiIQBfE48zWQ6IScHQ3wbuuB10uBdqCogZk/AHClDEeO2f458lAHJn6xUspHSDDIb9+
 k7Ijtzy7D+GGVYwW4JSVjdH37TPRFFE5y7yBgGeCxGwyXF60SKiKxA/OiIRIzyoatgJp
 LFchYRDz2b3FISw8LH9x8sO+Gbiqvk02Pj6wgeFaY2bC1yEjD8xyq/J6T7UXfdJKjLsN
 yjVAjp8GW3GCTgt9j0i9MDNovANbqUgOSc+OfMd5X+bhv1O883Xol9Y8CalTfLPB7sDY DA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hmv8s9cew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Aug 2022 09:09:31 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2736Dkta003010; Wed, 3 Aug 2022 09:09:30 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3hmu334ypt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Aug 2022 09:09:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lV+pcq8ECO+7IQTb2Lfh+5oOlGb8lXGuf6fhNUklJxct2b6oVnb6lEL4n65hXn7kcD4zxlYKIJoYIairsKqVJ4+bThKItkxVSwzein1qqrmKrJ6rQOsFpYxjk+K1BtsENuMPbwSc12u23qFyZWZpbD7+vHE3+A5KRulEW1w70bKt721UI4ybmEDqIz5AUwCj/s58my4aCEe/OVabZ3FlgQmpu6xzi3vqNx0KdtSplJaXJordmsjHSJzDqJnW8FBDvA9++IWd1r0XtNjpI8KPz+/5ddX6KpTwI9mD5OVfoWr2t3SpTprA6W89r+zE/uoTlI+WLcSuVP950znxoloPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKI8iBcyq4xpLhFyd1EQPSvuI0csVkYUK7LD+N1kt5Q=;
 b=XB5KqJM5sc2UOWWntG/zVRj3VotKP3IifRIE/Ln7gyikMz77LzJfXfOusMVdwFiLK7GZuEPPTUolTubG1PfqzSK/B+WNndheMidERHYBDIL7iYMpekEmont9nSSd+nX2O9PxglNuSLl7JV+tHilpkpm9X53R1kiuUMA4Mk8Q/0hzZgCdkW1DF46ZpcaG0CINy6RXi20xVUiS6wIU2fPU55GBNhKqmEHjn2dC6XeVqpHVyA6gActMuQxZ/FlPRTCwO+Qm6wyIT2TvMk45vsWyeejsWguMR7SuXCA+jzIO+VM+u//6qHu2GwAEHKhJ5TzBroTzV6wter30Lo5HDY0ncQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKI8iBcyq4xpLhFyd1EQPSvuI0csVkYUK7LD+N1kt5Q=;
 b=y6LZDtkzvCOsAc7LVULMYrR8oyS4UDlZX+RCw9kSRrVF2hPWfOtirS6jHYrk8+xT0aQb/R6vUNmU8RVoizaRPZTxmapQcUA4EV4UMEPHRDvz0cY+wB2LyfnYkiYa8NQetaiRDSSftVTWT5p3DFP5XDh+6kFyyzt+/pLFK+77Z9g=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN6PR10MB2735.namprd10.prod.outlook.com
 (2603:10b6:805:46::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 09:09:28 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 09:09:28 +0000
Date: Wed, 3 Aug 2022 12:09:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt8186: remove unnecessary NULL check
Message-ID: <Yuo7LGPk8KnBW6ac@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0092.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::7) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be015725-71e5-4b12-e1b8-08da752fde4e
X-MS-TrafficTypeDiagnostic: SN6PR10MB2735:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zI80CYj7edwmY/t4yEQHgdyIuNn15eSbHxoWFZPWVCTnMhowc1UUC42pX1gVXsm2ABFwz8lB6V+EKCIqCO9q660YHhgMGXYgz3yBZ1K4ZGxYUl7T46w1pmWSLSeeTFEndSK9p7fYjDANvHdULs2U0hwbvByQkcECaIc5p+V7gHhtjBZMnxhx8FMJ5bg7iqZRvmd3Z3CFHDN+R8hbUPdUGYOFP89TnV1RTtpYGsrjfUi6uOZFgOP41Cx1BwJPK8r6UByIO5iLUvLS8z5xUMdJgb51LyLgY5EGhT4UraAP+WW9iKjvErGDAQrqwF6bfPXBGBkX/wcdLSe32mAEvyJN2MFyELFXVUxUOl6BXEaDS4OfF6SI4Kc2MLDbYEb495bj2+Tvnh6W9vpfVGQRQFb20aUn3WjCXCAUIHfIFQkfPlkN2itddurJbhi65rZQq1sTTl5tMUdTtGnVNfNrN1WvxhUUKBXYnDgan8aIQB2X7YbYoWNqJsfKTpIHbIUXbRImuHJcrJ/ygZMzUrR/ixeV6oLq39RcvEf3e4k129uTzQyv/H5Tj6vwiUiNC5y7f5eaS/+LU5UPAFbZXLDmj6Me/sLMVPD78eFWdO6K4ZiqSMeKPSNvP8CQZzZ2j0GEKM+HJTJxKndtEjI34lzV9tQ1Md4MD7seGPDid3rL8jorn6MoEBtQ9FZTumWMB/OoeS0BrK+qRlTFPFLImQvRXKUYr3G8hNjx8AR8/Bs4Wu0vkyfAb/vW6W9+1XQk9Ji/LwrbiugOSSul20j6xGvMY4tHEmnUoTLVzey61E9CmOKUeIVBFOO8/Yx9AWUPuEqVKwti
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(136003)(39860400002)(346002)(366004)(396003)(8936002)(6666004)(41300700001)(4326008)(6512007)(86362001)(66556008)(66946007)(9686003)(2906002)(26005)(4744005)(7416002)(5660300002)(66476007)(44832011)(52116002)(33716001)(38350700002)(38100700002)(83380400001)(186003)(6486002)(54906003)(6506007)(110136005)(478600001)(8676002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gFD7d5FsFGaoQ6VrQFkqS4uYVWauBDzSWA7Q3xocJcqSg4+MNZGEP4mVRPN6?=
 =?us-ascii?Q?uMNZo8BKm1vg5bTbqtsnEzjDvRTjsUUdgSX3Py2NeoKii9MPVxANlbxLeWK1?=
 =?us-ascii?Q?0g1WAY0PTDBk24WlLlhm9vuiOu0YhbVwzzKdohhZCkdQnQIrEP7my5PQq58P?=
 =?us-ascii?Q?89G+BigdXJJ7ljtzyfwcNs4ttcMwrTyKNSFLBulJyOpteoJqWqdIaHTZB6tN?=
 =?us-ascii?Q?ZVI2+jBl+KnuR8ux54WGw1VYzp/WynNy5W5Zz5XNiukM2IPqE4s+MyX0jry5?=
 =?us-ascii?Q?opR5u6fh3QcPoL/SF6hONk73wuAVqj8rdTVZJod+H+Mo5RotueDnHX5nqICg?=
 =?us-ascii?Q?O6yVpG5zsGT07ofCHk7ayOeUtSBg86kc6kVzrOE83fhqoPCuOFGph64jSl4X?=
 =?us-ascii?Q?9YxA/OArtkxRByOunLWq2KDGCaG+HsgFxmg+xPizlfNFS00CaBwZCSEMkqW6?=
 =?us-ascii?Q?xueYMYrH7bF3BMCefp9goTTgMDMU69xW5EtVJriCyHQ9kXWUF81UQH5nXCaR?=
 =?us-ascii?Q?0egk9hh299HnniM0XKCiNttRTw6gF3qUzl3riOQ71BL2To8kFVnMnm1roW+w?=
 =?us-ascii?Q?qAA8ywCATN/cX5+lxSgY//KarYU75P5xdLhiiZx1AGc0OCpuNFn/Q6N/O+Nm?=
 =?us-ascii?Q?JL+7P0DxoxdvOdGuQkiqyNmZ/zu6+sFUGpujsLv+JdyYJyxIMVco7VVw9kRW?=
 =?us-ascii?Q?2TbL7mGKIoFJLvRjtosF8bGMopar38Rpj2y7p7rgq9n/Perud2p4HyWVHnHq?=
 =?us-ascii?Q?RhN93TNQ04mHW1SVfFU/OuqgmSCIQlRgP1B0dOjr+F59uVJ7noeQuc5fvjPs?=
 =?us-ascii?Q?1VNjp3B8ZSqEkNBj51A6VElrF6+DCCH/vZReB/gExBaIAd8yf+FoCpEaeM8H?=
 =?us-ascii?Q?uaWCJ1soB7yC/Vf5NdtJ70ug9dWBbs8QuQ+byqw+RdWtNuL3pTqr4E33Cqov?=
 =?us-ascii?Q?lSJsI8bRd+9lsUhopggJjDxuUuV/DxUtL8KsrXMzYwV09OVaSPHbYMV6eC80?=
 =?us-ascii?Q?sJioPhKuta3GLYE7E4EyK//Z6taumjs5IgpdUJsCUf/dlK78hJyIO9xjI0T3?=
 =?us-ascii?Q?hP8rS3OzcP36HmYiv/6LIYE2ADyHv57qRnSNhB7SqR7md05EJrXpQqRHfufY?=
 =?us-ascii?Q?n9pluhQO3sOe66oTNc5HOBEqGJwKdMdSOdXSHGcGM8fJylS2eIZsh6Slvf09?=
 =?us-ascii?Q?KBJ6/KEUg7C+O8J2Pvi2yPfQpXak3pEM4MCGu0DO7FKRE5t4+mmFZoO7UWxy?=
 =?us-ascii?Q?md6ClOSQt/zDXU5+CbngKw/4aukOqYCEhJcu+7Ojn9dMQ+aWvtnbWdpe2+j1?=
 =?us-ascii?Q?Ex1SibRNk4Jg16JDrQHJ1+wYGKxHyXWhG4xdU8frv97j8fHTQrCPiFMBPt/d?=
 =?us-ascii?Q?TZ9RCIpHbjw2O6rl6GuxsFHpcDO/8ObQ9GONh1pAzu6YV26u+UAMZix5mZ9V?=
 =?us-ascii?Q?+NDr4eMOtLRcuLxSPQcAR+Mr1u8obYM/UioOPqgPTWEPjgoyBDSDCAmJEcEh?=
 =?us-ascii?Q?JPSyBcuKDJGm791ZGpKvqj6XhJtTG9NlbNBEoXRXdEkOi2TuxMqyPoTax6+m?=
 =?us-ascii?Q?C2MXnX4EFNi4/v+MK3MQ7+rcEB43jsY5v4+qfEeNwZfjXLNG/Y+QygaJiAur?=
 =?us-ascii?Q?hQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be015725-71e5-4b12-e1b8-08da752fde4e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 09:09:28.5751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSdHW7FeXjyM4B/4XAbIcqmSZ9cpIN0Lazv99DauG9c3T40MF8cWk4mpsVZecjtnwHmpy6/I0XJwK4gKZeEADR2h5oIPsR6EIqfkY6m83kM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2735
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_03,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208030041
X-Proofpoint-GUID: PF6eQpT8xiczjf2RHduxzYmw25ipb5JJ
X-Proofpoint-ORIG-GUID: PF6eQpT8xiczjf2RHduxzYmw25ipb5JJ
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

The "i2s_priv" pointer cannot be NULL.  Some NULL checks were deleted
in commit d7bffbe9cbd3 ("ASoC: mediatek: mt8186: remove unnecessary
judgments") but this one was accidentally left behind.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
index ec79e2f2a54d..d7a227169548 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
@@ -968,7 +968,7 @@ static int mtk_dai_i2s_config(struct mtk_base_afe *afe,
 	}
 
 	/* set share i2s */
-	if (i2s_priv && i2s_priv->share_i2s_id >= 0) {
+	if (i2s_priv->share_i2s_id >= 0) {
 		ret = mtk_dai_i2s_config(afe, params, i2s_priv->share_i2s_id);
 		if (ret)
 			return ret;
-- 
2.35.1

