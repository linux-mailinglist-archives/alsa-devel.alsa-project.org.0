Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE3A9C1899
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2024 09:59:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF66110BE;
	Fri,  8 Nov 2024 09:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF66110BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731056373;
	bh=KE5uXHspJMninNT9jQI2C5SwUT7kUteD3JkY75AwnFw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UDXI4+DeIxYsYUItdSKewBh8vgq/4rc5ocKEmvcnrhJ6nSLUfzyP4OeiQrp7WG8hT
	 I1qpLy0zOQt4W5L713OK7vwS8Gen0tPGgL2PFpwCWRlkOk45eRPMSN2dWrmigatXbU
	 ZNz6Did8z2W2myNZbVYabaUBUI46BJZmrQka0T0s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44CA1F805BA; Fri,  8 Nov 2024 09:59:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3747F805AA;
	Fri,  8 Nov 2024 09:59:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AD10F8013D; Fri,  8 Nov 2024 09:58:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40D16F800AA
	for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2024 09:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40D16F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=d7w31odS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JFp530wq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=d7w31odS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JFp530wq
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 480D421C48;
	Fri,  8 Nov 2024 08:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1731056330;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DJwL83DtvxOnPFkbYn5MS9lLZMaVWY/YkgAcRDVIEFY=;
	b=d7w31odSo970LijioDdyvjSCp7rdynCLb5Ztd9Pzugl+5qLGq1vBhDtNktouPCEav8LJR2
	xXitO3SgGApWKn4L0OzZSLbNhH+hCOKNTIIrfvZwDo9/uLdzjGnePfVY0rPo9qB6IPitSR
	+br3eL0bOZL5YiSlydAE5ffvxSHNCvo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731056330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DJwL83DtvxOnPFkbYn5MS9lLZMaVWY/YkgAcRDVIEFY=;
	b=JFp530wqh0xRVG4tsBwcdRX+AYc3TUgryhK8ACkNPAZe0xvAuURvEqa2PncauTRuGOySB9
	CkqxQb2hLT4dw/AA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=d7w31odS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JFp530wq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1731056330;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DJwL83DtvxOnPFkbYn5MS9lLZMaVWY/YkgAcRDVIEFY=;
	b=d7w31odSo970LijioDdyvjSCp7rdynCLb5Ztd9Pzugl+5qLGq1vBhDtNktouPCEav8LJR2
	xXitO3SgGApWKn4L0OzZSLbNhH+hCOKNTIIrfvZwDo9/uLdzjGnePfVY0rPo9qB6IPitSR
	+br3eL0bOZL5YiSlydAE5ffvxSHNCvo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731056330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DJwL83DtvxOnPFkbYn5MS9lLZMaVWY/YkgAcRDVIEFY=;
	b=JFp530wqh0xRVG4tsBwcdRX+AYc3TUgryhK8ACkNPAZe0xvAuURvEqa2PncauTRuGOySB9
	CkqxQb2hLT4dw/AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 27AA11394A;
	Fri,  8 Nov 2024 08:58:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UDAPCMrSLWfWGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 08 Nov 2024 08:58:50 +0000
Date: Fri, 08 Nov 2024 09:58:49 +0100
Message-ID: <87y11uf6eu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.12-rc6
In-Reply-To: <c47a108a78297aa0534c252420f39a48.broonie@kernel.org>
References: <c47a108a78297aa0534c252420f39a48.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 480D421C48
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: D4PGVA2X7LD6MBQY3VBX5YO4TLW2BO3L
X-Message-ID-Hash: D4PGVA2X7LD6MBQY3VBX5YO4TLW2BO3L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D4PGVA2X7LD6MBQY3VBX5YO4TLW2BO3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 07 Nov 2024 23:21:19 +0100,
Mark Brown wrote:
> 
> The following changes since commit 2db63e92186d7201ee1cb2f5af11757c5e5a1020:
> 
>   wcd937x codec fixes (2024-10-29 19:18:48 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.12-rc6
> 
> for you to fetch changes up to 48b86532c10128cf50c854a90c2d5b1410f4012d:
> 
>   ASoC: SOF: sof-client-probes-ipc4: Set param_size extension bits (2024-11-07 15:35:52 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.12
> 
> A moderately large pile of small changes here, split fairly evenly
> between fixes and ID additions/quirks and all of it driver specific.

Pulled now.  Thanks.


Takashi
