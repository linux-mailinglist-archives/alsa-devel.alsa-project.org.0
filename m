Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A85C6667A57
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 17:07:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C14A937F;
	Thu, 12 Jan 2023 17:06:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C14A937F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673539657;
	bh=zlUUNC+cARovNFjA+Q1H4jS02JPtBf+LVmgjBr5WeUE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DYQbrcdI1pEBriiDbVh5b6DalNs8Ba3cgakuXuejFWQRvA88xwUvEfB0KorXhVQEI
	 KGuhszFQFDt/wg62FcYdrybj011ZKfZf9rTLrHU7CbnMKacrawsoN2lPx3yHyrSqw2
	 9qBrb4iJY1aHHbTx6cfNWrrnxKnVYUR5NhVtj4nA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD6E0F804CA;
	Thu, 12 Jan 2023 17:06:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D7EEF804BD; Thu, 12 Jan 2023 17:06:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ADA1F8019B
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 17:06:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ADA1F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=k2lF7PaK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673539596; x=1705075596;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zlUUNC+cARovNFjA+Q1H4jS02JPtBf+LVmgjBr5WeUE=;
 b=k2lF7PaKfzXCL7DGqei0tinvLsPfxzAjgSU6cKVGHKH+UGFsr3ErSBsk
 FxSBhPUq4tCahBRNA/4MW2b97J4un0X6zRUlARY8pQMJ+cQk+UvknjXXe
 hwPoYalBLCRf4j1UtqoCP+5Zd2GEyzfoE4P/Jtv6WkBygREwuY2URy2uw
 Q/v6wSxdrCtsfMiLSjhZZIqLlM1SIWuTy3LIbw1DSazgBfPGA8SSwMRpH
 Wa2bBHCi9d1IguYPyVe1sFxiAf/WDEmIDhYzfrIYgkcUYXdq9aDpog6BI
 h2cvvWgMzTtdjHw9d+8a2iQUQp9Cz73JrCW+PqaD38ON2NDvb3oy86J35 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="350971808"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="350971808"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 08:05:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="903257591"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="903257591"
Received: from jbetan3x-mobl1.amr.corp.intel.com (HELO [10.209.143.163])
 ([10.209.143.163])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 08:05:37 -0800
Message-ID: <eb12ed5d-a9f9-cb8d-28f5-ac84c75cf441@linux.intel.com>
Date: Thu, 12 Jan 2023 10:05:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 19/19] ASoC: amd: ps: increase runtime suspend delay
Content-Language: en-US
To: "Limonciello, Mario" <mario.limonciello@amd.com>,
 "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-20-Vijendar.Mukunda@amd.com>
 <c7f018e3-c8be-6819-0ece-244bfb943c62@linux.intel.com>
 <0aaf3fa5-bcf1-ec06-8f78-c61e8809398e@amd.com>
 <5a34e6f7-eaf1-8128-81e4-81f65541d9a8@linux.intel.com>
 <1a14e117-4216-b98d-f972-c9a02cf79d1e@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1a14e117-4216-b98d-f972-c9a02cf79d1e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, arungopal.kondaveeti@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/12/23 09:29, Limonciello, Mario wrote:
> On 1/12/2023 08:54, Pierre-Louis Bossart wrote:
>>
>>
>> On 1/12/23 05:02, Mukunda,Vijendar wrote:
>>> On 11/01/23 21:32, Pierre-Louis Bossart wrote:
>>>> On 1/11/23 03:02, Vijendar Mukunda wrote:
>>>>> To avoid ACP entering into D3 state during slave enumeration and
>>>>> initialization on two soundwire controller instances for multiple
>>>>> codecs,
>>>>> increase the runtime suspend delay to 3 seconds.
>>>> You have a parent PCI device and a set of child devices for each
>>>> manager. The parent PCI device cannot suspend before all its children
>>>> are also suspended, so shouldn't the delay be modified at the
>>>> manager level?
>>>>
>>>> Not getting what this delay is and how this would deal with a lengthy
>>>> enumeration/initialization process.
>>> Yes agreed. Until Child devices are suspended, parent device will
>>> be in D0 state. We will rephrase the commit message.
>>>
>>> Machine driver node will be created by ACP PCI driver.
>>> We have added delay in machine driver to make sure
>>> two manager instances completes codec enumeration and
>>> peripheral initialization before registering the sound card.
>>> Without adding delay in machine driver will result early card
>>> registration before codec initialization is completed. Manager
>>> will enter in to bad state due to codec read/write failures.
>>> We are intended to keep the ACP in D0 state, till sound card
>>> is created and jack controls are initialized. To handle, at manager
>>> level increased runtime suspend delay.
>>
>> This doesn't look too good. You should not assume any timing
>> dependencies in the machine driver probe. I made that mistake in earlier
>> versions and we had to revisit all this to make sure drivers could be
>> bound/unbound at any time.
> 
> Rather than a timing dependency, could you perhaps prohibit runtime PM
> and have a codec make a callback to indicate it's fully initialized and
> then allow runtime PM again?

We already have enumeration and initialization 'struct completion' that
are used by codec drivers to know if the hardware is usable. We also
have pm_runtime_get_sync() is the bus layer to make sure the codec is
resumed before being accessed.

The explanations above confuse card registration and manager
probe/initialization. These are two different things. Maybe there's
indeed a missing part in the SoundWire PM assumptions, but I am not
getting what the issue is.

