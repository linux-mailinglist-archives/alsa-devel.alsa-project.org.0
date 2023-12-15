Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2FC813F05
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 02:13:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4A2AA4E;
	Fri, 15 Dec 2023 02:12:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4A2AA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702602783;
	bh=eOh2w76epXnoIdMtefOQC54q8cDczdRbwN+tF7mVOFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q/Jr5qJjDHDowFX1K31pTtNJrtTLHYc9CxDykcKDieUvf6rCCusRG994JQ+ocVqb+
	 Q5q1RYZKTJ8tFY2YBCTYdVyTeObCO7DFnEmyTgqhEeoWWaZPp7JylyLc0cFGtQsQui
	 afX/TwhgQGynGGtnNyH2QoOKNeotPvL6Jo9Pl/OA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CB03F8025F; Fri, 15 Dec 2023 02:12:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18C26F80570;
	Fri, 15 Dec 2023 02:12:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D29FF8016A; Fri, 15 Dec 2023 02:12:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7101F80114
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 02:12:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7101F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KGpRlIci
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6ce6d926f76so991531b3a.1
        for <alsa-devel@alsa-project.org>;
 Thu, 14 Dec 2023 17:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702602725; x=1703207525;
 darn=alsa-project.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+g4nmmWvsjCaBabH40Hb8mQgp6iuqQQc0Zr1lhRMx7o=;
        b=KGpRlIcivlqcxhSIltOUUb846o1XDRiHhfLtSMh1oDKEDyfFO+gPaUqdkHXNEc2O1V
         arikRVNaghfTsuNs+xuxIipga3VgHTFyPkVvXB0EfOcFyl1gSUPxeiFKZRpZB/2LZ5VZ
         yIOUNNroZa4JcuLNknBzBi4+wHJzBSNlOTaJvrrzAXiOvxL2+1qWt8vT/krd2Fl0nOPN
         X5yHmNZPQt+KlOW4nx8rpMHQLKEDAjCy1R76hNS28EYVqkJnMSEu7LJwTJKWiVjoVvBu
         ICXHWq6f3wZ8oBy3QjTLKxh3V1+cKh0tD8lXBKo6AEBsFboE2kwrTw0hcO4C6c3/bVs3
         yqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702602725; x=1703207525;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+g4nmmWvsjCaBabH40Hb8mQgp6iuqQQc0Zr1lhRMx7o=;
        b=MgSGqeFtzyn9fGWRUpzVFVIQRCWsoB9KBycRWfCIyAgSON/sMMtL6Df/Ch/edVOA7W
         qNmbkkPT6SsFtGq0Sc6j6o4JHSw+CAE0LvZ/ij7esVejNo6t+3dcuHSDcz6RWBErYLew
         zZRwEn6sRnEITj9YZKOCOCtcvEbdsGkCe95K9eLrFet32R9eOCN+tgPYVDYsEe2PI6YV
         awKCLq4bNc64U09j9AWCU08ODnBOOFNgqKAZ/a+ajezR4A89BZZyxJTZ0AttigN7Bmci
         82vuhvDeC6bDZCTC0zU2KaQ9UchiwJMo5orORFFj8/TvLMPAy5FsQ/nYSgkCgb2PoW+0
         e+LA==
X-Gm-Message-State: AOJu0YymKe4qL9WNc3b5z/U6MQDW+gVE28sBg6VArp1phGepCVw8Rktx
	WaM4b7Y7SjgS4/cW3hOJePA=
X-Google-Smtp-Source: 
 AGHT+IHRMpgAV1a927SqRjiH8lbnEzONcDcQhVEfnUpHFVxOQ+hAeJnp1QdN+G97/bEr1lIlnEU7Ew==
X-Received: by 2002:a05:6a20:b712:b0:18b:b858:17a5 with SMTP id
 fg18-20020a056a20b71200b0018bb85817a5mr11015333pzb.28.1702602724486;
        Thu, 14 Dec 2023 17:12:04 -0800 (PST)
Received: from geday ([2804:7f2:8006:c0b7:587c:b127:54ce:1956])
        by smtp.gmail.com with ESMTPSA id
 y20-20020a056a00191400b006cbadbf20ddsm12331606pfi.187.2023.12.14.17.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 17:12:03 -0800 (PST)
Date: Thu, 14 Dec 2023 22:12:35 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Sebastien Alaiwan <sebastien.alaiwan+alsa@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: Getting a strange error code with Behringer UMC1820
Message-ID: <ZXuoAyvdQlOD67v5@geday>
References: <39898130-8f05-48d4-9e18-5456bfcf6acd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39898130-8f05-48d4-9e18-5456bfcf6acd@gmail.com>
Message-ID-Hash: 2KA2KRFHUSC3FK4SER7EWZPDFYOBKOBE
X-Message-ID-Hash: 2KA2KRFHUSC3FK4SER7EWZPDFYOBKOBE
X-MailFrom: geraldogabriel@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2KA2KRFHUSC3FK4SER7EWZPDFYOBKOBE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Dec 14, 2023 at 11:41:55PM +0100, Sebastien Alaiwan wrote:
> Hi,
> 
> I've been running some experiments on the Behringer UMC1820, which is a USB audio interface, supposedly class-compliant.
> I wrote a tiny program "alsa-sine" that simply plays silence on a given ALSA device ( please find the source for it at the bottom of this message ).
> This tiny program allows to specify the buffer size, and the period size ( Here, I'll always be using a buffer size of 256 ).
> 
> Here, i'm testing 5 values for the period size (the last command line argument). All period sizes work, except ... 127.

Hi Sebastien,

See https://www.alsa-project.org/wiki/FramesPeriods

Common period sizes are 2 or 3 since this is the number of times
the hardware will interrupt per buffer. It's curious behavior you have
found but I don't think it's a bug.

Regards,
Geraldo Nascimento

> See below:
> 
>      $ ./alsa_sine 'hw:CARD=UMC1820,DEV=0' 256 125
>      buffer_size=256 (asked 256), period_size=125 (asked 125), channels=12, format=S24_3LE (24 bpp)
>      OK
> 
>      $ ./alsa_sine 'hw:CARD=UMC1820,DEV=0' 256 126
>      buffer_size=256 (asked 256), period_size=126 (asked 126), channels=12, format=S24_3LE (24 bpp)
>      OK
> 
>      $ ./alsa_sine 'hw:CARD=UMC1820,DEV=0' 256 127
>      buffer_size=256 (asked 256), period_size=127 (asked 127), channels=12, format=S24_3LE (24 bpp)
>      [alsa_sine.c:66] error: snd_pcm_drain(pcm) : Input/output error
>      Aborting.
> 
>      $ ./alsa_sine 'hw:CARD=UMC1820,DEV=0' 256 128
>      buffer_size=256 (asked 256), period_size=128 (asked 128), channels=12, format=S24_3LE (24 bpp)
>      OK
> 
>      $ ./alsa_sine 'hw:CARD=UMC1820,DEV=0' 256 129
>      buffer_size=256 (asked 256), period_size=128 (asked 129), channels=12, format=S24_3LE (24 bpp)
>      OK
> 
> I also own a Virus TI, which also implements an USB audio interface, also supposedly class-compliant.
> So I ran the same test on it, and interestingly, there's no error:
> 
>      $ ./alsa_sine 'hw:CARD=TI,DEV=0' 256 125
>      buffer_size=256 (asked 256), period_size=125 (asked 125), channels=2, format=S16_LE (16 bpp)
>      OK
> 
>      $ ./alsa_sine 'hw:CARD=TI,DEV=0' 256 126
>      buffer_size=256 (asked 256), period_size=126 (asked 126), channels=2, format=S16_LE (16 bpp)
>      OK
> 
>      $ ./alsa_sine 'hw:CARD=TI,DEV=0' 256 127
>      buffer_size=256 (asked 256), period_size=127 (asked 127), channels=2, format=S16_LE (16 bpp)
>      OK
> 
>      $ ./alsa_sine 'hw:CARD=TI,DEV=0' 256 128
>      buffer_size=256 (asked 256), period_size=128 (asked 128), channels=2, format=S16_LE (16 bpp)
>      OK
> 
>      $ ./alsa_sine 'hw:CARD=TI,DEV=0' 256 129
>      buffer_size=256 (asked 256), period_size=128 (asked 129), channels=2, format=S16_LE (16 bpp)
>      OK
> 
> So at this point, I'm wondering if I might be doing something wrong. I'm not trying to achieve anything here other than trying to understand what's going on.
> Maybe the UMC1820 doesn't support a period size of 127 ? ( does it even make sense to say this? ) If so, how is it possible for an application to know about this limitation?
> Maybe my test program is simply incorrect, and it's behavior is undefined? But then, how can we explain the difference in behavior between the UMC1820 and the Virus TI ?
> 
> My kernel version is: Linux ANTEC 6.5.0-5-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.5.13-1 (2023-11-29) x86_64 GNU/Linux
> Also, Debian tells me I'm using the package: libasound 1.2.10-1
> 
> BTW, please let me know if this is not the proper mailing list to talk about such things!
> 
> Thanks,
> Sebastien Alaiwan
> 
> 
> 
> 
> 
> 
> //---------------------------------------------------------------
> // gcc alsa_sine.c -lasound
> #include <alsa/asoundlib.h>
> #include <stdio.h>
> 
> const int SampleRate = 48000;
> 
> void checkCall(int ret, const char* expr, const char* file, int line)
> {
>    if(ret < 0)
>    {
>      fprintf(stderr, "[%s:%d] error: %s : %s\nAborting.\n", file, line, expr, snd_strerror(ret));
>      exit(1);
>    }
> }
> 
> #define CHECK_CALL(a) checkCall(a, # a, __FILE__, __LINE__)
> 
> int main(int argc, char* argv[])
> {
>    if(argc != 4)
>    {
>      fprintf(stderr, "Usage: %s <device> <buffer_size> <period_size>\n", argv[0]);
>      return 1;
>    }
> 
>    const char* devName = argv[1];
>    const snd_pcm_uframes_t asked_buffer_size = atoi(argv[2]);
>    const snd_pcm_uframes_t asked_period_size = atoi(argv[3]);
> 
>    snd_pcm_t* pcm = NULL;
>    CHECK_CALL(snd_pcm_open(&pcm, devName, SND_PCM_STREAM_PLAYBACK, 0));
> 
>    snd_pcm_hw_params_t* hw_params = NULL;
>    CHECK_CALL(snd_pcm_hw_params_malloc(&hw_params));
>    CHECK_CALL(snd_pcm_hw_params_any(pcm, hw_params));
> 
>    snd_pcm_format_t fmt;
>    unsigned int channels = 0;
>    CHECK_CALL(snd_pcm_hw_params_get_format(hw_params, &fmt));
>    CHECK_CALL(snd_pcm_hw_params_get_channels_min(hw_params, &channels));
> 
>    snd_pcm_uframes_t buffer_size = asked_buffer_size;
>    snd_pcm_uframes_t period_size = asked_period_size;
>    CHECK_CALL(snd_pcm_hw_params_set_rate(pcm, hw_params, SampleRate, 0));
>    CHECK_CALL(snd_pcm_hw_params_set_access(pcm, hw_params, SND_PCM_ACCESS_RW_INTERLEAVED));
>    CHECK_CALL(snd_pcm_hw_params_set_buffer_size_near(pcm, hw_params, &buffer_size));
>    CHECK_CALL(snd_pcm_hw_params_set_period_size_near(pcm, hw_params, &period_size, NULL));
>    CHECK_CALL(snd_pcm_hw_params(pcm, hw_params));
>    snd_pcm_hw_params_free(hw_params);
> 
>    printf("buffer_size=%d (asked %d), ", (int)buffer_size, (int)asked_buffer_size);
>    printf("period_size=%d (asked %d), ", (int)period_size, (int)asked_period_size);
>    printf("channels=%d, ", channels);
>    printf("format=%s (%d bpp)\n", snd_pcm_format_name(fmt), snd_pcm_format_width(fmt));
> 
>    const int totalSamples = SampleRate * 1.0;
> 
>    int bitsPerSample = snd_pcm_format_width(fmt);
>    assert(bitsPerSample % 8 == 0);
>    int size = totalSamples * channels * bitsPerSample / 8;
>    uint8_t* buffer = (uint8_t*)malloc(size);
>    memset(buffer, 0, size);
>    CHECK_CALL(snd_pcm_writei(pcm, buffer, totalSamples));
>    free(buffer);
> 
>    CHECK_CALL(snd_pcm_drain(pcm));
>    snd_pcm_close(pcm);
> 
>    printf("OK\n");
>    return 0;
> }
> //---------------------------------------------------------------
> 
> 



