Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2D37A8C33
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 21:03:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0958E823;
	Wed, 20 Sep 2023 21:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0958E823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695236579;
	bh=PXlN4ItvePwFfgO5wyn7V2I9nSbaaA3wXq8WeGVtTvM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OpfW/0N6RFSyXhRIqaNSj2/mlri4TPBtHkKGpjhaQxWlf9pkM45X8TjQD65urxlx4
	 XwtRU0ftuHO+DM2plTQIHcExO96sQu3tXwxH6hClYvuRgXpVe5wkJTVV+lsRmJXo6Q
	 s+SF3xWL2/Ynuh9fj/yGaHGaUOb/A/92h1heMRfQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4542EF800AA; Wed, 20 Sep 2023 21:02:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F019DF801F5;
	Wed, 20 Sep 2023 21:02:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C162F8025A; Wed, 20 Sep 2023 21:02:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 087B9F800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 21:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 087B9F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=soulik.info header.i=@soulik.info header.a=rsa-sha256
 header.s=mail header.b=XPLLQ27L
Received: from [192.168.10.7] (unknown [10.0.12.132])
	by kozue.soulik.info (Postfix) with ESMTPSA id A4890300245;
	Thu, 21 Sep 2023 04:01:32 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 kozue.soulik.info A4890300245
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soulik.info; s=mail;
	t=1695236493; bh=dUJ+d/kQJxopZsJIgL+sJr5P17iswTa/7jlXwIcJxfY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XPLLQ27LHeuwdJxwJEkx8Z75QGaDsu5oH7+35dzjrXJ6CT0zE67GdbfK09PPejCkR
	 xRnUpJEyqLa+ZeCWcL2CBt6/USd7V2l80aO7PDF8Xk6CjgoTbo2/OAO1E6535fFCRf
	 QQg3lNE5K+n3HY7GbDUpid0COD45Rj4Yok/j8wFM=
Message-ID: <5835be64-3704-5fdf-6798-b7de4a487a21@soulik.info>
Date: Thu, 21 Sep 2023 03:01:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: how to connect a midi client to non midi hardware sound card
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <156dd557-7ae3-8e76-7fb7-6a8ac407e4c3@soulik.info>
 <87h6nrzcyl.wl-tiwai@suse.de>
From: Randy Li <ayaka@soulik.info>
In-Reply-To: <87h6nrzcyl.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HC646VIYFTXP5ZAP4CJOPKHRT6ZB2NQJ
X-Message-ID-Hash: HC646VIYFTXP5ZAP4CJOPKHRT6ZB2NQJ
X-MailFrom: ayaka@soulik.info
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HC646VIYFTXP5ZAP4CJOPKHRT6ZB2NQJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 2023/9/19 00:02, Takashi Iwai wrote:
> On Thu, 07 Sep 2023 18:52:40 +0200,
> Randy Li wrote:
>> Hello All
>>
>> I am trying to refresh the ttymidi project, I have sent the merge
>> request to support the midi baudrate.
>>
>> The problem is the sound card in my PC is too new that it doesn't have
>> a midi input(I think the old hardware does).
>>
>> amidi -l would report:
>>
>> "cannot determine device number: Inappropriate ioctl for device"
>>
>> I think it is SNDRV_CTL_IOCTL_RAWMIDI_NEXT_DEVICE won't work here.
>>
>> Could I still use snd_seq_open() to create a midi client to the
>> system's sound card.
>>
>> Or I should try something different to make midi input work?
> The situation isn't really clear to me, just a wild guess: you're
> running a sequencer client and want to expose it as a (virtual) MIDI
> device that is accessed via rawmidi API?  If so, you can use
> snd-virmidi driver and bind a sequencer client:port to a virtual
> rawmidi device.

The ttymidi is making a serial port become a sequencer input and output.

I just found the midi usb keyboard page from archlinux, I think it 
solves my problem.

The fluidsynth would export a software synthesizer to the system, then I 
could connect my uart keyboard to it.

>
> Takashi
