Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE3D42A426
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 14:15:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BE011698;
	Tue, 12 Oct 2021 14:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BE011698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634040922;
	bh=m8BwOzQwOZ6eLQ8qpm+lA47LgySBiAgRwWhbuSxfn8c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YS+pRPH++yZCoQAvWzpdbldYOCwgaody8DYK2WcEa3vXIW5Ert4M7+IyGZsGklR8H
	 BboLf6wYy4MSKiS3WmID+AhSyfnwjPCxl/lWxB2mB8JDeZmm6fApSG4Wt5H0mLggvM
	 AUQcTa+fjnz0j7RFsIEPqlLfNAjq9Q6VG0ZCe6zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 238F1F804E5;
	Tue, 12 Oct 2021 14:13:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B308F80269; Mon, 11 Oct 2021 13:04:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AE5AF80104
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 13:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AE5AF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="tPHgaCCW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTpDoJhjP576/YE2Xjpdi4Vq1/zU0bSEllPdkif3X5mIohWO5eixTYBECklGn2V8Q4k0M60zGjx/c2WnL7QGexbUZqxg/t97v0p0VtkQBeI0QBOGW4jrZPZJcJUHGvTuNToME9SDUrcoNU4wqZAbGHMqytwQLv4DBXOMSlLPG/WcGtWmaQW1g3mPaD9PXu6vNrIFms8Ydi2fnv7ag9nGMQu/RGNeXvYydFNS5gfZ7O0zxFmIY7EqWWwG68/br+gfVXn74nzn/XRohG4QYbgt3I1sSf0wL/L8CwK5q/TVuLwImtO+a1Y/ddGEaOH2irnt/eKJbGqgn8twCBsdTUnGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P60C6AbimL4JqJ+dr72FB9uh1tm7bF8q5AO36Zosiyo=;
 b=ULnAgk6Bp04DBZfkmk+r6wyDVi0XD9CimfHiVxGgFuOSFCGTo5xBhX5AEThzMLZ1iiAkqciDyKDUJ+LgvFhBokX1FySI7WdI4083HBkUVTifpUcGkSywLQ5ew+y5A2qgicR1LrmZa5wPpp2w5dH/MoHRXCRJaBPszMrIrVxY3pbQyrnMS/B4kMhIxqGYcgWbRBtAYrW6D0YRZR0gko7YZ0HjbrHsuPMOaL8qvvOm9Rq6/shuQ2gnUpe4r5hbHqLmTX1oVtn5yq6aQhMgKYNxVMPl6p5zA8lRoY/BO7BdGMvbfd7zrEFIh2FdRnvZpQPVyVwphSbaJNUR/u7/BHcNqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P60C6AbimL4JqJ+dr72FB9uh1tm7bF8q5AO36Zosiyo=;
 b=tPHgaCCWH4gSe9ZDh4HoiCsu1nBZNrsW+m/GtSUiYnWSqkxRIArEL4WLPSBnscsiYZujhjT61N/UypkqJ79GcQ6JsEDxYjuVjmX6q371iWIphpNct76DRIri4SOq/UQ00f5xY5pm0+VeM54XeX4Ov5kC/TFEegUsr/TmEiSodpQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3565.namprd12.prod.outlook.com (2603:10b6:208:c2::24)
 by MN2PR12MB3262.namprd12.prod.outlook.com (2603:10b6:208:102::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 11:04:34 +0000
Received: from MN2PR12MB3565.namprd12.prod.outlook.com
 ([fe80::acae:c914:cacc:aed5]) by MN2PR12MB3565.namprd12.prod.outlook.com
 ([fe80::acae:c914:cacc:aed5%6]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 11:04:34 +0000
Message-ID: <6acfaa80-f8f0-4735-40c5-2b91fa0a14ed@amd.com>
Date: Mon, 11 Oct 2021 06:04:30 -0500
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
X-ClientProxiedBy: SN7PR04CA0182.namprd04.prod.outlook.com
 (2603:10b6:806:126::7) To MN2PR12MB3565.namprd12.prod.outlook.com
 (2603:10b6:208:c2::24)
MIME-Version: 1.0
Received: from [10.254.56.127] (165.204.77.11) by
 SN7PR04CA0182.namprd04.prod.outlook.com (2603:10b6:806:126::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 11:04:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a4f36a2-83e2-4058-39d2-08d98ca6e83c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3262:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3262BC531D85A9602BB0AA3895B59@MN2PR12MB3262.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:82;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +LvNg6/kgZr5RN1VjKab33bMtImqxOYjQZDoM8+GqZnzJMISFih20vPuBoCRSDFXA/s/V4o319rYe7sSBSGe71JdkrGJnDF6pvdKExM0t6nTVQtYrCVAhdbuHHpA0r1u9PeBy4zg+yx54+A/s6g2sg59VC879CMSYURaGGf3YV5pnQld14HcMY6+VCNmDSArcK3j3K+eafY46M7sTyZ0jZ9mTCfTF+Sv5Hsgo3p9Yhs+wXNHltaxe9nTtETsa8i1R15H2JfettYoLdO25tcYnN/i/MV0KO/P3sDEI5fWhrlCwMnF48/Yd+dTmEZBiIiBmQEbe0HXc7omoZcYvYIubZ15mULyk+p03C7BOscnOFiXwnUXvPpiQ2ApI3KjeRsgHEKQSYTM7xueCZ4Pz/yfTCSo8o+lk9jJUSET8vrkiShI+iHE7DtGAoP+i7hE3nLA1st6Yj6CNDBgIWpecHtPYhtUfFtRuK5NsgWMfjl0QzjWq5AOkgTCN0tFq6d+wdO1L7U+8+mDdvhfhCXHkSrDwp0JmQxFoa70SZrW/UPZOq/TQzAjg8KKMZKoN8f55oeMkn8N8qlamMLBe814tnJATmzr1HrblnJxW/abpOexGZENY2QE55pWcElXNdo5bVESOurYbJG/fCDMTVuoenaSScsHss1/LyeVSu23wKXpkWlwIKYu2qI9iDkShEDtCycI11fjnID7sfKrqQ8N6F8stl1DXdt8DUrhjErT7gOTk0gpfxj1Hm2qEb4zbaGgiJXlajVxtK8ymGqXNFCMX3yUOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3565.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(66556008)(8676002)(66476007)(2906002)(86362001)(4326008)(53546011)(36756003)(186003)(6486002)(31696002)(8936002)(5660300002)(31686004)(508600001)(38100700002)(2616005)(26005)(16576012)(110136005)(956004)(316002)(54906003)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eThNb1ZiRmZ4NHM0SnNpR2UrTnQxSnZsSDZEM2hwdFVRT2t2dmU5Um9ZaG5I?=
 =?utf-8?B?aGY2aUVkR1VTMHVWQzdHUUo0T1FlZjEwVmtKaVUzbVdVeE1qK2Q5Sm1sY3VY?=
 =?utf-8?B?dVMzU0pzRlMyNGdoYThrdDVHTk1kbWhhVnd4L0hPRVJsdWxSaDQ2TmdRQkdX?=
 =?utf-8?B?ajVVTDJwNWJlRkJMRll2aUR2U3JFZkVuUk9ac1c5V2hlZ2lNMng1S1QrL3R1?=
 =?utf-8?B?QW51OW1uc3NCTkh5dVBmWmhBQnRJbnI0V3V2eUJ3Um9WMG42TjJ5ZUFnQlA1?=
 =?utf-8?B?YnZ0V1BKdXpkQVBURm1XRFRTdlJ2UWFFVi92VmFpVExWT0Rqa25EdHUzMmxo?=
 =?utf-8?B?dlVDcUd5c1BkYWFnb1Iwa05wR1ZUamI3NGFxVlpFOHR6V1NhT25aTlRnQmsr?=
 =?utf-8?B?ZjAraHhSd1lYaktEclRqS2hlVGloSWF3TEd0cHQ4VEZuc0k4ZXNJVnIzZHJ0?=
 =?utf-8?B?QzJMTjVhMFJGaHFIWHFhMU5KQit5WWpwSXhNWlp0SnlWYVJDZEEzZG1XRVJW?=
 =?utf-8?B?ZnFZNVJ1QzlxNVZyckZ2YWYvbHpHRWdkMWgyWXpXRW04MmRWLzBZenRLN0xl?=
 =?utf-8?B?eE9EUGZRcVorcTNaWk03amRYeUFkVFJRYjVDMHFaenAzMWxpSk8xSUVmNE9D?=
 =?utf-8?B?Q3QrS1N4ZWxBYmM1RTJxNlRNVnN3SUxIbUtUN05YQkxPVGpidms2N2NGYzhO?=
 =?utf-8?B?cW9LQTZyMGE0aCt2blZCS01kd1NicThpR3hRMkR6M2pBTW8ybFBleGVEUzJW?=
 =?utf-8?B?V3dmVHNTaitVc3hiNk9JRDJENzVLTXd0dGNObHYxU08xKzgyRFVPUjE1V2xp?=
 =?utf-8?B?bTRrdTVRQzhNYzdESEl6NngxWGpVVGlNNTV4dkU2UTl2VVBEWW9pSk9BN1lO?=
 =?utf-8?B?K2RBS2pLQnpWd3RObHJUa2crNFg5NG1ZeGw4aEpkNHF5czd4bXBLTFhTTnRU?=
 =?utf-8?B?a0Jud2JNeW4yZEkvY09jK3Y2QUdVMktNZ0NrdHdwUmhJbFBOdFRaSE9EVy9v?=
 =?utf-8?B?L3FUeVhSYTIvb1hnMUthWFJBenhjZW8zaGJwdjFvL2MwNHpCY2JuTjJUTnN3?=
 =?utf-8?B?eVRTTERtWXcyTEZtaHQyb2VLNTBqVUFkWnllZXJjZ2twRTAxaUlpMCtHREta?=
 =?utf-8?B?b21WNE55alk3T3pNTjFVZmNoSFNVSWtoSVhuQTVXV2xjVG83bmorK0hhdElX?=
 =?utf-8?B?U1pRR3Y3YTBRV05HMkFoTHZuaTg3L2FQYWxpT2tEdlZKUHBsWXFZNGxMMTVD?=
 =?utf-8?B?QjhxUVI1TzNXRC9TYS82T2J0dURtL3QwcEJYeXl4QkJid3U2WmNmclpJZUVs?=
 =?utf-8?B?NDBINEhNbVBoLzhGY3JkKzM1NzUrNi8wYURndFRleXhqekRvSDVHeDlveWJr?=
 =?utf-8?B?VkYyem41UUxYY0E5cFdLU3Z6R1hOWDN2NDFyUllzM2Uxa1QydWIzY2JvVng1?=
 =?utf-8?B?bWNZZGJNMUl4RVVhR1FsbnE5Y09RRmp6YjhwaCtEbjcwVlI4eWk0aWpFMzBa?=
 =?utf-8?B?VXpRM1h0ZEhMdkRNdVR3UHp1YjM0Z1V1aU15bVZ1ZkhyYi9SK0tiM21taHNP?=
 =?utf-8?B?RlFGYXVReEZDVS80OE1EM0w0LzNLS3FJa3VvbjhHWURBRkcweWk3VFJDS2Rm?=
 =?utf-8?B?blVpS0praC9hSVRvODFaaTJ5KzRCNzh1NVgyODIyVzJZNUpVbnFEbnBlSmpI?=
 =?utf-8?B?dWRvRWQ3aW9hQXdYNWhCNXMrY3MraGRiUzUvazNqd29pZ0wvbndwNHZjSmYz?=
 =?utf-8?Q?SnrS8h2EbI5aD8nbMCJTlIRyuZ8YJY5DNfp2h5T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4f36a2-83e2-4058-39d2-08d98ca6e83c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3565.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 11:04:34.0235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVipFfDhf/RfAAaCN4DRPMfttTwiBaTn4ro4B4flawYivQ/rW8qJIxOlHTUet7NxQqJ4K2Sf5ywIs0errEMk1Q==
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
