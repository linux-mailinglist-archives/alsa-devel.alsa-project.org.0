Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C6A42A42C
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 14:16:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A06916B0;
	Tue, 12 Oct 2021 14:16:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A06916B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634041015;
	bh=m8BwOzQwOZ6eLQ8qpm+lA47LgySBiAgRwWhbuSxfn8c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UpZq8VbjpsO9MJ+Aw8UIRqbbZU7r0FBKI27uXWJ/o8b97Ow16lEfDcpkQRLHXdZJF
	 Ps6qdtd4NhhXWKlU5CQ+GWmVmR+i5XM0U2qyITDcJNl7GVaQ8pFmcxy+8c+fx61fvH
	 zxR7J1rFIVCyzGCoFM5ClH+Kxm03GYNGlf0wwulg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DE32F8050F;
	Tue, 12 Oct 2021 14:13:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BAC6F80269; Mon, 11 Oct 2021 13:06:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59ADAF8016D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 13:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59ADAF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="JTZuoA9q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sn27sdXJc19SvZ+QG05MhF1HiFSMlT7+1cQWvBIyW+5m9rCztsVOh2brQvLvls7l0UaJPOwY48HPCubxtdHaNacdYuO0le5RATHo49QPv0p856uQJ8IhF2EBmroQ2nKFh/whrrhN0cVkLScHZS2clm57Rc/FDouXQ0FXcV3vrfaeVrQpxQpSU8dezm8aLCeRL23+uziUNZrgOmbNGyL/TyA2iObZwH8Ukg8jYbYq2adgdyZ4JmFkSgznJgx2iMcsL9EtUfrJxKSLAxzMbjC9ZdfddZcwgo9K75PIlym5Qq3vCrYLjTY0NPLyRaePALfrVgUHUSJgvZZ0LgfUcct7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P60C6AbimL4JqJ+dr72FB9uh1tm7bF8q5AO36Zosiyo=;
 b=O01s4Kucyhv/2AokYP5Ovnnjh3NFZg4OdbCfr0mXtztO9qB6bGWTLi43hJ8jghZarcpkIUdYiKh63Gr0tbTDwxzBCycFOFS3Hu4xEwmRLKrAuWn4q5/6xRbp4fiRHlaReIcm1ZzTLHfsO+DxxTEJOUo00GGHhDt2vjLC8ZZYiaArivSJoGQf+gBmicrgVjZY+ubN+0sRbyUACjqmhdJXQ49RC9PeSliS2gcJN3Nsu2cvgWvgoGS5yUWJfwMhHieaSvm9EekH40f4SVBxlFgZLHzZ9J4OxqJi1CZtJfnw8SpcxdqVsVEircIwkqfPuq11++Fa+UBpr2CKjqeHrnO6Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P60C6AbimL4JqJ+dr72FB9uh1tm7bF8q5AO36Zosiyo=;
 b=JTZuoA9qo5vqfe4EXWH/bCQxtD71JlSCjDwO8ADs88UGL58Y9Riwpa5LDdori/EQThDRdTqOke+HzP1t+IBHoClal0Q/9xJHBLX3nFdv51FikRNkmBV8ibg0+OOnXmePvAZlwaPzPTp39h7SQyOtfzdPOozjLEheRteN7jkpdz4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3565.namprd12.prod.outlook.com (2603:10b6:208:c2::24)
 by MN2PR12MB3262.namprd12.prod.outlook.com (2603:10b6:208:102::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 11:06:25 +0000
Received: from MN2PR12MB3565.namprd12.prod.outlook.com
 ([fe80::acae:c914:cacc:aed5]) by MN2PR12MB3565.namprd12.prod.outlook.com
 ([fe80::acae:c914:cacc:aed5%6]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 11:06:25 +0000
Message-ID: <32f0e33d-0f9b-f27d-2fa8-63b493c2d9aa@amd.com>
Date: Mon, 11 Oct 2021 06:06:22 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 03/13] ASoC: amd: add acp6x init/de-init functions
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
 <20211011055621.13240-4-Vijendar.Mukunda@amd.com>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <20211011055621.13240-4-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0181.namprd04.prod.outlook.com
 (2603:10b6:806:126::6) To MN2PR12MB3565.namprd12.prod.outlook.com
 (2603:10b6:208:c2::24)
MIME-Version: 1.0
Received: from [10.254.56.127] (165.204.77.11) by
 SN7PR04CA0181.namprd04.prod.outlook.com (2603:10b6:806:126::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 11:06:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7022f197-d3ce-4974-67cf-08d98ca72a7a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3262:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB32624D1F516E03D1337072B695B59@MN2PR12MB3262.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:82;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WBN1xarX4kXpa/9exKn2Do/rCbDzf6D3MCNiVwCG/ARdvJVp0BbERnGaZ4wFCCQX0i/TzMfXgPhC/xm1Jbmq1iFslZV+OLnS5vepRyKbljd7Vs/KswvqJtAwD8ATQl8PdMW9f2q9iF5EuUlpR8rt4N04k77j4vAQHyWHTDH9ZP4rtjMYlIfcWATkS8tuhlU20w89mT0neaL6pEXyRpYUozPbio/ix6T2uE2qM7UdpsP+UByvBgsZ6kpm9BdWAG0tV2Um5EAMow6wxEuTJAv/m1wO0SrJS0clWdhwoHvU4qfLtXahcH4FP7uhXZUABlV7qVcXCcEi2sSp5rOyTrXiTatUXQhdk2bmdyp7s6yiBIID/XDNlMVUIZIoi2aSrYvLsdN4dm7vmV3J6nC27WX+rRoZW3n4fj1DnMsdn5mRKE+ch5mVvW7fEgDe2a2oJfX3Q3228HqJknQ/YunSnCzicJvI94JXfOKxMuYFqhl83qXQ4+AMzvVbKlMNbDwfj4onxJVKNCRq66ChldZKF/O26TQWC8vXsXO+E/z01SK9nHLYFPj2N1N+9kBTuStORLNINuctofW0c6dgUzOsBkynT3QI72MDhKOrskcqvjJFPJEZrtO4K6xDpiC+5ikWNbC8ucEGUCBvbiAcrSQfhugxZsLy5QqIzoy/fwvJIRuEVQyN1YcVMHl54qalbsos/gInQyl/0n4pqiyPeD3J1AVSgohn3CZcjVNJlQo9MRNsGkIncvKwkr+DtYRXBovDi3QLk90FRs6pK4yypJ8VOWDjyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3565.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(66556008)(8676002)(66476007)(2906002)(86362001)(4326008)(53546011)(36756003)(186003)(6486002)(31696002)(8936002)(5660300002)(31686004)(508600001)(38100700002)(2616005)(26005)(16576012)(110136005)(956004)(316002)(54906003)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b08vU2tNc3hqeFB4bW94MGtrSDJBaXE3SksxamZqdmFJRFIybWpnRVFJSzR4?=
 =?utf-8?B?RDFpRjlqcVNtUUFLVSs5ZUo0eXZZUzdWWVN1TTJNb1VQN0orTm1FaWRneVZu?=
 =?utf-8?B?VUJyNDcwWW51dVB4TzlPOHUxbjF0K2FxdnBSeEtCQUp6bE5yR21MNEN5TXFL?=
 =?utf-8?B?QXI0OXRwcElnY1k2N3U3Q2ZWZjVvbzdSOVZXbjY0amtoZDAyWFp2OFVmcVRs?=
 =?utf-8?B?T05aUitTMUZzRnRGQTFFWHVlV1V1Q3Q2TDNndkxxa1FKVTd2M3NhdTlxSzd3?=
 =?utf-8?B?UHdFdExNU3ByaGdhYmU5cklHTU1uM1FxQU1rUTRwc2VFRHNicHhVNC9qN1NP?=
 =?utf-8?B?Q1JjaytsK3RXOW5qZjJkejRGWjdVQUtIUXZHNjBqN3pNK2hoRFFobENsQUoy?=
 =?utf-8?B?ZDBDR05SUU13SE9VYUJobzlWM3VFMUxmKzg4RlRjQ2VzUS9VcDU0ZHdibXdJ?=
 =?utf-8?B?eDNEQVp2YnlYK21hUEUzL0UxNmVJUEpROWN5S3pNQU9tQ01lU01xZjAzMGRK?=
 =?utf-8?B?VWJmcnYwczNzWUNWd3BKd2lrbWV3TUxNbk0rVk5kVEJjd0wxckdLL2NLZFls?=
 =?utf-8?B?T3FOOEE4V250ZVZ1TmJxaURBYzNNaEJlbldRTUo5N0xzSSsxZXFteHFiUkpa?=
 =?utf-8?B?azhwTEhWQ3dxbTdna25IQzllNUJMNjlxUEJBbVRNT2VUMGxhV29ma0ttMEcr?=
 =?utf-8?B?VW1hcHRCN3V0eXhXWjZuSWpmMEc5MVBJbWhTbXByWmJiVVBETzVjS2xJZlI3?=
 =?utf-8?B?YWdjdkE5UXpqRzMxVXJqN25iNzdISHRlMHNGNjBhYjNGUjc0ZldFSGJqMW1x?=
 =?utf-8?B?azdGZkVEY0dHazJiVFBGYVlBWkpyMDMyZC9jc0RpZWVJMWV6dm9LdWszNDFC?=
 =?utf-8?B?Y0k0Z29iMy8zck11UXV0QWMzaVdlcGRYMC96UUNwOE1VVWVJbDdUT0JZekV1?=
 =?utf-8?B?cGtTRlNieDNCZG9OcTArRWdveEJ2Qm04aEt2QlBVWE5BWi9wL2VKZzFnSWtG?=
 =?utf-8?B?VHh3SzI2ZGg4Mkk4WjdlYllsSEFjNkQzbDFrb2JxOVpzSE8wY2FidWx5TGgr?=
 =?utf-8?B?Nzc2djNXbVFVNkZnckpBTnBVcklnd1c1dXNBc3JjdlI0TEtTQy94WG1Yd3RW?=
 =?utf-8?B?M3pGMzBCVkh6b2xVa0dsekxtZG4zTXBMSU9DV0U3Q1g0Zy9xYnZhWFFjOWxG?=
 =?utf-8?B?U2lSbWVzS2FYVGdrOW1BMFdlRFUybU9pRHEvalJjR2dQOENvc3VPcnpKOTNT?=
 =?utf-8?B?TlBhV0RTaittd3lqbUpEMmdnMGM1MUFzVjJBK05wN3F5eFpYNkNZMFUwM3JM?=
 =?utf-8?B?ZHEwaWUxRVMyT1N4QlUxbmhxMXQxVUpBTTZTUEk0M3JLenFYMERBSExtalhC?=
 =?utf-8?B?ZHo3SjA2dlVyekdPR2RMeTd2V3Zjc0tqV2NnazRQUnVFNm1DemdZQXhvQk95?=
 =?utf-8?B?cDFuOUl6QVJNYnpnZDZOMDNTWHA0NW1MVVkyZldZUkhYazZ6OVpPU3dNcUNH?=
 =?utf-8?B?MERWd05xN3FYWmxza2JtWHpGcGlqd3MwSHppcllIT0tBU01ORFlsZllsNnRO?=
 =?utf-8?B?NTlJSS9rQWd3d3E3d1J6N3EzSjFmeDBrR1VmcnpWZmphSTJKZENxR05JUmJs?=
 =?utf-8?B?TldQMDhwTiszdW11VGR6M0x1OGNOdEdOcXBJVERPQTkxZFpha3RwTXpRRklM?=
 =?utf-8?B?TFVnWVBmQVhWSFhiQVpqeDB2TmZyTG5hZi9VQUsxUGtNS1dzWTN3d1VMbjZL?=
 =?utf-8?Q?x1wgJB45eA509kaa6p3au9+r0inz4AVZyYUKrpb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7022f197-d3ce-4974-67cf-08d98ca72a7a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3565.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 11:06:25.1437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXFL96W2bzbMZ94mJtX4voO8WaO7hJa7ht+QsULneucW4eF8nPlogXQsDQua+hiqR5texhYFHp8oyKGEQSAaQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3262
X-Mailman-Approved-At: Tue, 12 Oct 2021 14:13:20 +0200
Cc: "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 open list <linux-kernel@vger.kernel.org>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
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


On 10/11/2021 12:56 AM, Vijendar Mukunda wrote:
> Add Yellow Carp platform ACP6x PCI driver init/deinit functions.
>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/yc/acp6x.h     |  12 ++++
>   sound/soc/amd/yc/pci-acp6x.c | 109 +++++++++++++++++++++++++++++++++++
>   2 files changed, 121 insertions(+)
>
> diff --git a/sound/soc/amd/yc/acp6x.h b/sound/soc/amd/yc/acp6x.h
> index 62a05db5e34c..76e9e860e9bb 100644
> --- a/sound/soc/amd/yc/acp6x.h
> +++ b/sound/soc/amd/yc/acp6x.h
> @@ -10,6 +10,18 @@
>   #define ACP_DEVICE_ID 0x15E2
>   #define ACP6x_PHY_BASE_ADDRESS 0x1240000
>   
> +#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
> +#define ACP_PGFSM_CNTL_POWER_ON_MASK	1
> +#define ACP_PGFSM_CNTL_POWER_OFF_MASK	0
> +#define ACP_PGFSM_STATUS_MASK		3
> +#define ACP_POWERED_ON			0
> +#define ACP_POWER_ON_IN_PROGRESS	1
> +#define ACP_POWERED_OFF			2
> +#define ACP_POWER_OFF_IN_PROGRESS	3
> +
> +#define ACP_ERROR_MASK 0x20000000
> +#define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
> +
>   static inline u32 acp6x_readl(void __iomem *base_addr)
>   {
>   	return readl(base_addr - ACP6x_PHY_BASE_ADDRESS);
> diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
> index 2965e8b00314..56fd7cdbc442 100644
> --- a/sound/soc/amd/yc/pci-acp6x.c
> +++ b/sound/soc/amd/yc/pci-acp6x.c
> @@ -7,6 +7,7 @@
>   #include <linux/pci.h>
>   #include <linux/module.h>
>   #include <linux/io.h>
> +#include <linux/delay.h>
>   
>   #include "acp6x.h"
>   
> @@ -14,6 +15,103 @@ struct acp6x_dev_data {
>   	void __iomem *acp6x_base;
>   };
>   
> +static int acp6x_power_on(void __iomem *acp_base)
> +{
> +	u32 val;
> +	int timeout;
> +
> +	val = acp6x_readl(acp_base + ACP_PGFSM_STATUS);
> +
> +	if (val == 0)
s/val == 0/!val
> +		return val;
> +
> +	if ((val & ACP_PGFSM_STATUS_MASK) != ACP_POWER_ON_IN_PROGRESS)
> +		acp6x_writel(ACP_PGFSM_CNTL_POWER_ON_MASK, acp_base + ACP_PGFSM_CONTROL);
> +	timeout = 0;
> +	while (++timeout < 500) {
> +		val = acp6x_readl(acp_base + ACP_PGFSM_STATUS);
> +		if (!val)
> +			return 0;
> +		udelay(1);
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static int acp6x_reset(void __iomem *acp_base)
> +{
> +	u32 val;
> +	int timeout;
> +
> +	acp6x_writel(1, acp_base + ACP_SOFT_RESET);
> +	timeout = 0;
> +	while (++timeout < 500) {
> +		val = acp6x_readl(acp_base + ACP_SOFT_RESET);
> +		if (val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK)
> +			break;
> +		cpu_relax();
> +	}
> +	acp6x_writel(0, acp_base + ACP_SOFT_RESET);
> +	timeout = 0;
> +	while (++timeout < 500) {
> +		val = acp6x_readl(acp_base + ACP_SOFT_RESET);
> +		if (!val)
> +			return 0;
> +		cpu_relax();
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static void acp6x_enable_interrupts(void __iomem *acp_base)
> +{
> +	acp6x_writel(0x01, acp_base + ACP_EXTERNAL_INTR_ENB);
> +}
> +
> +static void acp6x_disable_interrupts(void __iomem *acp_base)
> +{
> +	acp6x_writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp_base +
> +		     ACP_EXTERNAL_INTR_STAT);
> +	acp6x_writel(0x00, acp_base + ACP_EXTERNAL_INTR_CNTL);
> +	acp6x_writel(0x00, acp_base + ACP_EXTERNAL_INTR_ENB);
> +}
> +
> +static int acp6x_init(void __iomem *acp_base)
> +{
> +	int ret;
> +
> +	/* power on */
> +	ret = acp6x_power_on(acp_base);
> +	if (ret) {
> +		pr_err("ACP power on failed\n");
> +		return ret;
> +	}
> +	acp6x_writel(0x01, acp_base + ACP_CONTROL);
> +	/* Reset */
> +	ret = acp6x_reset(acp_base);
> +	if (ret) {
> +		pr_err("ACP reset failed\n");
> +		return ret;
> +	}
> +	acp6x_writel(0x03, acp_base + ACP_CLKMUX_SEL);
> +	acp6x_enable_interrupts(acp_base);
> +	return 0;
> +}
> +
> +static int acp6x_deinit(void __iomem *acp_base)
> +{
> +	int ret;
> +
> +	acp6x_disable_interrupts(acp_base);
> +	/* Reset */
> +	ret = acp6x_reset(acp_base);
> +	if (ret) {
> +		pr_err("ACP reset failed\n");
> +		return ret;
> +	}
> +	acp6x_writel(0x00, acp_base + ACP_CLKMUX_SEL);
> +	acp6x_writel(0x00, acp_base + ACP_CONTROL);
> +	return 0;
> +}
> +
>   static int snd_acp6x_probe(struct pci_dev *pci,
>   			   const struct pci_device_id *pci_id)
>   {
> @@ -52,6 +150,10 @@ static int snd_acp6x_probe(struct pci_dev *pci,
>   	}
>   	pci_set_master(pci);
>   	pci_set_drvdata(pci, adata);
> +	ret = acp6x_init(adata->acp6x_base);
> +	if (ret)
> +		goto release_regions;
> +
>   	return 0;
>   release_regions:
>   	pci_release_regions(pci);
> @@ -63,6 +165,13 @@ static int snd_acp6x_probe(struct pci_dev *pci,
>   
>   static void snd_acp6x_remove(struct pci_dev *pci)
>   {
> +	struct acp6x_dev_data *adata;
> +	int ret;
> +
> +	adata = pci_get_drvdata(pci);
> +	ret = acp6x_deinit(adata->acp6x_base);
> +	if (ret)
> +		dev_err(&pci->dev, "ACP de-init failed\n");
>   	pci_release_regions(pci);
>   	pci_disable_device(pci);
>   }
