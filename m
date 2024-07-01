Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF1891E1CF
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 16:04:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C5EC2356;
	Mon,  1 Jul 2024 16:04:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C5EC2356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719842666;
	bh=w+fq7hAZICwQ8ms4QU9zqAnifRtgEhMdLeDYpMFOr0A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JmiXeZssC/5++PEsR8m3a7IJI0nQuCb/OshTnfe/K1+nxo948XwXS+gizI1umvhRA
	 bdirD5uELMeyNPQQsV5NuDuweGWzq7kB96qxxc/01VQq7ZBekRJ2G286jhozxXqY9c
	 4uqWcPGU9AmkYPokDcSLqQt2SMe43GZmof9U2gFA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EC09F8059F; Mon,  1 Jul 2024 16:03:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79394F80578;
	Mon,  1 Jul 2024 16:03:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D65B2F8028B; Mon,  1 Jul 2024 16:03:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55331F8003A
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 16:03:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55331F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nxwP+Q9n;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LurVQOTi;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ub/6WAXL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=yOZG147l
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C87BC219AE;
	Mon,  1 Jul 2024 14:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719842619;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=40Z2bpgm5kijfu/PKJMA05su7yleimcmmr2QFL4+IbM=;
	b=nxwP+Q9nLHejCyTv8hmik6ylkRFgJqBt1oszlyYZrG+GWi0jfOJ2Lk2A4xdluxtxZgv3zL
	SfUsurk9gD4r9rRCH5bcLg1uKlh8R4k8bDzOU9W7LESetfTzRodezuRGf8Hsu3vHOLR9/2
	SjzHHvKVp1lKzkgXWymCh2UB2egxMMs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719842619;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=40Z2bpgm5kijfu/PKJMA05su7yleimcmmr2QFL4+IbM=;
	b=LurVQOTiQEBIZYfVO1Yo0uiasq5uqX8GhFmWPh8OB+7gDjkCg2lNzjsB/qeGeJfG4PKEbh
	FaOeFslRPkQVARDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ub/6WAXL";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yOZG147l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719842618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=40Z2bpgm5kijfu/PKJMA05su7yleimcmmr2QFL4+IbM=;
	b=ub/6WAXLNxFJWS8zhP7rSpSzcSnd0r1nyEJLVZUKMP2vf7ypH3P006LIpgIFEgYGgP0NBU
	ECEVdgv0OiIOG1ErE/A3AA5Z0XesgDk9jtM7Py7aAR2gDMvTFW7uCMZ7dojj6vD96OhUTC
	QXi4m89fuYKN3v9mK7BtNo9QQyzSUX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719842618;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=40Z2bpgm5kijfu/PKJMA05su7yleimcmmr2QFL4+IbM=;
	b=yOZG147lLhEJDc2w6yhhoxL5Wv+TCNV1IiquuW5olXtA7QOhdrJIrn7v4wF33235NqAckX
	2oV5BRQCdlhgIzBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 83E1F13800;
	Mon,  1 Jul 2024 14:03:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rGz9Hjq3gmZOZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 01 Jul 2024 14:03:38 +0000
Date: Mon, 01 Jul 2024 16:04:06 +0200
Message-ID: <875xtp43ah.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: kernel test robot <lkp@intel.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ALSA: pcm: add support for 128kHz sample rate
In-Reply-To: <1j1q4ej50k.fsf@starbuckisacylon.baylibre.com>
References: <20240628122429.2018059-2-jbrunet@baylibre.com>
	<202406300718.iL828kaG-lkp@intel.com>
	<1j1q4ej50k.fsf@starbuckisacylon.baylibre.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,gmail.com,suse.com,perex.cz,lists.linux.dev,alsa-project.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,intel.com:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C87BC219AE
Message-ID-Hash: 7I6M2NU5XHKIWJI2ZTYOJMGS65REPWCW
X-Message-ID-Hash: 7I6M2NU5XHKIWJI2ZTYOJMGS65REPWCW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7I6M2NU5XHKIWJI2ZTYOJMGS65REPWCW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 30 Jun 2024 08:53:15 +0200,
Jerome Brunet wrote:
> 
> On Sun 30 Jun 2024 at 07:29, kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Jerome,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on tiwai-sound/for-next]
> > [also build test ERROR on tiwai-sound/for-linus broonie-sound/for-next linus/master v6.10-rc5 next-20240628]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/ALSA-pcm-add-support-for-128kHz-sample-rate/20240629-201915
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
> > patch link:    https://lore.kernel.org/r/20240628122429.2018059-2-jbrunet%40baylibre.com
> > patch subject: [PATCH 1/3] ALSA: pcm: add support for 128kHz sample rate
> > config: i386-buildonly-randconfig-004-20240630
> > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> > reproduce (this is a W=1 build):
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406300718.iL828kaG-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >>> sound/usb/caiaq/audio.c:179:2: error: #error "Change this table"
> >     #error "Change this table"
> >      ^~~~~
> >
> >
> > vim +179 sound/usb/caiaq/audio.c
> >
> > 523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack 2007-03-26  176  
> > 523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack 2007-03-26  177  /* this should probably go upstream */
> > 523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack 2007-03-26  178  #if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12
> > 523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack 2007-03-26 @179  #error "Change this table"
> > 523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack 2007-03-26  180  #endif
> > 523f1dce37434a sound/usb/caiaq/caiaq-audio.c Daniel Mack 2007-03-26  181  
> 
> This file is not in mainline or
> https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
> branch ...

It's sound/usb/caiaq/audio.c.


Takashi
