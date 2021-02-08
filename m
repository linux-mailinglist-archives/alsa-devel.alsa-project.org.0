Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 758263139AB
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 17:40:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEB161699;
	Mon,  8 Feb 2021 17:39:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEB161699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612802414;
	bh=Ph1X024xMAgtnSfa/40t9HuR943VjZbgLG+7CfTXuyI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=opmKmSoKfubwYH9tRRcf4h+AIx7MLGYN5Ag967iXL1YV9QltKD30NYnMtmYwsbE16
	 bpVp5Rd0ZUW397Z2zE9+ILie7ESRtDvBR4p6PiOpgV16s+lw7+hhmduH+cNoukovsv
	 KZzwFkYD45GLmulL/DuAfNctwzkrZUO0eAJ3A1IU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40D77F80165;
	Mon,  8 Feb 2021 17:38:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 047B7F80165; Mon,  8 Feb 2021 17:38:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E898F80165
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 17:38:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E898F80165
IronPort-SDR: LHVK0n8/Kx7bRg04QGzP1xoCnOqtO00mHl0LRf2RL8duQX2cSQ2hXOgME1HvZakA2IgxAGJzn7
 lrZQExcmF0ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="245810579"
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="245810579"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 08:38:21 -0800
IronPort-SDR: HhFgVGtZumbtp/ruNqV/QuL8XHfCQMoK1iv6eChCCcHA5IXPHHsPY077pxUNiMboitQiLSmt8H
 h3jpklE5Wu4g==
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="377835376"
Received: from rahaness-mobl.amr.corp.intel.com (HELO [10.212.141.76])
 ([10.212.141.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 08:38:20 -0800
Subject: Re: [PATCH] ASoC: rt1316: Add RT1316 SDCA vendor-specific driver
To: Mark Brown <broonie@kernel.org>, shumingf@realtek.com
References: <20210208090432.1078-1-shumingf@realtek.com>
 <20210208122337.GE8645@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9eff4f09-b127-5912-f62f-ed1e48db2e36@linux.intel.com>
Date: Mon, 8 Feb 2021 09:26:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210208122337.GE8645@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, derek.fang@realtek.com,
 flove@realtek.com, bard.liao@intel.com, pierre-louis.bossart@intel.com
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


>> +static int rt1316_sdw_set_tdm_slot(struct snd_soc_dai *dai,
>> +				   unsigned int tx_mask,
>> +				   unsigned int rx_mask,
>> +				   int slots, int slot_width)
>> +{
>> +	struct snd_soc_component *component = dai->component;
>> +	struct rt1316_sdw_priv *rt1316 =
>> +		snd_soc_component_get_drvdata(component);
>> +
>> +	if (tx_mask)
>> +		return -EINVAL;
>> +
>> +	if (slots > 2)
>> +		return -EINVAL;
>> +
>> +	rt1316->rx_mask = rx_mask;
>> +	rt1316->slots = slots;
>> +	/* slot_width is not used since it's irrelevant for SoundWire */
> 
> I wouldn't expect to see any TDM stuff at all for SoundWire?  I do see
> some crept through though :/

We only use the mask information to let codecs/amplifiers know which 
channels they need to pick in a stream. This is useful e.g. when we have 
two (or more) amplifiers on the same link, and you want to tell 
amplifierA to use ch0 and amplifierB to use ch1.

IIRC there was a similar concept in AC97, there was a mask information 
to tell devices which channel(s) they were supposed to work on. There 
are really not a lot of new concepts in SoundWire, the main change is 
the ability to share the same link to transport different data 
types/widths. It remains a serial multi-drop link and shares a lot of 
attributes with previous solutions. That's what lead us to use the same 
API, even if the slot_width is undefined/irrelevant.

In most cases though all amplifiers on Intel-based solutions extract the 
same information, and the output will be dynamically selected based on 
kcontrol information. This is easier to use for e.g. orientation and 
posture changes.
