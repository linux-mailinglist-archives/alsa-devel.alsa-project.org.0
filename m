Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E51B46510DF
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Dec 2022 18:02:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 510C22CDE;
	Mon, 19 Dec 2022 18:01:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 510C22CDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671469341;
	bh=zK8yY6m/nv1S4Yl1iKn8Nvp4eampett4aI6s3dRExu4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rwXDsNweSs7ucabqJoaJtPLqdleVcf66x3Vz9J0Y1Din+p+2kVudloO3FzaeL0q/g
	 a/jbQUPvsuZ5SEcj9c49nYZkgyjnfCFEGWIsSPY0Imp8GciJ5sxUkVSS8PmAEFnTWX
	 N0Mv/icG2cv8ZpLWnMwcEstckw+Px87oQ/0fgCiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09907F801C0;
	Mon, 19 Dec 2022 18:01:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C0F0F80423; Mon, 19 Dec 2022 18:01:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EB41F801C0
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 18:01:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EB41F801C0
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=QYhB8taC
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B3F23A0047;
 Mon, 19 Dec 2022 18:01:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B3F23A0047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1671469279; bh=gOcbNBGz+ANluLxaB4+FuyF+gaxrZE+jftjvvZfCJWA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QYhB8taCi8E+kQKiQhN+21vd98T5h+UvNvyTbkbE3m9TU2+PKE+UJSa7r4R7VgLyj
 bc3bQKXYrh30oQE/yzJKYm+Qg5e8mjB2DCGEOX5knDwYTo7Wv1AxWwuJguKgHamesi
 n46IxOq3P3Urk19OvefKnezPXFV0J3vt3TiOpiBo=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 19 Dec 2022 18:01:10 +0100 (CET)
Message-ID: <7ab2be50-11c6-f79f-e3f5-a5dc5ec41708@perex.cz>
Date: Mon, 19 Dec 2022 18:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: =?UTF-8?Q?Re=3a_=5bregression=5d_Bug=c2=a0216818_-_The_microphone_m?=
 =?UTF-8?Q?ute_led_not_working_after_linux_6?=
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Hans de Goede <hdegoede@redhat.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <bf52f4c5-5cca-26d7-7fb2-ac8ecb5b24c5@leemhuis.info>
 <572159b3-a1a4-8735-d435-ea574c07851f@redhat.com>
 <9f0e95d1-5057-93f0-ad9e-985eaeed0226@leemhuis.info>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <9f0e95d1-5057-93f0-ad9e-985eaeed0226@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: LKML <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org,
 plum <plumerlis@gmail.com>, sonic82003@gmail.com,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 19. 12. 22 11:27, Thorsten Leemhuis wrote:
> On 19.12.22 11:00, Hans de Goede wrote:
>> On 12/19/22 10:17, Thorsten Leemhuis wrote:
>>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>>> kernel developer don't keep an eye on it, I decided to forward it by
>>> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216818 :
>>>
>>>>   sonic82003@gmail.com 2022-12-18 08:52:32 UTC
>>>>
>>>> The mic mute led of my ThinkPad X1 Carbon Gen 9 doesn't work anymore after updating linux to version 6.
>>>> I can still turn it on by  running
>>>>
>>>> echo 1 > /sys/class/leds/platform::micmute/brightness
>>>>
>>>> With linux-lts it still works fine.
>>>
>>> See the ticket for more details.
>>>
>>> Note, I found a similar report that (despite my attempts to prevent
>>> things like this from happening) fell through the cracks here:
>>> https://bugzilla.kernel.org/show_bug.cgi?id=216355
>>>
>>>>   plum 2022-08-13 02:11:01 UTC
>>>>
>>>> I upgrade to kernel 5.19.1 but found my thinkpad x1 carbon 2021's mute led stop working.
>>>>
>>>> Function is okay but LED won't light up.
>>>>
>>>> Back to kernel 5.18 and it's normal and working again.
>>>>
>>>> Fedora 36 64 bit
>>>> Gnome-shell 42
>>>
>>>  From a quick research it looks to me like this is an issue for the
>>> sounds maintainers, as the LED itself apparently works. If that is
>>> something for the platform people instead please speak up.
>>
>> Thanks for bringing this up, we recently hit this in Fedora too
>> and we have a fix/workaround there. Let me copy and paste what
>> I just added to bko216355 :
> 
> Many thx for sharing these details, really helpful.
> 
>> This is caused by a behavior change of the kernel code controlling the LED to only turn on the LED when all inputs, including e.g. the jack mic input are turned off in the alsa-mixer settings.
>>
>> But most userspace code only turns the mic which it is actually using on/off when you hit the mic-mute hotkey.
>>
>> Also see: https://bugzilla.redhat.com/show_bug.cgi?id=2134824
> 
> Ahh, lot's of helpful information and even a bisect there. :-D
> 
> #regzbot introduced: 9b014266ef8ad0159

It's not a regression from my view.

>> Which is the same bug.
>>
>> There is a set of fixes available in the form of an alsa-ucm update which tells the kernel to ignore the state of the jack mic input restoring the old behavior:
>>
>> https://git.alsa-project.org/?p=alsa-ucm-conf.git;a=commitdiff;h=79a8ec44d3dcf097f4a4492c506cbcf338324175
>> https://git.alsa-project.org/?p=alsa-ucm-conf.git;a=commitdiff;h=9ce9ddb4a84fb467602b716575ea1d8f2bab0c39
> 
> Hmmm, that's nice, but well, by Linux' "no regressions rule" the issue
> is caused by kernel change and thus must be fixed in the kernel, e.g.
> without forcing users to update anything in userspace.
> 
> Jaroslav, are there any plans to do that?

I wrote all relevant information to https://bugzilla.redhat.com/show_bug.cgi?id=2134824 . The problem exists from the initial microphone LED support in the SOF HDA driver, because two drivers control the microphone LED simultaneously (sof-hda-dsp + hda-intel). My recent update just made this thing more visible - the LED state may be updated wrongly in all previous kernels. Original behavior: last write wins. New behavior: all off = LED ON. The UCM fix (update the default kernel runtime configuration from the user space) is sufficient in my eyes for now because even the use case when the microphone LED follows the state when all internal inputs are turned off makes sense.

I think that the sof-hda-dsp driver maintainer may decide to change the default settings in the HDA driver when the digital microphone is detected. Adding Pierre-Louis to the chain.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
