Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C00656E9503
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 14:48:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E471DEC3;
	Thu, 20 Apr 2023 14:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E471DEC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681994893;
	bh=mPpWLHOLy99ZrKoHK9lQcqdY7m/6Prk562N+sxqxma8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XVrAr5xG+qH5vohT1VyP9pGX/rw1vX0RIRDgkWfnpdndnX5awglQCWRtX2a1hORii
	 XaEbaEj2O//mqBqpTaW5uUgwllcmmiQNY9oI7Nw+XZgdBjq1ahOPNx4crIZ59oJXk0
	 TtykG0PW3h9Eyipg+cftwS729gr/MCMuK3dDvW2U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E2DAF80149;
	Thu, 20 Apr 2023 14:47:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97A13F80155; Thu, 20 Apr 2023 14:47:18 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CE4BDF80053
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 14:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE4BDF80053
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 1CA8A24179;
	Thu, 20 Apr 2023 08:47:12 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1ppTgt-h8k-00; Thu, 20 Apr 2023 14:47:11 +0200
Date: Thu, 20 Apr 2023 14:47:11 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: Re: [RFC PATCH] docs: sound: kernel-api: writing-an-alsa-driver.rst:
 add FIXMEs
Message-ID: <ZEE0T+jx5i59oV37@ugly>
Mail-Followup-To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
References: <20230405201220.2197878-1-oswald.buddenhagen@gmx.de>
 <87sfddv7e4.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87sfddv7e4.wl-tiwai@suse.de>
Message-ID-Hash: GFLF77UW7B322B6CLE6BI3BHGMPZA5AC
X-Message-ID-Hash: GFLF77UW7B322B6CLE6BI3BHGMPZA5AC
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GFLF77UW7B322B6CLE6BI3BHGMPZA5AC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 06, 2023 at 08:42:27AM +0200, Takashi Iwai wrote:
>On Wed, 05 Apr 2023 22:12:20 +0200, Oswald Buddenhagen wrote:
>>  The ``name`` is the name identifier string. Since ALSA 0.9.x, the
>>  control name is very important, because its role is classified from
>>  its name. There are pre-defined standard control names. The details
>>  are described in the `Control Names`_ subsection.
>> +// This is a questionable design, IMO. Why user-space heuristics when
>> +// the driver could set the roles/capabilities? This would avoid
>> +// problems like the Tone Control sliders (unlike the switch?!) being
>> +// misclassified as applying also to capture.
>
>Why this has to be discussed here and now...?
>
why not?

>It's the thing that was *defined* over two decades ago.
>
that may be so, but this doesn't explain anything.
it's a somewhat surprising choice, and it does in fact sometimes cause 
problems. so at least it should be thoroughly explained.

>> +// FIXME: explain.
>
>A patch please.
>
well, if i knew what to write there without doing deeper research first, 
i'd have already included it into the doc update. if you give me rough 
drafts (even just somewhat extensive bullet points), i can polish it for 
you (though i suspect that nowadays you may just dump it into chatgpt 
and get something reasonable out of it).

regards
