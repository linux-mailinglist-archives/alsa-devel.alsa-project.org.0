Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FC5AE413D
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jun 2025 14:56:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D320860198;
	Mon, 23 Jun 2025 14:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D320860198
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750683377;
	bh=fYYfARf/tCieNKzkwcoElWi8/WegeqoBwdnu3qk6e7c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XrkqP6xvFAnkUs/DNjozJI/OMj4bHibYeDCYmOcrxbo2BZcDs8DovVj+daviltzHS
	 UB6CErKEha6t6KgrDl8pwSBvwoPkeB4w08MzxA/xpsOnkCq33Ty4raJRyjafWbDn0k
	 grMg8BY1Dl2IA80TsMikkyJEBejVqo5M+42r73SA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F05AF805CB; Mon, 23 Jun 2025 14:55:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7270BF805C0;
	Mon, 23 Jun 2025 14:55:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 293F8F80424; Mon, 23 Jun 2025 14:55:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A8DBF8013D
	for <alsa-devel@alsa-project.org>; Mon, 23 Jun 2025 14:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A8DBF8013D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <184bad38693da800-webhooks-bot@alsa-project.org>
In-Reply-To: <184bad3869381000-webhooks-bot@alsa-project.org>
References: <184bad3869381000-webhooks-bot@alsa-project.org>
Subject: Call to snd_pcm_hw_params_get_buffer_size causes memory corruption in
 calling program
Date: Mon, 23 Jun 2025 14:55:40 +0200 (CEST)
Message-ID-Hash: BAGK7NCDJT6I375BRKECNDC72I4UVD5X
X-Message-ID-Hash: BAGK7NCDJT6I375BRKECNDC72I4UVD5X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BAGK7NCDJT6I375BRKECNDC72I4UVD5X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #461 was opened from harryrowe01:

Calling snd_pcm_hw_params_get_buffer_size is causing memory corruption in the calling program.

The following C program demonstrates the issue. 

/*

This example opens the default PCM device, sets
some parameters, and then displays the value
of some of the hardware parameters. It does not
perform any sound playback or recording.

*/

/* Use the newer ALSA API */
#define ALSA_PCM_NEW_HW_PARAMS_API

/* All of the ALSA library API is defined
 * in this header */
#include <alsa/asoundlib.h>

int main() {
  int rc;
  snd_pcm_t *handle;
  snd_pcm_hw_params_t *params, *save_params;
  unsigned int val, val2;
  int dir;
  snd_pcm_uframes_t frames;
  
  /* Open PCM device for playback. */
  rc = snd_pcm_open(&handle, "default",
                    SND_PCM_STREAM_PLAYBACK, 0);
  if (rc < 0) {
    fprintf(stderr,
            "unable to open pcm device: %s\n",
            snd_strerror(rc));
    exit(1);
  }

  /* Allocate a hardware parameters object. */
  snd_pcm_hw_params_alloca(&params);

  /* Fill it in with default values. */
  snd_pcm_hw_params_any(handle, params);

  /* Set the desired hardware parameters. */

  /* Interleaved mode */
  snd_pcm_hw_params_set_access(handle, params,
                      SND_PCM_ACCESS_RW_INTERLEAVED);

  /* Signed 16-bit little-endian format */
  snd_pcm_hw_params_set_format(handle, params,
                              SND_PCM_FORMAT_S16_LE);

  /* Two channels (stereo) */
  snd_pcm_hw_params_set_channels(handle, params, 2);

  /* 44100 bits/second sampling rate (CD quality) */
  val = 44100;
//  val = 8000;
  snd_pcm_hw_params_set_rate_near(handle,
                                 params, &val, &dir);

  /* Write the parameters to the driver */
  rc = snd_pcm_hw_params(handle, params);
  if (rc < 0) {
    fprintf(stderr,
            "unable to set hw parameters: %s\n",
            snd_strerror(rc));
    exit(1);
  }

  /* Display information about the PCM interface */

// Before calling snd_pcm_hw_params_get_buffer_size, save
// a copy of params which points to the parameter block.
  save_params = params;
  
// This call to snd_pcm_hw_params_get_buffer_size causes
// the value of params in main to be corrupted.
// Since the params argument to the function is passed
// by value, the function itself should not have access to
// the original variable in main.

  snd_pcm_hw_params_get_buffer_size(params,
                         (snd_pcm_uframes_t *)&val);
// Then if the pointer has been modified, flag the problem and
// restore the pointer from the saved value.
  if( params != save_params )
  {
     printf( "The pointer to the parameter block has been corrupted!\n" );
     printf( "was %lx \n", save_params );
     printf( "is now %lx \n", params );
     printf( "So I'm fixing it.\n" );
     params = save_params;
  }

  printf("buffer size = %u frames\n", val);

  snd_pcm_close(handle);

  return 0;
}

Compiled and run as follows:

harry@idun:~/Documents/morse$ cc bad_alsa.c -lasound -o bad_alsa
harry@idun:~/Documents/morse$ ./bad_alsa
The pointer to the parameter block has been corrupted!
was 7ffcd2011610 
is now 7ffc00000000 
So I'm fixing it.
buffer size = 1048576 frames
harry@idun:~/Documents/morse$ cc bad_alsa.c -lasound -o bad_alsa
harry@idun:~/Documents/morse$ ./bad_alsa
The pointer to the parameter block has been corrupted!
was 7fffc7483030 
is now 7fff00000000 
So I'm fixing it.
buffer size = 1048576 frames
harry@idun:~/Documents/morse$ 

Host is an AMD64 version of Debian 12. Installed version of ALSA library is libasound2 1.2.8-1+b1

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/461
Repository URL: https://github.com/alsa-project/alsa-lib
