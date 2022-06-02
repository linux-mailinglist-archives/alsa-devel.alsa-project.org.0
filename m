Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4023A53B5B9
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 11:09:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2AAF1D7;
	Thu,  2 Jun 2022 11:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2AAF1D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654160988;
	bh=wm7bvzD/tC3P5/6ao2igdWgq1slZdGeiQpIO3f7am2g=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z/YA/BtrghmXhxKIMzz9S6E6UEL/sx+e+TvNJxKRbign3WSu85QO0PyiboGBKfNBv
	 +UywJNx2QwmRHXO89AGBXbzSg6ZXt+1/GAoF2cqx1qWXA5REUvs2IgOayVVqzBTQBr
	 ssXF/yjjbXzGxWa7R9Kez8uYJdcfRVZsgibao/xk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A678F8025E;
	Thu,  2 Jun 2022 11:08:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 338F1F80236; Thu,  2 Jun 2022 11:08:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CCADF80124;
 Thu,  2 Jun 2022 11:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CCADF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="LbEMFWHU"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="G5sWcT8Z"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2528TMRS024869;
 Thu, 2 Jun 2022 09:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=oiQS+GVQGEcgdcD2KpT3sO9qB/gEEUAT9Nux4jsCSVc=;
 b=LbEMFWHUnK4GvA7COlOkC5ot80/P08vzXYvxyfWKAS0sFMoeOdH29ZXWb+43NnEbNm8O
 gRg5BUj3orXNAi2wd+LdSaASk3/C3Folq15Z6fQmmJ4Omx4nMJBYvf8AmEIh6FLxe00Z
 ZfS1RvoStyRKZZVliW9a/h8q47KKz4mN3c9YVe+ktVctIF45xxs2DLuvk3KQ8l9L4KHN
 32LBf+zC3LmFrrGfx3BOGWRVgf8nOvJOL8xbOoMveodD+tuubgsjxmSgjj7hbfhvnUG+
 Anh8ZnjehREsL+ljZE3Z0Ay/EdxazftP3ciWuEx7MvaDLE4B5q+05RnCchaJhEi+RO+6 Ew== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gbcaut18n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Jun 2022 09:08:41 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25290B2j012796; Thu, 2 Jun 2022 09:08:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gc8p4pw37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Jun 2022 09:08:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAgqbBa88OHcuHOs/fFIj/5Loa9QLynn/+bl6gcrePRQ4SWed6R4TgPJ09oVZ9DCKpOn0B4veJhiHyld6hNB9Uy3i4RccE6432ZjVKNolOP5ePBGM5En+whpBcDNw6yL/PIysq4GW/2HZWehrfXe+joHzKyOcjK8eqMFXfsf9Jei3ePXaU5+m8Uu+rs8K7WtwEsDKOgag/UkVuR/KZ2+b/ywumXsMRM5/uFISG+rI8HqmiFb1pMv1+jYmBcVlfPRjT9R7Lv2TjSaesbqts79K+ijiT5Hv9EduCbCoeFs4eeZlqdyyVk3g5gmFF2B7z3Dl4upjFuSJYGOQfV0Dq54vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiQS+GVQGEcgdcD2KpT3sO9qB/gEEUAT9Nux4jsCSVc=;
 b=hnsBaq6OeTYvnOLwNjov2z/MB7ouOrrgMWcj4g1WbHzRIJo4vKZ8qsv5bFmU3MJUWbj8XrNYBuPAnV+JNraDuldPc/ciunS6mVzCK79R8miLs34CqpdarWTgeoO3BCQpPP7IzqdaIDk/QjNjak3mZgGQbjj+AI1h3xeoueo5Cm1D78pvFqPC4L0ZGrt4JFqwpFaaVEMFsTstuJrYtrQkn1GaHCI3fbd73caTqalzj0jGuA6dj3anU4YYmnHvVgJAGjkjhm0M95i/KgZlKU+tm8FlCOF5lr8CujgQiGoX5lo+/IM74tAoAUsOC6nKKFN1PIqv5H2GBtwk9iB6PYciaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiQS+GVQGEcgdcD2KpT3sO9qB/gEEUAT9Nux4jsCSVc=;
 b=G5sWcT8ZsiTiIKYX9ywUkBqOAXEOKyqxiF4eZD2iKM120Jx70uuzSLT+iSGFzBmIuvkV3M0W+WjnQhJYKyHDfWPU8QDycWJc9NkgdUsYH98V3UAqc1wgZEstx6QNJMb76wrdBGoaJ1D+ZvhJWcs0GaAXLKTxw3mDzJveWCI61y4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN4PR10MB5623.namprd10.prod.outlook.com
 (2603:10b6:806:20a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Thu, 2 Jun
 2022 09:08:38 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5293.019; Thu, 2 Jun 2022
 09:08:38 +0000
Date: Thu, 2 Jun 2022 12:08:25 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 1/2] ASoC: SOF: ipc-msg-injector: Propagate write errors
 correctly
Message-ID: <Yph+Cd+JrfOH0i7z@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0169.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f8b284a-7939-475a-6cab-08da44777b04
X-MS-TrafficTypeDiagnostic: SN4PR10MB5623:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB56233C3C14F559D31A7357A78EDE9@SN4PR10MB5623.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bChhFrpvYQ7iQU6AsRSUhDRoScwd7RR5Rwb1ws54LL+Z6+tkJuEKHTC1JSxgUblWdPAiQae6N/a5F5fnmJlb7MFkgTbagnRF/UmWgPBz/NvkEN/OF8OHwG+6uCZ96w/AzZr0/lw2XAy9t+cb43tdMRNeW9PWX53CPXu2+LUP/4HJG+7cfPXaTW/Y5MTCKC2hnSOg4XzokwUD/zl/+HyZDr47ulHbgDY1uGiUOJc225xdKhF0qdoLFR75H/Cxek6qv+yX08TmtY7VUA4wipmxgZpIe3DJyRCO0K8skqooUDa2YWDKAA+UCCYU/c8cs1pQ4/vioh57InmpLzvgPtdeOeOXu2BVZT++NV/jwoirbnaG41XNRErGFzB7gcINqbhyL1XUXx5RFKpL1UjeZ9NL6pUz1/OzcML7HF5uJODzBjiOXimTOek6lKryO5edxdegtrpMDm9yWgJ78bnwXH9IEWmXFtwYAWSrmln+Sey08zQmC1JyPSTWvpvmFskBc2Cl6D4nz/aYN/eE23RKPmh99Rr96JimEW9NHojyF2cZRYzKJcV0Q1eTh4Bt/q+o8ndLQrjePbc55z0mCX6t9CSq0TGammRQpXLktAk+VU2/4Dzp0GPsQXDm4BCFwespvcYFI92t7bmYIVREUOQFBaj7oZ6d3wMFxqeqNB7RJJGzgOyCjbGdwOPBQ8pEusSgUoOu9reB6NpIuVYbZi//ldDLWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(5660300002)(33716001)(4326008)(186003)(66476007)(107886003)(8676002)(44832011)(9686003)(2906002)(6512007)(6506007)(6666004)(8936002)(7416002)(66946007)(52116002)(86362001)(26005)(508600001)(83380400001)(66556008)(38350700002)(38100700002)(110136005)(54906003)(316002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n/1ZjG4oJJn+rwnk+snVrooV9JI1OQToT8OdnJ6uxZe/azu+nDXOrojbT6b3?=
 =?us-ascii?Q?wxzg9mbn91yLeQKA65sK/ibxN21ak/nFJsxs20Q/RyvO6W9xroB+MQe7gz+z?=
 =?us-ascii?Q?Dn1jZeLWHkyin5XYO01Z7UTXiNIdPjlA/N6uDG7liQlzL5salxRfLWhDkMZ3?=
 =?us-ascii?Q?bsPqbUUNn4Xg7530SfuM5GMtihDwWVlxwULj0bOgp13orJdD6oMlXt+GOt1V?=
 =?us-ascii?Q?cN/g6yPueUq3/6L0biBLqx/jRXS0VapdPhFsKlFitjHum+Bbt6mb1m9pKNqa?=
 =?us-ascii?Q?YbM8fFXVcFycxFSwT8G+SuRoNDCnH4z230cYgfwRaoi+gHR+s0O1pZVt/y3p?=
 =?us-ascii?Q?Q4dLfvUXGebQoaFg3JEYnj3F49bbLwUa/S/VVqbbSnpRRBl6CLXujdbdoki+?=
 =?us-ascii?Q?p/zK6zyso49p42M+xfQtdPvstfAqkMAGDlMJJgemTWOAkfH1sqluyKm9Bv2B?=
 =?us-ascii?Q?fYXLfWyS6l0yrPVsTm55H6mBAQ6fIgyKo2eof4TQV3el0X4XGOw4AXSdbGiT?=
 =?us-ascii?Q?VxlD1+vIwJM5o6QO/AIKumIl1RyreTl6Ijak4UYgUPmDztqcd35tpAyV6sSZ?=
 =?us-ascii?Q?dX+MoFWkO0NPfS7MFsWEJuaOR76iAvv2ZGf+58kBhqAViHt/qgJTpV+n/Tc/?=
 =?us-ascii?Q?3wdXfjfQ9BcePgcuPZ6jFJXi6aOCKHNvpJTjqbYbPtO+v6GO+kAE/b9gECJ+?=
 =?us-ascii?Q?PDOkCEqikNPxPyQuNFfEnKl0H3+jHxM2H8Tbg1jhDyeCrm0u98KZhxhyHSuL?=
 =?us-ascii?Q?FJBoZRuUD+H3qtUlz8Rl3RPUigKhwDoQTQDCc3X9Cz9hfFfSXVi9X4yQM4X0?=
 =?us-ascii?Q?7but9wVX+mTNzXpAomldLSVSd4oDeodr/xcMQu1W1l+JM+h3YlEiTPsndPzG?=
 =?us-ascii?Q?qy/sy36LX6vVgOdhj17ZBzdoKRQIO8kLhNV7sv6SwvwtqZ7dauIe3ouRX/ia?=
 =?us-ascii?Q?oL7u/G74hTTKI0mLCqOZc6W5eDThZCcb8CDzHPqRIXPcDBvn2fTXR8wY4fVh?=
 =?us-ascii?Q?1owT5G4F2vqaG/N3SEU8soVuzI9a5QbFQoxfQRmfoswWlPsfUnNBHXT2O5Sh?=
 =?us-ascii?Q?tPJkT1gc/K7RpzXm+MyqTq3kfOHenhsKNIWoscMiTS6A7Y7Cv88ZcKBY0xt+?=
 =?us-ascii?Q?Mg6KtbOhUmkdyGyZR+A93rWQPovoa5BufL6ypKb4KnC71XYqLi2iEft9K6QW?=
 =?us-ascii?Q?DSiwduV07tygMO3boI6BSmC77dY/Qm6gRqyEXhigN8NzcL/kmNgqgvAR+RRu?=
 =?us-ascii?Q?a8UDf7Aa0KuzUWpyUnpF+4EE35lU4VB+IfPeGcaxJQORn0O3asIPf5hwR6Hp?=
 =?us-ascii?Q?Z+4EB8LzDcsMpwPlOMlUW/vpr8HU7289RRmhZ3eZf/PPOxWxtIGJ5GIkp8vx?=
 =?us-ascii?Q?sJ3X1SG20iruLvAfnMRP17KXEQMSW+5HTanHeGq2UwbdU0N0ji4ER61h6ESD?=
 =?us-ascii?Q?3yb89JMxitazstyKaviB7eCMtd5mpzAvN3t0ewvvbcDdF3OFEeb35cNcueiO?=
 =?us-ascii?Q?2wKjmdZUfVsVJSaJ4MH3vzqpUsYvgcdoIi65oHrTZW8Vq2VIcLPcXYJw/sEs?=
 =?us-ascii?Q?2jFNJekUWAyFTk4sNn2/+swlCmPzU1Z+AwimRoNaCAQDYqu8RbgjH8/5ZkP2?=
 =?us-ascii?Q?nb1EcYWvPh8YIWUr6sMGIzs4PyquVzJD21OqYl2chpkiXXWExQEGjWW/58EA?=
 =?us-ascii?Q?2dxoTnENHu/TV5ljs7vkeyl1w2mWy04smDvzyhU0MgfDJ3N0a25Mw5eeOpuO?=
 =?us-ascii?Q?eJ18FP+bjs6dQMFaJFEmdVdcKBmNbJ4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8b284a-7939-475a-6cab-08da44777b04
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:08:38.5155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+hQQRFWG+bqVLoV5R7AjQXftTnBVvX7M0lYNn+hK5z58bES/P9GCe0j7/Uboc5JfHlvjvMjL1SIknX99fmqwmMKHShyXVQnrPPk10YFm0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5623
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-02_01:2022-06-01,
 2022-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206020037
X-Proofpoint-ORIG-GUID: OZKD0HJtItofZ1Dh-Hfzk58RTXU5xQ7c
X-Proofpoint-GUID: OZKD0HJtItofZ1Dh-Hfzk58RTXU5xQ7c
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Rander Wang <rander.wang@intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 sound-open-firmware@alsa-project.org
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

This code is supposed to propagate errors from simple_write_to_buffer()
or return -EFAULT if "size != count".  However "size" needs to be signed
for the code to work correctly and the case where "size == 0" is not
handled correctly.

Fixes: 066c67624d8c ("ASoC: SOF: ipc-msg-injector: Add support for IPC4 messages")
Fixes: 2f0b1b013bbc ("ASoC: SOF: debug: Add support for IPC message injection")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/sof/sof-client-ipc-msg-injector.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index 03490a4d4ae7..030cb97d7713 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -150,7 +150,7 @@ static ssize_t sof_msg_inject_dfs_write(struct file *file, const char __user *bu
 {
 	struct sof_client_dev *cdev = file->private_data;
 	struct sof_msg_inject_priv *priv = cdev->data;
-	size_t size;
+	ssize_t size;
 	int ret;
 
 	if (*ppos)
@@ -158,8 +158,10 @@ static ssize_t sof_msg_inject_dfs_write(struct file *file, const char __user *bu
 
 	size = simple_write_to_buffer(priv->tx_buffer, priv->max_msg_size,
 				      ppos, buffer, count);
+	if (size < 0)
+		return size;
 	if (size != count)
-		return size > 0 ? -EFAULT : size;
+		return -EFAULT;
 
 	memset(priv->rx_buffer, 0, priv->max_msg_size);
 
@@ -179,7 +181,7 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
 	struct sof_client_dev *cdev = file->private_data;
 	struct sof_msg_inject_priv *priv = cdev->data;
 	struct sof_ipc4_msg *ipc4_msg = priv->tx_buffer;
-	size_t size;
+	ssize_t size;
 	int ret;
 
 	if (*ppos)
@@ -192,8 +194,10 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
 	size = simple_write_to_buffer(&ipc4_msg->header_u64,
 				      sizeof(ipc4_msg->header_u64),
 				      ppos, buffer, count);
+	if (size < 0)
+		return size;
 	if (size != sizeof(ipc4_msg->header_u64))
-		return size > 0 ? -EFAULT : size;
+		return -EFAULT;
 
 	count -= size;
 	if (!count) {
@@ -201,8 +205,10 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
 		size = simple_write_to_buffer(ipc4_msg->data_ptr,
 					      priv->max_msg_size, ppos, buffer,
 					      count);
+		if (size < 0)
+			return size;
 		if (size != count)
-			return size > 0 ? -EFAULT : size;
+			return -EFAULT;
 	}
 
 	ipc4_msg->data_size = count;
-- 
2.35.1

