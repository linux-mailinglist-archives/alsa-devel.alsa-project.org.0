Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1356890809
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Mar 2024 19:12:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83D0A2CA5;
	Thu, 28 Mar 2024 19:12:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83D0A2CA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711649557;
	bh=8ERlPwQRmltkadYzho+Rro39TG8es6t+TgCTY0LtOY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J79TzkuLCTfZtdXvvFyq88C4RccFQsmruh6myLsOPRPfiBaDqD0tvJPm4VkVyFcTu
	 ep1S5tSKYZSbsc2Jx5eOMDstAfzfN4XNBsdzGbMV4oYFDzd/u7pETBzlR5OrTvtpc8
	 Z8cYGvF4EtB3hMWZbGF+bi/ejERgrzVdw3NBUU5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47998F805AB; Thu, 28 Mar 2024 19:12:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B74D8F805A1;
	Thu, 28 Mar 2024 19:12:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98744F8025F; Thu, 28 Mar 2024 19:12:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 864FDF801EB
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 19:11:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 864FDF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GpLVOni3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19F9E617C9;
	Thu, 28 Mar 2024 18:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7525FC433C7;
	Thu, 28 Mar 2024 18:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711649510;
	bh=8ERlPwQRmltkadYzho+Rro39TG8es6t+TgCTY0LtOY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GpLVOni31qJBk2L7atKQfrCiSYuR67xOjIwCmPeg0B1vT1WPl4D+M6ICz8XoV4YD+
	 MCrreMSwGr+6u8xWzxQefYw+DNczGXnI1vpaueOnYaA1+kkXEx0M3aUQ+B1Kj44js8
	 3AaWMo5G/LAIWZGdiX4Y//OKXgbZO6vnmBz3UJqbNNxvRqOnYFYajNiWsWuQcNUNNE
	 zOcEpUZMH1TVeWdSnkOOCdQG1zyZK0s81fcJpC5oYU2NdBbptGXTbWVR4oXiM8H/Dr
	 NJ7HA6qv7qtBTyx7CDm6yWBNRQya2fC4BW74QLgsCRVbeNUp6Iq9xwgOUuleIwIvPA
	 J+6/jMRG4qrTA==
Date: Thu, 28 Mar 2024 23:41:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Mastan Katragadda <Mastan.Katragadda@amd.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] soundwire: amd: fix for wake interrupt handling for
 clockstop mode
Message-ID: <ZgWy4M8nr7IFqpoa@matsya>
References: <20240327063143.2266464-1-Vijendar.Mukunda@amd.com>
 <20240327063143.2266464-2-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327063143.2266464-2-Vijendar.Mukunda@amd.com>
Message-ID-Hash: RCX7YPNWBEMYXJH75IWHXECA4I7USYFE
X-Message-ID-Hash: RCX7YPNWBEMYXJH75IWHXECA4I7USYFE
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCX7YPNWBEMYXJH75IWHXECA4I7USYFE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27-03-24, 12:01, Vijendar Mukunda wrote:
> When SoundWire Wake interrupt is enabled along with SoundWire Wake
> enable register, SoundWire wake interrupt will be reported
> when SoundWire manager is in D3 state and ACP is in D3 state.
> 
> When SoundWire Wake interrupt is reported, it will invoke runtime
> resume of the SoundWire manager device.
> 
> In case of system level suspend, for ClockStop Mode SoundWire Wake
> interrupt should be disabled.
> It should be enabled only for runtime suspend scenario.
> Change wake interrupt enable/disable sequence for ClockStop Mode in
> system level suspend and runtime suspend sceanrio.
> 
> Fixes: 9cf1efc5ed2d ("soundwire: amd: add pm_prepare callback and pm ops support")
> 

no empty line b/w fixes and s-o-b line please

I have fixed it up while applying
Also, fixes should be first patch followed by other changes...

> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c | 15 +++++++++++++++
>  drivers/soundwire/amd_manager.h |  3 ++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 1066d87aa011..20d94bcfc9b4 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -129,6 +129,19 @@ static void amd_sdw_set_frameshape(struct amd_sdw_manager *amd_manager)
>  	writel(frame_size, amd_manager->mmio + ACP_SW_FRAMESIZE);
>  }
>  
> +static void amd_sdw_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
> +{
> +	u32 wake_ctrl;
> +
> +	wake_ctrl = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
> +	if (enable)
> +		wake_ctrl |= AMD_SDW_WAKE_INTR_MASK;
> +	else
> +		wake_ctrl &= ~AMD_SDW_WAKE_INTR_MASK;
> +
> +	writel(wake_ctrl, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
> +}
> +
>  static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_msg *msg,
>  				  int cmd_offset)
>  {
> @@ -1094,6 +1107,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
>  	}
>  
>  	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
> +		amd_sdw_wake_enable(amd_manager, false);
>  		return amd_sdw_clock_stop(amd_manager);
>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
>  		/*
> @@ -1120,6 +1134,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
>  		return 0;
>  	}
>  	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
> +		amd_sdw_wake_enable(amd_manager, true);
>  		return amd_sdw_clock_stop(amd_manager);
>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
>  		ret = amd_sdw_clock_stop(amd_manager);
> diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
> index 418b679e0b1a..707065468e05 100644
> --- a/drivers/soundwire/amd_manager.h
> +++ b/drivers/soundwire/amd_manager.h
> @@ -152,7 +152,7 @@
>  #define AMD_SDW0_EXT_INTR_MASK		0x200000
>  #define AMD_SDW1_EXT_INTR_MASK		4
>  #define AMD_SDW_IRQ_MASK_0TO7		0x77777777
> -#define AMD_SDW_IRQ_MASK_8TO11		0x000d7777
> +#define AMD_SDW_IRQ_MASK_8TO11		0x000c7777
>  #define AMD_SDW_IRQ_ERROR_MASK		0xff
>  #define AMD_SDW_MAX_FREQ_NUM		1
>  #define AMD_SDW0_MAX_TX_PORTS		3
> @@ -190,6 +190,7 @@
>  #define AMD_SDW_CLK_RESUME_REQ				2
>  #define AMD_SDW_CLK_RESUME_DONE				3
>  #define AMD_SDW_WAKE_STAT_MASK				BIT(16)
> +#define AMD_SDW_WAKE_INTR_MASK				BIT(16)
>  
>  static u32 amd_sdw_freq_tbl[AMD_SDW_MAX_FREQ_NUM] = {
>  	AMD_SDW_DEFAULT_CLK_FREQ,
> -- 
> 2.34.1

-- 
~Vinod
