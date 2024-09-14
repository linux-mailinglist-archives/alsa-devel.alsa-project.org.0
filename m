Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C47C978ECC
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Sep 2024 09:13:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F1D393A;
	Sat, 14 Sep 2024 09:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F1D393A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726298018;
	bh=q7H+DrnbwW/PqVHYnjGC6otNtZW0SagkSbSaeeuANak=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OeydKBs63bOBL6XPS/iBD9VrVroaUQfkbVbl76MN2UV0rf8tolST9k59Cf/M62ifC
	 rHOni1xnkiU2cRrVSNj5eTp4iN1EtU9+YULYV/93g9xqZshXgPG69yB546OPYWX00n
	 QPdni/x22/cScclGuATk7v+3QZhx6++DfvGZ3SX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50988F80301; Sat, 14 Sep 2024 09:13:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3BD8F805A8;
	Sat, 14 Sep 2024 09:13:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B2CEF801F5; Sat, 14 Sep 2024 09:12:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7B02F80074
	for <alsa-devel@alsa-project.org>; Sat, 14 Sep 2024 09:12:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7B02F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JG2FR5A1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6zmzi7kn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=JG2FR5A1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6zmzi7kn
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AB21421257;
	Sat, 14 Sep 2024 07:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726297975;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KCdpS27+siZd/JrEvZUw+/5nStd7DjujMv4/64Pa4FA=;
	b=JG2FR5A1pwZw082pxyQ2e8G1LxAsEBY4QMyhb3v653X41YfxGpDXnmIbQRKjWm7Uc1Dpfb
	nlCrT8b/9Qp4jTiG3SdB50ZyEmLTQyuPLvcm5rBORqjBLWOq4B9nTK8jXM02CoSestr/Ng
	a3JKkvipbP7tjJNIzl8pbSgdYphA0rc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726297975;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KCdpS27+siZd/JrEvZUw+/5nStd7DjujMv4/64Pa4FA=;
	b=6zmzi7knulDtPX6EH4JIdbDIa9uz8VBy39yINQsfTB2xOfdUApGBcMPuY+qZfCgtVmZdRv
	xYhtAvw5YAMUZVBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726297975;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KCdpS27+siZd/JrEvZUw+/5nStd7DjujMv4/64Pa4FA=;
	b=JG2FR5A1pwZw082pxyQ2e8G1LxAsEBY4QMyhb3v653X41YfxGpDXnmIbQRKjWm7Uc1Dpfb
	nlCrT8b/9Qp4jTiG3SdB50ZyEmLTQyuPLvcm5rBORqjBLWOq4B9nTK8jXM02CoSestr/Ng
	a3JKkvipbP7tjJNIzl8pbSgdYphA0rc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726297975;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KCdpS27+siZd/JrEvZUw+/5nStd7DjujMv4/64Pa4FA=;
	b=6zmzi7knulDtPX6EH4JIdbDIa9uz8VBy39yINQsfTB2xOfdUApGBcMPuY+qZfCgtVmZdRv
	xYhtAvw5YAMUZVBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 869A313A30;
	Sat, 14 Sep 2024 07:12:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8ColH3c35WY+UAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 14 Sep 2024 07:12:55 +0000
Date: Sat, 14 Sep 2024 09:13:44 +0200
Message-ID: <87seu2btcn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.11-rc7
In-Reply-To: <11c4a6a78809a2fc6e43efb232fd6e7e.broonie@kernel.org>
References: <11c4a6a78809a2fc6e43efb232fd6e7e.broonie@kernel.org>
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
Message-ID-Hash: AYDYGSMWRTX3RG7UXHQ4PHD336BFLFH3
X-Message-ID-Hash: AYDYGSMWRTX3RG7UXHQ4PHD336BFLFH3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AYDYGSMWRTX3RG7UXHQ4PHD336BFLFH3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 13 Sep 2024 20:30:01 +0200,
Mark Brown wrote:
> 
> The following changes since commit 77212f300bfd6fb3edaabd1daf863cabb521854a:
> 
>   ASoC: codecs: lpass-va-macro: set the default codec version for sm8250 (2024-08-30 13:54:24 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.11-rc7
> 
> for you to fetch changes up to 4f9a71435953f941969a4f017e2357db62d85a86:
> 
>   ASoC: meson: axg-card: fix 'use-after-free' (2024-09-11 16:16:34 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.11
> 
> A few last minute fixes, plus an update for Pierre's contact details and
> status.  It'd be good to get these into v6.11 (especially the
> MAINTAINERS update) but it wouldn't be the end of the world if they
> waited for the merge window, none of them are super remarkable and it's
> just a question of timing that they're last minute.

Thanks, pulled now.
I'm going to try to send a PR in today (hopefully), as all those look
easy enough as last minute fixes.


Takashi
