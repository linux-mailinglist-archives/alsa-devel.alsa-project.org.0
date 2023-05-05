Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4007A6F891A
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 20:57:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F63F1865;
	Fri,  5 May 2023 20:56:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F63F1865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683313044;
	bh=jFJ9fdOXMaI+h4Qxuada1LJ7DWb3KFv0VfOoIqOCzQ0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q70sDhWBstctr6Ipq5t0V6rpT2ulDOKm2uHqwrSmLWwaayNCSJyXOKk9UEBs/HC0W
	 O8aBwwuv8xhWYssFV3kMtxfRX+QZATewYMYqfj8fBzfIPZN+0oKEpW9ZVvSJoqR3ac
	 1oUc2md+3xXO/GK+4wwCYppUHI9tsDqF/xqzuErU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 066E6F80529;
	Fri,  5 May 2023 20:56:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11017F8052D; Fri,  5 May 2023 20:56:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35766F804B1
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 20:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35766F804B1
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id EB9EB23E9C;
	Fri,  5 May 2023 14:56:14 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pv0bG-mAC-00; Fri, 05 May 2023 20:56:14 +0200
Date: Fri, 5 May 2023 20:56:14 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH alsa-lib 1/4] pcm: hw: setup explicit silencing for
 snd_pcm_drain by default
Message-ID: <ZFVRTrJW07hSpjym@ugly>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	ALSA development <alsa-devel@alsa-project.org>
References: <20230502115010.986325-1-perex@perex.cz>
 <20230502115010.986325-2-perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230502115010.986325-2-perex@perex.cz>
Message-ID-Hash: M4A6NWGJ7IP436KHFCF24SMDBVGFGSEU
X-Message-ID-Hash: M4A6NWGJ7IP436KHFCF24SMDBVGFGSEU
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: ALSA development <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4A6NWGJ7IP436KHFCF24SMDBVGFGSEU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 02, 2023 at 01:50:07PM +0200, Jaroslav Kysela wrote:
>--- a/src/pcm/pcm_hw.c
>+++ b/src/pcm/pcm_hw.c
>@@ -718,7 +732,40 @@ static int snd_pcm_hw_drop(snd_pcm_t *pcm)
> static int snd_pcm_hw_drain(snd_pcm_t *pcm)
> {
> 	snd_pcm_hw_t *hw = pcm->private_data;
>+	snd_pcm_sw_params_t sw_params;
>+	snd_pcm_uframes_t silence_size;
> 	int err;
>+
>+	if (pcm->stream != SND_PCM_STREAM_PLAYBACK)
>+		goto __skip_silence;
>+	/* compute end silence size, align to period size + extra time */
>+	snd_pcm_sw_params_current_no_lock(pcm, &sw_params);
>+	if ((pcm->boundary % pcm->period_size) == 0) {
>+		silence_size = pcm->period_size - (*pcm->appl.ptr % pcm->period_size);
>+		if (silence_size == pcm->period_size)
>+			silence_size = 0;
>+	} else {
>+		/* it not not easy to compute the period cross point
>+		 * in this case because period is not aligned to the boundary
>+		 * - use the full range (one period) in this case
>+		 */
>+		silence_size = pcm->period_size;
>+	}
>+	silence_size += pcm->rate / 10;	/* 1/10th of second */
>+	if (sw_params.silence_size < silence_size) {
>+		/* fill the silence soon as possible (in the bellow ioctl
>+		 * or the next period wake up)
>+		 */
>+		sw_params.silence_threshold = pcm->buffer_size;
>+		sw_params.silence_size = silence_size;
>
i was reworking my kernel patch along these lines (it's easier to deploy 
when the kernel is the only thing you're hacking on), and ran into this 
behavior:

check thresholded silence fill, sil start 0, sil fill 0, app 66000
now sil start 66000, sil fill 0
noise dist 23997
drain raw fill 0
drain extended fill 4800
frames 3
filling 3 at 18000
period elapsed
check thresholded silence fill, sil start 66000, sil fill 3, app 66000
now sil start 66000, sil fill 3
noise dist 18000
drain raw fill 0
drain extended fill 4800
frames 4800
filling 4800 at 18003
period elapsed
check thresholded silence fill, sil start 66000, sil fill 4803, app 66000
now sil start 66000, sil fill 4803
noise dist 16800
drain raw fill 0
drain extended fill 4800
frames 4800
filling 1197 at 22803
filling 3603 at 0
period elapsed
check thresholded silence fill, sil start 66000, sil fill 9603, app 66000
now sil start 66000, sil fill 9603
noise dist 15600
drain raw fill 0
drain extended fill 4800
frames 4800
filling 4800 at 3603
period elapsed
check thresholded silence fill, sil start 66000, sil fill 14403, app 66000
now sil start 66000, sil fill 14403
noise dist 6755399441055758400

what you're seeing is this: when the drain is issued, the buffer is 
initially full, and after every played period some padding is added, 
totalling way beyond what was intended.
this doesn't break anything, but it's a bit inefficient, and just ugly.

this is a result of silence_threshold being the buffer size.
and setting it to the silence_size of course doesn't work reliably when 
that is smaller than the period size.

while pondering how to fix that, my thoughts returned to my yet unaired 
gripe with the silencing parameters being anything but intuitive. would 
you mind explaining why they are like that?

why not interpret silence_size as the minimum number of playable samples 
(that is, noise_dist in the kernel code) that must be maintained at all 
times, and simply ignore silence_threshold?

unless i'm missing something, this is exactly what one would want for 
maintaining underrun resilience, which i think is the purpose of the 
thresholded silence fill mode (at least my comment updates which claim 
so were accepted).

and doing that would "magically" fix your patch.

can you think of any plausible use case that this would break?

but i guess you'll be paranoid about backwards compat anyway, so an 
alternative proposal would be using silence_threshold == ULONG_MAX to 
trigger the new semantics. of course this would have the downside that 
it wouldn't "magically" fix your code (and i suspect some other code as 
well), and kernel version dependent behavior would have to be coded for 
the (presumably) common usage.

regards
