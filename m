Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BAE6DB948
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Apr 2023 09:26:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D9FE20B;
	Sat,  8 Apr 2023 09:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D9FE20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680938766;
	bh=+KIPAM4K1jSOsj8J+g+yxHFPPW48Qjk2ooR1B3/S2wQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=orbtk2hOzYcF8sqLFyTXF3IIRI0y1YQxfywuVa+OPLZDO+owZA7nwSr9ikO+U2Dje
	 91tpbHOx2hslQKzEgTj0yzJ0hwS6mp/9NLU2EeWxp9/DknU1iWoQaPUh3Cf4vKSycQ
	 8M5sPHXuYTS62xfLgJ69xm15BOSf6moc9Pkd9pLs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14704F80249;
	Sat,  8 Apr 2023 09:25:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CABEF8026A; Sat,  8 Apr 2023 09:25:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6EF74F80246
	for <alsa-devel@alsa-project.org>; Sat,  8 Apr 2023 09:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EF74F80246
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id D904523FEE;
	Sat,  8 Apr 2023 03:24:58 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pl2wU-CP2-00; Sat, 08 Apr 2023 09:24:58 +0200
Date: Sat, 8 Apr 2023 09:24:58 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
Message-ID: <ZDEWyjdVE2IocpGY@ugly>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
References: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
 <20230405201219.2197789-2-oswald.buddenhagen@gmx.de>
 <3d75c103-7e94-e6a1-7f3d-7f957c33cddc@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <3d75c103-7e94-e6a1-7f3d-7f957c33cddc@perex.cz>
Message-ID-Hash: R3FRGPGGBASRUGSFGZUAPFZXEJSJZVSD
X-Message-ID-Hash: R3FRGPGGBASRUGSFGZUAPFZXEJSJZVSD
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R3FRGPGGBASRUGSFGZUAPFZXEJSJZVSD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Apr 08, 2023 at 01:58:21AM +0200, Jaroslav Kysela wrote:
>On 05. 04. 23 22:12, Oswald Buddenhagen wrote:
>> Draining will always playback somewhat beyond the end of the filled
>> buffer. This would produce artifacts if the user did not set up the
>> auto-silencing machinery. This patch makes it work out of the box.
>> 
>I think that it was really bad decision to apply this patch without a 
>broader discussion.

>When we designed the API, we knew about described problems and we 
>decided to keep this up to applications.
>
i ran into no documentation of either the problems nor the decisions and 
their implications for the user.

>The silencing may not help in all cases where the PCM samples ends with 
>a high volume.
>
that would just create a slight crack, which isn't any different from a 
"regular" sudden stop.

> A volume ramping should be used and it's an application job.
>
imo, that entirely misses the point - the volume is most likely already 
zero at the end of the buffer. that doesn't mean that it's ok to play 
the samples again where the volume might not be *quite* zero yet.

>Also, silencing touches the DMA buffer which may not be desired.
>
hypothetically, yes. but practically? why would anyone want to play the 
same samples after draining? draining is most likely followed by closing 
the device. and even if not, in most cases (esp. where draining would 
actually make sense) one wouldn't play a fixed pattern that could be 
just re-used, so one would have to re-fill the buffer prior to starting 
again anyway. never mind the effort necessary to track the state of the 
buffer instead of just re-filling it. so for all practical purposes, 
already played samples can be considered undefined data and thus safe to 
overwrite.

>And lastly drivers can handle draining correctly (stop at the exact 
>position - see substream->ops->trigger with SNDRV_PCM_TRIGGER_DRAIN 
>argument).
>
yeah. hypothetically. afaict, there is exactly one driver which supports 
this. most (older) hardware wouldn't even have the capability to do such 
precise timing without external help.

On Sat, Apr 08, 2023 at 07:55:48AM +0200, Takashi Iwai wrote:
>Applying the silencing blindly might be an overkill, indeed, although
>this could be seen as an easy solution.  Let's see.
>
i don't think that "overkill" is right here. someone has to do the 
silencing for draining to be useful at all, and so the question is only 
who that should be. my argument is that not auto-silencing is 
*extremely* unexpected, and thus just bad api. i'm pretty certain that 
about 99% of the usages of DRAIN start out missing this, and most never 
get fixed.

imo, if any api is added, it should be to opt *out* of auto-silencing.  
but i don't think this makes any sense; there would be ~zero users of 
this ever.

regards
