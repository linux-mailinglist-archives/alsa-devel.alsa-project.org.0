Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A08B41F32B
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 19:32:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91E4F16D0;
	Fri,  1 Oct 2021 19:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91E4F16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633109564;
	bh=gmEKZU5W99qF9pOm7Za7CT2JjAIKvGeX2mz6o8oscDQ=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FJW4KeElaZq4T5y33hSzJF7wS7HuCdEYmIbmhUSp+LOqB+L0an8gY2WbjTLmIS65c
	 /C2AnZiYEaRG5W5xagLsXA3oHDuxwef1nUL/DCJRvq+1d+JYs+zRJIUoltQzljQVC2
	 b1Hgg5X3INSkxElH7GVbVCs8kxWFHmOsHmhQhsE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF5FEF801F7;
	Fri,  1 Oct 2021 19:31:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E69DF80165; Fri,  1 Oct 2021 19:31:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4ED0DF80165
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 19:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ED0DF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TlBjut7o"
Received: by mail-pj1-x1029.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so7684083pji.2
 for <alsa-devel@alsa-project.org>; Fri, 01 Oct 2021 10:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:from:subject:message-id:date:user-agent:mime-version;
 bh=Iqf/bwMIvvMeqkEE2Efo7dOkLA4IGa2cfux2refYzIg=;
 b=TlBjut7on+8FUxI/pk+S8M46XklAGmKxcE3hKc88BZ3/5k11OlVQJ2iZvmTcWyc/dS
 DeOTojPPZyaaz5n5MM62Rj3SRB87Ika4h5aAgX6Uugmn2+A4MepUiuwjg0yV8/lrugEy
 0TSezzF4l/BfiE9zWvf2CWjnge9nsYVhq+fp9vW3uMWgM5QJR2OZsSYbX4Kmh2XRAVJH
 9+bH24ZiSVtB6PgYx1DnBBeAJGuSnmN8kTXNU+YtJGQN9bpyCd/xkgn//pG20tSTUxKS
 T7xJIK+J8/4uDaZtl/58Xxf3iSDFEPtY0/QxogBtPtxbKipa8b1gb1MoKRtBNoGCDct7
 bz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version;
 bh=Iqf/bwMIvvMeqkEE2Efo7dOkLA4IGa2cfux2refYzIg=;
 b=NRvpSroQbZsBNTFhYwJ8xMOayPCWQFd2Ot2MtKGNgJPvohwvtSZ/CoX0q7gOnBJ+/G
 uDQB2v7ZE+6OCzn/6zrVoJnp1nI3N4iqU+xOCgOwC5hxjz4OARCCtoQoBhr3AW5cJGHj
 sUnWyiQGqg8vIXpq/9xKdhzc71ivuO2OPsfp/GCczEH5pfqggykP1G+f4m/S3nWLbfdQ
 xB7i0u5eK2HnQvojMaGI5HIQRq3JMGIGyIBKY2URhrelSikJ0frUNwhBBoE5pXu0tpco
 1CHaJcBSQIddFhZppKi8OSRDLNl5pvDjsGquNXuX6F8Z0sWFIzIgCmpaIehpyzMu1r+3
 Vm/A==
X-Gm-Message-State: AOAM531dgDQQ9OYr0Os925fEWMQtDopmu9i63zGHc4ONsBqIOmYRsS4b
 ELLsAPMQPsI+AeLEyk5ZW4gn2z9qqmg=
X-Google-Smtp-Source: ABdhPJybvsXO7R7T9ngLNqBdTqZyY28hJ8tZ0D4seVSAiD6fxdA7MCRZBZTc3LgLRmpd9ohVdBZX9g==
X-Received: by 2002:a17:902:9a06:b0:13c:86d8:ce0b with SMTP id
 v6-20020a1709029a0600b0013c86d8ce0bmr11824304plp.51.1633109477377; 
 Fri, 01 Oct 2021 10:31:17 -0700 (PDT)
Received: from [0.0.0.0]
 (ec2-13-231-146-123.ap-northeast-1.compute.amazonaws.com. [13.231.146.123])
 by smtp.gmail.com with ESMTPSA id m12sm6083309pjv.29.2021.10.01.10.31.15
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 10:31:16 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: Zhang Boyang <zhangboyang.id@gmail.com>
Subject: [BUG?] Setting (start_threshold > stop_threshold) makes
 snd_pcm_writei(a_small_buffer) XRUN immediately
Message-ID: <0b00ad37-41a3-f078-6600-d3580ad903a1@gmail.com>
Date: Sat, 2 Oct 2021 01:31:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------088CBE33E2EF50EEBA033EA6"
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
--------------088CBE33E2EF50EEBA033EA6
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

   I'm using ALSA to develop an audio-streaming application. I try to 
use start_threshold and stop_threshold in combination with small 
buffers. However, I think I probably found a bug about this.
   I'm setting start_threshold=100 and stop_threshold=50. I'm also using 
a buffer of 44 frames. When I call 
snd_pcm_writei(the_small_44_frames_buffer), pcm state came to XRUN from 
PREPARED directly. I think this is a bug because the stream hasn't 
started. It's hard to say a xrun occurred while stream not started.
   I'm wondering if this is a ALSA-bug or a misuse of ALSA. A simple bug 
test program is attached.
   Thank you very much!

Zhang Boyang

p.s.
   I dug into kernel code. After writting hardware buffer, 
__snd_pcm_lib_xfer() called snd_pcm_update_state(), which set the XRUN 
state.

--------------088CBE33E2EF50EEBA033EA6
Content-Type: text/x-csrc; charset=UTF-8;
 name="start_stop_threshold_bug.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="start_stop_threshold_bug.c"

#define PCM_DEVICE "hw:1,0"

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
	snd_pcm_uframes_t frames;
	char *buff;
	int buff_size, loops;


	rate 	 = 44100;
	channels = 2;
	seconds  = 10;
	
	int start_threshold = 100;
	int stop_threshold = 50;

	/* Open the PCM device in playback mode */
	if ((pcm = snd_pcm_open(&pcm_handle, PCM_DEVICE,
					SND_PCM_STREAM_PLAYBACK, 0) < 0)) 
		printf("ERROR: Can't open \"%s\" PCM device. %s\n",
					PCM_DEVICE, snd_strerror(pcm));

	/* Allocate parameters object and fill it with default values*/
	snd_pcm_hw_params_alloca(&params);

	snd_pcm_hw_params_any(pcm_handle, params);

	/* Set parameters */
	snd_pcm_hw_params_set_rate_resample(pcm_handle, params, 0);

	if ((pcm = snd_pcm_hw_params_set_access(pcm_handle, params,
					SND_PCM_ACCESS_RW_INTERLEAVED) < 0)) 
		printf("ERROR: Can't set interleaved mode. %s\n", snd_strerror(pcm));

	if ((pcm = snd_pcm_hw_params_set_format(pcm_handle, params,
						SND_PCM_FORMAT_S16_LE) < 0))
		printf("ERROR: Can't set format. %s\n", snd_strerror(pcm));

	if ((pcm = snd_pcm_hw_params_set_channels(pcm_handle, params, channels) < 0))
		printf("ERROR: Can't set channels number. %s\n", snd_strerror(pcm));

	if ((pcm = snd_pcm_hw_params_set_rate_near(pcm_handle, params, &rate, 0) < 0))
		printf("ERROR: Can't set rate. %s\n", snd_strerror(pcm));

	/* Write parameters */
	if ((pcm = snd_pcm_hw_params(pcm_handle, params) < 0))
		printf("ERROR: Can't set harware parameters. %s\n", snd_strerror(pcm));

    snd_pcm_sw_params_t *swparams;
    snd_pcm_sw_params_alloca(&swparams);
    pcm = snd_pcm_sw_params_current(pcm_handle, swparams);
	if (pcm < 0) {
		printf("Unable to determine current swparams: %s", snd_strerror(pcm));
		return pcm;
	}
	pcm = snd_pcm_sw_params_set_start_threshold(pcm_handle, swparams, start_threshold);
	if (pcm < 0) {
		printf("Unable to set start threshold mode: %s", snd_strerror(pcm));
		return pcm;
	}
	pcm = snd_pcm_sw_params_set_stop_threshold(pcm_handle, swparams, stop_threshold);
	if (pcm < 0) {
		printf("Unable to set stop threshold mode: %s", snd_strerror(pcm));
		return pcm;
	}
	pcm = snd_pcm_sw_params(pcm_handle, swparams);
	if (pcm < 0) {
		printf("Unable to set sw params: %s", snd_strerror(pcm));
		return pcm;
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
	printf("rate: %d bps\n", tmp);

	printf("seconds: %d\n", seconds);	


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

--------------088CBE33E2EF50EEBA033EA6--
