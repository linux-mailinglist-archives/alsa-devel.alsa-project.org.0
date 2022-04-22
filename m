Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E81A50BDA1
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 18:53:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 230FC1727;
	Fri, 22 Apr 2022 18:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 230FC1727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650646394;
	bh=eVewUjUSKlUS6h7gydmxZzciNW79TEuirlSA4udigok=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e+VHxeS64LY9g4+RdyLN3QDydy9rcH6wF9B2TckHYLNxe25OZJ6Rt/aLuwFIKeeIq
	 IlzMZXG34s03kxc9XeeZOa/rg8H5SG19KZ/iorpCX+o57x+Ne3X1enpSezoX2BNxPC
	 AO2lE7Ykn5447xxC0hxpMlb2ug9AjJkQkbZVwLmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 739ACF80249;
	Fri, 22 Apr 2022 18:52:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4191F80245; Fri, 22 Apr 2022 18:52:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2797F80125
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 18:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2797F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mQTYFqqW"
Received: by mail-io1-xd33.google.com with SMTP id h83so9192849iof.8
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 09:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9TkmnipbgUqgTzZ4m2RXz9yLvdEaezX58jOfavdXHJs=;
 b=mQTYFqqW0kctQ5xHz98FLHUrAR7iGtta5/7d6hqBgNgDYJApyMzFp3LqAZYqci3it3
 Opvppkbb2mXIyQFMYKWUlVXYrUab4sb6/yD++hVKNyRQeHso8OS3vwvqUzQbSY+mk+9R
 VjHnuqT6X+sAT7tl5wONzQ/D06J8Ul86yVV/3rpTYuLsiKcHa6NXarKnxhEp5y6zmcf4
 7YVrfiyG8kw+YPfv2tVEkd0vKtlqPCaNtHuj5yBaYWo2udqaNQrthJCYxT+eRiBmo2Ec
 aZaPcG0RVanh1iesNddT4xxo3NQSWjTkEwx6g+MLJtanKyIr10GWjY02mfSuelQinVdx
 lHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9TkmnipbgUqgTzZ4m2RXz9yLvdEaezX58jOfavdXHJs=;
 b=Bu31MQDBvu6mlIgktI8N7WbHYIPwlKDncrbaiJelkfnIZUq4gOORhYoAFN2F1rnKDO
 WdZW36kEMPc+/y4un/+ayX7qO5kUzvVVFPq+dWT3A8wOZFilZXwZ62sCAtYEfFS7OZrZ
 1uluUdJGdDsrqarl0gTUlgzSAVTJo57mQVuzG3rNU/nuAPRxP89Np5CiRNl+ETXlV358
 jJA7qVCfeF6pmNJhDGgM+MV22QX5X/3ZhP4lSsFCs4nhWY/mciKlbEE0YR2lbgfRX9Dx
 NgUKvA9Ukrqo/ZbJFo9UJDgJgrrx7RiI0zGS+sj3rEzGmf+yL1h8IFY0F+cgOG/H+JYi
 NRyA==
X-Gm-Message-State: AOAM531NGiPDBadMUA3w4Ht8RX6Z9NIUgilM4NmREu2mR/Izz2DFPMCR
 m/D/4nRCV6sGbldtPJFS7CU=
X-Google-Smtp-Source: ABdhPJwBSaPwqIXG2K5l8VDnDTXGyZzolevjJVWiGw3WruHjFgA9TJfateiNK7A/YAbT9dEyu4rVFQ==
X-Received: by 2002:a05:6638:25b:b0:328:858d:9ac1 with SMTP id
 w27-20020a056638025b00b00328858d9ac1mr2554070jaq.198.1650646326372; 
 Fri, 22 Apr 2022 09:52:06 -0700 (PDT)
Received: from [10.0.0.99] (cpe-65-29-252-111.wi.res.rr.com. [65.29.252.111])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a923301000000b002cae7560bfesm1567286ilf.62.2022.04.22.09.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 09:52:06 -0700 (PDT)
Message-ID: <e784e2c9-ee28-7df6-a030-d77eb9b01cc6@gmail.com>
Date: Fri, 22 Apr 2022 11:52:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/2] Add generic serial MIDI driver using serial bus API
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220421172427.703231-1-kaehndan@gmail.com>
 <20220421172427.703231-3-kaehndan@gmail.com> <s5hzgkdry4x.wl-tiwai@suse.de>
From: Daniel Kaehn <kaehndan@gmail.com>
In-Reply-To: <s5hzgkdry4x.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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


Thanks for taking the time to look at this. I've responded to your 
comments below, but ultimately agree with all of them, and will update 
accordingly.


On 4/22/22 09:27, Takashi Iwai wrote:
> On Thu, 21 Apr 2022 19:24:27 +0200,
> Daniel Kaehn wrote:
>>
>> Generic serial MIDI driver adding support for using serial devices
>> compatible with the serial bus as raw MIDI devices, allowing using
>> additional serial devices not compatible with the existing
>> serial-u16550 driver. Supports only setting standard serial baudrates on
>> the underlying serial device; however, the underlying serial device can
>> be configured so that a requested 38.4 kBaud is actually the standard MIDI
>> 31.25 kBaud. Supports DeviceTree configuration.
>>
>> Signed-off-by: Daniel Kaehn <kaehndan@gmail.com>
>> ---
>>
>> One ugly portion in the code I wanted to point out, but didn't find a
>> 'nice' way of solving. `snd_serial_generic_output_write` is called to
>> read from ALSA's output MIDI buffer and write to the serdev_device's
>> input buffer. While copying directly from the former to the later would
>> be desirable for performance, I assume violating the abstraction would
>> never be permissable. The current implementation creates an internal buffer of
>> an arbitrary size (currently 256) and copies there as an intermediate
>> step. Any advice on how to make this better is appreciated.
> 
> It's OK, as MIDI data isn't that huge and fast, and the optimization
> is done at any time later.
>  > About the code: in general, please avoid the use of snd_printk() and
> co.  Those are old helpers, and better to use dev_err(), dev_dbg(),
> etc, if possible.
> 

Good to know, will fix. Saw them in the ALSA headers and assumed that's 
what I should be using.


> Some more nitpicking:
> 
>> +static int snd_serial_generic_ensure_serdev_open(struct snd_serial_generic *drvdata)
>> +{
>> +	int err = 0;
> 
> Superfluous initialization.
> 

That it is... will fix.


>> +	unsigned int actual_baud;
>> +
>> +	if (drvdata->filemode == SERIAL_MODE_NOT_OPENED) {
> 
> This expression is rather confusing.  It's essentially a zero check,
> and the simple zero check is rather easier to understand that there is
> no opener, i.e.
> 
> 	if (!drvdata->filemode) {
> 		.....
> 

Fair enough. My goal was to be as consistent as I could with the 
existing serial midi driver - but I suppose that is quite old. This will 
be changed.


>> +static int snd_serial_generic_input_open(struct snd_rawmidi_substream *substream)
>> +{
>> +	int err = 0;
> 
> Superfluous.
> 

Will fix as well.


>> +	struct snd_serial_generic *drvdata = substream->rmidi->private_data;
>> +
>> +	snd_printd("snd-serial-generic: DEBUG - Opening input for card %s\n",
>> +		drvdata->card->shortname);
>> +
>> +	err = snd_serial_generic_ensure_serdev_open(drvdata);
>> +	if (err < 0) {
>> +		snd_printk(KERN_WARNING "snd-serial-generic: failed to open input for card %s",
>> +			drvdata->card->shortname);
> 
> Spewing an error message at each time would fill up the kernel log
> unnecessarily.  Make it a debug message, if you really need to print
> something.
> 

Good point - now that I think of it, the real purpose of this was for 
debugging.

Will remove.

>> +static int snd_serial_generic_input_close(struct snd_rawmidi_substream *substream)
>> +{
>> +	struct snd_serial_generic *drvdata = substream->rmidi->private_data;
>> +
>> +	drvdata->filemode &= ~SERIAL_MODE_INPUT_OPEN;
>> +	drvdata->midi_input = NULL;
>> +	if (drvdata->filemode == SERIAL_MODE_NOT_OPENED)
> 
> Use zero check instead.  (Ditto for *_output functions).
> 

Will update.


>> +#define INTERNAL_BUF_SIZE 256
>> +
>> +static void snd_serial_generic_output_write(struct snd_rawmidi_substream *substream)
>> +{
>> +	static char buf[INTERNAL_BUF_SIZE];
>> +	int num_bytes;
>> +	struct snd_serial_generic *drvdata = substream->rmidi->private_data;
>> +
>> +	num_bytes = snd_rawmidi_transmit_peek(substream, buf, INTERNAL_BUF_SIZE);
>> +	num_bytes = serdev_device_write_buf(drvdata->serdev, buf, num_bytes);
>> +	snd_rawmidi_transmit_ack(substream, num_bytes);
> 
> This needs to be a loop to process all pending bytes?
> 

Part of me was assuming the buffer size should be made big enough so 
that this wouldn't have to loop (and the rest of the data would still 
get processed when _wakeup is called) - but agree that it'd definitely 
better to make sure that either the rawmidi buffer is empty or the 
serdev buffer is full before exiting. Will update.

>> +static int snd_serial_generic_receive_buf(struct serdev_device *serdev,
>> +				const unsigned char *buf, size_t count)
>> +{
>> +	int ret = 0;
> 
> Superfluous initialization.
> 

I guess I really got in the habit of initializing values to zero.. will fix.


>> +static int snd_serial_generic_create(struct serdev_device *serdev,
>> +				struct snd_card *card,
>> +				struct snd_serial_generic **rserialmidi)
>> +{
>> +	struct snd_serial_generic *drvdata;
>> +	int err;
>> +
>> +	drvdata = devm_kzalloc(card->dev, sizeof(*drvdata), GFP_KERNEL);
>> +	if (!drvdata)
>> +		return -ENOMEM;
>> +
>> +	drvdata->serdev = serdev;
>> +	drvdata->card = card;
> 
> You can use card's private_data instead of an extra kmalloc().
> (Pass sizeof(*drvdata) to the extra_size argument of
> snd_devm_card_new()).
> 
>> +	if (serdev->dev.of_node) {
>> +		err = of_property_read_u32(serdev->dev.of_node, "speed", &drvdata->baudrate);
> 
> So, as we rely on of_node, the Kconfig should have the dependency,
> too?
> 

Good point. I thought about this for a while, which is partially why I 
wrote in the ability for the only DT param of 'speed' to not be 
specified, using the default of the underlying serial device, in case 
there was a use case for this on a non DT-enabled system, where someone 
might manually bind the driver. I do agree though, since this was 
definitely intended to be used with DT.

I'll add that as a dependency for now, and see if there's a future need 
to use without DT.


>> +static int __init alsa_card_serial_generic_init(void)
>> +{
>> +	snd_printk(KERN_INFO "snd-serial-generic: Generic serial-based MIDI device\n");
>> +	return serdev_device_driver_register(&snd_serial_generic_driver);
>> +}
>> +
>> +static void __exit alsa_card_serial_generic_exit(void)
>> +{
>> +	serdev_device_driver_unregister(&snd_serial_generic_driver);
>> +}
>> +
>> +module_init(alsa_card_serial_generic_init)
>> +module_exit(alsa_card_serial_generic_exit)
> 
> Those are simplified with module_serdev_device_driver()?
> 

Will update.
> 
> thanks,
> 
> Takashi

Thanks again for the comments!

Daniel Kaehn
