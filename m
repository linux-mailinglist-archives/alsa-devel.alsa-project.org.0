Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4DA81BC39
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 17:44:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16D00825;
	Thu, 21 Dec 2023 17:44:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16D00825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703177070;
	bh=HMdNywSAZfSjSugR4FE+3Y2J7vabtmdpKRNrrpSocdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dqmBTrMs5tfVg8KRdzYKe7soMhepLQAbHH50mt/x/DSc5lAYyCGW2MgbqXgMr85PC
	 lV6JdvBO8Dou3V/Q5K21WwWxRUMA8vSahkx2FiGnkMlAL1bw1/1kt3FzDl8lK71voT
	 3IJaCMcto40SzajFFsymlX6z0irsVeXZ3NTctMXY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9888CF8055A; Thu, 21 Dec 2023 17:43:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B44CF80570;
	Thu, 21 Dec 2023 17:43:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0A85F80124; Thu, 21 Dec 2023 17:38:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9926DF800D2
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 17:38:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9926DF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B3VG7w5b
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDCD261A09;
	Thu, 21 Dec 2023 16:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E64C433C8;
	Thu, 21 Dec 2023 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703176725;
	bh=HMdNywSAZfSjSugR4FE+3Y2J7vabtmdpKRNrrpSocdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B3VG7w5bBN2UShWNRNdDg2SO7lXblJ1jRLHQpVLu0gL06rWJ5pvDgZOr3ba3kr/75
	 /7MsabqFrC3XZKGEoDCoqEhDNfq28Gxk98KviVTvT9LUq+xBY91nLYNZ9CxvfToAp2
	 UBzSO15X/MjTIThzAUKWuskpSoBX7xawXY2OyXusVSL5rtx1yfGlg2aScWB+GNG0li
	 7iQ9bylvPVAIVEZM7sYz1ANO1sBzNWJo49Mwfm+zx44w6q2rtOWgfd4mvVawESZF7I
	 Bmd3nWAWbT49ki+ZBZKBaLrJt6BEU90yUxAb6zrhZ/jTeRwZgyej/ul/HW2GXmeoKU
	 KKP3xo+o0/Cqg==
Date: Thu, 21 Dec 2023 22:08:41 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	pierre-louis.bossart@linux.intel.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/12] drivers: soundwire: refactor soundwire pads enable
Message-ID: <ZYRqEbVADgU4fNtB@matsya>
References: <20231221073558.3181911-1-Vijendar.Mukunda@amd.com>
 <20231221073558.3181911-5-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221073558.3181911-5-Vijendar.Mukunda@amd.com>
Message-ID-Hash: GKJSUFDUDHIPA6DH7ZW4JD4JXW64OML7
X-Message-ID-Hash: GKJSUFDUDHIPA6DH7ZW4JD4JXW64OML7
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21-12-23, 13:05, Vijendar Mukunda wrote:
> As sdw pads enable sequence is executed only once, invoke it
> from probe sequence.
> 
> Program required pads for both manager instances
> based on link_mask during probe sequence. This will avoid
> acquiring mutex lock.

something wrong with your editor to have this formatting, you can use
upto 80 chars here!


> Remove unnecessary delay after programming ACP_SW_PAD_KEEPER_EN
> register.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_init.c    | 45 +++++++++++++++++++++++++++++++++
>  drivers/soundwire/amd_manager.c | 18 -------------
>  2 files changed, 45 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
> index 5c9569d9ad01..b3b3c7266384 100644
> --- a/drivers/soundwire/amd_init.c
> +++ b/drivers/soundwire/amd_init.c
> @@ -15,6 +15,47 @@
>  
>  #include "amd_init.h"
>  
> +#define ACP_PAD_PULLDOWN_CTRL				0x0001448
> +#define ACP_SW_PAD_KEEPER_EN				0x0001454
> +#define AMD_SDW_PAD_PULLDOWN_CTRL_ENABLE_MASK		0x7f9a
> +#define AMD_SDW0_PAD_PULLDOWN_CTRL_ENABLE_MASK		0x7f9f
> +#define AMD_SDW1_PAD_PULLDOWN_CTRL_ENABLE_MASK		0x7ffa
> +#define AMD_SDW0_PAD_EN_MASK				1
> +#define AMD_SDW1_PAD_EN_MASK				0x10
> +#define AMD_SDW_PAD_EN_MASK	(AMD_SDW0_PAD_EN_MASK | AMD_SDW1_PAD_EN_MASK)
> +
> +static int amd_enable_sdw_pads(void __iomem *mmio, u32 link_mask, struct device *dev)
> +{
> +	u32 val;
> +	u32 pad_keeper_en_mask, pad_pulldown_ctrl_mask;
> +
> +	switch (link_mask) {
> +	case 1:
> +		pad_keeper_en_mask = AMD_SDW0_PAD_EN_MASK;
> +		pad_pulldown_ctrl_mask = AMD_SDW0_PAD_PULLDOWN_CTRL_ENABLE_MASK;
> +		break;
> +	case 2:
> +		pad_keeper_en_mask = AMD_SDW1_PAD_EN_MASK;
> +		pad_pulldown_ctrl_mask = AMD_SDW1_PAD_PULLDOWN_CTRL_ENABLE_MASK;
> +		break;
> +	case 3:
> +		pad_keeper_en_mask = AMD_SDW_PAD_EN_MASK;
> +		pad_pulldown_ctrl_mask = AMD_SDW_PAD_PULLDOWN_CTRL_ENABLE_MASK;
> +		break;
> +	default:
> +		dev_err(dev, "No SDW Links are enabled\n");
> +		return -ENODEV;
> +	}
> +
> +	val = readl(mmio + ACP_SW_PAD_KEEPER_EN);
> +	val |= pad_keeper_en_mask;
> +	writel(val, mmio + ACP_SW_PAD_KEEPER_EN);
> +	val = readl(mmio + ACP_PAD_PULLDOWN_CTRL);
> +	val &= pad_pulldown_ctrl_mask;
> +	writel(val, mmio + ACP_PAD_PULLDOWN_CTRL);

updatel() local macro?

> +	return 0;
> +}
> +
>  static int sdw_amd_cleanup(struct sdw_amd_ctx *ctx)
>  {
>  	int i;
> @@ -37,6 +78,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
>  	struct platform_device_info pdevinfo[2];
>  	u32 link_mask;
>  	int count, index;
> +	int ret;
>  
>  	if (!res)
>  		return NULL;
> @@ -50,6 +92,9 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
>  
>  	count = res->count;
>  	dev_dbg(&adev->dev, "Creating %d SDW Link devices\n", count);
> +	ret = amd_enable_sdw_pads(res->mmio_base, res->link_mask, res->parent);
> +	if (ret)
> +		return NULL;
>  
>  	/*
>  	 * we need to alloc/free memory manually and can't use devm:
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index c27b0b0f33a6..1427cccfc309 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -26,23 +26,6 @@
>  
>  #define to_amd_sdw(b)	container_of(b, struct amd_sdw_manager, bus)
>  
> -static void amd_enable_sdw_pads(struct amd_sdw_manager *amd_manager)
> -{
> -	u32 sw_pad_pulldown_val;
> -	u32 val;
> -
> -	mutex_lock(amd_manager->acp_sdw_lock);
> -	val = readl(amd_manager->acp_mmio + ACP_SW_PAD_KEEPER_EN);
> -	val |= amd_manager->reg_mask->sw_pad_enable_mask;
> -	writel(val, amd_manager->acp_mmio + ACP_SW_PAD_KEEPER_EN);
> -	usleep_range(1000, 1500);
> -
> -	sw_pad_pulldown_val = readl(amd_manager->acp_mmio + ACP_PAD_PULLDOWN_CTRL);
> -	sw_pad_pulldown_val &= amd_manager->reg_mask->sw_pad_pulldown_mask;
> -	writel(sw_pad_pulldown_val, amd_manager->acp_mmio + ACP_PAD_PULLDOWN_CTRL);
> -	mutex_unlock(amd_manager->acp_sdw_lock);

so the code is copied from a GPL declared file to now and GPL + BSD one!
Have you had lawyers look into this... why change one file license ?

> -}
> -
>  static int amd_init_sdw_manager(struct amd_sdw_manager *amd_manager)
>  {
>  	u32 val;
> @@ -872,7 +855,6 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
>  
>  	prop = &amd_manager->bus.prop;
>  	if (!prop->hw_disabled) {
> -		amd_enable_sdw_pads(amd_manager);
>  		ret = amd_init_sdw_manager(amd_manager);
>  		if (ret)
>  			return ret;
> -- 
> 2.34.1

-- 
~Vinod
