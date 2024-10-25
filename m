Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6169B36DF
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2024 17:43:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0762EEB6;
	Mon, 28 Oct 2024 17:42:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0762EEB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730133787;
	bh=BCYPA7opkf7jGCoo9yRxqAJ++uDnsCLv0TOShZK2lOU=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qyg6Y0tkNK6W120IDB34kC/vPzhWgX8SHWU1AdnOyoJfds/KCvj2qQX4DuWLJK0+k
	 MAkPVUyvZLx32OpdWL+TrjyiNKh/2/+zCDKdbLmjKVrIIBn9u9k4s4TdRFDEP5v0c4
	 ugAlvSpJgXWFV84pH2GMb7w16WNF1UjRBR3UgM1o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF1E0F805BB; Mon, 28 Oct 2024 17:42:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2238F800E5;
	Mon, 28 Oct 2024 17:42:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CC8EF8016C; Fri, 25 Oct 2024 18:03:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98484F8014C
	for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2024 18:03:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98484F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tutamail.com header.i=@tutamail.com header.a=rsa-sha256
 header.s=s1 header.b=ocTsYsOJ
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 65DD4315E8C2
	for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2024 18:03:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729872205;
	s=s1; d=tutamail.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=+h4ZKfT/ON0Fzz3N05AVW09obYtt95On7po0uNDSek8=;
	b=ocTsYsOJlFYRRvrFkq4wr4mYhiQ+iLMfYQmn26TZqzuPf7RcYKbJM+LclRAUSBCW
	SJkN+k9GddSmQH7JJ8j5b6o38DnplKxvOYV2KCu9ZBp+WcQXbS5+me3eZ/BNLYjv4LM
	S9p3aMFrDPujs2ilW6+mL5KA4jGANpat6gszPBzTSFNf66bVELx1h/WrqvJf/kc79//
	sHdChQYlFzV5Zz7Olfhjf85qG2i0R2Z7rtoB5htPp04JDmTqKAuk7y7wphGFbd55i2N
	kZBl/C++XuhIsT1+fUEoMlgpaYqpV4+iqcZxkXfaQ6d/LnFtZs8aHWW3hw85Ben/Mxy
	kAs86KhqSA==
Date: Fri, 25 Oct 2024 18:03:25 +0200 (GMT+02:00)
From: Charles Mulder <charlesmulder@tutamail.com>
To: alsa-devel@alsa-project.org
Message-ID: <OA3PlJI--B-9@tutamail.com>
Subject: Help to solve pop when sound loops
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_13594_667909488.1729872205411"
X-MailFrom: charlesmulder@tutamail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5CGERLFJGZEKBJCZFLFOWXG6MZODW37K
X-Message-ID-Hash: 5CGERLFJGZEKBJCZFLFOWXG6MZODW37K
X-Mailman-Approved-At: Mon, 28 Oct 2024 16:42:30 +0000
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5CGERLFJGZEKBJCZFLFOWXG6MZODW37K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

------=_Part_13594_667909488.1729872205411
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi.

I hope this is the correct place to ask for help relating to ALSA's C lib?

I'm working on a wavetable project for college. Please see attached. 

I've managed to create a wavetable containing a sine wave.
The pitch can be altered via a frequency variable (f).

There is an audible popping sound when the sound loops. I have noticed that increasing the buffer size, postpones the pop.

I've been reading up on buffer > period > frames, but I don't know how to go about removing the pop.

Would really appreciate some guidance.

Thanks
C

-- 
 Sent with Tuta; enjoy secure & ad-free emails: 
 https://tuta.com

------=_Part_13594_667909488.1729872205411
Content-Type: text/x-csrc; charset=us-ascii; name=basic_alsa_wavetable.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=basic_alsa_wavetable.c

#include <stdio.h>
#include <alsa/asoundlib.h>
#include <math.h>

unsigned char sinuc( float );

#define TWOPI 2*M_PI
#define ALSA_INFO 1

static char *device = "default";            /* playback device */
unsigned char buffer[24*1024];              /* some random data */

/**
 * = ALSA  Frames
 * Frame is container for sending simultaneous samples.
 *  - Mono frame contains 1 sample.
 *  - Stereo frame contains 2 samples.
 *
 * = ALSA Ring Buffer
 * Store outgoing (playback) and incoming (capture, record) samples.
 * == Two pointers
 *  - current processed sample by hardware
 *  - last processed sample by application.
 */
int main(void) {

	// ALSA playback related
	int err; 
	snd_pcm_t *playback_handle; // pcm
	snd_pcm_hw_params_t *hw_params;
	unsigned int sbits, subformat, tick_time, access, channels, buffer_time, buffer_size, periods, period_time, rate, rate_num, rate_den, val, val2; // @todo more descriptive vars
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

	/* Display information about the PCM interface */
	if( ALSA_INFO == 1) {
		printf("PCM playback_handle name = '%s'\n", snd_pcm_name(playback_handle));

		printf("PCM state = %s\n",
				snd_pcm_state_name(snd_pcm_state(playback_handle)));

		snd_pcm_hw_params_get_access(hw_params, &access);
		printf("access type = %s\n", snd_pcm_access_name((snd_pcm_access_t)access));

		snd_pcm_hw_params_get_format(hw_params, &format);
		printf("format = '%s' (%s)\n",
				snd_pcm_format_name((snd_pcm_format_t)format),
				snd_pcm_format_description(
					(snd_pcm_format_t)format));

		snd_pcm_hw_params_get_subformat(hw_params, (snd_pcm_subformat_t *)&subformat);
		printf("subformat = '%s' (%s)\n",
				snd_pcm_subformat_name((snd_pcm_subformat_t)subformat),
				snd_pcm_subformat_description( (snd_pcm_subformat_t)subformat) );

		snd_pcm_hw_params_get_channels(hw_params, &channels);
		printf("channels = %d\n", channels);

		snd_pcm_hw_params_get_rate(hw_params, &rate, NULL);
		printf("rate = %d bps\n", rate);

		snd_pcm_hw_params_get_period_time(hw_params, &period_time, NULL);
		printf("period time = %d us\n", period_time);

		snd_pcm_hw_params_get_period_size(hw_params, &period_size, &dir);
		printf("period size = %d frames\n", (int)period_size);

		snd_pcm_hw_params_get_buffer_time(hw_params, &buffer_time, &dir);
		printf("buffer time = %d us\n", buffer_time);

		snd_pcm_hw_params_get_buffer_size(hw_params, (snd_pcm_uframes_t *) &buffer_size);
		printf("buffer size = %d frames\n", buffer_size);

		snd_pcm_hw_params_get_periods(hw_params, &periods, &dir);
		printf("periods per buffer = %d frames\n", periods);

		// rate numerator and denominator
		snd_pcm_hw_params_get_rate_numden(hw_params, &rate_num, &rate_den);
		printf("exact rate = %d/%d bps\n", rate_num, rate_den);

		sbits = snd_pcm_hw_params_get_sbits(hw_params);
		printf("significant bits = %d\n", sbits);

	}

	// Wavetable init
	unsigned char wavetable[N]; // wavetable buffer
	float angle_inc = TWOPI/(float)N; // sine wave angle increment
	float index_inc = N*f/(float)fs; // wavetable index increment
									 //printf("angle inc: %.4f\n", angle_inc);
									 //printf("index inc: %.4f\n", index_inc);

									 // Populate wavetable with a sine wave
	for( int n = 0; n < N; n++ ) {
		//wavetable[n] = sin( angle_inc * n ); // 0 - 1 range
		wavetable[n] = sinuc( angle_inc * n ); // 0 - 255 range
											   //printf("%d\n", wavetable[n]);
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


------=_Part_13594_667909488.1729872205411--
