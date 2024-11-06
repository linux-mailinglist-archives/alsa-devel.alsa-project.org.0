Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D269F9BE493
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2024 11:46:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 303A6F55;
	Wed,  6 Nov 2024 11:46:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 303A6F55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730890000;
	bh=8zmX0lMQRQcfXRxNWKotA5V3xADUXrT5lUV1I69ABC4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=eqYziLwZRioc+D/BeD/fRx0FVbVLD/5ru3iLWkjmHdu90pBPDT3sFU8O2ZCcwPWUX
	 uFpEXGA6kJXbdJaPehNuqW3AZGRVTgs6w/APVeW19RV6ySx8iJRJLsFG62I2jxNl0d
	 RUhgJjU7zAUFkt2R1OSQ0jR6DtVg2ZPOgX55KjW4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E205CF801F5; Wed,  6 Nov 2024 11:46:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC225F80534;
	Wed,  6 Nov 2024 11:46:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7317AF8013D; Wed,  6 Nov 2024 11:46:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A9578F800AA
	for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2024 11:45:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9578F800AA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1730889959056958199-webhooks-bot@alsa-project.org>
References: <1730889959056958199-webhooks-bot@alsa-project.org>
Subject: Help to solve pop when sound loops
Message-Id: <20241106104601.7317AF8013D@alsa1.perex.cz>
Date: Wed,  6 Nov 2024 11:46:01 +0100 (CET)
Message-ID-Hash: RPBRA26YWRGEUBAPE6LYXPGBLGFRH6CL
X-Message-ID-Hash: RPBRA26YWRGEUBAPE6LYXPGBLGFRH6CL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RPBRA26YWRGEUBAPE6LYXPGBLGFRH6CL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #417 was edited from charlesmulder:

Hi.

Apologies for asking for help here. I don't know where else to go. 

I'm working on a wavetable project for college.

I've managed to create a wavetable containing a sine wave. 
The pitch can be altered via a frequency variable (f). 

There is an audible popping sound when the sound loops. I have noticed that increasing the buffer size, postpones the pop.

I've been reading up on `buffer > period > frames`, but I don't know how to go about removing the pop. 

Would really appreciate some guidance. 

Thanks
C      

```c
#include <stdio.h>
#include <alsa/asoundlib.h>
#include <math.h>

unsigned char sinuc( float );

#define TWOPI 2*M_PI
#define ALSA_INFO 1

static char *device = "default";            /* playback device */
unsigned char buffer[24*1024];            

int main(void) {

        // ALSA playback related
        int err; 
        snd_pcm_t *playback_handle; // pcm
        snd_pcm_hw_params_t *hw_params;
        unsigned int val, val2; 
        int dir;
        snd_pcm_uframes_t period_size;
        snd_pcm_format_t format;

        // Wavetable related
        unsigned int N = 1024;
        float f = 440; // A4 note
        //float f = 261.626; // C4 note
        unsigned int fs = 44100;

        // playback
        if ((err = snd_pcm_open(&playback_handle, device, SND_PCM_STREAM_PLAYBACK, 0)) < 0) {                                                                          
                printf("Playback open error: %s\n", snd_strerror(err));                                                                                           
                exit(EXIT_FAILURE);                                                                                                                               
        }

        // ALSA configuration 

        /* Allocate a hardware parameters object. */
        snd_pcm_hw_params_alloca(&hw_params);

        /* Fill it in with default values. */
        snd_pcm_hw_params_any(playback_handle, hw_params);

        /* Set the desired hardware parameters. */

        /* Interleaved mode */
        snd_pcm_hw_params_set_access(playback_handle, hw_params,
                        SND_PCM_ACCESS_RW_INTERLEAVED);

        /* Unsigned 8-bit little-endian format */
        snd_pcm_hw_params_set_format(playback_handle, hw_params,
                        SND_PCM_FORMAT_U8);

        /* Two channels (stereo) */
        snd_pcm_hw_params_set_channels(playback_handle, hw_params, 1);

        /* 44100 bits/second sampling rate (CD quality) */
        snd_pcm_hw_params_set_rate_near(playback_handle,
                        hw_params, &fs, &dir);

         /* Set period size to 32 frames. */
        period_size = 32;
        snd_pcm_hw_params_set_period_size_near(playback_handle, hw_params, &period_size, &dir);

        /* Write the parameters to the driver */
        err = snd_pcm_hw_params(playback_handle, hw_params);
        if (err < 0) {
                fprintf(stderr,
                                "unable to set hw parameters: %s\n",
                                snd_strerror(err));
                exit(1);
        }

        // Wavetable init
        unsigned char wavetable[N]; // wavetable buffer
        float angle_inc = TWOPI/(float)N; // sine wave angle increment
        float index_inc = N*f/(float)fs; // wavetable index increment

        // Populate wavetable with a sine wave
        for( int n = 0; n < N; n++ ) {
                wavetable[n] = sinuc( angle_inc * n ); // 0 - 255 range
        }

        // ALSA Sample Buffer
        // period = 940 frames
        // buffer = 15052 frames
        float n = 0;
        for (int i = 0; i < sizeof(buffer)/sizeof(char); i++) {
                buffer[i] = wavetable[(int)n];
                //printf("%d\n",buffer[i]);
                n = n+index_inc;
                if( (int)n >= N ) {
                        n = 0;
                }
        }

        if ((err = snd_pcm_prepare (playback_handle)) < 0) {
                fprintf (stderr, "cannot prepare audio interface for use (%s)\n",
                                snd_strerror (err));
                exit (1);
        }

        //for (int i = 0; i < 16; i++) {
        while(1) {
                period_size = snd_pcm_writei(playback_handle, buffer, sizeof(buffer));
                if (period_size < 0)
                        period_size = snd_pcm_recover(playback_handle, period_size, 0);
                if (period_size < 0) {
                        printf("snd_pcm_writei failed: %s\n", snd_strerror(period_size));
                        break;
                }
                if (period_size > 0 && period_size < (long)sizeof(buffer))
                        printf("Short write (expected %li, wrote %li)\n", (long)sizeof(buffer), period_size);
        }

        // pass the remaining samples, otherwise they're dropped in close 
        err = snd_pcm_drain(playback_handle);
        if (err < 0)
                printf("snd_pcm_drain failed: %s\n", snd_strerror(err));

        //snd_pcm_hw_params_free(hw_params);
        snd_pcm_close(playback_handle);

        return 0;
}

/**
 * Sine unsigned char.
 * Scales sine output to a char
 * Original range -1 to 1.
 * New range 0 - 255.
 */
unsigned char sinuc( float angle ) {
        return (sinf( angle ) * 255 + 255) / 2;
}

```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/417
Repository URL: https://github.com/alsa-project/alsa-lib
