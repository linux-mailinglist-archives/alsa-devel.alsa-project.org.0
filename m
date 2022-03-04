Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2124CD4F6
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 14:16:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1F211833;
	Fri,  4 Mar 2022 14:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1F211833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646399788;
	bh=fn6OhKYaVOLgqpMcffJWH1g+MLpVbFXP3Po+X+XHrWY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=i/C+hoUoTJSJFgdWuCGgr+IDSjoFytkHe0l8I3TwSvsihYCRQAVA4xn4ljqgRi2Zq
	 X+/gFhLdpEalPVhkIVNG6mB5skJLwaexLEVGmmxigeKFvH7bNSNbCaQk/tB2shT34p
	 zCEpBmyiUgmxxzQAqFLfxl+E2ST9mBvNCAiR4XZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E11DF801EC;
	Fri,  4 Mar 2022 14:15:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08586F80311; Fri,  4 Mar 2022 14:15:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8999F801EC
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 14:15:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8999F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="mXey/c0s"; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.b="r/I/Hh7i"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 224AYFXY013852; 
 Fri, 4 Mar 2022 13:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=lnO+L3QmXH0SDKqkO7fc/0vXaavw0szEymyyO82mPgQ=;
 b=mXey/c0sZNxE4caYiQXTvQ1e7WU3HR88wzyaJ2BUWE96pvi/UTwKz74UefTd6rL5+BtT
 FAH0HmF2cC52y5VnlNIjbqH/JmtHXOs+hcCWGirfJOYxxwwFX77gU3Ggh8CNnOE2XwGR
 nnLbCM3TKJfZXUbU3rNVTQnPqDazDfYibj/8dshfarp0KKv27+qWm80MKzZONkUFDSM9
 vW0lHmDYv5+4YOExWK0fPnaUhYObQuWlt3b1ZHnjWf1EF1u+h3+VcIIibSoZD3HrSjrX
 rCMDzhoueM/LqqQOgoHlNMUcyBZhE3OT1+Qt0/Pg4TuspZva57EQMpQJ1X7m3TsgBgC2 +g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ek4hv9qhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Mar 2022 13:15:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 224DBg8C067296;
 Fri, 4 Mar 2022 13:15:07 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by aserp3030.oracle.com with ESMTP id 3ek4jgtbyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Mar 2022 13:15:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZEDpatXRfTm+URPdn52Uvmku0iPTBk8c6w885fxedy7UeUfxZ6QIJmCRoi3QzcsWge1IcwaeSGAFJa6tfj62BQPalJuaT3iiwdhLL4ap7ku96B0hh1sXZQgI9UVc7uwDyGDim75jMcVlRQ9qZyefAvf7XXzmEgEOYXQBskLremYdmy97+JYAoqcy+dIK9JIH4dU0G82ddOnkeBHV3BUwWlwLPDn4GMr2LTgsUABNDrPel0WAdp12LRKUB9BV//DuEa+ECBlmFrtYuWPHk3pYOwvWHLpD0rr2Q55Q9H7PX/Rd4nNyvCdzHmpR3M5YWKbNaQs4j2de3GZ+p1tGLT4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnO+L3QmXH0SDKqkO7fc/0vXaavw0szEymyyO82mPgQ=;
 b=m9lREL+k+soy7tfVxu+OcJkAKbT38CeWbECiYvk4IMH4ovxPiyUJuLVst2kLUYwThV4eMSWBhyEEDRIRX0vpwvDPCpR3L9gzVLazm3PSd1gPOOj7WubNCpnKXR15UcMEbPneYD7GBurtGbe6M6O7RfFGfH84uS8Ol0CZY+F8oKlUUVtqy3dE9/5T2BVqBnBXd33qJi2U35DZHtKs7qKEbICtXA+tCaIkhEiG6RyVeNLeI0NQiX/IANOawryfrrIq/4be7Z6LmDZAigBhajcOfpOwnGElh8lB7Tscw+kiF7SLeKLzV51dRwCqEYcMTvJrp8M8NJakBFTGFzyLmPznyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnO+L3QmXH0SDKqkO7fc/0vXaavw0szEymyyO82mPgQ=;
 b=r/I/Hh7i2PPrsH+WDK8pY1SiNBzPUlh3MmjZwQozpa8la+/dylr3Na7hk6qooTMdV0rxe4aawzz8gO7Lh8lqTy/eXMxO1tDqwKvZyZmKGDHoKUI9dT0HoJXFIh7hxPaL2UH3Mz5mLwbr0VKiZX2QrWX818gccHQd09eUah64+aI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3142.namprd10.prod.outlook.com
 (2603:10b6:a03:14e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 4 Mar
 2022 13:15:04 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.027; Fri, 4 Mar 2022
 13:15:04 +0000
Date: Fri, 4 Mar 2022 16:14:49 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Meng Tang <tangmeng@uniontech.com>
Subject: [PATCH 1/3] ASoC: amd: acp: Fix signedness bug in renoir_audio_probe()
Message-ID: <20220304131449.GC28739@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304131256.GA28739@kili>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0108.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2763ec5-37c2-40da-593a-08d9fde0fec2
X-MS-TrafficTypeDiagnostic: BYAPR10MB3142:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB31429902FB863310F519A6598E059@BYAPR10MB3142.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PokLjfKVrQtkxE/pmW5Lpd6ILyyB4CCPlI1wEe5/qCyyNzgRbkJsztbpHctZZ4kcOx36IhpQBM2EP8ALCq3iAJ7zEz8JtoArYAKzD3Hvzwh/s7mXMyQJUD+O3lsH91ECsolJOosszzKPXBq2IVxxKMdJY1AFUWPNNwRw6KRdS5ZmISYWnmVlOdvQNGvPT8ezibvQdqjqW9oyYs2arUK/kCh3f76++TNrImd+S5WIf8kafAqZr0/mW1xUC+T1nvouI0XoJy/Ecm9/x6EWzBT5yBhhJs9rNiL8Cp3SdBMtZApk+Gv9e8FD0k3jK0t/TcvXiv2JRZoQSpCYNVZrhFHerVW12nrRnceHFrhY4GwLGs8/9GXyIV11CP3RNZ2+ryrSUCOfgUow+PtglrcPS4ng1yizPyrhalFqcNhz8Xou8I1tqhiAMWbFWa1G5xrhgCB3TEnVDLyG9xoRYEBKIdwU3y0hC7A32x9xZbOgtb5dyGurzwPFw3dpd0YgMSBFkCm71irZkwXE7tTfOkQIfFBEH3jOaBBihop5F7WKXHtkXl+vVM2J2y5ExOYPhzH1ch3xYxBG+ktBGGIrEJSa0Ndbe+Y/6yqNI5mzfCGvqXZZ857x+Xm0/FhcC+d3z7VMfV/4MAlBQ7a+d+fE8j1kkAZ/Yc9XFFknUpAzo+7EIIr+klBwCNLIAa19UuvYCAAg6ckaelXLAHLrDeP49esp/aVZbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6486002)(83380400001)(186003)(26005)(1076003)(33656002)(6666004)(508600001)(52116002)(110136005)(2906002)(316002)(33716001)(54906003)(38100700002)(38350700002)(9686003)(6512007)(8936002)(6506007)(4326008)(4744005)(8676002)(66946007)(66556008)(66476007)(86362001)(5660300002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r/apFSasjRhk3/oJlBdUKwg1g/KsRgNnJFIvYa2dNvaZanBAj3/NqBJfQsUa?=
 =?us-ascii?Q?T6MzYyNNgr+EMI+NB8l0gJlZAmEtGDMyXkHIHnGYDpPX3PSAp3v88Y2pxFCt?=
 =?us-ascii?Q?i39KWc9Bt/9UpXmlzBtQaj+GxvzI+YlhrdgVxrP54LXxJ/AmSoZ7loMvFrMo?=
 =?us-ascii?Q?hlLMg/gwDhWAlkM7cqsszZRJKDplSHGk4cEQA6nR4SJ9jD2C1EjvbSVuc7Gd?=
 =?us-ascii?Q?tmRLvYhNHot5yz3tvUT9vw2/WVf+vg2WXz/q2lt+A9VgQlaPDuujo/71tF0v?=
 =?us-ascii?Q?S6JPBz43iAReiwJm1+8L5KAh3GYZuT8FqRXFk27XwS+PRvJC2/Ho4jmpq+JV?=
 =?us-ascii?Q?/pHgY3oUJkXIPLKO4pFVTbJ/JgsqM1XxwKAELZ/4lMqlvBw/R0zxApJYbXlU?=
 =?us-ascii?Q?f+Zaa4Pwapuc2f0zBe64zIExNkEhCSDxzgpAfCTVmo2+WJoz86Y3o0EwZ/aM?=
 =?us-ascii?Q?WXNYra0lXb9CBqv3DlPXIih79YJA6WGPo6CRGC1Ze9FRil6rAgQmZdIN5iuE?=
 =?us-ascii?Q?a/++5HYp0ZtDvUmjGZRzjLR+iNVcAhv8qfC1bU0loLvkSoKcs1kQaYaDg8xr?=
 =?us-ascii?Q?uiAMgdqp3iwxohQLzd5jODuO5KE5R+8eYtrCkfxbwKysVG2tWgtkG7nHrCFn?=
 =?us-ascii?Q?ppNBZdshu9rAshaCUoF2nkmLjMtxWqgrae5cUB5Nj4gklLENsBhDwoxgMTdZ?=
 =?us-ascii?Q?HwL6/HjP3ky1EfeSZoSB6Cgtaq/FeBfldxsyHtOkluigTugKYVWzuQiSS42j?=
 =?us-ascii?Q?gCof5jbGtgKmzQND5MFqam+s0uxJeqQSNrNCi/GQSFwV6nmPYNW+8KETikuC?=
 =?us-ascii?Q?UOaDi2TS7qGcz29/Le0kCvynpoE6OnYTBA/V56DpiTeMJSuqxF2seswX/ld1?=
 =?us-ascii?Q?Gx5tWQTxRkJP9O6VmsBCQcLIIChP4PdVLKXp72mt29xLtHaNWoJgA1ipbgGR?=
 =?us-ascii?Q?eREXilzYN4me+Gi4SZDNiKUtmAbONSuLs6hROOtGU6pBKafjOFU6zWcKKmPV?=
 =?us-ascii?Q?7gtF/OWz+8BoBswC6ABSjlqDIEqlL0FkZQMY4RskICIGG8MoflAUebbm0Kre?=
 =?us-ascii?Q?y5jmt3Y6CFxj0UDVNsNwx9ImxX96RfXj1IkBmPbWl4WmncGFPcn5fg1JQIgD?=
 =?us-ascii?Q?ryOk6ZwjjZmWC/nhigNiBgfiPrAc7xc/9oyfRVGJGw/fAV1pyHm2JmNkiGHD?=
 =?us-ascii?Q?H1np7q4/GB1ZErhYzo+bgmZn5stChKgkDjV42im70LVSBR0wB35jOzfWn1vn?=
 =?us-ascii?Q?Bnd/cj3619h11AZQw4YkeVRamUWJkqjMz9ZGaBGzKc8F0rj/AMyV3aA/uYZi?=
 =?us-ascii?Q?j5BTxTI+yFEIwTligOXXaZcg8aZTgp6bm1/WwzKwdeSvejI0pgSmR6ZjAwE1?=
 =?us-ascii?Q?QnXiqUzMuyzmmDeUiWxd/syFQWqVW9HG8MgqSLn62yX2lBv52EgBrAygLUYd?=
 =?us-ascii?Q?U9IWAGvbsb49locuLU4DXDWCaPr5AqOY5bdhUF2sNFksNMKVTzewHIBlxW2E?=
 =?us-ascii?Q?KDgx0IORzVVDQIt/37cBnlpOWOlEvvVJa9u+e+/EJT1bkK4oGFjdy/Afp6Xh?=
 =?us-ascii?Q?mbVOn9VxbF/o7UqNdS7oZWojUEWqDLMh+QWaDWfKCCY03Haw+xWrfY0+vnxV?=
 =?us-ascii?Q?31lN8PEmkuLMoKXaSV/k2qM3EeMM1I89YN5SDz/ZGtesayc9sH5Vrdgmv6VT?=
 =?us-ascii?Q?bKlcXQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2763ec5-37c2-40da-593a-08d9fde0fec2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 13:15:04.2036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3KW1nEIYY068XWg0cS6eTn1lTnPKM+Rh0e88tze/yP6l6Ie06yZu1bUyl7o3mpzcIQaMKYcLjAl9uD/AfMz3vd2G+FnISpaR+ftlMVtY0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3142
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275
 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203040072
X-Proofpoint-GUID: u_6LHCh1QEj0FRdMxsIRVgMj_8KQ6Itv
X-Proofpoint-ORIG-GUID: u_6LHCh1QEj0FRdMxsIRVgMj_8KQ6Itv
Cc: alsa-devel@alsa-project.org, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
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

The "adata->i2s_irq" is unsigned so this error handling will not
work.

Fixes: 3304a242f45a ("ASoC: amd: Use platform_get_irq_byname() to get the interrupt")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/amd/acp/acp-renoir.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index 738cf2e2b973..75c9229ece97 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -282,9 +282,10 @@ static int renoir_audio_probe(struct platform_device *pdev)
 	if (!adata->acp_base)
 		return -ENOMEM;
 
-	adata->i2s_irq = platform_get_irq_byname(pdev, "acp_dai_irq");
-	if (adata->i2s_irq < 0)
-		return -ENODEV;
+	ret = platform_get_irq_byname(pdev, "acp_dai_irq");
+	if (ret < 0)
+		return ret;
+	adata->i2s_irq = ret;
 
 	adata->dev = dev;
 	adata->dai_driver = acp_renoir_dai;
-- 
2.20.1

