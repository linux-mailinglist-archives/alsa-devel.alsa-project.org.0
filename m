Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51285CEC31B
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Dec 2025 16:48:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A461601EF;
	Wed, 31 Dec 2025 16:48:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A461601EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767196127;
	bh=R/CGX2Ui4SKK4S2hJ/4XlqkhtQ8M5Teu6O6zssrCWec=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K1ax0aIMvzTTQiDhanprtkdH6GAHDcCAA/PLDqKLvdSJANDhqT1pBEqR6QIuGmqEH
	 AhKv4FrEucchzgONaO41kf6IUOzJNXMWIct/PC3D1hNrM0zVvH3xLmQQ46GqyIs+gY
	 Rr8RaJpUv72MB2VO0tN9u8vs0lJ5VpWdDEiiUdvM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 739E5F805DF; Wed, 31 Dec 2025 16:48:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ECD2F805D8;
	Wed, 31 Dec 2025 16:48:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3569F80240; Wed, 31 Dec 2025 16:48:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57C37F801F5
	for <alsa-devel@alsa-project.org>; Wed, 31 Dec 2025 16:48:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57C37F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=RMf8C3Qo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=u7livqw+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=RMf8C3Qo;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=u7livqw+
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2179B336EF;
	Wed, 31 Dec 2025 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1767196082;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+E2ke8451e2Jjj0zOWkfQ2f2ZD4oCNu/wPdA6FI1Cu0=;
	b=RMf8C3QoTKF8FQ5FJFIHGttmn/npZ07RHkFYb07uV6hxNxdNLRJJxyN5rpQZFzBdoJdLy0
	e8fpXRSErFuQboEWOyBhXNMDmjKTp6fxc0w66EbkNnEHrMXHtu8rR98CjVkLMr6Jc+cf0z
	3tdbFnMX7HKwiaVeLj1OjDqvZVntRQQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767196082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+E2ke8451e2Jjj0zOWkfQ2f2ZD4oCNu/wPdA6FI1Cu0=;
	b=u7livqw+JmDmUGmdKR2IplEozjXgrLBDFTm60b8B9ql+n4lBTcEkreBGswjbmCdZuYXPh5
	BH1oIs5Hszr+ATBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RMf8C3Qo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=u7livqw+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1767196082;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+E2ke8451e2Jjj0zOWkfQ2f2ZD4oCNu/wPdA6FI1Cu0=;
	b=RMf8C3QoTKF8FQ5FJFIHGttmn/npZ07RHkFYb07uV6hxNxdNLRJJxyN5rpQZFzBdoJdLy0
	e8fpXRSErFuQboEWOyBhXNMDmjKTp6fxc0w66EbkNnEHrMXHtu8rR98CjVkLMr6Jc+cf0z
	3tdbFnMX7HKwiaVeLj1OjDqvZVntRQQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767196082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+E2ke8451e2Jjj0zOWkfQ2f2ZD4oCNu/wPdA6FI1Cu0=;
	b=u7livqw+JmDmUGmdKR2IplEozjXgrLBDFTm60b8B9ql+n4lBTcEkreBGswjbmCdZuYXPh5
	BH1oIs5Hszr+ATBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF770137FE;
	Wed, 31 Dec 2025 15:48:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OqlcObFFVWkgagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Dec 2025 15:48:01 +0000
Date: Wed, 31 Dec 2025 16:48:01 +0100
Message-ID: <878qeiy7ny.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.19-rc3
In-Reply-To: <20251231124837.C972C1AC5681@finisterre.sirena.org.uk>
References: <20251231124837.C972C1AC5681@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2179B336EF
Message-ID-Hash: DQ5JNA5KTVQYMB2RBASQC3DFMFRO7OVU
X-Message-ID-Hash: DQ5JNA5KTVQYMB2RBASQC3DFMFRO7OVU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQ5JNA5KTVQYMB2RBASQC3DFMFRO7OVU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 31 Dec 2025 13:48:31 +0100,
Mark Brown wrote:
> 
> The following changes since commit 56d953a8d0da5e53c2594edde23465ec49385b1c:
> 
>   ASoC: Intel: mtl-match: Add 6-amp matches for CS35L56 (2025-12-19 13:25:16 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-rc3
> 
> for you to fetch changes up to 3572ad82201baeed840f1959787e0e1281e7f937:
> 
>   ASoC: drop bogus container_of() error handling (2025-12-22 22:13:03 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.19
> 
> A small collection of driver speciifc fixes, mostly relatively minor,
> plus an adjustment to the topology file naming for Intel systems with
> Bluetooth required for disambiguation.

Pulled now.  Thanks.


Takashi
