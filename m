Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FDE33903B
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 15:46:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D72021759;
	Fri, 12 Mar 2021 15:45:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D72021759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615560390;
	bh=X08uLNVqg48tuC6m79pxWhwp/7vZWIyFkbnNLBlEVIE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GRUXV5v6Ij8gvPIGw9wvZS9U7L2aWEJhm+94ystc4p21c99yp7P8INsnx8bdzz8u3
	 Qb9eGj3kdmIlIjfXikZoVeez1YSNFavnya85Ytp24np6JsZvWW0Rd1EUjxTayKF7yc
	 3aXT4nCF4K9SHMInEn3htUG+ye3Z+u/FrSmLnGLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46704F800BF;
	Fri, 12 Mar 2021 15:45:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B1D4F801D8; Fri, 12 Mar 2021 15:44:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09D1BF800AB
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 15:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09D1BF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="iPPe02HP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhEFVQl13f5KSbW50YhTep792wRQLvf9rTN6pWh2cotv1OS/4NiPlzw+hfKtp0FqAiL2CtemnnfLFCgTvIKKZ3ooNes3N2m2fvVxuJ3cX+Ck+C2Nmibl6wK4c84ohtlVeHtXbwK2BOuaanPrPgTQJJeekk6zYHZJI4gSLftp1j8eSeoTzThnRkjTnmXEWWp6wVdsa6Fcau7RumGFKkbsyayjVUMemGjmr/3PFkn8mMEgNsJ/JfNdeofJHM2FYMv8h7gqg+4rqofoYQaUkmSe9CaQeZ7ykv/8s7zyaFosQvYxRdEtc5K5D46rq7S3dOmB3nBtRcb35x6M+91DXaDY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHTMTOGJpBc+neMJ+SypQPpE4AKmcd26jDLZlOnnjIY=;
 b=DSw3Dju+ltSYn5v56JOz0TNrdDLxOxB1sdIijYwPF80VxY+Qy6nRd0cFyNU6N7t762eoQoFMVGxOdLwKqRu/cUfIIMT05VpC5bui571PX3Is47UnmbhWO8I4CH7VajCaoDVggt8aXDkLLGDQocVGyL56R7jb8geHiChKpDk95pdVxAZpeYr+Yt1wZpilgMDTcxW8gfNG6LmVtmPWkCutHdBrZfz0nnFsYFtH2fOV6+S5QBZ0bISLuXeZCN5QxEmxPwQWYXaQJuGADyjuELGYQbNlz8WfQP+LEAnWKM6a6CJL005vNZBhhPs5dM6JKa8M0NdMQU6sdYKvgW88PBOybw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=suse.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHTMTOGJpBc+neMJ+SypQPpE4AKmcd26jDLZlOnnjIY=;
 b=iPPe02HP08NfxAbRDMs4wert7Ki4+ZGYWQf+joKqIA61HBPlKxdpJ4zDMu1M7PDTcc3aEtj83jyG6CP4LSnO4jgZfUf2guK6WPn7XiLBhXKWFnBZZyWT++lqq6m7jg6cTxiMQ46ptW3OKCa0f7i9TErPOrVmLLKbfx1EhVuB4r3jothc1et3n/IyRaWSS7GVvuI+aBDO37b3cXW+jlvTg5XOBD7V91OLG3gyqwhHLkzrY4YtAilEQLT6FW+1paNJdtrEfQVulr5EsCgJgvCxD37RAhy0cWzIfxLKZ9YrpezJ5sDmd+BTtp/g8jxtZPQNgxYXR1z/TSzGmDmDeEAVow==
Received: from MW4PR03CA0018.namprd03.prod.outlook.com (2603:10b6:303:8f::23)
 by BN6PR12MB1379.namprd12.prod.outlook.com (2603:10b6:404:20::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 14:44:40 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::47) by MW4PR03CA0018.outlook.office365.com
 (2603:10b6:303:8f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 14:44:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 14:44:39 +0000
Received: from [10.26.49.11] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Mar
 2021 14:44:37 +0000
Subject: Re: [PATCH] ASoC: soc-core: fix DMI handling
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20210310193928.108850-1-pierre-louis.bossart@linux.intel.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <2be82024-0a0b-56d4-ec3b-2faa284df8c7@nvidia.com>
Date: Fri, 12 Mar 2021 14:44:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210310193928.108850-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ddb204a-e8ff-4573-44c9-08d8e5655db7
X-MS-TrafficTypeDiagnostic: BN6PR12MB1379:
X-Microsoft-Antispam-PRVS: <BN6PR12MB13794D1A69CE68E45259A0FDD96F9@BN6PR12MB1379.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2bJMwXF8aXwzWMjtjrYOA7ReduxTJv0fEJ/yz8nJshOa3ryDqylc/bhrgNlSB1CpfV/0qbvtPuINYUmPEujt+rLGorWoOUyF50eS+Qj4QOmI88OyJjA+IaceYjnSDqvLWqcj3QckDNgV55EXKAih0XbY1OSrENpNSvDy/0FfIVtB0J78ORSFt4gSudpaRRyH50tVynjpaneSI+BkS2/1S+8yWNCVeUxjuKmmlntdCT2iUKSGl/wiX1e2HrhlcBRMmitWEt/UrwBIwNPf57p+fVfUCv8WA8LV43U5zbKXvcDHf45OoQa2RYECIFijoR6yUyIHTEa4oICDeELTi+nEHEkpryQ8ukwkH70WWFXaUp6Nex0+OtHSxaOPt/CpsOcJRhHcNjCtDCrxp7GYuPEdHEpc0go6YRtxXEobylVxUzqUfDidLBXQoiRV/hCKQEkxDxDDOgzpS3DRLLuACfaQ5xBiiTTLMY9TJWJFpiJhaSZtw9vxljVbCeW1e/RGoPItxtOoTzuBFxr5QTF8t4XGasM7JXk2l0BI9xWQnRr3A53rlYfq0elNuEWe3O2P4+f3q46V0TdLCoIQ5bYCW36dcz/r2mhxyaf4GEtJNpqLuFpyfhBXfHTNRzm6foD47FL+KVtFHThWJkM3UgQx9IrN4DC6AdMums7cuJSx+YpHVf1qOhB55mIiRr/vRmxUilRgsjjhOWcQq4x0rqrFW83T2Q==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(36840700001)(46966006)(8936002)(36860700001)(110136005)(70586007)(8676002)(16526019)(82740400003)(186003)(26005)(2616005)(70206006)(7636003)(4326008)(336012)(54906003)(47076005)(478600001)(36906005)(86362001)(36756003)(316002)(53546011)(16576012)(83380400001)(31686004)(426003)(2906002)(82310400003)(356005)(5660300002)(31696002)(34020700004)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 14:44:39.8615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddb204a-e8ff-4573-44c9-08d8e5655db7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1379
Cc: Jean Delvare <jdelvare@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 tiwai@suse.de, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 broonie@kernel.org
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


On 10/03/2021 19:39, Pierre-Louis Bossart wrote:
> When DMI information is not present, trying to assign the card long
> name results in the following warning.
> 
> WARNING KERN tegra-audio-graph-card sound: ASoC: no DMI vendor name!
> 
> The initial solution suggested was to test if the card device is an
> ACPI one. This causes a regression visible to userspace on all Intel
> platforms, with UCM unable to load card profiles based on DMI
> information: the card devices are not necessarily ACPI ones, e.g. when
> the parent creates platform devices on Intel devices.
> 
> To fix this problem, this patch exports the existing dmi_available
> variable and tests it in the ASoC core.
> 
> Fixes: c014170408bc ("ASoC: soc-core: Prevent warning if no DMI table is present")
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/firmware/dmi_scan.c | 1 +
>  sound/soc/soc-core.c        | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> index d51ca0428bb8..f191a1f901ac 100644
> --- a/drivers/firmware/dmi_scan.c
> +++ b/drivers/firmware/dmi_scan.c
> @@ -166,6 +166,7 @@ static int __init dmi_checksum(const u8 *buf, u8 len)
>  static const char *dmi_ident[DMI_STRING_MAX];
>  static LIST_HEAD(dmi_devices);
>  int dmi_available;
> +EXPORT_SYMBOL_GPL(dmi_available);
>  
>  /*
>   *	Save a DMI string
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 16ba54eb8164..c7e4600b2dd4 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1574,7 +1574,7 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
>  	if (card->long_name)
>  		return 0; /* long name already set by driver or from DMI */
>  
> -	if (!is_acpi_device_node(card->dev->fwnode))
> +	if (!dmi_available)
>  		return 0;
>  
>  	/* make up dmi long name as: vendor-product-version-board */
> 


Thanks for fixing.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
