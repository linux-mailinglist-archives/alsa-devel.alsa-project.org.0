Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 961BB86C2AB
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 08:38:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DCA684D;
	Thu, 29 Feb 2024 08:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DCA684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709192336;
	bh=wL+W8KrUkEpgFLax+ionrTf8XiWYKXBmb0+wMbHw5vA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hpkJA+g78at80KuScdC2tRihW8fZALLdPAHgICS1qDt7xyX/yb3gOQZZXDRWr5/Gt
	 wRAAE/ocZBwQIfLqFFa6BcaDMgvPcNbOHhvE7M91RVLMeBh850v8pWnRYer1gfFr/L
	 aoZgPgL/dQgZkmNrbxcLnD7bTcnr3ROCYiogUMLM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40E8DF80570; Thu, 29 Feb 2024 08:38:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AC75F8013D;
	Thu, 29 Feb 2024 08:38:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0ECFF801C0; Thu, 29 Feb 2024 08:38:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9A1AF800F0
	for <alsa-devel@alsa-project.org>; Thu, 29 Feb 2024 08:38:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9A1AF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=vQ5+0xw3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rI9ipwbA;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=vQ5+0xw3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rI9ipwbA
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7CB4E1F7C3;
	Thu, 29 Feb 2024 07:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709192280;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXUsqvFz3R2iwk/jf4q/aeYVnCUMrmqHqN9JynMQ6+U=;
	b=vQ5+0xw3Yehl+npyTXTEKDA9ySiNQrMgGCpg0OO55m3k2A6kwiCX9NzOnHureJ8SE0W+PQ
	ycursYnV0T1EFEFGIgDI3VhWZwpPmf/yCa+VTZoIaWlBi7eNGkir9E76WQb2kTHfd4wVvq
	rr2FiqdbkfpVe7cy2Fy0Rq/dcgU830Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709192280;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXUsqvFz3R2iwk/jf4q/aeYVnCUMrmqHqN9JynMQ6+U=;
	b=rI9ipwbANlYKvx4dO2Jmv/tt2eMKMFfmgPrv/MHSPCTjxdFA9K51LOVGpIOca7swq4YFS9
	tHpQroDU9WwlXkDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709192280;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXUsqvFz3R2iwk/jf4q/aeYVnCUMrmqHqN9JynMQ6+U=;
	b=vQ5+0xw3Yehl+npyTXTEKDA9ySiNQrMgGCpg0OO55m3k2A6kwiCX9NzOnHureJ8SE0W+PQ
	ycursYnV0T1EFEFGIgDI3VhWZwpPmf/yCa+VTZoIaWlBi7eNGkir9E76WQb2kTHfd4wVvq
	rr2FiqdbkfpVe7cy2Fy0Rq/dcgU830Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709192280;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXUsqvFz3R2iwk/jf4q/aeYVnCUMrmqHqN9JynMQ6+U=;
	b=rI9ipwbANlYKvx4dO2Jmv/tt2eMKMFfmgPrv/MHSPCTjxdFA9K51LOVGpIOca7swq4YFS9
	tHpQroDU9WwlXkDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56FD513503;
	Thu, 29 Feb 2024 07:38:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wl16E1g04GUcQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 29 Feb 2024 07:38:00 +0000
Date: Thu, 29 Feb 2024 08:37:59 +0100
Message-ID: <87bk7zhga0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.8-rc5
In-Reply-To: <20240228180231.D8BF7C433C7@smtp.kernel.org>
References: <20240228180231.D8BF7C433C7@smtp.kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vQ5+0xw3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rI9ipwbA
X-Spamd-Result: default: False [-1.21 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.90)[94.47%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7CB4E1F7C3
Message-ID-Hash: F72JUHZHV2YT5UQUUS64HL3TFUQFQZ3F
X-Message-ID-Hash: F72JUHZHV2YT5UQUUS64HL3TFUQFQZ3F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F72JUHZHV2YT5UQUUS64HL3TFUQFQZ3F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 28 Feb 2024 19:02:24 +0100,
Mark Brown wrote:
> 
> The following changes since commit 0db0c1770834f39e11a2902e20e1f11a482f4465:
> 
>   ASoC: cs35l56: Workaround for ACPI with broken spk-id-gpios property (2024-02-13 19:37:25 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.8-rc5
> 
> for you to fetch changes up to ed00a6945dc32462c2d3744a3518d2316da66fcc:
> 
>   ASoC: amd: yc: Fix non-functional mic on Lenovo 21J2 (2024-02-28 12:24:59 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.8
> 
> A few small fixes, some driver specific and one slightly larger one
> from Richard which adds a new core helper and updates a small clutch of
> drivers to deal with the fact that they were using a helper which
> requires that the lock for the list of controls without holding that
> lock.  We also have some quirks for new AMD based Lenovo systems.

Pulled now.  Thanks.


Takashi
