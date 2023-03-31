Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 910116D15F1
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 05:21:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 871551F9;
	Fri, 31 Mar 2023 05:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 871551F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680232882;
	bh=OhOoIPLTYSmHJFC100ng8UOjacxJ0N+xcLOSz4rGIvQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OUcKDeHlVsaqUQGoMjHrrmfvJ32P2vQoaatNq87T/uWgbL3MpxLuQCO/uk/m7VAIF
	 4d4F3slINuH9TNSXNHmyJjey08YPb8nj35ktpUO4CWIDHX/Ix/OASD4xgs7uJtEXBW
	 gb9zVFKIWnWiAiIeraBWiisj9OSKQ01GRz/fr27w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05579F8024E;
	Fri, 31 Mar 2023 05:20:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D86A3F80290; Fri, 31 Mar 2023 05:20:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69667F8021D
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 05:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69667F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dYyYY0qj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680232817; x=1711768817;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OhOoIPLTYSmHJFC100ng8UOjacxJ0N+xcLOSz4rGIvQ=;
  b=dYyYY0qjK9fvy07sWsS3oBgaAYf9gZgOWoXYuvmC/LNBtpnomaMkxOSP
   yVWUO8tMITt3QvuGhKGqAtJICM8VPAGNaXIvb3CDnNDavcsFPWpptYasN
   NLJFoeQJTFqulpiObqdPpFLgCvYZaAzFyz7zefq36lZBv8NqeKttoIBUS
   6gME8gR+yaV3hrYjPu/09ZF/t8/xSygZavp6GAeFfecDfw25e5fXpp0NF
   0pWKYcPVsOoL3I5SiatXC37p/8N6GFnECQjW8sh1xQgcRjWk9us1WkDRd
   9U5CNhRXo5uvcY5Nov/ffEgL2Wzs5HWzK9yN+D8IizJgaEIUqQtVWX36q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="342992675"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400";
   d="scan'208";a="342992675"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 20:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="684938161"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400";
   d="scan'208";a="684938161"
Received: from chuaweiz-mobl.amr.corp.intel.com (HELO [10.209.109.216])
 ([10.209.109.216])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 20:20:05 -0700
Message-ID: <b2e7f501-105f-7ba8-1eb8-972b867046d1@linux.intel.com>
Date: Thu, 30 Mar 2023 22:05:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH 06/18] ASoC: SOF: Intel: hda-mlink: add structures to
 parse ALT links
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
 <20230327112931.23411-7-peter.ujfalusi@linux.intel.com>
 <87bkkakzk2.wl-tiwai@suse.de>
 <146f6100-9f99-f463-603c-332c5b9d9eef@linux.intel.com>
 <87355mkt97.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87355mkt97.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RYFAE5YTCCZFA33YJARWLSOHOYHTIECY
X-Message-ID-Hash: RYFAE5YTCCZFA33YJARWLSOHOYHTIECY
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYFAE5YTCCZFA33YJARWLSOHOYHTIECY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>>>  int hda_bus_ml_get_capabilities(struct hdac_bus *bus)
>>>>  {
>>>> -	if (bus->mlcap)
>>>> -		return snd_hdac_ext_bus_get_ml_capabilities(bus);
>>>> +	u32 link_count;
>>>> +	int ret;
>>>> +	int i;
>>>> +
>>>> +	if (!bus->mlcap)
>>>> +		return 0;
>>>> +
>>>> +	link_count = readl(bus->mlcap + AZX_REG_ML_MLCD) + 1;
>>>> +
>>>> +	dev_dbg(bus->dev, "HDAudio Multi-Link count: %d\n", link_count);
>>>> +
>>>> +	for (i = 0; i < link_count; i++) {
>>>> +		ret = hda_ml_alloc_h2link(bus, i);
>>>> +		if (ret < 0) {
>>>> +			hda_bus_ml_free(bus);
>>>> +			return ret;
>>>> +		}
>>>> +	}
>>>>  	return 0;
>>>
>>> This makes that each call of hda_bus_ml_get_capabilities() adds the
>>> h2link entries blindly.  If the driver calls it multiple times
>>> mistakenly (the function name sounds as if it's just a helper to query
>>> the capability bits), it'll lead to doubly entries.  Maybe adding some
>>> check would be safer, IMO.
>>
>> Interesting comment, I didn't think of that one.
>>
>> This function is currently called in the probe and indirectly via
>> hda_init_caps(). I think the driver framework guarantees the probe is
>> only called once, doesn't it?
>>
>> we can also rename this function to make it clearer if there are any
>> suggestions, but the name is aligned with previous implementations of
>> the snd_hdac_ext stuff.
> 
> Yeah, naming it as an init function would avoid the misuse.

Sure thing, I'll rename it as hda_bus_ml_init().

Thanks for the feedback.
