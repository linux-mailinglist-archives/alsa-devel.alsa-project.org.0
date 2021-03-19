Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D32A3423DF
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 18:59:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEA92166D;
	Fri, 19 Mar 2021 18:58:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEA92166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616176786;
	bh=p9aidqAAxbKjNNnwjrnxSud0dkfgtaPr29yXDOmOzeM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=atAnxB2k7GFwRGO/csKOGiC02O8kkMWd1/w+5d3ay1N8JVWknSp5MCDSs3RdrIupN
	 iAm9DOIHsNOn8uC/uzK4Q4b4ZOCsksUCFSGFNywVD9LaGuhpHergllsZTkYULGveTW
	 1Xhl1oaWkmQIDAhZU7N8KjU6UALLcRXN9H4CZm8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 397BEF800E0;
	Fri, 19 Mar 2021 18:58:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76EF9F8021C; Fri, 19 Mar 2021 18:58:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33572F800E0
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 18:58:09 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2CDABA0042;
 Fri, 19 Mar 2021 18:58:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2CDABA0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1616176689; bh=UrsxGr+3wuGu2EaRchxuBI7LetIkoP+Iw3imypbPhAI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sV8ye+XszJyZ8LoGymIuRa4KlR4EsICoMFGTEaS5LKiIAPu67mCx3rPYneK7nV0Vv
 aynGv9LYxZiWhprIspwv8+rRsggxG7FkuoHEByc8/CjsF4+N1t5ZZdu38tKYk6VMVu
 +zQZJQN/zzffUsR4NmpcMtzY6lHbas+AfgeUx/y0=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 19 Mar 2021 18:58:06 +0100 (CET)
Subject: Re: [PATCH v4 6/6] ALSA: led control - add sysfs kcontrol LED marking
 layer
To: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>
References: <20210317172945.842280-1-perex@perex.cz>
 <20210317172945.842280-7-perex@perex.cz>
 <a3ddb881-6580-cd25-ef3c-734e686e6942@redhat.com>
 <s5h5z1nf47r.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f3841187-7f57-f358-cf2c-b9a2a2ba84fb@perex.cz>
Date: Fri, 19 Mar 2021 18:58:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <s5h5z1nf47r.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
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

Dne 19. 03. 21 v 18:22 Takashi Iwai napsal(a):
> On Fri, 19 Mar 2021 17:34:39 +0100,
> Hans de Goede wrote:
>>
>> Hi,
>>
>> On 3/17/21 6:29 PM, Jaroslav Kysela wrote:
>>> We need to manage the kcontrol entries association for the LED trigger
>>> from the user space. This patch adds a layer to the sysfs tree like:
>>>
>>> /sys/devices/virtual/sound/ctl-led/mic
>>>    + card0
>>>    |  + attach
>>>    |  + detach
>>>    |  ...
>>>    + card1
>>>       + attach
>>>       ...
>>>
>>> Operations:
>>>
>>>   attach and detach
>>>     - amixer style ID is accepted and easy strings for numid and
>>>       simple names
>>>   reset
>>>     - reset all associated kcontrol entries
>>>   list
>>>     - list associated kcontrol entries (numid values only)
>>>
>>> Additional symlinks:
>>>
>>> /sys/devices/virtual/sound/ctl-led/mic/card0/card ->
>>>   /sys/class/sound/card0
>>>
>>> /sys/class/sound/card0/controlC0/led-mic ->
>>>   /sys/devices/virtual/sound/ctl-led/mic/card0
>>>
>>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>>
>> Thank you so much for this patch.
>>
>> I've given this new version a try, dropping my sound/soc/codecs/rt56??.c patches to set the access-flags directly.
>>
>> And with these 3 lines in /etc/rc.d/rc.local I get nicely working control of the mute
>> LED build into the (detachable) USB-keyboard's mute hot-key:
>>
>> modprobe snd_ctl_led
>> echo -n name="Speaker Channel Switch" > /sys/class/sound/card1/controlC1/led-speaker/attach
>> echo -n name="HP Channel Switch" > /sys/class/sound/card1/controlC1/led-speaker/attach
>>
>> This needs to be replaced by some UCM profile code doing the equivalent of course,
>> but for a proof-of-concept test of the kernel API this introduces the above will do.
> 
> IMO, that's the question: how we'll enable this in future.  If the
> binding of the control/mute mapping is provided via UCM, it's supposed
> to be changeable by each user.  Then the current sysfs permission

Nope. We have two UCM boot sequences which are called from "alsactl init" only
now. So, respecting the security concerns, only root should "fiddle" with this
settings. So yes, udev + alsactl (or any script) executed as root.

> Through a quick glance over the series, I'm fine to take those
> patches, but the only concern is the sysfs entries.  Basically, once
> when we use sysfs entries, it's set in stone.  So we should be very
> clear about our strategy how to deploy the control/mute mapping
> regarding using those sysfs entries.
> 
> OTOH, if the interface is thought for debugging or development
> purpose, it could be done in debugfs, which we can keep playing in
> further development, too.

We need attach / detach (reset and list operations are optional, but nice to
have). If you have any other idea, let me know.

> And, BTW, the mute LED mode setup doesn't have to be sysfs entries;
> we'd need primarily only the flags for inverted LED behavior, and
> those are only two, so it could be simply module options.  Then it's
> even easier for users to set up than tweaking sysfs entries.

I don't insist to control this over sysfs. But if sysfs is in the game, it's
nice to have the runtime control for this. The module parameter may be added
to modify the default value.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
