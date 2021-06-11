Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 342433A4420
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 16:34:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3472193C;
	Fri, 11 Jun 2021 16:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3472193C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623422039;
	bh=kVHLBOJHpicI42IntEt+s7AAxymR4JnAYh6jPnOhk7I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V2m/TfrU/NVqsLnJjuD5Cjtjbf0R6wjO16iA2bMVzxV+R4w8u4jq2A9M9/9xFoN4K
	 hOC/kb5SILaIQEPPA+h1x/ttVexF6yaSbFr0t2AteUk6GDWaKHiT7APY2w2/+/1e4J
	 YsGYvP27/G/a+Im8RiH2RDxr2wIA5aJL0lG5DriI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01242F800FB;
	Fri, 11 Jun 2021 16:32:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F830F800FB; Fri, 11 Jun 2021 16:32:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=NICE_REPLY_A,PRX_BODY_64,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECDC6F800FC
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 16:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECDC6F800FC
IronPort-SDR: vbdTbABZ5jL/m6MMmryRMYSepFDE4MhavZ22639cOiHFxKbXcEo156HchzvQYh5+ZwAPNcUHHj
 OKAVuFeeFjDg==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="205351757"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="205351757"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 07:32:17 -0700
IronPort-SDR: Odyv6Jz9MXr9gbEI+27GmObUuwGt0axLlu1tRdJVZAG6UzvXd3+yZykMjIofgX60qpYxu2CFFR
 TuqzyFjTXI3A==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="638704214"
Received: from dcpalomx-mobl4.amr.corp.intel.com (HELO [10.209.153.29])
 ([10.209.153.29])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 07:32:16 -0700
Subject: Re: [PATCH 0/8] ASoC: SOF: power optimizations for HDaudio platforms
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
 <s5hczss96jp.wl-tiwai@suse.de>
 <482fc9a8-3a27-2e5d-f280-c891832eb467@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <eda25058-5a19-31e9-d012-627c2afe88f1@linux.intel.com>
Date: Fri, 11 Jun 2021 09:32:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <482fc9a8-3a27-2e5d-f280-c891832eb467@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
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

Thanks Takashi and Jaroslav for your feedback

>> Hmm, in general it's not easy for distros to decide which kconfig to
>> take because most of distros ship both PulseAuadio and pipweire.
>> It's rather the runtime choice, even different for each user at
>> starting a different DE session, hence a kconfig or a module config
>> doesn't fit well.
>>
>> That said, it comes to the question about the severity of the change:
>> how badly would behave if we disable the rewind?  If the influence is
>> limited, distros can take it as a cost of the better power-saving
>> (which is often preferred).  If PA's behavior change is significant,
>> the option is way too dangerous, and it's hard to set as default.

I've personally tried mucking with PulseAudio and didn't see any side 
effects. We do know that by design the effects of rewinds become 
significant if the HDAudio ring buffer becomes large (e.g 0.5..2s), but 
most distros keep the default size.

> I would prefer to add a new API which will tell that the rewind support
> consumes more energy (is costly) and let apps to disable this feature when the
> user agreed. We should create an universal API without any sound server /
> application assumptions. We don't know beforehand, if users want the ultra low
> latencies for a purpose or they want to save the battery power.
> 
> The same objection is for the pcm mmap control suppression / pause trigger
> suppression.
> 
> The pulseaudio / pipewire code can be extended and it's better if both sides
> (driver / apps) agree on the protocol.

When I suggested an API extension (initial code in 2015) precisely to 
establish a 'contract' between userspace and driver, the answer from 
Takashi was this:

https://lore.kernel.org/alsa-devel/s5ha7uq7icw.wl-tiwai@suse.de/

"let's begin with the driver-specific implementation, and extend to API 
level once when we see what are the real demands in wide range of hardware."

What I am suggesting here is precisely the driver-specific implementation.

If both of you now prefer an API extension that's fine with me, that's 
what I preferred all along :-)

It's no big deal to bolt a userspace choice on top of those changes, but 
maybe we can do this as a second step?

I can remove the kconfig changes and only add kernel parameters in the 
mean time so that only early adopters make that selection. In a second 
step, these kernel parameters can be removed when applications make use 
of the new API extension.

Would this work for you?

I just want to stress that both of these changes result in significant 
power savings on Intel platforms. The world has changed since 2015 and 
the push to smaller batteries/longer battery life makes both of these 
changes very desirable. It's no longer an architecture-driven effort to 
enable new features, it's backed by real-world measurements on customer 
devices (which I can only disclose under NDA and not on a public mailing 
list obviously).
