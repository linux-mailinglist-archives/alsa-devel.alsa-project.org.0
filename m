Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFFA7D3766
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 15:04:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 172E884D;
	Mon, 23 Oct 2023 15:03:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 172E884D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698066248;
	bh=PQvdAQWdIlAriZMizBkgAgiU3Z/NjBXu+3Xss+bAWig=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Uj93Wpk9denxroIgQRqhoSkjsJVY8s9OC/In/EJd49IgDr4J0xu7CqUQSVeLNbPw0
	 KS8b/1q01lPvkguNX53TG+0twGKdLpuf+MVbzAW44wF8y2Agj342ycG940uVNqJ8VG
	 pt1t5lqYE9Ik0gwU+89tzMx1Vox4SphWnD//OO+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5153AF80134; Mon, 23 Oct 2023 15:03:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83104F8032D;
	Mon, 23 Oct 2023 15:03:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 862A4F804F3; Mon, 23 Oct 2023 15:03:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74F08F8024E
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 15:03:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74F08F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=NF+lkv68;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=N/txoNvC
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6114A1FE10;
	Mon, 23 Oct 2023 13:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1698066182;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1yw8BoQ6trsZPlywIUDNuA5oBRM9Q33rCq1UHuSFl2Q=;
	b=NF+lkv68NwNJJp3VElDysvvYhoiwKuYltMS3eAh8epsCGyTIRJ1nVRCTpBfO+JSYkpm2hz
	jqMlZ0Vc6FA+Dxa68eOzl1qnOfljX7r11fr+DFUPKXP6R1aNRT7rUFgnkesoLb7xVgiE5C
	81D4l/Tnv0Il1L/RZiqlJPaL+xYpOr4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698066182;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1yw8BoQ6trsZPlywIUDNuA5oBRM9Q33rCq1UHuSFl2Q=;
	b=N/txoNvCTX6fg5NswfpA1tkz2dg2TAzU1KG6ebI9I2/vy7+cpNV8aXItzniyDxlDnPc1BK
	sIUiOr6yCMv24wAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BFC7132FD;
	Mon, 23 Oct 2023 13:03:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id x0hpBAZvNmX6PwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 23 Oct 2023 13:03:02 +0000
Date: Mon, 23 Oct 2023 15:03:01 +0200
Message-ID: <87wmvdwkxm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: ALSA development <alsa-devel@alsa-project.org>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] MAINTAINERS: ALSA: change mailing list to linux-sound on
 vger
In-Reply-To: <20231020071247.973909-1-perex@perex.cz>
References: <20231020071247.973909-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-4.55 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-2.95)[99.79%];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 RCPT_COUNT_FIVE(0.00)[6];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 TO_DN_ALL(0.00)[];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[];
	 FREEMAIL_CC(0.00)[alsa-project.org,suse.com,kernel.org,gmail.com,linuxfoundation.org]
Message-ID-Hash: 576M3W74LZ3GJHUETPT4I2NOKUYWRG3H
X-Message-ID-Hash: 576M3W74LZ3GJHUETPT4I2NOKUYWRG3H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/576M3W74LZ3GJHUETPT4I2NOKUYWRG3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 20 Oct 2023 09:12:47 +0200,
Jaroslav Kysela wrote:
> 
> As discussed on alsa-devel mailing list [1], it is useful to have an open
> mailing list to avoid moderation delays for the kernel patch work. Use
> linux-sound mailing list for kernel driver related threads.
> 
> In the first stage, change the list for the ALSA core, ASoC and tests.
> 
> [1] https://lore.kernel.org/alsa-devel/20231019-posture-cache-fe060b@meerkat/
> 
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Ivan Orlov <ivan.orlov0322@gmail.com>
> Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>

Applied to for-next branch now.  Thanks.


Takashi
