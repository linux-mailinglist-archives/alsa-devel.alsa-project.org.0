Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4969778893
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 09:52:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0148F823;
	Fri, 11 Aug 2023 09:51:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0148F823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691740327;
	bh=HULB5mvAlNfv+1IZG16A7/ibOU2smpXR9ZUQF1OZ0NQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HheH+UnpDVj0JG08jjbdUXrcRQiw+bW7jYxS4or+uta7IOxU1b3v54tBZB35+xMrO
	 Ck3q+WLV/4Ztzw5raEB4zWprQEu8OEHDPTCAv+wFyLcK8PtmIO/nW8rdWDXZehJvd8
	 +prxDAgVjRIt1NNsSEBDY+FaGc0s9STGVCgNKFJs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B356BF80551; Fri, 11 Aug 2023 09:51:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F3F3F80134;
	Fri, 11 Aug 2023 09:51:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3C13F80166; Fri, 11 Aug 2023 09:51:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F291CF80016
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 09:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F291CF80016
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=arDe6Cnh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4fcQ7sz9
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E03701F889;
	Fri, 11 Aug 2023 07:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691740268;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IH4n2dTwX9P5BDX5k2etUFyexS4HT0DD+VQEkN1+VK8=;
	b=arDe6Cnhoz2XvGokgTZtYkhQ5dsCuoS15hCdR5CLW9N6kOMh0Kaubf2jRxPnqyEVx98veM
	xeGEorRuewS/3qNLUDkLRyriRndMTZyjZqIGhqU03cosoTiEeC2HmKSAqS22Kf5gaBovuR
	gmCfpQgJHY0dTA/XvWrJWOGX37z5oow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691740268;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IH4n2dTwX9P5BDX5k2etUFyexS4HT0DD+VQEkN1+VK8=;
	b=4fcQ7sz9WQH36lsDNfLs7zWSLzsJT6F4GZtSNiFd+j5GfHL9Zend9sEzvqKiju/Sj7p83j
	uOR5EcXJrq+JGVBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7F7B4138E2;
	Fri, 11 Aug 2023 07:51:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GiIxHmzo1WSXbwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 11 Aug 2023 07:51:08 +0000
Date: Fri, 11 Aug 2023 09:51:08 +0200
Message-ID: <87jzu2rp8z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Cc: <perex@perex.cz>,
	<tiwai@suse.com>,
	<claudiu.beznea@tuxon.dev>,
	<lgirdwood@gmail.com>,
	<broonie@kernel.org>,
	<nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>,
	<peda@axentia.se>,
	<lars@metafoo.de>,
	<nuno.sa@analog.com>,
	<povik+lin@cutebit.org>,
	<wens@csie.org>,
	<jernej.skrabec@gmail.com>,
	<samuel@sholland.org>,
	<robh@kernel.org>,
	<u.kleine-koenig@pengutronix.de>,
	<alsa-devel@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<asahi@lists.linux.dev>,
	<linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH -next 0/5] sound: Remove redundant of_match_ptr() macro
In-Reply-To: <20230811071426.2343133-1-ruanjinjie@huawei.com>
References: <20230811071426.2343133-1-ruanjinjie@huawei.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: YPQOWGJ5RXBPKV4ZLGEJPH4EV2HKYN4F
X-Message-ID-Hash: YPQOWGJ5RXBPKV4ZLGEJPH4EV2HKYN4F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YPQOWGJ5RXBPKV4ZLGEJPH4EV2HKYN4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 11 Aug 2023 09:14:21 +0200,
Ruan Jinjie wrote:
> 
> Since these sound drivers depend on CONFIG_OF, there is
> no need to wrap the macro of_match_ptr() here.
> 
> Ruan Jinjie (5):
>   ASoC: atmel: Remove redundant of_match_ptr()
>   ASoC: atmel: tse850-pcm5142: Remove redundant of_match_ptr()
>   ASoC: sunxi: sun4i-spdif: Remove redundant of_match_ptr()
>   ASoC: ssm3515: Remove redundant of_match_ptr()
>   ALSA: Remove redundant of_match_ptr()

Judging from the proportion, I guess those go through ASoC tree?


Takashi
