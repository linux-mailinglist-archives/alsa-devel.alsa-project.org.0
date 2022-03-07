Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA934CFF06
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 13:43:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26BDD16FF;
	Mon,  7 Mar 2022 13:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26BDD16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646657014;
	bh=IrHmaNvGfWowB6fExoJboBxRsN8MNfh32LPJeBdbN40=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jIstxqFyJ82RaLbFkEW9wZty57PgoQ2tMA8tME7iaLmzZqyFX2oAgDYBg3yr7ma8m
	 iGSYBnZJFMfmRIJWoc7MrlytS0mVCFu0INNU2cFnqjhq0P6hbqadk4ym39JKtVrzao
	 k7Q8YVradxZAgkk0r+Lb4LAvfLAKzbB/b9oxhrUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97FE3F800D1;
	Mon,  7 Mar 2022 13:42:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79B9FF80132; Mon,  7 Mar 2022 13:42:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED4BEF800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 13:42:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED4BEF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="aOwbHPVt"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="jYLhO5D2"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227BsdX5018382; 
 Mon, 7 Mar 2022 12:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=/5zHW5URHlM7nq041fjQa3VB3OX8bVQMV6ybCu3h+5Q=;
 b=aOwbHPVtVnwCGaKR/oJOq0KRscs2G4ORjaoQRf2/6Rul38XJXnoz/T43o0yomLGkGIFF
 TZS3iA+UcA2EJ5UX8ig0yWX6oHhGri9p8fmoHVP05dOYz8EF3+4O0r+98EsNfaet6/Ki
 95SyvHSlVU4nJG8gdp9F/s1Olz+QTE4HMOD5lIUddzaE5/TOpYQ48DowKf7u6Y3jUMB8
 UEhqqcViSPmyI+e7Xe/JEAJ3wrC0drRSPTQCbR0sWE1ROH2OB1DXl3cPzPFJknH/ZHKK
 1L07lNigJalXTnS6RnPGhx0vMAR/3jdwWAw0lIWgjka2PunAEdmlV4QYxqYkFod/odzW tA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3em0dtupkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 12:42:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227CecpQ005834;
 Mon, 7 Mar 2022 12:42:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by userp3020.oracle.com with ESMTP id 3em1ahy38c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 12:42:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mma5k2QZ7ya8U4NT/Twipos7Ns1DjLkVti/hTevTf1qK8v7GRWPiQ92o8wu2QHdErNJHxVycLMDmpq6gO21YCBwN94lq6CGTv7ZewXMHF2qjpxN/fVB21vTFwWvnqriX1SJ3ykA/3x1eIAjNFQdOn7GloiIs/An8ZNNLWuP+IVAV7UM3WyWvPRfK4eFbyMeSUcsZaWZ8xVZ1mPsc5bh1qOcKSCYw2x6c5mbsGxp47920jLXQIXBBtAfIQwVGzrARLMEGvoPwEq512/eG3hliw4wbWTc4Wpb9mOLkEiTNZm631j/oTr85/r74lH6/L5Y05geHX7K/OScjnf52Vxn9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5zHW5URHlM7nq041fjQa3VB3OX8bVQMV6ybCu3h+5Q=;
 b=ebmaCyeOL+UYhG+yCTMwLOWXkBoTPsrrQOD+FCW8Q5B+GBL9vUbtwWhReZ0F/ALWdN5g0/8drNordrYWIRWIFSlJxeeKo9rMdHf6YNvjrkWN+dwoT5eym1GjufcCeeuryQkrBJD1l7si2GeOOgVK9WBnVeQGqVaQeIXk+f8eM++hQPPyUyZWqWlcf+M8dl13vcywaH3Y3lPkV+/J8A4raFHtgrBLZdykYxqnY+ZtVmif/tmFNuyPQeodhL6vBgy6tiluhyrnvG/XZ96ipv+YPNof4u3e2btbzreSgIR5zkJae5oPleISRjXsCxAs/RJKmQG4hbGT5bXhwiLK1TpO+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5zHW5URHlM7nq041fjQa3VB3OX8bVQMV6ybCu3h+5Q=;
 b=jYLhO5D2+gqtpJHh3Rchab9EgNH96naDsOJM3RCykvT7GZIafCu75WbpsJVonqNvzTr7ZdSMxfUUTpjtNs1rnwSUGIm0C30XGtjJsk4SIcDERrB7klHOW7O7FVaukLp+4/tbHzs/BWhNTUBV61AwPVgjlJRAWkued0dy5H/Bc64=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR1001MB2108.namprd10.prod.outlook.com
 (2603:10b6:4:36::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Mon, 7 Mar
 2022 12:42:13 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 12:42:13 +0000
Date: Mon, 7 Mar 2022 15:41:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: amd: vg: fix signedness bug in
 acp5x_audio_probe()
Message-ID: <20220307124152.GB3315@kadam>
References: <20220304131256.GA28739@kili>
 <YiX9Kp9AFYNiqJcL@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiX9Kp9AFYNiqJcL@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0009.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::21)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9b9db94-f162-4d4d-9ae4-08da0037e71b
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2108:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB21089B1220E6964E3AE0A3FF8E089@DM5PR1001MB2108.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ST4ztkQLXoif+7Ix47oXbLxomi+dmIYYJaSEM1k+neMARuFjyVKmBIOPCMitvluGB8zlWJhQfRgPVg8glajQhVHuA7e2bHr32DxmjwfuQSOjOhNPaTaZu7vxyij1aKK+Yxsv0IqUlhj1w2nx4j+eoxm/x5bqnuTY9/ftfLTczmLHZItt7HUg/og0V5Q4r/ebcM5auR2MbDkO3wW6NGzfv52eh9xfIqD8tYzn3nwTzs3jspCywdTC780NaEmR1/V5zu7X73sVEVw7iJ2VusZj+CDVGTnGKVjDeYKC614iZFCnGG3+pGOZl9ydbuMj8NhxZc7/Wq7HDmcWr/Pa4B4Q/C0e+21eg8qZS1HCvJOiNpr3/LaQxJn69eYpZ80b0HF7Xa/bpTTgyFLrEcXb3y77EhGsrpHl5O30jLftwaFOl0NQbIVP+G8F5rIooKRpxVmzFZqq/C9AEZL/pnFdztcntG7ybrNxSYIi1eQ93U1CmF+Ibjazp/IJ8M1EQsOyuTiJIpt+p8R2YgGiRbhGr6fz1pEeqsXZKvjw5jM5QmHCKoTTpm+ECcPPylZYCzVQGBW+zZhdPx/NNJAa8GT2RVPtWUyoEqJ7wFy4tSSsS/BtUKwg2nGaqM5hAnF+07VmKQ7j2NhyqNNJZBRd+eql2N1gjOJPICFp29YQCZ/WRQhgvPH9pm23eQoI9Bp6Tcvn1MAbQ9O+Cqh86z82Rs19MXiHlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6486002)(86362001)(508600001)(33716001)(1076003)(186003)(26005)(9686003)(6506007)(6666004)(52116002)(6512007)(2906002)(44832011)(4326008)(5660300002)(33656002)(8676002)(66476007)(66556008)(66946007)(38100700002)(38350700002)(4744005)(54906003)(316002)(8936002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KqnBLLGqPcM9PbJNNlZA85G3SPy9W9/Ldc3C9UI6ITzb5D6dmcixQOXPA8lD?=
 =?us-ascii?Q?WUHEK50TB+XbU+zK/YBu/etWgsOvK2hfnEvUOdvpPsX2lraOqPuFLUXujoF7?=
 =?us-ascii?Q?pEi08z0nhrmgEnc4Mpa7JQDB4lGHYrP4Zm+67G7v56KfvVZx3ReRcNDoDTrx?=
 =?us-ascii?Q?XrbKvR7BvG9pOcESU5GU15idvCq+PxjgCsM+zxOk8o5rg824e7aecNyuecq3?=
 =?us-ascii?Q?mwDHe6Z1eTTUV4Eb6QOFwBKOxh+IUkWMNgDyDZ8zJ0Uworh1HuxtNrCulecx?=
 =?us-ascii?Q?7gz4au32KZRfTwKNgBqOP9fS+T9n5J8OsPgG+qrP4xBGyMV/BjHCWR0CrAOb?=
 =?us-ascii?Q?WEW3G9RhGBTezr3cRUowuc5gNdLJIgABlfsw1pr58YGBugnMGoebyYlV9kk1?=
 =?us-ascii?Q?c0emM4QyInhu6bRMxO0GlUe+gtOpUCJmME1GdrGXE+d86KFx7MRQQD4WQIrr?=
 =?us-ascii?Q?lS+4PrykJTcksD1uiTfp9ULz9cA9SJ5g1pnogjO1th/UMk8WD/SQhQxKG3Uy?=
 =?us-ascii?Q?Pqa61094gtrMfXmNhAZljufUKERdJ1r684DPgaVjX4fq0m30OGyO+z49M9U7?=
 =?us-ascii?Q?acqymx7RxV5MoUEgWSp3Tq76Y75Dw4zavv419mjRVUDgSlO1m6LnERCXhAxO?=
 =?us-ascii?Q?oK85M9AY7hRMCKUzGvoY7NSfCiyrXXEmshequt5NhOymKcg5t8gWmunezBMc?=
 =?us-ascii?Q?qHYPGX8oruuR3Q4nAgVm0dpabKc1498sKeSIxW/TB+d24NIEAQyY5VjXwC8f?=
 =?us-ascii?Q?OwrQNzkumZT1xpVVToY+q/W0pncjMFaW7TpThEu5GKU860n7YXM0OWTkV/52?=
 =?us-ascii?Q?GUBQofhmGCp1zKc8BTPC9b496Fj2HfYKfzzrOliIhuXEYNEA5+Iq6l+ZijUE?=
 =?us-ascii?Q?Z7XJypQxCzb0eYhoUzvvOA068xm5aoXtFwc4Pn58HDZsj4PZ1lM8Jq1IEAlA?=
 =?us-ascii?Q?K+j4g8El5GsT7bhsus6K1osJJapM4dhtokHS9YqTdiIh1EF6hRbccyBVG5SH?=
 =?us-ascii?Q?8wJGt5M0TwdeBObzInoh14YTmh8ONGudFKVSppBThwXeg0xaQod1exz4GbKX?=
 =?us-ascii?Q?ZX9Ubc17Xjb2dt5LwyQAs4CPjHl89oXYHoiYSnKKyJH6qus1ZUz5UJjr+XNm?=
 =?us-ascii?Q?zW3sG5W9u+UubGkgWOg3QQtcw4EY71CLh2VrTAuv/Q4RbIjt3WeBF1K/Zret?=
 =?us-ascii?Q?8WIax12hdqRKHDBqc9zXmTo7TngtNpx8oYENdTIvmxtqTgd7NGqlItpi7S8w?=
 =?us-ascii?Q?mTC+4qlZ4CQOQDQ+nOaMrJvFjlbpjIhnzYPwA7h1PG8278inuC1QnEdAtBW4?=
 =?us-ascii?Q?au8/P8eSMynb9CHw0uHq47X9Tbf16LRPgW+kZgbQGq0WAkGCDVfISHmKv9o/?=
 =?us-ascii?Q?4pLt6UeGhLsrgf3R9i4WDZY2fGx5T9zJUpgeB2/myyYtthuzMQd9g23oJhEK?=
 =?us-ascii?Q?XajhZIfj8ptqVbYFmVDBK1goapTd6IqZQvxv0Jn7Q01hizAoyAVKvjI/Qzqg?=
 =?us-ascii?Q?8Y/SqdLqJwnhXc0Iln7r0jadIb8jKZFQ9rhmi26BueyGUYaeCX+URv0gQJnr?=
 =?us-ascii?Q?9wzW2YPjt0Ds2rqJI/2MloAmrzwTkNWGmjOXrg1DgjeqE9TYgiLElD505KLS?=
 =?us-ascii?Q?Bd1UIEr6TeFhjuaO2rZilXOddU4AyvyxrNsmDyhcuJfMhyQeIyuOfFJTVMOg?=
 =?us-ascii?Q?3XaPsg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b9db94-f162-4d4d-9ae4-08da0037e71b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 12:42:12.8924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgfOzd5ZX9+6/lv89ADzWlHxNXhHaOM/GjGOKD3MzQNFUv+G1sis6FPTqESFQKLlzfVkV2wXdqqUNXQ0TZmvDp3JMoJSVapKcRDr+axs4zo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2108
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=772 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070073
X-Proofpoint-ORIG-GUID: z9jP7-APIw9h-85KPYR8VhFfPBgsEMln
X-Proofpoint-GUID: z9jP7-APIw9h-85KPYR8VhFfPBgsEMln
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Meng Tang <tangmeng@uniontech.com>, kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

On Mon, Mar 07, 2022 at 12:40:10PM +0000, Mark Brown wrote:
> On Fri, Mar 04, 2022 at 04:12:56PM +0300, Dan Carpenter wrote:
> > The "adata->i2s_irq" variable is unsigned so the error handling
> > will not work.
> 
> This series has a 1/4 and a 1/3 but no 3/4.

Oops.  Sorry about that.  The 1/3 was intended to be 3/4.  Do you need
me to resend it?

regards,
dan carpenter
