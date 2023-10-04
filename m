Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C85AE7B8185
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 15:59:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A721B84B;
	Wed,  4 Oct 2023 15:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A721B84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696427968;
	bh=3SSmzrdVmTT6GBfds2/816bKP42VZdCHe8cLBHXrSF0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kjnlGEZavdaPlaMM+n07ix/xNX4eD578EQpdNPhZQgrUx5g9S3hqJ20XDdtkjGJF9
	 Y0gi68f51PTML2xaO15ijqDJXADzkiaueq55ChhPpRgGPvnP9VfwwjB+h0JI6dCJPy
	 AUtICsEEIoLYDLDd4F//jpLDk5elGLj9HLD/qRs4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA546F80557; Wed,  4 Oct 2023 15:58:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46367F80310;
	Wed,  4 Oct 2023 15:58:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C5B8F8047D; Wed,  4 Oct 2023 15:58:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 419E1F80130
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 15:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 419E1F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gWC2BU71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696427910; x=1727963910;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3SSmzrdVmTT6GBfds2/816bKP42VZdCHe8cLBHXrSF0=;
  b=gWC2BU7183e3fjkwZyqYouCluj3HMMf3KZJmOVude1+AkJdksYzVVjZk
   iyMPE+R1OSoub1WFG68TE0wlULz4b9TqsZsm83ifvIzHR6E2RtLOtiVNf
   0GC/hbSO4MxSsJ1WG548BSglOixNMveo4Fwza165GOP70SAnTQFFgo/EC
   Lq04xEi+hMfCnBW51BdcW8EdbkPD4MKpdCbhIDyKcqLvQkz9qi+qgUtgl
   R1uHm/U4vtSV87zze/ods+juKTtWr+sg/lF4QHkP1InVPILqzfQtjFNAX
   XF7dxufPwDjas5cUqbFZl/QOZjc/pC6VPZiLDnqtk7jsKAqH9kE21KgKY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363442893"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200";
   d="scan'208";a="363442893"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 06:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="894959510"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200";
   d="scan'208";a="894959510"
Received: from mfmousa-mobl1.amr.corp.intel.com (HELO [10.212.98.56])
 ([10.212.98.56])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 06:56:24 -0700
Message-ID: <624b044a-1f0f-4961-8b57-cb5346e7b0d3@linux.intel.com>
Date: Wed, 4 Oct 2023 09:57:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: fix initializing sysfs for same devices on
 different buses
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Philippe Ombredanne <pombredanne@nexb.com>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20231004130243.493617-1-krzysztof.kozlowski@linaro.org>
 <6628a5f6-ed22-4039-b5c2-2301c05c7e3e@linux.intel.com>
 <2023100453-perfected-palm-3503@gregkh>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2023100453-perfected-palm-3503@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OZHH5NYOXMBNQXZT526KRQY4Q66YFHDZ
X-Message-ID-Hash: OZHH5NYOXMBNQXZT526KRQY4Q66YFHDZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZHH5NYOXMBNQXZT526KRQY4Q66YFHDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/4/23 09:38, Greg Kroah-Hartman wrote:
> On Wed, Oct 04, 2023 at 09:16:47AM -0400, Pierre-Louis Bossart wrote:
>>
>>
>> On 10/4/23 09:02, Krzysztof Kozlowski wrote:
>>> If same devices with same device IDs are present on different soundwire
>>> buses, the probe fails due to conflicting device names and sysfs
>>> entries:
>>>
>>>   sysfs: cannot create duplicate filename '/bus/soundwire/devices/sdw:0:0217:0204:00:0'
>>>
>>> The link ID is 0 for both devices, so they should be differentiated by
>>> bus ID.  Add the bus ID so, the device names and sysfs entries look
>>> like:
>>
>> I am pretty sure this will break Intel platforms by changing the device
>> names.
>>
>> sof_sdw.c:      else if (is_unique_device(adr_link, sdw_version, mfg_id,
>> part_id,
>> sof_sdw.c:
>> "sdw:%01x:%04x:%04x:%02x", link_id,
>> sof_sdw.c:
>> "sdw:%01x:%04x:%04x:%02x:%01x", link_id,
> 
> device id name changes shouldn't break things, what is requring them to
> look a specific way?

it's the ASoC dailink creation that relies on strings, we have similar
cases for I2C.

There's no requirement that the name follows any specific convention,
just that when you want to rely on a specific device for an ASoC card
you need to use the string that matches its device name.

I am not sure how we would modify the Intel machine driver though
because the bus ID is IDA-based, so there's no way to predict what it
might be.
