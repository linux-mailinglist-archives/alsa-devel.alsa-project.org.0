Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BE03D229C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 13:18:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8165E16D8;
	Thu, 22 Jul 2021 13:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8165E16D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626952738;
	bh=dCSlrs01R0x9DjC+T+4bF4YnXUxG9FqHqGpcJNDj8LI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dLC76yabhtjBKuumZcyXSYUmlzWiohlXEgVbElLmEXVUvJWbloIDL2wNTIGJQJoGf
	 MqigSJ9vohRL4bfn8+nZ2XUeUBQRbSeyDLknDxbldlCNT3AhkkXcMYViCAVdqQ1GNM
	 pDbrZG+9NSgJYaB6O3tT5Ja4wEXuqrRpO/XQs5Gc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7153F80256;
	Thu, 22 Jul 2021 13:17:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22716F80227; Thu, 22 Jul 2021 13:17:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23BBBF800DA
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 13:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23BBBF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="cpVAoGoF"; 
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="kL3k9PWZ"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="YYkVbBgH"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16MBCNi4008935; Thu, 22 Jul 2021 11:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=w+5/a82sBp5dlIH/m84y8iTC4X89j9XtyKJ9XFfKmjA=;
 b=cpVAoGoF7PDdM4+6JC8xUgoVxXLxSTRvkZ2Y4aYtN94GBwXYRvEZLzFg6L3Fi8dkdrBH
 IDJFagHOMMVLhg6U9AH6BZXMI/ngUARZlY3F+aHHoabkRiUkiuPGm/Y/cf03nq/FaGHG
 cm4yKvfkjpcub3MRjqWzsGwyNSOtZhZazp29EK3CBCVUUntt71VOvQDP8kcew6FExAP2
 DSexJgOXbmQbevVjW4I88HVAEtD6wBI2WHLZWFDZ0OWlsynORccBxVamQWLt1bvWayJH
 enFg7ripwOSa4RU8LWvntuLRyIicjUTgi1+KOS+RYFls10gwziM/HVFKxDSovvAGvBCn Lg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=w+5/a82sBp5dlIH/m84y8iTC4X89j9XtyKJ9XFfKmjA=;
 b=kL3k9PWZXBfP4tpxeL5IUX0iNPz8Y1IFZt4kTrWxeL2gDqDf+ccMfEZ0yFvxM4CUxtzp
 tlPLIbjT4URq5aF27bzE2gHQHSjFf5Av8PHMjocNqI2eD5jMphMH3Vmk5W9o4wKajoTO
 x4lryDxLdUmPDMU2fSQKEm2/GYNxS9OzmlWiezqCTxUi+21V9bMuj9Ae5avQClEcibJV
 SoDGJGmvzWWOSUHc2/y3GvN0Yustx5GTgcuS65GoDkonSFovAnKoZE+p0lZ0lPn1EqMq
 qb88IO3dvfqc69PB3DGPmzBQ8SAzT3Rzjz+f/KwwqVHn2BBdq7tjJG3T9uAo5Zxil0/D Ng== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39xu2fs8m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 11:17:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16MBGbv7144869;
 Thu, 22 Jul 2021 11:17:17 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by userp3030.oracle.com with ESMTP id 39umb4pykv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 11:17:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikI7jvqw91BWebA5QDezr5A6Hf//KNwnPcqRHcVFWn96Sy1EZXz+/XUzSiw0x9DXVcSDL4O3qUO32vf3fE7oqurTSi+L9ugYEhRoKiyoSOUljUn8ul6QQJjjt3B9Azdc0jJzXLd/9ZiFd8sBKMrusn8wNAJGWBUHNNx3vCOsAnErNkFsleCZo+e377BJB6wjtPeozkyq6DzFn6k8qy8OjCWk+WWNuZTkUtyUjxXW8BHtQ6dT36eHQhCCADVDNmIWosIv1y8TAdza9VyIOVWp8pZTw1+QrS943pIz9Y4X2JTQgw2iKL2XWE2LleZeUaDniGhpJF0PECGkRFFyE5HrsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+5/a82sBp5dlIH/m84y8iTC4X89j9XtyKJ9XFfKmjA=;
 b=EQuoMxrtGf+cAwjir8wCpnK8kk2oB4bULN6wkQ0Z0zOYXuUrx+RWyRBePXtvqGQuLUmp5mCiLWg1XyU5wZ6yesiqDK+iFyXlk5OqU6b4w43b3OX2b8anHqbkRCmpkq5iw22NO8f2lJsF49/kdO/KuFbcdtBc2K6rYbFVq+prkFrkHQYUC3XQNgbxZJ0I+s7h9/ipIVjDQMEp8e7lVMouxMWpPgb+Tslxn9Ln9/Ejvp30t9c8TORquqhOdjEnaxtL2wjUlU+vMbK4DyVEllKzPPecV5vO7S2P1FnTfuM4VCiXeYzC00uhsh1kUO4Mh5BRpL2nXAa6h1eAMyi9GHZ9hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+5/a82sBp5dlIH/m84y8iTC4X89j9XtyKJ9XFfKmjA=;
 b=YYkVbBgHZQn+x9Da4M68hVP48Tmj81RZtesLNaY18pGyK0rjsAPAdUXfOhj/lpXo4679h6TyaYjvtTaUs5RTN+ymEb290/QaipHwlF3vViTDIGQQaD9DrPOxxUzfKuiMl9oe5O1VUA9zgrHV4xs5nPKJ5A1LssrQ2yINHkHBZCo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2253.namprd10.prod.outlook.com
 (2603:10b6:301:30::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Thu, 22 Jul
 2021 11:17:15 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 11:17:15 +0000
Date: Thu, 22 Jul 2021 14:16:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Subject: Re: [PATCH] soundwire: stream: add s_rt into slave_rt_list before
 sdw_config_stream
Message-ID: <20210722111654.GW25548@kadam>
References: <20210722105611.1582803-1-mudongliangabcd@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722105611.1582803-1-mudongliangabcd@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0024.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::36)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by
 JN2P275CA0024.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Thu, 22 Jul 2021 11:17:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85015885-d6cc-4a27-57a9-08d94d02426f
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2253:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2253C6D605D4524076B13FD58EE49@MWHPR1001MB2253.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDSudFiV0IY9o8bCVzRneXDIsSc6TdGVtc112pmmvJJ27wW0ITucbwXwPLdC4Dxee/kLvEt6UELtZDHVNsy+v+v0aKd9VTuMAa+e/DecXS4DDRylh91/CvfVRJ6Lyj6zTkSs/9G7jn32m3WKWbugRKyLbuiAf74yB5RiKAU0e7Oeq2o8jrip5nXzfixOLS3Kgce+DJjARDJ322nhceciOv+hmRUmr7KXNVnRBpzBaYbTYSexZRnKkgQ9d91VFw9w89O7NcghLsI67nYHoJxVxaFq3v3sJSCXvMyNhpclb+X7nGJTWYztXjpJqaN/iXKIrzbylTzvFJ5Hw1Q5UZDL/ZSlgcgg9+yn5hpi3Xt8iV0D9CRNaVjcSBYUR+7Ns10jMyoQN0FcZwVdjCPaHay+WwKYpogXuMM1h3UoMggwUYXSNN9/MWDYT4ZSakvG6T79HNx/uyW6ogTBFdu5mHBFShw4jGzSgW5KfG5rqVZtFXvYzF6Lo2/UQRW/VdE9pKOD3Oz/lEoURrXXooKwxGv+yEbz3r2zHDbA7tQBF08RegcXT+E8dZ3HyzjlZ+Bm/3a2Y8EW9+feFeEPJqo9oZBK8qeTGjOGp/MO844uFRLIhcDnP0JLF7cRCEg8pZcOhLtZfHHoh2zLcDVPLOgGT19zJnQ9RweVcKIz+vWkAjN4BzHCcArWHLdqORgZde7m0Fpn9Yn4T2hsOywRC79n3xY+JQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(366004)(376002)(39860400002)(9576002)(956004)(8676002)(33656002)(8936002)(55016002)(1076003)(2906002)(6666004)(66476007)(66556008)(83380400001)(33716001)(44832011)(38350700002)(478600001)(66946007)(9686003)(316002)(4326008)(6916009)(6496006)(5660300002)(86362001)(52116002)(186003)(38100700002)(26005)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cdZLWucnmkafJieHggRivaghnLA1L3DN74/bR/TT8+g/I1bSx+Tc67SZ1Qho?=
 =?us-ascii?Q?cqTkwZV9QLJ/mH+UIjMFVluKXvXYpRu0vTEEsOoFbZPyIShK5AYsZJS6Aq5q?=
 =?us-ascii?Q?ZgLFvU71Stp4+MOLdY8mtqw2uDAKaZkWVCjh02t2FHfygrw+zgfR11HvgcWh?=
 =?us-ascii?Q?JJBclVAeY8WGON+Zv++J6lcBzdE/OX6/vxbg0U0JJqx7NgEKJqfdizMMOxKk?=
 =?us-ascii?Q?UKAfXlBWH8DqC7bp5JAbxV1fkQ7VssURHrK5w59lms6tlOGUTqtEgMER/XIo?=
 =?us-ascii?Q?fRC0DS+HgdXT15j5qaalzhztmAqp4ccoUEBiS6wrDoyBiUxsghcx4AF++ioj?=
 =?us-ascii?Q?Z4QdN28qHzXZQgeX461+jQ0QUmru/tR1u/OdR7bW1Lp5cGlDv5Wy3VmMDK8h?=
 =?us-ascii?Q?gaEFAOas1isPONqg6/avBhP5DN4fsO99QTGNSDe2SdvmJQ4tjFb0ToHrxAB3?=
 =?us-ascii?Q?VH4Piw6cl3ebCkUD0Wh5WzapEg4aj4eh1xDMFac+CQtozBz7AKdTJgeci6pR?=
 =?us-ascii?Q?KP15tf29Ch4mnwa1JJdDeseWqCxK2xDkffbqnMkun9eYR1QTqSOusVAz3c2A?=
 =?us-ascii?Q?e6euJ0XsNxLTwAUCkqx90K3eg//oBXB3HyM2NJRvkVgb47WBc50W68/m2GbY?=
 =?us-ascii?Q?NlSbrZKPCSnaIbMS9HCO/WoSnYztlSgqsM1vJmjLYfombaJhPBDoYdJLUHay?=
 =?us-ascii?Q?HtHAnylM7Ph4C8ADgZUOalwF4N9w217phJSuLLWX1c96UI933XdRQBr+J30r?=
 =?us-ascii?Q?wPfbkyJVEf4gOfLDVJ7TecbACSKP1QMPZK+hiLvaLKE9SbhI7YA73i30Eyp2?=
 =?us-ascii?Q?CPM1IoLH0xGgcxF0KAAwDsCxsZciWoZemyv+tcygGcxj22ldz8pU5SKjsEI+?=
 =?us-ascii?Q?rcqMvwaFuafq/Rkn3icskiB6749bHzrO5A6LKr9EmkoM94m9MxFmUYOLUhzs?=
 =?us-ascii?Q?FliVSE9hqXt7z4VvYevVkZ6bb3Xc4E53K+ma8/VFeFVcVOQpqHBD+15+IXNG?=
 =?us-ascii?Q?m75hEVpnTdpdeFzCkKskC6JxCLaeGEdZfwBuk6+jK3pwbkrIKTw6m+IbtqB1?=
 =?us-ascii?Q?ocmkyBjW4IQ0hBd2rnxI+EMh8E3S7y7fqW6HbcIGEW1iln3w8ZKcl86ll7sB?=
 =?us-ascii?Q?p8hbp+wuHozPf4plkmlbnPkA3zMUqpi9ZYSt6qODp+TscgmyoTySgl0EFDN1?=
 =?us-ascii?Q?WCfbhuxt3UCPljrj6TL+Xkj21N1Y+PzsHqs1StOUJi66RxS5uPusI2ACVBhx?=
 =?us-ascii?Q?yG5jQPvBmGxl5vqpZ6rN7fhF1upQAXd+wjwecK1Ms1AwlfIeTM/s917ilbvX?=
 =?us-ascii?Q?GUvu2GNdGpAZpsp5ts/e1Skt?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85015885-d6cc-4a27-57a9-08d94d02426f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 11:17:15.4669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uik3v/yGXL6FO3Jw13gRFXr1d4ZBpDuqJhf3fTuA47KCL/Im2S10Z6EMBa8l4vXmmsxPwz8xXVi5ul6g5qM5Cej0hq3px/20N9liTPFSnII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2253
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10052
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107220074
X-Proofpoint-ORIG-GUID: 9rrS4eAiDtBn9q5-0MApTpPFNeAsumPh
X-Proofpoint-GUID: 9rrS4eAiDtBn9q5-0MApTpPFNeAsumPh
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
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

On Thu, Jul 22, 2021 at 06:56:11PM +0800, Dongliang Mu wrote:
> The commit 48f17f96a817 ("soundwire: stream: fix memory leak in stream
> config error path") fixes the memory leak by implicitly freeing the s_rt
> object. However, this fixing style is not very good.
> 
> The better fix is to move list_add_tail before sdw_config_stream and
> revert the previous commit.
> 
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
>  drivers/soundwire/stream.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 1a18308f4ef4..66a4ce4f923f 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1373,19 +1373,11 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
>  		goto stream_error;
>  	}
>  
> +	list_add_tail(&s_rt->m_rt_node, &m_rt->slave_rt_list);
> +
>  	ret = sdw_config_stream(&slave->dev, stream, stream_config, true);

There some sanity checks on the stream inside sdw_config_stream() so
that's probably why we didn't add it until later.  (I don't know the
code well, but that's what I would suspect from a glance).

regards,
dan carpenter

