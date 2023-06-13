Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 347DB72DE7D
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 11:58:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EB6F826;
	Tue, 13 Jun 2023 11:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EB6F826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686650301;
	bh=sMM2EMyIGR+cSZ3WZTrPqA5i/ENjDlH1qXuyZ54OqWQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OS6m/SPsYwZ9XIMji+veVh8ab9eIjrrVYcNZQxspszxy5t+a4ZfXkAn7+llCk4JUP
	 ZLUYX6tGDemyvU25Ix2SJVXwNiVk0MuguA7mqvZHGE9PXO1v9i6VSNT1j+jivGKPcl
	 E+iVi9MMvtfaGz8e/tkvOBYSmLzp5BjpJV7rs9Ok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F5D0F80301; Tue, 13 Jun 2023 11:57:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3EF3F80132;
	Tue, 13 Jun 2023 11:57:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CD15F80149; Tue, 13 Jun 2023 11:57:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25F31F80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 11:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25F31F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TYxQMUNO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tddclAA6
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0AC8622650;
	Tue, 13 Jun 2023 09:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686650245;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ddtss2JKtl8IdHSH+rTT1DDkc07hiGaVvLqlIGQL+NA=;
	b=TYxQMUNOyu+CXp3C2deWEA5RIcdfXFijfwv05YS8eVNDrZ3JJZTLIIppPOxhRCDKZRwzah
	+KGm0rovRH7bex2a9RqO0KhjWmHvCoRuvBzgl6HoEoA+nHfyEt3NKx3hicJ5lZ9wAtSUkh
	gcsYCH45gVSxpCXMBcrVTHWPpKZFJ5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686650245;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ddtss2JKtl8IdHSH+rTT1DDkc07hiGaVvLqlIGQL+NA=;
	b=tddclAA671VUEVuDPoq2DQdxikQPY7Jw4OLN3FshmFuS/u9BIg5tD0WvfTogA4qV3HDfGv
	nTDwZkoWp4HD8FDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C324613345;
	Tue, 13 Jun 2023 09:57:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id d0SNLoQ9iGTBYwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 13 Jun 2023 09:57:24 +0000
Date: Tue, 13 Jun 2023 11:57:24 +0200
Message-ID: <87legnelbv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Thierry Reding" <thierry.reding@gmail.com>,
	Sameer Pujar <spujar@nvidia.com>,
	<alsa-devel@alsa-project.org>,
	<linux-tegra@vger.kernel.org>,
	"Oswald Buddenhagen" <oswald.buddenhagen@gmx.de>
Subject: Re: [PATCH] ASoC: tegra: Fix Master Volume Control
In-Reply-To: <87mt13elff.wl-tiwai@suse.de>
References: <20230613093453.13927-1-jonathanh@nvidia.com>
	<87mt13elff.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 5DGIHXZ34F5D5M44MCSVCHHSH6A2O4VL
X-Message-ID-Hash: 5DGIHXZ34F5D5M44MCSVCHHSH6A2O4VL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5DGIHXZ34F5D5M44MCSVCHHSH6A2O4VL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 11:55:16 +0200,
Takashi Iwai wrote:
> 
> On Tue, 13 Jun 2023 11:34:53 +0200,
> Jon Hunter wrote:
> > 
> > Commit 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations") corrected
> > the PCM wait_time calculations and in doing so reduced the calculated
> > wait_time. This exposed an issue with the Tegra Master Volume Control
> > (MVC) device where the reduced wait_time caused the MVC to fail. For now
> > fix this by setting the default wait_time for Tegra to be 500ms.
> > 
> > Fixes: 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations")
> > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> 
> Hm, it's still not clear why it fails.  The commit above changes the
> timeout of wait_for_avail() to the full-buffer + 10% margin.  In
> thoery, the loop should abort after the full buffer read, and that
> must be enough.  If there were a large FIFO behind, it might be
> overflow, but the fifo_size of Tegra driver seems 4, so it's
> negligible.
> 
> If extending the timeout "fixes" the problem, it might indicate that
> the period update IRQ is triggered too late.  Could you measure the
> timing of each snd_pcm_period_elapsed() and wait_for_avail() call?

OTOH, it's already at a pretty late stage for 6.4, and we need an
urgent regression fix.  So it's better to paper over it now, while
hunting further for the real culprit.


Takashi
