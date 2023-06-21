Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1A9738E4D
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 20:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F06DC209;
	Wed, 21 Jun 2023 20:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F06DC209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687371255;
	bh=7v0OByOnepdlHKHcLm/8pU27xdQsQUMF1mULnfzRAMc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iuufPFWXsHIjQfliL1gRpNEmMf3Ezpi7eOvjn4cz/xZKFe4aCbEsjdF1SOqAdU8Pm
	 m/F6tD0SIc0Pc7Xy/dTpzUlFO5A8MGzDijlFQDaXAA2iLgZX/JmK91f8wxy4lY6Cqf
	 /vXse3zxX6Rlq0wq1AqMrcvIK5VjXbOsWBkK/E8U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D231F80169; Wed, 21 Jun 2023 20:13:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35442F80132;
	Wed, 21 Jun 2023 20:13:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7E67F80141; Wed, 21 Jun 2023 20:13:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2674BF80022
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 20:13:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2674BF80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=eDNTx1+1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=s1FNJWfq
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7188822062;
	Wed, 21 Jun 2023 18:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687371193;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WWsGkOFdRgMs/IpJ7LdFjt5a+LKBC94Ys5RNtTMLywk=;
	b=eDNTx1+11CgvTjukC7PB1T84aQVxT90L5pUASXmsUm/J8Y5/dYFX8hTD4YCL71Qv3YiCmq
	4OiFZVAsDt0Is4O+ffUdg08Jgut9iJdGfnBJnaI/QdBkD1ItkJPmVTgXFquOQqZAoXk8TK
	pWkDXQiXPb4GNHCUGXdPYQwvsv+Cick=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687371193;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WWsGkOFdRgMs/IpJ7LdFjt5a+LKBC94Ys5RNtTMLywk=;
	b=s1FNJWfq86fSVdJ5AIuh37PAEpKHyOcO4mfPfBzOIJ2xeDPxd/4VAxkACp7pcO1U5uvGcP
	EdjrL6R97yxNldBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BC464134B1;
	Wed, 21 Jun 2023 18:13:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cNQoLbg9k2R3bgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 21 Jun 2023 18:13:12 +0000
Date: Wed, 21 Jun 2023 20:13:11 +0200
Message-ID: <87wmzwptu0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: =?ISO-8859-1?Q?=22N=EDcolas_F=2E_R=2E_A=2E=22?= Prado
 <nfraprado@collabora.com>,	Jaroslav Kysela <perex@perex.cz>,
	kernel@collabora.com,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Shuah Khan <shuah@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/alsa: pcm-test: Decrease stream duration
 from 4 to 2 seconds
In-Reply-To: <f5cab2c2-1638-4d19-aff3-d46ed34b857e@sirena.org.uk>
References: <20230620220839.2215057-1-nfraprado@collabora.com>
	<20230620220839.2215057-3-nfraprado@collabora.com>
	<33bea0d3-b8dd-4936-812e-392166df4437@sirena.org.uk>
	<443f697b-fecf-6e8e-0b76-65257aff7da8@perex.cz>
	<9069ad0c-d166-4620-a3de-a36ab233cab0@sirena.org.uk>
	<5c2d5213-5299-44f1-9611-26002c8a5d3a@notapiano>
	<87352krcz5.wl-tiwai@suse.de>
	<f5cab2c2-1638-4d19-aff3-d46ed34b857e@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: PT7ZNNKHQISM3YTQGB4DT3OUIZUMMURC
X-Message-ID-Hash: PT7ZNNKHQISM3YTQGB4DT3OUIZUMMURC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PT7ZNNKHQISM3YTQGB4DT3OUIZUMMURC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Jun 2023 19:08:27 +0200,
Mark Brown wrote:
> 
> On Wed, Jun 21, 2023 at 06:34:22PM +0200, Takashi Iwai wrote:
> 
> > So, we're back to square...  Unless anyone has a strong objection, I'm
> > inclined to take this as a workaround for 6.5 for now, as the merge
> > window deadline is coming.  We can improve things at the same time for
> > the future kernel, too.
> 
> It feels like it might be good to let it cook for a bit longer before
> going to Linus (eg, applying after the merge window) so we've more
> chance to see what the impact is on other boards?

I'm fine with that option, too.  Are most of selftests performed on
linux-next basis, or rather on Linus tree?


Takashi
