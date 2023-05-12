Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 491B7700ACB
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 16:55:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B9271EC;
	Fri, 12 May 2023 16:54:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B9271EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683903325;
	bh=6saWosouMLDzYlSpYW/bFTK6PyfiECPlNWIHcYbRx5Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S1xgPY8XxS4+NKuwnXiy0oWHXgO0eM+Hzl7Q3Kd6oKu9AMBTaSA8XueMJW8Y5nnWQ
	 9Ikr50fkv8zyag4Ur/dsp64m2j+dRkdkWG16EAdGqoYhq1rHFKsRvUyCc78EIaiZiQ
	 a4ku+rvCsOZEjXfcObheQ2Zd9ZyXGR5lDMf0tSBo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22474F80549; Fri, 12 May 2023 16:54:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFFACF8014C;
	Fri, 12 May 2023 16:54:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9517AF80534; Fri, 12 May 2023 16:54:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8F01F8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 16:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8F01F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PUVj7dka
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683903265; x=1715439265;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6saWosouMLDzYlSpYW/bFTK6PyfiECPlNWIHcYbRx5Q=;
  b=PUVj7dkabwNFDJa4MtA/MeXwJcHnuL/TM11zQt5rZ0ua4HHQdDL6nqCy
   c6AlWZEjnnlCmU9r6RIZSgV97fcqPVYmaxOp5ixVnzvjcUSuBuZkV885N
   n5EE5fSeiq4cWr2jXf1c5ZHWF2tD/2KNpYowMeo/S3IAAvjYU3ttINPL1
   xnvG4YGwRxXVPqUlcgLPzVwUdbdmyPCFJnJsQOWcL2KPjaTOjPcO2ibrw
   aJmbHIsnBPuMNKFJycYnaYwLhPzTs/Hq/NPNuH9JbcfOWjywHZafp77OA
   +nmf2sgOK3z4WLCsmreTfe5HJ/NrO6zAkOWYEsC/su6zm9XD6uS0MtRvA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="437140392"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="437140392"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 07:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="844441268"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="844441268"
Received: from winkelru-mobl.amr.corp.intel.com (HELO [10.212.144.249])
 ([10.212.144.249])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 07:54:19 -0700
Message-ID: <0471f085-14bf-c159-9b92-62983af6c19a@linux.intel.com>
Date: Fri, 12 May 2023 08:45:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 01/10] soundwire: bus: Allow SoundWire peripherals to
 register IRQ handlers
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
 lee@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, tglx@linutronix.de, maz@kernel.org,
 linus.walleij@linaro.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-2-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230512122838.243002-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4MBFIWQ2CRARVEEIRC23D5EBJ2SULIPC
X-Message-ID-Hash: 4MBFIWQ2CRARVEEIRC23D5EBJ2SULIPC
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4MBFIWQ2CRARVEEIRC23D5EBJ2SULIPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> @@ -1711,6 +1739,9 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>  				struct device *dev = &slave->dev;
>  				struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
>  
> +				if (slave->prop.use_domain_irq && slave->irq)
> +					handle_nested_irq(slave->irq);
> +

I am a bit lost here, I can understand that alerts would be handled by a
dedicated handler, but here the code continues and will call the
existing interrupt_callback.

Is this intentional? I wonder if there's a risk with two entities
dealing with the same event and programming the same registers.
Shouldn't there be some sort of 'either or' rule?

>  				if (drv->ops && drv->ops->interrupt_callback) {
>  					slave_intr.sdca_cascade = sdca_cascade;
>  					slave_intr.control_port = clear;
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 1f43ee848eac8..fafbc284e82da 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -122,6 +122,12 @@ static int sdw_drv_probe(struct device *dev)
>  	if (drv->ops && drv->ops->read_prop)
>  		drv->ops->read_prop(slave);
>  
> +	if (slave->prop.use_domain_irq) {
> +		slave->irq = irq_create_mapping(slave->bus->domain, slave->dev_num);
> +		if (!slave->irq)
> +			dev_warn(dev, "Failed to map IRQ\n");
> +	}
> +
>  	/* init the sysfs as we have properties now */
>  	ret = sdw_slave_sysfs_init(slave);
>  	if (ret < 0)
> @@ -166,7 +172,13 @@ static int sdw_drv_remove(struct device *dev)
>  	int ret = 0;
>  
>  	mutex_lock(&slave->sdw_dev_lock);
> +
>  	slave->probed = false;
> +
> +	if (slave->prop.use_domain_irq)
> +		irq_dispose_mapping(irq_find_mapping(slave->bus->domain,
> +						     slave->dev_num));
> +
>  	mutex_unlock(&slave->sdw_dev_lock);
>  
>  	if (drv->remove)
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index ef645de13ae93..c3ab5e5f9cfa4 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -5,6 +5,8 @@
>  #define __SOUNDWIRE_H
>  
>  #include <linux/bug.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/bitfield.h>
>  
> @@ -369,6 +371,7 @@ struct sdw_dpn_prop {
>   * @clock_reg_supported: the Peripheral implements the clock base and scale
>   * registers introduced with the SoundWire 1.2 specification. SDCA devices
>   * do not need to set this boolean property as the registers are required.
> + * @use_domain_irq: call actual IRQ handler on slave, as well as callback

what callback, the interrupt_callback? That would mean the interrupt is
handled twice?

I am probably missing something here?

>   */
>  struct sdw_slave_prop {
>  	u32 mipi_revision;
> @@ -393,6 +396,7 @@ struct sdw_slave_prop {
>  	u8 scp_int1_mask;
>  	u32 quirks;
>  	bool clock_reg_supported;
> +	bool use_domain_irq;
>  };
