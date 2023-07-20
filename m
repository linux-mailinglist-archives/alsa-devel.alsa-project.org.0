Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFC875AC1C
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 12:36:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 235A21F6;
	Thu, 20 Jul 2023 12:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 235A21F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689849389;
	bh=C797DpfHq5YCjhuRfxRmK+v/8E7YUkETrWn20rC71Qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nfvhns1W7Mdn5K2K00GSYn9x9MUcKER3Gb3zK0fWAAmJDe2zzdxxXFG8QgV1mqwvk
	 9YW40rc6JUD4O6O2lAcprFE2UYu+SHieeCC69PxdVXZc/0tbvgyFYLOniumRM6SpwO
	 FrfQxT3EpcA8XomFIaNv4vwK8TRdkKZOauSsLHTs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06B0CF8032D; Thu, 20 Jul 2023 12:35:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B803F800D2;
	Thu, 20 Jul 2023 12:35:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ADFDF8047D; Thu, 20 Jul 2023 12:35:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A7DA0F8027B
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 12:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7DA0F8027B
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 97F7F23FFF;
	Thu, 20 Jul 2023 06:35:22 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qMR0E-eJX-00; Thu, 20 Jul 2023 12:35:22 +0200
Date: Thu, 20 Jul 2023 12:35:22 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/4] ALSA: ac97: Use the standard snd_ctl_add_followers()
 helper
Message-ID: <ZLkN6jK5Gw19ZNqU@ugly>
References: <20230720082554.31891-1-tiwai@suse.de>
 <20230720082554.31891-3-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230720082554.31891-3-tiwai@suse.de>
Message-ID-Hash: 7OCDSWJWAZGTRSTMKETFWZI7ZNLNURPP
X-Message-ID-Hash: 7OCDSWJWAZGTRSTMKETFWZI7ZNLNURPP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7OCDSWJWAZGTRSTMKETFWZI7ZNLNURPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 20, 2023 at 10:25:52AM +0200, Takashi Iwai wrote:
>+	err = snd_ctl_add_followers(ac97->bus->card, kctl, followers);
>+	if (err < 0)
>+		return err;
> 
> 	return 0;
>
this seems a bit pointless - you could just
   return snd_ctl_add_followers(...
directly.

(more instances may be affected, but i don't see it due to little diff 
context.)

> }

regards
