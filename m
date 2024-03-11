Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3526587837E
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 16:27:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F81985D;
	Mon, 11 Mar 2024 16:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F81985D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710170868;
	bh=OGLdnylnAQ+J2TzNa4lLLwFN66c9cDKtCSNewXUWqWM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g0+XdKDIz0u2QKp2Y33C0lpz0BIj1/AneHFNG8a/oGZCHvtV5HeECPI1Q0J8RA2eq
	 3OR4DWfy+8LkpnZn1kywn3BnUrrmG8/YExSK6sL2kN7bahSDylKMIhXk64VS7C3zk8
	 tBLp3pjRL8zU7zsOzKldXSdinBuDvGfznNykasoA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFF28F8057F; Mon, 11 Mar 2024 16:26:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F035F805CB;
	Mon, 11 Mar 2024 16:26:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D90C4F8028D; Mon, 11 Mar 2024 16:25:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93F49F80088
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 16:25:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93F49F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=0onhxxQ+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QLEVrCfA;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=0onhxxQ+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QLEVrCfA
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F378F34E1B;
	Mon, 11 Mar 2024 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710170715;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tQUmYaZ8SZJnO6WyXdca3SA3sQa2qjbImAqjQsbQLC0=;
	b=0onhxxQ+//YeDP/45ZuhCf9sQ0v4g+2l+7Z8nS526qnGtZ4a/D0Go/QAZa8HcJgrpfJUbb
	EDiUFUYXgBjAcwNgq4ozV6rWqo9Z2VRY209yIV+ZnRpPxofO2ku3d4x2vsXnVgdpe2xMoz
	4n31GW7BviBylYOQw0T7IzUSlNmTgPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710170715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tQUmYaZ8SZJnO6WyXdca3SA3sQa2qjbImAqjQsbQLC0=;
	b=QLEVrCfAh9uCQGogg/O6tJFI+4lQWzDLWF9vomcAhQAxv3E1G5qgXfP1ctCa51VslbugFZ
	XQZpTSwA/QjxIcAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710170715;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tQUmYaZ8SZJnO6WyXdca3SA3sQa2qjbImAqjQsbQLC0=;
	b=0onhxxQ+//YeDP/45ZuhCf9sQ0v4g+2l+7Z8nS526qnGtZ4a/D0Go/QAZa8HcJgrpfJUbb
	EDiUFUYXgBjAcwNgq4ozV6rWqo9Z2VRY209yIV+ZnRpPxofO2ku3d4x2vsXnVgdpe2xMoz
	4n31GW7BviBylYOQw0T7IzUSlNmTgPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710170715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tQUmYaZ8SZJnO6WyXdca3SA3sQa2qjbImAqjQsbQLC0=;
	b=QLEVrCfAh9uCQGogg/O6tJFI+4lQWzDLWF9vomcAhQAxv3E1G5qgXfP1ctCa51VslbugFZ
	XQZpTSwA/QjxIcAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1DB013961;
	Mon, 11 Mar 2024 15:25:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZdrQMVoi72UAfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Mar 2024 15:25:14 +0000
Date: Mon, 11 Mar 2024 16:25:14 +0100
Message-ID: <87y1aordt1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.9
In-Reply-To: <20240311151234.1E821C43399@smtp.kernel.org>
References: <20240311151234.1E821C43399@smtp.kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-3.16 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.86)[99.38%]
Message-ID-Hash: 2HDYTELASQOPLVK3WZFJUKVEO42BMUBG
X-Message-ID-Hash: 2HDYTELASQOPLVK3WZFJUKVEO42BMUBG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2HDYTELASQOPLVK3WZFJUKVEO42BMUBG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 11 Mar 2024 16:12:25 +0100,
Mark Brown wrote:
> 
> The following changes since commit b401b621758e46812da61fa58a67c3fd8d91de0d:
> 
>   Linux 6.8-rc5 (2024-02-18 12:56:25 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.9
> 
> for you to fetch changes up to 6c023ad32b192dea51a4f842cc6ecf89bb6238c9:
> 
>   ASoC: Intel: catpt: Carefully use PCI bitwise constants (2024-03-07 16:47:01 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.9
> 
> This has been quite a small release, there's a lot of driver specific
> cleanups and minor enhancements but hardly anything on the core and only
> one new driver.  Highlights include:
> 
>  - SoundWire support for AMD ACP 6.3 systems.
>  - Support for reporting version information for AVS firmware.
>  - Support DSPless mode for Intel Soundwire systems.
>  - Support for configuring CS35L56 amplifiers using EFI calibration
>    data.
>  - Log which component is being operated on as part of power management
>    trace events.
>  - Support for Microchip SAM9x7, NXP i.MX95 and Qualcomm WCD939x

Pulled now.  Thanks.


Takashi
