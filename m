Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7D06DF210
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 12:34:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD50110D2;
	Wed, 12 Apr 2023 12:34:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD50110D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681295697;
	bh=VhWypZmjzC4k6XhhihbDg5YelhEJglGSoe3BycyLU88=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qfpnX4GqKMJVg6arEGSZQpTjcv+nZhX3Sdg9BqkTztmGz76r3uvKLfQAejYTwku6T
	 M+KpOVm7uLmzLLYYSOtRCBJWdi8Q2yV/S8luL9DeiWzPoFH9OR2GWBParpKkDqf3Bi
	 y0T1U53YbOSKZl56REqxM9w3lPto3rQ5hnXTPXAg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2138F8025E;
	Wed, 12 Apr 2023 12:34:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AD46F8032B; Wed, 12 Apr 2023 12:34:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4902F800E5
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 12:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4902F800E5
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 5AD8824107
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 06:33:39 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pmXnH-JVV-00
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 12:33:39 +0200
Date: Wed, 12 Apr 2023 12:33:39 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/2] ALSA: pcm: rewrite snd_pcm_playback_silence()
Message-ID: <ZDaJA4fCTFcsy9N1@ugly>
Mail-Followup-To: alsa-devel@alsa-project.org
References: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
 <8a3a2490-eb0f-7b76-3bc6-58ef5473d360@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="sIy9q8i09DG33QAU"
Content-Disposition: inline
In-Reply-To: <8a3a2490-eb0f-7b76-3bc6-58ef5473d360@perex.cz>
Message-ID-Hash: 7C4HO3OOH3PWWQPHB677RK2YKYFGNPFS
X-Message-ID-Hash: 7C4HO3OOH3PWWQPHB677RK2YKYFGNPFS
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7C4HO3OOH3PWWQPHB677RK2YKYFGNPFS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--sIy9q8i09DG33QAU
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Apr 11, 2023 at 12:47:26PM +0200, Jaroslav Kysela wrote:
>On 05. 04. 23 22:12, Oswald Buddenhagen wrote:
>> This fixes a bug in thresholded mode, where we failed to use 
>> new_hw_ptr,
>> resulting in under-fill.
>
>I don't follow what you refer here. The old code uses 
>snd_pcm_playback_hw_avail()
>
yes

>thus new hw_ptr for the threshold mode, too.
>
not before my patch. the silencer was called before the new pointer was 
stored. it had to be, as otherwise the delta for top-up mode could not 
be calculated.

>> +	// This will "legitimately" turn negative on underrun, and will be mangled
>> +	// into a huge number by the boundary crossing handling. The initial state
>> +	// might also be not quite sane. The code below MUST account for these cases.
>> +	hw_avail = appl_ptr - runtime->status->hw_ptr;
>> +	if (hw_avail < 0)
>> +		hw_avail += runtime->boundary;

>> +	else if ((snd_pcm_uframes_t) hw_avail >= runtime->boundary)
>> +		hw_avail -= runtime->boundary;
>
>If hw_avail is above runtime->boundary then the initial condition is totaly 
>bogus. I would use snd_BUG_ON() and direct return here.
>
this is only there as a result of inlining 
snd_pcm_playback_hw_avail()/snd_pcm_playback_avail() somewhat 
mindlessly. the check does indeed make no sense, so i'll just drop it.
(the broader lesson of this is the attached patch. i can re-post it 
separately if you like it.)

>>   		frames = runtime->silence_threshold - noise_dist;
>> +		if ((snd_pcm_sframes_t) frames <= 0)
>> +			return;
>
>The retyping does not look good here. Could we move the if before frames 
>assignment like:
>
>   if (runtime->silence_threshold <= noise_dist)
>     return;
>   frames = runtime->silence_threshold - noise_dist;
>
dunno, i don't like it - it's more noisy and imo it loses 
expressiveness, as the question we're asking is "how many frames do we 
need to fill?".
note that due to use of unsigned types in the runtime struct, such 
retyping is rather common in comparisons.

regards

--sIy9q8i09DG33QAU
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-ALSA-pcm-reshuffle-implementations-of-snd_pcm_playba.patch"

>From 02b303326b1be1ddb52afb38a384d26d79fa8b53 Mon Sep 17 00:00:00 2001
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Date: Wed, 12 Apr 2023 12:28:49 +0200
Subject: [PATCH] ALSA: pcm: reshuffle implementations of
 snd_pcm_playback_{,hw}_avail()

Implementing snd_pcm_playback_hw_avail() in terms of
snd_pcm_playback_avail() doesn't actually make sense - it should be the
other way around, the opposite of the respective functions for capture.
This makes the code clearer by illustrating the inverse data flow
better, and saving a conditional.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/pcm.h | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index f20400bb7032..81854813a567 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -783,22 +783,31 @@ static inline size_t snd_pcm_lib_period_bytes(struct snd_pcm_substream *substrea
 	return frames_to_bytes(runtime, runtime->period_size);
 }
 
+/**
+ * snd_pcm_playback_hw_avail - Get the queued space for playback
+ * @runtime: PCM runtime instance
+ *
+ * Return: available frame size
+ */
+static inline snd_pcm_sframes_t snd_pcm_playback_hw_avail(struct snd_pcm_runtime *runtime)
+{
+	snd_pcm_sframes_t avail = runtime->control->appl_ptr - runtime->status->hw_ptr;
+	if (avail < 0)
+		avail += runtime->boundary;
+	return avail;
+}
+
 /**
  * snd_pcm_playback_avail - Get the available (writable) space for playback
  * @runtime: PCM runtime instance
  *
  * Result is between 0 ... (boundary - 1)
  *
  * Return: available frame size
  */
 static inline snd_pcm_uframes_t snd_pcm_playback_avail(struct snd_pcm_runtime *runtime)
 {
-	snd_pcm_sframes_t avail = runtime->status->hw_ptr + runtime->buffer_size - runtime->control->appl_ptr;
-	if (avail < 0)
-		avail += runtime->boundary;
-	else if ((snd_pcm_uframes_t) avail >= runtime->boundary)
-		avail -= runtime->boundary;
-	return avail;
+	return runtime->buffer_size - snd_pcm_playback_hw_avail(runtime);
 }
 
 /**
@@ -817,17 +826,6 @@ static inline snd_pcm_uframes_t snd_pcm_capture_avail(struct snd_pcm_runtime *ru
 	return avail;
 }
 
-/**
- * snd_pcm_playback_hw_avail - Get the queued space for playback
- * @runtime: PCM runtime instance
- *
- * Return: available frame size
- */
-static inline snd_pcm_sframes_t snd_pcm_playback_hw_avail(struct snd_pcm_runtime *runtime)
-{
-	return runtime->buffer_size - snd_pcm_playback_avail(runtime);
-}
-
 /**
  * snd_pcm_capture_hw_avail - Get the free space for capture
  * @runtime: PCM runtime instance
-- 
2.40.0.152.g15d061e6df


--sIy9q8i09DG33QAU--
