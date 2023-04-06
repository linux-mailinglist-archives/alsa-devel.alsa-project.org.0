Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AE66D8FB1
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 08:47:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1DC97F4;
	Thu,  6 Apr 2023 08:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1DC97F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680763673;
	bh=wqndoaOQW6vIFrMqzLZhKNMnmmCkhoe1E5pYiWc+H3s=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=S0fEaA4oGb7DbVmOgvYbUwBBzyJRZK/SeAlTw/FfpVB7Uqz7d6nmW2SWgQo1pHJBu
	 uXvfD9uhvluGvoC0ISyQuM4u2+oMDwQJ/hUlJTe81+n0YKpbtI3wP1YjAq7xOgmZ7/
	 o+M046swraS3aJVteOK2ITngTgSxGv9xvQgXptKU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 368BFF80171;
	Thu,  6 Apr 2023 08:47:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44FD9F80246; Thu,  6 Apr 2023 08:47:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D852F80149
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 08:46:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D852F80149
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 56F8524174
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 02:46:51 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pkJOV-IXc-00
	for <alsa-devel@alsa-project.org>; Thu, 06 Apr 2023 08:46:51 +0200
Date: Thu, 6 Apr 2023 08:46:51 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: document that struct __snd_pcm_mmap_control64 is
 messed up
Message-ID: <ZC5q2zwCmhaTE6ba@ugly>
Mail-Followup-To: alsa-devel@alsa-project.org
References: <20230405201219.2197759-1-oswald.buddenhagen@gmx.de>
 <87355dwnr8.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87355dwnr8.wl-tiwai@suse.de>
Message-ID-Hash: IH4MM4QV3E75Q4T7UQG7IIXHMVKUKHNA
X-Message-ID-Hash: IH4MM4QV3E75Q4T7UQG7IIXHMVKUKHNA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IH4MM4QV3E75Q4T7UQG7IIXHMVKUKHNA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 06, 2023 at 08:03:39AM +0200, Takashi Iwai wrote:
>On Wed, 05 Apr 2023 22:12:19 +0200,
>Oswald Buddenhagen wrote:
>> 
>> I suppose this can't be changed anymore due to binary compat concerns.
>
>Yes, please check the thread at
>  https://lore.kernel.org/all/29QBMJU8DE71E.2YZSH8IHT5HMH@mforney.org/
>
>> +	__pad_before_uframe __pad2;	 // BUG: this should have been __pad_after_uframe!
>
>Writing this alone doesn't help much.  Actual help would be to mention
>that this typo is kept intentionally.
>
hmm, my thinking is that the immediate response to reading that comment 
would be "so why don't you change it?!", at which point the person would 
either realize by themselves that this is subject to binary compat 
constraints, or would git-blame it and see the explanation.

anyway, my concern is keeping this *short*, so it doesn't distract.

maybe

   // BUG: should be __pad_after_uframe, but binary compat

would do, though obviously the grammar kinda sucks.

the (too) long version could be

   // BUG: this should be __pad_after_uframe, but
   // binary compatibility constraints prevent a fix.

choose your death, i'll deliver it. ;-)
