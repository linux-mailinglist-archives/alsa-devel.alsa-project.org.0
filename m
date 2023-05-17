Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 869FA706BDC
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:58:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03D901FE;
	Wed, 17 May 2023 16:57:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03D901FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684335490;
	bh=qGs7BvWr/QoYncFAsJaiSJbhKq3Mh+sgnP45U+/r8so=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=srg7eAUoQ43lcg45d8YX5GLjD9jcaq7yYPYQ7HX/g2lRupj4Ih5jIelFK9QxE67Ku
	 EF93mBD7I02jzPXV0oeJ/zURiLSxaXkyos6Qi+l8ci0VE+5ZaarHuYFeQQ2Def9DcD
	 b8SZh/rBWTJOn3P4JvwsrzeVibP0Ig1zYzBzQMjs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB541F80548; Wed, 17 May 2023 16:56:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26D1FF8025A;
	Wed, 17 May 2023 16:56:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64369F80272; Wed, 17 May 2023 16:56:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F873F8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F873F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Eaxtbu7+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=atJLcGeW
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F129B22564;
	Wed, 17 May 2023 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684335408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ibgoaQed0YOZPO31PdHH3INact4M7VrxIu1eAcWFcw=;
	b=Eaxtbu7+hesNpvOcSw4cLsY18CTAqscNbzhT4X18jGx30XFI6n1qIyCL1zgbopNwqJoNbT
	a5zyAn9gAqSzBMniSmFkrzfYmWh/pu3blbeXQyM/xqnKp45taJeZWn35v98r7jtEnQauQs
	7iSBSoqjbNW5uDY2IwJ1oOQHKRh7rPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684335408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ibgoaQed0YOZPO31PdHH3INact4M7VrxIu1eAcWFcw=;
	b=atJLcGeW0wJEnF7iVC+vqWmSmlLSAO9qdHZCKgN5ccbhmOSwvyXLe7gTLwsgLAUpFy4OY2
	R9TLcAIcjSlGppAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C804013358;
	Wed, 17 May 2023 14:56:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MVC6LzDrZGT3dAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 17 May 2023 14:56:48 +0000
Date: Wed, 17 May 2023 16:56:48 +0200
Message-ID: <87ilcr0zwv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: cs46xx: mark snd_cs46xx_download_image as
 static
In-Reply-To: <20230516195046.550584-1-arnd@kernel.org>
References: <20230516195046.550584-1-arnd@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: INHUV6FKDBI4PGCVECDSEEQHPOQ7LNWV
X-Message-ID-Hash: INHUV6FKDBI4PGCVECDSEEQHPOQ7LNWV
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/INHUV6FKDBI4PGCVECDSEEQHPOQ7LNWV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 May 2023 21:50:41 +0200,
Arnd Bergmann wrote:
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> snd_cs46xx_download_image() was originally called from dsp_spos.c, but
> is now local to cs46xx_lib.c. Mark it as 'static' to avoid a warning
> about it lacking a declaration, and '__maybe_unused' to avoid a warning
> about it being unused when CONFIG_SND_CS46XX_NEW_DSP is disabled:
> 
> sound/pci/cs46xx/cs46xx_lib.c:534:5: error: no previous prototype for 'snd_cs46xx_download_image'
> 
> Fixes: 89f157d9e6bf ("[ALSA] cs46xx - Fix PM resume")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks, applied now.


Takashi
