Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 113E0751BA3
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 10:34:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBE20206;
	Thu, 13 Jul 2023 10:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBE20206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689237270;
	bh=fT7ye237XscXQY3dz/rWOILn32/SFVcsFXgV92DFfTk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YFU6E5cf0qBI53YqhKG99QlvURlpy87K4JtwkAuD3VOq2vfuz4t5HMR9/U9RCM7mT
	 X/QwQm2UOiqZelyeIfCk6AyHv3574PPw3BR5yRUcObccdpvBF410hsVVZE45gWa2Qw
	 Ey4VFWk0MVZFZcOBk23clgY+6Xnd5poKWGHNx5Bo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DF1EF80236; Thu, 13 Jul 2023 10:33:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65797F80236;
	Thu, 13 Jul 2023 10:33:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A19BF80249; Thu, 13 Jul 2023 10:33:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D2FACF80153
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 10:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2FACF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=YhFdGoy8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Aa/rwVL0
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7AAFE22190;
	Thu, 13 Jul 2023 08:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689237207;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZvI9jAGz0SI/7ffmList0BE1vqPhoUfs1X3cTQ6AacU=;
	b=YhFdGoy8Lc37pmKlk1jueRlwk15wVVR9Dy82xZhPAsxe9TN5NdXBwjF7qAV7Dk14IRgo6t
	H4EoBMZHGi1bJ6EfHPkcZa1qxrk82BW0Sr1e0yO7ut+NTno5e8gIDYBXDB/Sj8RhXFMymL
	cuGWdJyayOJKAdkMsiF9ZrTYp434M9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689237207;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZvI9jAGz0SI/7ffmList0BE1vqPhoUfs1X3cTQ6AacU=;
	b=Aa/rwVL0+Wv6gVCGtagjRcIOe4bjuXsHfiTp4CO4B9+KUKSZYzrcBU0wQxoC7sIIwh6QCp
	yDkclnUortbIRICw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 59067133D6;
	Thu, 13 Jul 2023 08:33:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uwSlFNe2r2RuMQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 13 Jul 2023 08:33:27 +0000
Date: Thu, 13 Jul 2023 10:33:26 +0200
Message-ID: <87jzv4fbxl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 3/3] ALSA: emu10k1: (re-)add mixer locking
In-Reply-To: <20230712145750.125086-3-oswald.buddenhagen@gmx.de>
References: <20230712145750.125086-1-oswald.buddenhagen@gmx.de>
	<20230712145750.125086-3-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: F3TW3VWKP7SXIF2FS4W45H3QTZNRYIAT
X-Message-ID-Hash: F3TW3VWKP7SXIF2FS4W45H3QTZNRYIAT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3TW3VWKP7SXIF2FS4W45H3QTZNRYIAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jul 2023 16:57:50 +0200,
Oswald Buddenhagen wrote:
> 
> Takashi now "prefers" that the drivers do not rely on the core's locking
> of card->controls_rwsem, so we undo 06405d8ee8 ("ALSA: emu10k1: remove
> now superfluous mixer locking") and add more locks that were already
> missing.
> 
> This adds some rather significant critical sections with IRQs disabled,
> as emu->reg_lock is also accessed by the PCM trigger callbacks, which
> are called with the hardirq-safe (self-)group lock held.
> 
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
> 
> ---
> the long irq-disabled sections could be avoided by introducing a
> separate control mutex. i surveyed a few drivers, and the precedents
> are very mixed, so i'm not sure this would be considered worth it.
> 
> ---
> of the few drivers i checked, pcsp, ak4xxx-adda, pt2258, hal2,
> sgio2audio, au88x0_eq, and ca0106_mixer appear to be missing locking
> upon superficial inspection, a percentage well into the double digits.
> 
> given that there are ~3700 hits for snd_kcontrol_new (and many more
> _put() methods to check, due to initializer arrays), the whole endeavor
> seems just as utterly hopeless to me as i expected.
> 
> so i recommend that you reconsider, and consequently reject this patch.

I applied this patch now.  We may optimize out the whole locking
conditionally for the known-good drivers, instead of relying on a
(hackish) big iron lock that wasn't considered to be used originally
at all.


thanks,

Takashi
