Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A94358D9B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 21:43:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D02B1661;
	Thu,  8 Apr 2021 21:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D02B1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617911018;
	bh=ALwb1h9XlXglBz5C88RlEOJqpVyKiZPBX8KPDh7irQw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aZX/+q9i9GaSJon7zhGaenqoP7kdDghzNVt+XzJbX7MWhJ8tsTTwwjqt59fvyrJgn
	 ek9EHjyGFtcIfERuwg5TBvUo65vOXTz5bZOUFgm66tUPZLvyXBx0zeGzHGU0GwwYiG
	 WxgJN4soInGNeQRsCaxPecUcJZNPGhjb5yysW86o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DB06F80246;
	Thu,  8 Apr 2021 21:42:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B18E7F8020B; Thu,  8 Apr 2021 21:42:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B86DBF8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 21:41:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B86DBF8012F
IronPort-SDR: lGBIJsecJmfNgqojvx3TAHQn/OMNqS87Iy6w+JGGttIMW9dtm0CWZLNWVhsV06uX14ESdL3wt2
 1j2zwECYv2ug==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="254953366"
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; d="scan'208";a="254953366"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 12:41:56 -0700
IronPort-SDR: pg2zF0taXnosx1aw6sqKFTXidx/mtD7zUuTQkd8Zdvm/W0JwSHnVkGLv8/iCrHEBedSevMAPJ9
 71U3AHO/yOqg==
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; d="scan'208";a="458958304"
Received: from kritiaga-mobl.amr.corp.intel.com (HELO [10.212.59.29])
 ([10.212.59.29])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 12:41:55 -0700
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>,
 Mark Brown <broonie@kernel.org>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
 <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
 <3107db1d-f97d-539a-05db-6f880b762f00@linux.intel.com>
 <3b33595e-777c-90b2-6d65-346c9bf6e003@perex.cz>
 <b0258a67-79ca-50cd-e6c5-74514ba8a3c5@linux.intel.com>
 <73f65944-604e-1ca0-5ba3-dcbec0d9fcd7@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a8fa564f-4ab5-9847-d041-6c851e48acb4@linux.intel.com>
Date: Thu, 8 Apr 2021 14:41:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <73f65944-604e-1ca0-5ba3-dcbec0d9fcd7@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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




>>> Yes, I'm talking about rules which depends on the sound driver specific sysfs
>>> attributes (you can match the modified /sys/module/*/parameters here).
>>
>> you lost me with 'match the modified parameters' wording. who matches
>> and who modifies those parameters?
> 
> You can probably add something like this to the sound-card.rules:
> 
> SUBSYSTEMS=="pci",ATTR{device/driver/module}=="snd_soc_sof_sdw",
>    ATTR{device/driver/module/../snd_sof_pci/parameters/tplg_path}=="intel/sof-tplg/pdm1",
>    DO_SOMETHING_HERE
> 
> DO_SOMETHING_HERE may be ATTR{longname}="My Long Name" for example when my change is accepted.

Humm, not sure this can work due to dependencies.

The machine device is neither an ACPI nor PCI one. It's a platform device.

When the PCI device is detected, the PCI core will call the SOF driver 
probe, which will first try and boot the firmware, and then create the 
platform device. That results in the probe of the machine driver which 
creates the card, but that happens *after* booting the firmware.

the DSP firmware is setup starting here:

https://elixir.bootlin.com/linux/latest/source/sound/soc/sof/core.c#L138

and the machine device is created almost last, after registering the 
ASoC components.

https://elixir.bootlin.com/linux/latest/source/sound/soc/sof/core.c#L234

when the card is created, it's too late to change the firmware path or 
any firmware-related parameters.


