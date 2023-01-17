Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE5D66DCD8
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 12:52:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73C6C6704;
	Tue, 17 Jan 2023 12:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73C6C6704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673956332;
	bh=IZXhlBrkzXWw0dVHctvOYOPG4b31ftJugED5dJsqzgs=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=c6VPTkCnp2kx3GbV6jdqXenrZ1YCoAVJMQGKwAF1NnAI92D1VGTsy2IEIu085mK1x
	 zeOf8V4O6DOlQfjtdO2igOLGcpRAlb37lBKpH/sM6bXVfvkb+ldKUjlIwv49LuJNhZ
	 IWToGMjZoX4w5g6dpkptxUX6DUE0998DYBZnS030=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4233F80083;
	Tue, 17 Jan 2023 12:51:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D9A7F804DE; Tue, 17 Jan 2023 12:51:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58958F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 12:51:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58958F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OwXywXvE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673956270; x=1705492270;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IZXhlBrkzXWw0dVHctvOYOPG4b31ftJugED5dJsqzgs=;
 b=OwXywXvEt59KYtmNic89Nqds2CHh0lBEkkfFyxNi3CJQgni/CFnMtEfS
 3FIMjXoETzmZPOhv8yRGGxD/Cx73VFlFTIeFVx/qsF5GR0ZrwPOgJE6RG
 OqC519AQ6tZdsfL7W2JTdZj05b7dx1Hj1lTKpnZlIWv/EIetAolNL1pPt
 WPn/AITmSgDHx370IfkU7LAMdtduGWMEkeUNUB5lH6k4gTgVvZo0J1fDk
 N9m1BxUF9tMmwlvx52zqa+QhVNQNdrgQMcKjwoZ8ePbuLf/CmVnUY9mdw
 bLdNj/YdmH7NJUQSSvoOtpNFGqqxQ58eUxBZSvPfaKkXJ0xO/bLRx05If w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="325950859"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="325950859"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:51:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="659366332"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="659366332"
Received: from tdnguye2-mobl.amr.corp.intel.com (HELO [10.212.127.230])
 ([10.212.127.230])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:51:04 -0800
Message-ID: <625915d5-0c2a-ce63-e71b-ff4f4f2c6d07@linux.intel.com>
Date: Tue, 17 Jan 2023 05:51:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 19/19] ASoC: amd: ps: increase runtime suspend delay
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
 <62272f17-bb97-aa10-d5d9-0914595e5431@linux.intel.com>
 <b61474ce-01a9-7602-e3c0-df8fdc5191c6@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <b61474ce-01a9-7602-e3c0-df8fdc5191c6@amd.com>
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



On 1/17/23 05:33, Mukunda,Vijendar wrote:
> On 16/01/23 20:32, Pierre-Louis Bossart wrote:
>>
>> On 1/16/23 02:35, Mukunda,Vijendar wrote:
>>> On 14/01/23 01:27, Mark Brown wrote:
>>>> On Fri, Jan 13, 2023 at 11:33:09AM -0600, Pierre-Louis Bossart wrote:
>>>>
>>>>> I do recall some issues with the codec jacks, where if the card
>>>>> registration happens too late the codec might have suspended. But we
>>>>> added pm_runtime_resume_and_get in the set_jack_detect callbacks, so
>>>>> that was solved.
>>>> Right, I would expect that whatever needs the device to be powered on
>>>> would be explicitly ensuring that this is done rather than tweaking
>>>> timeouts - the timeouts should be more of a performance thing to avoid
>>>> bouncing power too much, not a correctness thing.
>>> Machine driver probe is executed in parallel with Manager driver
>>> probe sequence. Because of it, before completion of all peripherals
>>> enumeration across the multiple links, if card registration is
>>> completed, codec register writes will fail as Codec device numbers
>>> are not assigned.
>>>
>>> If we understood correctly, as per your suggestion, We shouldn't use any
>>> time bounds in machine driver probe sequence and before registering the
>>> sound card, need to traverses through all peripheral initialization completion
>>> status for all the managers.
>> What's not clear in your reply is this:
>>
>> What codec registers are accessed as a result of the machine driver
>> probe and card registration, and in what part of the card registration?
>>
>> Are we talking about SoundWire 'standard' registers for device/port
>> management, about vendor specific ones that are exposed to userspace, or
>> vendor-specific ones entirely configured by the driver/regmap.
>>
>> You've got to give us more data or understanding of the sequence to
>> help. Saying there's a race condition doesn't really help if there's
>> nothing that explains what codec registers are accessed and when.
> We have come across a race condition, where sound card registration
> is successful before codec enumerations across all the links gets completed
> and our manager instance going into bad state.
> 
> Please refer below link for error logs.
> https://pastebin.com/ZYEN928S

You have two RT1316 register areas that are accessed while the codec is
not even enumerated:

[    2.755828] rt1316-sdca sdw:0:025d:1316:01:0: ASoC: error at
snd_soc_component_update_bits on sdw:0:025d:1316:01:0 for register:
[0x41080100] -22

[    2.758904] rt1316-sdca sdw:0:025d:1316:01:0: ASoC: error at
snd_soc_component_update_bits on sdw:0:025d:1316:01:0 for register:
[0x00003004] -110

The last one is clearly listed in the regmap list.

You probably want to reverse-engineer what causes these accesses.
I see this suspicious kcontrol definition that might be related:

	SOC_SINGLE("Left I Tag Select", 0x3004, 4, 7, 0),
