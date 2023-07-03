Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEED0745A0C
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 12:20:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BA293E7;
	Mon,  3 Jul 2023 12:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BA293E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688379643;
	bh=+73JRo0AvjZK/+sBVr19hmJ9JrnTbn2R8luOoZrVAG8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NMYfvRQIzgzpLeFGo+APyLKwBvbi75nmZWazCQ0Q/utwZRSjWUrSAd6hPRggiX2hm
	 Dwem8/GI+gDM4rLD4JUzjaNtHmKAkzJIqsq2i4A/pNr1Tg0MjGuF5mEC42KHPbWwOM
	 jm6LwavpVQjl9kNrvx2tlSq2uq1LP7I8saXLiZ6s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE667F80552; Mon,  3 Jul 2023 12:19:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6686F80124;
	Mon,  3 Jul 2023 12:19:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DDD7F80125; Mon,  3 Jul 2023 12:19:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19205F80100
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 12:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19205F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hQPiygPo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=npXNKd72
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6D4C81FD72;
	Mon,  3 Jul 2023 10:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688379587;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ocWf0taEDATcuu5yr5Kd5WhPY8/eT+hKkf8uQFBXglc=;
	b=hQPiygPoY60xM1oU/ZCDzjYGyFzlwDDcGMCkaquZ+3oIZbYG9D5XR0exZ8yAgycBvLYKqf
	WaOZwDAnNmErZxz82qM+/iCPmGMej+uaNGYWFZ9yHXWCbvIAqXPA4JSO11oTaYOlHR4Lzm
	y483s+p1q0PwG9d9KYhIxMIW9tMU6oY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688379587;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ocWf0taEDATcuu5yr5Kd5WhPY8/eT+hKkf8uQFBXglc=;
	b=npXNKd725t8qY41Iw7LKRzUCLLZB3uW9XbFuDBMgQeZmCWjQORHMBrG5xBthCC8GphHJXX
	1LX0hL15ELP3wPAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C8F9138FC;
	Mon,  3 Jul 2023 10:19:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id de88EcOgomSgLwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 03 Jul 2023 10:19:47 +0000
Date: Mon, 03 Jul 2023 12:19:46 +0200
Message-ID: <87ttul5mbh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Symbolic Debugger" <happy.debugging@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
In-Reply-To: 
 <168837935904.20.17592291383426699605@mailman-web.alsa-project.org>
References: <168802789986.22.1719965101425313209@mailman-web.alsa-project.org>
	<168837935904.20.17592291383426699605@mailman-web.alsa-project.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: GCM76H2TTSY7S5P6KIKEUVJFM6JT7HXZ
X-Message-ID-Hash: GCM76H2TTSY7S5P6KIKEUVJFM6JT7HXZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCM76H2TTSY7S5P6KIKEUVJFM6JT7HXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Jul 2023 12:15:59 +0200,
Symbolic Debugger wrote:
> 
> I wish to program (C) against the new ALSA drivers. Understandably the current alsa-lib one is for the current kernel (up to 6.4) but since I have the kernel installed, I don't have the .h and .so files and distro's may  include the packages  (libasound) even later. Is there a interim library available before the kernel and distro's are updated ?

The build of alsa-lib doesn't rely on the kernel headers installed on
your system, as it has its own copies in the tree.  You just need to
update alsa-lib from the latest git version.


Takashi
