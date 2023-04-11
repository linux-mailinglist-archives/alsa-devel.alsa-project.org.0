Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5A06DE178
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 18:51:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BC15EF8;
	Tue, 11 Apr 2023 18:50:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BC15EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681231887;
	bh=V2jjNNjKa4574wf9AO2VqCkRoBNHFHyVhRtZ/WxYZsg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rjhoYEvvYEk//yEh+4E7/3IPZVXF3JGxFOVy3Segg2LHY7veBcz5z0SFmMG2ZgZf0
	 8uey0G3m2L/7JBUtuN9nUXwnOtPBC0qjWrNKYfzXDt8bza4IHdmUpb9nSowA1lIdrJ
	 CuT9mSmoZkeWaZ3OlPG3x5ILl8flW+0EFn5naT6Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93A67F8025E;
	Tue, 11 Apr 2023 18:50:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A48D3F8032B; Tue, 11 Apr 2023 18:50:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37AE0F80100
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 18:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37AE0F80100
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id C883E20391
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 12:50:19 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pmHCF-5a9-00
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 18:50:19 +0200
Date: Tue, 11 Apr 2023 18:50:19 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
Message-ID: <ZDWPy9YbXWWOqaC+@ugly>
Mail-Followup-To: alsa-devel@alsa-project.org
References: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
 <20230405201219.2197789-2-oswald.buddenhagen@gmx.de>
 <3d75c103-7e94-e6a1-7f3d-7f957c33cddc@perex.cz>
 <ZDEWyjdVE2IocpGY@ugly>
 <22f551f3-deae-1536-bd07-0b9340940ea4@perex.cz>
 <ZDVnUj2B0EkMiOlA@ugly>
 <6d6c5f3a-81bc-acf4-eb4d-229b581bbe8b@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6d6c5f3a-81bc-acf4-eb4d-229b581bbe8b@perex.cz>
Message-ID-Hash: C6UR4FH6JIELGNYWZBVRRYAFG4KUE76N
X-Message-ID-Hash: C6UR4FH6JIELGNYWZBVRRYAFG4KUE76N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C6UR4FH6JIELGNYWZBVRRYAFG4KUE76N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 11, 2023 at 04:48:58PM +0200, Jaroslav Kysela wrote:
>You're using a hammer to fix a little issue.
>
yes, but at the time it seemed like a rather small hammer to me.

if large buffers are actually a thing (what for?), then the fill could 
be limited to two periods or something. it would make the code uglier, 
though.

>Which code does not fill the last period?
>
a lot, i imagine - doing that is rather counter-intuitive when using the 
write() access method.

also, just the last period is not enough, due to the fifo, and possibly 
delayed/lost irqs.

>>> the silencing is controlled using sw_params, so applications may
>>> request the silencing before drain.
>>>
>> yeah, they could, but they don't, and most won't ever.
>> 
>> you're arguing for not doing a very practical and simple change that
>> will fix a lot of user code at once, for the sake of preventing an
>> entirely hypothetical and implausible problem. that is not a good
>> trade-off.
>
>I'm arguing that we should not do anything extra with the buffers until 
>the application requests that.

>That's the clear API context.
>
no, it's not. you cannot assume this to be understood as the central 
guiding principle which trumps more immediate issues. people use an api 
to solve a specific problem, and they want to do that with the least 
effort possible. no-one is going to read the whole docu top to bottom 
and remember every caveat. if it appears to work, people will just call 
it a day, and that's exactly what will be the case with the use of DRAIN 
(one needs a somewhat specific configuration and content to even notice 
that there is a problem).

>If we allow modification of the PCM buffer, I think that we should:
>
>- Do not modify the buffer for drivers already working with the
>   appl_ptr data (end position) only.
>
i suppose that should be detected by the drain callback being set up?

>- Handle the situation with the large buffer; it may make sense
>   to change the "wait" operation from the end-of-period interrupt to time
>   scheduler and stop the drain more early when the end-of-valid data condition
>   is fulfilled.
>
i don't understand what you're asking for.

>- Increase the protocol version.
>
>But as I wrote, I would make those extensions configurable 
>(SNDRV_PCM_HW_PARAMS_DRAIN_ALLOW_SILENCE). It can be turned on by default.
>
i have no clue what would be involved in doing that. to me that sounds 
like overkill (solving a non-issue), and goes waaaay beyond what i 
expected to invest into this issue (really, i just wanted to verify that 
the emu10k1 fixes work, and accidentally discovered that there is a 
mid-layer issue that affects user space, as the pyalsaaudio lib i'm 
using doesn't handle it).

regards
