Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4868ACEAF8
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jun 2025 09:36:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48135601F8;
	Thu,  5 Jun 2025 09:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48135601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749109011;
	bh=mBCiZStFEKfyItB2O9JaocMvKHymSBR3/G1LNuS43VA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OzFKLHgwW0VmMDs1P97ncezKQ8symFO1tAcbz90WwljHEvQedT20UifX+JvTBo62P
	 ogWcgYaW6uw07GLKz5mG5id9KJhuI0e0Kt80ySQNb9Lx1mURMSmIJ5M/Rw9z/PY40k
	 5X6+i4TTBidWBu7kyPiCbcgNkk+72X/GbeUYchj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F506F805C3; Thu,  5 Jun 2025 09:36:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31314F805B1;
	Thu,  5 Jun 2025 09:36:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E08CCF80154; Thu,  5 Jun 2025 09:36:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C65CF800C1
	for <alsa-devel@alsa-project.org>; Thu,  5 Jun 2025 09:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C65CF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=W9O71jxw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uSLzPHHl;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Km7ZHptm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mPfAfSBy
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E56EF5BE00;
	Thu,  5 Jun 2025 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1749108970;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jsmwj41+Xbk+lllWASIfDWcIZGRvT7ATPv1wiuHr0IA=;
	b=W9O71jxwJxziD0jqeGaLu1bM/Fv9Rrvs03Obo8ZdattuRxchvmyZNpvO9hBlx3GtOrM7iI
	ZkuYQdzkrK91+EgiFzwK2dM7oMfmFMqIRTbJ4yZGRBj55uLvgBc5GsMUHGdsgy3chq8KAT
	5Us+g0zplI6/TC0IBP9aBLOHBOi/C6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749108970;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jsmwj41+Xbk+lllWASIfDWcIZGRvT7ATPv1wiuHr0IA=;
	b=uSLzPHHlAKd7HLPv/95ZEbvuTDldEiqvbWS+wd2fRjPYZCTgohQxVwGMTHqvX375F9/f0i
	0L4gYGdRvGzDLFCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Km7ZHptm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mPfAfSBy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1749108969;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jsmwj41+Xbk+lllWASIfDWcIZGRvT7ATPv1wiuHr0IA=;
	b=Km7ZHptmSMw47X3xhY8orMnZLHklMb7C/XEGfh7KVueOt5UrKqbPNb4CXDJ+eNNsIbE2Tp
	5gbzIWOugNL5AAAPl5/ADFbheicJdbJkuXgrSku1bRja2ZrQgAPPTp5WDyNoq1xFKFSEoU
	t1FqnvND+eRE+cFkCw36SMOVYYL5tqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749108969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jsmwj41+Xbk+lllWASIfDWcIZGRvT7ATPv1wiuHr0IA=;
	b=mPfAfSBySnCbKHjzkCVD0t7xLt5nniH75f/NmSxHux7TuwHZQBJA1ZNLsXHSIRgoCum/P+
	9KY3mf/TtA6TQuBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0E5D1373E;
	Thu,  5 Jun 2025 07:36:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id f+HsLelIQWhvLwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Jun 2025 07:36:09 +0000
Date: Thu, 05 Jun 2025 09:36:09 +0200
Message-ID: <871pryprme.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.16-merge-window
In-Reply-To: <b1d4ad0e144128a16f88faa924f41432.broonie@kernel.org>
References: <b1d4ad0e144128a16f88faa924f41432.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E56EF5BE00
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: R2FMGDWNFVLZRH43W5GKI45GIVWV5BNZ
X-Message-ID-Hash: R2FMGDWNFVLZRH43W5GKI45GIVWV5BNZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2FMGDWNFVLZRH43W5GKI45GIVWV5BNZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 04 Jun 2025 13:31:09 +0200,
Mark Brown wrote:
> 
> The following changes since commit 43a38a0ff8c63ee156d997cd13063c63cd55d812:
> 
>   ASoC: codecs: add support for ES8375 (2025-05-23 16:52:28 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-merge-window
> 
> for you to fetch changes up to b7188a1c0d2d7b04f4558e10293651d49fcb2398:
> 
>   ASoC: Intel: avs: boards: Fix rt5663 front end name (2025-06-03 17:04:32 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.16
> 
> A bunch of fixes, including a big batch for the Intel AVS driver, and
> one new device ID.  It's all device specific.

Pulled now.  Thanks.


Takashi
