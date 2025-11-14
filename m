Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8961EC5D4FC
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Nov 2025 14:21:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16EF460206;
	Fri, 14 Nov 2025 14:21:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16EF460206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763126475;
	bh=b1yQ7dIgCPD7rsD7EN8De6jx2kuoltQg7bq+UugDXBQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P5rsZVtYIlgSJKf56tsWCMh83Do56KiQQwMCsNbt6gR7B+hT+6DQrQfAc+cAXrRtA
	 XBBLFb2NfvRXClrg6eil10f/bqTpKn311suAcjMK3VA+er+v1uxsOvsngEMKVLyQfb
	 N2SmVbGDmVDLdPjqUACyMpxrtteVX9SkeXLRPvH0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 799CDF805BF; Fri, 14 Nov 2025 14:20:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AE17F805C1;
	Fri, 14 Nov 2025 14:20:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6103F804E5; Fri, 14 Nov 2025 14:20:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5ACAF8025E
	for <alsa-devel@alsa-project.org>; Fri, 14 Nov 2025 14:19:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5ACAF8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=my5llB5O;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HpC3pdWo;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=my5llB5O;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HpC3pdWo
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1BCF01F790;
	Fri, 14 Nov 2025 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1763126362;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSwJ2dvg6dGLe6M1eMg4muncvxkXPdY/882QKbDQslY=;
	b=my5llB5ORJI2LMBM6vRuwP+jZ0E3H1Gst9r34B+W6u/pK+jDp7iYV2xhZlHsbqxln9f2oE
	n3KzECuahmqjJe4tVlbl8SmSFIsqoxTzbD/fPIahxoGRPBlLfCFAqq/MW6l20QxyqsZG71
	XJaRy2mKfrH51Fd+glLn5gOrw+nADvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763126362;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSwJ2dvg6dGLe6M1eMg4muncvxkXPdY/882QKbDQslY=;
	b=HpC3pdWolplTS9kRbjLVjRWmgJJE90wOdlfZhmBJHDaX4OltU0c9Wa4i0fcZVE9my7CCge
	jrJFyewLP16KzfDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1763126362;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSwJ2dvg6dGLe6M1eMg4muncvxkXPdY/882QKbDQslY=;
	b=my5llB5ORJI2LMBM6vRuwP+jZ0E3H1Gst9r34B+W6u/pK+jDp7iYV2xhZlHsbqxln9f2oE
	n3KzECuahmqjJe4tVlbl8SmSFIsqoxTzbD/fPIahxoGRPBlLfCFAqq/MW6l20QxyqsZG71
	XJaRy2mKfrH51Fd+glLn5gOrw+nADvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763126362;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSwJ2dvg6dGLe6M1eMg4muncvxkXPdY/882QKbDQslY=;
	b=HpC3pdWolplTS9kRbjLVjRWmgJJE90wOdlfZhmBJHDaX4OltU0c9Wa4i0fcZVE9my7CCge
	jrJFyewLP16KzfDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDB453EA61;
	Fri, 14 Nov 2025 13:19:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9BvDOFksF2kuNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 14 Nov 2025 13:19:21 +0000
Date: Fri, 14 Nov 2025 14:19:21 +0100
Message-ID: <87pl9kiwfa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.18-rc5
In-Reply-To: <979d5936ff7b727be317ba6d8c3a5e36@kernel.org>
References: <979d5936ff7b727be317ba6d8c3a5e36@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: UKO2U3TUB5JETSMHKH3QXLO5QEWRWOR2
X-Message-ID-Hash: UKO2U3TUB5JETSMHKH3QXLO5QEWRWOR2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UKO2U3TUB5JETSMHKH3QXLO5QEWRWOR2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Nov 2025 20:59:09 +0100,
Mark Brown wrote:
> 
> The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:
> 
>   Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-rc5
> 
> for you to fetch changes up to 360b3730f8eab6c4467c6cca4cb0e30902174a63:
> 
>   ASoC: rsnd: fix OF node reference leak in rsnd_ssiu_probe() (2025-11-13 00:36:01 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.18
> 
> A small collection of fixes, all driver specific and none especially
> remarkable unless you have the hardware (many not even then).

Pulled now.  Thanks.


Takashi
