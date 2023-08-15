Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D681A77D281
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 20:55:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F150A82A;
	Tue, 15 Aug 2023 20:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F150A82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692125706;
	bh=wzFLeeDVfG6QKHmJTiA8ulGgJ8fRCz7571u+r8b40os=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XfrZ/FIxKyh8PQX4gHMrJbUl1T8WZt+hxpKxuYSnrBKLgmEr4yPiKxCoHbm/TLW8g
	 DAs0Bfm+HkPUIoVYLYN2dgYp14eKTM/COQ9YcO9QTWIMnX0XAUYneR3HdAEvhpdocW
	 lfd3I6X4SRxLPYukOm0j35G7TgkKTN5Spt2+DF7o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB4E6F80536; Tue, 15 Aug 2023 20:53:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19E86F8016A;
	Tue, 15 Aug 2023 20:53:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4508AF8016D; Tue, 15 Aug 2023 20:53:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C1FEF800EE
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 20:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C1FEF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qXX0MatE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NrAjT6Li
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BAFF01F8C1;
	Tue, 15 Aug 2023 18:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692125627;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5aw3g+VIEPs5B6D+gFh1SAMa09qr7A9oCmd6DpnGso8=;
	b=qXX0MatEHzqUEdtes9m2mJYWDik3uqYhWHxJpjZVPpv44Wm36IE8AH6P4P3LU4MvrnFk1C
	wfHEzOpiyjKHcjTZUaAtXorc0u9QvY1KBtQdCyXvO/zpiFogpna9PF3J2fmCHeX3FLUDSJ
	5FBdaGw9kR3fGjX3L1uRdt3IXDxMeH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692125627;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5aw3g+VIEPs5B6D+gFh1SAMa09qr7A9oCmd6DpnGso8=;
	b=NrAjT6LiJtT1Ah3xwET8TH0CjZ9aE1NQVJGzTK3Xtwiev1oQtief0bXoIfoxEQYLgaunU4
	cwt3yEB2pHTODBBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6AE041353E;
	Tue, 15 Aug 2023 18:53:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8qVJGLvJ22TAUAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 15 Aug 2023 18:53:47 +0000
Date: Tue, 15 Aug 2023 20:53:46 +0200
Message-ID: <87cyzoxhl1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1] ALSA: hda: cs35l41: Support systems with missing _DSD
 properties
In-Reply-To: <20230815161033.3519-1-sbinding@opensource.cirrus.com>
References: <20230815161033.3519-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 6CV5HMDZFNK3I4LFYB74C27K5SIF4GWB
X-Message-ID-Hash: 6CV5HMDZFNK3I4LFYB74C27K5SIF4GWB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6CV5HMDZFNK3I4LFYB74C27K5SIF4GWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 15 Aug 2023 18:10:33 +0200,
Stefan Binding wrote:
> 
> Some systems using CS35L41 with HDA were released without some
> required _DSD properties in ACPI. To support these special cases,
> add an api to configure the correct properties for systems with
> this issue.
> 
> This initial commit moves the no _DSD support for Lenovo
> Legion Laptops (CLSA0100, CLSA0101) into a new framework which
> can be extended to support additional laptops in the future.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

OK, we need to give up and accept the bitter reality :)
Now applied.  Thanks.


Takashi
