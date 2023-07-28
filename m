Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DF1767301
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 19:12:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2258E827;
	Fri, 28 Jul 2023 19:11:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2258E827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690564358;
	bh=eoQ6QIQA0eurvt4IsYsxuOVhy6X7PCzpPdYc+so7TII=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f8HIlb6lHKVE3l0VJt75kG7mPY44VbLXAVD2Deog9iFo2tlDCLFOOtEyKHlEgs/hk
	 yswikN2ASEe0bFoawp6IBo/cI/D0F6amLGDbru1gT3AjZHIjpvKj9OUwOAFJNlMJYj
	 Qlyh32GG0QfTTIHbxpYlH9IBPMUKKZFjEgDAqOV4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61843F802E8; Fri, 28 Jul 2023 19:11:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F724F80163;
	Fri, 28 Jul 2023 19:11:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCB02F8019B; Fri, 28 Jul 2023 19:11:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 771AEF80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 19:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 771AEF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZPU5OxAz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690564299; x=1722100299;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eoQ6QIQA0eurvt4IsYsxuOVhy6X7PCzpPdYc+so7TII=;
  b=ZPU5OxAzPHZ8MzpqPWlfqUEMC2XOZNrzw64i3LziC44Ej0+auR0mP9Xg
   DIuv0zWo3qBZ/72FguJVUAhn1IXboYAtMoE3FIsKkMOB3z7+l+bSV1ZXQ
   tp2lv77N9WzCzkTc3Pg8JRg6jTrXTB58A0VQqcJYOBmXfXZt5izpcAEUO
   910t/dH+5KOtiDQcJL1F+gbM9Mv+wSOWtoypdJJ1yqjlGRBscPe+4Iygy
   o1sng5KLphY3WpeGX+2Qg3/HJv7atR/6FWaeu1dAiUVtfx/pgzDQhn2+l
   1XjlSt+RhokARrpm2+pjUcpuCVKAZHwfpzrJrq90z2U6yLT26O0T7ZSL7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399580350"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200";
   d="scan'208";a="399580350"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 10:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="841384724"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200";
   d="scan'208";a="841384724"
Received: from shuaibah-mobl.amr.corp.intel.com (HELO [10.212.30.166])
 ([10.212.30.166])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 10:11:33 -0700
Message-ID: <db5f1478-8aca-fb57-c3fc-aa09071a0829@linux.intel.com>
Date: Fri, 28 Jul 2023 18:44:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v6 1/6] soundwire: bus: Allow SoundWire peripherals to
 register IRQ handlers
Content-Language: en-US
To: Lee Jones <lee@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230725102532.2567580-1-ckeepax@opensource.cirrus.com>
 <20230725102532.2567580-2-ckeepax@opensource.cirrus.com>
 <20230728151818.GL8175@google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230728151818.GL8175@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XDPDPC7WS7CMBPEASBTXVQSWNXQE6C4J
X-Message-ID-Hash: XDPDPC7WS7CMBPEASBTXVQSWNXQE6C4J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XDPDPC7WS7CMBPEASBTXVQSWNXQE6C4J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/28/23 17:18, Lee Jones wrote:
> Vinod, Bard, Pierre-Louis, Sanyog,
> 
> This has been on the list for some time now.
> 
> Would one of you please review this, so we can get it merged?

Sorry, I thought I provided my tag on an earlier version, but apparently
that never reached the ML. All my earlier feedback was taken into
account so no objections from me - just one typo below...

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> On Tue, 25 Jul 2023, Charles Keepax wrote:
> 
>> From: Lucas Tanure <tanureal@opensource.cirrus.com>
>>
>> Currently the in-band alerts for SoundWire peripherals can only
>> be communicated to the driver through the interrupt_callback
>> function. This however is slightly inconvient for devices that wish to

inconvenient

>> share IRQ handling code between SoundWire and I2C/SPI, the later would
>> normally register an IRQ handler with the IRQ subsystem. However there
>> is no reason the SoundWire in-band IRQs can not also be communicated
>> as an actual IRQ to the driver.
