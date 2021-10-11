Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5EB42A423
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 14:15:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61DF21692;
	Tue, 12 Oct 2021 14:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61DF21692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634040903;
	bh=3lm7jGZVEDZfQVf15x7+pZEorqBnMlzE88dqc85bDVk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NADFCzTc7Ry0uCoSxqv48F2n/9kubNNvwuMN8uHUyGPWYHq3w/bvPT3vQpHboqaLk
	 FK0Xxa2rd1jM3cfqpdoUw1Rwquy9ZQfeNAGyH3VfBvKQsNnyTzlvg/OuPe4+Lh53oR
	 iOxHIrXXQgbaPzh71HSw3Dlv+P/KxpeobT+TR8+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C60ACF804AF;
	Tue, 12 Oct 2021 14:13:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F7FAF80269; Mon, 11 Oct 2021 13:01:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=CTE_8BIT_MISMATCH, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2067.outbound.protection.outlook.com [40.107.96.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F218FF80104
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 13:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F218FF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="NCywItal"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2TW+vJBinPZvwMOYOXq0Tux242sjVExXWMH1d3MP2Nl1L8Ep5zqXzvvcThAwNPNtRywBZ87FK3KBi0toc/RTb6OHpem+BrlGhvwK5jnTxLcVj9/RSbBRCZRef41LQvrgCo2OkOcZ5yt0sy/xtsfZItiZCZ/B+xTbuO/6jIVen0B+2Ql53/HZVyovPG3jzjml5EwKw2ZM51JfWWKLheg8+7xGb2DnJCVHGrxvCsZMwwvnT+v9tAvayVp+QGnYedq85k6pGFB5sba+PXvftrsM8iOQGSrs6HsaK+hX9fJIWvzNzJU9LZ28y/OkqdJRlEPCVieS0WGcY8WEegRLUcX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoA1IjI2Q77kH5u0frUQIdD3SfAkJGc73cV1bhVyZO8=;
 b=PKZZn5w7SQXlvegBu6STAumz3uxBTWDTZqBn2udWEqQthWWlDH/pC5nCM3Oy+8+MeRqhck/tUacOFx28Zh7bmF+nsSj05qjXsTMcch4k84XNffRdALKJGAw1xdk1AqOJu5CLqq6GJkTK4PbPUywp3M7BQGFT00zdqw6ufuZriY8tMArtwP2fRqXso2LWDbliJIdgcXx534VUnPH483Yq0PEt/sXaRb5SVImFm8iogx4Y4IetyncRwFhmS4l5O7fcR3O4yFCqC8L8O4UUlQCiUZpUwwI7CNeZ//k0/nV9MpIJ1aedM4oVhpS3UUosW7hah8baOXGr45+pPzkDXVFhbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoA1IjI2Q77kH5u0frUQIdD3SfAkJGc73cV1bhVyZO8=;
 b=NCywItaln6q3VpBJLUjf71fnI3NTqO3PqT8moHvHPuFBPkWyJg2wFuQBbKpdSf4hJATLOW+hcunsBSRAs9qjFCbumlIA77vR7wlfETfmIAkFfKP8B0ojSw/por4AY+q8jPVB/vCgi5HxmLGMSjeCOLZB7QwiPRsSFt3J0ByDo2I=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3565.namprd12.prod.outlook.com (2603:10b6:208:c2::24)
 by MN2PR12MB3262.namprd12.prod.outlook.com (2603:10b6:208:102::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 11:01:15 +0000
Received: from MN2PR12MB3565.namprd12.prod.outlook.com
 ([fe80::acae:c914:cacc:aed5]) by MN2PR12MB3565.namprd12.prod.outlook.com
 ([fe80::acae:c914:cacc:aed5%6]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 11:01:14 +0000
Message-ID: <e61fa81d-bf63-8b41-03d8-12bd3e61af59@amd.com>
Date: Mon, 11 Oct 2021 06:01:11 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 02/13] ASoC: amd: add Yellow Carp ACP PCI driver
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
 <20211011055621.13240-3-Vijendar.Mukunda@amd.com>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <20211011055621.13240-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:806:126::24) To MN2PR12MB3565.namprd12.prod.outlook.com
 (2603:10b6:208:c2::24)
MIME-Version: 1.0
Received: from [10.254.56.127] (165.204.77.11) by
 SN7PR04CA0199.namprd04.prod.outlook.com (2603:10b6:806:126::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 11:01:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9b3db0a-1dd2-4e73-97ba-08d98ca6714d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3262:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB32624EAFFE49DA12B29F167F95B59@MN2PR12MB3262.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:240;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zIo1SvGv0yAkO3cUZ30jS3JG6HURl4h6arK0hJby+dYEaDx3tQnkRYr/XtlTedI8NPVzSlI4zeq1s5/6nXIhIib+JcROYQEAv37Fz5Pr9t9N7oeIJQYAF7HH/1O4crgv9P+L/7gmrrFLDA6y0+ayWLRAt7D+qnvFyUNv48bRJTnQ7tITA8ISevInMTnTDe2BmwgJ8Vh1I5h+cMx9d5Zzl+n8BhesuCrRN56XtSnCnj700h3OTUkv/QVj4YjP5wAW8NkOBXUdJCCjrHyldLHCsdX8S2o7OAb70RJEokB1uLGH0YURp4sfx2fvQLMiIlL6HnXHHj+PTXFvOGPlKg5pPskWm4f/ootHAJkj45mWHklCH9xBFPyJ4+jXCYodxLhd4/6tPVEwRAvQxC6Foqk7bNz5UEdHuaxVg5R5bqN0r906XWv96zpK0UVMvBFYAqOr4Nv/dOo9JhxK1KfWfdDUys6+6oKbJ3ViiIH8emrKG2N2Hz6U30T9i8qYGLBB3FkW4f32gKLGoQGxPpcKw4nXgrZEk/qj+sU1JoyhTV/1QgP9jTy0qW9cQVjIbIvPN2LsDxDFn6tVFQEzj+z+7lEYHzwwEP94r0W7rX6JiVFSh5L4Xg16gKfraGs03Dj9B6FugXbRhNQpA7W+lWxEXYi2IFq8r3Tb84NXQ80si/oCPTewBnPIEBA9TqpYJ6ne4QsYyFWZyQghfCc73HbvUmPvTtJpS0+KXLAaFH2TQe+mVApqIaKgKHv24ClkfRqujswl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3565.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(66556008)(8676002)(66476007)(2906002)(86362001)(4326008)(53546011)(36756003)(186003)(6486002)(31696002)(8936002)(5660300002)(31686004)(508600001)(38100700002)(2616005)(26005)(16576012)(110136005)(956004)(83380400001)(316002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUp4cHN5UldIdnFValgybkdtTGlxMzFXdm51STNxTXczNWxMaHRpTjg0V0hG?=
 =?utf-8?B?cVd5d0RlbHkzSytQZkZ2V01NOENwZTNWZ1B5TjJZb1ptbzBJRk5wdWErbzdG?=
 =?utf-8?B?U0cyUUFuVThjYk9KV2dDbEVNdVlnbUNOZW1CRmFQUE9pM0ZvRTh3WE12ZW8y?=
 =?utf-8?B?eUZlR0ZqNFVpMk5zdFVWdEgxbGFDWWdiV1NWeFIwRE9ZajhjcjZiaFFqQ2Fi?=
 =?utf-8?B?MVNGeHBaS3NtWnU4eVJwQ3dxYkRaSFVvTllVaTFhNTJweEREUWorR255NlNB?=
 =?utf-8?B?ZitoOW1UdGhmL3kyZGlXRGxvbVphamx3RG9YZ0k3Z2g1YXgwQjI4TDJpdUpJ?=
 =?utf-8?B?RkpzQkExcHY0aGZnd2h4SWI1VWcyQmVmRXFOcWlKTlJDZnhtcC9TR0FuSmQz?=
 =?utf-8?B?UlNOOGszenE1VEgvT3BTclFjSHJkQ2xRaEQ0L29ZU1pHemdVQ1YrUUZVanlZ?=
 =?utf-8?B?QTMyTG9RR3RSS2J0WjhvTW9jemZpNXd1U0x0KzVvS0hpZEVrNGJ0aTV6MU84?=
 =?utf-8?B?RktOTWN1NjFwMHhhYmZSSmluOS8zUlVXcDhrVDYvbWhKS1kxakU5OWRub0Fx?=
 =?utf-8?B?NEU4MzdLUzFjQWRIL1JWeTk4cDVVUWxSS2xJWG5ZS1g3QmlqRmd2TzdkRll2?=
 =?utf-8?B?WDhmUkcrN1ltMXl4aktNZUV2R3QyOEJTV09VR1hWVmVPa2tMUFB6TjJXb0ZR?=
 =?utf-8?B?NW5seXlPSzJUanoxeFB2dGxETVBEdHk0TlBTTkd2YzBhRGRIMlV2M0hGVDIz?=
 =?utf-8?B?MWxldXU5UzBWUWNrTlpRY2ZvVDNYYlU2M2sva1FNMUI3NFN2dHNRRkFBdmtl?=
 =?utf-8?B?ejJ5MGdlWWxJRkVYU0pqRk9SZGo3Y1A2a0RDejBUWHdsUzNaZjloNDNVVXA4?=
 =?utf-8?B?bHdtaWd0WldXS3RyY1d4SUs5cUJINzR0SlhFdVA1UzJvUjZPVVB1VFU4ZytX?=
 =?utf-8?B?eXZWWlFVR0lIcmEyaW96Ky9GV01FU3E1MlNqajNTV0RwWm5HL1RBL2FlbWlJ?=
 =?utf-8?B?UDd4TEFzczJBOXNVQitxS2puVDd2bkt6azhBU1c0dTFoNFBXRXkyRnc2TmtS?=
 =?utf-8?B?TlptOE9ZOFl4aHdDOC9mYWk4NWZnWGt0ZmVoYjNLTXAzVHJqbCtkd0dTanRi?=
 =?utf-8?B?MElwdVBPNjdnL21ieGExQUtnUnlOUEM4NTQ2K3RnUjQ0MTUzSGdsVTVSR3FN?=
 =?utf-8?B?R3Nra0dSOGd4ZE4wYS9leDdReGllT3lPZHVlODVab1BQWHEwNnk0bUtLQTZU?=
 =?utf-8?B?YWpPaFM2TFordzBPT2hsMkhsNUhWRUpLSEVGWHJrUXJkenVUdkVVRzFjRjRi?=
 =?utf-8?B?WHpTUEJEZmlmOE40TUhFcW85UGlldHZRa25LSWxaaW45U1BCQk5UK3BsdFZx?=
 =?utf-8?B?Q2c5SC9tQ2wxUDI3eEx6YUNkaFpjZ0lzblQvOFd5b2loUkMzRW1lZklFTnJ3?=
 =?utf-8?B?cW8zSU5WN2V2aW1odCs2b2g1UHltMTNQVzNGUGJLRnY1TXpuU3E1bTdBTUZs?=
 =?utf-8?B?Q2RvYVgwbE44KzFDTHZQSmVhNEZDL1pOVkFlQ3dFeG9jN2szWTdpM25FS3Jv?=
 =?utf-8?B?WGZVZFVYUXNMZVNTQ1ZXNmlFUjNlLzIrU1EvNjN4NkJZd2I5SlRkMWRoTjZw?=
 =?utf-8?B?Tm1taGtHZFZFbXg5anBxeXh4SC9KSGM4eFdwMkJ5V0ZNQjlvdmhVMzcrSE5B?=
 =?utf-8?B?MUZ6THdDNmtVRGpKS3dCMk9uZk1uWnJMN2xyV1VHb09oVUExa24wcU1QbUx6?=
 =?utf-8?Q?phfpWqY5U2pb+GJP25qFDlOSzcrrg1SGt//0H10?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b3db0a-1dd2-4e73-97ba-08d98ca6714d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3565.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 11:01:14.5384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SqjqlfNtJ0kEuzSXllYjvxNVLNvHUMGSYEbc7nyTrqwi7Mq5CmOOXFW8nGW07ASGlBsy0X4Gi+vTYPNPxMhqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3262
X-Mailman-Approved-At: Tue, 12 Oct 2021 14:13:19 +0200
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
> ACP is a PCI audio device.
> This patch adds PCI driver to bind to this device and get
> PCI resources.
>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/yc/acp6x.h     | 21 +++++++++
>   sound/soc/amd/yc/pci-acp6x.c | 89 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 110 insertions(+)
>   create mode 100644 sound/soc/amd/yc/acp6x.h
>   create mode 100644 sound/soc/amd/yc/pci-acp6x.c
>
> diff --git a/sound/soc/amd/yc/acp6x.h b/sound/soc/amd/yc/acp6x.h
> new file mode 100644
> index 000000000000..62a05db5e34c
> --- /dev/null
> +++ b/sound/soc/amd/yc/acp6x.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
Use // here
> +/*
> + * AMD ALSA SoC PDM Driver
> + *
> + * Copyright (C) 2021 Advanced Micro Devices, Inc. All rights reserved.
> + */
> +
> +#include "acp6x_chip_offset_byte.h"
> +
> +#define ACP_DEVICE_ID 0x15E2
> +#define ACP6x_PHY_BASE_ADDRESS 0x1240000
> +
> +static inline u32 acp6x_readl(void __iomem *base_addr)
> +{
> +	return readl(base_addr - ACP6x_PHY_BASE_ADDRESS);
> +}
> +
> +static inline void acp6x_writel(u32 val, void __iomem *base_addr)
> +{
> +	writel(val, base_addr - ACP6x_PHY_BASE_ADDRESS);
> +}
> diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
> new file mode 100644
> index 000000000000..2965e8b00314
> --- /dev/null
> +++ b/sound/soc/amd/yc/pci-acp6x.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0+
It's correct to use // here.
> +//
> +// AMD Renoir ACP PCI Driver
> +//
> +//Copyright 2021 Advanced Micro Devices, Inc.
> +
Use /*  */ rather than //
> +#include <linux/pci.h>
> +#include <linux/module.h>
> +#include <linux/io.h>
> +
> +#include "acp6x.h"
> +
> +struct acp6x_dev_data {
> +	void __iomem *acp6x_base;
> +};
> +
> +static int snd_acp6x_probe(struct pci_dev *pci,
> +			   const struct pci_device_id *pci_id)
> +{
> +	struct acp6x_dev_data *adata;
> +	int ret;
> +	u32 addr;
> +
> +	/* Yellow Carp device check */
> +	if (pci->revision != 0x60)
> +		return -ENODEV;
> +
> +	if (pci_enable_device(pci)) {
> +		dev_err(&pci->dev, "pci_enable_device failed\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = pci_request_regions(pci, "AMD ACP3x audio");
> +	if (ret < 0) {
> +		dev_err(&pci->dev, "pci_request_regions failed\n");
> +		goto disable_pci;
> +	}
> +
> +	adata = devm_kzalloc(&pci->dev, sizeof(struct acp6x_dev_data),
> +			     GFP_KERNEL);
> +	if (!adata) {
> +		ret = -ENOMEM;
> +		goto release_regions;
> +	}
> +
> +	addr = pci_resource_start(pci, 0);
> +	adata->acp6x_base = devm_ioremap(&pci->dev, addr,
> +					 pci_resource_len(pci, 0));
> +	if (!adata->acp6x_base) {
> +		ret = -ENOMEM;
> +		goto release_regions;
> +	}
> +	pci_set_master(pci);
> +	pci_set_drvdata(pci, adata);
> +	return 0;
> +release_regions:
> +	pci_release_regions(pci);
> +disable_pci:
> +	pci_disable_device(pci);
> +
> +	return ret;
> +}
> +
> +static void snd_acp6x_remove(struct pci_dev *pci)
> +{
> +	pci_release_regions(pci);
> +	pci_disable_device(pci);
> +}
> +
> +static const struct pci_device_id snd_acp6x_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_DEVICE_ID),
> +	.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
> +	.class_mask = 0xffffff },
> +	{ 0, },
> +};
> +MODULE_DEVICE_TABLE(pci, snd_acp6x_ids);
> +
> +static struct pci_driver yc_acp6x_driver  = {
> +	.name = KBUILD_MODNAME,
> +	.id_table = snd_acp6x_ids,
> +	.probe = snd_acp6x_probe,
> +	.remove = snd_acp6x_remove,
> +};
> +
> +module_pci_driver(yc_acp6x_driver);
> +
> +MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
> +MODULE_DESCRIPTION("AMD ACP Yellow Carp PCI driver");
> +MODULE_LICENSE("GPL v2");
