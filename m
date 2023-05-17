Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6C87072E1
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 22:20:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6704E1FC;
	Wed, 17 May 2023 22:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6704E1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684354801;
	bh=Dvtv8pSNHd/3p5/ADg/iz7hVB6G/ZTgzwrKg3ZudzmM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LnRGwZXFCHg19P09ZZft3b5ORZlyCQRltlt5TjgCNvC8OaQsjmPWAR3uPjp1a7bJO
	 bEWd9KiH+unXx62IzsXGy4i71r765l5LRajXMFfkCTENFfieJJcMNJ9D2nOYes9bYQ
	 48FabHOmJozFIth1Sme3wl12uZJIQyZAhGkZKVkI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5B3BF80549; Wed, 17 May 2023 22:19:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4588F8025A;
	Wed, 17 May 2023 22:19:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7B5FF80272; Wed, 17 May 2023 22:18:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E9D96F8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 22:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9D96F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=iaLtxLKX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LtLmmsnu
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3A14B22622;
	Wed, 17 May 2023 20:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684354731;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+mR/qksS6Sq/MuwYCqpKG165oYMDJK2AcyjLgtwP+o=;
	b=iaLtxLKXpNzj1ha+SarH32AT6FiIOtMRdJ5hsRazR17dz2ZLjJ8TuxtjBwHUmS9moFIaj3
	nFj9DFlYrIf9GUWM16CpZZgcDzGZOI8t70nrym/VNI9efLOHuc6PesTcbWcOp75UuJ+pAu
	nFUJs+YFy+V7pN6jMtNxSYRrL8pBs1U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684354731;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+mR/qksS6Sq/MuwYCqpKG165oYMDJK2AcyjLgtwP+o=;
	b=LtLmmsnuuXapwVhJs1Hvwyv8+BQ0GOiTfyP/wCVevaeYR5Xh+hh1qZ5NxPeW49KjzkNYqy
	92eFQWZNpd+QGaDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C48E13478;
	Wed, 17 May 2023 20:18:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EBJhAas2ZWSABAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 17 May 2023 20:18:51 +0000
Date: Wed, 17 May 2023 22:18:50 +0200
Message-ID: <875y8q1zkl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH] ALSA: emu10k1: remove runtime 64-bit divisions
In-Reply-To: <20230517164800.3650699-1-oswald.buddenhagen@gmx.de>
References: <20230517164800.3650699-1-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: OLO7CTZBLH4CQQZZR46QWJJ7UYCRMASN
X-Message-ID-Hash: OLO7CTZBLH4CQQZZR46QWJJ7UYCRMASN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OLO7CTZBLH4CQQZZR46QWJJ7UYCRMASN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 May 2023 18:48:00 +0200,
Oswald Buddenhagen wrote:
> 
> 32-bit platforms don't like these. As we're actually dealing with
> constants, factor out the calculations and pass them in as additional
> arguments. To keep the call sites clean, wrap the actual functions in
> macros which generate the arguments.
> 
> Fixes: bb5ceb43b7bf ("ALSA: emu10k1: fix non-zero mixer control defaults in highres mode")
> Fixes: 1298bc978afb ("ALSA: emu10k1: enable bit-exact playback, part 1: DSP attenuation")
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
> 
> ---
> 
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
> ---

Thanks, applied now.


Takashi
