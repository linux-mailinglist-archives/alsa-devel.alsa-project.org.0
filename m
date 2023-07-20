Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A0F75A8FD
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 10:20:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 547DB1D9;
	Thu, 20 Jul 2023 10:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 547DB1D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689841200;
	bh=GAD9qsMffDGF8HUiBEXGcLhq3mFbXA4pv0vlVO9m9Ks=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WzhBzPbe8HUO2C4K72uu5WuZy/qWM4367hZSNUavdoXOMeGeZXhf99y0CIeQPRRay
	 EYiKEyl1ncyiveM4kj6WDRCDFQo08L/yr+0WC3/3y+38qfH6bpjNcuDhjM84BBr054
	 o5QTnzDC61Gi1gnhaijqLXRIqjry7gQGgloEpP44=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9488CF8053B; Thu, 20 Jul 2023 10:19:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55C55F8032D;
	Thu, 20 Jul 2023 10:19:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4062EF8047D; Thu, 20 Jul 2023 10:17:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B05BAF8027B
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:16:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B05BAF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=no2erPRn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vpyBnesO
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9E0A922A0A;
	Thu, 20 Jul 2023 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689841014;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z6aB+f3KnSvtyNGeGmqpIZoCPdV2fk1nTvAiDnJb6hU=;
	b=no2erPRnSga8BYVUtvXYJC8Phx1oBphl54Z+PgMypAPC8JqLVD+t85OklH86zRP7ywpYXC
	RKpXu7rflQQZNPaojoEiPpc6AIKsXSxVoG2AXdjNV72PmYwNkBPLLTZkHRIwTQD2H0hHEr
	Qu3K5wmvPF552U52J5ecX/0Aj1Lfw18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689841014;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z6aB+f3KnSvtyNGeGmqpIZoCPdV2fk1nTvAiDnJb6hU=;
	b=vpyBnesO/EHMRVWMHiMvVqzWl5z3bQcwZGZ7rWN6uDo3dzFxrHSQStRv9n40eVT1A5gLsi
	rdtqJB4eXOTteFDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D612138EC;
	Thu, 20 Jul 2023 08:16:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id xNTDFXbtuGT9HwAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 08:16:54 +0000
Date: Thu, 20 Jul 2023 10:16:53 +0200
Message-ID: <87pm4nj8ui.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Alex Elder <elder@kernel.org>,	Claudiu Beznea
 <claudiu.beznea@microchip.com>,	Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,	Johan Hovold <johan@kernel.org>,	Lars-Peter
 Clausen <lars@metafoo.de>,	Mark Brown <broonie@kernel.org>,	Mark Greer
 <mgreer@animalcreek.com>,	Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,	greybus-dev@lists.linaro.org
Subject: Re: [PATCH 00/11] ALSA: Make control API taking controls_rwsem
 consistently
In-Reply-To: <20230718141304.1032-1-tiwai@suse.de>
References: <20230718141304.1032-1-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 6EP46XV433PA6CPOY27YXPXSLTQYDLXN
X-Message-ID-Hash: 6EP46XV433PA6CPOY27YXPXSLTQYDLXN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6EP46XV433PA6CPOY27YXPXSLTQYDLXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Jul 2023 16:12:53 +0200,
Takashi Iwai wrote:
> 
> A few ALSA control API helpers like snd_ctl_rename(), snd_ctl_remove()
> and snd_ctl_find_*() suppose the callers taking card->controls_rwsem.
> But it's error-prone and fragile.  This patch set tries to change
> those API functions to take the card->controls>rwsem internally by
> themselves, so that the drivers don't need to take care of lockings.
> 
> After applying this patch set, only a couple of places still touch
> card->controls_rwsem (which are OK-ish as they need for traversing the
> control linked list).
> 
> 
> Takashi
> 
> ===
> 
> Takashi Iwai (11):
>   ALSA: control: Take card->controls_rwsem in snd_ctl_rename()
>   staging: greybus: audio_helper: Use snd_ctl_remove_id()
>   ASoC: atmel: mchp-pdmc: Use snd_ctl_remove_id()
>   ALSA: control: Take controls_rwsem lock in snd_ctl_remove()
>   ALSA: control: Add lockdep warning to internal functions
>   ASoC: sigmadsp: Simplify with snd_ctl_activate_id()
>   staging: greybus: Avoid abusing controls_rwsem
>   ALSA: control: Make snd_ctl_find_id() argument const
>   ALSA: control: Introduce unlocked version for snd_ctl_find_*() helpers
>   ALSA: control: Take lock in snd_ctl_find_id() and snd_ctl_find_numid()
>   ALSA: emu10k1: Go back and simplify with snd_ctl_find_id()

Now all merged.  The branch is based on 6.5-rc2, and tagged as
ctl-lock-fixes-6.6 so that other branch can merge this if needed.


Takashi
