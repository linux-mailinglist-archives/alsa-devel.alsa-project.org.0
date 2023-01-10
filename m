Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3192663CFA
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 10:34:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D9DC785C;
	Tue, 10 Jan 2023 10:33:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D9DC785C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673343272;
	bh=dO+7VJNDBN5kIbWJH+BQHNTha0YTKUoZv+eak76K/QI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=tX7SehrAFkhhMB22Pp4Vp9S+TzSOqW8ssaDetiM2x3i8Uz3rs8X8mpOAjlSo7MrR6
	 Au83am0CWp3/3zGzErBihosCnYtXm4179WLgqBLR9I+1LF8S4X2pVytFve2wy1JwfB
	 hL1IJo2K1ZYFXZSHt+qEaNzRN5yXv8lxKbQqvGaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA478F804D9;
	Tue, 10 Jan 2023 10:33:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8589DF804C1; Tue, 10 Jan 2023 10:33:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81A16F8026A
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 10:33:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81A16F8026A
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1pFB0e-0002ya-EF; Tue, 10 Jan 2023 10:33:32 +0100
Message-ID: <169efa7b-917f-34b8-9edf-1b8c6345c277@leemhuis.info>
Date: Tue, 10 Jan 2023 10:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: =?UTF-8?Q?Re=3a_=5bregression=5d_Bug=c2=a0216818_-_The_microphone_m?=
 =?UTF-8?Q?ute_led_not_working_after_linux_6?=
Content-Language: en-US, de-DE
To: Jaroslav Kysela <perex@perex.cz>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <bf52f4c5-5cca-26d7-7fb2-ac8ecb5b24c5@leemhuis.info>
 <572159b3-a1a4-8735-d435-ea574c07851f@redhat.com>
 <9f0e95d1-5057-93f0-ad9e-985eaeed0226@leemhuis.info>
 <7ab2be50-11c6-f79f-e3f5-a5dc5ec41708@perex.cz>
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <7ab2be50-11c6-f79f-e3f5-a5dc5ec41708@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1673343215;
 8e28777c; 
X-HE-SMSGID: 1pFB0e-0002ya-EF
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: alsa-devel@alsa-project.org, plum <plumerlis@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, sonic82003@gmail.com,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

[now that the holiday season is over I'd like to get this rolling again]

On 19.12.22 18:01, Jaroslav Kysela wrote:
> On 19. 12. 22 11:27, Thorsten Leemhuis wrote:
>> On 19.12.22 11:00, Hans de Goede wrote:
>>> On 12/19/22 10:17, Thorsten Leemhuis wrote:
>>>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>>>> kernel developer don't keep an eye on it, I decided to forward it by
>>>> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216818 :
>>>>
>>>>>   sonic82003@gmail.com 2022-12-18 08:52:32 UTC
>>>>>
>>>>> The mic mute led of my ThinkPad X1 Carbon Gen 9 doesn't work
>>>>> anymore after updating linux to version 6.
>>>>> I can still turn it on by  running
>>>>>
>>>>> echo 1 > /sys/class/leds/platform::micmute/brightness
>>>>>
>>>>> With linux-lts it still works fine.
>>>>
>>>> See the ticket for more details.
>>>>
>>>> Note, I found a similar report that (despite my attempts to prevent
>>>> things like this from happening) fell through the cracks here:
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=216355
>>>>
>>>>>   plum 2022-08-13 02:11:01 UTC
>>>>>
>>>>> I upgrade to kernel 5.19.1 but found my thinkpad x1 carbon 2021's
>>>>> mute led stop working.
>>>>>
>>>>> Function is okay but LED won't light up.
>>>>>
>>>>> Back to kernel 5.18 and it's normal and working again.
>>>>>
>>>>> Fedora 36 64 bit
>>>>> Gnome-shell 42
>>>>
>>>>  From a quick research it looks to me like this is an issue for the
>>>> sounds maintainers, as the LED itself apparently works. If that is
>>>> something for the platform people instead please speak up.
>>>
>>> Thanks for bringing this up, we recently hit this in Fedora too
>>> and we have a fix/workaround there. Let me copy and paste what
>>> I just added to bko216355 :
>>
>> Many thx for sharing these details, really helpful.
>>
>>> This is caused by a behavior change of the kernel code controlling
>>> the LED to only turn on the LED when all inputs, including e.g. the
>>> jack mic input are turned off in the alsa-mixer settings.
>>>
>>> But most userspace code only turns the mic which it is actually using
>>> on/off when you hit the mic-mute hotkey.
>>>
>>> Also see: https://bugzilla.redhat.com/show_bug.cgi?id=2134824
>>
>> Ahh, lot's of helpful information and even a bisect there. :-D
>>
>> #regzbot introduced: 9b014266ef8ad0159
> 
> It's not a regression from my view.

Please elaborate. Afaics it is one, as something that used to work
stopped working with a newer kernel version; it doesn't matter it worked
by accident beforehand or can be fixed by updating userland, as Linus
explained multiple times in the past:

https://docs.kernel.org/process/handling-regressions.html#quotes-from-linus-about-regression

But maybe I'm missing something.

>>> Which is the same bug.
>>>
>>> There is a set of fixes available in the form of an alsa-ucm update
>>> which tells the kernel to ignore the state of the jack mic input
>>> restoring the old behavior:
>>>
>>> https://git.alsa-project.org/?p=alsa-ucm-conf.git;a=commitdiff;h=79a8ec44d3dcf097f4a4492c506cbcf338324175
>>> https://git.alsa-project.org/?p=alsa-ucm-conf.git;a=commitdiff;h=9ce9ddb4a84fb467602b716575ea1d8f2bab0c39
>>
>> Hmmm, that's nice, but well, by Linux' "no regressions rule" the issue
>> is caused by kernel change and thus must be fixed in the kernel, e.g.
>> without forcing users to update anything in userspace.
>>
>> Jaroslav, are there any plans to do that?
> 
> I wrote all relevant information to
> https://bugzilla.redhat.com/show_bug.cgi?id=2134824 . The problem exists
> from the initial microphone LED support in the SOF HDA driver, because
> two drivers control the microphone LED simultaneously (sof-hda-dsp +
> hda-intel). My recent update just made this thing more visible - the LED
> state may be updated wrongly in all previous kernels. Original behavior:
> last write wins. New behavior: all off = LED ON. The UCM fix (update the
> default kernel runtime configuration from the user space) is sufficient
> in my eyes for now because even the use case when the microphone LED
> follows the state when all internal inputs are turned off makes sense.
> 
> I think that the sof-hda-dsp driver maintainer may decide to change the
> default settings in the HDA driver when the digital microphone is
> detected. Adding Pierre-Louis to the chain.

Pierre-Louis?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
