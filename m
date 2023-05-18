Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DA1707EC6
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 13:05:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 899D5206;
	Thu, 18 May 2023 13:04:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 899D5206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684407925;
	bh=U5jgYxcB0iZpZDBDPKlyZ1viAYoyB9RL4QgkmvZHiRk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A7uzJgCxXz0ZqDwcW885xPPrrkE220rnlptdX50lyItzA2rU+m8JBWfGE2yPJlfCL
	 td4mt9hgKTMnzspUquREwV5AjFteEg4YjvFD7Xgo5kBv4Y6D3ekFZjuqLGg2DaxJPc
	 9T31HSMhPmDF/mErawTy2JZQcQuLzPxjYM+v4LGU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48F0BF80431; Thu, 18 May 2023 13:04:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB869F8016D;
	Thu, 18 May 2023 13:04:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFEAAF8025A; Thu, 18 May 2023 13:04:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 75CB3F8016A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 13:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75CB3F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=GVn2gqeB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=r9eFqMmi
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6F6471F854;
	Thu, 18 May 2023 11:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684407863;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AmUYU+LP3RR+gv5Br3rYSPCDpR28+Jmdp1jSSOEoBz8=;
	b=GVn2gqeBhhj4eLfbRRCOg0pxCIvh5f4QvzutqQQQXqzCk6cFqyBQalDsjIThs1lufWuM0E
	nlunxBpMjGyrFqFWNqVb6fi1jxriDUyM/mKp03R6HHmaHiPbui1mDKM8DJZZEl0Vxn8RT4
	qoePv1y7lypdE1yZSl4Kjk0gRfgYs+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684407863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AmUYU+LP3RR+gv5Br3rYSPCDpR28+Jmdp1jSSOEoBz8=;
	b=r9eFqMmiAp1bB69AuYx7QOTouKf9tJe9kXH1OhBuv6yWwxoOZUK1RsQFo/PGjOPbV9szGI
	n6ueZQZkbjc2X+Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3EBD11390B;
	Thu, 18 May 2023 11:04:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GLYzDTcGZmRBAgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 18 May 2023 11:04:23 +0000
Date: Thu, 18 May 2023 13:04:22 +0200
Message-ID: <87mt21zyrt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 9/9] ALSA: emu10k1: fix PCM playback buffer size
 constraints
In-Reply-To: <ZGXv3O1aCuDTrVz3@ugly>
References: <20230518092224.3696958-1-oswald.buddenhagen@gmx.de>
	<20230518092224.3696958-9-oswald.buddenhagen@gmx.de>
	<ZGXv3O1aCuDTrVz3@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: HMQE2SS2EYVJHLVWEP7MTW4DNLSZ5QUI
X-Message-ID-Hash: HMQE2SS2EYVJHLVWEP7MTW4DNLSZ5QUI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HMQE2SS2EYVJHLVWEP7MTW4DNLSZ5QUI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 18 May 2023 11:29:00 +0200,
Oswald Buddenhagen wrote:
> 
> sorry for the "flood", i forgot to adjust the declaration of the
> series in my tool. you can ignore the other patches; they didn't
> change from what you already applied.

Don't worry, now I applied this one.


Thanks!

Takashi
