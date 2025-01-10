Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF7FA093A0
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2025 15:35:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FD50603EC;
	Fri, 10 Jan 2025 15:35:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FD50603EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736519714;
	bh=ciOkiN236Ixzgm6glabz5PKlfxf4mivHwaU0bDO3DiM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bpyly6sEz8OdQXk/hALmyAzBiiFS+3VJR1681KLsckHxdZrzpTCWi9Ta77HI+Xfci
	 rXs97M60LribTax9HesnxxKmaTL1jQsus8vuMbCPuTSWZGIs4lSnXKCyTtOh26ef11
	 uoYf9St3bDTa5/OtWcCTOscq9y2Kb1baStbxwbpE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5476F805BB; Fri, 10 Jan 2025 15:34:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CD78F805B6;
	Fri, 10 Jan 2025 15:34:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65343F80424; Fri, 10 Jan 2025 15:34:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8CB9F800F3
	for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2025 15:34:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8CB9F800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=i9/76x31;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EzYl/f4w;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=yA6a/hvu;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=AQ2wZlZ+
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C97B51F396;
	Fri, 10 Jan 2025 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736519660;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/22x1DTA7T2aHPHqJLU/bn/fwdyMWnYYQd9+lTcEANY=;
	b=i9/76x315uvZ9jR4+IGeahpWduWGeiBAYLtu58ISSVKNHuSKwGPjE70bj8MkanA3O6t+kK
	AHJmwS+Vy+2yP6Kw/nS1hYfzi1Us3kS5GcPH4j1PJvihWOjYIeh1Uk5XfyoYYJ/2aPJCik
	3OhnVPk+Ixqm+KcIfgNFbyH/NrXM2GA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736519660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/22x1DTA7T2aHPHqJLU/bn/fwdyMWnYYQd9+lTcEANY=;
	b=EzYl/f4w0GMKdnaCC9MsZnpEhtghFzzC89CkPrmUCbzIRabUm60MSfGycRJ2IAwGEX0qDS
	gUfXHvc1koGx1XAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="yA6a/hvu";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AQ2wZlZ+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736519659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/22x1DTA7T2aHPHqJLU/bn/fwdyMWnYYQd9+lTcEANY=;
	b=yA6a/hvupcu8JgBBUz//w2oazsOwcKMGbdf4k/6Eg8FLQQqbXjLOa4Rx6yIjUwuRoNIMqQ
	r/k4Chm3Vswy6/0Wwv/TubMf9+CFVw5qU3Cc9iF78wZy2USdt/gXsUc1pxtNiYaJ3Sqtpd
	cxT3AklwCx4tIrr5sKRNU/idlQ60F/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736519659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/22x1DTA7T2aHPHqJLU/bn/fwdyMWnYYQd9+lTcEANY=;
	b=AQ2wZlZ+7vT+nB+aQsvdlAkH5BQ70U1ZJly9MTzKithzvdhr6bCh89jdADHSEtSSoPgJ7q
	N/RZxpKexvDuioDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB5A813763;
	Fri, 10 Jan 2025 14:34:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /IWjKOsvgWeKdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 14:34:19 +0000
Date: Fri, 10 Jan 2025 15:34:19 +0100
Message-ID: <87a5byvitw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.13-rc6
In-Reply-To: <ec56d60518413ecceb0ca51a8a6d0806.broonie@kernel.org>
References: <ec56d60518413ecceb0ca51a8a6d0806.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: C97B51F396
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 5RISVJHMUQW3U3T3MK5GADBD24BCCXQW
X-Message-ID-Hash: 5RISVJHMUQW3U3T3MK5GADBD24BCCXQW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5RISVJHMUQW3U3T3MK5GADBD24BCCXQW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 10 Jan 2025 14:39:52 +0100,
Mark Brown wrote:
> 
> The following changes since commit 32c9c06adb5b157ef259233775a063a43746d699:
> 
>   ASoC: mediatek: disable buffer pre-allocation (2024-12-19 11:15:09 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.13-rc6
> 
> for you to fetch changes up to 139fa599cea0fd9d38e00246ea9f79af6c59acbd:
> 
>   ASoC: rsnd: check rsnd_adg_clk_enable() return value (2025-01-09 13:17:02 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.13
> 
> A collection of device specific fixes that came in over the holidays,
> plus a MAINTAINERS update and some documentation to help users debug
> problems with some of the Cirrus CODECs found in modern laptops.

Pulled now.  Thanks.


Takashi
