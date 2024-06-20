Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B7590FE50
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 10:08:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 447B0B6A;
	Thu, 20 Jun 2024 10:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 447B0B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718870919;
	bh=ss1+EZEKro2sZjXPDmzIZh1iD2THxjhpN0tqtg7dODk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=if0HYn9MsUOfCMALZpIq+XEUsfiZu9aLPXobqTDn+jLdtuZH5u8wAXg9LoE6+KYug
	 elgvtzOzJBh3N1MkLx0/FgfX2XLmCk+TYxAnjdGzwOvTZ3i8nWXYZaYUy3jdFP+fI5
	 S90XY3kRZa0F2F/uIoBI3+d56p0CDkNbuOAS4uxU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BF66F805AA; Thu, 20 Jun 2024 10:08:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD7E4F80578;
	Thu, 20 Jun 2024 10:08:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F4B0F80266; Thu, 20 Jun 2024 09:58:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D226F801EB
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 09:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D226F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=eSI3kgrX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=U0TFmWih;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=aiVC72NL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GD3Cmcsr
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E662E2175B;
	Thu, 20 Jun 2024 07:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718870318;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EyrXaIdP3ULci40nIjouHmuwVCbTd4pFecrGu85K7I8=;
	b=eSI3kgrXJleHkiIdP/2m6XxnZcWfn+zH0RKAHxObCYQqi4LGMg9iKlzaMxWBdclGF1+sku
	FxyU2GUEdb2WLUTzm1XhV4TO6WwpBB4sxs/KaTaym16EUAAGHoytYgfhaaPZHnTgNIr7br
	+zXzlWqd9Cce1IU5ZWdkMyQS/zmnxL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718870318;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EyrXaIdP3ULci40nIjouHmuwVCbTd4pFecrGu85K7I8=;
	b=U0TFmWihW0QiE6iZQPyFE6bYxQQB1y4OOkh9m0tkg8VNKxBxyoSMB1Sk95kHaSDjV26kyl
	dCILQw3AF17rhFCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aiVC72NL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GD3Cmcsr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718870317;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EyrXaIdP3ULci40nIjouHmuwVCbTd4pFecrGu85K7I8=;
	b=aiVC72NLOzdGINgU/hGK0xP8yZ1gPt2Gan3xdvs9EYVFUj23O+srdI0Tvzvs6RHaX6eTwE
	PKD/EOMM9qxz1oKFbX8ywJ63oouEQTm3psi+fbglHCC8HNL3TuRCmOh38FBXfaq7B7H94U
	NHb2QE8bJGNoXaD+i90F8aPm2P9o7PE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718870317;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EyrXaIdP3ULci40nIjouHmuwVCbTd4pFecrGu85K7I8=;
	b=GD3CmcsrZfgWqdJD7aPewrr5fZ8GgdFjogIdMrQMhqWI3DZMHWkqkkIJXZkuy3YJ3/lgME
	G9U3YwCQ6WDZd6Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A702B13AC1;
	Thu, 20 Jun 2024 07:58:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8ontJS3hc2axVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 20 Jun 2024 07:58:37 +0000
Date: Thu, 20 Jun 2024 09:59:03 +0200
Message-ID: <87cyoc2gfs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda: cs35l56: Select SERIAL_MULTI_INSTANTIATE
In-Reply-To: <20240619161602.117452-1-simont@opensource.cirrus.com>
References: <20240619161602.117452-1-simont@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: E662E2175B
X-Spamd-Result: default: False [-5.50 / 50.00];
	BAYES_HAM(-2.99)[99.96%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: JDYZKZHOIVBMLPMQY5ZLOZY3QUHYSG7M
X-Message-ID-Hash: JDYZKZHOIVBMLPMQY5ZLOZY3QUHYSG7M
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDYZKZHOIVBMLPMQY5ZLOZY3QUHYSG7M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Jun 2024 18:16:02 +0200,
Simon Trimmer wrote:
> 
> The ACPI IDs used in the CS35L56 HDA drivers are all handled by the
> serial multi-instantiate driver which starts multiple Linux device
> instances from a single ACPI Device() node.
> 
> As serial multi-instantiate is not an optional part of the system add it
> as a dependency in Kconfig so that it is not overlooked.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>

Applied now to for-linus branch.  Thanks.


Takashi
