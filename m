Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 957FA6EDD8E
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Apr 2023 10:01:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 010D2105E;
	Tue, 25 Apr 2023 10:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 010D2105E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682409708;
	bh=SXb9Vgkng76Dypcy0jYJIOd4e9GHPdXfEF8IIXWEOGY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ultMH/F0WxRwoSF4nMr2dlU3/87WvVkMhUIPNz9I3VmUtWhpWy6Sjd3KD4mOQ96sU
	 8c3TPI2oHGURXBrR7nSojxnXNaUE89QgECvm+H3kTGQUPgBkRMEunEHXHpW9m5CtRS
	 U0Ikn5K96T/LjkgPChiteAKvvW77tK6M6JF6RjsU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E4E6F80236;
	Tue, 25 Apr 2023 10:00:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7788EF8025E; Tue, 25 Apr 2023 10:00:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 945DEF800F8
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 10:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 945DEF800F8
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 69C0124248;
	Tue, 25 Apr 2023 04:00:45 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1prDbR-oin-00; Tue, 25 Apr 2023 10:00:45 +0200
Date: Tue, 25 Apr 2023 10:00:45 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: emu10k1: fix multi-channel playback device class
Message-ID: <ZEeIrTZeEDHxwwAZ@ugly>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
References: <20230422161021.1143989-1-oswald.buddenhagen@gmx.de>
 <874jp7oy2k.wl-tiwai@suse.de>
 <ZEZa2oQV20IgqNvR@ugly>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZEZa2oQV20IgqNvR@ugly>
Message-ID-Hash: HCDXHRCU6CAMGAIRS7FYYXEZQF3PRDNE
X-Message-ID-Hash: HCDXHRCU6CAMGAIRS7FYYXEZQF3PRDNE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HCDXHRCU6CAMGAIRS7FYYXEZQF3PRDNE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 24, 2023 at 12:32:58PM +0200, Oswald Buddenhagen wrote:
>so i'd postulate that these enums are effectively dead, and both the 
>risk and the gain of this change are about zero.

speaking of dead code, lots of drivers explicitly assign info_flags = 0, 
dev_class = SNDRV_PCM_CLASS_GENERIC, and dev_subclass = 
SNDRV_PCM_SUBCLASS_GENERIC_MIX, which are all technically pointless, as 
the pcm struct is kzalloc'd anyway. and of course it's entirely 
inconsistent (with just about every combination present), because it 
obviously works without this. how would you feel about a patch that just 
removes all these?

regards
