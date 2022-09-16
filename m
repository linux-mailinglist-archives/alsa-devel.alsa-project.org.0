Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD6B5BAF84
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 16:42:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3B99F3;
	Fri, 16 Sep 2022 16:41:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3B99F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663339342;
	bh=9UuQBI7P9kkk3FhiECd1GHgHN489BRGgIZ3vLgpvwxY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UHtbAyubUvOnFCKufloTu6NuzRsJtwfo6AoUoitrqSqYDm7UwvAcWN86GWXJF0itk
	 vaef4Gq+v0vt1FsASws5XYC8m5qy6fXYccDT3uei0slE+yNo2PJp3ZkN/ry9c9IDUx
	 7G5g6UYo8eUDNhY5y02pbSzjZ2Q9qHCSUacdRaWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C92FF80496;
	Fri, 16 Sep 2022 16:41:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81D68F802BE; Fri, 16 Sep 2022 16:41:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 767E3F8024C
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 16:41:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 767E3F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="oYDAApdo"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="sar+90sQ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GE4QX1014320;
 Fri, 16 Sep 2022 14:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=92O6lMkxvUp55uDMzTl6rYk8qVHfPG85Qz4s6za2uUo=;
 b=oYDAApdoARzbRZOQXcrwsIhxWRzC0D1f19OU+qACPYEv1EcnEyR7kVdN+izCLt+bH7JG
 RnAduG/Q0NamB7TXKchYn0kOWWDDVzGjHkwVpAvhDLIWqZ9A82+X37XZYOquzJEAIXfv
 VQ/vGEveSHA6dgrGSJxZlkzSY3SQdqrP1DamdH+8PggJBJ9OSr+H5+4Gb1K9R3sSYcJ1
 lnTvH6yrBB2srSBv39M+cydSRQsyKrbXQYaVgh263aOiFtvPTLYicJaCQ33E8fGP617A
 8WcnefGOL5VgS6dNIFgSuZglcx3HKVyJwlj/wDLtk7qcIA2RqXmId6QnvgguLgS+p70a dw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jm8xbas99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Sep 2022 14:41:16 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28GEQdXW030997; Fri, 16 Sep 2022 14:41:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jm8x9cqw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Sep 2022 14:41:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXyUb8STYWvMZk8duIYMlvtWY254RRD/WncsHP1z3pRro2XI1Usg9UKbP7uEgHBT6CNZEDX7X2A4vIe3uZm7QMkf9IxAv1h5OAwDrQcAuKKNxxEtz9KwuXHAOgY179iL5jqC0R+XGB7SPZLNmcPh+n6qrv9tynKq27OYmF6//9BuG4kRxSlCrbU3kHmI9c2sM0S6HPdASvTsxvSNP1LlOzV9Ol4TRIfaiSEIFP9yKnz7k+pOJjcesx9SAqWqc5wW/aCwLRaREfeynfLJOfaHlPhDJuDZWgbky8DVJ/THZb/4w2U2zXpoTkfJdjyK2wdx3xmlg+7iZcSlGGDe4dne+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92O6lMkxvUp55uDMzTl6rYk8qVHfPG85Qz4s6za2uUo=;
 b=DBf/VMUVHZj4L+T2omSPiNRDLhPMxK+e/2fr6i19GS8De8kwYOaTR2jUgPiwj+m81vUkJqpZ1e/GHs/cWvt4sa0sMQhRqDJ+MtfoGCbMaq4EwOzaLIkpf77a/3pvgs5EG/D2Tje1Fnips93F8sTpNSRly4H1znB7h158a7PCidU9HE37mXhsvaVYbFWprq9wq7PiYZnXvZULquWQqRsucljkJWMrdadIw6AIFlfjQ0/vmTeerrQFCbq6tUgnhGq8DNFGO5a+3qOTO5TYeFYPCUQbKVeRXp/ZXGpecMqWbILkS8aN5/BTIcG27MG7rYHnEvzRLPiisv1WJQ3eBrQ0kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92O6lMkxvUp55uDMzTl6rYk8qVHfPG85Qz4s6za2uUo=;
 b=sar+90sQv9GCG+J5dfMFv+VPf03UsPfdTKSiX7vr6nm2zuQRLdBL8LB2V2EBXZZ6O/n0MnMpMiIXQZaP7MbwTGEsWFhVUNFPjZ9bKl0u5mFV+XoDDpkNQ6PkQbYX0XgUS4yI/Tyb/3m3vUOm8RyYWKCkr4tv0HMXvYQjglxMvEg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BL3PR10MB6018.namprd10.prod.outlook.com
 (2603:10b6:208:3b1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Fri, 16 Sep
 2022 14:41:14 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 14:41:14 +0000
Date: Fri, 16 Sep 2022 17:40:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: judyhsiao@chromium.org
Subject: Re: [bug report] ASoC: rockchip: i2s: use regmap_read_poll_timeout
 to poll I2S_CLR
Message-ID: <YySK+novGkt2c0u9@kadam>
References: <YySKUQelS41ip5+q@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YySKUQelS41ip5+q@kili>
X-ClientProxiedBy: MR1P264CA0034.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|BL3PR10MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: 9903bfa2-6fd6-4b36-363c-08da97f18149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I+PBTjYKBSPFCmI5okIE/nA/CnSrZO4F0LPXBn/x73Ckvkfd58xVKrOUtOWY8j6dRCqmUz0uZK3w2wtfzMu9qx+dDI69fVbDgrNbvzU3X4pnr0gyaChueMxV4Jl23B8CcdnaU8OGausvlQHSJ7w+RfidyWdYDE75bpRJCgk4XMgbGpWf1iTev0bAGqMDHWWiQch0leTkoA8/OCG5okHZxrEo/2NGPh4JbOTuhDg8fH5Y6Ms2eOLIyvdGpNvTkqG20a5/W6i9khAACTNQ71Cr2YoJxPr/PsUCxoWP2hUcQM6skzkWgN6OoOdLfmDAu/z9uJINBbz2+IzcinNe+zAjVgScmXoK+x3qB6pzJvRgd9mKTH0cTpe6yS45YB/ekgGbDXY/Gh/NgLNksZD+grx/wFDOHg+TVofHm8w7h2wt+MPY72CoRWTCIhaYfWgVH4NCd/2X3v0j9mVDjb70Px740aO30Hr3TzhkgCEx065+b4ZmtvT3HFZhe++pi0lGFjO76HsDnzXLZ7ZD/h+v87TDanpimVZ7l2CiGEhm8n58O8t9+vbzvJN5NrPy87/dmVf+2M7TXnJIDZ25SG6OfjoS4OkOS5f8dZTIEjpJzKPOGcFrTeYmLu4AHz5IoFoi/F/dgoAX16ut5sqw+KX+AE4KoEOPaVf9nKUvCHY90Mje17M4cgFM/k2I0b43G7ZDAnzWD28IvGG69XnLVellAH77FcS3BCAbjgtRZ6+Acb5dBwvaQz4Dp+SVhbfSk2W3eTcW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199015)(66946007)(478600001)(6506007)(86362001)(66476007)(186003)(4326008)(66556008)(26005)(8676002)(2906002)(5660300002)(41300700001)(316002)(4744005)(6486002)(33716001)(6916009)(6666004)(44832011)(6512007)(8936002)(9686003)(38100700002)(83380400001)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YUYlahUhycF9wFZqvA1ly1D0CT699n6exTGP2+LHBXoAgJ/OUR99jhsqcsCK?=
 =?us-ascii?Q?4vbNo8chv8TFqjGxDCxE3SPcPbDNEX5x6qdiihFaa4sMnhcEKW+qPQBd0Iaq?=
 =?us-ascii?Q?59DTyVFA7V1nRbY9Ab97IfAuf22icY/xhzMFxNsnfo+lscLrFA2/kE12Gnk0?=
 =?us-ascii?Q?NmPXcgQqhMlnzcAE0N0d2ZTT31wQXWR73yOP/s7d7IMLqQGaVyH1GKOQLy3S?=
 =?us-ascii?Q?gDpXkSTlSTW73Nht8VurjebI/63Ch2aQV6qx1bxmnIQlMcHwAUVohzNQjZ0e?=
 =?us-ascii?Q?KAYDh/lTlHWazgyLMjLgshwxYjahwvR2xNjLp/SAkBCTaU4Z11hHLHZsLGWd?=
 =?us-ascii?Q?LQQjqoWFnSsv8mKyGi7JQgvklDfHtIIRmAsMbNjig61Nei8NAuNFgkbjtuhC?=
 =?us-ascii?Q?oCd6jI0G4gUzS58ZwEXw7zY9Eu9uL8vYECOWRvTP1G6iYbxBwQjZXYRx3YFj?=
 =?us-ascii?Q?PwFW5nHIqdL++71VeOSVC/W56mPUf4uk7GY4pZjxFkdQYFB2eVy4/EYpE7xf?=
 =?us-ascii?Q?LXrMwFKcR7xQ4YsXF5Eyg++/YPvUD7pjQgAWzOqPJSqyTfKibv7JWtE3Gvga?=
 =?us-ascii?Q?NXu6R29bAYsoaiYzPqa2hdeNQYKyL/EimnuwyQckCYWZOCOTh6VOQp8g25xA?=
 =?us-ascii?Q?H3HbOeAkLHzyCW5r7j0MVqFx1/xBHBABJpIvOOozmS9QyNSLyWQeOzlCvT1l?=
 =?us-ascii?Q?EjPzdzbzu6EGRDKEAugg4YXo1Hj7rGFczBE9+O0uI6CBW6XCGZU1b1rvjfNX?=
 =?us-ascii?Q?aUF5qa5eCtZRUzFWnarU77Z2DW3K2LvqWp4qt+utOBCjfcopLQyq3JKaknv1?=
 =?us-ascii?Q?V6d8LPpFAydu5aR1k8/Gq8S9NYJ3x/jBASwXCUi3LXXD+l8sXaqGtB2svy/H?=
 =?us-ascii?Q?vMIv3uRFsHLCe95/I4VbIFw6y0jCn2q1/oxtSXab1Gya6MPFslCN7YFd+TOt?=
 =?us-ascii?Q?Ot0lI/o7/pYTrWnx/6/mafzokmMaKnr5X1WokPd+bVVPj2O1CLMQmiFRZTTm?=
 =?us-ascii?Q?G7CkdkrwkyvWJQ94U8+5dP9mFJodln6ZDr/LvSvoHmvb93yGHs2X/0HCWdk3?=
 =?us-ascii?Q?ZcJtFUonO+YGr7eCUd8f+DZOtlwz/YSO1vJ8aFw2JhZ5g+d7j0Vs0o3Zz6pZ?=
 =?us-ascii?Q?X8tRXWw0thHA0NLWpXexVPCg8gFF47EwOu1RWmpx1fcONL1+AjTep/KYy+f0?=
 =?us-ascii?Q?oVBI+zDQ1gebBKoI2uQhPi3gsuSiqiZxdCetrCpgGSxje4uYRMNL/uevoF1w?=
 =?us-ascii?Q?eA1tAM7NzjFQZ7djI3+LNMoneESXlQfBv6r+21pZvIZAOVtN5XvahqRr0yx9?=
 =?us-ascii?Q?hX9/vHfY20rTqbrJfcJvHcbAkUKxy6TOXvhhV6X20oQHzwcE9SKVm2qhd3FU?=
 =?us-ascii?Q?zeum8l0wb9Ooks1ENWHIIwMLeTel/OIF23XV+xsnwOFOwQxbR3sWkTAJNdRN?=
 =?us-ascii?Q?tyY/FVC9KHDVvixNNcteamSoYmKlExfDL2Qwp4g77QcO7zUt8bJcXz8csUg7?=
 =?us-ascii?Q?w/HcL4CkSM5YRd3iGcybhEnLduUvHbHocpGldXeJEZaqsHUNEVCH6S88hK7n?=
 =?us-ascii?Q?/Hy8eR0gTy0s1TSvrs9A9pYF/cWjeEW4JrDaeBuy?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9903bfa2-6fd6-4b36-363c-08da97f18149
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 14:41:13.9567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8u+7ZXaUORFe1uh4Jt5NMOWdqVu2isI0VhbUOcTd9YIppGHv7yGgqW9lkFuRbhDqleYFk4v1sgIztTo/4cdv7n5BUVHFmHHs2L+zAUSkPFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6018
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_08,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=831
 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160108
X-Proofpoint-ORIG-GUID: nJ8mn16aBZzyj1ufDYkw6x1gujyZJZ-3
X-Proofpoint-GUID: nJ8mn16aBZzyj1ufDYkw6x1gujyZJZ-3
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org
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

On Fri, Sep 16, 2022 at 05:38:09PM +0300, Dan Carpenter wrote:
> Hello Judy Hsiao,
> 
> The patch fbb0ec656ee5: "ASoC: rockchip: i2s: use
> regmap_read_poll_timeout to poll I2S_CLR" from Sep 14, 2022, leads to
> the following Smatch static checker warning:
> 
> 	sound/soc/rockchip/rockchip_i2s.c:165 rockchip_snd_txctrl()
> 	warn: sleeping in atomic context

The code for rx is the same as tx so it has the same warning.

sound/soc/rockchip/rockchip_i2s.c:223 rockchip_snd_rxctrl() warn: sleeping in atomic context

regards,
dan carpenter
