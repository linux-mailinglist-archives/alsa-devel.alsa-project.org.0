Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 041DAB10123
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jul 2025 08:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 954F4601F7;
	Thu, 24 Jul 2025 08:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 954F4601F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753340065;
	bh=sOYGlnsr86wyXKLIZBm6Knyy+tUuHaMgCsTwkHZQJkM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JbmFObFqDcaf13jeeUlux101fEXsf8gzYKiR0nAWHt5IDQkPpYsKHA3bVEKD0uuKd
	 3f2OvNteNVnJwYnAKeEkSgxmjlgkxw6TXKI9tPy/HdkyzFhx2WsrlDAu/wcjtGNw7+
	 L08nNMyKbBfRXP9SyAXF7eJ8VMsyKtmt+NBIi9kI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94609F805C4; Thu, 24 Jul 2025 08:53:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DE09F805C0;
	Thu, 24 Jul 2025 08:53:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5F1FF804E5; Thu, 24 Jul 2025 08:53:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94227F800D2
	for <alsa-devel@alsa-project.org>; Thu, 24 Jul 2025 08:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94227F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1Y16QpRX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bjolLTaA;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=1Y16QpRX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bjolLTaA
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BC4B91F78C;
	Thu, 24 Jul 2025 06:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1753340018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k3Wn2OILX87yyiFnk2cI7Y8AMoiZ8Dadj+9UmZsJtJg=;
	b=1Y16QpRXWT7MwPugX+W56tizMM+qxLnXE9lgIdS4iDlY4bgehqtnIRoNjmtRT+hk1X/lju
	cFx5GsRvP5g6T/71FVYs9J7HHVOX/T3TXBlaPLYNtziNe2U8QOls/taiosoDZN8antdSCE
	ezTNdcL/ch1sxLO57f3FCBIeJfIeEI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753340018;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k3Wn2OILX87yyiFnk2cI7Y8AMoiZ8Dadj+9UmZsJtJg=;
	b=bjolLTaApdGGrl7piNQAtRMRXlDQAP/Xo/rb7y1vtbr6mSCH4J7sGNKTGWAklHrZapbjG1
	gYqi1maRLNy95sDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1753340018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k3Wn2OILX87yyiFnk2cI7Y8AMoiZ8Dadj+9UmZsJtJg=;
	b=1Y16QpRXWT7MwPugX+W56tizMM+qxLnXE9lgIdS4iDlY4bgehqtnIRoNjmtRT+hk1X/lju
	cFx5GsRvP5g6T/71FVYs9J7HHVOX/T3TXBlaPLYNtziNe2U8QOls/taiosoDZN8antdSCE
	ezTNdcL/ch1sxLO57f3FCBIeJfIeEI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753340018;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k3Wn2OILX87yyiFnk2cI7Y8AMoiZ8Dadj+9UmZsJtJg=;
	b=bjolLTaApdGGrl7piNQAtRMRXlDQAP/Xo/rb7y1vtbr6mSCH4J7sGNKTGWAklHrZapbjG1
	gYqi1maRLNy95sDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96C06136DC;
	Thu, 24 Jul 2025 06:53:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mcmGI3LYgWhAJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 24 Jul 2025 06:53:38 +0000
Date: Thu, 24 Jul 2025 08:53:38 +0200
Message-ID: <87seimkrkd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.18
In-Reply-To: <825d264e217d34ea34b790c646b1f257.broonie@kernel.org>
References: <825d264e217d34ea34b790c646b1f257.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: 24WMJ5MLJI6722TYIYNPESPUZ4WXPFAL
X-Message-ID-Hash: 24WMJ5MLJI6722TYIYNPESPUZ4WXPFAL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/24WMJ5MLJI6722TYIYNPESPUZ4WXPFAL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 23 Jul 2025 19:21:25 +0200,
Mark Brown wrote:
> 
> The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:
> 
>   Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.18
> 
> for you to fetch changes up to c58c35ef6ae62e36927f506a5afc66610b7261d9:
> 
>   ASoC: qcom: sm8250: Add Fairphone 4 soundcard compatible (2025-07-23 15:09:30 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.18

A typo of 6.17?

As the tag name is also wrong, maybe it'd be better to scratch and
resend for avoiding confusion in future?  Let me know if you'd
resubmit.


thanks,

Takashi
