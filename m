Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D972AA357E2
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2025 08:28:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BA0F60248;
	Fri, 14 Feb 2025 08:27:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BA0F60248
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739518086;
	bh=iNGMNagAJiWQT7Uf0iMTWP/zMir3J2T+1Eqj3kHzjB0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BG6B6R55gKTAJwICPwUdNRXCSpAbpJPC68B/noc0eo9otBU6P91AkIviRBvVmarp4
	 Ui58di7x4vmz7ZAvT6uP1jsKgtnPnyECR9xhOH6oaeRg3rJlw1iW1y6PRhl50TAC9x
	 Rb6Sh8rvgDuhTztSLa+wIbOaufyX+7TB0hVCHSB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D416F805BB; Fri, 14 Feb 2025 08:27:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED526F805BB;
	Fri, 14 Feb 2025 08:27:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E582AF804B0; Fri, 14 Feb 2025 08:27:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B556F80095
	for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2025 08:27:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B556F80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=uuRe1J32;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=97UPbD8B;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=uuRe1J32;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=97UPbD8B
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 19D3321CF9;
	Fri, 14 Feb 2025 07:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1739518010;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YPfG8e6iSdl2w5dxbG9st1eGyvYu3B35sv/nvIr4Sjs=;
	b=uuRe1J32VmLu3XBekffSXfKGro/XFP1ITGfeUZtdfv97shaEaubo6BMFXH97dtbsVh3K1c
	+mvhc9qMcSiYT4193QqKbJue3JaqEVSRv8iRbVwTZ+LGhM6yhrxntUY6PAGhU1htwWGWDt
	z+Cy+SqC267AKnsCDAcbGadRuSqzfBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739518010;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YPfG8e6iSdl2w5dxbG9st1eGyvYu3B35sv/nvIr4Sjs=;
	b=97UPbD8BNtcZv6NcWEH0MGmJjQNFQYLeBahuxguA276PSW1D0SKCFp1CZ08VzwwnZPxgsK
	TahENvmPaKYPIbCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1739518010;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YPfG8e6iSdl2w5dxbG9st1eGyvYu3B35sv/nvIr4Sjs=;
	b=uuRe1J32VmLu3XBekffSXfKGro/XFP1ITGfeUZtdfv97shaEaubo6BMFXH97dtbsVh3K1c
	+mvhc9qMcSiYT4193QqKbJue3JaqEVSRv8iRbVwTZ+LGhM6yhrxntUY6PAGhU1htwWGWDt
	z+Cy+SqC267AKnsCDAcbGadRuSqzfBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739518010;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YPfG8e6iSdl2w5dxbG9st1eGyvYu3B35sv/nvIr4Sjs=;
	b=97UPbD8BNtcZv6NcWEH0MGmJjQNFQYLeBahuxguA276PSW1D0SKCFp1CZ08VzwwnZPxgsK
	TahENvmPaKYPIbCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8B2913285;
	Fri, 14 Feb 2025 07:26:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FNTXLTnwrmdPEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 14 Feb 2025 07:26:49 +0000
Date: Fri, 14 Feb 2025 08:26:44 +0100
Message-ID: <87ikpd2dhn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.14-rc2
In-Reply-To: <6a7865dfe2acc782da9c7aed79deeffe.broonie@kernel.org>
References: <6a7865dfe2acc782da9c7aed79deeffe.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: YZW37SMCV3EFLENOF4IPWY3NBHJZ7DQY
X-Message-ID-Hash: YZW37SMCV3EFLENOF4IPWY3NBHJZ7DQY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZW37SMCV3EFLENOF4IPWY3NBHJZ7DQY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Feb 2025 19:40:36 +0100,
Mark Brown wrote:
> 
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc2
> 
> for you to fetch changes up to 571b69f2f9b1ec7cf7d0e9b79e52115a87a869c4:
> 
>   ASoC: imx-audmix: remove cpu_mclk which is from cpu dai device (2025-02-13 11:34:32 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.14
> 
> More fixes and deviec quirks, most of them driver specific including a
> few SOF robustness fixes.  Nothing super remarkable individually.

Thanks, pulled now.


Takashi
