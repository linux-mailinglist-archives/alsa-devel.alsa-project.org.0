Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BD83B2139
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 21:29:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3883847;
	Wed, 23 Jun 2021 21:28:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3883847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624476574;
	bh=YJmYPuWh42UoQmvrEAIDzA9c+gkJyE9ISkITomIByfI=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IS9HpByqvUFe5KWgOJzoVLF7A38zHSdhnjG0wJUbF4iHX3W67iDPdmGvvLen9WjfF
	 Gb5NUq8up7rj3uPCh7T81GuPXW7VPPaNA5OfQyXKWY7GQ4ScqLhVa3w5wg6FdYewpP
	 OaURAw+4ap4C+jRPZUWGOc/+RX2ZYjDLH1bA/lrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22C31F801D5;
	Wed, 23 Jun 2021 21:28:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 688C6F8016D; Wed, 23 Jun 2021 21:28:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A6BAF800E1
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 21:27:53 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B3B33A0042;
 Wed, 23 Jun 2021 21:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B3B33A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1624476472; bh=UwOQke7BbCYOFNoARoBWHHC2fBySaupcbg2bygf9Bos=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=DtPy0eAtNZz6qe/mB4s1ex22WIZkEURXSu5nVcUfwhyNDria2A67ZX4KNrCADot2O
 PrqaIdfgoKhNQc5JCV4Z5kd8wHaX16u0rACnPxQFblPveEXgNQKbV+N390H3om3YPW
 3dVPQt8q6PQv75FD5ROjZJu8OsKb2EI8nUWM6m5g=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 23 Jun 2021 21:27:50 +0200 (CEST)
Subject: Re: [PATCH alsa-lib 0/5] Add generic exception mechanism for
 non-standard control-names
To: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
References: <20210503205231.167346-1-hdegoede@redhat.com>
 <0f7f1063-4a14-5d99-71b2-e700c74828c2@perex.cz>
 <67840562-7f54-bb9b-7876-6079b4ff7f47@redhat.com>
 <95924d6e-e2b7-0b9b-b62c-27e57fe88a80@perex.cz>
 <cc686b48-b27d-74bf-4fb4-21fdd23a9c89@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <d92ad13d-4ee0-a125-053f-56ee99092053@perex.cz>
Date: Wed, 23 Jun 2021 21:27:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cc686b48-b27d-74bf-4fb4-21fdd23a9c89@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 23. 06. 21 20:59, Hans de Goede wrote:
> Hi Jaroslav,
> 
> On 5/18/21 6:16 PM, Jaroslav Kysela wrote:
>> Dne 04. 05. 21 v 17:47 Hans de Goede napsal(a):
>>> Hi Jaroslav,
>>>
>>> On 5/4/21 10:53 AM, Jaroslav Kysela wrote:
>>>> Dne 03. 05. 21 v 22:52 Hans de Goede napsal(a):
>>>>> Hi All,
>>>>>
>>>>> This series seems to have fallen through the cracks,
>>>>> so here is a resend of it.
>>>>>
>>>>> Regards,
>>>>
>>>> Thank you, Hans. The problem with this implementation is that it's really card
>>>> specific. Also, ASoC codec drivers have usually ID names based on registers so
>>>> the mapping for the user is problematic anyway (the functionality is different
>>>> from the name or not related to the name). I'm actually evaluating another
>>>> solution which is more flexible:
>>>>
>>>> 1) add control remap plugin to allow the control ID remapping in the
>>>> alsa-lib's control API, so we can mangle those identifiers there (already
>>>> implemented)
>>>>
>>>> 2) add local and global alsa-lib configurations per UCM card specified in the
>>>> UCM configuration files; the configurations may be for both control and PCM
>>>> devices (restrict or set specific parameters)
>>>
>>> Ok, thank you for working on this.
>>>
>>>> I will notify you when I finish my tests.
>>>
>>> Yes, please let me know when you've something ready to test, then I'll take
>>> a look at adding the necessary bits for the bycr-rt5640 and cht-bsw-rt567
>>> UCM profiles, as some control renaming is necessary to make sure that
>>> the hw-volume control on these devices also correctly controls the
>>> hw mute controls (which in turn are necessary for both full muting and
>>> for mute LED control).
>>
>> It seems that things started to work. I pushed everything to the repos
>> (alsa-lib/alsa-utils/alsa-ucm-conf) and picked bits from your configs. If you
>> can give a look and a test, it would be nice. The changes for the specific
>> codecs are quite straight like:
>>
>> https://github.com/alsa-project/alsa-ucm-conf/commit/2072ab794b69cdf4f070db5467387d08a65c4309
>>
>> The global alsa-lib's configuration does the redirects to the hw specific
>> configs (if found) per card. UCM can store this "per card" configuration to
>> /var/lib/alsa/card<NUMBER>.conf.d tree, which allows us to define the hw
>> specific configuration. Both control and PCM devices can be (re)configured.
>>
>> UCM was extended to allow inline the alsa-lib's configuration which can be
>> private to UCM or saved to a global config file (/var/lib/alsa tree for example).
>>
>> By default, I made the private alsa-lib's configuration for all UCM
>> applications, so the users cannot break UCM with their configuration changes.
> 
> Thank you for your work on this.
> 
> I've been testing this on a HP x2 Bay Trail + rt5640 laptop, and I've
> found 2 issues:
> 
> 1. After renaming there are now 2 "Speaker" and "Headphones" switches:
> 
> "Speaker Playback Volume" stays    "Speaker Playback Volume"
> "Speaker Channel Switch"  becomes  "Speaker Playback Switch"
> "Speaker Switch"          stays    "Speaker Switch"
> 
> And then alsamixer only shows one of the 2 "Speaker [Playback] Switches"
> 
> This can be worked around by changing the renames to e.g. :
> 
>                 "name='HP Playback Volume'" "name='Headphones Playback Volume'"
>                 "name='HP Channel Switch'" "name='Headphones Playback Switch'"
>                 "name='Speaker Playback Volume'" "name='Speakers Playback Volume'"
>                 "name='Speaker Channel Switch'" "name='Speakers Playback Switch'"
> 
> Or to:
> 
>                 # Rename the 'Headphone Switch' DAPM PIN switch to avoid it getting
>                 # grouped with 'Headphone Playback Volume'
>                 "name='Headphone Switch'" "name='Headphone Output Switch'"
>                 "name='HP Playback Volume'" "name='Headphone Playback Volume'"
>                 "name='HP Channel Switch'" "name='Headphone Playback Switch'"
>                 # Idem for the 'Speaker Switch'
>                 "name='Speaker Switch'" "name='Speaker Output Switch'"
>                 "name='Speaker Channel Switch'" "name='Speaker Playback Switch'"

This variant looks better in my eyes.

> So this is not really an issue.
> 
> 2. PlaybackMixerElem statements don't take the renames into account, this means
> that muting the speakers or the headphones output the UCM (pipewire/pulse) level
> does not mute the 'Speaker Channel Switch' / 'HP Channel Switch' control, meaning
> that we are not muting things at the hw level, which in turn is causing the speaker
> mute LED on the HP X2 to not be turned on when muting.
> 
> I guess the fix here would be to make the renames apply to PlaybackMixerElem ?

Yes, this change is required. I forgot to update this part.

> Downside is that that would be a syntax change for the UCM conf language I guess
> (e.g. this would require update the PlaybackMixerElem from HP to Headphone in the
> rt5640 case)

It's just a configuration value change, so it's fine.

> If you can steer me in the right direction for fixing this I can take a shot at
> fixing this. Or alternatively I would be happy to test any patches for this from
> you.

I would appreciate patches or a pull request on github, if you like. Thank you
for your tests.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
