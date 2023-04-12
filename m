Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 874AF6DF3DF
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 13:39:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F7FC10B7;
	Wed, 12 Apr 2023 13:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F7FC10B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681299551;
	bh=EJDkJdkGO4O7+8mxHbz9vUmShPdYu8TL2UWElCzDp/g=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=dPPfFKp1reNpdk8I4XQTUtRJj+kKR6Z7g9QdByhAEtaNJeUZLaqxstUHFpNkzQPPK
	 pz+uNNBY1N6kD9P9uH4CLcKqaBvH57IipOTCmHf42vQm5ogsst/noLABHKR/ODoGlB
	 2Hmldc7eMUTIQb63YdKOdCSP84FtOQ6F+FsZwtbM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E992F8025E;
	Wed, 12 Apr 2023 13:38:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE45FF8032B; Wed, 12 Apr 2023 13:38:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EC65CF80149
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 13:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC65CF80149
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 6433B24109
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 07:38:05 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pmYnd-KoX-00
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 13:38:05 +0200
Date: Wed, 12 Apr 2023 13:38:05 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
Message-ID: <ZDaYHXLoXBfzTqT8@ugly>
Mail-Followup-To: alsa-devel@alsa-project.org
References: <3d75c103-7e94-e6a1-7f3d-7f957c33cddc@perex.cz>
 <ZDEWyjdVE2IocpGY@ugly>
 <22f551f3-deae-1536-bd07-0b9340940ea4@perex.cz>
 <ZDVnUj2B0EkMiOlA@ugly>
 <6d6c5f3a-81bc-acf4-eb4d-229b581bbe8b@perex.cz>
 <ZDWPy9YbXWWOqaC+@ugly>
 <7b317956-deb1-0a75-0a34-f82d6a81cf90@perex.cz>
 <87ttxl7cxd.wl-tiwai@suse.de>
 <ZDZmDyOMYMD4Uu5g@ugly>
 <87wn2ho06z.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87wn2ho06z.wl-tiwai@suse.de>
Message-ID-Hash: HUYR5W2HNJFAM46VLS4UD4IPGH67FUN5
X-Message-ID-Hash: HUYR5W2HNJFAM46VLS4UD4IPGH67FUN5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HUYR5W2HNJFAM46VLS4UD4IPGH67FUN5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Apr 12, 2023 at 12:37:56PM +0200, Takashi Iwai wrote:
>On Wed, 12 Apr 2023 10:04:31 +0200,
>Oswald Buddenhagen wrote:
>> 
>> On Wed, Apr 12, 2023 at 09:54:54AM +0200, Takashi Iwai wrote:
>> > I'm thinking whether we need to change anything in the kernel side for
>> > this at all.  Can't it be changed rather in alsa-lib side instead?
>> > 
>> it could, but it would be a lot uglier. user space would have to do a
>> "man-in-the-middle attack" on the data, while in the kernel we can
>> just slightly modify the consumer. this would be particularly obvious
>> in the case of write() access.
>
>But basically it'd be like fiddling sw_params temporarily for
>draining, I suppose?
>
err, right - i was still assuming manual padding.
i actually tried temporarily changing the params (and pondered 
introducing "shadow" params) when i was doing the kernel patch, but that 
was a lot uglier than what i did in the end. i think it would be even 
worse in user space due to the need to support async operation.

regards
