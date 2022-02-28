Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 276084C9F9B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:44:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD3121E83;
	Wed,  2 Mar 2022 09:43:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD3121E83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210679;
	bh=Uz5g+s5pIY7ZfENyRNvn/HV/e4pbpgxjXw41ZW3yQ1U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OzxfL7R8C2VzgEPBY1CkbqrS7CLV11gR6eBZi8HQkkOvxGLyunupvowUODCnrzf8D
	 wE4/HOOCld4qVloq/JRHGig7WcsljjL7m1HmP9N8aq15ghZ1JM7q9wypqGHri2CvB9
	 OVIqVI4+y6pA3JrLePxx+Yyt0qPFE3MxTgnm07aQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ED12F80600;
	Wed,  2 Mar 2022 09:34:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74628F8013C; Mon, 28 Feb 2022 14:14:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA046F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 14:13:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA046F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="0u5pbmrY"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="z5bbTQpB"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SCf3YO008247; 
 Mon, 28 Feb 2022 13:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=XMBX6td1Whibmy4p7Xks4HUrxiSs0jRrcK22X0HO9zs=;
 b=0u5pbmrYRrtpZ2Hkx82G7ek+VgFwLdi3m3mrZo7cQpJti27QzyrjKSvZGLfMsp+AEBcp
 6D1jWbvFGaHrzN/SNg8l7JjAKpUPSsKuxoBMAgF+NacihWwY1Y6BmcwoWPu3dguu5utV
 Rn4hb0fC1aToTZXbj/8NdXBVdvzlmUduCwJmt5ojnweBSxQsM6y2Z51/i/L7u0SkSUun
 WlTqSeh5Q1gBmKtbCR3QoYK7e4Tl9tw0MCThUb0sRot+IsXgCN63CTuVpLO+TsCON3vU
 m/0FH0OMUeGjNUuNlV8/MmS3SPFm6pYArm018dsHTDRA++RxXRSuCkIGEwWavxyfchOT UA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3efb02m7ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 13:13:55 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21SCtKfS031646;
 Mon, 28 Feb 2022 13:13:50 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by userp3020.oracle.com with ESMTP id 3efdnjx5bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 13:13:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G47/ToY9bRvi9W+U6Eg//hHzIpsWUjSZ1qPm8uECH9B6EAyS72NpQuEgVsDSSxCNS/dvEC9o2KBAjcgsXgwjOvvfQ60MM+24WVBw5QVZL6NJb9++QiY3EJWQ53oaGePao7ImmXY341ngqnPjSlSX4p91XYue+vIYTu4yfMvYT++ma6SPHPXs0iwp1uYGZKfyTt04gcocuRdtL03YL+S2EbVAXx6WsKAqN2WHjFX7U+ejqF6BVAl7Y3O2RxizeC8Imwei9jI+jVoDEIfoQAHten4Nus1R4Y65zUr/1cZsl3c9Ku6N5RcanLpMaAJiNuO/gEAer8DyQaQRACr7gXcglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMBX6td1Whibmy4p7Xks4HUrxiSs0jRrcK22X0HO9zs=;
 b=CErsq3fHCLhqX6TP4hrI/3mZCLAB7KfdsNmcl0UCn/5ay6MKhQDyUlqtU/uG9LT5pAf/Pv6UID1OjzlRZ8TGYeF0FVLyAB3ifvK95u/MulUUgFsdJy2oqxGMCTJBWfifcqAD14DnUBQFIRlGY8EknCUEl+3ODkBZHntYcyhBufiQkCmo9/3DrqG42IQcN5cNlSSPkztu2ZNjK6L1HQwFfHMNelREc64PcnRv957nHKOCJOezy1kS5Kki4XsQpvcchs1ewCFpZxCD1okHjNhRMNY557Op11DgSwkdxgYIiRZe0dS8v7E8dxw8ia+Si/OkoTuMhDkxlnFUEGAdPRgEBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMBX6td1Whibmy4p7Xks4HUrxiSs0jRrcK22X0HO9zs=;
 b=z5bbTQpBSrSNCreCs5n/jz6liF4Uo0N8nVS/CACuc89966yN0+GrKhyq35mhbo0zT9U4H8WT1jTLhUlEhhYm5OKTxLPTlpHO81CWBF5u1R55zCFSLyotU0O9JKVTxnv6xaHilamRbjp3ryKtWKaJG8/GaRRAhh4nOWiwNkJ9Pqo=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5775.namprd10.prod.outlook.com
 (2603:10b6:303:18f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 13:13:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 13:13:47 +0000
Date: Mon, 28 Feb 2022 16:12:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH 6/6] treewide: remove check of list iterator against head
 past the loop body
Message-ID: <20220228131255.GC2812@kadam>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-7-jakobkoschel@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228110822.491923-7-jakobkoschel@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: CTXP275CA0039.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:100:1::27) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce5b025c-6a33-4fb6-7070-08d9fabc270e
X-MS-TrafficTypeDiagnostic: MW4PR10MB5775:EE_
X-Microsoft-Antispam-PRVS: <MW4PR10MB5775FCE26E0938CF08B3EB748E019@MW4PR10MB5775.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vMhamDKrKl7uZFaPUTm4xHck74ppUzQ0gmzAYetQfH9+nuJOdqy2C/DbWIjEOmqsRuLkJfEK05p9PlUrWu9kS6Jwks+lJK8K6uZCZZp6qgGZ1FnUOnyLnxSkK9xv47vUnUjgRZksUPHBZYOVuLWUDodB9CSOxa/j+IfHWiE/rXxtVBa8tInh1MIgJWF3U97nMytrrodXOM9EVwiQeRpq15bzpzxb9YmpaK0J5LGVre+0miInUWJnqJFB0A2w3vT1RQuTnadjco+xJ4TBZXvP2L9z/REqy/GPubDzsctkoUEr8AD2Ub6LKVhCRCZ0WAH9C3KFshPRdMrHj3Qzeun6p+f00c1i0QOIin1mXMrsBE8p88HGQRGBFprcp4yqtb3qMUh7P40fhTMts8DV5eoPpR0P/UPU0BTLEX1BjoPu0rjjsZwI3s2mMbY6x7oXATakI7CKbcfuTIlvrm7z4A4RnGcSoh5h7Fffnon0wcCsgZxUWLcxpB0d9yXATeIq9l0SbwCfdn6KSC8TX/sMjk+/3WXW7RceGFNWOJmb4JxCeSh/8z60TdUzsYUPAJpKTGBQec2X4bXzUywnhB97eZKIH20Zdew7BuvLpGIGBtemM3F7y9/xagjaNdX43pdoCr9L+WmC849vtpQZdMjXZ6FJGSkFHz/eq3/83FAXem0FuenYPMRgrBUqHAD6tWb7g89BaHQx0XbgrWfscdnXXUhB9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(316002)(2906002)(83380400001)(44832011)(508600001)(6916009)(54906003)(8676002)(4326008)(66476007)(33716001)(66946007)(66556008)(38350700002)(38100700002)(86362001)(7406005)(8936002)(5660300002)(7366002)(7416002)(6506007)(33656002)(6512007)(9686003)(52116002)(6666004)(186003)(26005)(1076003)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1IUvDg6Yv0iayhBIYp3dM8cJeQqVql+l5Hsi6F/adtTkVQmP1S6PPytl/1bv?=
 =?us-ascii?Q?9NKryfDX4HQrm18DRS4/W66cfcslIYmYMBzbr5sT92Ug53U8SLY9LA34FWCI?=
 =?us-ascii?Q?WlR0ZLqJ11Aw5rQEYPbH3m7xogvp19dr7wS7eMaY2mLWY2EmHRUQBGD4TSBQ?=
 =?us-ascii?Q?Y53p8+sYhjKORf1JqiCzofuAPQRbNVdKzSXzoKf2AEKd4Fk/hwamkISE8kCZ?=
 =?us-ascii?Q?Rmr3QJVQThE7tYZOubOJQepLrTvV0afRo9NXJ0KXJdoVwWwQ2wHA7Drx0tEF?=
 =?us-ascii?Q?TlCye2REtInaap/gj8mQUHbTMC0vM81ljEZz8b4CqETSiYVDxLiukBbbuGXz?=
 =?us-ascii?Q?xUtc5wip1UVEiq1iO4ZxzhhDPCW2VJx6peFrXGYDo1Nltnv4sXj+azNmAXm3?=
 =?us-ascii?Q?bvXhKU3SgM6eLCDZ3KqLqWweg/3H0hotPbUB/8ftP8uBNsfWZKCg91tlafle?=
 =?us-ascii?Q?GdVn6Y/vENCo7zjadd46LTD1brBwzqxc9+mFMzHrzKwmWivICFpBVYIrAvzF?=
 =?us-ascii?Q?0WDxoaLisb3AOA8hVtE+BcVkWzW/xWXQv0Ymja3Arn6/t5hMlf6xiQ/77gKR?=
 =?us-ascii?Q?ZWSOhFML5YK4ieyC5XeaZ4zh+xtUFVEiy8T5VJLtdF65qn6mFiACycsJHtBX?=
 =?us-ascii?Q?iJGNKTz1xA1DISwGZ//FuAyFnaSFT+DriPdlfeXaqDJgPhgj6Rg9o7FGOxfa?=
 =?us-ascii?Q?pf2ktlV2YoSwJAvRx988rUoWX/bguTiXjNk22OPYtxbUw8er1h2u9tvShJkQ?=
 =?us-ascii?Q?1iRwJQ5/1MF4Mn1ZPTjXldTR6YLbcwhtCM4spv6VTTNFq+0W4JmKjEokHlDg?=
 =?us-ascii?Q?l0lx582yH0hUBaYSSUDoZdPWBGj25LclcgnSdpw4nIsN0rZY0fv/qtr79Rhw?=
 =?us-ascii?Q?t7ZaP2NfU0bwpVyOwasttRQmgeKtsZCuCNEQYL4DIUhpLKMXhHkbAUD6MUJd?=
 =?us-ascii?Q?oYpPZ+xBA/Y2aXpqmR7GqFOkCdQd0ZYsYRvwK4hjmNPhveuP2cEYtZCaCg+S?=
 =?us-ascii?Q?tWVw61FHu0LHHhgru9clmkLDWp/7tYBYneNhUyfvf1ykon270cqfnjeqSvGU?=
 =?us-ascii?Q?JhKWcO/V3By1pSzoLiMLNq2fVrX91q8gfOSmtWKhIq9o0qA+J+ilE6GHz05r?=
 =?us-ascii?Q?BcunmtNIG/vzJ/4j78DGB1oyO6SOJ5o7aahAIZlrKe9ImDy02DyDFQrA4sU/?=
 =?us-ascii?Q?0LnJnK9IynmS0cPgGwA13AwNwSSAZVOWOiCdUMcbiNLlGyaEnkuz9SFSWcZX?=
 =?us-ascii?Q?65rYmkW3qrZzgG2v6FZ9TlnpAdQ8DHKss0E77YugEROUISY+oxqIOuAgyiCi?=
 =?us-ascii?Q?t0nDW5NfGmmzKv+x3Jg23Xt+4gwO6vbUEdyF/a7sLgi3civlFqk37TlEORZr?=
 =?us-ascii?Q?Z2SWhfZtXkh+vzUlLZnbWZ9lMtOZnA+jvfdLPzJGDo+WPDKXDnEmZf8bXURJ?=
 =?us-ascii?Q?mo2HXsWGUZnTL2JX3woiSA+2nSndImixCsZiSsF7Ykhxc6ggi4PSlx1/jXLG?=
 =?us-ascii?Q?YghklBd8vukR7ROcER5ZQnHFsDFEKAYcijq8W1pp2ah1F3LZ73yHGhvEVP6J?=
 =?us-ascii?Q?3yFYo5JmYvrI3fZsOVe4fmlKw6p5PDFpS5+j7HDIgAAJSF8uz36/EN+BS7JE?=
 =?us-ascii?Q?mjlXNg9qYiLM5TUsmW9//queQuS2xsdogaTj2FZHyrhX87SSFEO+2N5kD0PN?=
 =?us-ascii?Q?D/8erg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5b025c-6a33-4fb6-7070-08d9fabc270e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 13:13:47.0688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrcHvURCEoE2ShXRNevsGF+i8cl9oZS3nObJjNWGsGMAFNlFY/gmef+rDsLdwZHqKHF+iyqgkFvJlG+/+YWoq5dtmMivzdmOweROd89vLZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5775
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10271
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280070
X-Proofpoint-GUID: OHiFfn2wjFLvxvhIuMbX1vrovBvJlyEJ
X-Proofpoint-ORIG-GUID: OHiFfn2wjFLvxvhIuMbX1vrovBvJlyEJ
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:35 +0100
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergman <arnd@arndb.de>, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
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

On Mon, Feb 28, 2022 at 12:08:22PM +0100, Jakob Koschel wrote:
> diff --git a/drivers/infiniband/hw/hfi1/tid_rdma.c b/drivers/infiniband/hw/hfi1/tid_rdma.c
> index 2a7abf7a1f7f..a069847b56aa 100644
> --- a/drivers/infiniband/hw/hfi1/tid_rdma.c
> +++ b/drivers/infiniband/hw/hfi1/tid_rdma.c
> @@ -1239,7 +1239,7 @@ static int kern_alloc_tids(struct tid_rdma_flow *flow)
>  	struct hfi1_ctxtdata *rcd = flow->req->rcd;
>  	struct hfi1_devdata *dd = rcd->dd;
>  	u32 ngroups, pageidx = 0;
> -	struct tid_group *group = NULL, *used;
> +	struct tid_group *group = NULL, *used, *tmp;
>  	u8 use;
> 
>  	flow->tnode_cnt = 0;
> @@ -1248,13 +1248,15 @@ static int kern_alloc_tids(struct tid_rdma_flow *flow)
>  		goto used_list;
> 
>  	/* First look at complete groups */
> -	list_for_each_entry(group,  &rcd->tid_group_list.list, list) {
> -		kern_add_tid_node(flow, rcd, "complete groups", group,
> -				  group->size);
> +	list_for_each_entry(tmp,  &rcd->tid_group_list.list, list) {
> +		kern_add_tid_node(flow, rcd, "complete groups", tmp,
> +				  tmp->size);
> 
> -		pageidx += group->size;
> -		if (!--ngroups)
> +		pageidx += tmp->size;
> +		if (!--ngroups) {
> +			group = tmp;
>  			break;
> +		}
>  	}
> 
>  	if (pageidx >= flow->npagesets)
> @@ -1277,7 +1279,7 @@ static int kern_alloc_tids(struct tid_rdma_flow *flow)
>  	 * However, if we are at the head, we have reached the end of the
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  	 * complete groups list from the first loop above
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  	 */

Originally this code tested for an open code list_is_head() so the
comment made sense, but it's out of date now.  Just delete it.


> -	if (group && &group->list == &rcd->tid_group_list.list)
> +	if (!group)
>  		goto bail_eagain;
>  	group = list_prepare_entry(group, &rcd->tid_group_list.list,
>  				   list);

regards,
dan carpenter
