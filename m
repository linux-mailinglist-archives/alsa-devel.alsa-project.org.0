Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4F1768FAD
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 10:10:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBD3A828;
	Mon, 31 Jul 2023 10:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBD3A828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690791046;
	bh=p2Rvfw2SQhBfkZaMV8APah4QsQbk8URNr6pqE768AY4=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NAwBRYAJsgMplIWYL8Y4oA45P1hcNUv1FlZwNLiSYibEO3YIKWqWnuUa3HCOIj6Nv
	 aJryhLSvOF7b5Hp5Ne+5fXPlrFv6qIaSGCKYBSEapYkqt9brZaDbrGu10Zv6zTVYsi
	 Ojve4JuW+MFnQAR1vlWPA7qci414ITbk0UfQdxVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58F7EF80520; Mon, 31 Jul 2023 10:09:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF2DFF80149;
	Mon, 31 Jul 2023 10:09:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BDE5F8016D; Mon, 31 Jul 2023 10:09:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from asave03.hostfactory.ch (asave03.hostfactory.ch
 [185.16.174.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE70AF8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 10:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE70AF8015B
Received: from server11.hostfactory.ch ([185.117.169.60])
	by asave03.hostfactory.ch with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <michele.perrone@weiss.ch>)
	id 1qQNxr-0002nm-TE; Mon, 31 Jul 2023 10:09:18 +0200
Received: from [192.168.0.84]
 (156.14.3.213.static.wline.lns.sme.cust.swisscom.ch [213.3.14.156])
	(Authenticated sender: michele.perrone@weiss.ch)
	by server11.hostfactory.ch (Postfix) with ESMTPSA id 709534992C743;
	Mon, 31 Jul 2023 10:09:14 +0200 (CEST)
Message-ID: <7a0cf3fd-9e31-45e1-7aa4-97cab27dafa7@weiss.ch>
Date: Mon, 31 Jul 2023 10:09:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: dice: add stream format parameters for Weiss
 devices
Content-Language: en-US
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20230728131308.GA142765@workstation.local>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Rolf Anderegg <rolf.anderegg@weiss.ch>,
 Isabelle Kernhof <isabelle.kernhof@weiss.ch>
From: Michele Perrone <michele.perrone@weiss.ch>
In-Reply-To: <20230728131308.GA142765@workstation.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <169079095479.15375.221983064967477986@server11.hostfactory.ch>
X-PPP-Vhost: weiss.ch
X-Originating-IP: 185.117.169.60
X-SpamExperts-Domain: outboundprotection.hostfactory.ch
X-SpamExperts-Username: 185.117.169.60
Authentication-Results: hostfactory.ch;
 auth=pass smtp.auth=185.117.169.60@outboundprotection.hostfactory.ch
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.03)
X-Recommended-Action: accept
X-Filter-ID: 
 Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/v5gw5Bj8X7znB33xs9AkSPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5ynOqv5wVH0VS/etXvrFNNzaJlM0GUlwLkcZrRacppWhTh3
 wKoTBNAKgp9qBcKLgDljPyzCxIJm7qFlTroi9VKv/7Rl0Dd5eFQ0eM8i42SsSUGlz8CJSOMrvzx9
 TVg3RkWy7Ls4xhzpxJSfEMyKpBejp8jZ4AoGBlDR94YkH0RjFcsS2wyX4wFvfD5xwAerAR9lOVrL
 YTpDlVt2LhrK2BfEQs6EgGedxeuvfrMrARjFPJ3lBFw+LV6wnDcfFauiy+Lk/agSvtgte2zCXW1J
 lwXnj0ssQ2zaCgcDlOW2+OI0GErqhy+tapdwJ8uKml1tG0Pt3JsC5e/DlYVV9jqBtc/t9a3fvBg8
 I7q5hFKojyxxcVkDWpg3cUqnTXK7+jR2jt1xuwt6BW/LqWzUw+fkjzpuRAwX31WVY5lWjWxuGSRu
 xdeJD5/Wl4aBF+CY0mxh2pSR7yU2QIWCTCd5A9CNaN6pRWtLR0Mn2ASypXTCTfApisVZPVE5xgLw
 XEbnvqUcIYd16SviU/hmLrTy1VycMwgpTs2BZNjhN1NaK5LAGwujj33UzKaibcXCMztdU5OxbHAz
 rxMg36Jn7L4UIiMZgOGil2hsR99u5gXb6tWyU4Ig+a0jiD6XqsJZtjQxlyCdseymPsqA/MgizJkV
 qUxNFwNbUVQZ8xQOuo4fYBRy2FkvJmCmBVe5XMOAlSRlbQZgZJ1j0ghCgB3AKCQEmRSv27dfKvwb
 djke7SVxrvd2rXpB6h10JasFF7nZ+HZyDM5LbjKLBDMrD7q/cJogwbqzsuokElxJQcW/WnRbTnfF
 ZOkvKQEIPw6tv9DLy61IWO0M+Bi2lDCA27D0U+E3L7MVZDzO36h/+jrJDtL4ordoQsktTiG7X+t1
 TW39Ja77LGPpOwAp9N5KNpiiRi8pDUA3EXwVZsUrO1pQLFulr+0XJFLCc5JBDg/DuVS+6bxvXd/7
 letIjrtpibSb/SyV2tgPvU99YyY/YbCBRYqzuKqmj3A3J8ouFAUyHyD8hLK/N/PWsNsAev5dTaeU
 7SGsgkr4dGkXW6U4t9vNE4trlxFztZQ7GV5HQgbCLag5FuwzUW6yemp60T2QcASMfkrWmSkl0pF8
 dj8luXC7km26QtXP9s02LA==
X-Report-Abuse-To: spam@asave01.hostfactory.ch
Message-ID-Hash: LZX5B42ALESGDYBWP4CQPNMY6CDHK6K4
X-Message-ID-Hash: LZX5B42ALESGDYBWP4CQPNMY6CDHK6K4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LZX5B42ALESGDYBWP4CQPNMY6CDHK6K4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dear Mr. Sakamoto,

thank you very much for the prompt feedback, and also for your 
contributions to
the Linux audio Firewire stack during the last decade.

We at Weiss Engineering would like to improve Linux support for our Firewire
devices in order to extend their lifetimes. We have also occasionally 
received
requests for Linux compatibility from some customers.

This is also motivated by the fact that the old DICE Apple driver, which was
originally developed by TCAT, is not maintained anymore and does not work on
Apple Silicon computers. Therefore, we would like to give the alternative of
running our devices on Linux if the customers decide to do.

We are also working on a update for our old music archive network player
(MAN301), which uses a DICE chip to interface with its DAC; so it seemed 
only
fair that owners of all Weiss devices based on DICE benefited from this.

Sorry for mistakes 1, 2, and 3 (you can tell it's my first kernel patch).
And I indeed forgot to include the snd_dice_detect_weiss_formats() prototype
into the patch submittal.

About the 4th issue, yes, the 'category_id' is still correct [1].

About the 5th issue, you are right both about the wrong tx/rx direction and
the absence of isochronous packets from the device. I checked the DICE
firmware code for the INT202 and we are indeed sending isochronous 
packets from
the device. Therefore, the correct stream formats should look like this:

+/* Weiss INT202: 192kHz unidirectional 2-channel digital Firewire interface
*/
+static const struct dice_weiss_spec int202 = {
+    .tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .has_midi   = false
+};

I tested this configuration with XLR and RCA outputs, and it works 
correctly.
Sorry for the mistake, I don't have a deep knowledge about the old DICE
firmware because I've started working at Weiss Engineering only recently.

About the configuration ROMs, that shouldn't be an issue; let me get back to
you as soon as I speak with my colleague, Rolf Anderegg. He has worked 
on our
DICE devices in the past but he's on vacation right now.

Yet another topic is AVC support. We used to have support for it for the 
DICE
driver in the 3.x kernel, and we are in the process of re-adapting that 
code.
But this should be probably discussed in a separate e-mail.

[1]: 
https://github.com/torvalds/linux/commit/a471fcde8c2c4b65f110bb4210af3513ee4deeb8

Kind regards,
Michele Perrone


On 28/07/23 15:13, Takashi Sakamoto wrote:
> ei,
>
> On Fri, Jul 28, 2023 at 11:16:11AM +0200, Michele Perrone wrote:
>> Hard-coded stream format parameters are added for Weiss Engineering
>> FireWire devices. When the device vendor and model match, the parameters
>> are copied into the stream format cache. This allows for setting all
>> supported sampling rates up to 192kHz, and consequently adjusting the
>> number of available I/O channels.
>>
>> Signed-off-by: Rolf Anderegg <rolf.anderegg@weiss.ch>
>> Signed-off-by: Michele Perrone <michele.perrone@weiss.ch>
>> ---
>>   sound/firewire/dice/Makefile     |   2 +-
>>   sound/firewire/dice/dice-weiss.c | 120 +++++++++++++++++++++++++++++++
>>   sound/firewire/dice/dice.c       |  72 +++++++++++++++++++
>>   3 files changed, 193 insertions(+), 1 deletion(-)
>>   create mode 100644 sound/firewire/dice/dice-weiss.c
> Thanks for the patch. I've been waiting so long for such patches to
> support Weiss models. I welcome them.
>
> As long as reviewing, I found some format and technical issues on the
> patches:
>
> Format issues:
> 1.unexpected line break
> 2.tab indentations are replaced with spaces
>
> Technical issues:
> 3.build error due to missing snd_dice_detect_weiss_formats()
>    * prototype of snd_dice_detect_weiss_formats() should be in dice.c
> 4. category_id in GUID
> 5.stream formats for INT202
>
> I can correct 1st, 2nd, and 3rd issues. You can find the revised patch
> in the top-most of my remote repository[1].
>
> Let me confirm the 4th issue. TCAT defines 'category_id' field in GUID
> value of devices. As long as I know, Weiss engineers uses 0x00 in the
> field[2]. Is it still correct for the devices supported in the patch?
>
> Next, let us discuss about INT202 stream formats.
>
> +
> +/* Weiss INT202: 192kHz unidirectional 2-channel digital Firewire interface
> */
> +static const struct dice_weiss_spec int202 = {
> +    .tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> +    .rx_pcm_chs = {{0, 0, 0}, {0, 0, 0} },
> +    .has_midi   = false
> +};
>
> (tx/rx should be device-oriented, tx = from device, rx = to device,
> please correct)
>
> I assume all of the DICE devices transmit isochronous packets to deliver
> presentation time stamp and events (= PCM frames). Then driver software
> utilizes the presentation time stamp and the amount of events to construct
> payload of isochronous packets into the device.
>
> I program ALSA dice driver based on the assumption, thus ALSA dice driver
> doesn't work well without receiving any isochronous packet from the
> device. However, the stream formats for INT202 device looks to support
> uni-directional operation. Weiss engineers really use DICE chipset like
> that? If so, I need to integrate the driver to support the case.
>
>
> As another topic. I make collection of configuration ROMs[3] to make better
> support for the devices in Linux system[4]. I'm pleased if you pick them
> up from your devices and dedicate them for the collection.
>
> [1] https://github.com/takaswie/sound/tree/topic/dice/weiss-support
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/firewire/dice/dice.c?h=v6.4#n59
> [3] https://github.com/takaswie/am-config-roms/
> [4] https://github.com/systemd/systemd/blob/main/hwdb.d/80-ieee1394-unit-function.hwdb
>
>
> Thanks
>
> Takashi Sakamoto
