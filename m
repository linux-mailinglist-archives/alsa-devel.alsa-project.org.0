Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1A03A3E89
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 11:04:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAEC118DA;
	Fri, 11 Jun 2021 11:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAEC118DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623402280;
	bh=JqbtNJF61fr8Mx3C3StouffVjcDz8WLINzmGYpG2EGc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gahyIniRxXamXe+/mK4bD2KaVaG2MOBrm7RUu7+a0NXrHzYz0VEyu9xR6BTBtlwAl
	 k93uU/aIqFG1IZ84hmy4U/vHPqnPCyY8ppnXpEI2WtFe8jGXLS3Ua/znhFFLXc/0re
	 TrII9ZE42kkhMyJEW37FINqWGe3tsuhilVEHOnP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FE6BF800FB;
	Fri, 11 Jun 2021 11:03:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 649AAF8026C; Fri, 11 Jun 2021 11:03:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_21,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDAA6F800FC
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 11:03:03 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id EF0B4A003F;
 Fri, 11 Jun 2021 11:03:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz EF0B4A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1623402182; bh=LF7VREXsNpgR4InF0ZFKSX1KuAerwZ/nQSZxkG5fktA=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=JfdVZKKd2z09N8WZdHu8RotfqllIViAR+dSWL6naYHSXWaprOWPss9RUEpz5wf9/N
 1F1oD4ZNRTfRUAZY0YCjuDK56rUBzVsFY0DmR/RUTPvB95RBWgIBzEYwDE92ET78SB
 7sk0Ilbl8hxJnvxoIX0QtpheKRlXTo0T4w40bo0s=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 11 Jun 2021 11:02:57 +0200 (CEST)
Subject: Re: [PATCH 0/8] ASoC: SOF: power optimizations for HDaudio platforms
To: alsa-devel@alsa-project.org
References: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
 <s5hczss96jp.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <482fc9a8-3a27-2e5d-f280-c891832eb467@perex.cz>
Date: Fri, 11 Jun 2021 11:02:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <s5hczss96jp.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 11. 06. 21 9:58, Takashi Iwai wrote:
> On Thu, 10 Jun 2021 22:53:18 +0200,
> Pierre-Louis Bossart wrote:
>>
>> This patchset provides two optimizations that result in significant power
>> savings on Intel HDAudio platforms using SOF (Sound Open Firmware).
>>
>> a) We previously prevented the Intel DSP from enabling the DMI_L1
>> capability to work-around issues with pause on capture streams. It
>> turns out that this also prevented the platform from entering high C
>> states in full-duplex usages such as videoconferencing - a rather
>> basic use case since the start of the pandemic. The support for
>> pause_push/release was already a bit controversial for Intel
>> platforms, in theory platforms should only enable PAUSE if they can
>> resume on the same sample, which is not the case on any Intel
>> platform. Since we didn't want to disable a capability that could
>> impact existing users, the suggestion is to optionally disable
>> pause_push/release at build time or via a kernel parameter, in which
>> case DMI_L1 is enabled. In practice very few applications make use of
>> pause_push/release so there should be a limited impact when disabling
>> this ALSA capability.
>>
>> b) The use of the SPIB register also helps reduce power consumption,
>> though to a smaller degree than DMI_L1. This hardware capability is
>> however incompatible with userspace-initiated rewinds typically used
>> by PulseAudio. In the past (2015..2017) Intel suggested an API
>> extension to let applications disable rewinds. At the time the
>> feedback was that such a capability was too Intel-specific and SPIB
>> remained unused except for loading DSP code. We now see devices with
>> smaller batteries being released, and it's time to revisit Linux
>> support for SPIB to extend battery life. In this update the rewinds
>> are disabled either at build-time or via a kernel parameter. As
>> suggested by Takashi, a new SDNDRV_PCM_INFO flag is needed though to
>> make sure the appl_ptr value is provided to the driver through the
>> .ack callback. Distributions using PipeWire (Fedora34) and CRAS
>> (ChromeOS/Chromium) can safely enable this option. Distributions using
>> PulseAudio should probably avoid enabling it, although nothing is
>> really fundamentally broken if they do. While in theory volume updates
>> and mixing of notifications could be delayed, in practice
>> distributions use small ring buffers that make such delays difficult
>> to notice.
>>
>> Again both of these updates are opt-in to avoid any impact on existing
>> solutions or users: someone updating their kernel source but using
>> 'make olddefconfig' will see the same results. Distributions that care
>> neither about pause_push/release or rewinds should enable both
>> options, in case of issues users will still be able to override
>> these build-time choices with a simple module parameter.
> 
> Hmm, in general it's not easy for distros to decide which kconfig to
> take because most of distros ship both PulseAuadio and pipweire.
> It's rather the runtime choice, even different for each user at
> starting a different DE session, hence a kconfig or a module config
> doesn't fit well.
> 
> That said, it comes to the question about the severity of the change:
> how badly would behave if we disable the rewind?  If the influence is
> limited, distros can take it as a cost of the better power-saving
> (which is often preferred).  If PA's behavior change is significant,
> the option is way too dangerous, and it's hard to set as default.

I would prefer to add a new API which will tell that the rewind support
consumes more energy (is costly) and let apps to disable this feature when the
user agreed. We should create an universal API without any sound server /
application assumptions. We don't know beforehand, if users want the ultra low
latencies for a purpose or they want to save the battery power.

The same objection is for the pcm mmap control suppression / pause trigger
suppression.

The pulseaudio / pipewire code can be extended and it's better if both sides
(driver / apps) agree on the protocol.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
