Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D91A98170A1
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 14:40:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AE4AE85;
	Mon, 18 Dec 2023 14:39:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AE4AE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702906800;
	bh=GciV73AtidMVgP+beaXPawHqp9+TU47Y89YlELtHGf8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GOxR090DZqJZ+drybbO9t6tUi1X9fTH5TUE7czmsu6c0l9efrokWpQtfQcOsi42Ix
	 vdz63kkKBgux4b/v2qKv6i999oaGMRG8sy0AEqpCGuV/sgLPIgft120Iv27Q4EEb6E
	 Yj+e/JVVF4s0gA/ByN4ODWHgWmQFpPsV1lz6xfF4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD2EFF805AD; Mon, 18 Dec 2023 14:39:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B71EF805BF;
	Mon, 18 Dec 2023 14:39:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49987F8059F; Mon, 18 Dec 2023 14:39:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9285F80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 14:39:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9285F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SM/dZdOq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702906752; x=1734442752;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GciV73AtidMVgP+beaXPawHqp9+TU47Y89YlELtHGf8=;
  b=SM/dZdOqTeYKYLbsCm+x/KolubUDnqOY1g5fN9zoW+px0zrL4vb2WLX2
   XX1W6MRTQhY8KqnH3r8qrZuou1PqLYFdy40N0qe7keQANYcD/z7HKHjo2
   STWh1LOPPkLp+bkgWx95ZMF7cl9CgZt93KcjZNd7cGlJNVHZTsLkkkdPM
   n5sLYkOxpfnIHakfTWiwMFuzqEg1SStVUYHKODmExkCpxbtk2yUv/jZA5
   AbXBiuwN3NUuW7axdoy+cD4FQEtSSdFIWkmjQWI6j3HejBEKHLKhAFyfE
   hJtJHoh2zvNFjyM2bp09CypNsQF9ZayWQDH7W5o2Nj/XYmud4We9CFk+F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8868664"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600";
   d="scan'208";a="8868664"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 05:39:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="1022753550"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600";
   d="scan'208";a="1022753550"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO [10.249.34.197])
 ([10.249.34.197])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 05:39:04 -0800
Message-ID: <4f66f792-79c0-4221-82b5-a0d9ec5a898b@linux.intel.com>
Date: Mon, 18 Dec 2023 14:12:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/16] soundwire: bus: add API for BPT protocol
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 broonie@kernel.org, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-8-pierre-louis.bossart@linux.intel.com>
 <ZYAy9ZM0o3uAk2qY@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZYAy9ZM0o3uAk2qY@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PT5A6UDQ6SPKY7VPEZEUULM4EMJP6P5Q
X-Message-ID-Hash: PT5A6UDQ6SPKY7VPEZEUULM4EMJP6P5Q
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PT5A6UDQ6SPKY7VPEZEUULM4EMJP6P5Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>> +int sdw_bpt_open_stream(struct sdw_bus *bus,
>> +			struct sdw_slave *slave,
>> +			enum sdw_bpt_type mode,
>> +			struct sdw_bpt_msg *msg)
>> +{
>> +	int ret;
>> +
>> +	/* only Bulk Register Access (BRA) is supported for now */
>> +	if (mode != SDW_BRA)
>> +		return -EINVAL;
>> +
>> +	if (msg->len < SDW_BPT_MSG_MIN_BYTES) {
>> +		dev_err(bus->dev, "BPT message length %d, min supported %d\n",
>> +			msg->len, SDW_BPT_MSG_MIN_BYTES);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (msg->len % SDW_BPT_MSG_BYTE_ALIGNMENT) {
>> +		dev_err(bus->dev, "BPT message length %d is not a multiple of %d bytes\n",
>> +			msg->len, SDW_BPT_MSG_BYTE_ALIGNMENT);
>> +		return -EINVAL;
>> +	}
> 
> Is this a protocol requirement?

No, it's an implementation requirement.

We could move this to host-specific parts but then the codec drivers
will have to know about alignment requirements for each host they are
use with. IOW, it's more work for codec drivers if we don't have a
minimum bar for alignment requirement across all platforms.

> 
>> +
>> +	/* check device is enumerated */
>> +	if (slave->dev_num == SDW_ENUM_DEV_NUM ||
>> +	    slave->dev_num > SDW_MAX_DEVICES)
>> +		return -ENODEV;
>> +
>> +	/* make sure all callbacks are defined */
>> +	if (!bus->ops->bpt_open_stream ||
>> +	    !bus->ops->bpt_close_stream ||
>> +	    !bus->ops->bpt_send_async ||
>> +	    !bus->ops->bpt_wait)
>> +		return -ENOTSUPP;
> 
> should this not be checked at probe time, if device declares the support

sdw_bpt_open_stream() would be called by the peripheral driver (or
regmap as a proxy). The peripheral driver could also decide to check for
those callback during its probe, but that's beyond the scope of this
patchset.

These checks are just there for paranoia, in case a peripheral driver
uses BTP/BRA on a host where they are not supported.

It's not science-fiction, we see AMD- and INTEL-based platforms using
the same SoundWire-based codecs.

>> +	ret = bus->ops->bpt_open_stream(bus, slave, mode, msg);
>> +	if (ret < 0)
>> +		dev_err(bus->dev, "BPT stream open, err %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(sdw_bpt_open_stream);
> 
> can we open multiple times (i dont see a check preventing that), how do
> we close..?

there's a refcount preventing multiples BTP streams from being opened.

> Re-iterating my comment on documentation patch, can we do with a async api
> and wait api, that makes symantics a lot simpler, right..?

see reply in previous email, combining open+send is weird IMHO.

>> +
>> +int sdw_bpt_send_async(struct sdw_bus *bus,
>> +		       struct sdw_slave *slave,
>> +		       struct sdw_bpt_msg *msg)
>> +{
>> +	if (msg->len > SDW_BPT_MSG_MAX_BYTES)
>> +		return -EINVAL;
>> +
>> +	return bus->ops->bpt_send_async(bus, slave, msg);
>> +}
>> +EXPORT_SYMBOL(sdw_bpt_send_async);
> 
> Can we call this multiple times after open, it is unclear to me. Can you
> please add kernel-doc comments about the APIs here as well

This can be called multiple times but it's useless: all the buffers are
prepared in the open() stage. This is the moral equivalent of a trigger
step, just enable data transfers.

> 
>>  struct sdw_master_ops {
>>  	int (*read_prop)(struct sdw_bus *bus);
>> @@ -869,6 +913,20 @@ struct sdw_master_ops {
>>  	void (*new_peripheral_assigned)(struct sdw_bus *bus,
>>  					struct sdw_slave *slave,
>>  					int dev_num);
>> +	int (*bpt_open_stream)(struct sdw_bus *bus,
>> +			       struct sdw_slave *slave,
>> +			       enum sdw_bpt_type mode,
>> +			       struct sdw_bpt_msg *msg);
>> +	int (*bpt_close_stream)(struct sdw_bus *bus,
>> +				struct sdw_slave *slave,
>> +				enum sdw_bpt_type mode,
>> +				struct sdw_bpt_msg *msg);
>> +	int (*bpt_send_async)(struct sdw_bus *bus,
>> +			      struct sdw_slave *slave,
>> +			      struct sdw_bpt_msg *msg);
>> +	int (*bpt_wait)(struct sdw_bus *bus,
>> +			struct sdw_slave *slave,
>> +			struct sdw_bpt_msg *msg);
> 
> do we need both bus and slave, that was a mistake in orignal design IMO.
> We should fix that for bpt_ apis

No disagreement. All the routines follow the same template, if we change
one we should also change the others.

The main question as discussed with Charles is whether we want to pass
the 'msg' argument in all routines.

