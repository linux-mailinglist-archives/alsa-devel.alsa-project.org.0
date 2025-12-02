Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFB7C9A643
	for <lists+alsa-devel@lfdr.de>; Tue, 02 Dec 2025 08:08:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 085A6601FE;
	Tue,  2 Dec 2025 08:07:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 085A6601FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764659282;
	bh=zObIYAJwTfufWwzNxvxH04725uAzlpjIUr/OQbXbhOE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RrVbmUDR6jRGjFhNZ9FWQcEa/E5vvsyFfzuEERv79+Fng58YE8/lBZ4F95Jx/nifS
	 UQ3air4NtzpiNycPjqigSHdWc5Cq/atRy0HR30jjvf+fSzWgtkbdM9160ei8vm2hi+
	 4A5QNzi63M7rPOoOk6UOhvu2/yi2r9he+HJaJfJA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76A5FF805C6; Tue,  2 Dec 2025 08:07:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 117CFF805C6;
	Tue,  2 Dec 2025 08:07:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AC7AF80246; Tue,  2 Dec 2025 08:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B95A1F800F3
	for <alsa-devel@alsa-project.org>; Tue,  2 Dec 2025 08:06:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B95A1F800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=cZrDciBx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=F6MXHIvH;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=xmnpSE4/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CB2C9xr4
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 810ED33686;
	Tue,  2 Dec 2025 07:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1764659196;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8qxUNRhvt3yFx3dB/J8xGQY9R78a4/57OSI4JYBqtiQ=;
	b=cZrDciBxYaswnNHhTaX2C1RKlPGS028GgEShbfTFeo9eOXv1isuwOPx0EDu779iYkyXezt
	Sa1IHTQmtD4cLObfBhtycUha3Jl5o9QlnTBbwcXp8eYZZ/LuGxPXaeVSdDV4UZ5+Ny+GvZ
	BSPiwgVFUQcrbmF7YKza8D/5cHqYCTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764659196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8qxUNRhvt3yFx3dB/J8xGQY9R78a4/57OSI4JYBqtiQ=;
	b=F6MXHIvHUGzBZ6eowrmWDGOrOh/rfBLF0yDZS9nEJitCGR4XXD3WQhaadvhQNabkdmuUMQ
	a/7GvfTAbfeMJnBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1764659195;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8qxUNRhvt3yFx3dB/J8xGQY9R78a4/57OSI4JYBqtiQ=;
	b=xmnpSE4/dZFKL6H1eF63bZ4c08hsyccH2R1+THLxzYuDe8qEvcs/1LooF7m6hQ4YZkN3GB
	HIykAsd8y142e7N27QpNaavsGiTs/XmHtWhOU+nskquOprBlOgfjuZ/i5vbrVZ2zxgZiT1
	L9GSCPXhyKWlngIWdh0q/yepyoIH73U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764659195;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8qxUNRhvt3yFx3dB/J8xGQY9R78a4/57OSI4JYBqtiQ=;
	b=CB2C9xr41tjDVepVLhKFqoeW6jZVRVDYOVn0V94Fwma8+EUqEkRPaTWhV66T1neUnJuoIE
	4ZgPz6xIL22CdFBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D9493EA63;
	Tue,  2 Dec 2025 07:06:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8HRQEfuPLmnmXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Dec 2025 07:06:35 +0000
Date: Tue, 02 Dec 2025 08:06:34 +0100
Message-ID: <87v7ip5pmt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.19
In-Reply-To: <fd193c0585cf7316a3b13eda44196a30@kernel.org>
References: <fd193c0585cf7316a3b13eda44196a30@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: RSB3SDHVYQ6TUCC2Z2FFE5MWKHEY7ELN
X-Message-ID-Hash: RSB3SDHVYQ6TUCC2Z2FFE5MWKHEY7ELN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RSB3SDHVYQ6TUCC2Z2FFE5MWKHEY7ELN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Dec 2025 21:16:35 +0100,
Mark Brown wrote:
> 
> The following changes since commit ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d:
> 
>   Linux 6.18-rc7 (2025-11-23 14:53:16 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.19
> 
> for you to fetch changes up to c5fae31f60a91dbe884ef2789fb3440bb4cddf05:
> 
>   ASoC: fsl_micfil: Set default quality and channel (2025-11-29 00:59:00 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.19
> 
> This is a very large set of updates, as well as some more extensive
> cleanup work from Morimto-san we've also added a generic SCDA class
> driver for SoundWire devices enabling us to support many chips with
> no custom code.  There's also a batch of new drivers added for both
> SoCs and CODECs.
> 
>  - Added a SoundWire SCDA generic class driver, pulling in a little
>    regmap work to support it.
>  - A *lot* of cleaup and API improvement work from Morimoto-san.
>  - Lots of work on the existing Cirrus, Intel, Maxim and Qualcomm
>    drivers.
>  - Support for Allwinner A523, Mediatek MT8189, Qualcomm QCM2290,
>    QRB2210 and SM6115, SpacemiT K1, and TI TAS2568, TAS5802, TAS5806,
>    TAS5815, TAS5828 and TAS5830.
> 
> This also pulls in some gpiolib changes supporting shared GPIOs in the
> core there so we can convert some of the ASoC drivers open coding
> handling of that to the core functionality.

Pulled now.  Thanks.


Takashi
