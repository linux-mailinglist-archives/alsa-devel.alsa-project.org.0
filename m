Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D2B6EBE1B
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Apr 2023 10:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8C02F19;
	Sun, 23 Apr 2023 10:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8C02F19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682239961;
	bh=bw1AY/4dHgOZuHPMP9NGEmf307Wih9rHfZcTVY7/tGo=;
	h=Date:From:To:Subject:In-Reply-To:CC:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=DApXamW2h3zTu2FkqCwZvjIGRu8hIQ2LL6GA4fuYg9dwUiqgj1mHImxUp2osvOz9Z
	 EhdZit/SvEEjK4KCqAcd41wyEZsxOFDDyCR5BXzsC3deLTNXVk8EKqM3Ws+G92eKwE
	 wp68FO5e3OTByywLengbueSj/dI+b32ftqukIvKU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37728F8018A;
	Sun, 23 Apr 2023 10:51:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5785DF80236; Sun, 23 Apr 2023 10:51:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E8D23F80137
	for <alsa-devel@alsa-project.org>; Sun, 23 Apr 2023 10:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D23F80137
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id CB0D824215;
	Sun, 23 Apr 2023 04:51:38 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqVRa-BlN-00; Sun, 23 Apr 2023 10:51:38 +0200
Date: Sun, 23 Apr 2023 10:51:38 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 2/2] ALSA: emu10k1: use high-level I/O in set_filterQ()
Message-ID: <ZETxmveuGo8cBqBI@ugly>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87y1mjnj8t.wl-tiwai@suse.de>
 <878rejoya4.wl-tiwai@suse.de>
Message-ID-Hash: UMWUQ5BZXTO4REUFMSYJHJ5A2ROJGIAU
X-Message-ID-Hash: UMWUQ5BZXTO4REUFMSYJHJ5A2ROJGIAU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMWUQ5BZXTO4REUFMSYJHJ5A2ROJGIAU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Apr 23, 2023 at 09:25:39AM +0200, Takashi Iwai wrote:
>Again, you must have a bit more say here...
>For example, you didn't write why this change is needed.
>You thought it obvious?  No, readers don't know.
>
it is obvious from the patch - the code becomes much shorter and more 
legible. and someone who just reads the log/blame wouldn't care, because 
it doesn't actually explain anything. but whatever.

On Sun, Apr 23, 2023 at 09:35:46AM +0200, Takashi Iwai wrote:
>On Sat, 22 Apr 2023 18:10:20 +0200,
>Oswald Buddenhagen wrote:
>> 
>> ... and also use more pre-defined constants on the way (some of which
>> required adjustment).
>> 
>> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
>
>Applied this one, but skipped the patch 2.
>
which is funny, because that commit message misses the obvious "why" 
part as well - it just mentions an additional thing that is unique to 
this patch.

so to be consistent, you should reject both patches and wait for an 
update.

>BTW, it would be really better if we define some macro for the
>highlevel I/O definition.  It's cumbersome to decode and check
>manually at review whether the conversion is correct, and it's
>error-prone.
>
yes, i considered that.
i also considered many more refactorings, and had to hold myself back -
there are enough nice-to-have patches in this series as-is.
i mean, 15 years ago it would have made sense to go crazy, but now the 
hardware is a bit too obsolete to go much beyond what i actually need 
for my project. i'm assuming some people outside the western sphere are 
still using our scrap with linux, but we rarely hear from them, so it's 
hard to know ...

regards
