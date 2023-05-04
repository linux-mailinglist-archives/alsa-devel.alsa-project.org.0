Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 893B56F6D58
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 15:55:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A187146D;
	Thu,  4 May 2023 15:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A187146D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683208514;
	bh=fdsaPGcE7oM7olyNAYFkiOggY299leY3iDdcWkhjX1Q=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AVhLHGab1E9YY+2fGSpXP73dGNQn8EItNbwSSJ6e0men4nA3j2Of33UyAU86W6BuP
	 gqk72p6we3qEQC+s6XQLqAy5Z8dcqRs9gfx5EGYkjnW70+jvvlT+E7jNYIoVbiqf2u
	 aSwXMUTjdkhlp1uCDOPtKERpRHU4QXMx3YzZ27Ao=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83BC7F80529;
	Thu,  4 May 2023 15:54:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 001EDF8052D; Thu,  4 May 2023 15:54:20 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BF38F80114
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 15:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BF38F80114
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 61B6323E69;
	Thu,  4 May 2023 09:54:15 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1puZPT-Hec-00; Thu, 04 May 2023 15:54:15 +0200
Date: Thu, 4 May 2023 15:54:15 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: pcm: fix snd_pcm_playback_silence() with
 free-running mode
Message-ID: <ZFO5B+1+HaIz4B4X@ugly>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20230504130007.2208916-1-oswald.buddenhagen@gmx.de>
 <87cz3gkyz9.wl-tiwai@suse.de>
 <c2e501b7-68bc-947b-645e-e425dcd20c65@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c2e501b7-68bc-947b-645e-e425dcd20c65@perex.cz>
Message-ID-Hash: JNYQLHWA7HUIUHUS4NKIVN6KDJ2UTY27
X-Message-ID-Hash: JNYQLHWA7HUIUHUS4NKIVN6KDJ2UTY27
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNYQLHWA7HUIUHUS4NKIVN6KDJ2UTY27/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 04, 2023 at 03:33:01PM +0200, Jaroslav Kysela wrote:
>On 04. 05. 23 15:28, Takashi Iwai wrote:
>> Honestly speaking, this is really hard to review.

>> As most of changes here are the revert of the previous commit,
>>
no they aren't.

>>I'd rather like to get it
>> reverted whole once, and re-apply the proper fix gradually.
>
>I fully agree here. Takashi, please, revert the broken patch right now.
>
actually reverting would include reverting the comments, which would be 
just plain stupid.

>I think that the review and improving the code may take some days.
>
i'm not going to deliver anything more on that matter just to satisfy 
some arbitrary process. i think the patch does the right thing, with the 
right granularity, and i'm not going to spend time breaking my head on 
producing broken intermediate states which i cannot properly reason 
about due to their internal inconsistency.

you can "rebase" my patch by checking it out on top of a partial revert, 
but you need to come up with your own commit message then. and i think 
that it would be utterly counterproductive. viewing the diff for review 
purposes may make sense, though.

regards
