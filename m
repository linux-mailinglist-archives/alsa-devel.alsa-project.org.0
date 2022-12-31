Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 936DE65A3E1
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Dec 2022 13:04:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF11F3455;
	Sat, 31 Dec 2022 13:03:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF11F3455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672488282;
	bh=+QZ/YaKGTJ4R4FC0QlOiySt3FpCErLh5haRQc1Yq/Ic=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ss0DAZDNFYh/ywst1j2ZD0kRW9+y8hUlxytyysQvhDdfjIQashymhIudW3/KZ0asZ
	 pHBxeHNSzfuurjbiwWHDGVPM6o44NUsOX/qbwJ62euhaMJ6UDH9V9wQztnnfrt8AHj
	 ETWu4/mzGqxPtC0pb1AxXS8H+30a/CBBLhCv/nxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70F13F804E4;
	Sat, 31 Dec 2022 13:03:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 838A6F804D0; Sat, 31 Dec 2022 13:03:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=NICE_REPLY_A, RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F383F802A0
 for <alsa-devel@alsa-project.org>; Sat, 31 Dec 2022 13:03:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F383F802A0
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1pBaaN-0006PZ-In; Sat, 31 Dec 2022 13:03:35 +0100
Message-ID: <3dd7ae1b-3b86-044c-27d5-73721c9d5145@leemhuis.info>
Date: Sat, 31 Dec 2022 13:03:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Regression playing 24bit/96kHz audio on USB audio interface
 between 5.10.94 and 5.15.21
Content-Language: en-US, de-DE
To: Ruud van Asseldonk <ruud@veniogames.com>, Takashi Iwai <tiwai@suse.com>
References: <4e509aea-e563-e592-e652-ba44af6733fe@veniogames.com>
 <9da2f631-4b45-9c5e-4349-488eea9436aa@veniogames.com>
 <Y5ZGw/3GHXSUduEc@geday> <99245e87-f970-5660-d2af-82180e7a98d3@leemhuis.info>
 <9d663e28-88fb-aa96-574b-e92d6214aefe@veniogames.com>
 <5ba7868c-5ffd-81fc-778c-a7b5f8db50f7@veniogames.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <5ba7868c-5ffd-81fc-778c-a7b5f8db50f7@veniogames.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1672488218;
 6d3f642b; 
X-HE-SMSGID: 1pBaaN-0006PZ-In
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
Cc: alsa-devel@alsa-project.org, Geraldo Nascimento <geraldogabriel@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 31.12.22 12:38, Ruud van Asseldonk wrote:
> 
> I bisected this and identified e4ea77f8e53f9accb9371fba34c189d0447ecce0
> (ALSA: usb-audio: Always apply the hw constraints for implicit fb sync)
> as the first commit where it is no longer possible to change the sample
> rate. On the parent commit, my sample program successfully changes the
> sample rate from 44100 Hz to 96000 Hz, but on e4ea77f8e53f9, the second
> call to snd_pcm_hw_params fails.

Not my area of expertise, thus consider this a lucky guess that might be
misleading -- but is this maybe similar to the issue discussed here?
https://lore.kernel.org/all/s5him6gnkdu.wl-tiwai@suse.de/

To quote:
```
It's no regression but the right behavior.  This indicates that you're
trying a stream in 44.1kHz in one side of the full duplex stream while
48kHz in another rate, and this cannot work properly with the implicit
feedback devices.

It might have worked casually by some reason on your device, but it
was just a coincidence, as it didn't follow exactly what the implicit
feedback mode requires (i.e. the playback packet must follow exactly
the incoming recording packet).

That said, for the device like this, the sample rate has to be fixed
for both streams.

Hope that clarifies the situation.


Takashi
```

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

> Ruud van Asseldonk wrote:
>> After diving into this some more, I managed to create a minimal
>> reproducing C program. I discovered:
>>
>>      * The bit depth is not relevant.
>>      * It is not a problem with 96 kHz, but a problem with switching
>> sample rates.
>>
>> If I call snd_pcm_hw_params, the first call always succeeds. But when
>> I first call it with hw_params with rate 44100 and then again with
>> 48000 or 96000, the second call fails. If I call it with 96000 first
>> and then with 44100, the first call for 96000 succeeds and changing to
>> 44100 fails. I'll add the full program at the end of this mail.
>> Changing the bit depth does succeed by the way, to it’s not that the
>> hw_params can’t be changed at all.
>>
>>
>> Thorsten Leemhuis wrote:
>>
>>>> Sorry for your troubles. You could use "git bisect" to try to pinpoint
>>>> the exact commit that introduces failure for you.
>>>
>>> Yeah, that would be helpful. But 5.15 is quite old by now. Before going
>>> down that route you might want to try the latest kernel (e.g. Linux
>>> 6.1), as the problem might have been fixed in between, without the fix
>>> being backported.
>>> You also talk about a "rpi-" kernel. Is that a vanilla kernel, or at
>>> least close to it?
>>
>> It is not vanilla, it is from
>> https://github.com/raspberrypi/linux/tree/rpi-5.15.y. However, in
>> addition to the Raspberry Pi I also have an x86_64 laptop that runs a
>> vanilla 6.1.1 kernel, and the minimal reproducing program below does
>> fail here as well with an UMC204HD. When I downgrade to 5.10.16 (also
>> vanilla), the program does succeed. So it’s unrelated to the Raspberry
>> Pi. This should also make it a lot easier for me to bisect this as I
>> don’t have to do it on the Raspberry. I will try to bisect next then.
>>
>>
>> Jaroslav Kysela wrote:
>>
>>  > It seems like a problem in the hw_params constraints / refining. There
>>  > are lot of changes in the USB audio driver between 5.10/5.15. There is
>>  > also HW_CONST_DEBUG define in sound/usb/pcm.c which enables the debug
>>  > output for the refining.
>>  >
>>  > Just curious: What's behind the value 513 (period size)? It does not
>>  > match the time (5.34ms for 96kHz) nor a binary value. I would use 480
>>  > (5ms) or so.
>>
>> I think I put this in at some point trying to see if it made a
>> difference, in my main application I was using different values. After
>> some more trying, it looks like the period size and buffer size are
>> not relevant for reproducing, see also the program below.
>>
>>  > And the final note: I gave a quick test with UMC204HD with the 6.0.9
>>  > kernel and it appears that this problem is not present in the recent
>>  > kernel:
>>
>> After writing the reproducer, it looks like the failure only happens
>> when changing the sample rate, so it makes sense that aplay would not
>> reproduce it.
>>
>>  > I would also use S32_LE native format in your app, the S24_3LE is not
>>  > supported with your hw directly. The alsa-lib does conversion.
>>
>> Thanks for the heads-up! Yeah I am being lazy, I am also relying on
>> alsa-lib to expand the channels from 2 to 4 (since the UCM404 only
>> supports 4 channels).
>>
>>
>> Minimal reproducing program:
>>
>> #include <assert.h>
>> #include <alsa/asoundlib.h>
>>
>> void set_format(snd_pcm_t* pcm, unsigned int rate) {
>>      int err;
>>      snd_pcm_hw_params_t* hwp;
>>      err = snd_pcm_hw_params_malloc(&hwp);
>>      assert(err == 0);
>>      err = snd_pcm_hw_params_any(pcm, hwp);
>>      assert(err == 0);
>>      err = snd_pcm_hw_params_set_rate(pcm, hwp, rate, 0);
>>      assert(err == 0);
>>      err = snd_pcm_hw_params(pcm, hwp);
>>      assert(err == 0);
>> }
>>
>> int main(void) {
>>      int err;
>>      snd_pcm_t* pcm;
>>
>>      int mode = 0;
>>      err = snd_pcm_open(&pcm, "hw:U192k", SND_PCM_STREAM_PLAYBACK, mode);
>>      assert(err == 0);
>>
>>      set_format(pcm, 44100);
>>      printf("44.1k ok\n");
>>      set_format(pcm, 96000);
>>      printf("96k ok\n");
>> }
>>
>> Kind regards,
>> Ruud
> 
