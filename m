Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5B76F80AA
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 12:18:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF4FA2C39;
	Fri,  5 May 2023 12:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF4FA2C39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683281931;
	bh=4Q8kpt0V1JDxqadziS0t0d+kKTCMsWrt8PO4y62qCEE=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KfcQ8mUFSnlgh5bkKWgA2dw/Lg2PupMh6XwFIDOhP+kpeHpVcR3EklyEYubG5PA79
	 a38Oguqvcwbo+7NRV+eJuvkmh8c/6J1PjaqfzsaBxvcVHIC+sQImV7OCFZn1MZVFcQ
	 pbsdSOw1KDAFjhsS3pW1BdXLEopn2Wxp6TMNeLgk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FAC5F80529;
	Fri,  5 May 2023 12:18:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C672EF8052E; Fri,  5 May 2023 12:17:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9F26F80520
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 12:17:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9F26F80520
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 91E7A20386;
	Fri,  5 May 2023 06:17:53 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pusVd-ZMv-00; Fri, 05 May 2023 12:17:53 +0200
Date: Fri, 5 May 2023 12:17:53 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 3/5] ALSA: pcm: fix playback silence - correct the
 incremental silencing
Message-ID: <ZFTX0dyELDobdeAs@ugly>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	ALSA development <alsa-devel@alsa-project.org>
References: <20230505073813.1219175-1-perex@perex.cz>
 <20230505073813.1219175-4-perex@perex.cz>
 <87y1m3hzir.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87y1m3hzir.wl-tiwai@suse.de>
Message-ID-Hash: XAVWZFJRFF6KGT3FSCR76GFTQ6HZOPIN
X-Message-ID-Hash: XAVWZFJRFF6KGT3FSCR76GFTQ6HZOPIN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XAVWZFJRFF6KGT3FSCR76GFTQ6HZOPIN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 05, 2023 at 11:57:00AM +0200, Takashi Iwai wrote:
>But, the difficulty of the code (even after this patch) is that the
>filling behavior is completely different between the threshold and the
>fill-up modes, and we still try to use the similar code.
>
what is slightly confusing is that we're kinda abusing silence_filled to 
mean silence_filled + real_samples.
i can add a comment to that effect, but i don't think it's worth tearing 
apart the paths.

regards
