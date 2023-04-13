Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3576E0B44
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 12:17:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6AC5EF3;
	Thu, 13 Apr 2023 12:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6AC5EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681381025;
	bh=Y1PjrsSZLYTQAoVQJywSjot9b0rillQuGr78mgT7FTI=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=TDSm5Fs+RJfcI61GVHpRv7cqE8OeuXuiOzyE2BAqXxgJIa75nwrzsszOKwqD8zmVl
	 AnD7Ez7f2FPHqSC5CrXfFsOiTFvH4ouKQGYfUZB0eq5B/pZGc1iG8gvOXCZNW4d+sQ
	 u6TljnmBz6PzYRHEfVu05BiK8O15dOp7tFHqLNc0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39046F8025E;
	Thu, 13 Apr 2023 12:16:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79F8FF8032B; Thu, 13 Apr 2023 12:16:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99FB0F8023A
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 12:16:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99FB0F8023A
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 023BC240CF
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 06:16:05 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pmtzo-bjc-00
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 12:16:04 +0200
Date: Thu, 13 Apr 2023 12:16:04 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
Message-ID: <ZDfWZG+VASX/Xo/j@ugly>
Mail-Followup-To: ALSA development <alsa-devel@alsa-project.org>
References: <22f551f3-deae-1536-bd07-0b9340940ea4@perex.cz>
 <ZDVnUj2B0EkMiOlA@ugly>
 <6d6c5f3a-81bc-acf4-eb4d-229b581bbe8b@perex.cz>
 <ZDWPy9YbXWWOqaC+@ugly>
 <7b317956-deb1-0a75-0a34-f82d6a81cf90@perex.cz>
 <87ttxl7cxd.wl-tiwai@suse.de>
 <ZDZmDyOMYMD4Uu5g@ugly>
 <87wn2ho06z.wl-tiwai@suse.de>
 <54c16616-dee7-b50f-d612-82eef906d1df@perex.cz>
 <871qkoxrrl.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <871qkoxrrl.wl-tiwai@suse.de>
Message-ID-Hash: ESWTZUB4QT4AUH2KG4FBQ7FAR7DPRCFL
X-Message-ID-Hash: ESWTZUB4QT4AUH2KG4FBQ7FAR7DPRCFL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ESWTZUB4QT4AUH2KG4FBQ7FAR7DPRCFL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 13, 2023 at 07:42:06AM +0200, Takashi Iwai wrote:
>On Wed, 12 Apr 2023 21:59:28 +0200,
>Jaroslav Kysela wrote:
>> This looks like a sane proposal, but some drivers does not require 
>> the
>> silencing at all, so we can probably skip this step for them (new
>> SNDRV_PCM_INFO_PERFECT_DRAIN flag?).
>
>Sure, we should apply it only conditionally.
>
i don't think the extra complexity is justified. with my improved 
proposal, we're talking about a cost of filling two periods per draining 
op, which aren't exactly super-frequent.

>Also, we may skip the
>workaround for applications accessing directly via mmap as default.
>
no, because one may easily miss that more than one period is required.  
also, i think that forgetting it entirely is an easy mistake to make, 
even if it's harder with mmap than with write.

regards
