Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F52A7A9538
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 16:29:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B7F8A4C;
	Thu, 21 Sep 2023 16:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B7F8A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695306566;
	bh=3jFnl7PcquEP0efVY9D5qrsQ+xz6s1cyQNhggmprhIg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n8O15T7RLQCBDeCRZxcxG8AaBMh5aTPoJWIpELEESGJzu93Qewit0CGFdd94QPeiV
	 11evXGKZuJs6r1xO+OWzuh/hstT5/ZkXQn6ajUVHB/G3CodfXVdNt5ldjWmifFZ58f
	 AJpHSXXGIvCMCGQMVTgOuEkoqGz4du4f1ADePFAY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B136CF80124; Thu, 21 Sep 2023 16:28:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 989EEF801F5;
	Thu, 21 Sep 2023 16:28:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 088FFF8025A; Thu, 21 Sep 2023 16:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A297FF80124
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 16:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A297FF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bRN2ddhK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mON+N6Qz
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 48E2A338B2;
	Thu, 21 Sep 2023 14:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695306497;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0dGDfPMdHkouyLG+K4XBGWe/mnHykIhqHqWxvEPGXqo=;
	b=bRN2ddhKTbv4J9TqQcGS7oqAeXUw+u+Rk++2q2b7Px6ie3/AaHtbwLLpfco23AoEvNOK49
	dTJgBDOGTI/f9KE5LjwtdE91ACVtPzQvnoLu4ur7/DC5tvhPdVhM/KoitRF+F6l0qe2eJk
	gDVNvttYt39sZKBPrFHwp6vBqY8REy0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695306497;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0dGDfPMdHkouyLG+K4XBGWe/mnHykIhqHqWxvEPGXqo=;
	b=mON+N6QzrhBevAHLkiJFI22PsJZ5F5HZLWKluF87uKdRxtCqWGGaB2/kkEKzPz810PTuP2
	E3XUrZl/SmCCHsBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D9DF13513;
	Thu, 21 Sep 2023 14:28:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id JzpbBgFTDGWkVwAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 21 Sep 2023 14:28:17 +0000
Date: Thu, 21 Sep 2023 16:28:16 +0200
Message-ID: <874jjnzjlr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v4 0/4] Support mute notifications for CS35L41 HDA
In-Reply-To: <20230920155450.576287-1-sbinding@opensource.cirrus.com>
References: <20230920155450.576287-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: P2GICVOKNY4MS4XSUTCAJHJJDYVABU3H
X-Message-ID-Hash: P2GICVOKNY4MS4XSUTCAJHJJDYVABU3H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P2GICVOKNY4MS4XSUTCAJHJJDYVABU3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 20 Sep 2023 17:54:46 +0200,
Stefan Binding wrote:
> 
> Some systems use a special keyboard shortcut to mute speaker audio.
> On systems using CS35L41 HDA which have this shortcut, add a
> mechanism which uses ACPI notifications to determine when the
> shortcut is pressed, and then mute the amps inside the driver.
> 
> Since this is not a normal mute mechanism, it does not go through
> userspace. To allow userspace to be able to track this special
> state, add an ALSA control which tracks the state of this forced
> mute
> 
> Changes since v2:
> - Fixed compile issue when CONFIG_ACPI is missing
> 
> Changes since v3:
> - Split first patch into 3 separate patches
> - Ensure all acpi code is protected by check for CONFIG_ACPI in
> realtek driver
> 
> Stefan Binding (4):
>   ALSA: hda: cs35l41: Add notification support into component binding
>   ALSA: hda/realtek: Support ACPI Notification framework via component
>     binding
>   ALSA: hda: cs35l41: Support mute notifications for CS35L41 HDA
>   ALSA: hda: cs35l41: Add read-only ALSA control for forced mute

The patch 3 doesn't seem applicable cleanly.
Could you rebase the patches on the top of my for-next branch?


thanks,

Takashi
