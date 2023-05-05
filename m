Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 326D46F802D
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 11:39:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F5012C1F;
	Fri,  5 May 2023 11:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F5012C1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683279584;
	bh=DJAvTomDQRxfFtYtmjsaVBoy4tYpNhpz+9/Uknh8I4Q=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oVdnEn8w51bKKfbujgKQJ8C4n92ztX7SuAEPcx3qmI9Np4bh3+E3PiHRR+LSgNv4y
	 Gn968YMXH17OR28CBZNUvXYxkFInDKmoFchkuIHchBfp00F73MdSH5NDniFYgmukw6
	 Kn9KRZ88LhtUpSkr55i/JQvzwg06tKTxM6JcWzYk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A94FDF80529;
	Fri,  5 May 2023 11:38:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C01C4F8052D; Fri,  5 May 2023 11:38:50 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D5F0EF804B1
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 11:38:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5F0EF804B1
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id BD85023E25;
	Fri,  5 May 2023 05:38:45 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1purtl-Y23-00; Fri, 05 May 2023 11:38:45 +0200
Date: Fri, 5 May 2023 11:38:45 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/5] ALSA: pcm: Revert "ALSA: pcm: rewrite
 snd_pcm_playback_silence()"
Message-ID: <ZFTOpRduzMVakOGx@ugly>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	ALSA development <alsa-devel@alsa-project.org>
References: <20230505073813.1219175-1-perex@perex.cz>
 <20230505073813.1219175-2-perex@perex.cz>
 <87zg6ji0pn.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87zg6ji0pn.wl-tiwai@suse.de>
Message-ID-Hash: O6XMKKHLRHVW37ST6O44CK7EWYMREF55
X-Message-ID-Hash: O6XMKKHLRHVW37ST6O44CK7EWYMREF55
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: ALSA development <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O6XMKKHLRHVW37ST6O44CK7EWYMREF55/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 05, 2023 at 11:31:16AM +0200, Takashi Iwai wrote:
>On Fri, 05 May 2023 09:38:09 +0200,
>Jaroslav Kysela wrote:
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>
>Better to add Reported-by and the reference for the original thread
>reporting the regression,
>
i'll post a slight rework of the series shortly, where i'll include 
this.

> as well as the Fixes tag.
>
that seems pointless for a revert, as all the info is already included 
anyway, no?

regards
