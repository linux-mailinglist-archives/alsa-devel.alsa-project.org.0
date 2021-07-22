Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED83D22D7
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 13:38:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B58B16DA;
	Thu, 22 Jul 2021 13:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B58B16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626953912;
	bh=iEDUT6zc82H6rfhZRLdMM3B3lh9vBR6mXtSjSEINOi0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZevI2sN1CTJ2/0Am3BpauEelYOQ4jaslGgB+cWWYX54AIDQqwnkT74Y2fEf/NppzO
	 Q+16suwH2JjFRNVqDwP4hPu+Br7ZK3pj1buhCIhZbHgqPGpxZyDDeT+uprYvkY/UTu
	 whgpTj1dcT2XFOu/w8h8KepF5e13L+5ICmqJ2zBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1721F80256;
	Thu, 22 Jul 2021 13:37:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B94D0F80227; Thu, 22 Jul 2021 13:37:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B439BF800DA
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 13:36:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B439BF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Gzc09579"; 
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Y91fCPBU"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="d6lHc3PS"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16MBapjF029017; Thu, 22 Jul 2021 11:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=nLSaQkdzXr2k1k6/wkF8taVc8eSdM9rxddeUbYFahoY=;
 b=Gzc09579eJ6ENkERXxdhWbQy94B8KEP3uUn9AYbtADvpVInXtwdRwPUaqKV4GhkRoG6B
 x2LWao81q2OMfMYtrrUwTaby2X2kj+AuyFfmzaT39xUSZ6VHPTefHAwXCBD5uy7G34Pn
 qk7NhwpVWDJ/gwHUXALT8nd1hOx2K3obKp7ZHmPsZ//b8mnfvkQf5QEyxp0gAU9RU4GJ
 tqGVUqzBHILkHh6Q9mh5ec0GvjeLqLiaZfXFLyHaJI8Qws1EnltrUuqeBuhYz+siMhEn
 es4k2xHuaM0oUZIxnOq/TVahWaibMzbI+s9sEzW8YPc0PQdUOfgH8uEFVmf/FjIdrmMk Rg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=nLSaQkdzXr2k1k6/wkF8taVc8eSdM9rxddeUbYFahoY=;
 b=Y91fCPBUUeL11cqsRJeEhg+LWVjDE8wpsPW4Nh6Sv7sw/s56H4YjFVkhLVJ+54LI63gD
 qiPacxIxN9Cd3Upy1TfKr18lR8V9deOXSzG+Oh8KU160mOQi77Wds4nJZnSyC+LtG43J
 WqUnp8sR6MXsEicQFKmWl65mNbISWkaHAtW/OxpgMf7EQg+uuqpMRz67dbk5pecHWG40
 XnAQhVCB9ZDbZE99rxm43/8zPqckzA8nNZwYSnr5XPN53Ziwft/EvQ2FUje+ZSHcbiZC
 Yq325tKO3mx6C/RsocKNjY1YvyUrgSQG2XAIFSlvCaPmWAbTpD3U1DvO19RMS15RUwwk Sw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39y04drub9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 11:36:51 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16MBYVoB161023;
 Thu, 22 Jul 2021 11:36:43 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
 by userp3020.oracle.com with ESMTP id 39v900dkqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 11:36:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzaTQ2ZIkFj+TBMzAYqVikG7MWu/fqJE//OMyk/lINK8M8qdam0FrdkZk6d4iVw63xfUVRX/memm6OtYmID+QU63Y+2J/jEcWoeRT1jQ5QDT495AIxj9pDO6PeUMm2wWJMZpyTO6bJNAMg6hCHK86zq9bZL3DzWBlzM/9nQ+3Ca/KgqDPgvPKPQaCmhaOlK0SP63b6ntRYQja4k867cUCKG0NKUuFbRbb4/EbdByPNw+UDMm51klviuttAIOt4gskLOirV7RG1onauO/FOtJinZTdXeybKtHdmJnkx+Hgazp+HgXn33MK57ylw2apRyoKOacs/ZoR7Go9745U1xprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLSaQkdzXr2k1k6/wkF8taVc8eSdM9rxddeUbYFahoY=;
 b=Tr4GNzLP+juu5QBgfS/dJ/UvXR2pgBDL7cb3HrO02ywLLAz9w4olsEDNmvUWO/1GrWHFlaP34FxRrVY8TMOrZ4NLUduJbcSz6fcb9qeGin1oetFU9ZnvaVtWfn0Y3Tp2aEblHKxnqH9s815vIJ072xNe+lbiGX7RWBjcNF3+4Zxtr2zrM3t0MZfqEQ5ldaYn/75em4XECw9Qnvu5wZhNj15JkassZgG0AXuBODk4Yft3MIck5D4ie8gOPlioJcM+KHJR63i8syvWr6m65obGMtDNoeuanYElcvUuVEBZIAkfhVCi6Jr46EsoGvOaxpjuqjT5yMWU91Mo34GkCcX6oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLSaQkdzXr2k1k6/wkF8taVc8eSdM9rxddeUbYFahoY=;
 b=d6lHc3PS3UShA9p3pG/8myYSY0xmJeTjI+Y8y/aP5Js3ODYMbyLJxJPprik0Bto/SkmmKT6NcsYAwzZgAxhuVBkQ8rXpvgkQnXcwEJPAzfUnBNNr7uLYdBJQ9tLIxNIQI/I59ravW4rSYVUYjH/bX4DvKaMEKEFic3Ai4iuxn5I=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4707.namprd10.prod.outlook.com
 (2603:10b6:303:92::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Thu, 22 Jul
 2021 11:36:40 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 11:36:40 +0000
Date: Thu, 22 Jul 2021 14:36:03 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Subject: Re: [PATCH] soundwire: stream: add s_rt into slave_rt_list before
 sdw_config_stream
Message-ID: <20210722113603.GX25548@kadam>
References: <20210722105611.1582803-1-mudongliangabcd@gmail.com>
 <20210722111654.GW25548@kadam>
 <CAD-N9QWjjmUUSOmcBJX2n0zJrNRK3hPd03M=NbAfWNamEkfhJw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD-N9QWjjmUUSOmcBJX2n0zJrNRK3hPd03M=NbAfWNamEkfhJw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0026.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::10)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by
 JNAP275CA0026.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Thu, 22 Jul 2021 11:36:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f631fcf-9c6b-4d62-5c0f-08d94d04f8ba
X-MS-TrafficTypeDiagnostic: CO1PR10MB4707:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4707061C95776C605D69BB708EE49@CO1PR10MB4707.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N2j1SjbhI5gW7rQVzeuMV9EZLJLqojVY4Vdg4fhYz9iCU1Gaap/Rh2D8yb7R+Jmjxx+DadbBFt+W02ZkQiCJnw3BvO8kiJoPw7Eamr0h1pEc7bwWksmYPGHjyi+oE++eiVLsseH/ZgCSoYByZ5nKZ+yN0Fd06/qqw2Qs9Kjp6xeKl9JEtg9tDIiunDrNn+tiKZLkbDzfCOChy5mYEt+Dwg0wqpzfTzSBWagi8LpI8KYYBh2EcH9byWLE4BbFDVt6lWxWizN3QDiwfdwXSezGipluCZHsjQSFGXX8qw2QmNBBdaLN0Wnn6XMW+Fq01Mqg5/K9ccWRSC+h1MSC+TUp1ILJ6PuE7chXyDK2gi40PYmIwpt/r17DER23Qyr8w5HMNlm2XwM/YaJo29L6oZbxndMwfRfwvU0diefhDdTm5H/pGV37/kyviMDcxR0z+isuAs5zFhVOE7IpKpTJnAIwQWOsOA7tike9bSmFPqZ97YFyNDZ9YC9OiJELYfnXkTCMMabPponSXPBKoJ/KlcpbbqR8l0x8xgJamYZ44TbIwkevoO2xnaiVC44JJCE2NsOLriuMMh5UVUx9ZbByrhaAGUNW37bP4Z3iUQzoTeoqOPNrY5mpoaLHrCGtHSkC8pT/TaREI0PPMmmbJDEabX98wu+ikcM6C4wCbiMyPSA6Cm7imz6aiBk9Uzbkwdn0BeEnHsl3TBDIDuSwQi1J6wyFVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(396003)(39860400002)(346002)(376002)(956004)(38100700002)(478600001)(6916009)(26005)(4326008)(86362001)(54906003)(6496006)(8936002)(33656002)(38350700002)(52116002)(2906002)(44832011)(1076003)(66946007)(316002)(8676002)(66476007)(66556008)(9686003)(186003)(6666004)(53546011)(33716001)(9576002)(55016002)(83380400001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EIxHv9/tZvSw6CtyCK/c7lrdnvwEgMecfU1D6xzVEUrQk9RQvazL+F2ZRxOb?=
 =?us-ascii?Q?s2WJGBZftjtdam7IoNRQ41hRCxJmTuONX5+vqEZNfWashQh1w1R6KVSP143f?=
 =?us-ascii?Q?tS+mwWX+7GjwlBQQU7oRfllzRoBBc4yueGwBH8OqhHR4F8iiaoa95THhl2GN?=
 =?us-ascii?Q?RBNQxUoobLWpAIpui1oKn5ZHK/a2OeiIiNrByA32mEPHHPIib+7SSPSGbVZA?=
 =?us-ascii?Q?+ifQyAF8LEfDEB2NkQRsBbDyMavxiDvmu2+t9YEAvPrgUR/V1CnhVgeMOS30?=
 =?us-ascii?Q?+328//Yo2NgCxZ2Mjvxeo/loVYCkGMXJgWqP3rHEc3HfrdkjCzM8BxBqQyTr?=
 =?us-ascii?Q?vsguhiI2V7yDz3M3beHr4816d9B8sy+6yZhVr+8TqKblGeAUKfCvWYhBKHWL?=
 =?us-ascii?Q?0lax08inVEYz/HxjxUNSsaWkMzn6b4bkQgJHqf+jarPK32MzlZdlOlV/ZRka?=
 =?us-ascii?Q?x/z/vXJVqXs4mLRKnthiCr5xBPCvqR51ABI27iiLsvYwGEkwpRlnZi7D0pFH?=
 =?us-ascii?Q?Gzg46Gtjr0RUGoIqEs4rGBs7JRJtNWvUN0o5CR2DQ4KpTaRZYIhfHIlgX6Qk?=
 =?us-ascii?Q?aEFjtU8IkLWBz0dIMBBd/H3oMzCoKdSdD9+XfnaYnYBni9WkQmk1Q26Pk0P2?=
 =?us-ascii?Q?/n0V/dyPhp1oVaUIFLaxsPKn0vbz2yZkDR5gRwwUGQr6GaGofgAalA1PDHc1?=
 =?us-ascii?Q?wVUk5DJkj0JA3MRWAPWGvxjlNgjLw4ENFAHjSiiqXDn+6nzvWKMdzGvpnwzD?=
 =?us-ascii?Q?/NlLg84R1S9k9Mln9ZkXLK01u6ZMeY2nCwjpt5lVo2Dq1u+31et0rzjA+0Q6?=
 =?us-ascii?Q?qB98r9RtL85U21W3TRnpAWzdmbbkj7A5AdqB4p/t2ckDyulbBQcnfTgZTrQM?=
 =?us-ascii?Q?UHeyB0EIMWjwO+gSEkIiw+240PY8tiMvx3Ow8j41rydwyyBZGpc8+7dn/kau?=
 =?us-ascii?Q?1gxbaH0HAq8ZJlJxxOkRqP82QxAwBEVLFSTQ2ODGK0E+ET9n8NQ55r7IOsNn?=
 =?us-ascii?Q?MueFexHAfgAvEWP7IaXPPQTwjOlrSqpRoJtSqJrc9o+qmCtPUOOr8VbJboF5?=
 =?us-ascii?Q?XI79hunHcTZk4UGa7o/Qg4DM2UyPBE3Qob/bxCVKoM4/m814mmHCU3W2uLEF?=
 =?us-ascii?Q?3lGmqfVhlO9OtsxYItJh5+EBJM4QFox6rSjIu1HDSzOUgZJAkQmB+9czyAQV?=
 =?us-ascii?Q?XKHNABk3iBAKEMvR7QpBu53vu0ysDbcn24vExSqGYt6ZxaaU//inp0WmFMbv?=
 =?us-ascii?Q?z+R0fZvTzsUKIbCw2UZW1WxM1gtpPQ31zrC0mBkhg928btep0I3AVcVCzAwQ?=
 =?us-ascii?Q?VMlLq2KZvgMp+KGP7WB5V0ws?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f631fcf-9c6b-4d62-5c0f-08d94d04f8ba
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 11:36:40.2393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/lcNAZmOb0yc/NNOB3+Nwn4QBxG3hkQm6oftUsUiMdfOP33JxcwDMRy+WsymfvR+xLhgaq/apdu1hzJN3BjB3FWT81TwOYXmrnbe3l8EVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4707
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10052
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107220077
X-Proofpoint-GUID: 4kX6Daw5wUUG9ge1Liy49FAKPLI57DWx
X-Proofpoint-ORIG-GUID: 4kX6Daw5wUUG9ge1Liy49FAKPLI57DWx
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Thu, Jul 22, 2021 at 07:24:16PM +0800, Dongliang Mu wrote:
> On Thu, Jul 22, 2021 at 7:17 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Thu, Jul 22, 2021 at 06:56:11PM +0800, Dongliang Mu wrote:
> > > The commit 48f17f96a817 ("soundwire: stream: fix memory leak in stream
> > > config error path") fixes the memory leak by implicitly freeing the s_rt
> > > object. However, this fixing style is not very good.
> > >
> > > The better fix is to move list_add_tail before sdw_config_stream and
> > > revert the previous commit.
> > >
> > > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > > ---
> > >  drivers/soundwire/stream.c | 14 +++-----------
> > >  1 file changed, 3 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> > > index 1a18308f4ef4..66a4ce4f923f 100644
> > > --- a/drivers/soundwire/stream.c
> > > +++ b/drivers/soundwire/stream.c
> > > @@ -1373,19 +1373,11 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
> > >               goto stream_error;
> > >       }
> > >
> > > +     list_add_tail(&s_rt->m_rt_node, &m_rt->slave_rt_list);
> > > +
> > >       ret = sdw_config_stream(&slave->dev, stream, stream_config, true);
> >
> > There some sanity checks on the stream inside sdw_config_stream() so
> > that's probably why we didn't add it until later.  (I don't know the
> > code well, but that's what I would suspect from a glance).
> 
> I think those sanity checks are not much related to list_add_tail.

Yeah.  I can't point to a bug that it causes, it just feels ugly to add
invalid data to the list.

You didn't add Rander to the CC list and he may have had a good reason
to do it that way.

regards,
dan carpenter

