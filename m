Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BAB700D1C
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 18:36:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CF21DF6;
	Fri, 12 May 2023 18:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CF21DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683909395;
	bh=478mvwmsv9IeCMZb4/HmUb/CH/Ey2PB85AwyLXEFDQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MY2nN2/vrOCmNEEaB8VaiL/2aJDeIdlCr9D9I+uILBbErWlqe0c8s/Duq8ELLCgv0
	 hgQes6wUL0y8OKbQPZVWW9aZe+9c8BTdRHYegqFq6EtcGH8TUDpboKcpur0w0ZeW1O
	 k3QXWM6vqvReZ9LO2PJ260qSBI+bwQzP7feFmfL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F085F80548; Fri, 12 May 2023 18:35:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B897F802E8;
	Fri, 12 May 2023 18:35:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 389EFF8032D; Fri, 12 May 2023 18:35:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D1D6F80087
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 18:35:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D1D6F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AXwID8ZY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683909310; x=1715445310;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=478mvwmsv9IeCMZb4/HmUb/CH/Ey2PB85AwyLXEFDQk=;
  b=AXwID8ZYSoKJvnJWJcLiUkDAzWfyAXYslQjCSeWCDr7aOQx9zL7KorBr
   lTzuBov1uUXsv+PfvJNvOu49qCSy8XLDcpckV4qJkoSTtxUgaRp4/+7SL
   W3bV/Us4aSyogN+jKCetj5TJ6TlH5N8sbGst+VpUP7wDc+tQr9QKQlSyx
   0A/vVPxaAxr5MZgGJRJWAIcsuIEa2SH6cJzseeiSlii1v9PHAGQ/fVDwr
   9fgaTRmcpvDOygnQRxvoatmPcX7nGeEYN919vWA9VYZ/kNCK2sb+MGniy
   Le7fvNR9gdaSi28rsCKGBS0I1iVKOM6jPPem6TgrVDn5O90RIOqE+FZxS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331193617"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="331193617"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 09:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="1030146824"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="1030146824"
Received: from winkelru-mobl.amr.corp.intel.com (HELO [10.212.144.249])
 ([10.212.144.249])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 09:35:03 -0700
Message-ID: <5363c7b7-7a5b-490c-445b-fb7ccd693c63@linux.intel.com>
Date: Fri, 12 May 2023 11:34:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 01/10] soundwire: bus: Allow SoundWire peripherals to
 register IRQ handlers
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, tglx@linutronix.de,
 maz@kernel.org, linus.walleij@linaro.org, vkoul@kernel.org,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-2-ckeepax@opensource.cirrus.com>
 <0471f085-14bf-c159-9b92-62983af6c19a@linux.intel.com>
 <20230512160224.GK68926@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230512160224.GK68926@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FTUCD3ALBESQY3IIOUILYYNC5AUL5ZET
X-Message-ID-Hash: FTUCD3ALBESQY3IIOUILYYNC5AUL5ZET
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FTUCD3ALBESQY3IIOUILYYNC5AUL5ZET/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/12/23 11:02, Charles Keepax wrote:
> On Fri, May 12, 2023 at 08:45:51AM -0500, Pierre-Louis Bossart wrote:
>>> @@ -1711,6 +1739,9 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>>>  				struct device *dev = &slave->dev;
>>>  				struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
>>>  
>>> +				if (slave->prop.use_domain_irq && slave->irq)
>>> +					handle_nested_irq(slave->irq);
>>> +
>>
>> I am a bit lost here, I can understand that alerts would be handled by a
>> dedicated handler, but here the code continues and will call the
>> existing interrupt_callback.
>>
>> Is this intentional? I wonder if there's a risk with two entities
>> dealing with the same event and programming the same registers.
>> Shouldn't there be some sort of 'either or' rule?
>>
> 
> I guess there is a risk of them "handling" the IRQ twice,
> although it is hard to see why you would write the driver that
> way. Also since they are sequencial the second would I guess
> just see that no IRQs are pending.
> 
> The intention for calling both is that it facilitates using
> the same IRQ handler for I2C and SoundWire. At least on the
> Cirrus devices there are a bunch of chip specific registers
> that need treated exactly the same on I2C and SoundWire, but
> then a couple of extra registers that need handled in the
> SoundWire case. This way the handling of those can be kept
> completely in the SoundWire part of the code and not ifdef-ed
> into the main IRQ path.

Sounds good to me, but it's worth adding a comment and improving the
commit message with design intent/rules since it's a common part in
drivers/soundwire/
