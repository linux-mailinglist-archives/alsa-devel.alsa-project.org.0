Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 512CD9C8F00
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2024 17:02:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3B872342;
	Thu, 14 Nov 2024 17:01:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3B872342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731600120;
	bh=NWSQqdbbYjw/fJiv3EL0EDTdVkGHENAwnSqKQPuiPWw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CwMB1b+VT7uw4t3eWY/1otgCKjtF6eod6dR8eiOWTw3yKP00NuLpZtGCUvzdwTKH1
	 UIt8N+BAUZewfIKPm3YBHKV3tJJkocsNbujyL/4ZTScT/I7aOWMnnylA3dS01V42S3
	 Iq0x/uMI+btrKYUPE5GsG3VZarNm5TTZ0PK1txnM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DBEFF805AC; Thu, 14 Nov 2024 17:01:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10B9EF805B1;
	Thu, 14 Nov 2024 17:01:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33E3EF8058C; Thu, 14 Nov 2024 17:01:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9575F80587
	for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2024 17:01:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9575F80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rLp68rVa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=m1dFIzlc;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=vJcAOJLn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=V0e0Vhxt
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E5B2C21111;
	Thu, 14 Nov 2024 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1731600073;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4mBKavqRaF4sOR4AW2ehiSArI3nd/4JG7tHFgvTVeaw=;
	b=rLp68rVaBXlEoxhWhgkItjO5izTk+NVyXqmltEJdZf+Kfvgp+QwAkBmPIWNEDT9i5VTmrf
	hT3NUAdcE7UUyLbm6I0GXsXsy33WkbjVc037bmN+RMvCOo3rb9tS6RSOTEo3ItRqa+Crf0
	Raum/DPonnGdi3bu38cQHgIfaCDH07c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731600073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4mBKavqRaF4sOR4AW2ehiSArI3nd/4JG7tHFgvTVeaw=;
	b=m1dFIzlcOybIQhykAj4RyL1ElRgiB9Ek83+nLcNUeCrjER6iB1QYsr0pUJxtIJ5ZDJayil
	PWkB1USqy+imZuAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1731600071;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4mBKavqRaF4sOR4AW2ehiSArI3nd/4JG7tHFgvTVeaw=;
	b=vJcAOJLnRj4R2wJd6dRvTflf/UoIo6quiTKV8elVGTG076qVU8nfdOHQk+EP00WFx3u0s8
	3f5YdkJNpuzsQJto+QUzxEmp0SfZT2bBz92u4d1pIq59Ydr6E7jaGUIW+AzC6syWSgEPnu
	dpJKNNcHNZtEvbqvd9Em4CPNHEnToZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731600071;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4mBKavqRaF4sOR4AW2ehiSArI3nd/4JG7tHFgvTVeaw=;
	b=V0e0VhxtEn1GzGi0BeE093rI5tkuc4oUDrpSpq8oXL2sA/htDpKQXSSm7OIVVG62/m8Ps8
	jTNSfYjnlQDXedAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C429B13794;
	Thu, 14 Nov 2024 16:01:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LOiWLsceNmfpFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 14 Nov 2024 16:01:11 +0000
Date: Thu, 14 Nov 2024 17:01:11 +0100
Message-ID: <871pzdu7nc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.12-rc7
In-Reply-To: <1a387ebeffba6289a672a48a50de11e3.broonie@kernel.org>
References: <1a387ebeffba6289a672a48a50de11e3.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: J56ULGYCRCA25W4AS7KIIJDBW4OQ2RLZ
X-Message-ID-Hash: J56ULGYCRCA25W4AS7KIIJDBW4OQ2RLZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J56ULGYCRCA25W4AS7KIIJDBW4OQ2RLZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 14 Nov 2024 14:46:55 +0100,
Mark Brown wrote:
> 
> The following changes since commit 48b86532c10128cf50c854a90c2d5b1410f4012d:
> 
>   ASoC: SOF: sof-client-probes-ipc4: Set param_size extension bits (2024-11-07 15:35:52 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.12-rc7
> 
> for you to fetch changes up to 2ae6da569e34e1d26c5275442d17ffd75fd343b3:
> 
>   ASoC: max9768: Fix event generation for playback mute (2024-11-12 13:16:37 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.12
> 
> Some last updates for v6.12, one quirk plus a couple of fixes.  One is a
> minor fix for a relatively obscure driver and the other is a relatively
> important fix for boot hangs with some audio graph based cards.

Thanks, pulled now.


Takashi
