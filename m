Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 767316EADE2
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 17:17:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A64D5E8D;
	Fri, 21 Apr 2023 17:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A64D5E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682090221;
	bh=txF4cbJJG4hGcv3iTlTceiTwcNzrxIkkLcnZlLEI86k=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=J93zs6jR5Clm7kyAAZc79GEZ4J4HJR+n6RKASJUYLjumZcTngTSSo5tQLYY4I8e/S
	 tIEpgG/eOCay16YcBdHIxY8JZ9mAF6XsZvJpccQy6CFt18D4zt8F7/ZPCRa8Lrrc/l
	 6qLGLf6ZgWCF86d2/iJZrJq7zSYHtKVHldSjpxAU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AC85F80155;
	Fri, 21 Apr 2023 17:16:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A0B3F8019B; Fri, 21 Apr 2023 17:16:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90FDFF80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 17:16:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90FDFF80053
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 4F2BF240FD
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 11:16:04 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1ppsUW-EiN-00
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 17:16:04 +0200
Date: Fri, 21 Apr 2023 17:16:04 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/7] ALSA: emu10k1: drop redundant
 snd_emu10k1_efx_playback_hw_free()
Message-ID: <ZEKotHwG1CjoSDek@ugly>
Mail-Followup-To: alsa-devel@alsa-project.org
References: <20230421141006.1005452-1-oswald.buddenhagen@gmx.de>
 <87r0sdqo5n.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87r0sdqo5n.wl-tiwai@suse.de>
Message-ID-Hash: RKFXIX26GRKHUERG3S7TWRC67RSVVWH5
X-Message-ID-Hash: RKFXIX26GRKHUERG3S7TWRC67RSVVWH5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RKFXIX26GRKHUERG3S7TWRC67RSVVWH5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 21, 2023 at 04:56:52PM +0200, Takashi Iwai wrote:
>Also, when you submit this size of patch series, please make a cover
>letter and explain what the series are intended.
>
i've actually pondered that and concluded that it would be kinda 
pointless, because the theme "cleanups" is rather obvious.

for the other series it would be "fpga access fixes & cleanups", which 
also seemed obvious enough.

anyway, i'll lower the "threshold of noteworthiness" for the future.

regards
