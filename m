Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A81D322E87
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 17:16:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B74C83D;
	Tue, 23 Feb 2021 17:15:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B74C83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614096981;
	bh=Uy4PIVwtYaWNX09+fki5nXDuc1vuRQVSsJdnAsob6no=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cWrDeVZvzWkaTTM/jK6wrIr1IOM7sR82H/IuQv2a4+vppx2RuMI8lU3Z+TCvmPXSI
	 XDrATVsZXu1k88GpxeLWDvjLvu1toNbZOHr5MQ2lCaOvgKK7iDth8as7H3/5bjp0W4
	 XtZ9BAVFs8uxkYaRUUNuYCqlQkq6JyuZF2cG+das=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E916F800B4;
	Tue, 23 Feb 2021 17:14:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4322F8016A; Tue, 23 Feb 2021 17:14:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CD46F800B4
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 17:14:40 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0AF4EA0040;
 Tue, 23 Feb 2021 17:14:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0AF4EA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1614096880; bh=ax1aKJSAD4BOF7vqcdtMsHOOp4tohziyU8gieTSC7Nw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QQhdtXmHZdIbGAXXyuW+ojjRyY17zzZ/yL2zotRRaLBbDllkyvbhWjJR1EWejj5K0
 HUFHD5F3p4Vi5zzrc8dfLRvwupJoD5zLfT7mDXOTAg6MAAmLcafrjo7FY2/4xgHYmd
 x0kz4eyD3OicP6wI7b31PzWNgM0Oc718ekhNikVQ=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 23 Feb 2021 17:14:32 +0100 (CET)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20210215142419.308651-1-hdegoede@redhat.com>
 <20210215142419.308651-3-hdegoede@redhat.com>
 <20210223134506.GF5116@sirena.org.uk>
 <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
 <20210223140930.GH5116@sirena.org.uk> <s5h8s7evp8p.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
Date: Tue, 23 Feb 2021 17:14:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5h8s7evp8p.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bard.liao@intel.com>
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

Dne 23. 02. 21 v 15:21 Takashi Iwai napsal(a):
> On Tue, 23 Feb 2021 15:09:30 +0100,
> Mark Brown wrote:
>>
>> On Tue, Feb 23, 2021 at 02:59:17PM +0100, Hans de Goede wrote:
>>> On 2/23/21 2:45 PM, Mark Brown wrote:
>>>> On Mon, Feb 15, 2021 at 03:24:19PM +0100, Hans de Goede wrote:
>>
>>>> Why just these particular controls - what if a system has separate mutes
>>>> for speakers or something?
>>
>>> These are the main volume controls, which are always in the output / input
>>> path independent on if we are outputting to e.g. speakers or the headphones.
>>
>>> We want to use the main volume control for this, because there always is
>>> only 1 output mute LED and 1 input mute LED. Well at least that is the assumption
>>> the current ledtrig-audio.c code has.
>>
>>> The idea is to only turn the single LED on if we are sure there will be not
>>> sound output on any of the outputs, which is why we tie the LED to the
>>> mute switch on the main volume control.
>>
>> Right, so that might work well on your particular system with your
>> particular configuration but will it work well on other systems with
>> different hardware?  It's not clear to me that it makes sense to go
>> through all the drivers picking controls that might be used for this
>> purpose - it seems both time consuming and error prone.  Consider a
>> mostly digital device which has an ADC/DAC per input/output rather than
>> a central ADC/DAC with analogue muxing for example, or a system with
>> multiple DACs available for mixing together or analogue bypassess.  
> 
> That's one of my concerns in the recent actions for putting the
> hard-coded mute LED controls.  So far, the only usage of led-audio
> trigger is HD-audio, and it's enabled only for selected devices and
> setups.  OTOH, if we apply the audio-led trigger generically in ASoC
> codec driver, it's always done and might misfit; e.g. what happens if
> two codecs are present on the system?.

That's the abstraction issue. We can use PCI, ACPI, DMI or DT checks at the
_right_ place (machine top-level code) to mark those controls with the LED
flags in the kernel space. I've never said that the right place is the generic
ASoC codec driver.

On the other hand, rt5670 is really multi-purpose codec like HDA codecs with
the recommended usage/routing from the designer, so it might make sense to add
the default LED marking as we do for HDA.

> Of course, this implementation would make the integration much easier,
> and that's a big benefit.  So I have a mixed feeling and not decided
> yet whether we should go for it right now...

I think that we can reconsider the LED handling implementation later, when
someone brings something better on the table.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
