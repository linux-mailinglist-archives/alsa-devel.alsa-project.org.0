Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0B245D02B
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:41:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C27D17EE;
	Wed, 24 Nov 2021 23:40:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C27D17EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637793699;
	bh=8f3smnBS2z9Mn9K/bIyiyNadBVbvlMyman2JcCUERXI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cTB6pcQY/FZVPXIA4Ek1ufpNObb+dODudbYGnTRxhXXvVMWnpURhg/bC6gITALqat
	 n3ZfQGtAXbPVsoE6D7hpGMw4UHEQz7wJAj3nDpJcHNdK+H9rxB49tGwBFgwkqumK0R
	 6ltcx7g9EFx860zFveYPwwyu3NAdqrs5gBtNCuNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DAA5F80087;
	Wed, 24 Nov 2021 23:40:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D534F8014D; Wed, 24 Nov 2021 23:40:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C24DF8011F
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:40:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C24DF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de
 header.b="ftyByuGW"; 
 dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de
 header.b="sqO0tnRF"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637793601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=9iMOTHSqzICObi0azMH+EBP1xAS5vBxdMtZ45eIzj4o=;
 b=ftyByuGWCGKn2Tix85hg8CIMG/LxI7ryl8ZbDr/6dDhzmtVfAcQhV7DrvVqSEYHa0arKk/
 bYrzduXz0FUoxvJH5uZAN3yTToFyNyCgSYx18lSpScm9Sy2HH3ERjR2gjptYWPBa+OCKhH
 xSrTh4etiTfdquWlNkHzGDk+jKGiBbk4wEk8o9Xy+nTj10rpBdgEUaXyAC/stxHzM46UKH
 oSbrXac8KkYTge4C04aIsBvrKCbmXltMMGKcYTBTT0e95HnhOTBldN+dfiEAcDVsQw7T5T
 8GIf+xP3PHrDDucc2AI0Sd4Alz0UGva94rz3ZHPDWKtEAUSXNcS4UyAsn2Zx2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637793602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=9iMOTHSqzICObi0azMH+EBP1xAS5vBxdMtZ45eIzj4o=;
 b=sqO0tnRF+i2X5LoYKH+yeDCbw5gj9hMpmH9A87+OA1kzc863NvN0tTuFjuyfLNDCCHqOBH
 k1V19IsxlSU0arDg==
To: LKML <linux-kernel@vger.kernel.org>
Subject: ALSA: hda: Make proper use of timecounter
Date: Wed, 24 Nov 2021 23:40:01 +0100
Message-ID: <871r35kwji.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>
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

HDA uses a timecounter to read a hardware clock running at 24 MHz. The
conversion factor is set with a mult value of 125 and a shift value of 0,
which is not converting the hardware clock to nanoseconds, it is converting
to 1/3 nanoseconds because the conversion factor from 24Mhz to nanoseconds
is 125/3. The usage sites divide the "nanoseconds" value returned by
timecounter_read() by 3 to get a real nanoseconds value.

There is a lengthy comment in azx_timecounter_init() explaining this
choice. That comment makes blatantly wrong assumptions about how
timecounters work and what can overflow.

The comment says:

     * Applying the 1/3 factor as part of the multiplication
     * requires at least 20 bits for a decent precision, however
     * overflows occur after about 4 hours or less, not a option.

timecounters operate on time deltas between two readouts of a clock and use
the mult/shift pair to calculate a precise nanoseconds value:

    delta_nsec = (delta_clock * mult) >> shift;

The fractional part is also taken into account and preserved to prevent
accumulated rounding errors. For details see cyclecounter_cyc2ns().

The mult/shift pair has to be chosen so that the multiplication of the
maximum expected delta value does not result in a 64bit overflow. As the
counter wraps around on 32bit, the maximum observable delta between two
reads is (1 << 32) - 1 which is about 178.9 seconds.

That in turn means the maximum multiplication factor which fits into an u32
will not cause a 64bit overflow ever because it's guaranteed that:

     ((1 << 32) - 1) ^ 2 < (1 << 64)

The resulting correct multiplication factor is 2796202667 and the shift
value is 26, i.e. 26 bit precision. The overflow of the multiplication
would happen exactly at a clock readout delta of 6597069765 which is way
after the wrap around of the hardware clock at around 274.8 seconds which
is off from the claimed 4 hours by more than an order of magnitude.

If the counter ever wraps around the last read value then the calculation
is off by the number of wrap arounds times 178.9 seconds because the
overflow cannot be observed.

Use clocks_calc_mult_shift(), which calculates the most accurate mult/shift
pair based on the given clock frequency, and remove the bogus comment along
with the divisions at the readout sites.

Fixes: 5d890f591d15 ("ALSA: hda: support for wallclock timestamps")
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 sound/hda/hdac_stream.c           |   14 ++++----------
 sound/pci/hda/hda_controller.c    |    1 -
 sound/soc/intel/skylake/skl-pcm.c |    1 -
 3 files changed, 4 insertions(+), 12 deletions(-)

--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -534,17 +534,11 @@ static void azx_timecounter_init(struct
 	cc->mask = CLOCKSOURCE_MASK(32);
 
 	/*
-	 * Converting from 24 MHz to ns means applying a 125/3 factor.
-	 * To avoid any saturation issues in intermediate operations,
-	 * the 125 factor is applied first. The division is applied
-	 * last after reading the timecounter value.
-	 * Applying the 1/3 factor as part of the multiplication
-	 * requires at least 20 bits for a decent precision, however
-	 * overflows occur after about 4 hours or less, not a option.
+	 * Calculate the optimal mult/shift values. The counter wraps
+	 * around after ~178.9 seconds.
 	 */
-
-	cc->mult = 125; /* saturation after 195 years */
-	cc->shift = 0;
+	clocks_calc_mult_shift(&cc->mult, &cc->shift, 24000000,
+			       NSEC_PER_SEC, 178);
 
 	nsec = 0; /* audio time is elapsed time since trigger */
 	timecounter_init(tc, cc, nsec);
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -504,7 +504,6 @@ static int azx_get_time_info(struct snd_
 		snd_pcm_gettime(substream->runtime, system_ts);
 
 		nsec = timecounter_read(&azx_dev->core.tc);
-		nsec = div_u64(nsec, 3); /* can be optimized */
 		if (audio_tstamp_config->report_delay)
 			nsec = azx_adjust_codec_delay(substream, nsec);
 
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -1251,7 +1251,6 @@ static int skl_platform_soc_get_time_inf
 		snd_pcm_gettime(substream->runtime, system_ts);
 
 		nsec = timecounter_read(&hstr->tc);
-		nsec = div_u64(nsec, 3); /* can be optimized */
 		if (audio_tstamp_config->report_delay)
 			nsec = skl_adjust_codec_delay(substream, nsec);
 
