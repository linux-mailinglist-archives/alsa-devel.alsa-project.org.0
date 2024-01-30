Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FF0842271
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 12:13:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58150E9A;
	Tue, 30 Jan 2024 12:13:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58150E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706613222;
	bh=M0lpIKLgHsHcpNnO2aKdjqw9uhZZRpl1IB/C3sBX9co=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P7OjXaeLbp3yAgMGd0kxy3/VYVXB0YcTNmok4uo3FiHOJnxndq/a9xpM+0wbaxMKR
	 xoI0gIK/8sCWGTqesDvDmWkO9zqKv6fCP3Um8/QqLb1b0It7dzJH6wLBaeQFERB6df
	 F1rF5QTDwb0gz0ZYPWnf0Zjm48wUZTtFYFeTCqeI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43808F805A9; Tue, 30 Jan 2024 12:13:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96B6BF8056F;
	Tue, 30 Jan 2024 12:13:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58D50F8055C; Tue, 30 Jan 2024 12:13:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59930F8020D
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 12:12:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59930F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DiSVfj9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706613182; x=1738149182;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=M0lpIKLgHsHcpNnO2aKdjqw9uhZZRpl1IB/C3sBX9co=;
  b=DiSVfj9AhaZOl9wq9DLkIpC0Etb9d2TUZgInhmf7now3w7E3oP21Hcak
   5RdBiEGgKsDmGbx/ELKjJNDt8eU4v0CQheX7piUyK4rcQXh7pmGJFl4ZE
   56+/4gT0n2MKmA3tamCAssd28qLXTZEDZNWkjdNwQisOraECE2UZb2wWV
   IznB9ABWxZ2vottDyqgT+ziuuYuy/s54bzWlzwdUPKachA15nGxuxowCC
   ztmYH4DEn6jTJ8qp7k+3rQvevAxgm0uazZ7md6nNGEHd2J3xZQHrK1SoW
   cnjlwQo6pe1Rgxu7/8AWtCOg+WEFCj2jEKvglzgxl8EZbcVKTJkYA49MV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="467503952"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400";
   d="scan'208";a="467503952"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 03:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400";
   d="scan'208";a="29873042"
Received: from aravikum-mobl1.amr.corp.intel.com (HELO [10.209.88.191])
 ([10.209.88.191])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 03:12:53 -0800
Message-ID: <11280dec-cf3d-1694-d837-2bf263ad148a@linux.intel.com>
Date: Tue, 30 Jan 2024 12:12:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 08/18] ASoC: cs35l56: Fix default SDW TX mixer registers
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
 tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20240129162737.497-1-rf@opensource.cirrus.com>
 <20240129162737.497-9-rf@opensource.cirrus.com>
 <4f54a12c-c8a3-414c-b4df-3f7b25e6d524@linux.intel.com>
 <a8432725-6dc6-4765-831f-178dcee8b829@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <a8432725-6dc6-4765-831f-178dcee8b829@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TZA7RHWMNVFGBX4TQ5W22W3UCPHIDR6Z
X-Message-ID-Hash: TZA7RHWMNVFGBX4TQ5W22W3UCPHIDR6Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZA7RHWMNVFGBX4TQ5W22W3UCPHIDR6Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> CS35L56 is designed for SDCA and a generic SDCA driver would
>>> know nothing about these chip-specific registers. So the
>>> firmware sets up the SDW TX mixer registers to whatever audio
>>> is relevant on a specific system.
>>>
>>> This means that the driver cannot assume the initial values
>>> of these registers. But Linux has ALSA controls to configure
>>> routing, so the registers can be patched to silicon default and
>>> the ALSA controls used to select what audio to feed back to the
>>> host capture path.
>>
>> humm, which has the precedence then?
>> a) the values set by firmware
>> b) the default values set by the driver?
>>
>> Also if the firmware touches those registers shouldn't they be marked as
>> 'volatile'?
>>
> 
> The firmware was designed to work with Windows, so it looks a bit
> strange if you are coming at it from ALSA. There's not really any
> defined 'precedence'. The firmware will setup the feedback monitor paths
> to something that satisfies SDCA and Windows expectations.
> 
> We don't care about that in Linux, the firmware on the Intel DSP
> probably isn't running the same algorithms for Linux, and we have ALSA
> controls to configure those paths. So we patch the mixers back to their
> silicon defaults and take over complete control of them.
> 
> The firmware only writes them during its power-up sequence so they
> will only change when we are rebooting the firmware or coming out of
> low-power standby, which is under the control of the driver. When that
> happens regmap will re-apply the patch and then sync up the registers
> again. The firmware won't touch them after boot, so we can avoid having
> to mark them volatile (which would mean implementing our own manual
> caching of the settings).

ok, thanks for the explanations.

