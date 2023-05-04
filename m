Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F1C6F7136
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 19:39:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B19A21AD;
	Thu,  4 May 2023 19:38:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B19A21AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683221965;
	bh=loEyTjsHXAJyJWIE9GGpGQKRGYKpzMm4ZGvBDqqQz9g=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pnQV0/Et0HMceji/E6mOntY85jhiVB8jGGNp7MgH9W6kWlwLnJOx7HeE9OerTlnnm
	 cmxhIOe3qXNcRMXI4f0sTQBqOvuwCOiPGJVbARqYv5iVWfHZWI5W6PD1f1TBKc36b5
	 q4z//FifgBU0LBYnHUKUU4StdTP91DdUP7u3j8+Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 837DBF80529;
	Thu,  4 May 2023 19:38:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 604D0F8052D; Thu,  4 May 2023 19:38:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40182F80520
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 19:38:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40182F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pRfCjR2a;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=adfSLlCh
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 58638336EE;
	Thu,  4 May 2023 17:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1683221902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1JDNyI2A2JeWLX1zo06x5ZVL7JAqpPkw4kQG5Cc6Gd0=;
	b=pRfCjR2aXEeI00EI98aSTLNm/Ef9Z6MbBvo+5xPUF7dcAQ5bxTytTcdv8uhkyv78Ib2Kws
	W1BAUxqMnHCIwt0bon7dwnDTpCnmT73jGruf+77jrnZEFp+8C7bTgYIXcmnh9e42ow4B6+
	JtV8iInK8ITNBsZEX2WGMil4amYNSmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683221902;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1JDNyI2A2JeWLX1zo06x5ZVL7JAqpPkw4kQG5Cc6Gd0=;
	b=adfSLlCh8L8XxniItH7ZrspPIUJqHSOeOgFEcQVhL19cIHuKRHU9M25eHoyMxI1e429Wqn
	XhBk2ajOFlEXzqBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E13B13444;
	Thu,  4 May 2023 17:38:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id BZkECo7tU2Q/YAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 04 May 2023 17:38:22 +0000
Date: Thu, 04 May 2023 19:38:21 +0200
Message-ID: <87lei4j8tu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: pcm: fix snd_pcm_playback_silence() with
 free-running mode
In-Reply-To: <574a7e28-1b1c-e2c5-ff2e-f206c8956db7@perex.cz>
References: <20230504130007.2208916-1-oswald.buddenhagen@gmx.de>
	<87cz3gkyz9.wl-tiwai@suse.de>
	<c2e501b7-68bc-947b-645e-e425dcd20c65@perex.cz>
	<ZFO5B+1+HaIz4B4X@ugly>
	<877ctokv6x.wl-tiwai@suse.de>
	<ZFPQ68qLr2fy1qRs@ugly>
	<87ttwsjbrx.wl-tiwai@suse.de>
	<574a7e28-1b1c-e2c5-ff2e-f206c8956db7@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 5ZC5JLXODTEQ46XW3HZUHHCB4FK3MO7J
X-Message-ID-Hash: 5ZC5JLXODTEQ46XW3HZUHHCB4FK3MO7J
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZC5JLXODTEQ46XW3HZUHHCB4FK3MO7J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 04 May 2023 19:06:12 +0200,
Jaroslav Kysela wrote:
> 
> On 04. 05. 23 18:34, Takashi Iwai wrote:
> 
> > The acceptance of your patch was my failure, yeah.  I should have
> > rejected it.  So this failure doesn't happen again.  You're seeing the
> > result now.
> 
> We can keep the header comments and just revert the code for now.

Yes, this sounds like a good approach.

> If
> Oswald is not willing to work on this further, I'll look into this
> tomorrow. I see the points to be fixed. But I don't think that we are
> in hurry - the code was there for years so it's time to fix it
> properly.

That'll be highly appreciated!


Takashi
