Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 735F9685C78
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 01:52:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81D0E1E9;
	Wed,  1 Feb 2023 01:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81D0E1E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675212764;
	bh=QpwGEpji+Y3H1fPfysmCNbiTJNwGl7Ig/3gnlx9RP1I=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=moFlbF+WtP5gn5b56xWnJNrXfkLbygtXMzcwrCy1eZKqsl7hnI/bgXt324J2k38aB
	 OfCv7/WqZkpPr8D0diW7ZabhaufPDpKIesziuoSE/lGVdnVoXz3Ey7k8sSX2Oivjza
	 dGsbmIjKJbmwkzGrWDIlOoEL1xblR81SqCEC6qHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0143F80155;
	Wed,  1 Feb 2023 01:51:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16178F804C2; Wed,  1 Feb 2023 01:51:44 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id AEB7AF800A7
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 01:51:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEB7AF800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NTI/yCil
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675212697; x=1706748697;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QpwGEpji+Y3H1fPfysmCNbiTJNwGl7Ig/3gnlx9RP1I=;
 b=NTI/yCilekIX6OneCrqgbQmsiNmLp2GkqiSw/tHomZo3HLhSyR/Ui9s6
 R67fldu5M1O7ychJRpi4ZEOLJtmW+d1GCZ81AO6cZ00HL9jDYSnS0nNi7
 2jvUmuqybhQ8QOiO8tSMlav/rbOeY05CF/mBSghcKk3w5awEKIrT/CKcl
 ItV1SMwrfUfOH4VvjTfSvj/5ZKz7p5WBMPvFdaxZcR/17kcGp7ywzNwm9
 BJt6voD+q9syB8m3c1sw3KGb60R0gHeDJlCm/mGcMOYZoLAmMb4Ho9Rod
 Rp4dbel+Z7m0h8WZPEoWNerOAAFFCqNq01AaedOyuSqCgNTJ/mipFNncn Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="329276880"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="329276880"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 16:51:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="910110566"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="910110566"
Received: from ncollins-mobl.amr.corp.intel.com (HELO [10.212.85.244])
 ([10.212.85.244])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 16:51:31 -0800
Message-ID: <c5161bc3-62cb-d0a1-2ba2-d670285b6958@linux.intel.com>
Date: Tue, 31 Jan 2023 18:51:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 01/19] ASoC: amd: ps: create platform devices based on acp
 config
Content-Language: en-US
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-2-Vijendar.Mukunda@amd.com>
 <9f2229fb-499b-f802-993b-56a7ad2ce361@linux.intel.com>
 <257b6f1e-f403-573f-3978-13ffb14342ad@amd.com>
 <2b4c12ce-2586-0277-ede0-560f8317e4e4@linux.intel.com>
 <27eabbf2-eff2-0964-b72b-f9db251c3b57@amd.com>
 <87ddd91b-fb5f-4f27-942b-dc439b32ce20@amd.com>
 <fa4cdd91-b430-eb1b-a151-d144f62e827d@linux.intel.com>
 <MN0PR12MB6101DBF0419C2C565F7F6840E2D09@MN0PR12MB6101.namprd12.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <MN0PR12MB6101DBF0419C2C565F7F6840E2D09@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: "Katragadda, Mastan" <Mastan.Katragadda@amd.com>, "Dommati,
 Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, "Saba Kareem,
 Syed" <Syed.SabaKareem@amd.com>, "kondaveeti,
 Arungopal" <Arungopal.kondaveeti@amd.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>>>>>> we should create two separate ACPI companion devices for separate
>>>>>> manager instance.  Currently we have limitations with BIOS.
>>>>>> we are going with single ACPI companion device.
>>>>>> We will update the changes later.
>>>>> Humm, this is tricky. The BIOS interface isn't something that can be
>>>>> changed at will on the kernel side, you'd have to maintain two solutions
>>>>> with a means to detect which one to use.
>>>>>
>>>>> Or is this is a temporary issue on development devices, then that part
>>>>> should probably not be upstreamed.
>>>> It's a temporary issue on development devices.
>>>> We had discussion with Windows dev team and BIOS team.
>>>> They have agreed to modify ACPI companion device logic.
>>>> We will update the two companion devices logic for two manager
>>>> instances in V2 version.
>>> After experimenting, two ACPI companion devices approach,
>>> we got an update from Windows team, there is a limitation
>>> on windows stack. For current platform, we can't proceed
>>> with two ACPI companion devices.
>>
>> so how would the two controllers be declared then in the DSDT used by
>> Windows? There's a contradiction between having a single companion
>> device and the ability to set the 'manager-number' to one.
>>
>> You probably want to give an example of what you have, otherwise we
>> probably will talk past each other.
>>>
>>> Even on Linux side, if we create two ACPI companion devices
>>> followed by creating a single soundwire manager instance per
>>> Soundwire controller, we have observed an issue in a scenario,
>>> where similar codec parts(UID are also same) are connected on
>>> both soundwire manager instances.
>>
>> We've been handling this case of two identical amplifiers on two
>> different links for the last 3 years. I don't see how this could be a
>> problem, the codecs are declared in the scope of the companion device
>> and the _ADR defines in bits [51..48] which link the codec is connected to.
>>
> 
> The problem is that there are two managers in the specified AMD design, and
> the codecs are both on "Link 0" for each manager.

You're confusing Controller and Manager.

A Manager is the same as a 'Link', the two terms are interchangeable. It
makes no sense to refer to a link number for a manager because there is
no such concept.

Only a Controller can have multiple links or managers. And each
Controller needs to be declared as an ACPI device if you want to use the
DisCo properties.

The Managers/Links are not described as ACPI devices, that's a
regrettable design decision made in MIPI circles many moons ago, that's
why in the Intel code we have to manually create auxiliary devices based
on the 'mipi-sdw-master-count' property.

> So the _ADR really is identical for both.

That cannot possible work, even for Windows. You need to have a
controller scope, and the _ADR can then be identical for different
peripherals as long as this ADR is local to a controller scope.

