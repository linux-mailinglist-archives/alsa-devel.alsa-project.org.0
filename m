Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7288751B82
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 10:28:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30570206;
	Thu, 13 Jul 2023 10:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30570206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689236927;
	bh=wZ7a+1kjiu+omsp3Q9jmC1UzzZI0/9kK1dNa0Je+DvU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uSVzmktS+Gk0taC8It1YekmoUKz+TbddMQJTxehmUS5I8qjT1i5vwEKCZ7TLHaLUw
	 udgonEPE0DEGnA9t5NttyAqueAfb2MrU9w2Oo++BtUMK2ktiXB9Fnw2pbkUN1XmifB
	 y3IiNytVhBaVmgcatCRXmq0POm4d73abzqJW/GX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D89EEF8027B; Thu, 13 Jul 2023 10:27:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EB3EF80236;
	Thu, 13 Jul 2023 10:27:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01B21F80249; Thu, 13 Jul 2023 10:27:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3992EF800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 10:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3992EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rYBURrUe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ncOMMWRx
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8D3B81F855;
	Thu, 13 Jul 2023 08:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689236869;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uRaF5DVLN14FBTZ62FSYitRhyp/yaYF9z7DTYpRDX38=;
	b=rYBURrUe1XCK4R9NkLlr4cZMb4O9/B0Csz6quF9CxyFDOGM30a6HuH273tL2D9WfTOtBPT
	ttgUccRgdR/AHddN3bqOeMrXzXjUzieuRIG2x55ENxsiq0swzSmtWua7JHaoOrji3mrAK/
	oo/SnlDGOIJLO5jpspHabxYiK//Rk70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689236869;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uRaF5DVLN14FBTZ62FSYitRhyp/yaYF9z7DTYpRDX38=;
	b=ncOMMWRxMxM/SSAEXU6A6RRh//4jS50dvTKC3dCLUhNTBihrWAlNCgGg4LdvL6coB0d6H7
	Kd/4zE1hZp/uteCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6A481133D6;
	Thu, 13 Jul 2023 08:27:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id STYQGYW1r2QmLgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 13 Jul 2023 08:27:49 +0000
Date: Thu, 13 Jul 2023 10:27:48 +0200
Message-ID: <87mt00fc6z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 2/3] ALSA: emu10k1: remove superfluous IRQ enable state
 saving
In-Reply-To: <ZK+ymU7ynF0eRy8R@ugly>
References: <20230712145750.125086-1-oswald.buddenhagen@gmx.de>
	<20230712145750.125086-2-oswald.buddenhagen@gmx.de>
	<875y6ogxt8.wl-tiwai@suse.de>
	<ZK+ymU7ynF0eRy8R@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 2SSLQ3XXQBGNTZY7ZJX3CKEPQSMY2UXF
X-Message-ID-Hash: 2SSLQ3XXQBGNTZY7ZJX3CKEPQSMY2UXF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SSLQ3XXQBGNTZY7ZJX3CKEPQSMY2UXF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jul 2023 10:15:21 +0200,
Oswald Buddenhagen wrote:
> 
> On Thu, Jul 13, 2023 at 07:55:31AM +0200, Takashi Iwai wrote:
> > On Wed, 12 Jul 2023 16:57:49 +0200,
> > Oswald Buddenhagen wrote:
> >> 
> >> The mixer, PCM prepare, MIDI, synth driver, and procfs callbacks are all
> >> always invoked with IRQs enabled, so there is no point in saving the
> >> state.
> >> 
> >> snd_emu1010_load_firmware_entry() is called from emu1010_firmware_work()
> >> and snd_emu10k1_emu1010_init(); the latter from snd_emu10k1_create() and
> >> snd_emu10k1_resume(), all of which have IRQs enabled.
> >> 
> >> The voice and memory functions are called from mixed contexts, so they
> >> keep the state saving.
> >> 
> >> The low-level functions all keep the state saving, because it's not
> >> feasible to keep track of what is called where.
> >> 
> > Wouldn't it make more sense if you replace it with a mutex?
> > It'll become more obvious that it's only for non-IRQ context, too.
> > 
> huh?
> at least some of the ~six different locks touched by this patch
> absolutely _are_ used in irq context. this patch is concerned only
> about the specific call sites, where we know that local irqs are
> enabled, so we can unconditionally re-enable them rather than
> restoring the old state (the latter being a much more expensive
> operation). the code already contains precedents for this, and the
> complementary optimization of not disabling/restoring irqs where we
> know that they are already disabled.
> 
> the reg_lock would be convertible to a mixer_mutex in most mixer
> callbacks, but that is an orthogonal question, which is raised in the
> next commit.

Ah, sorry, I misread as if it were dropping the whole *_irq.
Then the patch should be fine.


Takashi
