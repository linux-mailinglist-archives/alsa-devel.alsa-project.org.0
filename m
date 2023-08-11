Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1143779229
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 16:47:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF7AD822;
	Fri, 11 Aug 2023 16:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF7AD822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691765239;
	bh=pme7/amu2yUglSgDtUsH8NV8OcHOhMJWYGc6lnky5+o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mcD5KfgPv14lR4FKOd0oO6UK6mvFxOYJPn7XO741zTSQJLqrdz2eNUjYrRxBd9c/j
	 XEUldJrEpxHBFd/m/AWoHY2+35ldpS8GooO3stYsv+oT9j1vnDWwNAx8apQ+pwzJIA
	 WcfTVONZR4DExYaqGXQV9/NRnlpCefGnEeIStgE8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1D88F80549; Fri, 11 Aug 2023 16:46:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 739D9F800F4;
	Fri, 11 Aug 2023 16:46:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25646F80166; Fri, 11 Aug 2023 16:46:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A144F800EE
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 16:46:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A144F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=oomyKDWR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=og+0aFeu
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7DDCF1F88E;
	Fri, 11 Aug 2023 14:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691765176;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQkyMykUR+4oat9MUQVEoYgmEpzFy8kxGbqFWcPI9Ok=;
	b=oomyKDWRWTdvR9kqHlXB4+8kYDspu4IgZ5jI/4hqgSUZjRlwU/GLJulEycMmZyLSEORsTR
	VsU7ygU2tacDNiOd03C5GLaV/42GCvg1bFMY/OuUpwh8ZXLAN9ix4v2KGbMCGWdH1ZW/HW
	pBQr1j83LugSQjHTZJKqfpdQnU6Mc1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691765176;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQkyMykUR+4oat9MUQVEoYgmEpzFy8kxGbqFWcPI9Ok=;
	b=og+0aFeuOjRh+grZQltNpCEV+y5FyBWyq9XylI2UuJZLlA3g/vkvDG9zgZc/Yb/coQ0V78
	XSzIbAsJIsvpNRDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 47015138E2;
	Fri, 11 Aug 2023 14:46:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id /PNNELhJ1mToIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 11 Aug 2023 14:46:16 +0000
Date: Fri, 11 Aug 2023 16:46:15 +0200
Message-ID: <87ttt5r614.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1] ALSA: hda/cs8409: Support new Dell Dolphin Variants
In-Reply-To: <20230811123044.1045651-1-sbinding@opensource.cirrus.com>
References: <20230811123044.1045651-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: VH46OHT2C36JTRGRABM65SZHJ4H7BWSS
X-Message-ID-Hash: VH46OHT2C36JTRGRABM65SZHJ4H7BWSS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VH46OHT2C36JTRGRABM65SZHJ4H7BWSS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 11 Aug 2023 14:30:44 +0200,
Stefan Binding wrote:
> 
> Add 4 new Dell Dolphin Systems, same configuration as older systems.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Applied now.  Thanks.


Takashi
