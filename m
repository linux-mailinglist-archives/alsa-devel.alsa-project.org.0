Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA7772E5A3
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 16:25:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D89F7E74;
	Tue, 13 Jun 2023 16:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D89F7E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686666326;
	bh=SJg62XaxY8dn4yUGBoq1/UFj1mifMiQM5ld0GqbS3ns=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HoUdZhFOpj2aj5U9Xz7bPIzzKM9atU1Hp4BKhaKM1lzTqaEwdLh3RZ/wmA6/B3PJa
	 o3m0qc0rVzm5WeAdAoFU0IgPdn4N/JvSqOW9ZxQXbRvlWkmvgMHXJWlii3y93m+sj+
	 8nQs6+SN2RLJjz2tAELx93szIkCHCPmtfiXe3+EM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5624AF80132; Tue, 13 Jun 2023 16:24:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4593F80132;
	Tue, 13 Jun 2023 16:24:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5BC4F80149; Tue, 13 Jun 2023 16:24:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 284B5F80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 16:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 284B5F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Gg4sD3qd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=8qssJCDx
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 71E631FDBB;
	Tue, 13 Jun 2023 14:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686666269;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9RQl95P12+POXLnCCgfU/OKJ6ihJlPynRRID4GB5eus=;
	b=Gg4sD3qdSQQt5eMvPIb5pTedPLaB3WF8xPmWOV8f5s9LjKQzjca3nlVNcew2ZjJ/CnO/3W
	wo1W6iTLvFydLZz04gz147pNya+gUiXvwfBKxom1gkF9ymZg68ZHZ9rjBXJ1BwrHsQxGIK
	MSKX7AoF002sBkhBXUF/YQ1aF651Bzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686666269;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9RQl95P12+POXLnCCgfU/OKJ6ihJlPynRRID4GB5eus=;
	b=8qssJCDxeIhFf88O9y/2OhTPBis/R67nadGbPcGRzCzoeTnMvsa1lcO+HNjh3SmYafiBUl
	DWxX+X5GzfALQ4Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 520F213345;
	Tue, 13 Jun 2023 14:24:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id znrdEh18iGQMewAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 13 Jun 2023 14:24:29 +0000
Date: Tue, 13 Jun 2023 16:24:28 +0200
Message-ID: <87v8frcueb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Use maple tree register cache
In-Reply-To: <e48bbd3b-544d-43d5-82a1-8fbbcb8cd1a4@sirena.org.uk>
References: <20230609-alsa-hda-maple-v1-1-a2b725c8b8f5@kernel.org>
	<87v8fua1qm.wl-tiwai@suse.de>
	<877cs7g6f1.wl-tiwai@suse.de>
	<e48bbd3b-544d-43d5-82a1-8fbbcb8cd1a4@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 2YMALALDEM4NUINCQ22XPXBSA5CB5JQN
X-Message-ID-Hash: 2YMALALDEM4NUINCQ22XPXBSA5CB5JQN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2YMALALDEM4NUINCQ22XPXBSA5CB5JQN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 15:59:14 +0200,
Mark Brown wrote:
> 
> On Tue, Jun 13, 2023 at 09:36:34AM +0200, Takashi Iwai wrote:
> 
> > This is an error from regache_sync_val(), and it indicates that the
> > synced register is write-only; regcache_maple_sync() tries to sync all
> > cached values no matter whether it's writable or not, then hitting
> > this.
> 
> BTW I was just looking at reg_raw_update_once() and I can't figure out
> why it's trying to do what it's doing - it does a read to check if it's
> seen the register before and then does an _update_bits() if the register
> hasn't been cached yet, apparently trying suppress duplicate writes but
> possibly deliberately discarding changes to multiple bitfields in the
> same register.  That's not what the non-regmap path does, it'll only
> discard noop changes to the same bitfield.

Yes, it's a quite hackish way of optimization of the initialization.

Since HD-audio codec has no known default values unlike normal codecs,
it needs to initialize itself only at the first access, and this
helper does it.


Takashi
