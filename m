Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 965A76D0AC7
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 18:12:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDB1D1F7;
	Thu, 30 Mar 2023 18:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDB1D1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680192756;
	bh=IfmUeqezkNqiaju5vernUXTtKzaKmOo/eWqsN6k6QwU=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KwlurFulCYHp4FG+QNW9sLr/8vcw+QYI1VZbpy8417/xSnw6W8N9I49LFA3PhC5Gd
	 l5AjzHjjcXbcqBi62BMChw6JmDaWzllEBF/EHKmiR41NXFHssQMKlKwxhgBh7qtq1h
	 o94mhfAseU7veym5yWEp8O9lYapBFjvakR38Fahw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13022F8021D;
	Thu, 30 Mar 2023 18:11:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6918EF80272; Thu, 30 Mar 2023 18:11:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA9AEF8021D
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 18:11:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA9AEF8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DDNWx9VT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680192700; x=1711728700;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IfmUeqezkNqiaju5vernUXTtKzaKmOo/eWqsN6k6QwU=;
  b=DDNWx9VTRBv8c9EaAOGFLum2xrx/DFkyGwKzkHVLDRK6p6n/d106xcLJ
   /4CLX/QYVcs7yJGUdkqkUm1GtabDg/SqhdXfoOV+75aMJyENmHHYQLOA8
   aP4i8goHsHCkvYphApPQ/D8c+clUc1nWcrTJ+fLc77swcmLjEoA9GUjpt
   rB/76AOiSb7xpSH0cR29Y1a33QHJyYTB2oRSe8jayH+xpsvo4sLdxBY0j
   GhDLSUL8jgRpzYHTJE/hpQNiwZEElQpq0brgqTL+GksSEY/WamfZdFPTP
   36IsrKrH+ceNTR4N/Rr2eQ/eMk7A/Ery8vBOL12TAmuG5uNNni+0GZRoK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321601846"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400";
   d="scan'208";a="321601846"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 09:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="1014491430"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400";
   d="scan'208";a="1014491430"
Received: from leedong-mobl.amr.corp.intel.com (HELO [10.209.122.136])
 ([10.209.122.136])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 09:09:37 -0700
Message-ID: <146f6100-9f99-f463-603c-332c5b9d9eef@linux.intel.com>
Date: Thu, 30 Mar 2023 11:09:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH 06/18] ASoC: SOF: Intel: hda-mlink: add structures to
 parse ALT links
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
 <20230327112931.23411-7-peter.ujfalusi@linux.intel.com>
 <87bkkakzk2.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87bkkakzk2.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7NHJ6NNWTBOBERM3MCPZ5VTXJ3VWRW2B
X-Message-ID-Hash: 7NHJ6NNWTBOBERM3MCPZ5VTXJ3VWRW2B
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7NHJ6NNWTBOBERM3MCPZ5VTXJ3VWRW2B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/30/23 10:51, Takashi Iwai wrote:
> On Mon, 27 Mar 2023 13:29:19 +0200,
> Peter Ujfalusi wrote:
>>
>>  int hda_bus_ml_get_capabilities(struct hdac_bus *bus)
>>  {
>> -	if (bus->mlcap)
>> -		return snd_hdac_ext_bus_get_ml_capabilities(bus);
>> +	u32 link_count;
>> +	int ret;
>> +	int i;
>> +
>> +	if (!bus->mlcap)
>> +		return 0;
>> +
>> +	link_count = readl(bus->mlcap + AZX_REG_ML_MLCD) + 1;
>> +
>> +	dev_dbg(bus->dev, "HDAudio Multi-Link count: %d\n", link_count);
>> +
>> +	for (i = 0; i < link_count; i++) {
>> +		ret = hda_ml_alloc_h2link(bus, i);
>> +		if (ret < 0) {
>> +			hda_bus_ml_free(bus);
>> +			return ret;
>> +		}
>> +	}
>>  	return 0;
> 
> This makes that each call of hda_bus_ml_get_capabilities() adds the
> h2link entries blindly.  If the driver calls it multiple times
> mistakenly (the function name sounds as if it's just a helper to query
> the capability bits), it'll lead to doubly entries.  Maybe adding some
> check would be safer, IMO.

Interesting comment, I didn't think of that one.

This function is currently called in the probe and indirectly via
hda_init_caps(). I think the driver framework guarantees the probe is
only called once, doesn't it?

we can also rename this function to make it clearer if there are any
suggestions, but the name is aligned with previous implementations of
the snd_hdac_ext stuff.
