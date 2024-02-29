Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DF086C0A6
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 07:26:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22A3B9F6;
	Thu, 29 Feb 2024 07:26:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22A3B9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709188005;
	bh=+4kvN9h2RfOejwcb+pLVDu3z+Gb9Tp0Zs//i5jXrbxs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=n1m/cWXDJD9EOHcapRof4zDqyoaU+CUJ0SD/0cQV77JrZ/foHXILuEk+hm3uNXPdH
	 /7pBSOVLW/yhFqiZKaM6hWt3XxdwHvwsXDqIPdyNUZsS0r5pDQvLlhQf8YSdBVCErd
	 nMlxBCxc24pz1+X7bngOaM7jYHiYNEf+UOH/UQ1Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3233F805A1; Thu, 29 Feb 2024 07:26:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6F57F801C0;
	Thu, 29 Feb 2024 07:26:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DABACF8024C; Thu, 29 Feb 2024 07:24:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 82F4CF8013D
	for <alsa-devel@alsa-project.org>; Thu, 29 Feb 2024 07:24:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82F4CF8013D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1709187869858871222-webhooks-bot@alsa-project.org>
References: <1709187869858871222-webhooks-bot@alsa-project.org>
Subject: alsa cant initialize on raspberry pi 5
Message-Id: <20240229062435.DABACF8024C@alsa1.perex.cz>
Date: Thu, 29 Feb 2024 07:24:35 +0100 (CET)
Message-ID-Hash: 3KOAAJHPDSVUVIYL7JS2IF7TCJIS7EAH
X-Message-ID-Hash: 3KOAAJHPDSVUVIYL7JS2IF7TCJIS7EAH
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KOAAJHPDSVUVIYL7JS2IF7TCJIS7EAH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #386 was opened from sy-project:

I can use alsa command
```
# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: sndrpihifiberry [snd_rpi_hifiberry_dacplusadcpro], device 0: HiFiBerry DAC+ADC Pro HiFi multicodec-0 [HiFiBerry DAC+ADC Pro HiFi multicodec-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
# arecord -l
**** List of CAPTURE Hardware Devices ****
card 0: sndrpihifiberry [snd_rpi_hifiberry_dacplusadcpro], device 0: HiFiBerry DAC+ADC Pro HiFi multicodec-0 [HiFiBerry DAC+ADC Pro HiFi multicodec-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

and I can aplay to use wav file.
```
# aplay -D hw:0,0 /root/C_Code/audiotest/test1.wav
Playing WAVE '/root/C_Code/audiotest/test1.wav' : Signed 32 bit Little Endian, Rate 48000 Hz, Stereo
```

but I cant initialize on c code.
my code is here.
```c
    printf("alsa start\n");
    int err;
    snd_pcm_t *capture_handle, *playback_handle;
    snd_pcm_hw_params_t *hw_params;
    unsigned char *buffer;
    int sample_rate = SAMPLE_RATE;
    int dir;
    snd_pcm_uframes_t frames = 32;
    snd_pcm_uframes_t bufferSize, periodSize;
    double x_prev = 0.0;
    double y_prev = 0.0;
    double b0 = 1.0;
    double b1 = -0.8;
    double a1 = 0.0;

    printf("alsa open capture handle\n");
    err = snd_pcm_open(&capture_handle, "default", SND_PCM_STREAM_CAPTURE, 0);
    if(err < 0)
    {
        fprintf(stderr, "Capture open error: %s\n", snd_strerror(err));
        exit(1);
    }

    printf("alsa open playback handle\n");
    err = snd_pcm_open(&playback_handle, "default", SND_PCM_STREAM_PLAYBACK, 0);
    if(err < 0)
    {
        fprintf(stderr, "Playback open error: %s\n", snd_strerror(err));
        exit(1);
    }

    printf("alsa pcm hw param alloc\n");
    snd_pcm_hw_params_alloca(&hw_params);

    printf("alsa capture_handle set start\n");
    err = snd_pcm_hw_params_any(capture_handle, hw_params);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params_any cant set hw params. [%s]\n", snd_strerror(err));
        exit(1);
    }
    err = snd_pcm_hw_params_set_access(capture_handle, hw_params, SND_PCM_ACCESS_RW_INTERLEAVED);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params_set_access cant set hw params. [%s]\n", snd_strerror(err));
        exit(1);
    }
    err = snd_pcm_hw_params_set_format(capture_handle, hw_params, SND_PCM_FORMAT_S16_LE);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params_set_format cant set hw params. [%s]\n", snd_strerror(err));
        exit(1);
    }
    err = snd_pcm_hw_params_set_channels(capture_handle, hw_params, NUM_CHANNELS);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params_set_channels cant set hw params. [%s]\n", snd_strerror(err));
        exit(1);
    }
    err = snd_pcm_hw_params_set_rate_near(capture_handle, hw_params, &sample_rate, &dir);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params_set_rate_near cant set hw params. [%s]\n", snd_strerror(err));
        exit(1);
    }
    err = snd_pcm_hw_params_set_buffer_size_near(capture_handle, hw_params, &bufferSize);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params_set_buffer_size_near cant set hw params. [%s]\n", snd_strerror(err));
        exit(1);
    }
    err = snd_pcm_hw_params_set_period_size_near(capture_handle, hw_params, &periodSize, &dir);
    if (err < 0) {
        fprintf(stderr, "snd_pcm_hw_params_set_period_size_near cant set hw params. [%s]\n", snd_strerror(err));
        exit(1);
    }
    err = snd_pcm_hw_params(capture_handle, hw_params);
    if (err < 0) {
        fprintf(stderr, "alsa cant set hw params. [%s]\n", snd_strerror(err));
        exit(1);
    }
    snd_pcm_hw_params_get_buffer_size(hw_params, &bufferSize);
    snd_pcm_hw_params_get_period_size(hw_params, &periodSize, &dir);

    printf("Buffer size: %lu frames\n", bufferSize);
    printf("Period size: %lu frames\n", periodSize);

    printf("alsa playback_handle set start\n");
    snd_pcm_hw_params_any(playback_handle, hw_params);
    snd_pcm_hw_params_set_access(playback_handle, hw_params, SND_PCM_ACCESS_RW_INTERLEAVED);
    snd_pcm_hw_params_set_format(playback_handle, hw_params, SND_PCM_FORMAT_S16_LE);
    snd_pcm_hw_params_set_channels(playback_handle, hw_params, NUM_CHANNELS);
    snd_pcm_hw_params_set_rate_near(playback_handle, hw_params, &sample_rate, 0);
    snd_pcm_hw_params(playback_handle, hw_params);
    printf("alsa playback_handle set success\n");

    printf("alsa buf malloc\n");
    buffer = (unsigned char*)malloc(BUFFER_SIZE*NUM_CHANNELS*2);

    while(1)
    {
        printf("main loop start\n");
        err = snd_pcm_readi(capture_handle, buffer, BUFFER_SIZE);
        if(err<0)
        {
            fprintf(stderr, "Capture read error[%d]: %s\n", err, snd_strerror(err));
            break;
        }

        for(int i = 0; i < BUFFER_SIZE * NUM_CHANNELS * 2; i += 2)
        {
            short sample = ((short)buffer[i + 1] << 8) | buffer[i];
            double x = (double)sample / 32768.0;

            double y = b0 * x + b1 * x_prev + a1 * y_prev;

            x_prev = x;
            y_prev = y;

            short filter_sample = (short)(y * 32768.0);
            buffer[i] = (unsigned char)(filter_sample & 0xFF);
            buffer[i+1] = (unsigned char)((filter_sample >> 8) & 0xFF);
        }

        err = snd_pcm_writei(playback_handle, buffer, BUFFER_SIZE);
        if(err < 0)
        {
            fprintf(stderr, "Playback write error: %s\n", snd_strerror(err));
            break;
        }
    }
    free(buffer);
    snd_pcm_close(capture_handle);
    snd_pcm_close(playback_handle);
    exit(0);
```

This code said
```
alsa start
alsa open capture handle
alsa open playback handle
alsa pcm hw param alloc
alsa capture_handle set start
snd_pcm_hw_params_set_buffer_size_near cant set hw params. [Invalid argument]
```

what should I do?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/386
Repository URL: https://github.com/alsa-project/alsa-lib
