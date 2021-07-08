Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 696E03C14AB
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 15:51:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF2131614;
	Thu,  8 Jul 2021 15:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF2131614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625752279;
	bh=GCiF3ZVEgPd1IfFHTUBGBHKLi2KyIxn8jDznpv3QO3c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OK1SnwfL8VnRFEf6+cyZZzGfwKYMvybqHuGafcV4TA5mmE0dhQyMfXbY8LWbrsnKE
	 TAPXMp7n3bpxOfHoYHbCyIglSVLfAleg2N/FXMZSXVVOt5w7vBwLqPwKPOwwwn7xyJ
	 ixUiCaxXh2YJ239zVqO3GashD0lm+wPNkK14quH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F289F80259;
	Thu,  8 Jul 2021 15:49:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23EDEF80249; Thu,  8 Jul 2021 15:49:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBDF6F8012A
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 15:49:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBDF6F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="2X83nQ6c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxJDDfUmO31lnhTDjC6mKFoFaF6JQPw41ekLX5WfJLrOvJ/hbE6RIF0stHAGW+smFX/oLzsLm/6o3RGuB+KeYJzAo6TjmXhsh9LTsXNo9MeyjLpfa70Fo/P+k2M8wLr9qXZuyvQ2zOIeSZtcgEh3RcIOjByCIFDecI7sftimM+mnNkv6r29NrnH+Gsuv3ks4XybDqAiOv0BTKYbT8uwyIbUJcnZpM0Bk9aERcz5p6IxRQ4VHmtV4bILZFEmJDJ/PDEInGHayCuNXF5nlhvbYMJ7G2qyL4gKo4acCgM212T6I6cNKWm8wCxr2qMCVcQPRtxcmNBP5TjbRwKPahpDfpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zq90a9gKitsz2V1+gGdRBz6G7syzg7Mgd4bwuARPe+Q=;
 b=n44DCnFmT5X8QeVtJbdkeUa7Ssuj+IncKS3q63S38GA4FOmxDuDnwEIvbVOvPt5VOQdtseJhY05Lggdm+zWSyuKGM4zAmkxY8VSIAukYgrW0e2MHOOnYuOQwExI+hpTZWZ2Xqm7aXQzFtMpYcgkZuG5lufACBpQPJozGmuLPYKL4sCTaHvBER64UCDqGbT9T1Y5MvWL2BlYQTXUuiu6J0HM1TiVZYvBj9TzjXSlUrfPLIes1T3eB2w6XsqmPj2G+Z7ckly2JRaDUz5WaSfWLRto8vYSN1utjgqXjnz9QlAF7AgSy5l9tuCggSRbKMm1Xgi9n6jsN+CWMCBy8BItSXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zq90a9gKitsz2V1+gGdRBz6G7syzg7Mgd4bwuARPe+Q=;
 b=2X83nQ6ce4d0BPgPmuDtfurcvdKaZwMKnQkZFomwAf/xWKKcDXBxv5YEV0585ZEqx5Ikr2+FQHWuH3SQ872VhPWWkJuT6qOFCAXETENscjwOr2ub/6vdf19mMyzp416GZpvY4iDrWRi2lkJSj5RZTWj3bvVbWs8qZNjqoo7suYU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CY4PR1201MB2550.namprd12.prod.outlook.com
 (2603:10b6:903:ce::13) by CY4PR12MB1703.namprd12.prod.outlook.com
 (2603:10b6:903:122::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 8 Jul
 2021 13:49:35 +0000
Received: from CY4PR1201MB2550.namprd12.prod.outlook.com
 ([fe80::d53a:8bc9:23fa:46bb]) by CY4PR1201MB2550.namprd12.prod.outlook.com
 ([fe80::d53a:8bc9:23fa:46bb%7]) with mapi id 15.20.4287.033; Thu, 8 Jul 2021
 13:49:35 +0000
Subject: Re: [PATCH 02/12] ASoC: amd: add Vangogh ACP PCI driver
To: Mark Brown <broonie@kernel.org>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-3-vijendar.mukunda@amd.com>
 <20210707161730.GE4394@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <208c55ce-7c62-720b-666e-0973bc91e6cd@amd.com>
Date: Thu, 8 Jul 2021 19:37:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210707161730.GE4394@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To CY4PR1201MB2550.namprd12.prod.outlook.com
 (2603:10b6:903:ce::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Thu, 8 Jul 2021 13:49:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c0d4008-d0ec-4a2f-f769-08d9421738bc
X-MS-TrafficTypeDiagnostic: CY4PR12MB1703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR12MB1703CE84F05BC576DC0D9FAA97199@CY4PR12MB1703.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xB+CyfQxVdrPzfihwUCf1wfpgkOcuwWRn++6iVk87MEpPfxPNXoWBZwpVujwRklwBRTvszNWAiZ7v86V9Quo/LqOBH3hVXTtFN9q2nhRXFtwf6Pg+bYJu+ODPApWg2rgY5MrJxL7b2cs6PSGuAYu8T046kECyG3ywvBiXBLCNKnqwk5nD/Om8tkCihFZjeFk8B8hRy8N2ynxKWpXIYCSDKUHn2dCy2YBMQoAQobtRrIQ5m77wWkHmRWPR9gyp5KZMWxw3CJSVrdQbo25TB1xNK31zheyEV9zTdFUiQF98giSpzL1tU6j/mPDquAYjNtXUeNLboExt20WojnicbcCOTvHRW/OI1OKck9Gkqq0ANuHtVGfW7HPVnEQIPHWg0voLIc0yriPyfufVZjcp5hjrR/asMBCLofBBG8GGOs9vSwQA+7cd1snHI9XpWDfje/18ROg8Y3mhrJaUsdAIrTb6ohHWSKxAlw5YOz5hrIW+cOK/XnjJyqE4gHuolIxl5RXEGoVxGZnbCBI9AAiLIeNuEdI0YMRssJ5n0lQfUTbO6GboQN9NuKR9KApqdq3bVtQ3EkqoHiB4Ac2/S1Sl/v+Qut6OwxM7Ch0hR+aWFd2SHJI0+FvnatWk4JGRAKA5eN32KTi+GFpTy+tm0/HanP/R6OyEDMEjJVRXMtZY++pNfx4AOCnXAo6FbHzGBmdbfKSvNeBSI8gNLvRViOv2/2BvmE1zaSt9u0HP06g2BpjsrY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB2550.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(2906002)(2616005)(31686004)(5660300002)(956004)(53546011)(8936002)(54906003)(36756003)(8676002)(316002)(16576012)(4744005)(66476007)(66556008)(478600001)(31696002)(66946007)(6486002)(26005)(6916009)(186003)(4326008)(6666004)(38100700002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?DLhovIHlj+0MplPPDUPtnZL7LdeDKMh0RnWMOyNrcTndj7coDJUkajwY?=
 =?Windows-1252?Q?FYy/QhTcu8kvFKQTXqug+8Y80VMhexLjeWln+q2hERor6efShvFc7sDr?=
 =?Windows-1252?Q?X50yiTgnY2BqB2jqP2gG0fuanL+jtBCVTTxy+lUMzZ9zixhcV/pfbeFK?=
 =?Windows-1252?Q?I+kqoTzSsuO0K4S1OKkEQDbykLaCOgzGblbWStENKhF1si+TCaLRyVwM?=
 =?Windows-1252?Q?j7GatVHg1lH772GZgfnKiKRj3m8oHanOztqNaw6ErTFqGcMH4HyezMZY?=
 =?Windows-1252?Q?tQXIKJ6ceVuwE+0ZH3aRxUdnvM3ZgnYAmv4Hj2+nXWfwC8o7rNustWrg?=
 =?Windows-1252?Q?6b/YAwV3bSYhMtGgG/LSPdZtSu2Wz3T8tY7lv3fm4wiz5v3kCTs4NflV?=
 =?Windows-1252?Q?hzmooUyKmaWG9A14/XoNkzjauwx8IbfLMOmDEE/lQJWiA97hbuKTc2Xv?=
 =?Windows-1252?Q?r2ggt0Y3hfVjeP4MGGrcAtVjtH3PIA4sR2nZnYqPGpElt1y2VPBhrjkD?=
 =?Windows-1252?Q?47gFjvu7N2Kf/gFr9ZmzHUKA49hst6GXms0LjDNYvf84yGmC6FZTjZaw?=
 =?Windows-1252?Q?6osLmMcosX05Q6P6bBwLuIKY++9fjkkJbK01mLO4iYUx88oEjtqLAxr8?=
 =?Windows-1252?Q?x1jj4oUKqVzze2aumjr50pOOVYFQ5r4TvAdv1tJLpYOTR4nRG8LixWy0?=
 =?Windows-1252?Q?+z94NtYsYJHgwdWXrklsheeHweFD272yCfQyWc4oJXlNYIX9UY8qrIcE?=
 =?Windows-1252?Q?Q8sA4yDRCPCLfVGjCkH7cu6hT6dv2Uj9wlaVpugK+aImRwuK9Rr41O87?=
 =?Windows-1252?Q?zVKAsKQtD9bCmnt2vUQcExYEEA0nbeqpI+MhYZDZADv0ccYRqm/ydGJ1?=
 =?Windows-1252?Q?137pioNgi8/ZfLGecMP8GK7ikRY5tN7y43PWWTWr0KDeu1MSd5QmQfOg?=
 =?Windows-1252?Q?0pB31W0rPm6eITnWV/zqVOn3LjBcEzOr0et2eUZi392wnnjRGtOCJazY?=
 =?Windows-1252?Q?YxSdHjQrF9Z6t6m69P28KY8LoJeJq8EDSvKkRSSsEGxSs1Y7aCLvVYjE?=
 =?Windows-1252?Q?FRf96xWrjXdvpriRtvLEHAh0LisMxPLEBGb9eNsSUxNeQvjCsxGQ8Plx?=
 =?Windows-1252?Q?WShWDGAEBJUDyt32jpBZ2b+XbZCIr1NiuUoDfdexFV1eZAoskwugA9cv?=
 =?Windows-1252?Q?wPvF4AnP5LHzK95BykxWhxVyjaK6xSXUgVw1Jt0a17WYrZMvzD2lntZP?=
 =?Windows-1252?Q?lijkHYDj5yImO9kxgTHvQA8KWtDsAWDVieIM7wZ6wUdecjAv+VOo3vRd?=
 =?Windows-1252?Q?9EFSLshcHjyhfv3pPeOe8zoOC6OOu5ZxfzfL6V/qViHJyX//4YAI7M41?=
 =?Windows-1252?Q?V5GxUEWwYzDY5S41eNM5VgUbvbxiUWFG2WxdH1cNeiT7ltkbi/WtJdv1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0d4008-d0ec-4a2f-f769-08d9421738bc
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1201MB2550.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 13:49:35.6493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0z4V99AWjsihc+8T7k7IMJtW2qdoiG/gJiQCgcsHk1E7Ac5GZac8AoGMpx7KUWdgUHuPq6fAeMPOm22NlkVyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1703
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

On 7/7/21 9:47 PM, Mark Brown wrote:
> On Wed, Jul 07, 2021 at 11:26:13AM +0530, Vijendar Mukunda wrote:
> 
>> +static inline u32 acp_readl(void __iomem *base_addr)
>> +{
>> +	return readl(base_addr - ACP5x_PHY_BASE_ADDRESS);
>> +}
> 
> I see this was the same for Renoir but it's weird that the read and
> write functions are substracting rather than adding the base address
> here.  A comment might be good.
> 
We can modify code by providing relative offset from base address which
adds base address in readl and writel functions.
To make this change, we have to modify original header file.
To have sync with our HW team and Firmware teams, we are using same
common header file.

We will add comment in the code.


