Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFB0649B6C
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 10:49:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2F5A22E3;
	Mon, 12 Dec 2022 10:48:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2F5A22E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670838584;
	bh=3rN8Zkk48VOQwfDlZRYpgYMQ8cMZhlLUjxCfcJMJSbg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=L1i36ZFiP2mbb2fEsLjcDE57WP2jmkp6C2kegDPOUNa2WWMAOFsY/Qp51rybbeb4n
	 AU12jqYRTcdzWg80LCCGUF2Lw9gziJeskZ+1hKyPxav/OhiX+z+IRPu3niSNvHiE3Y
	 qdqZuicUUEUGPMwByduYCXuNG74ZO2WHaixRjJHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47102F800F8;
	Mon, 12 Dec 2022 10:48:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61F19F80494; Mon, 12 Dec 2022 10:48:46 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F57DF800F8
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 10:48:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F57DF800F8
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1p4fQR-0005eJ-8q; Mon, 12 Dec 2022 10:48:43 +0100
Message-ID: <99245e87-f970-5660-d2af-82180e7a98d3@leemhuis.info>
Date: Mon, 12 Dec 2022 10:48:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Regression playing 24bit/96kHz audio on USB audio interface
 between 5.10.94 and 5.15.21
Content-Language: en-US, de-DE
To: Ruud van Asseldonk <ruud@veniogames.com>
References: <4e509aea-e563-e592-e652-ba44af6733fe@veniogames.com>
 <9da2f631-4b45-9c5e-4349-488eea9436aa@veniogames.com>
 <Y5ZGw/3GHXSUduEc@geday>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <Y5ZGw/3GHXSUduEc@geday>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1670838525;
 bc7bca71; 
X-HE-SMSGID: 1p4fQR-0005eJ-8q
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
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Geraldo Nascimento <geraldogabriel@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi, this is your Linux kernel regression tracker.

On 11.12.22 22:08, Geraldo Nascimento wrote:
> On Sun, Dec 11, 2022 at 04:30:11PM +0100, Ruud van Asseldonk wrote:
>> Hi all,
>>
>> This issue is still present in 5.15.82, is there anything I can do to 
>> diagnose this further?
> 
> Hi Ruud,
> 
> Sorry for your troubles. You could use "git bisect" to try to pinpoint
> the exact commit that introduces failure for you.

Yeah, that would be helpful. But 5.15 is quite old by now. Before going
down that route you might want to try the latest kernel (e.g. Linux
6.1), as the problem might have been fixed in between, without the fix
being backported.

You also talk about a "rpi-" kernel. Is that a vanilla kernel, or at
least close to it?

Also CCing Takashi, maybe he has an idea. CCing the regression mailing
list, too, as it should be in the loop for all regressions, as explained
here:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

>> Ruud van Asseldonk
>>
>>> Hi,
>>>
>>> I have a program that configures a Behringer UMC404HD 192k USB audio 
>>> interface for playback as follows (pseudocode):
>>>
>>>    snd_pcm_hw_params_set_channels(pcm, hwp, 2);
>>>    snd_pcm_hw_params_set_format(pcm, hwp, SND_PCM_FORMAT_S24_3LE);
>>>    snd_pcm_hw_params_set_access(pcm, hwp, SND_PCM_ACCESS_MMAP_INTERLEAVED);
>>>    snd_pcm_hw_params_set_rate(pcm, hwp, val=96000, dir=0);
>>>    snd_pcm_hw_params_set_period_size_near(pcm, hwp, val=513, dir=0);
>>>    // If I confirm at this point with snd_pcm_hw_params_get_period_size,
>>>    // I get back 513.
>>>    snd_pcm_hw_params_set_buffer_size_near(pcm, hwp, val=2052);
>>>    snd_pcm_hw_params(pcm, hwp);
>>>    // If I confirm with snd_pcm_hw_params_get_buffer_size,
>>>    // I get back 2052.
>>>
>>> On Linux 5.10.94 (specifically Arch Linux ARM package 
>>> linux-rpi-5.10.94-1), this succeeds, and I can play back audio just 
>>> fine. On 5.15.21 (specifically linux-rpi-5.15.21-3), all the calls 
>>> succeed apart from the last one, which returns EINVAL.
>>>
>>> (My actual program is written in Rust and uses a Rust wrapper library 
>>> for libasound, https://docs.rs/alsa/0.6.0/alsa/, but the calls should be 
>>> the ones listed.)
>>>
>>> I confirmed with snd_pcm_hw_params_test_format that the S24_3LE format 
>>> is supported. On both kernels it is successful. I confirmed with 
>>> snd_pcm_hw_params_test_rate that 96 kHz is supported. On both kernels it 
>>> is successful. There are differences though. When I query these:
>>>
>>>    snd_pcm_hw_params_get_period_size_min
>>>    snd_pcm_hw_params_get_period_size_max
>>>    snd_pcm_hw_params_get_buffer_size_min
>>>    snd_pcm_hw_params_get_buffer_size_max
>>>
>>> Then on 5.10.94 (the good version), I get:
>>>
>>>    period size min/max: 12/32768, buffer size min/max: 24/65536
>>>
>>> But on 5.15.21 (the bad version), I get:
>>>
>>>    period size min/max: 13/71332, buffer size min/max: 26/142663
>>>
>>> Also, after I set the period size to 513, if I then query the buffer 
>>> size min/max, on 5.10.94 I get:
>>>
>>>    buffer size min/max: 1026/65536
>>>
>>> But on 5.15.21 I get:
>>>
>>>    buffer size min/max: 1027/142663
>>>
>>> In lsmod, snd_usb_audio shows up, and from lsusb -v, the UMC404HD 
>>> appears to be a standard USB audio interface. The lsusb output is 
>>> identical on both kernels.
>>>
>>> Please let me know if there is anything I can do to help further 
>>> diagnose the issue, or if I should report this elsewhere.
>>>
>>> Kind regards,
>>> Ruud van Asseldonk


