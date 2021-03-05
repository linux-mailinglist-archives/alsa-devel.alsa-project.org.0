Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D43032EBDF
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 14:04:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98EDF17AA;
	Fri,  5 Mar 2021 14:03:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98EDF17AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614949469;
	bh=IS9cGfGujxzpigCIBhBdodXUn1382BNFKlNcGSykVh8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qAo09eIj3qCRuH8MX47DHajdhxsk0t90mDl8pI6PdK3HYJnr3LVOxp5Ldf4PEpCtc
	 cMQ2AgH6q0yMw8Ass1rUdeJNZWwPL2oMC7zrbOVMVo9eGYGk15vkrq/g5nwiWTkKKs
	 4hrX15zYTOIZCh0dqar39rKBekc7q5hsQJ9J62Yc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11718F8026A;
	Fri,  5 Mar 2021 14:02:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C126F8025E; Fri,  5 Mar 2021 14:02:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44435F80121
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 14:02:49 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id BDC47A003F;
 Fri,  5 Mar 2021 14:02:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz BDC47A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1614949368; bh=9i0d4kMVEpx74avV8xNPYB+PgKnTRqCG6ZnduyRfBiQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IM1EN633M8026Cd5G9ZX4w0O74X1aDFHMql9CZeuX9LO07oFckWRxQvM44hCeVslC
 aa60woj/v2SJzzZbn9rg7ubXTmipo8NJdQEBSvy3XpQSkyYuBXd03ujAJlrPGDHhOs
 CIW18ISZX75CJhoZiT4IGnXjBFV4C0JEpNN68Keg=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  5 Mar 2021 14:02:44 +0100 (CET)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>
References: <20210224125927.GB4504@sirena.org.uk>
 <e47c7fa5-cb1a-f8a3-bfe4-1f6bca6a7d80@redhat.com>
 <20210224193626.GF4504@sirena.org.uk>
 <56ea1110-c129-5f3a-264b-fb389f615dbe@redhat.com>
 <20210225145901.GB5332@sirena.org.uk>
 <c785af21-8170-62ca-6f08-0a9a1a9071bb@redhat.com>
 <20210301132352.GA4628@sirena.org.uk>
 <76103f3e-c416-c988-7bc2-d7657e1868bd@redhat.com>
 <20210301191503.GI4628@sirena.org.uk>
 <54c5fd8e-1835-b9c3-d5fd-5cb363eab32c@redhat.com>
 <20210301204313.GK4628@sirena.org.uk>
 <6d34af65-761b-7314-6af6-daf15cc9535c@redhat.com>
 <4b61303c-cee6-32cc-a9b9-3de7db0043d8@perex.cz>
 <7c6c2f44-e6a1-48e7-773e-033ba4582742@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <28fffebd-1ce9-7480-0f2f-ed8369abddf1@perex.cz>
Date: Fri, 5 Mar 2021 14:02:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <7c6c2f44-e6a1-48e7-773e-033ba4582742@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

Dne 04. 03. 21 v 20:39 Hans de Goede napsal(a):
> Hi,
> 
> On 3/2/21 10:14 PM, Jaroslav Kysela wrote:
>> Dne 01. 03. 21 v 22:26 Hans de Goede napsal(a):
>>> Hi,
>>>
>>> On 3/1/21 9:43 PM, Mark Brown wrote:
>>>> On Mon, Mar 01, 2021 at 08:49:34PM +0100, Hans de Goede wrote:
>>>>> On 3/1/21 8:15 PM, Mark Brown wrote:
>>>>
>>>>>> Off the top of my head something like writing a control name into a
>>>>>> sysfs file might work, it doesn't scale if you need to use multiple
>>>>>> controls as rt5640 does though.
>>>>
>>>>> Currently ALSA/UCM does not use sysfs files for anything, so this
>>>>> feels very inconsistent with how all the rest of this currently works.
>>>>
>>>> Yes, you'd really want to add string controls in ALSA.
>>>
>>> Hmm, we already have SNDRV_CTL_ELEM_TYPE_BYTES controls. I think that will
>>> work nicely actually, we can have the UCM conf file send a 0 terminated
>>> string to the driver that way. It would be nice to have some syntactic
>>> sugar on the UCM side to be able to actually specify a string instead
>>> of an array of bytes, but I don't think we need any new userspace API
>>> for this.
>>
>> The LEDs are controlled per machine not per card. So do we need to create the 'Speaker/Mic LED Control' control for all cards?
>>
>> Also, this change sounds really generic. The interface may be implemented in my proposed control led kernel module, not in the codec drivers.
>>
>> The Mark's sysfs idea is not bad in my opinion. The sequences may be extended in UCM, we have already 'exec' command. Yes, this command is a little heavy for the sysfs writes, but we can add command like 'sysset' or so for sysfs like:
> 
> Okay, so this would be a sysfs file per card then? Sol we would have for example
> 2 new sysfs files like this show up when your module is loaded:
> 
> /sys/class/sounds/card0/spk_mute_led_control
> /sys/class/sounds/card0/mic_mute_led_control
> 
> And reading would iterate over all mixer-elements of the card and print
> the names of those which have the relevant access LED flag set, where
> as a write would be taken as a control-name to add the access LED flag
> too?

It depends if we want to have this feature as an independent add-on
(implemented in the generic sound LED module) or if we tie this more to
the ALSA's core control code.

My proposal creates virtual sound ctl-led driver - thus
/sysfs/devices/virtual/sound/ctl-led/ tree. We can add a subdirectory per card
there like:

/sysfs/devices/virtual/sound/ctl-led/speaker/card0/attach

...

> And an empty write would be special and clear the flag on all controls?
> I guess we don't strictly need that if we only set things up at boot once,
> but it might still be handy to force things to a clean state.

The list operations should be probably identified by separate sysfs files.

/sysfs/devices/virtual/sound/ctl-led/speaker/card0/attach
/sysfs/devices/virtual/sound/ctl-led/speaker/card0/detach
/sysfs/devices/virtual/sound/ctl-led/speaker/card0/reset
/sysfs/devices/virtual/sound/ctl-led/speaker/card0/controls

And /sys/class/sounds/card0/controlC0/led-speaker may be a symlink to
/sysfs/devices/virtual/sound/ctl-led/speaker/card0/ .

>>   # detach all speaker LED controls for card 1
>>   # similar to 'echo -n "card=1,*" > /sysfs/devices/virtual/sound/ctl-led/speaker/detach'
>>   sysset "devices/virtual/sound/ctl-led/speaker/detach:card=1,*"
>>
>>   # attach the 'Speaker Playback Switch',10 control to speaker LED trigger in card 1
>>   # similar to 'echo -n "card=1,iface=MIXER,name='Speaker Playback Switch',index=10" > /sysfs/devices/virtual/sound/ctl-led/speaker/attach
>>   sysset "devices/virtual/sound/ctl-led/speaker/attach:card=1,iface=MIXER,name='Speaker Playback Switch',index=10"
> 
> I think a sysfs file per card would work better, that would certainly be
> a lot more inline with how sysfs is normally used...
> 
> Also do we need the iface=MIXER part ?

It was just a complete example (element ID specification in a string from
alsa-lib/amixer). Of course, the other element types won't be probably used
for the LED functionality...

>> Security: The LED-control bindings should be handled only in the boot / init phase (thus in UCM BootSequence section) and the sysfs interface files should be read-only for normal users.
> 
> Yes that make sense, but it will require some extra helper to that, I guess it
> could be an extra flag to the alsactl restore command which already gets run
> at boot, or an extra alsactl command ?

The alsactl does the BootSequence initialization when UCM is supported in
alsa-lib. But, we have a little issue that the this sequence is executed only
if some controls are changed (added or removed) between last alsa state config
(/var/lib/alsa/asound.state) or if the state for the given card does not exist
to not override the values which may be changed by the user. It really depends
on the control API only.

Apparently, we need another sequence which will be forcefully executed on
boot. ColdSequence , FixedBootSequence, ForcedSequence, ForcedBootSequence ?

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
