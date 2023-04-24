Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7216ECFA9
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 15:52:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B4D8F45;
	Mon, 24 Apr 2023 15:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B4D8F45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682344354;
	bh=qze/yqugFdhWssMOZ8UwYDIveoJeBz/Sr2bg2NnNeiI=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uRahHoEnlWqpkwA7Vh4N01SZhnQ6sb7Cr0VQFQPoCwGf7DayPlISf2QOoqVuABCDG
	 TCOcxW3+xtmsRYD3mAd32NunSH7ru4vOKK5LXZ9N6RlJXEwtzSX7//XHKPwuYzGx36
	 CD/ZVcQ/HvD3ySN2IFSnycAqiamM2j0LZC/ToNBY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76DF3F80162;
	Mon, 24 Apr 2023 15:51:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2539F8018A; Mon, 24 Apr 2023 15:51:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 635C2F800AC
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 15:51:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 635C2F800AC
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 956CE23FA3;
	Mon, 24 Apr 2023 09:51:34 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqwbO-YUq-00; Mon, 24 Apr 2023 15:51:34 +0200
Date: Mon, 24 Apr 2023 15:51:34 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 7/7] ALSA: emu10k1: use more existing defines instead of
 open-coded numbers
Message-ID: <ZEaJZgCA8tjxK38O@ugly>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
References: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
 <20230422161021.1143903-8-oswald.buddenhagen@gmx.de>
 <877cu3oy88.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <877cu3oy88.wl-tiwai@suse.de>
Message-ID-Hash: NW3OSNSVCCXRUSZXFSEGNZZFLQ5KD75A
X-Message-ID-Hash: NW3OSNSVCCXRUSZXFSEGNZZFLQ5KD75A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NW3OSNSVCCXRUSZXFSEGNZZFLQ5KD75A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Apr 23, 2023 at 09:26:47AM +0200, Takashi Iwai wrote:
>This patch actually broke the build due to A_I2S_CAPTURE_RATE, as
>0-day bot caught.  Any missing patch?
>
turns out it has a dependency on the "use high-level I/O functions also 
during init" patch. you applied that one meanwhile, so it's now safe to 
apply this one as well.
(i did a lot of re-ordering within the series and didn't re-test every 
commit separately each time, so it slipped through. :})

regards
