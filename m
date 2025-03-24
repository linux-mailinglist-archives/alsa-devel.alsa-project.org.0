Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 660DBA6DE8D
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Mar 2025 16:26:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF8B1601D3;
	Mon, 24 Mar 2025 16:26:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF8B1601D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742829978;
	bh=VydK2Q1uS8KH/m/cMHz4kBGLdqllZnmC/XYOZbHre5I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C0JkF/HGfcSOuP8s4kS0ufv2ptHAy3FnlD+bWoriZ+EDW7ovL5k4qdkp55wCzSAeg
	 07Bj+n1bq2I/VtL64LTsyTdiY1uwg7oajRt5t5OS9sT8TJEntYtNCH4+wa53dP4OGI
	 4JKXPyWYfCx2nOxEV/Cl952m5Sp5qqmNfq448eFI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5DB7F805B5; Mon, 24 Mar 2025 16:25:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEFEFF805B1;
	Mon, 24 Mar 2025 16:25:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBA17F80424; Mon, 24 Mar 2025 16:25:39 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2784AF800B6
	for <alsa-devel@alsa-project.org>; Mon, 24 Mar 2025 16:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2784AF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=AiVRX3TC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wTsJqEgA;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=AiVRX3TC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wTsJqEgA
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 39DA421185;
	Mon, 24 Mar 2025 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1742829937;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bu9deQwvevgL+HsZceruitkiTL/P+73NTxijj9E7evY=;
	b=AiVRX3TCybP9zAcqq0UmOHb7Gr2LuFtj7EoGqEOzZhTx9L1hSDBeoUcugdQOQTMTcLo7wJ
	IeUJcXviNbwn3NVq8mXjEn+geXlLfHe48vV/bo5RHzylYD1LJoHPURmCkARc/Na3xE/xUJ
	czV7jbfQ3087cGYQkTt7Xaz1eS4O/V8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742829937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bu9deQwvevgL+HsZceruitkiTL/P+73NTxijj9E7evY=;
	b=wTsJqEgAhl3IDlHuU8YoOv3g5vy4C8x2Hh08rtsL4hgUi+Wl8/E0Zih27OGgAxSJitwFxs
	u2v1MvS+ACsfFZAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1742829937;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bu9deQwvevgL+HsZceruitkiTL/P+73NTxijj9E7evY=;
	b=AiVRX3TCybP9zAcqq0UmOHb7Gr2LuFtj7EoGqEOzZhTx9L1hSDBeoUcugdQOQTMTcLo7wJ
	IeUJcXviNbwn3NVq8mXjEn+geXlLfHe48vV/bo5RHzylYD1LJoHPURmCkARc/Na3xE/xUJ
	czV7jbfQ3087cGYQkTt7Xaz1eS4O/V8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742829937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bu9deQwvevgL+HsZceruitkiTL/P+73NTxijj9E7evY=;
	b=wTsJqEgAhl3IDlHuU8YoOv3g5vy4C8x2Hh08rtsL4hgUi+Wl8/E0Zih27OGgAxSJitwFxs
	u2v1MvS+ACsfFZAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1434B137AC;
	Mon, 24 Mar 2025 15:25:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id isBrA3F54WeyXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Mar 2025 15:25:37 +0000
Date: Mon, 24 Mar 2025 16:25:36 +0100
Message-ID: <87sen2qwlr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.15
In-Reply-To: <61f20e6e72e40f20422dca4b83d57787.broonie@kernel.org>
References: <61f20e6e72e40f20422dca4b83d57787.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
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
Message-ID-Hash: KQZMW3C5C52FC5BXWTYX22AOZDYOVAUX
X-Message-ID-Hash: KQZMW3C5C52FC5BXWTYX22AOZDYOVAUX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQZMW3C5C52FC5BXWTYX22AOZDYOVAUX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 24 Mar 2025 15:32:52 +0100,
Mark Brown wrote:
> 
> The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:
> 
>   Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.15
> 
> for you to fetch changes up to 9ef52d529bb75071e03cf85078f724d69c4abe89:
> 
>   ASoC: SDCA: Correct handling of selected mode DisCo property (2025-03-21 15:45:25 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.15
> 
> This is a very big release due to a combination of some big new work,
> mainly new drivers and generic SoundWire support, and some wide ranging
> cleanup work that made small changes to a lot of drivers.
> 
>  - Morimoto-san has completed the conversion to use modern terminology
>    for the clocking configuration, and several other cleanups with
>    narrower impact.
>  - All the power management operation configuration was updated to use
>    current idioms by Takashi Iwai.
>  - Clarification of the control operations from Charles Keepax.
>  - Prepartory work for more generic SoundWire SCDA controls from Charles
>    Keepax.
>  - Support for AMD ACP 7.x, AWINC WM88166, Everest ES8388, Intel AVS
>    PEAKVOL and GAIN DSP modules Mediatek MT8188 DMIC, NXP i.MX95, nVidia
>    Tegra interconnects, Rockchip RK3588 S/PDIF, Texas Instruments
>    SN012776 and TAS5770L, and Wolfson WM8904 DMICs,
> 
> Some changes from the tip tree adding APIs needed by the AMD code are
> included, these were unfortunately rebased in the tip tree after being
> pulled in.  There's also some regmap changes supporting the SCDA work
> and some devres refactoring that was pulled in to support other changes.

Pulled now.  Thanks.


Takashi
