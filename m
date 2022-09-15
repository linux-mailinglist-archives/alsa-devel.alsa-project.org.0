Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 116545B99A4
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 13:32:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F1D01938;
	Thu, 15 Sep 2022 13:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F1D01938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663241540;
	bh=Sf/oTv70XTVx8DYjjdu75wop51hVo9LbEZKfHXa/Kuc=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l4WlzRt26AT5ybWwNInFmB9j+7776XGU3+5xcd2sNVhCHfbrBkqnZOcSIP6lFYdI8
	 pVHRjHBSZkOOI2DSOgdkUCBJvrgpTTqYAKkt5r4lXyITdy7EVmk96luoz9VV/pTbzZ
	 hmQExJbiZjgDQUx4Gvk7kwoY5dd0kXNzubxIcKe4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA1A1F8027D;
	Thu, 15 Sep 2022 13:31:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0407F80238; Thu, 15 Sep 2022 13:31:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75465F800B5
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 13:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75465F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="HphcwaU2"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="tNatKY8M"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28F8ugqL008397;
 Thu, 15 Sep 2022 11:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=SSDcqhlfo/48cjXgI77Cf2Q6S7khu7vHCwY8k9HR1wI=;
 b=HphcwaU2aFWcLIUt3MKBEHy7Eqw92AT8uxBtCSvALlPvBBHcPzES4aBKEMY6KXnPbQ3R
 hV6fJNE3SJQilpmCFiCxBg3A0NgcmR8nCMtTHwFfqyjC1vil0pSMJRXG5M6TT/ezdMj+
 Ct+fJXfGpJnSF28T/qXeF1VNJBRZJPdnWuwr/F+CtemqlrZ5uc3ise9E1HgVKouCkFma
 xsGLi9+f6f1h3/dZZP1apB7jrIEjwyny/f3l/IG6qv/JTNKt1DmlJPUjV+8VTXd1N+Nf
 IWMgE94NK79OsKbWstkIzucfRLnQZIwZGoK3VYfjpv1Db2zyZK4atcpPQZF8pJ+TNhYh VQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jjxypd2qr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Sep 2022 11:31:12 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28FBV5Ze003170; Thu, 15 Sep 2022 11:31:11 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jjy2cbrge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Sep 2022 11:31:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gf+L0Zq+oUYPoxlXmu3m+5R/1ueIulnLKOHL4IpRlL4//J3KyZzWH74WA60/UXXS+M7G5ZWNbOw89afWMitcmDiaEfqHrK3ywh5dPghH2ho07/WplBhdqCUpHs4y8ejlCXA/MFbgYIVGhwp1PfHosDXGM+SU5lPc1YpWOG2CiOIIp0/rY5kUUvL3XrvT5ItBasY67lKxa7UjJ1EPYOmisQB2JUbUum7e4C273F9YPwZsMFbiIYNPgwU6kKcc+YZ9PHIfkU0/nJcLArjv8vPMYd3KyozqW/KUPhhvRklsaM27bpAYzQFXhWfB2fQ1vA2OC/Wp9DIAEtGFZPUrBsoKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSDcqhlfo/48cjXgI77Cf2Q6S7khu7vHCwY8k9HR1wI=;
 b=SDfN2+ozFPV6QHjt/z7wn5FsnPTR5lDVsNsKfDUNOBO05sO8jrls+hAYC2lPaz78Stsnrd+f51xP4KNJrzj68aUX70fgh1xmwxvSGcE5m2RXlBWryMkartX/spix2MXezIxTaW8gMgsq4fz3draa4mN3XSZics2jru3opwbBZhmbsHIgD1s2IybSkYCW0WQ0l/hL1K9aUH+WpbmPKVanH49na0uJTUa2IuriTdlSAl+NuSYEwypGvc5lO5TTGP722ESornm7g1e3ZO37NMw85bKbOEsSWW9LRm9A3GexAWMKaaBYHlTWLsjiNCjCaCo/k7LxInvMmfJi6crO+44RhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSDcqhlfo/48cjXgI77Cf2Q6S7khu7vHCwY8k9HR1wI=;
 b=tNatKY8MCIPlk5x35fzpfrTxH0rw7vvDmQebArZkzARgVgxUvnlgAKQNlvIan/zo4OkgOxPjW0lkUQQrnSnznwpSTvJxV4aMCIKn+40DZreYUzJmGbgVbiSI0+Qq3+EtIcW/KTs7UqYzKLjl786r8rjptHuMvMlZyTY8LSSypRk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB6557.namprd10.prod.outlook.com
 (2603:10b6:303:22a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 11:30:26 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 11:30:26 +0000
Date: Thu, 15 Sep 2022 14:30:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: laurentiu.mihalcea@nxp.com
Subject: [bug report] ASoC: SOF: compress: Add copy function for capture case
Message-ID: <YyMMyxlzZwHySNS+@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0126.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|MW4PR10MB6557:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4d113c-ad73-4271-74dc-08da970daf57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UTq9MknOeTpmUiV1ekiboqLSEAnVLjsltNobmtj4iiW0VnHMlDFCfNuSmkTLemCb7GjayTBpOXcP1WHHPqDUcIGeuskRzJk9aPAWSpuAPvLCTIe+xxWYQrcsg0fNQ8DxPPTTOsndIsEtY2+4bo64dlsV52EhB11E0+z6paioji92OOsWQ4IZMOFAoJ8TNkz0YVGNGsHjcnAsXWiRqOLSOB93huqqY0CyIU6FVNFdGIeC1ZOvKy8xKa907DBXF86hHPpQubPObBCKXogbrNOK10ktR7kakBprepoANrg6t8nO9heof5A+3XG12f4RgDEuiQxd9ZUxGb6OHkmm/d0e7LJd8MQxfhud1p7JbJmuDsigTTP0WavjTbvtCv0f9paQr6wQgkm9W9wJ9y7ggc7vYkQsuq9IljFju+a9nFO8L8GGmRTRJOq6fp7bIt9822AagPkpeVcr2eVO6SBVoXqJSy15x9vA6o+kdY7dRxVqaLKH4GNIdTMRPAY4brydLhUR7Qh0epKcgU1m/3ztKWg3CvtkXfZiQ3m/qwgvMVeG+HahCN7A7TW2DxZ/O6i/i/I+Hv/nWYpAOdMobLKYfa6xHOc8AYeJz3pWnjd8SdY3e7A7RKcM6lUkAN6iY3+s7o+LLnj2KTJLN/0/HxHXptvVbzRhm6ZPlepKp9jQdPAXkb8sNyqQEJ3XLJZRn3ccGZC2ZjjepdR0bXimoSZvtKOWGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199015)(6666004)(6486002)(83380400001)(6512007)(8936002)(26005)(6506007)(2906002)(9686003)(186003)(44832011)(41300700001)(4326008)(33716001)(478600001)(6916009)(316002)(66556008)(66476007)(66946007)(5660300002)(8676002)(38100700002)(86362001)(66899012);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z2HYRhR5YVE7s9O6DtzUnkt0vgLbd2Yn0XdmPmGNyz8N/P6rJbncln1SomVw?=
 =?us-ascii?Q?OHlJtl5I2OTcgYCzzVYASBV0xySAyyfZHr86SuxfQQvud5VAS/IO90T9k1tL?=
 =?us-ascii?Q?dDwHor3qzHhN5zjyuQnfBhWYaSfesnsnEsipfQY0kvZPL8A2448/HtHsQ5GK?=
 =?us-ascii?Q?bnupPdIf0cP+f56L43oxeobsVFeL+GkmVV4pgcDkA3FpnI7WtaDM5PkgBDGr?=
 =?us-ascii?Q?4+gBRCSr2nC2WUlujKK39VRhu7xpxr8eRg9pswJbB0hCWNRnwCn2TE5Ew8U1?=
 =?us-ascii?Q?Axd+ogltF927KAwYbdYLpW2EgxMPT0Cs8aknLLZxzcY+9edT/bcuHfJAOaE9?=
 =?us-ascii?Q?A9B+gSBwi010l4HdYd2gnREWzvnDSNVKTrMt1h1vgLbVjq0h5wG7bmEk9bKo?=
 =?us-ascii?Q?rYmmO7hiHDDMpIXjjfOcdCjK8xi2Lq6d+uOB+1x5nifiGDimJmR40bF5GgUW?=
 =?us-ascii?Q?XiPCbpz5pP2qBq+QRNWgHygeb8aWFx7gYeSp700OJof4ln2ZYlI6qA/fdRwv?=
 =?us-ascii?Q?5f+pmfolHWMMlkxfgZcd4woOaDvgTAAbUKhLOesJ3DBk0QQljY1e0hElE75i?=
 =?us-ascii?Q?REG0yfh7MKDSe5lTtvdjWU0K5I9EizLjixWcHawn+9p4S2dbjsBPJpna76Bn?=
 =?us-ascii?Q?NFUbwzTvS+MAjTbUOlefJWwmlt6jESW2W2GkHUMd9uVuIwFUxKvoipC+7Ebh?=
 =?us-ascii?Q?0TwZJlaOJnfTNmY/5mkARZV60netSfCHtwHvlU18tKSzeT2ryjEai72DCUvE?=
 =?us-ascii?Q?tdr2BrmKYEulm1lTugh/VgzuQBcPgkn9RBQGARAPiUPZNhgo9Guei4YBFdN2?=
 =?us-ascii?Q?1Nz63zqSepj05E73MEWU4O0hZDLtenQsv59E1rL2l5hFTrW1iv9n57UWeL7b?=
 =?us-ascii?Q?tY0IVnglBhHjMijiJ6GL1wMhf8UhqjF8V4Z1JO2VRSTYiW/gWAkkKuEV+6dW?=
 =?us-ascii?Q?8gKWOGGlOnDngeEt23bVq8sLMP0T5DOG4eHJMMqCIxyaq+mjIc8eBcc2XE21?=
 =?us-ascii?Q?9L9DU7uJ10/dtZtdXcHNJOl1tCN8XgQGVQNpP4A/tuPeBhXCPNyE+4gnDxr5?=
 =?us-ascii?Q?/ff7mQEV9z3qBIbwsYvPo/ow6ZFxAA7wlPQu9Ry0msZTCHwAbx+mC0tNlPeU?=
 =?us-ascii?Q?ZkPIocbWM1VUuXrBbS4KSL6iFQtMvYJjMl65tFoo1G+v0/C+gWR+ORZAEt9C?=
 =?us-ascii?Q?XDFf2zqHzfEB5e2u5w6QM7lGbmWa+giHFVy8XFiQuQhBGWs9LTJAsnDxxV+D?=
 =?us-ascii?Q?h4qfGL8i4WOS/lnr4CobjkUVBtXtlVU0QpK9jrhcKON1sHDui9ZvorZMOnNf?=
 =?us-ascii?Q?flEa4J1U7mKfRWf8zb71QA+JOEgSaC2b1O6vYQw2xn2Wr+bm/FtiBdjj8M+l?=
 =?us-ascii?Q?MfP4XrrzSJLpd/HH2d4PYJR2x9GEKnCB7Ks+1qgA1N1wQxjijAG/ThNEBIOs?=
 =?us-ascii?Q?vf1hpcqyeL3Ei+ZD+ToYHcLrP5p7NYwFSkeYkG+MytA+ikcIJVgl2t9aeTVM?=
 =?us-ascii?Q?8k+W1bVp0+Uz9vicbaNf96+yWcDkTa0hj1KkpqXFRPXlgjHAkfncNgMfJvZf?=
 =?us-ascii?Q?9mt+LnoKYWpczqEbkSBmrWBUV3OKSenhbYL6N0GAi+bM8gU69Wp8Ogb0c0iN?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4d113c-ad73-4271-74dc-08da970daf57
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 11:30:26.0959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1iDDpElxEmY6Et7NoEA7/eE/J0CXMNTxbMxgNRv3sDs4FoUlOnOHNV84ILcbm3lJ9xjRfWgs09rTi4Qrpu00OBLdi+HEquW9ErtmmsNhII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6557
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_06,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209150064
X-Proofpoint-ORIG-GUID: tmIbRdp4tEilzTEIc0urHf_Rv2gA-BEE
X-Proofpoint-GUID: tmIbRdp4tEilzTEIc0urHf_Rv2gA-BEE
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

Hello Laurentiu Mihalcea,

The patch 1a01e1927802: "ASoC: SOF: compress: Add copy function for
capture case" from Aug 22, 2022, leads to the following Smatch static
checker warning:

	sound/soc/sof/compress.c:315 sof_compr_copy_playback()
	warn: special assignment for copy_ function '+='

sound/soc/sof/compress.c
    300 static int sof_compr_copy_playback(struct snd_compr_runtime *rtd,
    301                                    char __user *buf, size_t count)
    302 {
    303         void *ptr;
    304         unsigned int offset, n;
    305         int ret;
    306 
    307         div_u64_rem(rtd->total_bytes_available, rtd->buffer_size, &offset);
    308         ptr = rtd->dma_area + offset;
    309         n = rtd->buffer_size - offset;
    310 
    311         if (count < n) {
    312                 ret = copy_from_user(ptr, buf, count);
    313         } else {
    314                 ret = copy_from_user(ptr, buf, n);
--> 315                 ret += copy_from_user(rtd->dma_area, buf + n, count - n);

This API is not ideal.

The static checker warning is based on the theory that if you combine
the number of bytes copied from the first copy with the number of bytes
from the second copy, is that useful?  "We copied 100 bytes.  But not
necessarily consecutive bytes, so you'll have to guess which they
were!"

Generally if we're copying from the user and the destination buffer is
too small we return the number of bytes which were copied.  But if the
user memory is invalid we return -EFAULT.

Here the user memory is invalid but we are returning a truncated number
of bytes, so it suggests that the kernel buffer is too small which is
kind of misleading.  I guess user space kind of gets what they deserve
for passing invalid memory...

Also it looks like we can't really return -EFAULT because _soc_component_ret()
is not able to accept that...

    316         }
    317 
    318         return count - ret;
    319 }

regards,
dan carpenter
