Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 484E62DAB04
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 11:41:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCE5717F3;
	Tue, 15 Dec 2020 11:40:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCE5717F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608028863;
	bh=xxh0DhMEN5NEpTvWzSFzUWZHMsJ9elWVAaAXvx8+zDw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R4kZNifiWNEcfb5Inh7/cOZQXYP7Q93DHYmONc2FETYE/k4qN0i2rta8LM4h0uyYO
	 R/cLCnECJoQUJfeR/22ILpY4brezSlaBzX3oNomtBLdenzUtBDYWrWU8Jvr69s5ISr
	 qdnOzC2yflhsSWYkEH0+AEKZlOxLJmxyKspq4kcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B400F8027B;
	Tue, 15 Dec 2020 11:39:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 668B7F80278; Tue, 15 Dec 2020 11:39:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2809F8014B
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 11:39:17 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D5834A0047;
 Tue, 15 Dec 2020 11:39:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D5834A0047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1608028756; bh=vYmMoAzsDcGbC7WpgKiQvwbvxTvxVbtBC2gNLnxAgPI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=i9ACbGHgcHX8bev/Onexa0oagPUd1ag1hJNhQMsUabWa9PQqnnj51ZQsPGXIE3I2x
 eFF9U6e5GhwQPh4uP5jm0wLebbKQARJYrbH0R9j9aJ+sRX8be5MogBZ0+UJWG82uQ3
 zVjcMPFKEMu6wBnxoQiWJfmZ+rRLOSUWX6cEpj+U=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 15 Dec 2020 11:39:04 +0100 (CET)
Subject: Re: [PATCH] ASoC: rt715: add main capture switch and main capture
 volume control
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 jack.yu@realtek.com, broonie@kernel.org, lgirdwood@gmail.com,
 Takashi Iwai <tiwai@suse.de>
References: <20201214064903.2746-1-jack.yu@realtek.com>
 <8eeddc8c-91cb-e62d-6114-547117d4d83e@perex.cz>
 <0096059b-de76-d9a3-2446-b4c3becabce8@linux.intel.com>
 <0b0afd81-0595-c661-ec1e-e81b7e8f8fec@perex.cz>
 <7d74544f-77f2-db01-db3d-d1d8a56d576d@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <cb07f528-6c2f-1357-db54-e3d062ad6dd3@perex.cz>
Date: Tue, 15 Dec 2020 11:39:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <7d74544f-77f2-db01-db3d-d1d8a56d576d@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 derek.fang@realtek.com, flove@realtek.com, shumingf@realtek.com,
 bard.liao@intel.com
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

Dne 14. 12. 20 v 18:12 Pierre-Louis Bossart napsal(a):
> Hi Jaroslav,
> 
>>>>> Add main capture switch and main capture volume for callback to be in
>>>>> single operation.
>>>>
>>>> Could you be more verbose, what you're trying to do in the patch description?
>>
>> I see that it's just additional volume coupling functionality (one control,
>> set all four output volume/switch registers, right?).
>>
>> Some points:
>>
>> 1) the separate volume controls don't send change events back to the user
>> space when the coupled capture settings is applied and versa vice - no sync
>> 2) we have already virtual master API - sound/core/vmaster.c which should
>> cover this requirement
>> 3) I don't see the purpose for this coupling (the capture direction)
> 
> That was for UCM integration - agree the context was not well captured 
> in the commit message
> 
> We have 'Capture Switch' and 'Capture Volume' statements that are 
> required, and currently mistakenly set to SOF controls when they should 
> be codec controls.
> 
> So when we have several possible inputs controls for the codec (ADC 07 
> or ADC 27) depending on the microphone settings, which one should be 
> used in UCM?
> 
> We thought this would simplify the UCM integration by adding one generic 
> control. If you have a better suggestion we are all ears.

So, it's for the microphone array with four microphones, right? Ideally there
should be one multi-channel control exported to the user space with the exact
number of the connected links in hardware. But I know, SoC has universal codec
drivers which exports the functionality without the detailed knowledge of the
controlled hardware.

For UCM (without one control for volume and switch), the situation is more
difficult, because we need to export only one volume/switch control to the
applications (abstract layer). I see the requirement to describe the more
complex control mechanism. I have an idea to extend the alsa-lib (mixer
interface) to allow this description via the alsa-lib configuration files
which may be eventually part of the UCM configuration. The nice thing is that
we can specify the custom mixer and control devices for PA already (my latest
UCM updates in PA 14.0), so there's a room to improve things in the user space.

My suggestions are (pick one):

1) create one multichannel control and remove the stereo controls when the
hardware is detected (no functionality dup)
2) create proper vmaster control like for HDA playback
3) wait until UCM can describe this hardware and set the DAC values manually
to a sensible value via sequences (the specific hardware levels can be set
using the conditions in UCM)

BTW: I see lack of analog volume level controls also for other SDW hardware
(with the RT1308 amplifier). It's a bit pitty that the audio basics are
ignored here. Everyone wants to control the analog levels at first for audio
I/O and then to modify the samples in the digital stream.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
