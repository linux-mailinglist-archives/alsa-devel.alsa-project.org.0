Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FEC78773D
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 19:45:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CD1083A;
	Thu, 24 Aug 2023 19:44:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CD1083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692899104;
	bh=pmzCra/hPhtXu4xznv2S9ItwG1V83yvFdzKNKm8wmPw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UyDCTZKvRgBh3I423TQdC64xXSQemOmRorOjB9WWvtCwHKF7OKH0DUdwkpITgxUCP
	 PRcytpX+ViAYiFS1ZdVttHm89qS3ECh+OU5PMnWJAFlIZhmmhHfaaiclB3t46QwAfe
	 EnJR57C7TiXWZlyTUEBPtkbzB7QxVtVJUPohfMnE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEF39F80537; Thu, 24 Aug 2023 19:44:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F1BDF800F5;
	Thu, 24 Aug 2023 19:44:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CB38F80158; Thu, 24 Aug 2023 19:44:09 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C44EEF800AE
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 19:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C44EEF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=G5UpjZs/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NAbZXD0L
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EA71F21E3F;
	Thu, 24 Aug 2023 17:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692899044;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eoa2qiu7Pb8Mej/ksgnMC+QAXJFSGjCz8Q+iS5utF28=;
	b=G5UpjZs/mQh3VwjtrfzG3fFvmrjFdFaz57SAYLChH+uiSdJ8sc3e66vocEU3o1nZqEDa7Q
	rQfX2i4YpQ1Yo0NdXG5M/5/nNCAOVclqFT8tLraSIMBmMAYFXysz+XXfrhXY/v2nNrRdYM
	KrPiU/Fo2PGcuFM/gyOyVDxekELbU5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692899044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eoa2qiu7Pb8Mej/ksgnMC+QAXJFSGjCz8Q+iS5utF28=;
	b=NAbZXD0LS7flBlWFEKj+UWqc4XTyhHSmbwMYpDGXLdZ3FFFA/Bk9YbD8augwNBhNixraxe
	TU0vbGFLtjjq7PDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B1CBE1336F;
	Thu, 24 Aug 2023 17:44:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KWJmKuSW52Q/fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 24 Aug 2023 17:44:04 +0000
Date: Thu, 24 Aug 2023 19:44:04 +0200
Message-ID: <87r0ns8hej.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: SungHwan Jung <onenowy@gmail.com>
Cc: fabian@ritter-vogt.de,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for mute LEDs on HP ENVY
 x360 15-eu0xxx
In-Reply-To: <20230824173718.7992-1-onenowy@gmail.com>
References: <4504056.LvFx2qVVIh@fabians-envy>
	<20230824173718.7992-1-onenowy@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 63OFCZYPGWN36ITJ7YNEIOXS64BGOS2D
X-Message-ID-Hash: 63OFCZYPGWN36ITJ7YNEIOXS64BGOS2D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/63OFCZYPGWN36ITJ7YNEIOXS64BGOS2D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 24 Aug 2023 19:37:18 +0200,
SungHwan Jung wrote:
> 
> On Fri, Aug 25, 2023 at 12:57 AM Fabian Vogt <fabian@ritter-vogt.de> wrote:
> > I see that SungHwan Jung (CC'd) recently submitted the same fixup for
> > a rather similar but different model as
> > "ALSA: hda/realtek: Add quirk for HP Victus 16-d1xxx to enable mute LED"
> > Does your HP Victus also need the ALC245_FIXUP_HP_GPIO_LED? Then we could
> > combine the quirks.
> 
> These victus laptops don't need ALC245_FIXUP_HP_GPIO_LED, but we can make
> alc245_fixup_hp_x360_mute_led and alc245_fixup_hp_mute_led_coefbit into
> one function.

ShungHwan's patch was already merged, so we can just reuse the
function in a new quirk; ALC245_FIXUP_HP_X360_MUTE_LED will be calling
alc245_fixup_hp_mute_led_coefbit and chained to
ALC245_FIXUP_HP_GPIO_LED.

Fabian, could you resubmit such a patch?


thanks,

Takashi
