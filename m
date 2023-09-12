Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C588579CE9F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 12:44:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90F6AE7C;
	Tue, 12 Sep 2023 12:43:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90F6AE7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694515452;
	bh=PrWDsyZ52uL0PYv7C+TfjgsdUOHr9kkIJIouSspzcsE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iXQHkCfvwiTH1PudOr8mDIDuCTvgmN8FORWWuqP2l4S3SHZl5FUa+ZWJQnOhWrAzd
	 HyUS8YBHRIb7sLEfDiBJT+iipwhtB2EIgp54YOHAvX5L40GJn9I6ECrUNHLnSEliMC
	 QbR3l+FwOdikCGtr0mtzDlsShyO+BzEcoFC6TteM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90FB9F80212; Tue, 12 Sep 2023 12:43:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACF17F80246;
	Tue, 12 Sep 2023 12:43:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B4A7F80425; Tue, 12 Sep 2023 12:43:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AC49F800AA
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 12:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AC49F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MvQSgm0k;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=M4LqoX+d
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 78AEB212AE;
	Tue, 12 Sep 2023 10:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694515352;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/5wrFpvn+Sn3FLRgspQobsMn/iApsHJiZE1ii4FaPxk=;
	b=MvQSgm0kaxtWFRRmzM5zkkxDCXVpgCRBRlRhZ3+1NYv1TUuyF4y/1P47gIBi9uBh+Mmmpt
	VQOQ1eYLe7/NKHVYS2u5Uh06YjCGPcMLNYEduG5NNqVGCyT2YHxoVxrvW+WhAKRJDKe2KO
	xXubEm5yutZGpCWIN7EOnpXoUv/xRjw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694515352;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/5wrFpvn+Sn3FLRgspQobsMn/iApsHJiZE1ii4FaPxk=;
	b=M4LqoX+dAZv9RRJ/UE16syo5NqxE6RilgKmrJNFek5MrztBtyd/Vpmp1tgKV1YO8ChdbWe
	CGEo9HFWKzcOwMBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3940613A39;
	Tue, 12 Sep 2023 10:42:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id l68DDZhAAGXeXAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 12 Sep 2023 10:42:32 +0000
Date: Tue, 12 Sep 2023 12:42:31 +0200
Message-ID: <87cyyn7jvs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Peter Ujfalusi" <peter.ujfalusi@linux.intel.com>,
	tiwai@suse.com,
	"Jaroslav Kysela" <perex@perex.cz>,
	"Masahiro Yamada" <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: core: Increase the name array size for debugfs
 directory name
In-Reply-To: <96c5309d-bb06-486e-a1f8-e3d71b275f13@app.fastmail.com>
References: <20230912083910.15994-1-peter.ujfalusi@linux.intel.com>
	<96c5309d-bb06-486e-a1f8-e3d71b275f13@app.fastmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: VZQA3X5F55HWUIZ5N2XURXBNTR3PHTJ6
X-Message-ID-Hash: VZQA3X5F55HWUIZ5N2XURXBNTR3PHTJ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VZQA3X5F55HWUIZ5N2XURXBNTR3PHTJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 12 Sep 2023 12:18:04 +0200,
Arnd Bergmann wrote:
> 
> On Tue, Sep 12, 2023, at 10:39, Peter Ujfalusi wrote:
> 
> > While the code is correct, we need to silence the compiler somehow.
> > It could be done by limiting the range in sprintf like
> > sprintf(name, "card%d", idx % SNDRV_CARDS);
> > sprintf(name, "card%hhd", idx);
> > etc
> >
> > These are too workaroundish. Increase the name array to 15 instead which
> > looks better and only adds 7 bytes on stack.
> 
> It looks like we use the same string for kobject_set_name(), so
> maybe this would work as well:
> 
> --- a/sound/core/init.c
> +++ b/sound/core/init.c
> @@ -278,9 +278,6 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
>                          size_t extra_size)
>  {
>         int err;
> -#ifdef CONFIG_SND_DEBUG
> -       char name[8];
> -#endif
>  
>         if (extra_size > 0)
>                 card->private_data = (char *)card + sizeof(struct snd_card);
> @@ -364,8 +361,8 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
>         }
>  
>  #ifdef CONFIG_SND_DEBUG
> -       sprintf(name, "card%d", idx);
> -       card->debugfs_root = debugfs_create_dir(name, sound_debugfs_root);
> +       card->debugfs_root = debugfs_create_dir(kobject_name(&card->card_dev.kobj),
> +                                               sound_debugfs_root);

The idea looks neat, but I suppose it's better with
dev_name(&card->card_dev) instead?


thanks,

Takashi
