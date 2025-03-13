Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 750E5A5EBF3
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Mar 2025 07:58:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 201D060345;
	Thu, 13 Mar 2025 07:58:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 201D060345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741849093;
	bh=RyzX0gqeNI4pWmr6/VdoInZ+dlZM318ZYcc1JnRbd2I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dJFnWU2b6pIKOhFbex1VYT5azLUsbEIoNkLNxrJWUX72+3vdSu7JHMCUxdqJCz+WH
	 nF6L62Ywt+5arbbhmnqD/tM2QjK+emzmk4atkCktzYBnUf6MThyz1lcLetYSTDg7zS
	 00RIrg33y5g5Y51utGFU9hvrG5P5v+25mBXb7O0U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9AFDF805B1; Thu, 13 Mar 2025 07:57:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24286F805B2;
	Thu, 13 Mar 2025 07:57:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9649F8026D; Thu, 13 Mar 2025 07:57:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F831F8014B
	for <alsa-devel@alsa-project.org>; Thu, 13 Mar 2025 07:57:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F831F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=CENqAGom;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1ghLI7Ir;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=CENqAGom;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1ghLI7Ir
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 383A021193;
	Thu, 13 Mar 2025 06:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1741849044;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2yySvAzL35jEYrk+KYZ/qRhD+Mdd7XYQh/Qld9fWks=;
	b=CENqAGomiNOp5irRFGX2vMycpjJtFekrdIiU6glwmbMr64pWS0KJ19VcQ9p9oIxuRayzNj
	pp7fEE6BVPzan9o6c+pWjMxo6jNgebyJVrFXaKf8xvJak5qrrnSDRR92C3jzwJf8No1sKD
	vS0M4zRZ+SEjkoHp50OoIuNv840z3Wk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741849044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2yySvAzL35jEYrk+KYZ/qRhD+Mdd7XYQh/Qld9fWks=;
	b=1ghLI7IrYA6lXBD17S3Ecuz0Z7mC6R9+8+HEdQqd/SgiXwzwXil7dxgahP0ScJnyhbs9AB
	XJXt652weEIsVBDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1741849044;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2yySvAzL35jEYrk+KYZ/qRhD+Mdd7XYQh/Qld9fWks=;
	b=CENqAGomiNOp5irRFGX2vMycpjJtFekrdIiU6glwmbMr64pWS0KJ19VcQ9p9oIxuRayzNj
	pp7fEE6BVPzan9o6c+pWjMxo6jNgebyJVrFXaKf8xvJak5qrrnSDRR92C3jzwJf8No1sKD
	vS0M4zRZ+SEjkoHp50OoIuNv840z3Wk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741849044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2yySvAzL35jEYrk+KYZ/qRhD+Mdd7XYQh/Qld9fWks=;
	b=1ghLI7IrYA6lXBD17S3Ecuz0Z7mC6R9+8+HEdQqd/SgiXwzwXil7dxgahP0ScJnyhbs9AB
	XJXt652weEIsVBDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12ECC13797;
	Thu, 13 Mar 2025 06:57:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7e9lA9SB0mdsCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 06:57:24 +0000
Date: Thu, 13 Mar 2025 07:57:23 +0100
Message-ID: <87plilxvsc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.14-rc6
In-Reply-To: <4a8fded6716eb0c56b8d3ce2c862df33.broonie@kernel.org>
References: <4a8fded6716eb0c56b8d3ce2c862df33.broonie@kernel.org>
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
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: 2B2HMQJNWQHGV35XLMKY2FYE3SLFQOXW
X-Message-ID-Hash: 2B2HMQJNWQHGV35XLMKY2FYE3SLFQOXW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2B2HMQJNWQHGV35XLMKY2FYE3SLFQOXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Mar 2025 00:03:17 +0100,
Mark Brown wrote:
> 
> The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:
> 
>   Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc6
> 
> for you to fetch changes up to 658fb7fe8e7f4014ea17a4da0e0c1d9bc319fa35:
> 
>   ASoC: cs42l43: convert to SYSTEM_SLEEP_PM_OPS (2025-03-12 16:12:24 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.14
> 
> The bulk of this is driver specific fixes, mostly unremarkable.  There's
> also one core fix from Charles, fixing up confusion around the limiting
> of maximum control values.

Pulled now.  Thanks.


Takashi
