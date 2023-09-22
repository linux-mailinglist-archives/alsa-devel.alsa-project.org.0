Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B39837AB3F5
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 16:43:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25DA7E0F;
	Fri, 22 Sep 2023 16:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25DA7E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695393789;
	bh=GnHK4t+H/hbSzPG9p3Xwev88JKAlhhWrsRPvYxCKknE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AxX7e5Jp9jYd/zF4Z7XUzGD4Krj1RRu82Qlz48SHGsY4nAu6B7leGPbIfMshKDRv4
	 ecH5n16VYtR3/d0XU86VEMtw9KG+lLsk25qr+zd5wEkLQ8qLuEU/y4C64t5ZVjAO/7
	 wbtbriOgzJ+hfuKtpUCBBg8ShF0PamxUz2VvEpA4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 954ADF80125; Fri, 22 Sep 2023 16:42:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1962EF80124;
	Fri, 22 Sep 2023 16:42:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29FD6F80125; Fri, 22 Sep 2023 16:42:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E394DF80005
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 16:42:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E394DF80005
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BoygnDgU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=z7sVCah2
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6B5C721BAE;
	Fri, 22 Sep 2023 14:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695393731;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vsYs7teImzxxwbkHtVuHpQ4+rO1AjDnXKTQlq1Zdx9U=;
	b=BoygnDgUKJeQ1isvTeZiAi3i5Jyc0ksCMasRm8muiX970HbpKbfb5ysuwynC8q9/9hLfXV
	G6KsiVQQxmhG5n2HYwN/4VYQ/zYXdn/mn7Svp8Ch0xcg46VUyqHsdVhaeQpa0F5kdBMEqe
	mmTDsNDxkfRGAnFVoLQ6WdD0nigiViM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695393731;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vsYs7teImzxxwbkHtVuHpQ4+rO1AjDnXKTQlq1Zdx9U=;
	b=z7sVCah26jW0ALFIUaWtIb9Y5OAB5fiEH7PLjfuLzu+P4+ato3aiJGj9PZO0SMu7aJ/6qH
	l1qfyhvUc+CNmnCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C4A113478;
	Fri, 22 Sep 2023 14:42:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ohNTDMOnDWWABgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 22 Sep 2023 14:42:11 +0000
Date: Fri, 22 Sep 2023 16:42:10 +0200
Message-ID: <875y42clrx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1 0/2] ALSA: cs35l41: prevent old firmwares using
 unsupported commands
In-Reply-To: <8b5a22bf-73e3-45ca-b61b-38482c9caa39@sirena.org.uk>
References: <20230922142818.2021103-1-sbinding@opensource.cirrus.com>
	<87a5tecm2m.wl-tiwai@suse.de>
	<8b5a22bf-73e3-45ca-b61b-38482c9caa39@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: T2YNJIDLNHOBG554I7LQLKALRF6HVAZ3
X-Message-ID-Hash: T2YNJIDLNHOBG554I7LQLKALRF6HVAZ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2YNJIDLNHOBG554I7LQLKALRF6HVAZ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 22 Sep 2023 16:38:28 +0200,
Mark Brown wrote:
> 
> On Fri, Sep 22, 2023 at 04:35:45PM +0200, Takashi Iwai wrote:
> > Stefan Binding wrote:
> 
> > > This chain is based on Mark's branch, since the api change was made to
> 
> The term is patch series.
> 
> > > the function in sound/soc/codecs/cs35l41-lib.c.
> 
> > I'd need a PR from Mark before applying those, then.
> 
> Or if they're 6.7 stuff I guess I could just carry them.

Yes, that's another option.  But there are already changes for HDA
cs35l41 stuff for 6.7, and you might need to pull from my for-next
branch beforehand.  A bit messy in either way.


thanks,

Takashi
