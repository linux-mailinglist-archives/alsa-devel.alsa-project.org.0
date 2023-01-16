Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C9266CE5F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 19:07:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BDEC5989;
	Mon, 16 Jan 2023 19:06:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BDEC5989
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673892462;
	bh=N8T9dC4MhCj1V1rc1Oi3oPDU4pzVY12HeNUEeFyLyCE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AOHgpDSUAmA24b7uBgR9ZXgq0kpCHupOsG3/9dBvnb/iyS4NaeUofB57XRfxDc1T8
	 EsKtSwPWcRyUMJmhVre+nELIsnwlCRGFcFz7Ub95i6+IDCdfEE5FWFWqq3kvlViQU4
	 SwuNPpycxdbxnhR0Raq7aip9QC8tdmjNf4anfqu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5A74F80240;
	Mon, 16 Jan 2023 19:06:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 036F2F804BC; Mon, 16 Jan 2023 19:06:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DATE_IN_PAST_03_06,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46F17F80083
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 19:06:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46F17F80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=m4fORAOP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673892370; x=1705428370;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=N8T9dC4MhCj1V1rc1Oi3oPDU4pzVY12HeNUEeFyLyCE=;
 b=m4fORAOPO33klZczhhkdVLuXO0tbrq0CF0iEfbZQg2TyL88YTZi/lb4Y
 AhiBo/UYEIXCYfgDFTaPyr69Jyeo9kYo0/qKczkW/BroD+4IByh4CgHHg
 kUgEpRxNv/ft/9ZUwWSuZg9IedEnV0SSCtu2FuiZpME97nvvlgAVBtZNx
 HlebHbF2RldF0IVAnXFX2oLHu0hULTIoqRHKf36PcYDP4zNKrEoZFRr8F
 Dg3XM0kNUzQwPLmgnCwaBUaV2bIBcvZXh8O1/PG7niXnigFd/vvlKG3QA
 +fp+XB24CkyuTWuktKUl38Pf9Oh28lhw9Cmtedk3e5vN6Z9yHDn4HZ0NB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="351767495"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="351767495"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 10:06:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="766987458"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="766987458"
Received: from mahdiahm-mobl1.amr.corp.intel.com (HELO [10.213.173.94])
 ([10.213.173.94])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 10:06:01 -0800
Message-ID: <62272f17-bb97-aa10-d5d9-0914595e5431@linux.intel.com>
Date: Mon, 16 Jan 2023 09:02:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 19/19] ASoC: amd: ps: increase runtime suspend delay
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Mark Brown <broonie@kernel.org>
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-20-Vijendar.Mukunda@amd.com>
 <c7f018e3-c8be-6819-0ece-244bfb943c62@linux.intel.com>
 <0aaf3fa5-bcf1-ec06-8f78-c61e8809398e@amd.com>
 <5a34e6f7-eaf1-8128-81e4-81f65541d9a8@linux.intel.com>
 <1a14e117-4216-b98d-f972-c9a02cf79d1e@amd.com>
 <eb12ed5d-a9f9-cb8d-28f5-ac84c75cf441@linux.intel.com>
 <90782037-109b-b197-ca17-b7d199931f7d@amd.com>
 <e73032b1-ac5b-4a3a-e2a0-8ac121853dee@linux.intel.com>
 <Y8G3mPUDWWUu/3ZR@sirena.org.uk>
 <ef05d550-c2aa-e256-58ec-612c2a3294ca@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ef05d550-c2aa-e256-58ec-612c2a3294ca@amd.com>
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
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, vkoul@kernel.org, "Limonciello,
 Mario" <mario.limonciello@amd.com>, arungopal.kondaveeti@amd.com,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/16/23 02:35, Mukunda,Vijendar wrote:
> On 14/01/23 01:27, Mark Brown wrote:
>> On Fri, Jan 13, 2023 at 11:33:09AM -0600, Pierre-Louis Bossart wrote:
>>
>>> I do recall some issues with the codec jacks, where if the card
>>> registration happens too late the codec might have suspended. But we
>>> added pm_runtime_resume_and_get in the set_jack_detect callbacks, so
>>> that was solved.
>> Right, I would expect that whatever needs the device to be powered on
>> would be explicitly ensuring that this is done rather than tweaking
>> timeouts - the timeouts should be more of a performance thing to avoid
>> bouncing power too much, not a correctness thing.
> Machine driver probe is executed in parallel with Manager driver
> probe sequence. Because of it, before completion of all peripherals
> enumeration across the multiple links, if card registration is
> completed, codec register writes will fail as Codec device numbers
> are not assigned.
> 
> If we understood correctly, as per your suggestion, We shouldn't use any
> time bounds in machine driver probe sequence and before registering the
> sound card, need to traverses through all peripheral initialization completion
> status for all the managers.

What's not clear in your reply is this:

What codec registers are accessed as a result of the machine driver
probe and card registration, and in what part of the card registration?

Are we talking about SoundWire 'standard' registers for device/port
management, about vendor specific ones that are exposed to userspace, or
vendor-specific ones entirely configured by the driver/regmap.

You've got to give us more data or understanding of the sequence to
help. Saying there's a race condition doesn't really help if there's
nothing that explains what codec registers are accessed and when.
