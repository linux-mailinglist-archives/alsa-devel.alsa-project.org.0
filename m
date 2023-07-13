Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF84775186B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 07:59:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19D05207;
	Thu, 13 Jul 2023 07:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19D05207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689227951;
	bh=Yfk5GrGSx45l0NkpI1xB0hTlF8R/6HDNT7BlbhFy87w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lSAfOSBdpwgun70Eyz5DKzcv8QYKYtkm/CPTgtDizE3oD/GCFSc0Gl3tkIBldGihC
	 wUCqTGLOpKEtFNkAocbyi/6S6ktrMb+BTCcUSKtqm0nxLBZRhZNtnWnf+YiKFShBP/
	 VmOTjmlxf3lNgx846SkX5byWJ2gl2JZpPfb1vB5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25B1DF80236; Thu, 13 Jul 2023 07:58:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF3F9F80236;
	Thu, 13 Jul 2023 07:58:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C2C0F80249; Thu, 13 Jul 2023 07:55:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CD983F800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 07:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD983F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=D4BP4jZt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=eBLzMc3y
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0690D1F890;
	Thu, 13 Jul 2023 05:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689227732;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=44Cte4Bfaki0rckA2m0rHSl6HfdirCtiZyySZBp0bbw=;
	b=D4BP4jZtmHE6fOCLqgk7MR7R9PXnsfO5EMa16pHWhToNdSNX6TzaACKyrGJJC1KLGI8U3i
	Qre6svrkMFNbgdsk9bi9iOzmCjO1GHCWS8ZQZLAKxgoOCircffnTBr+HXP2kg8ETTP1+1x
	hLuDitgJPbxxFFjzJdHkFLAyjm1ElG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689227732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=44Cte4Bfaki0rckA2m0rHSl6HfdirCtiZyySZBp0bbw=;
	b=eBLzMc3yk7+4GlC3aXXFSfYyNysvwPY4BLyt931utPwXmqwatrGGKIbpC+v7y2zuqu+Pae
	8OI/fQIZdRLmL+BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D2E161390D;
	Thu, 13 Jul 2023 05:55:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id TjhzMtORr2TtMwAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 13 Jul 2023 05:55:31 +0000
Date: Thu, 13 Jul 2023 07:55:31 +0200
Message-ID: <875y6ogxt8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 2/3] ALSA: emu10k1: remove superfluous IRQ enable state
 saving
In-Reply-To: <20230712145750.125086-2-oswald.buddenhagen@gmx.de>
References: <20230712145750.125086-1-oswald.buddenhagen@gmx.de>
	<20230712145750.125086-2-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 6I7LUFFI53RF2LKGOKH7KOFJMG6RB25R
X-Message-ID-Hash: 6I7LUFFI53RF2LKGOKH7KOFJMG6RB25R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6I7LUFFI53RF2LKGOKH7KOFJMG6RB25R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jul 2023 16:57:49 +0200,
Oswald Buddenhagen wrote:
> 
> The mixer, PCM prepare, MIDI, synth driver, and procfs callbacks are all
> always invoked with IRQs enabled, so there is no point in saving the
> state.
> 
> snd_emu1010_load_firmware_entry() is called from emu1010_firmware_work()
> and snd_emu10k1_emu1010_init(); the latter from snd_emu10k1_create() and
> snd_emu10k1_resume(), all of which have IRQs enabled.
> 
> The voice and memory functions are called from mixed contexts, so they
> keep the state saving.
> 
> The low-level functions all keep the state saving, because it's not
> feasible to keep track of what is called where.
> 
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

Wouldn't it make more sense if you replace it with a mutex?
It'll become more obvious that it's only for non-IRQ context, too.


thanks,

Takashi
