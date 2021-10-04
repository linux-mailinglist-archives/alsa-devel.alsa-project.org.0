Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAB34208BE
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 11:50:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D24B1690;
	Mon,  4 Oct 2021 11:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D24B1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633341021;
	bh=CC0CoCEEaElxE6+MRQ9AORScNAJLTDu34rUJDzrknXc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SUgLSPUjM0QA+ruAferjYABBZ3vivl7Wga+oWedADKC6zH1hFP/6rWCEXBAltESyn
	 7+05ezxG/N++Y7CdwzCU9pDyG+NKCCR4KBOWZcI2Pqm3JqRWj8jfqeLvGhtlOtbNE8
	 juMrBkZcX98fD7Krs4x+4tYGsI0P2IHdP2FyZUTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B142FF800BA;
	Mon,  4 Oct 2021 11:49:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D9A7F80240; Mon,  4 Oct 2021 11:49:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BE1AF8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 11:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BE1AF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QkSkmFnZ"
Received: by mail-pl1-x636.google.com with SMTP id x4so10695144pln.5
 for <alsa-devel@alsa-project.org>; Mon, 04 Oct 2021 02:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=c5Y1MjKkV1Xfh14HUIl4pSu7mndl+Zf82GksOv+x+Iw=;
 b=QkSkmFnZXPG8pSACwoZhjNvUoUgba9mtVe8OhsNWwnnxbsR01kMqYix+aD610vu5U/
 m/TXp1jDVn9KvhFBoIo3C5hK40Q0FQ5dMuwaPzh0iQNp8XXHcpIqJB7LRdqsPWRaxGRn
 FKOINp5hvb3ENaqVRxTE4QHOyJ3JyOII1D9KWNqesKMwZ62iYibTKjnbrZYksjv/bCoe
 xprhBPV/7FJzJe/nH+8U3l5JG0k7brPO0egDq0fSZ/VyweTvXB+bQJsKvFELzGa0DwyL
 aasO/zGr9V2AgGPJbxv9sn8eVHL1/2L2U9jMVJ2CnKb03k/gR0owz7xx/scVUCj8cva0
 bP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=c5Y1MjKkV1Xfh14HUIl4pSu7mndl+Zf82GksOv+x+Iw=;
 b=d1vqH/vI7hM4A0p420vUzetQpv6xw2W9UgvgcvZcDVZSYFiKrOtLllx1/FEqSQgdj9
 uZITT1SrFYwaTg7IRs4G/+eTD0PDyRRv7u8EZbtvwnu9myhd2IP3M8L/v7wCtLfADkPl
 E1c7K+6/fHbgMkl+Oln+Oc92QpfTNae1dA8V9rT0TNbub9j9L+vSqGUnOvP2oUW91+2H
 ogkttOMFsdKoVLbJZ11wHBLCLwUs8UuoswN5z/OuLh0cHoV8+LPKT8Llh+WEkTc3LJDG
 9M35GNJS6vaFU1UBz+WyyYLeqIeu7YkuIgfZbgRpTV7+Hq9GMrG0dFBYDx5w8WdzXkNA
 eYkQ==
X-Gm-Message-State: AOAM532a8mBNt7aAQNEHn260Ethu0ALOlQDlGPVC0sKRXZVDTDqctiAt
 2OGqLhfialRNL+bghJHI85ReGtlu8xo=
X-Google-Smtp-Source: ABdhPJyiPYqiIMaYzYIztAK9kgxU6kA035jbw5XwpTAgGmNM1Pwg5rL94VOUb3REuEJB9bq6tBlzOA==
X-Received: by 2002:a17:902:aa90:b0:13e:2256:52c with SMTP id
 d16-20020a170902aa9000b0013e2256052cmr22368968plr.57.1633340933859; 
 Mon, 04 Oct 2021 02:48:53 -0700 (PDT)
Received: from [0.0.0.0]
 (ec2-13-231-146-123.ap-northeast-1.compute.amazonaws.com. [13.231.146.123])
 by smtp.gmail.com with ESMTPSA id h13sm13347845pgf.14.2021.10.04.02.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 02:48:53 -0700 (PDT)
Subject: Re: [BUG?] Setting (start_threshold > stop_threshold) makes
 snd_pcm_writei(a_small_buffer) XRUN immediately
To: Geraldo Nascimento <geraldogabriel@gmail.com>
References: <0b00ad37-41a3-f078-6600-d3580ad903a1@gmail.com>
 <YVeawIksIf1wKa2s@geday> <YVevasDJYHjIxwjg@geday> <YVfj7SA4uhYKWTH6@geday>
From: Zhang Boyang <zhangboyang.id@gmail.com>
Message-ID: <9bd7f88a-d2a3-b064-2ca7-7305012ef679@gmail.com>
Date: Mon, 4 Oct 2021 17:48:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YVfj7SA4uhYKWTH6@geday>
Content-Type: multipart/mixed; boundary="------------5A30954501AA26398565074D"
Cc: alsa-devel@alsa-project.org
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

This is a multi-part message in MIME format.
--------------5A30954501AA26398565074D
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit

On 2021/10/2 12:45, Geraldo Nascimento wrote:
> On Fri, Oct 01, 2021 at 10:01:34PM -0300, Geraldo Nascimento wrote:
>> On Fri, Oct 01, 2021 at 08:33:23PM -0300, Geraldo Nascimento wrote:
>>> On Sat, Oct 02, 2021 at 01:31:12AM +0800, Zhang Boyang wrote:
>>>> Hello,
>>>
>>> Hello, Zhang!
>>>
>>>>
>>>>     I'm using ALSA to develop an audio-streaming application. I try to
>>>> use start_threshold and stop_threshold in combination with small
>>>> buffers. However, I think I probably found a bug about this.
>>>>     I'm setting start_threshold=100 and stop_threshold=50. I'm also using
>>>> a buffer of 44 frames. When I call
>>>> snd_pcm_writei(the_small_44_frames_buffer), pcm state came to XRUN from
>>>> PREPARED directly. I think this is a bug because the stream hasn't
>>>> started. It's hard to say a xrun occurred while stream not started.
>>>>     I'm wondering if this is a ALSA-bug or a misuse of ALSA. A simple bug
>>>> test program is attached.
>>>
>>> No, I don't think it's a bug. You're bound to run into problems with a
>>> period size of only 44 frames.
>>>
>>> Moreover, working with the code you provided, I was able to get a RUNNING
>>> state without XRUNs with a period size of 4410 frames (100 milliseconds of
>>> audio) but I had to comment out snd_pcm_sw_params_set_stop_threshold() for
>>> it to work or I'd have those instant XRUNs.
>>>
>>> That's how snd_pcm_sw_params_set_stop_threshold() is supposed to work by
>>> the way. It creates a XRUN once the threshold is hit.
>>
>> Oh, and snd_pcm_sw_params_set_stop_threshold() is a little
>> counter-intuitive. The threshold you give the function is compared to
>> the available free space in the ring buffer, not the filled space.
>>
>> That's why lowering the stop threshold makes XRUNs more likely...
>>
>> Thanks,
>> Geraldo Nascimento
> 
> Zhang,
> 
> I was able to make your code work in the end, even with 44 frames
> writes, which is unadvisable since it eats too much CPU specially if
> they are low-end like the ARM64 box I'm writing you from.
> 
> The trick was to use high values such as 500000. Lower values such as
> 250000 were enough to trigger XRUNs in my machine. Of course you can set
> it to -1 and it will ignore XRUNs but that's a bit like setting it to
> 16777216 or 4096 * 4096 which is a hardcoded limit in alsa-lib, I
> believe.
> 
> And plainly ignoring XRUNs may sound bad under load, believe me.
> 
> Thank you,
> Geraldo Nascimento
> 
> 

Hi,

Thank you for your reply.

I realized my mistake about the meaning of stop_threshold. The 
stop_threshold should be (bufsz-50), where (bufsz = alsa buffer size). I 
fixed my code and new code is attached.

However, the problem still exists. I'm trying to minimize audio latency, 
so I must use a small buffer. In fact, the problem is not related to the 
absoulte size of buffer, but the relationship between the size of 
start_threshold, stop_threshold and the buffer. The problem still exists 
even using manual start mode (i.e. start_threshold>bufsz).

Currently, I'm using a workaround. After PREPARED or XRUN'd, I manually 
buffer incoming audio frames, and when (n_buffered_frames >= 
start_threshold && n_buffered_frames >= bufsz-stop_threshold), I write 
them in a single write() call. Note that the write must in whole, any 
short write may result in immediate XRUN.

Anyway, Thank you for your advice. Have a nice day. :)

Zhang Boyang

--------------5A30954501AA26398565074D
Content-Type: text/x-csrc; charset=UTF-8;
 name="start_stop_threshold_bug.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="start_stop_threshold_bug.c"

#define PCM_DEVICE "hw:0,0"

/*

gcc -Wall -o bug start_stop_threshold_bug.c -lasound
./bug

*/

/*
 * Simple sound playback using ALSA API and libasound.
 *
 * Compile:
 * $ cc -o play sound_playback.c -lasound
 *
 * Usage:
 * $ ./play <sample_rate> <channels> <seconds> < <file>
 *
 * Examples:
 * $ ./play 44100 2 5 < /dev/urandom
 * $ ./play 22050 1 8 < /path/to/file.wav
 *
 * Copyright (C) 2009 Alessandro Ghedini <al3xbio@gmail.com>
 * --------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * Alessandro Ghedini wrote this file. As long as you retain this
 * notice you can do whatever you want with this stuff. If we
 * meet some day, and you think this stuff is worth it, you can
 * buy me a beer in return.
 * --------------------------------------------------------------
 */

#include <alsa/asoundlib.h>
#include <stdio.h>

int main(int argc, char **argv) {
    unsigned int pcm, tmp;
    unsigned rate;
    int channels, seconds;
    snd_pcm_t *pcm_handle;
    snd_pcm_hw_params_t *params;
    snd_pcm_uframes_t frames, bufsz;
    char *buff;
    int buff_size, loops;


    rate     = 44100;
    channels = 2;
    seconds  = 10;

    /* Open the PCM device in playback mode */
    if ((pcm = snd_pcm_open(&pcm_handle, PCM_DEVICE,
                    SND_PCM_STREAM_PLAYBACK, 0) < 0)) {
        printf("ERROR: Can't open \"%s\" PCM device. %s\n",
                    PCM_DEVICE, snd_strerror(pcm));
        abort();
    }

    /* Allocate parameters object and fill it with default values*/
    snd_pcm_hw_params_alloca(&params);

    snd_pcm_hw_params_any(pcm_handle, params);

    /* Set parameters */
    snd_pcm_hw_params_set_rate_resample(pcm_handle, params, 0);

    if ((pcm = snd_pcm_hw_params_set_access(pcm_handle, params,
                    SND_PCM_ACCESS_RW_INTERLEAVED) < 0)) {
        printf("ERROR: Can't set interleaved mode. %s\n", snd_strerror(pcm));
        abort();
    }

    if ((pcm = snd_pcm_hw_params_set_format(pcm_handle, params,
                        SND_PCM_FORMAT_S16_LE) < 0)) {
        printf("ERROR: Can't set format. %s\n", snd_strerror(pcm));
        abort();
    }

    if ((pcm = snd_pcm_hw_params_set_channels(pcm_handle, params, channels) < 0)) {
        printf("ERROR: Can't set channels number. %s\n", snd_strerror(pcm));
        abort();
    }

    if ((pcm = snd_pcm_hw_params_set_rate_near(pcm_handle, params, &rate, 0) < 0)) {
        printf("ERROR: Can't set rate. %s\n", snd_strerror(pcm));
        abort();
    }

    /* Write parameters */
    if ((pcm = snd_pcm_hw_params(pcm_handle, params) < 0)) {
        printf("ERROR: Can't set harware parameters. %s\n", snd_strerror(pcm));
        abort();
    }
    
    if ((pcm = snd_pcm_hw_params_get_buffer_size(params, &bufsz) < 0)) {
        printf("ERROR: Can't get buffer size. %s\n", snd_strerror(pcm));
        abort();
    }


    int start_threshold = 100;
    int stop_threshold = bufsz - 50;

    snd_pcm_sw_params_t *swparams;
    snd_pcm_sw_params_alloca(&swparams);
    pcm = snd_pcm_sw_params_current(pcm_handle, swparams);
    if (pcm < 0) {
        printf("Unable to determine current swparams: %s", snd_strerror(pcm));
        abort();
    }
    pcm = snd_pcm_sw_params_set_start_threshold(pcm_handle, swparams, start_threshold);
    if (pcm < 0) {
        printf("Unable to set start threshold mode: %s", snd_strerror(pcm));
        abort();
    }
    pcm = snd_pcm_sw_params_set_stop_threshold(pcm_handle, swparams, stop_threshold);
    if (pcm < 0) {
        printf("Unable to set stop threshold mode: %s", snd_strerror(pcm));
        abort();
    }
    pcm = snd_pcm_sw_params(pcm_handle, swparams);
    if (pcm < 0) {
        printf("Unable to set sw params: %s", snd_strerror(pcm));
        abort();
    }

    /* Resume information */
    printf("PCM name: '%s'\n", snd_pcm_name(pcm_handle));

    printf("PCM state: %s\n", snd_pcm_state_name(snd_pcm_state(pcm_handle)));

    snd_pcm_hw_params_get_channels(params, &tmp);
    printf("channels: %i ", tmp);

    if (tmp == 1)
        printf("(mono)\n");
    else if (tmp == 2)
        printf("(stereo)\n");

    snd_pcm_hw_params_get_rate(params, &tmp, 0);
    printf("rate: %d\n", tmp);

    printf("seconds: %d\n", seconds);

    printf("bufsz: %ld\n", bufsz);
    printf("start_threshold: %d\n", start_threshold);
    printf("stop_threshold: %d\n", stop_threshold);

    frames = 44;
    buff_size = frames * channels * 2 /* 2 -> sample size */;
    buff = (char *) malloc(buff_size);
    memset(buff, 0, buff_size);

    snd_pcm_hw_params_get_period_time(params, &tmp, NULL);

    for (loops = (seconds * 1000000) / tmp; loops > 0; loops--) {
        printf("==== loop ====\n");
        printf("(before write) PCM state: %s\n", snd_pcm_state_name(snd_pcm_state(pcm_handle)));
        pcm = snd_pcm_writei(pcm_handle, buff, frames);
        printf("written %d\n", pcm);
        printf("(after write) PCM state: %s\n", snd_pcm_state_name(snd_pcm_state(pcm_handle)));
        if (pcm == -EPIPE) {
            printf("XRUN.\n");
            snd_pcm_prepare(pcm_handle);
            abort();
        } else if (pcm < 0) {
            printf("ERROR. Can't write to PCM device. %s\n", snd_strerror(pcm));
        }
    }

    snd_pcm_drain(pcm_handle);
    snd_pcm_close(pcm_handle);
    free(buff);

    return 0;
}

--------------5A30954501AA26398565074D--
