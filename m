Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2196F5717
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 13:21:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 594491355;
	Wed,  3 May 2023 13:20:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 594491355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683112904;
	bh=EnWLn1vXahO7FiNHDy9I+HhXhc+6FGpUSzUy8Sz7fdQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KRgc3uf3yv4wMlQ7d8CgowPgDE0NsaYZ/N2Cy8/SWq4ryxrznFe59v9QM2Nc6xqHs
	 v1iuNFYMW0EIEoM7aIXFROo/WiT/3UGA/dSoK+nI0orpajQdXR+SNg5BvBzDDi06EZ
	 SZ9+zIHzgo6limBPXM+Da0LbHqPFwCX5+aNOhrwA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3FF7F8032B;
	Wed,  3 May 2023 13:20:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C16E6F8049E; Wed,  3 May 2023 13:20:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA903F800EC
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 13:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA903F800EC
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 0076823FF0;
	Wed,  3 May 2023 07:20:38 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1puAXF-mQ4-00; Wed, 03 May 2023 13:20:37 +0200
Date: Wed, 3 May 2023 13:20:37 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH alsa-lib 1/4] pcm: hw: setup explicit silencing for
 snd_pcm_drain by default
Message-ID: <ZFJDhQZAiCPBpM0D@ugly>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	ALSA development <alsa-devel@alsa-project.org>
References: <20230502115010.986325-1-perex@perex.cz>
 <20230502115010.986325-2-perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230502115010.986325-2-perex@perex.cz>
Message-ID-Hash: OLK46E73Q2QVRFRQISUP4CDCAYVARIZG
X-Message-ID-Hash: OLK46E73Q2QVRFRQISUP4CDCAYVARIZG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OLK46E73Q2QVRFRQISUP4CDCAYVARIZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 02, 2023 at 01:50:07PM +0200, Jaroslav Kysela wrote:
>Some applications may not follow the period_size transfer blocks and
>also the driver developers may not follow the consequeces of the
>access beyond valid samples in the playback DMA buffer.
>
i find this way too vague.

>To avoid clicks, fill a little silence at the end of the playback

>ring buffer when the snd_pcm_drain() is called.
>
no 'the' here.
(see 
https://www.eltconcourse.com/training/inservice/lexicogrammar/article_system.html 
for more than you ever wanted to know about articles.)

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
>
arguably, you should use the inverse condition and a block instead of a 
goto.
if this is a measure to keep the indentation down, factoring it out to a 
separate snd_pcm_hw_auto_silence() function should do the job.

>+	/* compute end silence size, align to period size + extra time */
>+	snd_pcm_sw_params_current_no_lock(pcm, &sw_params);
>
if you swap these lines here, there will be less churn in the followup
patch.
in the comment, better use a colon instead of a comma.

>+	if ((pcm->boundary % pcm->period_size) == 0) {
>+		silence_size = pcm->period_size - (*pcm->appl.ptr % pcm->period_size);
>+		if (silence_size == pcm->period_size)
>+			silence_size = 0;
>
you can avoid the condition by rewriting it like this:

   silence_size = pcm->period_size - ((*pcm->appl.ptr + pcm->period_size - 1) % pcm->period_size) - 1;

(it may be possible to simplify this further, but this makes my head 
hurt ...)

>+	} else {
>+		/* it not not easy to compute the period cross point
>
"it is not"
"crossing point"

>+		 * in this case because period is not aligned to the boundary
>
"the period"

>+		 * - use the full range (one period) in this case
>+		 */
>+		silence_size = pcm->period_size;
>+	}
>+	silence_size += pcm->rate / 10;	/* 1/10th of second */
>+	if (sw_params.silence_size < silence_size) {
>+		/* fill the silence soon as possible (in the bellow ioctl
>
"as soon as possible"
"in the ioctl below"

>+		 * or the next period wake up)
>+		 */
>+		sw_params.silence_threshold = pcm->buffer_size;
>+		sw_params.silence_size = silence_size;
>
so at this point i got the thought "huh, that can exceed the buffer 
size. is that ok?" ...
and yes, it is. but ...

the kernel doesn't check silence_threshold, so user space can trigger 
the snd_BUG_ON() in snd_pcm_playback_silence(). whoops.
(yes, this predates my patch.)
i'm not sure what the best way to deal with this is. anyway, different 
tree, different patch.

regards
