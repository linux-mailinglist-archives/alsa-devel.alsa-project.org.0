Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FEF757362
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 07:49:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA17DA4E;
	Tue, 18 Jul 2023 07:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA17DA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689659392;
	bh=vuN4lkpGSh6DU3cppUBr1q8WfVHLVfoJLfMo0WGQwHI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HGkZk5scblux+nxrwnD0tXSAt2hdlq4Pi8HNOqxlaH0R1dm5RXCxUrRTnOhn1u1Ob
	 HYcWnOo1DpGf4t6hV0iACTYYEa3Ye6wANDfFNhZM8Sy9cWAnDphjkU+/2W8fEuh0O7
	 OWSYxhrAU0QY392q35L3cbZcyK5SBWlR48ywNcrA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CAE2F8027B; Tue, 18 Jul 2023 07:49:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55665F8027B;
	Tue, 18 Jul 2023 07:49:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC03CF8032D; Tue, 18 Jul 2023 07:47:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C340DF800D2
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 07:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C340DF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hYixx3PT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=BdBtupAG
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D8D3C1FDBC;
	Tue, 18 Jul 2023 05:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689659202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cx2ONDrSig1akU3irvmkBb2E7FUH6YZZVPsynoP1+dQ=;
	b=hYixx3PTttEtD+kKR/6ISUKvYvOSPmCL+DtiO0WjplUn85fMgGAtMF3nAM1cHuGOduG4ap
	WmN76o0gYr562MFKy6PESnRoB5coOFH7yN2ivAtaWrp6F7uJ9cJ2+swLcYIvw+5LEMaV96
	eyQkpzLx+fYaMi2c9R0vGG++OqbP+O0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689659202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cx2ONDrSig1akU3irvmkBb2E7FUH6YZZVPsynoP1+dQ=;
	b=BdBtupAGUDTe/JmB/XV4+eoX9iqTBpNsR7wElqGZjEuGEUQfZEiIYJbVZxaROQeQnwijde
	4GQQGNlEl+meY/DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A5979134B0;
	Tue, 18 Jul 2023 05:46:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id c59dJ0IntmQxdAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 05:46:42 +0000
Date: Tue, 18 Jul 2023 07:46:42 +0200
Message-ID: <871qh5py9p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] regmap: Add interface for checking if a register is
 cached
In-Reply-To: <20230717-regmap-cache-check-v1-0-73ef688afae3@kernel.org>
References: <20230717-regmap-cache-check-v1-0-73ef688afae3@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: HPD37YPQMDKM72JBWDNBUZXRY5V6GN6S
X-Message-ID-Hash: HPD37YPQMDKM72JBWDNBUZXRY5V6GN6S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HPD37YPQMDKM72JBWDNBUZXRY5V6GN6S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Jul 2023 22:33:02 +0200,
Mark Brown wrote:
> 
> HDA has a use case for checking if a register is present in the cache
> which it awkwardly open codes with use of _cache_only() and a read,
> provide a direct API for this.
> 
> ---
> Mark Brown (3):
>       regmap: Let users check if a register is cached
>       regmap: Provide test for regcache_reg_present()
>       ALSA: hda: Use regcache_reg_cached() rather than open coding

Reviewed-by: Takashi Iwai <tiwai@suse.de>

I suppose you'll take those from regmap.git?


thanks,

Takashi

> 
>  drivers/base/regmap/regcache.c     | 23 ++++++++++++++++++++++
>  drivers/base/regmap/regmap-kunit.c | 40 ++++++++++++++++++++++++++++++++++++++
>  include/linux/regmap.h             |  1 +
>  sound/hda/hdac_regmap.c            |  9 +++------
>  4 files changed, 67 insertions(+), 6 deletions(-)
> ---
> base-commit: 3953d5c79c21defa716624a8623c4157c0f2fee0
> change-id: 20230716-regmap-cache-check-6f6939f41ed5
> 
> Best regards,
> -- 
> Mark Brown <broonie@kernel.org>
> 
