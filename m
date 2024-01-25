Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6AB83BCBD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 10:06:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E957E203;
	Thu, 25 Jan 2024 10:06:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E957E203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706173603;
	bh=/Awd5Rpw/LP0WK2bkwYJVJu10+RpEs5ehXlnYOdjEfU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jClQ7nU8s5n7XDWUJQFuwmOHy80QUmdQOT6dQHnQjEYiW2eo7rT/WV5IaUopEuY2D
	 21rGDb+sFm1rU8BintkqmN6ehoHFcsgalLrL+zgMUMTqHfM+GlMwKKR89hpFe5NBtK
	 MF10J6t8OXICpQUBcQwtqodQyU1qbhiSpTm85LXo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FC21F80567; Thu, 25 Jan 2024 10:06:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC9E9F8057E;
	Thu, 25 Jan 2024 10:06:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30C77F8028D; Thu, 25 Jan 2024 10:05:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C9C6F80149
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 10:05:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C9C6F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QTabPfsN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uhZpULmk;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=QTabPfsN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uhZpULmk
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BFF051F84C;
	Thu, 25 Jan 2024 09:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706173540;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LqO3/k5my85BZMbKqkCA9egmBjk9aaibA3LxQHowLFY=;
	b=QTabPfsNk0guURroVYzz+FmbtUAVMvVU+U/QVhvxpghjL64cTAe/0I1kGdF0ojvHfePUmw
	s4oFAktLUZBiHr2rd9e1PZBxZ0LQ1bKVXxHPhpuT452T7xqLhHyeLx/fwWygoPXKWU0nzX
	c7IA9xoYQdLvCLMHICIJnbAprtUNTKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706173540;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LqO3/k5my85BZMbKqkCA9egmBjk9aaibA3LxQHowLFY=;
	b=uhZpULmkXrNFMbMhGHbbHVJvzLH5vasozTg6RYgYPoAkQm2k2iXlytkmDzl2tz++C8ujhK
	z7qGV0VQdTzKWYAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706173540;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LqO3/k5my85BZMbKqkCA9egmBjk9aaibA3LxQHowLFY=;
	b=QTabPfsNk0guURroVYzz+FmbtUAVMvVU+U/QVhvxpghjL64cTAe/0I1kGdF0ojvHfePUmw
	s4oFAktLUZBiHr2rd9e1PZBxZ0LQ1bKVXxHPhpuT452T7xqLhHyeLx/fwWygoPXKWU0nzX
	c7IA9xoYQdLvCLMHICIJnbAprtUNTKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706173540;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LqO3/k5my85BZMbKqkCA9egmBjk9aaibA3LxQHowLFY=;
	b=uhZpULmkXrNFMbMhGHbbHVJvzLH5vasozTg6RYgYPoAkQm2k2iXlytkmDzl2tz++C8ujhK
	z7qGV0VQdTzKWYAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76A90134C3;
	Thu, 25 Jan 2024 09:05:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PI+MG2QksmUcPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Jan 2024 09:05:40 +0000
Date: Thu, 25 Jan 2024 10:05:40 +0100
Message-ID: <87o7d9kckb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<soyer@irl.hu>,
	<shenghao-ding@ti.com>,
	<perex@perex.cz>,
	<linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ALSA: hda: Move component binding support into
 separate library
In-Reply-To: <87plxqlucs.wl-tiwai@suse.de>
References: <20240124112607.77614-1-rf@opensource.cirrus.com>
	<87plxqlucs.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QTabPfsN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uhZpULmk
X-Spamd-Result: default: False [-1.18 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.87)[94.27%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BFF051F84C
Message-ID-Hash: IUCVXBJ7XGRAQ4ZZY3EJSXOVALXKOA4W
X-Message-ID-Hash: IUCVXBJ7XGRAQ4ZZY3EJSXOVALXKOA4W
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUCVXBJ7XGRAQ4ZZY3EJSXOVALXKOA4W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 24 Jan 2024 14:43:47 +0100,
Takashi Iwai wrote:
> 
> On Wed, 24 Jan 2024 12:26:05 +0100,
> Richard Fitzgerald wrote:
> > 
> > The Cirrus Logic amplifiers are currently paired with Realtek HDA codecs.
> > But they could be used with other codecs. To prepare for this, these two
> > patches move the manager side of the component binding out of the Realtek
> > driver into a library module.
> > 
> > The first patch tweaks the CS35L41 code so that it is not hardcoded to
> > CS35L41, and changes the TAS2781 handling so that it re-uses that code
> > instead of having a near-identical copy of it.
> > 
> > Can someone please test that these two patches don't break TAS2781?
> > I have checked that they should work in theory but I don't have hardware
> > to test on.
> > 
> > Richard Fitzgerald (2):
> >   ALSA: hda: realtek: Re-work CS35L41 fixups to re-use for other amps
> >   ALSA: hda: realtek: Move hda_component implementation to module
> 
> Through a quick glance, it looks good.
> I'll wait for the verification for TAS codec for a while.

Now applied to for-next branch.


thanks,

Takashi
