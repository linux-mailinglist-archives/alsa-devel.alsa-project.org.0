Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5CF3BF8FC
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 13:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95BFE15F2;
	Thu,  8 Jul 2021 13:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95BFE15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625743653;
	bh=FShtXuZsdfRgkoiGIug7EwrS3QDHqyv6/m0Y8kY9hoI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=chlyp9bJFboke4XL6O6mpqy5i3NqrMVTMz128KzwFbl5dYzHfejNbf8xuWI8buppP
	 g/t+7Wq01bACZAMgXo4w5N/jQSLveGsYBj3LhTtGAcJ8YhVcGtyiLAbES/SBkCp7nv
	 mAqGjL4b2gyOwsHbU611D9a49OxQCs+qkJBjTaJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05E86F80259;
	Thu,  8 Jul 2021 13:26:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1030F80249; Thu,  8 Jul 2021 13:26:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2076.outbound.protection.outlook.com [40.107.95.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90A0FF80143
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 13:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90A0FF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="bWxL6I+7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/5e3IU3gYWLcROL3xjPNKz2K07+oXJhxrdQaxzF6wbOqy0Ct9s+OgSoWwCOVXh1DlmyAvsFL1yqbcsnf39dTKzzr2VcRUrhm4hnKp3XUkIs4h30xKRQYaXSUPCUUSUs3azRkhBVM3SZpDqG7E3YTslhgWApEzK/BDxLmFKgFdPJClDSXWJJ3HgAG/4fE5/p1sZgUS6L/b5OF2ul0R7nu6JIaYvhxXofP/6zGAOhNrAhcpU3/c3GUZeSv4SzdZbdw/EtcbK7s1+N/x3jX5Ht3MXaVCq4KXwm3Gm3RPW2jbfTghEUVzhZ9j0fn5MEmPCWT/nNtUbJZ3q+r9gk7Gnj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXeB9caXAJhsUVn61cGDwnnby7n8AldObo6lpbevWnU=;
 b=RFVgitGEGShjDHzX2g3Q2baVoqHW+h2wxTloNFOleGKMbB03a65Bnu/4xufeoVK1fNV2EZpQgAg3aI6UoHGh6STnG2mGO+xJvn3ZlGrNrrTHy27F2q2/W+vB8pENHz1Flyl5pqKTHx3BBRab+dUst4kVUCek+6gmx20NdA7AeUVSWmfPBsNuW2AJN37EWw/h9ZTrvWv2zMKtMxnFPXnX0KqjOrGtZHROyArOn8pjwDZqffd/QwebYJbPoBAEEyWj7I5ch1lXG+CfmT9HWgYmYhXslNwOaPSyHD4SB61SAfWsK0omWa1BmwHs7tSz8bqSwzbuAYgL8AEYWgTnIOWESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXeB9caXAJhsUVn61cGDwnnby7n8AldObo6lpbevWnU=;
 b=bWxL6I+7G/XKzJZ8glBLi1DZM5AStsa4CVj+MtmNUNsW0HNIOzL4jJAqu3dc0peLIxzBbyqJi5XjrYzi4aPvQ24LSukBBZ2Op5Wcxk/zd5o0o/1L3I0JRRF2wHrSf5LVgq6QYGOvn/WXwL9qwdneYnAJ0xm0P0EoUBRKiPuiK68=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR12MB1725.namprd12.prod.outlook.com
 (2603:10b6:300:106::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.29; Thu, 8 Jul
 2021 11:25:57 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4308.021; Thu, 8 Jul 2021
 11:25:57 +0000
Subject: Re: [PATCH 07/12] ASoC: amd: add ACP5x pcm dma driver ops
To: Mark Brown <broonie@kernel.org>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-8-vijendar.mukunda@amd.com>
 <20210707163018.GH4394@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <88def0fa-a792-890f-9a94-7e56ef19497f@amd.com>
Date: Thu, 8 Jul 2021 17:13:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210707163018.GH4394@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::18)
 To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Thu, 8 Jul 2021 11:25:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdb396df-cd6b-40a3-3551-08d9420327ae
X-MS-TrafficTypeDiagnostic: MWHPR12MB1725:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1725E9435D403426F0DF25BF97199@MWHPR12MB1725.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eQLi9GSv0jGoJeaev074aipImJl7zt5vCoYJGzY1bihJycvdp/lnzHGPujUGhvO+31E2YJ804gdEETuUZAP5pjT7YHhJN5g+2K7NZLYVAZbuKvdsovNVNGTnnUnJguRvDz+5/3fF4CNhpWHzPwjT8S1nAkcu+xdXGllPLgjDniaVIZknz/q4yCtQJErcrEp6+aZtIjbi0fl5vUojIcA8DiPkJY3RkkF6wgU9y2EC94R0Gc4+34aNJJIfoLGdF53dntHij6cBdhdP0OkvApVl0ZxlXVSbRzzyiRnmfYX5I45lI/AW6h3qXEnBP6wvZNBtROFWhtmcZqM02+iRKnIq99xnzjcZVucgap54h3iL08tkdMR6x0IEJNX0uJPpog3kyxbcQKO2cU48f3udCVu0snuYtnHWNpqvMpXz2SEBezHxKbPU+jGFFHyhkWSJky4Zez7Ba5OrwO0eH6XCplcyLitmnUxN/TKGCWwBOVEvzl1u/er/PsAch1S3xe3XluNLV3S0KTzcPeN6PtchI6D6qMaGmHaM5OZ1k22qoXFFNdpkoiTvOGqr6rR6wa1FZalrZ3fP/G58nuCipd7Z9HibhKXtfx/T7mtIMc5Ybbr4Get+kA81ffQsu00ykdKfGCc9WiXN6v3lhmq7jGH7WNjs9TWCDMhFJ46GeCgNtS2gYOXWOiVc50rFc7EqC5tQxf1soY0J4hULTeJWUXVzpyqqVStWHI+0KAAryYA2OdV6Uxe1wVmPD3YIBX6EVWMyTMBwBbVQDO2YQncaHQrDmNnl2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(478600001)(4744005)(5660300002)(16576012)(2906002)(6916009)(53546011)(316002)(31696002)(66946007)(8936002)(6486002)(956004)(4326008)(186003)(38100700002)(86362001)(2616005)(26005)(36756003)(66556008)(54906003)(6666004)(31686004)(66476007)(8676002)(32563001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?rIBQJ2GZ7pyXXkYdNzWB7SNKP9rqIclon3vDe4DDFbtnFzbruoLOt8p6?=
 =?Windows-1252?Q?BEruG9B0DI44Ik1YF5jwxMSBASPLutTP+j4cZ7UlfyBCIQ0k/TZIj3GG?=
 =?Windows-1252?Q?fGdPHldbGZXZZSgwJGbLRa7y/aWVdjzVeZzMh0Jd2ttk0gqdXhlzzhrg?=
 =?Windows-1252?Q?mJZYyu98p/dn9ZOmgduvh1B+xR9XfUJTabp+6Vx94VUOC86kCsTfcNle?=
 =?Windows-1252?Q?Vb3XxAVtjpRwvXaiTiTNEHMdWelpvjnMotzkJOpRlZZY3Bk+cLhIu7Lz?=
 =?Windows-1252?Q?uKUWYaJzLsx0Of02QVSblRYbWMSO3fO5rgs/w8eW9DHQE8U45DI5QBD/?=
 =?Windows-1252?Q?gkPQI3hHHUJjuqIedfom8uEv8aQLuccCSh76cbU7c6Rov8njBI23WX75?=
 =?Windows-1252?Q?x7HroLxo/HjZfvM29Ykmr8pop5sugq/MmfZrxmhBaMQzB5vtVeast8Xo?=
 =?Windows-1252?Q?ezOP1HP30utrh+b1YKiXKF+ImIdMtO8zn0GqqEMr+TVROhhvrMAX9Bby?=
 =?Windows-1252?Q?i3rNBZ7IcR/f7iDvhPIZ7BKEWUM4ksMSgKYVXVLHVEDjxLl2iiENC3as?=
 =?Windows-1252?Q?9H/wX7RsPl+JMaBKOkNWwmtLrGDbtr/l7Dkql3VyiLsCnzb9Y8XXvO6g?=
 =?Windows-1252?Q?QQZJqpGKFhiZTi6RiC9ssDNNPzgsii4hEcvosdr3W1yw3BUa5W1tkbcg?=
 =?Windows-1252?Q?LKfFcaINTRadnN36UqO3vp9SAAAQ91JqAh/6ctTEfltQ2Yy6fFSaSe7Q?=
 =?Windows-1252?Q?8AlJZEsYXuQVS7GOg4zTKIE70I8clJmWms/k1s1DzgIQNtF7ddgsBKj7?=
 =?Windows-1252?Q?6uUMGz6Fou3AbTBvqsJU9pddvck01NXYtoMTSYnP4UEbZJYOP+rGkyz4?=
 =?Windows-1252?Q?WCZSeQB5Pmy5OEaMw89X6KMdITlsuMyh7JNfvhdsP52ovXquVHK2Xje3?=
 =?Windows-1252?Q?8aF8pVwhkT8UUjfZhRySzXG37ZKjA6KJqds1kaLw1PM8t5ztPZw7sJlw?=
 =?Windows-1252?Q?0Z2npbe1wtuvYEppgTf9ZJVqliE5jY1UFk046xjccpNUQc8njKEgCVBn?=
 =?Windows-1252?Q?fe+Mnh5kGtxlTKf1tZBvJeykPo3YS4Vx8Gr7PN9f7AJ/HA84jSJhxJSV?=
 =?Windows-1252?Q?RSUEc8jforCSsZaKMJ0PuQfoM28aQaaAY3c9vgDoNZ6xwbdWIJTo42uU?=
 =?Windows-1252?Q?1R/oGlBzG132xXeXFQF1DIeuz09f4Ja5fv2PI0LnriPG5YcvGhEwboZv?=
 =?Windows-1252?Q?ZlAHAwRuAfnosl5miuOZjVto2rHnYLsHAfUwe8vJnUjp5nxUvXWMzoe6?=
 =?Windows-1252?Q?mwXr3SGa3GGtydehaFzg/lgPVXc7uCS4BYk8eChq/mp5+9I/j3Iod7bG?=
 =?Windows-1252?Q?iL86g327U6fOfXXcm6CZcjqITh+xOKhubNyKMwsxgs0S7U4nscfevhb0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb396df-cd6b-40a3-3551-08d9420327ae
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 11:25:57.0478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0JTdtiSYgYB9G3g+SHBFBB4PLz/51LHqYyR0mVFKrK1E0zM8HnL9iXiogH8F6PXRv3dsrG6UPbS4cPO8FzG+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1725
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexander.Deucher@amd.com
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

On 7/7/21 10:00 PM, Mark Brown wrote:
> On Wed, Jul 07, 2021 at 11:26:18AM +0530, Vijendar Mukunda wrote:
> 
>> +	/* Group Enable */
>> +	acp_writel(ACP_SRAM_PTE_OFFSET | BIT(31), rtd->acp5x_base +
>> +		   ACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
>> +	acp_writel(PAGE_SIZE_4K_ENABLE, rtd->acp5x_base +
>> +		   ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1);
> 
> This isn't connected to the kernel page size is it?  If so we might've
> configured to 16K or 64K, or possibly even some other options - I know
> those two are out there in the wild.
> 
No this is not connected to kernel page size. This is internal to ACP IP.
