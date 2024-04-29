Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDC18B5799
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 14:13:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CA68950;
	Mon, 29 Apr 2024 14:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CA68950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714392830;
	bh=is+ZZRR1qjQpcT+IviiIaio3XkpSgD8LftCNzbntfDU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fN+1esg8BjTjrMosGqi/0+zi4jn6fOLyriHNrOHHwJ3kVpw/UwkawpvQdNo5FnHOB
	 GyUCFUlWHuFe7OGG9P7x6yxddonZbVxsTCngCSZ+aaHbMxtKrh2cW0feWd3RL5ZDZ6
	 yrFcYfT0M3gcglVFOdglm/BUppzihs0ptYIrjNZs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B98EF804CC; Mon, 29 Apr 2024 14:13:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 859D1F804CC;
	Mon, 29 Apr 2024 14:13:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8867AF800B5; Mon, 29 Apr 2024 14:13:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DAF8F8003C
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 14:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DAF8F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=u3z3yMXW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YdzBQ9nR;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=u3z3yMXW;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YdzBQ9nR
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 93FD233743;
	Mon, 29 Apr 2024 12:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714392784;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ta/xgiOSdujgYrMackSTdmdnjtlcI/U1edyYAhI44nw=;
	b=u3z3yMXWNO1peNgfA6o0JOXiHGnAkbUREtR7LKVaUrARitgKPwq17nahal7yzRHFrLQ69s
	CrBdf+jL8oXheHO5lI9ijJ4PmQC/FmHC+/3fN1sWC9MgL14ddkJ2fpPxkYellyfaiVW/tl
	tY4p++rSyiULhpzQD2fndc9Nxn98Egg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714392784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ta/xgiOSdujgYrMackSTdmdnjtlcI/U1edyYAhI44nw=;
	b=YdzBQ9nR91L3a8xEkKxAtGDdrD7etwTeKKJAmILTesf7JWrO1gBB8AmUdafI7HcBnXjUVr
	rBSYifoEGomkUBBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714392784;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ta/xgiOSdujgYrMackSTdmdnjtlcI/U1edyYAhI44nw=;
	b=u3z3yMXWNO1peNgfA6o0JOXiHGnAkbUREtR7LKVaUrARitgKPwq17nahal7yzRHFrLQ69s
	CrBdf+jL8oXheHO5lI9ijJ4PmQC/FmHC+/3fN1sWC9MgL14ddkJ2fpPxkYellyfaiVW/tl
	tY4p++rSyiULhpzQD2fndc9Nxn98Egg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714392784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ta/xgiOSdujgYrMackSTdmdnjtlcI/U1edyYAhI44nw=;
	b=YdzBQ9nR91L3a8xEkKxAtGDdrD7etwTeKKJAmILTesf7JWrO1gBB8AmUdafI7HcBnXjUVr
	rBSYifoEGomkUBBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37A28139DE;
	Mon, 29 Apr 2024 12:13:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +REoDNCOL2Z2VwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Apr 2024 12:13:04 +0000
Date: Mon, 29 Apr 2024 14:13:16 +0200
Message-ID: <87il00pdsz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: ManuLinares <mbarriolinares@gmail.com>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	dengxiang <dengxiang@nfschina.com>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Max McCarthy <mmccarthy@mcintoshlabs.com>,
	WhaleChang <whalechang@google.com>,
	Lukasz Tyl <ltyl@hem-e.com>,
	Jeremie Knuesel <knuesel@gmail.com>,
	Alexander Tsoy <alexander@tsoy.me>,
	Jussi Laako <jussi@sonarnerd.net>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add sampling rates support for Mbox3
In-Reply-To: <87jzkgpdvm.wl-tiwai@suse.de>
References: <20240428005733.202978-1-mbarriolinares@gmail.com>
	<87jzkgpdvm.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[alsa-project.org,perex.cz,suse.com,nfschina.com,gmail.com,mcintoshlabs.com,google.com,hem-e.com,tsoy.me,sonarnerd.net,vger.kernel.org];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: 27X75ECSF4BV5GDAOAVYUTFZ37D5OZ2O
X-Message-ID-Hash: 27X75ECSF4BV5GDAOAVYUTFZ37D5OZ2O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/27X75ECSF4BV5GDAOAVYUTFZ37D5OZ2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Apr 2024 14:11:41 +0200,
Takashi Iwai wrote:
> 
> On Sun, 28 Apr 2024 02:57:29 +0200,
> ManuLinares wrote:
> > 
> > This adds support for all sample rates supported by the hardware,
> > Digidesign Mbox 3 supports: {44100, 48000, 88200, 96000}
> > 
> > Fixes syncing clock issues that presented as pops. To test this, without
> > this patch playing 440hz tone produces pops.
> > 
> > Clock is now synced between playback and capture interfaces so no more
> > latency drift issue when using pipewire pro-profile.
> > (https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3900)
> > 
> > Signed-off-by: ManuLinares <mbarriolinares@gmail.com>

Also, put a space between Manu and Linares (supposing it's your real
name).  Signed-off-by is a legal requirement, hence it should be
properly spelled.


thanks,

Takashi
