Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D751FF5F0
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 16:58:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6767F1796;
	Thu, 18 Jun 2020 16:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6767F1796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592492301;
	bh=MHZDsQ5fBftW/tDaGd1ZbDkyvp29BwkZehnehQQ6LT8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eb5/3I5EXqY/h+XQXLNanYsMngUsxqEDSM/SzlFOKtWfvTf4EarnchqNwQ3dQhHXf
	 AQmF9wSxyW7LCxm5rysZoGzjJnu+88PcI+1Feaoq5CPbszTHHYD7GAxsYXTfUnNKTE
	 MGnUEuVduTtod/dktZQIpafQA8N3bB9gQGaWEsqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C876F80162;
	Thu, 18 Jun 2020 16:56:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98176F80162; Thu, 18 Jun 2020 16:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A94FEF800EF
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 16:56:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A94FEF800EF
IronPort-SDR: MeX8ehN6A9K+JXEWgrTffqkK8decwn0JlJX5q+RIo96ZYU4g0FQ7fSQccpl2gARi1EnXIMgMpx
 GiWAtLDsTk4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="131000270"
X-IronPort-AV: E=Sophos;i="5.75,251,1589266800"; d="scan'208";a="131000270"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 07:56:28 -0700
IronPort-SDR: at+vlZROG39IV3Sw1Bc1iQbrAZz6YYBWa5nnlJi/L5Se4slJo2LQZAyVhOvMMTaLbxC+96C8l6
 bXzA2ADzW89Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,251,1589266800"; d="scan'208";a="477268238"
Received: from richard2-mobl.amr.corp.intel.com (HELO [10.254.109.110])
 ([10.254.109.110])
 by fmsmga005.fm.intel.com with ESMTP; 18 Jun 2020 07:56:27 -0700
Subject: Re: [PATCH] ASoC: codecs: Added MAX98373 Soundwire Driver
To: Mark Brown <broonie@kernel.org>
References: <20200617163015.16809-1-pierre-louis.bossart@linux.intel.com>
 <20200618110902.GE5789@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d3bb399f-3af9-666d-054d-e4a1dda1dfb4@linux.intel.com>
Date: Thu, 18 Jun 2020 07:42:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618110902.GE5789@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Ryan Lee <ryans.lee@maximintegrated.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org, vkoul@kernel.org,
 Naveen Manohar <naveen.m@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Thanks for the review Mark,

>> +static void max98373_read_config(struct sdw_slave *slave)
>> +{
>> +	int value;
>> +	struct device *dev = &slave->dev;
>> +	struct max98373_priv *max98373 = dev_get_drvdata(dev);
>> +
>> +	if (!device_property_read_u32(dev, "maxim,vmon-slot-no", &value))
>> +		max98373->v_slot = value & 0xF;
>> +	else
>> +		max98373->v_slot = 0;
> 
> The DT bindings need updating to add SoundWire support.

Interesting. The properties are the same in I2C and SoundWire mode, so 
would we need a completely different file that just specifies the 
SoundWire DeviceID, e.g.

properties:
   compatible:
     const: sdw10217201000

What's the process for such dual-mode devices?

> 
>> +	/* L/R mix configuration */
>> +	regmap_write(max98373->regmap,
>> +		     MAX98373_R2029_PCM_TO_SPK_MONO_MIX_1,
>> +		     0x80);
>> +	regmap_write(max98373->regmap,
>> +		     MAX98373_R202A_PCM_TO_SPK_MONO_MIX_2,
>> +		     0x1);
>> +	/* Set initial volume (0dB) */
>> +	regmap_write(max98373->regmap,
>> +		     MAX98373_R203D_AMP_DIG_VOL_CTRL,
>> +		     0x00);
>> +	regmap_write(max98373->regmap,
>> +		     MAX98373_R203E_AMP_PATH_GAIN,
>> +		     0x00);
> 
> I'd expect these to be chip defaults, especially the volumes.

The same sequence is already used in the I2C probe. if this needs to 
change, it's got to be applied for both cases.
> 
>> +	/* Speaker enable */
>> +	regmap_update_bits(max98373->regmap,
>> +			   MAX98373_R2043_AMP_EN,
>> +			   MAX98373_SPK_EN_MASK, 1);
> 
> I'd expect this to be managed via DAPM.

It's also copied as is from the existing I2C parts.

We should probably cut the common parts out, as done for rt5682. Ryan, 
can you look into this.

> 
>> +/* SPDX-License-Identifier: GPL-2.0-only
> 
> AIUI this needs the trailing */ on the same line for the license
> compliance people.

Indeed, that's a miss.
