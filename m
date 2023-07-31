Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9C6768974
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 03:05:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9AC982B;
	Mon, 31 Jul 2023 03:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9AC982B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690765514;
	bh=H4f2pgcHPDppOpMIhE5jfAiRkV8P22+qE6ZHE70YtNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MTGhUF8Z6037VOHSsYTP33yc8cuXuulIpcSHgYldPr3HlGxc/fJ19mx33TUwo1V78
	 J5xGWbN/okRQDSsIngFzV7IDJ7pcipcHTYjrkfnjvUGldWk1G/2vXMtpqprkKadAb+
	 eO/2FVGH4OIoQNXwmWBRXkVcdaS+ZpuJCNQnma2Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16648F8016D; Mon, 31 Jul 2023 03:03:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8260BF80163;
	Mon, 31 Jul 2023 03:03:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0755FF8016D; Mon, 31 Jul 2023 03:03:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1A28F80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 03:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1A28F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ENNy2L4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690765417; x=1722301417;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=H4f2pgcHPDppOpMIhE5jfAiRkV8P22+qE6ZHE70YtNw=;
  b=ENNy2L4BqpR60YX87jp9Ygd9y0MCkT5E5A/11Gi5fuiKK8p0KNX9NMoW
   ZdEfjip5S5dNziX6USuRoyFhiwVxbJs/s4FqXHqTyLH/v1DM/cGr7cQT9
   mgCrOS4TytKnS3JsrktsZWudDkgf89b+H6+wXQQ+ti23BoPYtKnqD1I9b
   rYKNDb5SiY+sYcUwpOgZS9Qs70iOd3Y4jgU+/iiRG5V3PXusFGRHvL7Ye
   eW1MlvpwDyQ+biJuert+BzfyDdb9Hn522WTfZqrBIQJ90K2ZqVaR84gqq
   inTb8HcIJXepDPwdRapcVRulP9PFmi6uIfdBOwtp0xSB09xzYtOOzoFOR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="371599901"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200";
   d="scan'208";a="371599901"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2023 18:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="757759101"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200";
   d="scan'208";a="757759101"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.92.2.114])
 ([10.92.2.114])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2023 18:03:25 -0700
Message-ID: <502d8316-1630-5818-5ffe-e094788d847a@linux.intel.com>
Date: Mon, 31 Jul 2023 09:03:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 1/6] soundwire: bus: Allow SoundWire peripherals to
 register IRQ handlers
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Lee Jones <lee@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230725102532.2567580-1-ckeepax@opensource.cirrus.com>
 <20230725102532.2567580-2-ckeepax@opensource.cirrus.com>
 <20230728151818.GL8175@google.com>
 <db5f1478-8aca-fb57-c3fc-aa09071a0829@linux.intel.com>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <db5f1478-8aca-fb57-c3fc-aa09071a0829@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: P4VYTEQF7REF2LQLLZLTZGFNAAGCKXGV
X-Message-ID-Hash: P4VYTEQF7REF2LQLLZLTZGFNAAGCKXGV
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P4VYTEQF7REF2LQLLZLTZGFNAAGCKXGV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 7/29/2023 12:44 AM, Pierre-Louis Bossart wrote:
>
> On 7/28/23 17:18, Lee Jones wrote:
>> Vinod, Bard, Pierre-Louis, Sanyog,
>>
>> This has been on the list for some time now.
>>
>> Would one of you please review this, so we can get it merged?
> Sorry, I thought I provided my tag on an earlier version, but apparently
> that never reached the ML. All my earlier feedback was taken into
> account so no objections from me - just one typo below...
>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


The patch looks good to me.

Acked-by: Bard Liao <yung-chuan.liao@linux.intel.com>

>> On Tue, 25 Jul 2023, Charles Keepax wrote:
>>
>>> From: Lucas Tanure <tanureal@opensource.cirrus.com>
>>>
>>> Currently the in-band alerts for SoundWire peripherals can only
>>> be communicated to the driver through the interrupt_callback
>>> function. This however is slightly inconvient for devices that wish to
> inconvenient
>
>>> share IRQ handling code between SoundWire and I2C/SPI, the later would
>>> normally register an IRQ handler with the IRQ subsystem. However there
>>> is no reason the SoundWire in-band IRQs can not also be communicated
>>> as an actual IRQ to the driver.
