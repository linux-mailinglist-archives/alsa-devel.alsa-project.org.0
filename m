Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5543A4599
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 17:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A95D1A98;
	Fri, 11 Jun 2021 17:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A95D1A98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623425978;
	bh=0DHG332dkKxFIS/RA0a6vd5iUuqCvtSjDr7TNOhnhtI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fZ/cwr1/rs1eaSw3TV0O+gNygj7cfeCUlcSlCfJA5tB5jP9z/hMoue10MZK0MttKy
	 nrszzDKm8QZP4MnxTfGAFsto4JB43SGFBO3SZ6TyCtrVJHMXNkwDa/+L5//oGR3QNx
	 Mrg3/nnCQpQzwRCDQHq7q22ZB2W/ZeUT+YEtvc9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8BA7F800FB;
	Fri, 11 Jun 2021 17:38:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8AAAF8026C; Fri, 11 Jun 2021 17:38:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 665C2F80149
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 17:38:02 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CAA6AA003F;
 Fri, 11 Jun 2021 17:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CAA6AA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1623425881; bh=TDmqHjX+VxCTt2UqdPYcbYvbbFeXQHAQbbhs9SkxFcs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FYVM7tezrTwAkYqrIRPNJeQquJVXkwiARsqc0IJK9yH285XS0qfaOf8ygDvmUgS+P
 Z40ZRxn8Xe8KVZVux9pp9jg0Es6HhwGNrg2LdRddpc+Le3y33z0LtBRKcwHpmU56Wv
 3kxFkZI1yhwTK5COIbasftneBRZfD1+glASXahuM=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 11 Jun 2021 17:37:57 +0200 (CEST)
Subject: Re: [PATCH 0/8] ASoC: SOF: power optimizations for HDaudio platforms
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
 <s5hczss96jp.wl-tiwai@suse.de>
 <482fc9a8-3a27-2e5d-f280-c891832eb467@perex.cz>
 <eda25058-5a19-31e9-d012-627c2afe88f1@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <1f71ec67-041e-d2fc-3527-5542d8982e00@perex.cz>
Date: Fri, 11 Jun 2021 17:37:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <eda25058-5a19-31e9-d012-627c2afe88f1@linux.intel.com>
Content-Type: text/plain; charset=utf-8
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

On 11. 06. 21 16:32, Pierre-Louis Bossart wrote:
> Thanks Takashi and Jaroslav for your feedback
> 
>>> Hmm, in general it's not easy for distros to decide which kconfig to
>>> take because most of distros ship both PulseAuadio and pipweire.
>>> It's rather the runtime choice, even different for each user at
>>> starting a different DE session, hence a kconfig or a module config
>>> doesn't fit well.
>>>
>>> That said, it comes to the question about the severity of the change:
>>> how badly would behave if we disable the rewind?  If the influence is
>>> limited, distros can take it as a cost of the better power-saving
>>> (which is often preferred).  If PA's behavior change is significant,
>>> the option is way too dangerous, and it's hard to set as default.
> 
> I've personally tried mucking with PulseAudio and didn't see any side 
> effects. We do know that by design the effects of rewinds become 
> significant if the HDAudio ring buffer becomes large (e.g 0.5..2s), but 
> most distros keep the default size.
> 
>> I would prefer to add a new API which will tell that the rewind support
>> consumes more energy (is costly) and let apps to disable this feature when the
>> user agreed. We should create an universal API without any sound server /
>> application assumptions. We don't know beforehand, if users want the ultra low
>> latencies for a purpose or they want to save the battery power.
>>
>> The same objection is for the pcm mmap control suppression / pause trigger
>> suppression.
>>
>> The pulseaudio / pipewire code can be extended and it's better if both sides
>> (driver / apps) agree on the protocol.
> 
> When I suggested an API extension (initial code in 2015) precisely to 
> establish a 'contract' between userspace and driver, the answer from 
> Takashi was this:
> 
> https://lore.kernel.org/alsa-devel/s5ha7uq7icw.wl-tiwai@suse.de/
> 
> "let's begin with the driver-specific implementation, and extend to API 
> level once when we see what are the real demands in wide range of hardware."
> 
> What I am suggesting here is precisely the driver-specific implementation.
> 
> If both of you now prefer an API extension that's fine with me, that's 
> what I preferred all along :-)
> 
> It's no big deal to bolt a userspace choice on top of those changes, but 
> maybe we can do this as a second step?
> 
> I can remove the kconfig changes and only add kernel parameters in the 
> mean time so that only early adopters make that selection. In a second 
> step, these kernel parameters can be removed when applications make use 
> of the new API extension.
> 
> Would this work for you?

Thinking more, my main objection is that we cannot change the runtime
behaviour after the drivers are loaded in an easy way. I think that the
current default settings should be kept without any Kconfig extensions. The
module options are always good for the debugging, so they're fine in my eyes.

I see the Takashi's arguments, too.

Perhaps, it may be acceptable to add a global control enum (to the control
API) for the ALSA card which may modify the driver behaviour / settings at
runtime (normal operation, battery saving operation etc.). This control can be
set in the UCM config. In this way, we don't need to touch the PCM API for the
user space at all.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
