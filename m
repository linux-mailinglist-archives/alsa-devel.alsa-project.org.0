Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E4C700351
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 11:06:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BC441E0;
	Fri, 12 May 2023 11:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BC441E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683882359;
	bh=xm4tPxqigx6HHjke+kgLaZ0tO2jI3aR0QQ0l+vUT2+k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HaIytGLYF4Xdww/bQ6SCWsJj/dIpKockrXixQ4Z4eqArrxhSth5HBisnucMjEymxF
	 qzmy2dc7Po4/Ojtu1Vu7+BpQ3F9oF1q6uuWiMAl1WVsunfCZYtmfBZM065o9jOAQ1d
	 6Kk/iAlpQa58yLg6E7bDq7op+yQ25rxPRO6/Zlx0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADCE9F8032D; Fri, 12 May 2023 11:05:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 115BFF8014C;
	Fri, 12 May 2023 11:05:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 358C8F8052E; Fri, 12 May 2023 11:05:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F8A1F8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 11:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F8A1F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wclQSZJk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YmDmqdcU
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A659A20459;
	Fri, 12 May 2023 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1683882299;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7SiVotJRrCi9aOW2pl9zXwW9nMcm1Ssj5lJsvaMv+cM=;
	b=wclQSZJkzGlUef0QJfYU4en/51o1uSg7WAJ22eIm2WZyve79m8rmDPsQLBiZnaSspeMW/N
	+4kuxShDvSnHxLrgR98IE7nauBd0mXCvchWO/2sTa9FPgWb9yNVykn5yFomzIMOX718HFf
	oL3hJLAY1G7v61r3eH0shiOIGVy94V4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683882299;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7SiVotJRrCi9aOW2pl9zXwW9nMcm1Ssj5lJsvaMv+cM=;
	b=YmDmqdcURjdlhh3KCFO8/ThYy/GChp0xm2qCjVXtfo9DbzfoOfjD+AosX9cKt9RZ5xbqRg
	loffJjRLbT3qSLCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A75413499;
	Fri, 12 May 2023 09:04:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GhVKBTsBXmQWNQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 12 May 2023 09:04:59 +0000
Date: Fri, 12 May 2023 11:04:58 +0200
Message-ID: <87wn1dapj9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: tiwai@suse.com,	Jaroslav Kysela <perex@perex.cz>,	Stefan Binding
 <sbinding@opensource.cirrus.com>,	Andy Chi <andy.chi@canonical.com>,	Tim
 Crawford <tcrawford@system76.com>,	Meng Tang <tangmeng@uniontech.com>,
	"Luke D. Jones" <luke@ljones.dev>,	Philipp Jungkamp <p.jungkamp@gmx.net>,
	Kacper =?ISO-8859-2?Q?Michaj=B3ow?= <kasper93@gmail.com>,	Yuchi Yang
 <yangyuchi66@gmail.com>,	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix mute and micmute LEDs for yet
 another HP laptop
In-Reply-To: <20230512083417.157127-1-kai.heng.feng@canonical.com>
References: <20230512083417.157127-1-kai.heng.feng@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: X4CPV5BYOLNOUGKETTI5735RCYWE37RK
X-Message-ID-Hash: X4CPV5BYOLNOUGKETTI5735RCYWE37RK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X4CPV5BYOLNOUGKETTI5735RCYWE37RK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 May 2023 10:34:16 +0200,
Kai-Heng Feng wrote:
> 
> There's yet another laptop that needs the fixup to enable mute and
> micmute LEDs. So do it accordingly.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Thanks, applied.


Takashi
