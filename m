Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E5E6FAB99
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 13:15:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AE9A1253;
	Mon,  8 May 2023 13:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AE9A1253
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683544516;
	bh=3fwhAIAirq3/mihv3IrV6TIQNHTUBnwvYpvvs2ANqBg=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PFQXxeCLW6YD6L1iuy/EpJ2EIb2+JZpDhTiEBkJrchED7r2ovICXFcnSyNqXE84Jq
	 7WCdKPObRuYGrPPQboz0Y3Ed02zZanXZgwE9au5nPzxZhf2HMuPF9etSusEA37SlEY
	 31nWMmKX52XTlug6englpx7h2OFknBMQu0qa6UwQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AF3BF80310;
	Mon,  8 May 2023 13:14:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A915F8032D; Mon,  8 May 2023 13:14:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 10BB2F80087
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 13:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10BB2F80087
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 21F13241E3;
	Mon,  8 May 2023 07:14:13 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pvyom-LTD-00; Mon, 08 May 2023 13:14:12 +0200
Date: Mon, 8 May 2023 13:14:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: emu10k1: macro-ize snd_emu10k1_ptr_{read,write}()
Message-ID: <ZFjZhNtk/GWzHUiN@ugly>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
References: <20230428095941.1706263-1-oswald.buddenhagen@gmx.de>
 <878rdzfg7a.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <878rdzfg7a.wl-tiwai@suse.de>
Message-ID-Hash: RWGCM2Z3ZFJFYWMJWHZF3CNKDVU2PYDW
X-Message-ID-Hash: RWGCM2Z3ZFJFYWMJWHZF3CNKDVU2PYDW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RWGCM2Z3ZFJFYWMJWHZF3CNKDVU2PYDW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, May 08, 2023 at 09:14:01AM +0200, Takashi Iwai wrote:
>Must those be macros?
>
yes. at least with the additional checks i've added in v2.

>Not only that macro isn't really safe to use for obvious reasons,
>
i don't see anything obviously bad. please be specific.

>the expansion would cost significantly as they are called in many 
>places.
>
after i fixed the calls with a non-const register in v2, the code size 
increases by less than 400 bytes (with ~95 call sites). i'd say that's 
negligible.

regards
