Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6426460F535
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 12:31:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEF2B31B4;
	Thu, 27 Oct 2022 12:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEF2B31B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666866696;
	bh=WwOA04jwVwLuv8hoGaeDHRFSy8FuWLQNwxQsrV66CQ8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EJ3T83+pn/ou3I9Q6pQXY3QCgWP723Q5ErCM13Ydyp0XsSBu7tLYQ7sm1C4VePfN/
	 D1Agug6mP3YSQ6GIFN2E3VuWXoE4WFPuoeVz4Um89kbTWHpmHUQ49leruvycKdiqT/
	 goBk91YsJq1ULP+Jqtlc3yRATrPw0oI1fF3wfdQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAFFBF804AD;
	Thu, 27 Oct 2022 12:29:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AE4AF80496; Thu, 27 Oct 2022 12:29:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C990EF80095
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 12:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C990EF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lcpiygCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666866584; x=1698402584;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WwOA04jwVwLuv8hoGaeDHRFSy8FuWLQNwxQsrV66CQ8=;
 b=lcpiygCw/OH1edWFNthYzCIzJIWYed0vaY4hG9KLmN9mB+lb3QIYcYsy
 NuA5FDferkSankleATxg0WerAvM7JMOBZSq++d8oPPfSHKb0VAdr3WkE4
 1QT8kM23ZSeQZpxFCdtXcCrk7WeE97c+29Ue1woFBG3OsSX6RHQ4FK6xR
 PYDD2O+E/Hlgs+n2mmb2+d0Z4oCkkii5WlriSEMTX2pkOFe5gAuBfZv8F
 OUrcRxsFZQm2hlmuq3XD7k7hrhnITW0Rlx2EF/W0EgTjbOLElav6yDyYN
 T5d4j/hImlamzu6ot7DWBMsGzl6AjKAIgjLxGadxIhHtbN5JP5tpR3rfZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="370253772"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="370253772"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 03:29:40 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="627123244"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="627123244"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.18])
 ([10.99.241.18])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 03:29:37 -0700
Message-ID: <3977c2b3-ead3-3904-820a-d602aa04c51b@linux.intel.com>
Date: Thu, 27 Oct 2022 12:29:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 3/9] ALSA: hda: Introduce snd_hdac_stream_wait_drsm()
To: Takashi Iwai <tiwai@suse.de>, Cezary Rojewski <cezary.rojewski@intel.com>
References: <20221027082331.1561740-1-cezary.rojewski@intel.com>
 <20221027082331.1561740-4-cezary.rojewski@intel.com>
 <874jvpo9by.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <874jvpo9by.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: hdegoede@redhat.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
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

On 10/27/2022 12:21 PM, Takashi Iwai wrote:
> On Thu, 27 Oct 2022 10:23:25 +0200,
> Cezary Rojewski wrote:
>> --- a/sound/hda/hdac_stream.c
>> +++ b/sound/hda/hdac_stream.c
>> @@ -821,6 +821,27 @@ void snd_hdac_stream_drsm_enable(struct hdac_bus *bus,
>>   }
>>   EXPORT_SYMBOL_GPL(snd_hdac_stream_drsm_enable);
>>   
>> +/*
>> + * snd_hdac_stream_wait_drsm - wait for HW to clear RSM for a stream
>> + * @azx_dev: HD-audio core stream to await RSM for
>> + *
>> + * Returns 0 on success and -ETIMEDOUT upon a timeout.
>> + */
>> +int snd_hdac_stream_wait_drsm(struct hdac_stream *azx_dev)
>> +{
>> +	struct hdac_bus *bus = azx_dev->bus;
>> +	u32 mask, reg;
>> +	int ret;
>> +
>> +	mask = 1 << azx_dev->index;
>> +
>> +	ret = readb_poll_timeout(bus->drsmcap + AZX_REG_DRSM_CTL, reg, !(reg & mask), 250, 2000);
> 
> Remember that HD-audio bus doesn't always allow readb().  Tegra
> requires the aligned access, for example.
> 

The readb_poll_timeout macro was updated to take care of that,
https://lore.kernel.org/all/20221007084856.1638302-1-amadeuszx.slawinski@linux.intel.com/
so it should be fine?

