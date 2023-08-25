Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3975D788544
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 12:58:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 077D583E;
	Fri, 25 Aug 2023 12:57:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 077D583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692961105;
	bh=SfVEzTAFC9BbLocRQneQMvgRG+3yzgc4otE+UQKadZg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=INf6HsDLAWIYhLqXLABn7kGTIifq+oIRB7ca88EYgfYm/EqNu4VKFKndognB94K4G
	 BoE0ZC63eLQWjcaJ9/DJ5ixVksizsgLfZVrJMx+HgDjLapRoDT77DEnbaRyv8XOaGG
	 4u0K2vc4/l1kLRVmK8qJlO39nAIUQt+f+WZkCtsQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 770A6F804DA; Fri, 25 Aug 2023 12:57:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09040F800D1;
	Fri, 25 Aug 2023 12:57:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ECECF800F5; Fri, 25 Aug 2023 12:57:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC6D4F80074
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 12:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC6D4F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=U4G7Q9NC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=yKF+Qsty
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CA53C21F99;
	Fri, 25 Aug 2023 10:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692961044;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DctZkjtZCnROfTrc9EuMtJwS4YdieKQ1klE+OFAG1XQ=;
	b=U4G7Q9NCjGwRqBhan3Glmfs8DRUzf/YeLYrDKhLXQvyzOKnB1moWoTQTYiVnZ/ykpj2Vyy
	IwkwkVYKiXSY+5k726IUeI4d3+Y6mCDfLdyM8bBv7MzxWKPXxO2ypH+XpER/yCtS/o5pgn
	+8CB2hbV1LBW6MsFPBzlwpjkd67zTas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692961044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DctZkjtZCnROfTrc9EuMtJwS4YdieKQ1klE+OFAG1XQ=;
	b=yKF+QstyIrTaBGOi5nuBCRq4TpCZgNO3LMAy2aZjIGZuDUFuZ94JQwoWGNtMQV48XYl0mN
	cE1HkPjANGcLPyDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 324DD1340A;
	Fri, 25 Aug 2023 10:57:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id DN1fCxSJ6GQxLgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 25 Aug 2023 10:57:24 +0000
Date: Fri, 25 Aug 2023 12:57:23 +0200
Message-ID: <87ledz75kc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: cujomalainey@chromium.org
Cc: alsa-devel@alsa-project.org,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,	Liam Girdwood
 <liam.r.girdwood@linux.intel.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Mark Brown <broonie@kernel.org>,	Dan
 Carpenter <error27@gmail.com>,	"Maciej S. Szmigiero"
 <maciej.szmigiero@oracle.com>,	Clement Lecigne <clecigne@google.com>,
	Min-Hua Chen <minhuadotchen@gmail.com>,	Ivan Orlov
 <ivan.orlov0322@gmail.com>,	Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,	Thierry Reding <treding@nvidia.com>,	Geoff
 Levand <geoff@infradead.org>,	Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>,	Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 2/2] ALSA: core: split control primitives out of snd_card
In-Reply-To: <20230824210339.1126993-3-cujomalainey@chromium.org>
References: <20230824210339.1126993-1-cujomalainey@chromium.org>
	<20230824210339.1126993-3-cujomalainey@chromium.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: MB23CQNTUJCDUACXIXM7CNKUYP7MKAVY
X-Message-ID-Hash: MB23CQNTUJCDUACXIXM7CNKUYP7MKAVY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MB23CQNTUJCDUACXIXM7CNKUYP7MKAVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 24 Aug 2023 23:02:53 +0200,
cujomalainey@chromium.org wrote:
> 
> +struct snd_control
> +{

The open brace should be at the line above.

> +	struct device dev;		/* control device */
> +	struct rw_semaphore controls_rwsem;	/* controls lock (list and values) */
> +	rwlock_t files_rwlock;	/* ctl_files list lock */
> +	int controls_count;		/* count of all controls */
> +	size_t user_ctl_alloc_size;	// current memory allocation by user controls.

Better to have the same comment style if we move the whole stuff.

> +int snd_control_new(struct snd_card *card)
....
> +{
> +	struct snd_control *ctl = kzalloc(sizeof(*ctl), GFP_KERNEL);
> +	int err;
> +
> +	if (snd_BUG_ON(!card))
> +		return -EINVAL;

This may leak the memory allocated in the above.

> +	/* the control interface cannot be accessed from the user space until */
> +	/* snd_cards_bitmask and snd_cards are set with snd_card_register */
> +	err = snd_ctl_create(card);
> +	if (err < 0) {
> +		dev_err(card->dev, "unable to register control minors\n");
> +		kfree(ctl);
> +		return err;

This needs a more care.  snd_ctl_create() calls put_device() when
snd_device_new() fails, and this already does kfree().  OTOH, the
error path before that point doesn't release the object.

> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL(snd_control_new);

This is never called from the driver but only from snd_card_new() &
co, so no need to export.


thanks,

Takashi
