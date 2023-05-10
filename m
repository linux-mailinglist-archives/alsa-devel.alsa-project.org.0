Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 308806FD91C
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 10:22:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 138FB1048;
	Wed, 10 May 2023 10:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 138FB1048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683706929;
	bh=SZQrx3nay6Ywz5Y2fJSJnOtPkoGCao4MORfpHLZOjRs=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fz+8S4HV9j9qtDErPljzJRP/WMmRSXtcn3X/+2waDFUKZzJwBuT//CGmDsg6wIuXP
	 LGn0ho08KJIddH37vOTcifmqXg49mw1GSNCPiNRyzj/7jBgebc7IIWXGOxeJ9VZtas
	 7SZND6G2Nq8amV1skj+lU9Sr6coA3zq/1w3VQCL4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64A18F802E8;
	Wed, 10 May 2023 10:21:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 926CFF8032D; Wed, 10 May 2023 10:21:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B0234F80087
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 10:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0234F80087
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 1972023FB4;
	Wed, 10 May 2023 04:21:09 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pwf4O-XGY-00; Wed, 10 May 2023 10:21:08 +0200
Date: Wed, 10 May 2023 10:21:08 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: PCM: Fix codestyle issues in pcm_native.c
Message-ID: <ZFtT9J0DQI9uSd1x@ugly>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
	Ivan Orlov <ivan.orlov0322@gmail.com>, perex@perex.cz,
	tiwai@suse.com, axboe@kernel.dk, 42.hyeyoo@gmail.com,
	surenb@google.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
References: <20230510072726.435247-1-ivan.orlov0322@gmail.com>
 <2023051052-recoil-headache-1594@gregkh>
 <f1a912ea-884b-fdcd-1c05-87089f1e97b7@gmail.com>
 <87a5yc626f.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87a5yc626f.wl-tiwai@suse.de>
Message-ID-Hash: ORFGEZINX4IXZKXZ7LZ7BKTXYT5R5HQA
X-Message-ID-Hash: ORFGEZINX4IXZKXZ7LZ7BKTXYT5R5HQA
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Ivan Orlov <ivan.orlov0322@gmail.com>, tiwai@suse.com, axboe@kernel.dk,
 42.hyeyoo@gmail.com, surenb@google.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ORFGEZINX4IXZKXZ7LZ7BKTXYT5R5HQA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 10, 2023 at 10:06:16AM +0200, Takashi Iwai wrote:
>Also, if it's only about white space fix or some indent level issues,
>that could be rather more noise and disturbs the git change history,
>e.g. it makes difficult to find out the real code changes via git
>blame, especially it touches a huge amount of lines like this.
>
>That said, I'm not going to take such "coding style cleanup" patch
>blindly.  If it's associated with other real fix or enhancement, I'll
>happily take it.  Otherwise, I'd rather leave it.
>
a maybe less confusing way to put it would be "do whitespace cleanups 
only on the lines that contain "real" changes, and maybe in their 
immediate proximity for consistency". that means that whitespace-only 
patches are by definition not acceptable.

regards
