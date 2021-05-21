Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4084938C794
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 15:14:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7F7316B9;
	Fri, 21 May 2021 15:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7F7316B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621602867;
	bh=U7cLc9wGwj9AQPpCwe2hw7nIDElT66FKww9o7istL3Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cferc6ZtLOmxEAZC7tMn+s9VX8sxS3ltogm46mz7m3afP43lFn0pMVvOimBT8d99l
	 VT/R5F6aUct3zJfEOv0zQwRc+gvflPc/4vmAr0auHDZcC73VSc2PoFEfnlg/rW+7B+
	 ln9OF1tnZMxAvm5IARwiLiQfEvrxJRBIyU1MWEe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48F4BF80259;
	Fri, 21 May 2021 15:12:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36D6FF80259; Fri, 21 May 2021 15:12:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAD86F800C1
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 15:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAD86F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="kdHZeTWC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxyCsQ2aAPKBS4cmr+0QOGUzS3Jibr+Zn+vZAAcWPSWFxS+F1Fe3isbMTUbS5l8D1qSvvQF+is4t9e1VK05VhO6sR5gKvAbZZFkEQuTazinLyUlpAg056RXRZHFkOx+H4GsmwvE5WPn/ICnwSFVH0yTCmssVOfvVRHtNg8BNOZLBD48rxMIwReRvkIM5VXOPaGJ1qXU7Akd3ILFH1KxugklZmZ+xKeYzHw1p6moek6LRHGthX+XbgHt72dkSRjifPRFKuXbl3gHl71p915saBQjGUL7PychHNXqT3CHNk1fLegjtTnQYi/Cyupw++Jy7i6V+KuOZbF05wv00Va7Log==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hm5+vh36LtbQD9DCa9+sdOGWzI2mJHsYMnwcpoEjF3U=;
 b=oA0V13c91iutrzQl2kaEzO+9kgFr+IoGqs9wBfgqWcg/izn4L0vUEAhQBYmRsCCQ6vfIo5v/kO5cVohA/SS334f1QmqPIiCNToKFWDUVTI39kKvw+fhAvNHWpBhuuziV/QWDIWAd6TMcu53MOwCJL8rxRFQSZ5eWTiqBUodOnZLmqE1OMoQDyJNmGd32rP2JSv5xz8DZMBgi1LP8VI9JlLrkAZjV+BytDPYlFmXDfPRKHl8skPK1O3dYjWCChlbBExZy3wG8CSQC97FOQMfWYesbR4iFFoSa9Jf8AhULuteaXByd5JYEes+vFvsdggM4JIoU19VGXs+GikhgVmWc3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hm5+vh36LtbQD9DCa9+sdOGWzI2mJHsYMnwcpoEjF3U=;
 b=kdHZeTWC2ngt9rFZG3ouz5JVj2i6qiMGOBcLUtD2+PaTvL0w3BWI2fC+UhK9StRxa58RydIZJRp2pWlWRQr5TVXkdRTkUrx7paSxdVUTzoHxc1AThxXiQ9PfZmuRr5W4UC5JkM5cCdPzgbnSZZjA8VUOh9MLqUFoMxdVwlBV0hmiansQO1GJSfJUuwNrlzllaBS0qJKWFWqhd6WK9KGJIu/DovjySwvVV1NyOuKyTN9WsvPtJ2kXl65Atd162UqlFPKbRKsmh+mbUX2WAvnlkuEig/gLSPO5uyYWku3mAmX1IP1hxZIQE6ZJfw+nhuGAZp66HD1HYLzZFb2R2SyyxA==
Received: from BN9PR03CA0749.namprd03.prod.outlook.com (2603:10b6:408:110::34)
 by BY5PR12MB4083.namprd12.prod.outlook.com (2603:10b6:a03:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 13:12:29 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::49) by BN9PR03CA0749.outlook.office365.com
 (2603:10b6:408:110::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Fri, 21 May 2021 13:12:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Fri, 21 May 2021 13:12:28 +0000
Received: from [10.26.49.10] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 21 May
 2021 13:12:25 +0000
Subject: Re: [PATCH v2 2/2] ASoC: tegra: Unify ASoC machine drivers
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai
 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Ion Agorria
 <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>
References: <20210520175054.28308-1-digetx@gmail.com>
 <20210520175054.28308-3-digetx@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <32171079-ed4e-1147-2272-5f11bc480c6a@nvidia.com>
Date: Fri, 21 May 2021 14:12:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520175054.28308-3-digetx@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7cc4c8a-f3a0-47f8-14d1-08d91c5a15e1
X-MS-TrafficTypeDiagnostic: BY5PR12MB4083:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4083B681A981905FF495A771D9299@BY5PR12MB4083.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RLtHtXej6MDHRYB5ctH6ZoADeO30XJwoid7CcVZu2G3RnldsroCTtNLNrCcL//80kYGzGLlAhHmnDPvCPZngNXn7qqevpT01R7DQ+kwOarc6fos/VTx+yKQ7a66ZxnGXqcYYY6U5U773ud3habmDLR6Fs8yrK9XXIEiqIk/KchA5gsOJkWW79rL4sQAW9sR8B2Yr5K2KMj+XXHH1MKHFWQt0Ac0vR4J/4+It6JpWhXwgrEwx/6ivRljaDTZL4B4SpKOT6vu3M58QaXXwYQK7sUkJPSf9nO6kcGfbhzs0uZLtutaMiLhX74b+hal7bUyo/7VI9rUll5NOXgFwLCCixWYYUvX+yeVQe2OV9hN3MWwrTIIS5aCAr/OM8mWHGaOHd/HnLppWoSgkcgj61YxNnVvQVWK+MzDOWg4QNzm4F066NqOQvQ/rn8sYo10byP/gbuiWnKfYJ0pdcWgK4NgVX0g3QRsjxMK6yG4X2GUHFxbn9U5mA6CEaNB1TX1IOMoW14JYzCYQ6+qV6UgtKS8sHZojEtXBGFbj0bmSSny0ZfwDb9mSFvJ4mI1uj94KSL5bG1QGl9ZcCEC8S8twG9yvZneG4Z2PARz9fcgJNeiHoAFOqvjs4fVb8qI0gFi6KwgpP5CFbogwqn164F3p5DGt1vtA+G0RhjrTSSYmP1bQK+4x7LXNy5cHchuvY8q3WW7B
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966006)(36840700001)(86362001)(8676002)(5660300002)(2906002)(47076005)(4326008)(70206006)(70586007)(53546011)(31686004)(82310400003)(36756003)(36860700001)(83380400001)(7416002)(31696002)(8936002)(186003)(7636003)(478600001)(54906003)(356005)(82740400003)(426003)(16576012)(36906005)(316002)(26005)(110136005)(16526019)(336012)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 13:12:28.7613 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7cc4c8a-f3a0-47f8-14d1-08d91c5a15e1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4083
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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


On 20/05/2021 18:50, Dmitry Osipenko wrote:
> Squash all machine drivers into a single-universal one. This reduces
> code duplication, eases addition of a new drivers and upgrades older
> code to a modern Linux kernel APIs.
> 
> Suggested-by: Jonathan Hunter <jonathanh@nvidia.com>
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/Kconfig              |  12 +
>  sound/soc/tegra/Makefile             |  18 +-
>  sound/soc/tegra/tegra20_ac97.c       |   1 -
>  sound/soc/tegra/tegra_alc5632.c      | 260 ----------
>  sound/soc/tegra/tegra_asoc_machine.c | 732 +++++++++++++++++++++++++++
>  sound/soc/tegra/tegra_asoc_machine.h |  45 ++
>  sound/soc/tegra/tegra_max98090.c     | 277 ----------
>  sound/soc/tegra/tegra_rt5640.c       | 223 --------
>  sound/soc/tegra/tegra_rt5677.c       | 325 ------------
>  sound/soc/tegra/tegra_sgtl5000.c     | 212 --------
>  sound/soc/tegra/tegra_wm8753.c       | 186 -------
>  sound/soc/tegra/tegra_wm8903.c       | 358 +++----------
>  sound/soc/tegra/tegra_wm9712.c       | 167 ------
>  sound/soc/tegra/trimslice.c          | 173 -------
>  14 files changed, 862 insertions(+), 2127 deletions(-)
>  delete mode 100644 sound/soc/tegra/tegra_alc5632.c
>  create mode 100644 sound/soc/tegra/tegra_asoc_machine.c
>  create mode 100644 sound/soc/tegra/tegra_asoc_machine.h
>  delete mode 100644 sound/soc/tegra/tegra_max98090.c
>  delete mode 100644 sound/soc/tegra/tegra_rt5640.c
>  delete mode 100644 sound/soc/tegra/tegra_rt5677.c
>  delete mode 100644 sound/soc/tegra/tegra_sgtl5000.c
>  delete mode 100644 sound/soc/tegra/tegra_wm8753.c
>  delete mode 100644 sound/soc/tegra/tegra_wm9712.c
>  delete mode 100644 sound/soc/tegra/trimslice.c

...

> +static unsigned int tegra_max98090_mclk_rate(unsigned int srate)
> +{

Minor comment, but I wonder if there is a better name for the above
function? This function is using a fixed rate as opposed to scaling it
with sample rate which can be common and not really specific to the
max98090 codec.


> +	unsigned int mclk;
> +
> +	switch (srate) {
> +	case 8000:
> +	case 16000:
> +	case 24000:
> +	case 32000:
> +	case 48000:
> +	case 64000:
> +	case 96000:
> +		mclk = 12288000;
> +		break;
> +	case 11025:
> +	case 22050:
> +	case 44100:
> +	case 88200:
> +		mclk = 11289600;
> +		break;
> +	default:
> +		mclk = 12000000;
> +		break;
> +	}
> +
> +	return mclk;
> +}
> +
> +unsigned int tegra_asoc_machine_mclk_rate(unsigned int srate)
> +{
> +	unsigned int mclk;
> +
> +	switch (srate) {
> +	case 64000:
> +	case 88200:
> +	case 96000:
> +		mclk = 128 * srate;
> +		break;
> +	default:
> +		mclk = 256 * srate;
> +		break;
> +	}
> +	/* FIXME: Codec only requires >= 3MHz if OSR==0 */
> +	while (mclk < 6000000)
> +		mclk *= 2;

So this appears to be specific to the wm8903 codec or at least this is
where it came from. And given that the switch statement is not complete
in terms of the sample rates (ie. only has a subset), I am wondering if
set should keep this specific to the wm8903 codec?

> +
> +	return mclk;
> +}
> +EXPORT_SYMBOL_GPL(tegra_asoc_machine_mclk_rate);> +
> +static int tegra_machine_hw_params(struct snd_pcm_substream *substream,
> +				   struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_card *card = rtd->card;
> +	struct tegra_machine *machine = snd_soc_card_get_drvdata(card);
> +	unsigned int srate = params_rate(params);
> +	unsigned int mclk = machine->asoc->mclk_rate(srate);
> +	const unsigned int clk_id = 0;
> +	int err;
> +
> +	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk);
> +	if (err < 0) {
> +		dev_err(card->dev, "Can't configure clocks: %d\n", err);
> +		return err;
> +	}
> +
> +	err = snd_soc_dai_set_sysclk(codec_dai, clk_id, mclk, SND_SOC_CLOCK_IN);

Looks like clk_id is always 0. Most likely all the clock ids passed are
0 by default but I wonder if we should not assume this in case something
changes in the future?

Cheers
Jon

-- 
nvpublic
