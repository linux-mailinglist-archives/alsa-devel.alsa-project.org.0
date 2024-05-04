Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 787478BB9F8
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2024 10:13:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF118DEC;
	Sat,  4 May 2024 10:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF118DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714810412;
	bh=0hCEqZkQCaNOTmBz4GIo4hUWSZWinRrt3PGUXnoS1+o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CYRv1Ll8uuiSqtPu6vzGn8sAPB+wMm98LzzvFhKenei2h1Hu7lh39Dj9qRR2sgOzV
	 2zSUOvzn/beIXPcyOV4iTGM+nIJzc3HJorG14Stki/1WLdscuh0Cu9VZizJtKf/OdO
	 gV2Eno6xQ95+Bo964kk99JUs+hiL+XDnMPg8duO4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75198F805AE; Sat,  4 May 2024 10:12:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58AD5F8028D;
	Sat,  4 May 2024 10:12:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E3DFF80266; Sat,  4 May 2024 10:08:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D869F8023A
	for <alsa-devel@alsa-project.org>; Sat,  4 May 2024 10:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D869F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ticBPfxu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HO96QoYS;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ticBPfxu;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HO96QoYS
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0D0CF34270;
	Sat,  4 May 2024 08:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714810105;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OXpA3ThLOYoWjLP+Ess0XcrkiazJdwL2bihk4FANmH4=;
	b=ticBPfxux8E6ZoCtKtgyqlWC8TA8h+PiF27+kAJT8ANH1rTIX/c4k0QkrIHp0oNW5SdoEi
	4LsN/DR2FGzWAtgZUXUFSHPSxnWZ27kTfCkeetAWECoPk7rMXmRD6oXjQIAsbQHUDQZFmu
	nmfYSoZXl1O29kfzrA9q8szoR9G/Oc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714810105;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OXpA3ThLOYoWjLP+Ess0XcrkiazJdwL2bihk4FANmH4=;
	b=HO96QoYShWT6eB8tv4I7LY+0mBWXjie8KE5Bm8m9keb5J40YQuYKtOMRwLmupYZpYiY9uR
	9/p7/jfV9MUMJpDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ticBPfxu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HO96QoYS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1714810105;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OXpA3ThLOYoWjLP+Ess0XcrkiazJdwL2bihk4FANmH4=;
	b=ticBPfxux8E6ZoCtKtgyqlWC8TA8h+PiF27+kAJT8ANH1rTIX/c4k0QkrIHp0oNW5SdoEi
	4LsN/DR2FGzWAtgZUXUFSHPSxnWZ27kTfCkeetAWECoPk7rMXmRD6oXjQIAsbQHUDQZFmu
	nmfYSoZXl1O29kfzrA9q8szoR9G/Oc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714810105;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OXpA3ThLOYoWjLP+Ess0XcrkiazJdwL2bihk4FANmH4=;
	b=HO96QoYShWT6eB8tv4I7LY+0mBWXjie8KE5Bm8m9keb5J40YQuYKtOMRwLmupYZpYiY9uR
	9/p7/jfV9MUMJpDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A1251386E;
	Sat,  4 May 2024 08:08:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c1AZJPjsNWZxKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 04 May 2024 08:08:24 +0000
Date: Sat, 04 May 2024 10:08:38 +0200
Message-ID: <871q6i9eyh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<pierre-louis.bossart@linux.intel.com>,
	<13916275206@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@intel.com>,
	<bard.liao@intel.com>,
	<yung-chuan.liao@linux.intel.com>,
	<kevin-lu@ti.com>,
	<cameron.berkenpas@gmail.com>,
	<baojun.xu@ti.com>,
	<soyer@irl.hu>,
	<Baojun.Xu@fpt.com>
Subject: Re: [PATCH v1] ALSA: ASoc/tas2781: Fix an issue reported by robot
 kernel test
In-Reply-To: <20240504004704.1738-1-shenghao-ding@ti.com>
References: <20240504004704.1738-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com,perex.cz,139.com,alsa-project.org,vger.kernel.org,intel.com,ti.com,irl.hu,fpt.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,intel.com:email]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0D0CF34270
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: RAGUCQLXSMHNDTIGKSYG6E2P4RDSBEPB
X-Message-ID-Hash: RAGUCQLXSMHNDTIGKSYG6E2P4RDSBEPB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RAGUCQLXSMHNDTIGKSYG6E2P4RDSBEPB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 04 May 2024 02:47:03 +0200,
Shenghao Ding wrote:
> 
> Fix an issue reported by robot kernel test and two harmless changes.

You need to describe more what was actually an issue reported by robot
kernel test here.  Otherwise it's nothing but a voodoo magic.

Also enumerate two harmless changes, too: it's an update of copyright
year and a correction of the comments.

Last but not least, the subject suffix should be "ASoC: tas2781: ..."
(not "ASoc", and without "ALSA:")


thanks,

Takashi

> 
> Fixes: ef3bcde75d06 ("ASoc: tas2781: Add tas2781 driver")
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> ---
> v1:
>  - Changed the copyright year to 2024
>  - tasdevice-fmw.c --> tas2781-fmwlib.c
>  - | Reported-by: kernel test robot <lkp@intel.com>
>    | Closes: https://lore.kernel.org/oe-kbuild-all/202405021200.YHInjV43-lkp@intel.com/
> ---
>  sound/soc/codecs/tas2781-fmwlib.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
> index 45760fe19523..a6be81adcb83 100644
> --- a/sound/soc/codecs/tas2781-fmwlib.c
> +++ b/sound/soc/codecs/tas2781-fmwlib.c
> @@ -1,8 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  //
> -// tasdevice-fmw.c -- TASDEVICE firmware support
> +// tas2781-fmwlib.c -- TASDEVICE firmware support
>  //
> -// Copyright 2023 Texas Instruments, Inc.
> +// Copyright 2023 - 2024 Texas Instruments, Inc.
>  //
>  // Author: Shenghao Ding <shenghao-ding@ti.com>
>  
> @@ -1878,7 +1878,7 @@ int tas2781_load_calibration(void *context, char *file_name,
>  {
>  	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *)context;
>  	struct tasdevice *tasdev = &(tas_priv->tasdevice[i]);
> -	const struct firmware *fw_entry;
> +	const struct firmware *fw_entry = NULL;
>  	struct tasdevice_fw *tas_fmw;
>  	struct firmware fmw;
>  	int offset = 0;
> -- 
> 2.34.1
> 
