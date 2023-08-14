Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B7877BBCF
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 16:36:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EC1C74C;
	Mon, 14 Aug 2023 16:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EC1C74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692023808;
	bh=WJJZ5q1qz2smISX6cc6pjEmb9Ri2n0JxUS1RpVzF4cM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f2a/OungVQ30SePCu7df8grlK5n1F+zhnKjkYszP/6ptOKlH7GO0fs4jkVpNUToj3
	 ZJvP57UtvyBDhOpqe2n8g48GB0ZLrQfaav3pjADC3CF7E/dSRnMUFhcKrhF3c1x+8R
	 YD6/7e7+9pJC7EhXXLk/MnKBNl/OHJMj89LN5R/I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB55DF80551; Mon, 14 Aug 2023 16:35:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0B17F80254;
	Mon, 14 Aug 2023 16:35:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58ADEF8025F; Mon, 14 Aug 2023 16:35:53 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C9FA5F800EE
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 16:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9FA5F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=cfmh2tNc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EIoW2W7f
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1316321984;
	Mon, 14 Aug 2023 14:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692023749;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oI2tUdOC4luzSaN047qWHM6uupPC0FYciH10Bmvsy4I=;
	b=cfmh2tNcRDEh4NBweMef8VYBWpHBxE/Q3+6vGegvIyyLMgicYOSsvsA8vGbVHaectKhpJ1
	HcRPPOrarocx+XVyBtcpRLLaF4mbQxSCVlI+iwStT0VlzbhRr2b1UHLw3ZRChZUS9QE10l
	fKBHJkdyG3JS/2rI7WIXCsjsR/araqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692023749;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oI2tUdOC4luzSaN047qWHM6uupPC0FYciH10Bmvsy4I=;
	b=EIoW2W7fpytGWXydnfdlNJ2MSzUCOBfquBhxliP/+6qio69UKFhtg0scG8e+AzSgs3+HIe
	HL/PiQNw0fWndJAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D0CFE138EE;
	Mon, 14 Aug 2023 14:35:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id d8H2McQ72mSvfQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 14:35:48 +0000
Date: Mon, 14 Aug 2023 16:35:48 +0200
Message-ID: <87fs4l1ykb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
In-Reply-To: <20230811164853.1797547-2-cezary.rojewski@intel.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
	<20230811164853.1797547-2-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: ILNKS24NAYGADZOBAEOXIIFL3ETOXHZF
X-Message-ID-Hash: ILNKS24NAYGADZOBAEOXIIFL3ETOXHZF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ILNKS24NAYGADZOBAEOXIIFL3ETOXHZF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 11 Aug 2023 18:48:37 +0200,
Cezary Rojewski wrote:
> 
> --- a/sound/core/pcm_lib.c
> +++ b/sound/core/pcm_lib.c
> @@ -1706,6 +1706,36 @@ int snd_pcm_hw_param_last(struct snd_pcm_substream *pcm,
>  }
>  EXPORT_SYMBOL(snd_pcm_hw_param_last);
>  
> +/**
> + * params_bps - Get the number of bits per the sample.
> + * @p: hardware parameters
> + *
> + * Return: The number of bits per sample based on the format,
> + * subformat and msbits the specified hw params has.
> + */
> +int params_bps(const struct snd_pcm_hw_params *p)

It's a too generic name.  Please put the suffix like snd_xxx_.

There are a few params_xxx() in the current tree, but those are rather
macros, and left so just for laziness to convert every piece.  You
don't need to follow that pattern.


thanks,

Takashi
