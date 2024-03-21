Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 841248859DE
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Mar 2024 14:17:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B440322CB;
	Thu, 21 Mar 2024 14:17:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B440322CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711027054;
	bh=qjJx1hdxx7AWRiVd51XdVJfmUvky1MRgFmfAV0o1cPg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lRCvu252v8pBRXcxW0iNnjtw3AWJQZnuuoTP6bJmQqYJNzY+Q5FogguVMH79Zusd/
	 ZfzAJRWQEnVQrAccPYbTq2Xg42ARot2ax/fLKjN430/ieHtsE2vZHVaTneJMRjeUrm
	 O+IkFTX0ZvpD+DVrts8LOaZvZagNoboCU/Ufpsno=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2265BF8058C; Thu, 21 Mar 2024 14:17:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D295F805A0;
	Thu, 21 Mar 2024 14:17:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8782F804E7; Thu, 21 Mar 2024 14:15:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38451F8025F
	for <alsa-devel@alsa-project.org>; Thu, 21 Mar 2024 14:15:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38451F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wJb6xy1k;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6N1njIe4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=wJb6xy1k;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6N1njIe4
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BD1903741C;
	Thu, 21 Mar 2024 13:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711026901;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tn3ldjtur9a1l9JTF0Dkjan2b/he36/pTmTOBBfZGiQ=;
	b=wJb6xy1kd2nuphZKunY+wDQjD8LN3TkAU/ZY9NmmfG23P3NE2cr1OjdqivKTxSOKN9SqeE
	74O3do5Xbh14zmdgzTh0zaijBnvKW5LvN3aDNaj5fNBu9qSoSgk0jEcQHqzYBcXTG3xLDw
	Lwxs0Dj9KZMLPWmdeFxqqX9oFPJuZuA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711026901;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tn3ldjtur9a1l9JTF0Dkjan2b/he36/pTmTOBBfZGiQ=;
	b=6N1njIe4zEHZCjcwHo31wijcYmW3B7NNeVdjMPx1IZgzrYdI20QrQaJWLEUDR3M+MashCo
	WtOgHoZH8vRDSXBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711026901;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tn3ldjtur9a1l9JTF0Dkjan2b/he36/pTmTOBBfZGiQ=;
	b=wJb6xy1kd2nuphZKunY+wDQjD8LN3TkAU/ZY9NmmfG23P3NE2cr1OjdqivKTxSOKN9SqeE
	74O3do5Xbh14zmdgzTh0zaijBnvKW5LvN3aDNaj5fNBu9qSoSgk0jEcQHqzYBcXTG3xLDw
	Lwxs0Dj9KZMLPWmdeFxqqX9oFPJuZuA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711026901;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tn3ldjtur9a1l9JTF0Dkjan2b/he36/pTmTOBBfZGiQ=;
	b=6N1njIe4zEHZCjcwHo31wijcYmW3B7NNeVdjMPx1IZgzrYdI20QrQaJWLEUDR3M+MashCo
	WtOgHoZH8vRDSXBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97BE0136AD;
	Thu, 21 Mar 2024 13:15:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MM+EI9Uy/GWkVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 21 Mar 2024 13:15:01 +0000
Date: Thu, 21 Mar 2024 14:15:01 +0100
Message-ID: <871q83sp4a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.9-merge-window
In-Reply-To: <20240321112803.598D5C433C7@smtp.kernel.org>
References: <20240321112803.598D5C433C7@smtp.kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wJb6xy1k;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6N1njIe4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.26 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-1.25)[89.62%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Queue-Id: BD1903741C
Message-ID-Hash: X6XFNFUVKHTZD6HIAYUT6BNNU3UXLN4F
X-Message-ID-Hash: X6XFNFUVKHTZD6HIAYUT6BNNU3UXLN4F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6XFNFUVKHTZD6HIAYUT6BNNU3UXLN4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 21 Mar 2024 12:27:50 +0100,
Mark Brown wrote:
> 
> The following changes since commit e8f897f4afef0031fe618a8e94127a0934896aba:
> 
>   Linux 6.8 (2024-03-10 13:38:09 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.9-merge-window
> 
> for you to fetch changes up to 9a8b202f8cb7ebebc71f1f2a353a21c76d3063a8:
> 
>   ASoC: soc-compress: Fix and add DPCM locking (2024-03-18 14:41:51 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.9
> 
> A bunch of fixes that came in during the merge window, probably the most
> substantial thing is the DPCM locking fix for compressed audio which has
> been lurking for a while.

Thanks, pulled now.


Takashi
