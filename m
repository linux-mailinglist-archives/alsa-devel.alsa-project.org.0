Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DC13622C4
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 16:51:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C538316A8;
	Fri, 16 Apr 2021 16:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C538316A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618584708;
	bh=ZcsBlhMFX4F441jtOJvXghvus0KNNJXUAdt3JiwXbkM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UyDhUumTMep1JxUTBPhS1VykyiMVyfA560RGkJw4E6L9Pd2J2/CJAju/gKkOKsrBU
	 tOzsChH8nrIcYGvr3LHnpemjqNrxw+IQjli+ziA67C0oSqJ+AbIAMUlDkVz31Tner7
	 B2umkEAKLEyIF+5PAGYag4T/qQb0ofAztOKZgW64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 740FAF80277;
	Fri, 16 Apr 2021 16:50:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FE1AF80273; Fri, 16 Apr 2021 16:50:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2049.outbound.protection.outlook.com [40.107.100.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E1B0F80269
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 16:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E1B0F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="Govuf1c6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JixC2OvW/KoRfT5/y1jYi3b2PA/Te+NkvpeJR2ksBHX9Wn9IIu0Bzrz5aC4Oj68KDWuETu/eEpBRSpo6bOYypvJb8zBZTghwmDmBlhJ9kyLtkz7mq/1K64AVoUBMskiL8Qx1BggHI5Zv2k5il8H93M81oE2YxhOVnX790W35IApuo0KIwcx3BzMMjXjFeMTGI2WY2k7ulf9W0DuyMhvEbbUrifLUcdj0WN4n6TSVi72D3aStRnYH27KAu3tPM+n1KU02kgDZTVfd0bWPD6xCgYYOCiO063ZsOyaG0MyENlRz7/KTfAL/FasxZSIsaZAaE4rvA/jdzUAvp5K0J+swAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iOdqsjGsURdeQcor+ksHVoZkLgBiedOzOuPuCRqq3Q=;
 b=hBvCK1iLK3ZFqjtKSLoQxPxpD4QTfvxPLbNR0KZVQs0LF/U3+PiK8O4qrjpt9fpZwJiYVjxBne+gZdQgprsBLCCRaQHPgdC7jHMkpqdeLTEIVYJIYre9MRVM7kFZ0L0OD43ehaI5fTq7iL3KtWAr/PIRoGoE22bgs6S4jOYutUB5UORQinWKwYEY2fiKZqQ+538ZGAQys+A9rU3oDwiU04o2Lz3cj/ovvXHknhfgZLOkwO+BgB7/k5IXeVlzn5nUZIc17oGFQAsC3bI2j6aC6mgAwJpehSdS4ajux3G8Y2ayxP2obxPKAAGZwiryi0TYQjq05Gr2wnQG0KGNiecxRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iOdqsjGsURdeQcor+ksHVoZkLgBiedOzOuPuCRqq3Q=;
 b=Govuf1c6rGbydbTJFNZH5joHDsaYWCCZI/5bYLUp9SARnNH/Rt5Rqj2w6n6pt9jBPGDLmGREBKPemcoF8f+OweNezphRt6UVNtr0+Npb0ZMnNv7RUH48QFiZlK525VBGrsC35gEqpDCuIHIQIXd3SiOff/aNydjslrqYxBIq3r05F+OPYNmjh9tISge/ThxnwVYgbMZ0B0MScBWqXQ1cVh7UFj0XhfP+ZSMYE7qoZhv+RxXgRn4DF6mE3MUIJSaPlMcQncLoXtdI0SFSiCAOocAmjGgo64KQEwCYTMO+xDV5BjihF4/OefEfbkLqQ9whKT1+in7qQotSOHseT1bVtw==
Received: from BN9PR03CA0218.namprd03.prod.outlook.com (2603:10b6:408:f8::13)
 by CH2PR12MB4264.namprd12.prod.outlook.com (2603:10b6:610:a4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 14:50:19 +0000
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f8::4) by BN9PR03CA0218.outlook.office365.com
 (2603:10b6:408:f8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Fri, 16 Apr 2021 14:50:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT019.mail.protection.outlook.com (10.13.176.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 14:50:18 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Apr
 2021 07:50:18 -0700
Received: from [10.26.49.10] (172.20.145.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Apr
 2021 14:50:16 +0000
Subject: Re: [PATCH 2/2] ASoC: simple-card-utils: Increase maximum number of
 links to 128
To: Thierry Reding <thierry.reding@gmail.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <20210416071147.2149109-1-thierry.reding@gmail.com>
 <20210416071147.2149109-2-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <632707a3-a595-13c5-08fe-c0353b1c0c79@nvidia.com>
Date: Fri, 16 Apr 2021 15:50:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416071147.2149109-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13678a7c-d891-413d-a09c-08d900e6f445
X-MS-TrafficTypeDiagnostic: CH2PR12MB4264:
X-Microsoft-Antispam-PRVS: <CH2PR12MB42649D599325324B3BA46C2CD94C9@CH2PR12MB4264.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LDBRt6cNSXoQcScJw7perHclPCxHWlVAuzkB9nm4bvkUThB917qxPQJ/9I1VxeiEBB+//0BO5mCLu47bnBvS7NPTE5IWqFpzReBPiqq5Kjt+E4yu056poKIysxbkn0RKj0pmzsEXNypPxHiSihYhW40NIzwsCFvQJG5sy1VDtyI1VSUH/Uozf0zEYfVBnQ6dzXZTSm0zqdHsjoGWHdX7LbpTxvoVsGVwlWln2LT1qrow8lk8fXsVrplKkNeVP8hrfOlLoTJUn1pqG40iZopk1BsJQupMaItVSEuxHWyHpW7xxjJZnCTJMXTOuYzyTUOtwRt3tH5HYaA1hvP3UJBWNGD40YQSwj8jZBtHlNpqPLBSR+ArSOPz901+nfJU/oQ24EzvZ6z4G82PYtSzIQUuRoPi8anse46XhMJUYLxWI3gHvigT7rK625rTyoF6TgArw92AG2yL6HyjqcsXOfdLGZWoCIJITn8RmgrydTmdTv7GPRyAjiWkpELjgUgdYgjRRdVB5nNaLz2cm0u68RBx22v2UeLbBpigskHOfRwmmv4iZJAxCHTCXn3TRrwblXpuyCEkt/ZGgXf9sa5s0CtuNBHoPh09e+t6SqjbGO9MrueIem96k0A2ZXmpqGtrC2UTNfB9jcGcN1D/bwrnrWPYaJv1Uj/ZnEo6mW6p/9plHcVPCPKUlZo1I3+zvb7xVMNV
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(36840700001)(46966006)(426003)(47076005)(8936002)(36756003)(36860700001)(70206006)(2616005)(8676002)(2906002)(31686004)(336012)(186003)(16526019)(26005)(110136005)(7636003)(356005)(82310400003)(5660300002)(16576012)(82740400003)(83380400001)(86362001)(53546011)(31696002)(70586007)(4326008)(54906003)(316002)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 14:50:18.8478 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13678a7c-d891-413d-a09c-08d900e6f445
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4264
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>
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


On 16/04/2021 08:11, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> On Tegra186 and later, the number of links can go up to 72, so bump the
> maximum number of links to the next power of two (128).
> 
> Fixes: f2138aed231c ("ASoC: simple-card-utils: enable flexible CPU/Codec/Platform")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  include/sound/simple_card_utils.h    | 4 +++-
>  sound/soc/generic/audio-graph-card.c | 4 ++--
>  sound/soc/generic/simple-card.c      | 4 ++--
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
> index fac3b832d982..e318a2d4ac44 100644
> --- a/include/sound/simple_card_utils.h
> +++ b/include/sound/simple_card_utils.h
> @@ -115,10 +115,12 @@ struct asoc_simple_priv {
>  		     ((codec) = simple_props_to_dai_codec(props, i));	\
>  	     (i)++)
>  
> +#define SNDRV_MAX_LINKS 128
> +
>  struct link_info {
>  	int link; /* number of link */
>  	int cpu;  /* turn for CPU / Codec */
> -	struct prop_nums num[SNDRV_MINOR_DEVICES];
> +	struct prop_nums num[SNDRV_MAX_LINKS];
>  };
>  
>  int asoc_simple_parse_daifmt(struct device *dev,
> diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
> index 2401212281c2..d6d90285967c 100644
> --- a/sound/soc/generic/audio-graph-card.c
> +++ b/sound/soc/generic/audio-graph-card.c
> @@ -616,7 +616,7 @@ static int graph_count_noml(struct asoc_simple_priv *priv,
>  {
>  	struct device *dev = simple_priv_to_dev(priv);
>  
> -	if (li->link >= SNDRV_MINOR_DEVICES) {
> +	if (li->link >= SNDRV_MAX_LINKS) {
>  		dev_err(dev, "too many links\n");
>  		return -EINVAL;
>  	}
> @@ -639,7 +639,7 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
>  {
>  	struct device *dev = simple_priv_to_dev(priv);
>  
> -	if (li->link >= SNDRV_MINOR_DEVICES) {
> +	if (li->link >= SNDRV_MAX_LINKS) {
>  		dev_err(dev, "too many links\n");
>  		return -EINVAL;
>  	}
> diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
> index 1d1c4309b582..59b41019c65f 100644
> --- a/sound/soc/generic/simple-card.c
> +++ b/sound/soc/generic/simple-card.c
> @@ -484,7 +484,7 @@ static int simple_count_noml(struct asoc_simple_priv *priv,
>  			     struct device_node *codec,
>  			     struct link_info *li, bool is_top)
>  {
> -	if (li->link >= SNDRV_MINOR_DEVICES) {
> +	if (li->link >= SNDRV_MAX_LINKS) {
>  		struct device *dev = simple_priv_to_dev(priv);
>  
>  		dev_err(dev, "too many links\n");
> @@ -505,7 +505,7 @@ static int simple_count_dpcm(struct asoc_simple_priv *priv,
>  			     struct device_node *codec,
>  			     struct link_info *li, bool is_top)
>  {
> -	if (li->link >= SNDRV_MINOR_DEVICES) {
> +	if (li->link >= SNDRV_MAX_LINKS) {
>  		struct device *dev = simple_priv_to_dev(priv);
>  
>  		dev_err(dev, "too many links\n");
> 

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon
-- 
nvpublic
