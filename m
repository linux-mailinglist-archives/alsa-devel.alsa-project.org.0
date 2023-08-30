Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5483078D6D7
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Aug 2023 17:13:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DEC11DC;
	Wed, 30 Aug 2023 17:12:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DEC11DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693408411;
	bh=g07jzBuhC+S5pZIQv45jfeXLs2iHMnz/PzsOou+LhUU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OhPQ1blt5AI4iJZpyfjvtZfvPrLQwKQPaQ75cM58/DkBB44r5CS0FYEAnOKcTugoM
	 HEsbEvLVbAnk0OCePsjTeKKnawI4Y/nEV/Kjoi+JhmkFuMOxU45IyFZnzw/KJF+dWs
	 9eOgxj1YVfH0vm711te5hwNjrTtT6bzMjScZDV1k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 348BCF8023B; Wed, 30 Aug 2023 17:12:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F5A6F800F5;
	Wed, 30 Aug 2023 17:12:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC22FF80155; Wed, 30 Aug 2023 17:12:16 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A3CAFF80094
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 17:12:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3CAFF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=gRw3ufwX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rK20637W
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9231D1F45F;
	Wed, 30 Aug 2023 15:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693408332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t40XEzRpGZfp8+6J4H0kh7K0iLROTuGTa5ymi1tx/M0=;
	b=gRw3ufwXH6OqCSLN/K6J41i6LBXT7DwyDRBuMPqUJE4gATTr0RORMpbcwMGVZ6eD4srqXS
	CQypot+pjPbmJ+0bhTW/tb1x9OpOuEKmPq0adD6JrYigOc0qJwumOjkwTZK6XK3XDnEvB7
	z/K5QSEyGNob4fkRRVHDf/1tHhoVUTc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693408332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t40XEzRpGZfp8+6J4H0kh7K0iLROTuGTa5ymi1tx/M0=;
	b=rK20637WNo/ZH/uBEcLA79DHUR4xqEXK41LWHUt1E8q/X8U2TfD7EpambQLfPE4q6GYX6L
	RCsZNREfUBYi5wAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 701A71353E;
	Wed, 30 Aug 2023 15:12:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id /sraGkxc72RzJgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 30 Aug 2023 15:12:12 +0000
Date: Wed, 30 Aug 2023 17:12:12 +0200
Message-ID: <87ledsfttf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
	James Schulman
	<james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	"Richard Fitzgerald" <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>,
	<alsa-devel@alsa-project.org>,
	<patches@opensource.cirrus.com>,
	<linux-kernel@vger.kernel.org>,
	Linus Torvalds
	<torvalds@linux-foundation.org>,
	<regressions@lists.linux.dev>
Subject: Re: mainline build failure due to ace6d1448138 ("mfd: cs42l43: Add
 support for cs42l43 core driver")
In-Reply-To: <20230830150037.GW103419@ediswmail.ad.cirrus.com>
References: <ZO8oNb2hpegB6BbE@debian>
	<87cyz4he2u.wl-tiwai@suse.de>
	<20230830150037.GW103419@ediswmail.ad.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: E4UDXWXZFLNZTOBXX5SB2KQOX5YBDL6Y
X-Message-ID-Hash: E4UDXWXZFLNZTOBXX5SB2KQOX5YBDL6Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E4UDXWXZFLNZTOBXX5SB2KQOX5YBDL6Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 30 Aug 2023 17:00:37 +0200,
Charles Keepax wrote:
> 
> On Wed, Aug 30, 2023 at 03:09:13PM +0200, Takashi Iwai wrote:
> > On Wed, 30 Aug 2023 13:29:57 +0200,
> > Sudip Mukherjee (Codethink) wrote:
> > > 
> > > Hi All,
> > > 
> > > The latest mainline kernel branch fails to build alpha, csky and s390
> > > allmodconfig with the error:
> > > 
> > > drivers/mfd/cs42l43.c:1138:12: error: 'cs42l43_runtime_resume' defined but not used [-Werror=unused-function]
> > >  1138 | static int cs42l43_runtime_resume(struct device *dev)
> > >       |            ^~~~~~~~~~~~~~~~~~~~~~
> > > drivers/mfd/cs42l43.c:1124:12: error: 'cs42l43_runtime_suspend' defined but not used [-Werror=unused-function]
> > >  1124 | static int cs42l43_runtime_suspend(struct device *dev)
> > >       |            ^~~~~~~~~~~~~~~~~~~~~~~
> > > drivers/mfd/cs42l43.c:1106:12: error: 'cs42l43_resume' defined but not used [-Werror=unused-function]
> > >  1106 | static int cs42l43_resume(struct device *dev)
> > >       |            ^~~~~~~~~~~~~~
> > > drivers/mfd/cs42l43.c:1076:12: error: 'cs42l43_suspend' defined but not used [-Werror=unused-function]
> > >  1076 | static int cs42l43_suspend(struct device *dev)
> > >       |            ^~~~~~~~~~~~~~~
> > > 
> > > git bisect pointed to ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")
> > > 
> > > I will be happy to test any patch or provide any extra log if needed.
> > 
> > Adding __maybe_unused for those PM functions should work around it,
> > something like below.  Could you check it?
> > If it's confirmed to work, I'll submit properly.
> > 
> > 
> 
> This is probably the correct fix:
> 
> https://lore.kernel.org/lkml/20230822114914.340359-1-ckeepax@opensource.cirrus.com/
> 
> Just waiting on it to be reviewed.

Thanks, that looks better.  Let's wait for the patch acceptance.


Takashi
