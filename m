Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C49617580A1
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 17:17:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8767201;
	Tue, 18 Jul 2023 17:16:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8767201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689693456;
	bh=niAxknrX3he6ENZjz26xrfO+zo8L8o+OY4pDK48rl2w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Uuya/IKUq6Y/tehsRfXy+U0vkCt99B7vw0Pbys6mDYWtEr4ZakIWduoxknmVEDC/i
	 hpNjqyAEcN5C3DwyKbKHTrxmaxMwjdwJFJOj+RcRiCEgNbN/JECgW28/l676ek1epR
	 +gh9ICMf2s+IUQTVTYOYUgGhZ2ZWWTO30E9AS56A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DD8EF8032D; Tue, 18 Jul 2023 17:16:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3CE1F8027B;
	Tue, 18 Jul 2023 17:16:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18D68F8032D; Tue, 18 Jul 2023 17:16:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BF66F80153
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 17:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BF66F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JYvoCp+G;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=0pGp0HEt
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B7D1D21992;
	Tue, 18 Jul 2023 15:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689693370;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f9swbdzW5GGaeG44d2Q8pQFBI5Pi6ku3ASvpcBuSOWs=;
	b=JYvoCp+GiyoQMrYO7sQIi5jrUwAdkONMeblfQn7JH1H/F5IWvlB3ig1L98h4RKcT2yiIpL
	ySyTtTNb3Tb0RpfUl4u8O0+bc6P7x0z+DJpfyQCPZ8PIMxFA7yC240Boiyjez67C2i4IKn
	NDRY7EB+9SjlHYNZditruYMCWlu0s4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689693370;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f9swbdzW5GGaeG44d2Q8pQFBI5Pi6ku3ASvpcBuSOWs=;
	b=0pGp0HEtE6x6CquIkZdOZL1rkRPkbadv35EDY60mpcD/pRdzTwR5vgA4s1Xq6P0Gz6QPnZ
	gmo2dh40wGwzUDCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8CA6213494;
	Tue, 18 Jul 2023 15:16:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id goxvIbqstmRkIwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 15:16:10 +0000
Date: Tue, 18 Jul 2023 17:16:10 +0200
Message-ID: <87bkg9merp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christoffer Sandberg <cs@tuxedo.de>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Clevo NS70AU
In-Reply-To: <20230718145722.10592-1-wse@tuxedocomputers.com>
References: <20230718145722.10592-1-wse@tuxedocomputers.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 64456NCQT3OEOEEBYOAYVRT4GBXKXLKS
X-Message-ID-Hash: 64456NCQT3OEOEEBYOAYVRT4GBXKXLKS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/64456NCQT3OEOEEBYOAYVRT4GBXKXLKS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Jul 2023 16:57:22 +0200,
Werner Sembach wrote:
> 
> From: Christoffer Sandberg <cs@tuxedo.de>
> 
> Fixes headset detection on Clevo NS70AU.
> 
> Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
> Cc: <stable@vger.kernel.org>

Applied now.  Thanks.


Takashi
