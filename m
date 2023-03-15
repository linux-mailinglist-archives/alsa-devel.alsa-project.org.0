Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 013176BACDF
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 11:00:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53B1512D5;
	Wed, 15 Mar 2023 10:59:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53B1512D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678874428;
	bh=Zt8Fn9RBg9zUIlT1Qoxfcb78d/GvRsgfwThplyX0Sl4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sl6UBHSmToW6TQ1kD0dNYgaRIIh6lqqVfrJZB5yafYlW23YefBoTFbw6bVJ0ezfiy
	 x95WEpIi176q24KB1KqkxbANixRWe6Op02foUHvmOicF7k3Kxh9PVfn7nSCErsYD3S
	 59OjLJ2chH6Jjk2ikjdVZllvHJcnRqZd5dt2RIk4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE88DF804B1;
	Wed, 15 Mar 2023 10:59:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFD0AF804FE; Wed, 15 Mar 2023 10:59:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71B95F80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 10:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71B95F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E3rP+sch
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 92479B81DBA;
	Wed, 15 Mar 2023 09:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7DEC4339B;
	Wed, 15 Mar 2023 09:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678874361;
	bh=Zt8Fn9RBg9zUIlT1Qoxfcb78d/GvRsgfwThplyX0Sl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3rP+schZnaTP0z6SlDq1AMfSjQOPFtrXWyCDEPa8n1gsgedEbDcoPwyeLby9jKOL
	 vVZvl0NeHtLFL6yudfeR07WuK+f78qodhBF1wJK9IwEg7PLfLvl49mZCeD8j2KuNg+
	 1c4wrvvGJC0BfImQZAqZ2ItB/tG7Oj4goZMD60L7llGlFIF24wQFDFnsOJ8Mw4SI21
	 rQX03h0b3Lcrn8rezHT2kxImgyngXmAmBR0Xgsh9iNNk7m3dGnmbw1Vn+FBB3IxCtc
	 ulvypGvOQOtXqdYQUFmH0ox48zNNjfa5rLp5c6A3pQTgd9N1nRIMQIS61OXeIphfwq
	 ZeEPa+zLUWX9A==
Date: Wed, 15 Mar 2023 15:29:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V6 4/8] soundwire: amd: enable build for AMD SoundWire
 manager driver
Message-ID: <ZBGW9ThXgcT0tIui@matsya>
References: <20230307133135.545952-1-Vijendar.Mukunda@amd.com>
 <20230307133135.545952-5-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307133135.545952-5-Vijendar.Mukunda@amd.com>
Message-ID-Hash: RAVOZX6DF3GVHOLID63GSN4KH7MOYM5U
X-Message-ID-Hash: RAVOZX6DF3GVHOLID63GSN4KH7MOYM5U
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, amadeuszx.slawinski@linux.intel.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 claudiu.beznea@microchip.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RAVOZX6DF3GVHOLID63GSN4KH7MOYM5U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07-03-23, 19:01, Vijendar Mukunda wrote:
> Enable build for SoundWire manager driver for AMD platforms.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Link: https://lore.kernel.org/lkml/20230220100418.76754-5-Vijendar.Mukunda@amd.com
> ---
>  drivers/soundwire/Kconfig  | 10 ++++++++++
>  drivers/soundwire/Makefile |  4 ++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> index 2b7795233282..983afe3570b2 100644
> --- a/drivers/soundwire/Kconfig
> +++ b/drivers/soundwire/Kconfig
> @@ -46,4 +46,14 @@ config SOUNDWIRE_QCOM
>  config SOUNDWIRE_GENERIC_ALLOCATION
>  	tristate
>  
> +config SOUNDWIRE_AMD
> +	tristate "AMD SoundWire Manager driver"

Alphabetically sorted please

> +	select SOUNDWIRE_GENERIC_ALLOCATION
> +	depends on ACPI && SND_SOC
> +	help
> +	  SoundWire AMD Manager driver.
> +	  If you have an AMD platform which has a SoundWire Manager then
> +	  enable this config option to get the SoundWire support for that
> +	  device.
> +
>  endif
> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> index ca97414ada70..5956229d3eb3 100644
> --- a/drivers/soundwire/Makefile
> +++ b/drivers/soundwire/Makefile
> @@ -26,3 +26,7 @@ obj-$(CONFIG_SOUNDWIRE_INTEL) += soundwire-intel.o
>  #Qualcomm driver
>  soundwire-qcom-y :=	qcom.o
>  obj-$(CONFIG_SOUNDWIRE_QCOM) += soundwire-qcom.o
> +
> +#AMD driver
> +soundwire-amd-y :=	amd_manager.o
> +obj-$(CONFIG_SOUNDWIRE_AMD) += soundwire-amd.o

here as well

> -- 
> 2.34.1

-- 
~Vinod
