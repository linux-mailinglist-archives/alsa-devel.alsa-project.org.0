Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA717A2DA
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 11:09:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFADD1668;
	Thu,  5 Mar 2020 11:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFADD1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583402951;
	bh=R2eP1F9ASIvUTd/PWJAPTdsJfV9esi+QujSleUW6PnM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UmvBhFchaw7thelO/r6NpMy8kTe01AKnzT2evo64kxkBQWHCxMQt9tTd6+P7mctfx
	 TNX8Lfhj3kkz4524B2w77sR73BBBX4bistwFWCfHsxQ13VVLgwBmNX+rYBq09kt2v9
	 Ug6ClZZ2S2/DpxRuogMXfI5XlqGIybch6t2V2mnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A90D9F800D8;
	Thu,  5 Mar 2020 11:07:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0C39F8025F; Thu,  5 Mar 2020 11:07:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750052.outbound.protection.outlook.com [40.107.75.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53EBAF80126
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 11:07:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53EBAF80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="38/VjRet"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/INzPeXBWL8gkXIsJxJlfTtycHpMT8yc1LY9ly8+mTacBWFg63pNhGOvxx4V6nRWbEixWf+BdmHk9meh/ImpcfpHHVVCMIrZ7Y3wgbyDXTPx438G7yDCB9kzUnsNaStqWoBjjc4h0mSEwr8jsQKQTmlFwcG6odOU6Ad1npMKPuXCpq3db4TCNGs7rloNI+MVRog41kt2b4b0DPj0nvOGH2Ptf6bTe6ZYRVOFL4/R7R32DcZhPbsLMS7bAlOTi+/G1ako4AXYdy5DEkhSshEvBoZEv1tXaanKf807HXYvwa742bB5bQcGXo9f51UCC+4D7NjXy9s6A5bXik01JapFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQejtw5ZKVrkCo3MY7dxiQYYRLPjr06Gv2FeiOI1YPw=;
 b=C7Ni5VV9qR10zK09jrMqiTeFb64NQrIME+qCc5PdcN891eDDF60VqxiaUwD9WUUv70IUfA+D08oYYTFwcZrdoLgaAaUh4Wh4sxIi8FUVAx126LoldtJqvI0xHV23lWREPHWeByjxcq2rcSO0npl+FvGlNvyjqOjUQzc+jufQB37ibV10iew4+btIluZNQ9hfO8tsuCQxU3BnZGFqug8QlKG2g0QukrB7uuyoddH3y0OJQHwUJ9xjVHAYq3MfjLLJCzqJ48Rkx+aV6RHtS/o95rQmSATY7Af8ZQSPMm1vtfvGRAzv4M48JKchhsFk44JnkLWb0kyaQoOLWZ9p8p5/ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQejtw5ZKVrkCo3MY7dxiQYYRLPjr06Gv2FeiOI1YPw=;
 b=38/VjRetftFrgV/f3hkWCDuPyMgc4J/1NN5ljxDFygyVEYGbdW+cqMsf7MSRQHThxfU1FvInylpPgliGBkFI4S6lNurgwjWo2ad7n5G2cC9Z+TyHDeEM9sBkavWnDePVM3SlzudTEpqsHokaarsb/Mz9rzJ/6Cn3JYSnPeD/fKM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Akshu.Agrawal@amd.com; 
Received: from MN2PR12MB2878.namprd12.prod.outlook.com (2603:10b6:208:aa::15)
 by MN2PR12MB3950.namprd12.prod.outlook.com (2603:10b6:208:16d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.16; Thu, 5 Mar
 2020 10:07:17 +0000
Received: from MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::c3:c235:f1b0:50cc]) by MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::c3:c235:f1b0:50cc%6]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 10:07:17 +0000
Subject: Re: [PATCH] ASoc: amd: acp3x: Add missing include <linux/io.h>
To: YueHaibing <yuehaibing@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, akshu.agrawal@amd.com
References: <20200304084057.44764-1-yuehaibing@huawei.com>
From: "Agrawal, Akshu" <aagrawal2@amd.com>
Message-ID: <5d205b07-32c4-db9e-76bb-936bca3247ce@amd.com>
Date: Thu, 5 Mar 2020 15:37:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <20200304084057.44764-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MAXPR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::26) To MN2PR12MB2878.namprd12.prod.outlook.com
 (2603:10b6:208:aa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.136.133.153] (165.204.157.251) by
 MAXPR01CA0084.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:49::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15 via Frontend Transport; Thu, 5 Mar 2020 10:07:14 +0000
X-Originating-IP: [165.204.157.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a222705f-b7c9-4877-e6c2-08d7c0ecfbec
X-MS-TrafficTypeDiagnostic: MN2PR12MB3950:|MN2PR12MB3950:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3950BF3EC28FA5F0990826F7F8E20@MN2PR12MB3950.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 03333C607F
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(16576012)(316002)(31696002)(66476007)(53546011)(66556008)(5660300002)(6666004)(26005)(4326008)(478600001)(6636002)(2906002)(16526019)(186003)(36756003)(6486002)(66946007)(31686004)(8936002)(8676002)(81166006)(956004)(2616005)(81156014)(52116002)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3950;
 H:MN2PR12MB2878.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 40YL7ogObNXY6l/8FCEi2t3is58UdsqLm3c+5Buv6/7wlCzWp7Y7wDCPYNXIwBtQWLETh4/9hY+ZqyPj7kI01LNxW7b1I1tWvWcG8t+491gCVPwM72liZr0zPaOImDgUHmu1YxCUy3T/uT9Ha3lkWSb6TFJzxsaOPV521uut5rWZSP20cQ/7VoVdNxDqEkEc8EQRHSQtSQh8anHTr+SxxZQHhUi/XNOSHWlmO5SU8VdmC4hc5qiAQ5uBejtvLsZxgdttFpCbqcFt8SIuwUqpULfTGYEHKoIs3LDkpwDX7I8YP3u8UnHP/THpLxGldGq1ryRVPVa+LF0vmK2ruqGiQRraEv9+5PATV3dAVwlSRHjis+DqefHoL1ve8Vm9ptA894bUxeGRgbRDLSo0oJCbsC/+uuFe2hVCteONJTiYFUjMTZq8TIRdxlm6C46ByYedDqCalKLVSa+d4CllwzlnwX1dg6emPp7ha6dP6a706u12DKhSKtIaAX8Bs7DoM04L
X-MS-Exchange-AntiSpam-MessageData: 6PC4YTLapYAy+QY+6gouEDGrQZlKa4pJJcERf5drhE4BzGtkHgd4bGse3AewLNf4yf9tUztYISKk0WgKftDxm3QTc5ZzVclwQohIMYBRfXS111pTXhKPSIh/zdHnC6LsiqCD1KSiXyq8oB/aGmgzCQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a222705f-b7c9-4877-e6c2-08d7c0ecfbec
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2020 10:07:16.9275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hUvoJDsc1toMSUxxnOyOLYb1pO8SuXlcXoyFpKv4Va9mMwKu8zPdNA6Ddj3XZ+uxh0qv99Ti0nSt0LhCRs+3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3950
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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


On 3/4/2020 2:10 PM, YueHaibing wrote:
> gcc 7.4.0 build fails:
>
> In file included from sound/soc/amd/acp3x-rt5682-max9836.c:20:0:
> sound/soc/amd/raven/acp3x.h: In function rv_readl:
> sound/soc/amd/raven/acp3x.h:113:9: error: implicit declaration of function readl; did you mean rv_readl? [-Werror=implicit-function-declaration]
>    return readl(base_addr - ACP3x_PHY_BASE_ADDRESS);
>           ^~~~~
>           rv_readl
> sound/soc/amd/raven/acp3x.h: In function rv_writel:
> sound/soc/amd/raven/acp3x.h:118:2: error: implicit declaration of function writel; did you mean rv_writel? [-Werror=implicit-function-declaration]
>    writel(val, base_addr - ACP3x_PHY_BASE_ADDRESS);
>    ^~~~~~
>    rv_writel
We don't hit this error and neither with i386-allyesconfig. Would be 
interesting to know with which config do you get this error.
>
> Add <linux/io.h> to fix this.

Since readl and writel are used by acp3x.h, it would be better to 
include linux/io.h in acp3x.h and avoid including it in every file which 
includes acp3x.h

Thanks,

Akshu

