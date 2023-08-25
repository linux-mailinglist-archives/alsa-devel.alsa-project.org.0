Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E12788145
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 09:52:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A34484B;
	Fri, 25 Aug 2023 09:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A34484B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692949968;
	bh=XaCj1xkBfibjnLekFHAhLF+HcZC+H920Zim1g7/h43Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OSQQJSlTTHAhIDBxSR74792bZ9v60xse9k1rYheenz/3nLjyezlW7U70KrGqTvxdI
	 fgvGjpsnuOdV98EKDPFMblUrgJ4jRUvgHgEO1OheISoOkLled32tqPlPjTsS1Bdu+F
	 3np9d9DTo/J6zwwzxMz7R8l8/c1+XPhbfs8dgTWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19E66F804DA; Fri, 25 Aug 2023 09:51:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3EC0F80074;
	Fri, 25 Aug 2023 09:51:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4ADBF80549; Fri, 25 Aug 2023 09:49:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AF627F804F3
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 09:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF627F804F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=vyuU2toh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZXBLBsGA
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 01C3022017;
	Fri, 25 Aug 2023 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692949793;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9AMPbzJqXUBLSj96Q3gSG+cKQ3pq7dZsZ7StM9VL3R4=;
	b=vyuU2toh+F4s312wAO0s9NclcvOW6fWT/7b9f9sHdtiWjuc9qHjGCUBaXdOszJr7jJsAGm
	UNmu2KCtDOuz3Nqqll65lsJA613h+PD+dDhC5tQ84+E3CwLacBOQ8iRNCusZqqTMLbtmCj
	MeFFQAsuh4gH1FSnAeFltaotfInBbWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692949793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9AMPbzJqXUBLSj96Q3gSG+cKQ3pq7dZsZ7StM9VL3R4=;
	b=ZXBLBsGA64DH8CZ/62YeLKZyGohLDoz6KGOJbwUj0mAANVpovm3keiYuU/JVAx8sVDCSLY
	dPmzZzgtTb7zZZDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C8E181340A;
	Fri, 25 Aug 2023 07:49:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id NOyrLyBd6GTkUQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 25 Aug 2023 07:49:52 +0000
Date: Fri, 25 Aug 2023 09:49:52 +0200
Message-ID: <87cyzb8stb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Fabian Vogt <fabian@ritter-vogt.de>
Cc: SungHwan Jung <onenowy@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	perex@perex.cz
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirk for mute LEDs on HP ENVY
 x360 15-eu0xxx
In-Reply-To: <2693091.mvXUDI8C0e@fabians-envy>
References: <4504056.LvFx2qVVIh@fabians-envy>
	<20230824173718.7992-1-onenowy@gmail.com>
	<87r0ns8hej.wl-tiwai@suse.de>
	<2693091.mvXUDI8C0e@fabians-envy>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: KJKXCSLWVN4CELVQOGM4SUZBR3VVZXPT
X-Message-ID-Hash: KJKXCSLWVN4CELVQOGM4SUZBR3VVZXPT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KJKXCSLWVN4CELVQOGM4SUZBR3VVZXPT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 24 Aug 2023 20:39:48 +0200,
Fabian Vogt wrote:
> 
> The LED for the mic mute button is controlled by GPIO2.
> The mute button LED is slightly more complex, it's controlled by two bits
> in coeff 0x0b.
> 
> Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>
> ---
> Changes since v1:
> Rebased on 03b0563c2f35. I've got this laptop for almost two years now and
> two days ago decided to dig into the issue with mute LEDs. What amazing timing
> that someone else made the exact same fixup for a different model just hours
> before I submit...
> Renamed quirk to ..._LEDS to distinguish it from the similar quirk which
> handles only one of the mute LEDs.

Applied now.  Thanks.

BTW, at the next time you post a v2 patch, it's better to start a new
thread instead of hanging to the old thread.


Takashi
