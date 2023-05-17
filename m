Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 545B5706BE0
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:58:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9F031F7;
	Wed, 17 May 2023 16:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9F031F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684335518;
	bh=3E2C+ilQL8zp9rUE/1Gj3QRmFh+tNz2V5SKAADBe2bw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MfDKWxrFBKSUiXnbnCeJjKd5qfi+r9rXvu5H6/Anh/yr4PW8B6UPyXB/7UGHCOkUd
	 HQyvD20KeGjuT4sts34/3WYOmT0OtM+KzUZIqJhI70tFKCRZHkHkzqBp9k+JLnxwvI
	 /Ru8qBJNmDFBp3s1zB016Bd98CBWkbLJwOSWYQoA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02E2AF8055B; Wed, 17 May 2023 16:57:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE039F80551;
	Wed, 17 May 2023 16:57:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FB39F80552; Wed, 17 May 2023 16:57:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C42E3F8053D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C42E3F8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=d3l3jgdy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rvSYSb3N
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8C80C22593;
	Wed, 17 May 2023 14:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684335419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CCW0GSVzxQIr22NMJ3VJJ2BVu5t1BOc63dfYXKfxO18=;
	b=d3l3jgdyGFM/s1sCSrw7VbD0oowiqXOHwcAFY+k/eVOFhofzYpLshx5Ux9n7tYKNF6qsz4
	J1eCaGUEuEeEljIkUN3Xe5BTFyyuYT7rU27t+eOichhiRwKiCpY/ZPtvMt5kNfb/mGEIk+
	WY1nSLZiN9yawymFCg9V7SeZe65ehDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684335419;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CCW0GSVzxQIr22NMJ3VJJ2BVu5t1BOc63dfYXKfxO18=;
	b=rvSYSb3NIVYjyn7W0VOR+nto5H5blgLZClSXb6sibCtryE7HbXVhO+0naD4qnv9KZniAR1
	WoCY9qYXozr5DlCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B73913358;
	Wed, 17 May 2023 14:56:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QpUsFTvrZGQNdQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 17 May 2023 14:56:59 +0000
Date: Wed, 17 May 2023 16:56:58 +0200
Message-ID: <87h6sb0zwl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ALSA: oss: avoid missing-prototype warnings
In-Reply-To: <20230516195046.550584-2-arnd@kernel.org>
References: <20230516195046.550584-1-arnd@kernel.org>
	<20230516195046.550584-2-arnd@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: JBHFP2VW5QUN5Y355UQUDJ52XZ35Q4O4
X-Message-ID-Hash: JBHFP2VW5QUN5Y355UQUDJ52XZ35Q4O4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JBHFP2VW5QUN5Y355UQUDJ52XZ35Q4O4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 May 2023 21:50:42 +0200,
Arnd Bergmann wrote:
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Two functions are defined and used in pcm_oss.c but also optionally
> used from io.c, with an optional prototype. If CONFIG_SND_PCM_OSS_PLUGINS
> is disabled, this causes a warning as the functions are not static
> and have no prototype:
> 
> sound/core/oss/pcm_oss.c:1235:19: error: no previous prototype for 'snd_pcm_oss_write3' [-Werror=missing-prototypes]
> sound/core/oss/pcm_oss.c:1266:19: error: no previous prototype for 'snd_pcm_oss_read3' [-Werror=missing-prototypes]
> 
> Avoid this by making the prototypes unconditional.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks, applied now.


Takashi
