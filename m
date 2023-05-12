Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FE07003B4
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 11:26:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F08791E0;
	Fri, 12 May 2023 11:25:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F08791E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683883585;
	bh=r7NWmMzlRKlDSEXPENMoQ8e1B7rBkjKBZtdq6JvXDwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=axx1kdW3ObdYC4d91xLx+7VfXCwep/hm67fmZg7kQXrXhtoA0yUZMHCUaKoJNVMg5
	 JRf11grRi/oyTFwKe4FBnD65Eoibq0EIPuS88cXLmRFpGuRDDUjgcUFKViIDziNNtH
	 TttCwlzAA2ZQdf7p/QcdrfiK4aoSxsAK2kSFIKQo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8C3AF80534; Fri, 12 May 2023 11:25:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BA12F8032D;
	Fri, 12 May 2023 11:25:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE4EFF8052E; Fri, 12 May 2023 11:25:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93519F8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 11:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93519F8014C
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 7743C23F58;
	Fri, 12 May 2023 05:25:23 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pxP1f-XAi-00; Fri, 12 May 2023 11:25:23 +0200
Date: Fri, 12 May 2023 11:25:23 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 07/14] ALSA: emu10k1: properly assert DSP init constraints
Message-ID: <ZF4GAwocaGBJRidc@ugly>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
References: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
 <20230510173917.3073107-8-oswald.buddenhagen@gmx.de>
 <87a5yaaum2.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87a5yaaum2.wl-tiwai@suse.de>
Message-ID-Hash: DUBOGRA5KXVGNLCWS6BKICQ72H222CDW
X-Message-ID-Hash: DUBOGRA5KXVGNLCWS6BKICQ72H222CDW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUBOGRA5KXVGNLCWS6BKICQ72H222CDW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 12, 2023 at 09:15:17AM +0200, Takashi Iwai wrote:
>On Wed, 10 May 2023 19:39:10 +0200,
>Oswald Buddenhagen wrote:
>> 
>> If these are hit, we've already trashed kernel memory by writing past
>> the end of the allocated buffer. There is no recovery from that.
>> 
>Again, this is NAK.

>First of all, if we really do care the overflow
>seriously, we should check at each increment instead of after
>breakage.  It shouldn't be too difficult at all.
>
not difficult, but pointless bloat.

>Second, using BUG_ON() like this case is an overkill.  It was clearly
>stated by Linus in the past a few times (although I can't find the
>source right now).
>
you seem to have an irrational aversion against assertions, maybe 
because linus likes to scream at people.

relevant comments from linus were easy enough to find:
https://yarchive.net/comp/linux/BUG.html
https://lore.kernel.org/all/CA+55aFwyNTLuZgOWMTRuabWobF27ygskuxvFd-P0n-3UNT=0Og@mail.gmail.com/T/#u

and there is also the documentation on BUG() itself.

i don't see anything in either of these that would imply that my use of 
BUG_ON() is inappropriate. it catches a serious programming error, is 
easy to prove correct (the scope is a single function), and the only 
immediate effect is that it will crash the insmod process (though i 
would expect possible followup effects due to the kernel memory 
corruption, which is exactly why the assert is there). i have a hard 
time thinking of a *more* appropriate use for BUG().

regards
