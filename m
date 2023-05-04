Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B426F6F30
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 17:37:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65A6E2247;
	Thu,  4 May 2023 17:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65A6E2247
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683214644;
	bh=dZtp1xEymwv/NdFhQuGdh8fl2STgF43zKnMTYgF9t+I=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m72zyBndBc1rIkeUkSEGD/uflEZe/5iXiZfLCMgUHvUlF6mlP9ldiqVLCaCchF09e
	 A/PxL/kbhm1ccMrUyS2AEWbbmO48lLJ79axuRznwN3nOg0EetAW+Kf1j1IhLSHl1lD
	 0f6pjuvOGFQyaowsWxpxDDQnrsV+jpA0nKEQyD0M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAD32F80529;
	Thu,  4 May 2023 17:36:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC0BBF8052D; Thu,  4 May 2023 17:36:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AB6DF80520
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 17:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AB6DF80520
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id B348023E69;
	Thu,  4 May 2023 11:36:11 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pub07-Ktr-00; Thu, 04 May 2023 17:36:11 +0200
Date: Thu, 4 May 2023 17:36:11 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: pcm: fix snd_pcm_playback_silence() with
 free-running mode
Message-ID: <ZFPQ68qLr2fy1qRs@ugly>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20230504130007.2208916-1-oswald.buddenhagen@gmx.de>
 <87cz3gkyz9.wl-tiwai@suse.de>
 <c2e501b7-68bc-947b-645e-e425dcd20c65@perex.cz>
 <ZFO5B+1+HaIz4B4X@ugly>
 <877ctokv6x.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <877ctokv6x.wl-tiwai@suse.de>
Message-ID-Hash: 5FYLYZLDYZA7LN5HHHAZP2N3GTWSVU5L
X-Message-ID-Hash: 5FYLYZLDYZA7LN5HHHAZP2N3GTWSVU5L
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5FYLYZLDYZA7LN5HHHAZP2N3GTWSVU5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 04, 2023 at 04:49:58PM +0200, Takashi Iwai wrote:
>Sorry, that doesn't work.  The review is done upon the patch, and if
>this patch can't be reviewed easily, it's simply no-go.
>
that's a self-imposed limitation.

it's beyond me why in 2023 anyone working on a bigger project is still 
using a patch-based review process, given the existence of proper review 
tools like gerrit (and crutches like github and gitlab).

i always view patches with 10 lines of context, and regularly use the 
"expand context" widgets to get even more into view.
in the small projects i maintain i apply more complex patches first and 
view them with -U10 or more.

"i don't see enough to judge this" isn't a complaint that would ever 
occur to me leveling at a contributor.

>Again, the problem is the mixture; it partially reverts to the
>original code while it modifies some part in some other way.
>
the baseline is irrelevant - it was already broken, and almost 
impossible to reason about.

>By reverting the whole and reapplying fixes -- although it'll need
>more steps -- we can see more clearly what change fixes which part.
>
that's not what actually happens.
this is all deeply intertwined code. splitting up the patch will merely 
give you the *illusion* of better understanding the pieces. but to 
actually make sense of it, you need to see the whole, in its end state, 
because there are no fully functional intermediate states.

the original patch was three patches at first. when i was attempting to 
write proper commit messages explaining what fixes what, i found that 
it's just impossible to untangle it without lying by omission. so i 
squashed them and wrote a cumulative description. and you accepted it.

regards
