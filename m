Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C857E6F656A
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 09:05:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A2371843;
	Thu,  4 May 2023 09:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A2371843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683183914;
	bh=qAFMAmHztRK4PLx5Yt/5IO1j/RWoWPa4vUVm1tTNKJU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PAWXJuK4OZeJJL5RHbagAH/K1GS0pPBLf7hdmcLFXC3exgDl+oqbSZhx/FDQhYl1U
	 /fc4D1sVdThMPMOMG//E90huG4D7v8stYs4yr8ZmbzFBPnuoSGNvsL5KBCtGPsB2aS
	 tGck7KBWjR3iNBCAcdCqFahKsRWKC/AiABLuOlSs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57427F8051B;
	Thu,  4 May 2023 09:03:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F269FF8049E; Thu,  4 May 2023 09:03:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E120F800EC
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 09:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E120F800EC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1683183808383171558-webhooks-bot@alsa-project.org>
References: <1683183808383171558-webhooks-bot@alsa-project.org>
Subject: alsalib assertion using plug+dmix
Message-Id: <20230504070329.F269FF8049E@alsa1.perex.cz>
Date: Thu,  4 May 2023 09:03:29 +0200 (CEST)
Message-ID-Hash: N5GLTCTO4LP2ZGLEKO4IZAUVB6QDCFUO
X-Message-ID-Hash: N5GLTCTO4LP2ZGLEKO4IZAUVB6QDCFUO
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N5GLTCTO4LP2ZGLEKO4IZAUVB6QDCFUO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #314 was opened from npitre:

The espeak program is crashing randomly here. I've been able to isolate 
the issue in a small test program demonstrating the crash 100% of the time, 
ending in:

```
alsa_quickcrash: pcm.c:3236: snd_pcm_area_copy: Assertion `src < dst || src >= dst + bytes' failed.
Aborted (core dumped)
```

Here's the test code:

```
/* to compile: gcc -O2 -Wall -o alsa_quickcrash alsa_quickcrash.c -lasound */

#include <alsa/asoundlib.h>
#include <stdio.h>
#include <string.h>

#define DEVICE "test_dummy"
#define RATE 22050
#define CHANNELS 1
#define FORMAT SND_PCM_FORMAT_S16_LE
#define BUF_MS 60

#define DO(x) if (x < 0) { fprintf(stderr, "%s failed\n", #x); exit(1); }

int main()
{
	unsigned int rate = RATE;
	snd_pcm_uframes_t frames = RATE * BUF_MS / 1000;
	snd_pcm_t *handle;
	snd_pcm_hw_params_t *params;

	DO(snd_pcm_hw_params_malloc(&params));
	DO(snd_pcm_open(&handle, DEVICE, SND_PCM_STREAM_PLAYBACK, 0));
	DO(snd_pcm_hw_params_any(handle, params));
	DO(snd_pcm_hw_params_set_access(handle, params, SND_PCM_ACCESS_RW_INTERLEAVED));
	DO(snd_pcm_hw_params_set_format(handle, params, FORMAT));
	DO(snd_pcm_hw_params_set_rate_near(handle, params, &rate, 0));
	DO(snd_pcm_hw_params_set_channels(handle, params, CHANNELS));
	DO(snd_pcm_hw_params_set_buffer_size_near(handle, params, &frames));
	DO(snd_pcm_hw_params(handle, params));
	DO(snd_pcm_prepare(handle));

	printf("PCM config dump:\n");
	snd_output_t *output = NULL;
	DO(snd_output_stdio_attach(&output, stdout, 0));
	DO(snd_pcm_dump(handle, output));
	printf("\n");

	printf("frames = %ld\n", (long)frames);
	short data[frames * CHANNELS];
	memset(data, 0, sizeof(data));

	printf("writing whole buffer\n");
	DO(snd_pcm_writei(handle, data, frames));
	printf("writing whole buffer\n");
	DO(snd_pcm_writei(handle, data, frames));
	printf("writing whole buffer minus 1 frame\n");
	DO(snd_pcm_writei(handle, data, frames - 1));

	printf("draining audio\n");
	DO(snd_pcm_drain(handle));
	
	printf("done\n");
	DO(snd_pcm_close(handle));
	return 0;
}
```

Here's the corresponding .asoundrc content:

```
pcm.test_dummy {
    type plug
    slave.pcm "mix_dummy"
}

pcm.mix_dummy {
    type dmix
    ipc_key 1024
    ipc_key_add_uid false
    ipc_perm 0666
    slave {
        pcm "hw:0"
        period_size 1024
        buffer_size 4096
        format "S16_LE"
        rate 48000
    }
}
```

And here's the complete test output:

```
PCM config dump:
Plug PCM: Rate conversion PCM (48000, sformat=S16_LE)
Converter: linear-interpolation
Protocol version: 10003
Its setup is:
  stream       : PLAYBACK
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 1
  rate         : 22050
  exact rate   : 22050 (22050/1)
  msbits       : 16
  buffer_size  : 1411
  period_size  : 470
  period_time  : 21333
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 470
  period_event : 0
  start_threshold  : 1
  stop_threshold   : 1411
  silence_threshold: 0
  silence_size : 0
  boundary     : 3177289537109884928
Slave: Route conversion PCM (sformat=S16_LE)
  Transformation table:
    0 <- 0
    1 <- 0
Its setup is:
  stream       : PLAYBACK
  access       : MMAP_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 1
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 3072
  period_size  : 1024
  period_time  : 21333
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 1024
  period_event : 0
  start_threshold  : 2
  stop_threshold   : 3072
  silence_threshold: 0
  silence_size : 0
  boundary     : 6917529027641081856
Slave: Direct Stream Mixing PCM
Its setup is:
  stream       : PLAYBACK
  access       : MMAP_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 3072
  period_size  : 1024
  period_time  : 21333
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 1024
  period_event : 0
  start_threshold  : 2
  stop_threshold   : 3072
  silence_threshold: 0
  silence_size : 0
  boundary     : 6917529027641081856
Hardware PCM card 1 'HDA Intel PCH' device 0 subdevice 0
Its setup is:
  stream       : PLAYBACK
  access       : MMAP_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 4096
  period_size  : 1024
  period_time  : 21333
  tstamp_mode  : ENABLE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 1024
  period_event : 0
  start_threshold  : 1
  stop_threshold   : 0
  silence_threshold: 0
  silence_size : 0
  boundary     : 4611686018427387904
  appl_ptr     : 0
  hw_ptr       : 2734916609

frames = 1411
writing whole buffer
writing whole buffer
writing whole buffer minus 1 frame
draining audio
alsa_quickcrash: pcm.c:3236: snd_pcm_area_copy: Assertion `src < dst || src >= dst + bytes' failed.
Aborted (core dumped)
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/314
Repository URL: https://github.com/alsa-project/alsa-lib
