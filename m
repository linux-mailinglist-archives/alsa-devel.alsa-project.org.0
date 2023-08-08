Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA99E773923
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 10:45:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCA26DF8;
	Tue,  8 Aug 2023 10:45:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCA26DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691484355;
	bh=EGmwFzlKa40tUzXnB9uz+7SpBQfwoaG7hLzk/z23OnU=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AziZuciQY9CK5WrG0pwLaQf9ll9iiniRaWv+LccTxtH2j8WuBx498sUPVQUUAuBCI
	 ZM+weQ81lwoZrEmuobz5041r8NR603YoCVnSbe/N+OL/C9uA7q0cmsAErmF2De/0h6
	 8IW5OIZFEzGThMfXQecaG4jGAUqX3cYgkvI8c3F8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90C8BF80538; Tue,  8 Aug 2023 10:44:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E88BEF80154;
	Tue,  8 Aug 2023 10:44:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A322F80154; Tue,  8 Aug 2023 10:35:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from asave02.hostfactory.ch (asave02.hostfactory.ch
 [217.150.252.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BD68F800FE
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 10:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BD68F800FE
Received: from server11.hostfactory.ch ([185.117.169.60])
	by asave02.hostfactory.ch with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <michele.perrone@weiss.ch>)
	id 1qTIAp-00068O-PB; Tue, 08 Aug 2023 10:34:44 +0200
Received: from [192.168.0.84]
 (156.14.3.213.static.wline.lns.sme.cust.swisscom.ch [213.3.14.156])
	(Authenticated sender: michele.perrone@weiss.ch)
	by server11.hostfactory.ch (Postfix) with ESMTPSA id 4ABE840DC9945;
	Tue,  8 Aug 2023 10:34:38 +0200 (CEST)
Message-ID: <81450de2-3bf5-cb96-114f-6d75314e5a03@weiss.ch>
Date: Tue, 8 Aug 2023 10:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: dice: add stream format parameters for Weiss
 devices
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20230728131308.GA142765@workstation.local>
 <7a0cf3fd-9e31-45e1-7aa4-97cab27dafa7@weiss.ch>
 <20230731140655.GA367100@workstation.local>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Rolf Anderegg <rolf.anderegg@weiss.ch>,
 Isabelle Kernhof <isabelle.kernhof@weiss.ch>
From: Michele Perrone <michele.perrone@weiss.ch>
In-Reply-To: <20230731140655.GA367100@workstation.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <169148367864.8037.16552128239656694896@server11.hostfactory.ch>
X-PPP-Vhost: weiss.ch
X-Originating-IP: 185.117.169.60
X-SpamExperts-Domain: outboundprotection.hostfactory.ch
X-SpamExperts-Username: 185.117.169.60
Authentication-Results: hostfactory.ch;
 auth=pass smtp.auth=185.117.169.60@outboundprotection.hostfactory.ch
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.15)
X-Recommended-Action: accept
X-Filter-ID: 
 Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT8CK/hDX6Lrz+QL/NaDVyCqPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5ynOqv5wVH0VS/etXvrFNNzaJlM0GUlwLkcZrRacppWhTh3
 wKoTBNAKgp9qBcKLgDljPyzCxIJm7qFlTroi9VKv/7Rl0Dd5eFQ0eM8i42SsSUGlz8CJSOMrvzx9
 TVg3RkVVn/ZF+Op17rUQXdd7o7sVp8jZ4AoGBlDR94YkH0RjFcsS2wyX4wFvfD5xwAerAR9lOVrL
 YTpDlVt2LhrK2BfEQs6EgGedxeuvfrMrARjFPIaTnnFmUgz5cI1eHvqztN/k/agSvtgte2zCXW1J
 lwXnBK88wSgI9iE9tWo2DOKsd0rqhy+tapdwJ8uKml1tG0Pt3JsC5e/DlYVV9jqBtc/t9a3fvBg8
 I7q5hFKojyxxcVkDWpg3cUqnTXK7+jR2jt1xuwt6BW/LqWzUw+fkjzpuRAwX31WVY5lWjWxuGSRu
 xdeJD5/Wl4aBF+CY0mxh2pSR7yU2QIWCTCd5A9CNaN6pRWtLR0Mn2ASypXTCTfApisVZPVE5xgLw
 XEbnvqUcIYd16SviU/hmLrTy1VycMwgpTs2BZNjhN1NaK5LAGwujj33UzKaibcXCMztdU5OxbHAz
 rxMg36Jn7L4UIiMZgOGil2hsR99u5gXb6tWyU4Ig+a0jiD6XqsJZtjQxlyCdsey58WWBxScz+7ZU
 b5hec23OlEC8+erD3OkwDkKYW7EGE4s63RPvFAlfia6YLS5nqVcVQDVq6up0K/2HSasMXS5TKY5u
 jgGwWVuemfvhvSIcUI9y7ZZuUeOGm+4qk1nHR1YRFZ4oobg8BBg3Jq+ntzj0TU+pCeNHSwntkibz
 BzZIRllmsK3yNAFcZTU4WEP7zO9F/8lmxnreVxwZriCBLPTr/NeSktkx8jPiRNWYoYCItWbjO41F
 yBEqIaDudcVplPFtaXc7xOjH9dPpz2edJqwXnVPd3Rv7yHTtOavNlNtFUdd7RPkK3o/sjAPglERp
 S+MW3C/Zgln8It1ygSUkJAGD4r2nh0dmBVoho+yhCdMzNxGzP5KUoLsGY7m9SCwGWpgHbZtuKdsE
 YWqRhqAcba8sq/6xsNA0tMoVZz3DSMzt5eis4Xuj3CbeOaSyPKeW4H8n8Hbamu81eV+uiBiCWQZ4
 YWVFr7auOOhAKS4grcT7xQ==
X-Report-Abuse-To: spam@asave01.hostfactory.ch
Message-ID-Hash: ZIUBKMJNMTPSFMESNJVHUEB56KTIFPUW
X-Message-ID-Hash: ZIUBKMJNMTPSFMESNJVHUEB56KTIFPUW
X-MailFrom: michele.perrone@weiss.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIUBKMJNMTPSFMESNJVHUEB56KTIFPUW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dear Mr. Sakamoto,

sorry for the late reply.

I was aware of the fact that you maintain the Linux Firewire subsystem,
but I didn't know about the deprecation notice, so thanks for sending it.

So if I understand correctly, 2029 will be the last year when Firewire
functionality is supported by Linux? Does this mean that Firewire
functionality is going to be removed altogether after that?

Back to our devices - our firmware doesn't support TCAT protocol extension
unfortunately. That's why I had to write this patch in the first place:
only 44.1kHz and 48kHz could be selected.

About AVC, I had noticed your 'snd-firewire-ctl-services' project before.
I also compiled it and played with it, but since I was able to re-use our
old kernel-space AVC code with relatively little effort, I am currently
working on that option.
Nevertheless, I would be glad to assist you and making Weiss devices
supported by 'snd-firewire-ctl-services'.
Is there something else that you would need, apart from the configuration
ROMs? And also what is the preferred way for sending you the ROMs? Should
I open a pull request on your 'am-config-roms' repository on GitHub?

Kind regards,
Michele Perrone

On 31/07/23 16:06, Takashi Sakamoto wrote:
> Hi Mr. Michele,
>
> On Mon, Jul 31, 2023 at 10:09:14AM +0200, Michele Perrone wrote:
>> Dear Mr. Sakamoto,
>>
>> thank you very much for the prompt feedback, and also for your
>> contributions to the Linux audio Firewire stack during the last decade.
> Thanks. Nowadays I also maintain Linux FireWire subsystem itself[1][2][3].
>
>> We at Weiss Engineering would like to improve Linux support for our
>> Firewire devices in order to extend their lifetimes. We have also
>> occasionally received requests for Linux compatibility from some
>> customers.
>>
>> This is also motivated by the fact that the old DICE Apple driver, which was
>> originally developed by TCAT, is not maintained anymore and does not work on
>> Apple Silicon computers. Therefore, we would like to give the alternative of
>> running our devices on Linux if the customers decide to do.
> I know that no driver for 1394 OHCI hardware itself is included in recent
> MacOS anymore, regardless of hardware (x86_64/arm64). Your customer has no
> choice when continuing using their Weiss products.
>
>> We are also working on a update for our old music archive network player
>> (MAN301), which uses a DICE chip to interface with its DAC; so it seemed
>> only fair that owners of all Weiss devices based on DICE benefited from
>> this.
> That sounds great... However, let me note that the maintenance of Linux
> FireWire subsystem will be end in 2029, 6 years later (see the first
> reference link).
>
>> Sorry for mistakes 1, 2, and 3 (you can tell it's my first kernel patch).
>> And I indeed forgot to include the snd_dice_detect_weiss_formats() prototype
>> into the patch submittal.
>>
>> About the 4th issue, yes, the 'category_id' is still correct [1].
> Okay. ALSA dice driver has the mechanism to check category_id field
> against known values, while the check is skipped for explicit device
> entries which the patch adds. So this is just from my curiosity
> (I forgot the mechanism in the last message).
>
>> About the 5th issue, you are right both about the wrong tx/rx direction and
>> the absence of isochronous packets from the device. I checked the DICE
>> firmware code for the INT202 and we are indeed sending isochronous packets
>> from
>> the device. Therefore, the correct stream formats should look like this:
>>
>> +/* Weiss INT202: 192kHz unidirectional 2-channel digital Firewire interface
>> */
>> +static const struct dice_weiss_spec int202 = {
>> +    .tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
>> +    .rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
>> +    .has_midi   = false
>> +};
>>
>> I tested this configuration with XLR and RCA outputs, and it works
>> correctly.
> Good. I revised the patch and force-pushed to the remote repository
> (747ddada9f4f).
>
>> Sorry for the mistake, I don't have a deep knowledge about the old DICE
>> firmware because I've started working at Weiss Engineering only
>> recently.
>   
> You would have more resources about DICE chipset, and get more helps from
> your colleague than me. No worry about it, I guess.
>
> The rest of my concern is that TCAT protocol extension (EAP) support. In
> the extension, software can retrieve all of available stream format
> from the target device without switching mode of transmission frequency.
> If the device supports EAP, we do not necessarily to add hard-coded stream
> formats (please refer to the device entry with
> 'snd_dice_detect_extension_formats()'). I would like you to check
> specification of each Weiss product whether EAP is supported or not.
>
>> About the configuration ROMs, that shouldn't be an issue; let me get
>> back to you as soon as I speak with my colleague, Rolf Anderegg. He has
>> worked on our DICE devices in the past but he's on vacation right now.
> Once connecting device to IEEE 1394 bus, the content of configuration
> ROM is exposed in sysfs node of Linux system. You can make a file to
> contain it by redirecting the output to the file, like:
>
> $ cat /sys/bus/firewire/devices/fw1/config_rom > rom.img
>
>> Yet another topic is AVC support. We used to have support for it for the
>> DICE driver in the 3.x kernel, and we are in the process of re-adapting
>> that code.
>> But this should be probably discussed in a separate e-mail.
>   
> Okay. For your information, I write user space program names as
> 'snd-dice-ctl-service' as the part of 'snd-firewire-ctl-services'[4]. At
> present, it has no support for Weiss products[5], so I'm pleased if getting
> any help in your side.
>
> [1] https://git.kernel.org/torvalds/c/f3948874c340
> [2] https://www.phoronix.com/news/Linux-Firewire-New-Maintainer
> [3] https://www.phoronix.com/news/Linux-6.5-Firewire
> [4] https://github.com/alsa-project/snd-firewire-ctl-services
> [5] https://docs.rs/firewire-dice-protocols/0.2.0/firewire_dice_protocols/
>
>
> Thanks
>
> Takashi Sakamoto
