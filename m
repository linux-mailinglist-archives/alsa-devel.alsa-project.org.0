Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABB9707302
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 22:29:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 437EC1F7;
	Wed, 17 May 2023 22:28:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 437EC1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684355367;
	bh=ZDi0zTUcc0H2tT99NNt7mcseS5JvHEnsCzHavXf7VsY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WG91J744FAXmK8PheQ+jcNUipic5RN6SOeK+aRhjhbERHD0DJgStO30mk1TUSn3mw
	 hPzk19Sd2SnZBRFKF3+Ty3NbtxXxX78plYMxrHgtCicCNzO8CtFk0VoI+PC2xnwxxY
	 xDfLImHbwaypVBHDDq4CM9Bq8ubWIbmhfM1gP9j0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 742B6F80431; Wed, 17 May 2023 22:28:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBC2CF8025A;
	Wed, 17 May 2023 22:28:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A784CF80272; Wed, 17 May 2023 22:28:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84A07F8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 22:28:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84A07F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=lobWVl+t;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fyGYrSMm
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E302B22665;
	Wed, 17 May 2023 20:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684355307;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TsMoPVln3DJjIjic43H/HtxMvkVu6MN2Vg/Yi5CKxAc=;
	b=lobWVl+tPn6RYkrzquAbpPUUU+0Xz3FGiQpyqiBgi6fEB88yTOvwta18Ms+4tl7A2QTPRX
	B4ZuDUgOAEqOvEe4RVMEqqo2x8IcneYnAawRHzVJ/RMX8F2DbHJ0fc7W8iNuSkAPj45lm+
	yZxF+FLgC6p0jHke+Snk3j6H/onTfYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684355307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TsMoPVln3DJjIjic43H/HtxMvkVu6MN2Vg/Yi5CKxAc=;
	b=fyGYrSMmNoM1O7B5tvabbnmyStk5593LkcVqzur8fCsa9p7ej8JQ5PgkeHpVUVWRbEbxeK
	mACeXQJmqBjcJICw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 582BB13478;
	Wed, 17 May 2023 20:28:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 3k41FOs4ZWSQCAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 17 May 2023 20:28:27 +0000
Date: Wed, 17 May 2023 22:28:26 +0200
Message-ID: <87353u1z4l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Arnd Bergmann <arnd@arndb.de>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: emu10k1: fix 64-bit integer division
In-Reply-To: <20230517201920.592909-1-arnd@kernel.org>
References: <20230517201920.592909-1-arnd@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: M56ZOG3C73W44LSCIDAYONFUP3THXE4S
X-Message-ID-Hash: M56ZOG3C73W44LSCIDAYONFUP3THXE4S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M56ZOG3C73W44LSCIDAYONFUP3THXE4S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 May 2023 22:19:17 +0200,
Arnd Bergmann wrote:
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Division of 64-bit values causes a link failure on 32-bit targets, depending
> on compiler version and target architecture:
> 
> ERROR: modpost: "__divdi3" [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
> ERROR: modpost: "__udivdi3" [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
> 
> Replace these with the safe div_u64() helpers.
> 
> Fixes: bb5ceb43b7bf ("ALSA: emu10k1: fix non-zero mixer control defaults in highres mode")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Another fix patch was already submitted and merged:
 https://lore.kernel.org/r/20230517164800.3650699-1-oswald.buddenhagen@gmx.de

Let me know if you still hit the issue with that patch.


thanks,

Takashi
