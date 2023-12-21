Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E99B81B03D
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 09:24:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE909DF2;
	Thu, 21 Dec 2023 09:23:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE909DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703147044;
	bh=lGw9IxlH0mMn6MUopTeKAiL+lkFxkrfkqea/YHoewHY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rJfR+UlN4DeIo+I06zxA6DSiBApdpwM3RWiVaevShLtNiWXP5824rMg21gPLha4Hk
	 FG6a2E4LPDjFRNXsqgD5wRCYS84gtuufh9rq3kaCilMhyoY5Um6eI4OdfA33+cWs9p
	 uQ5/U2NILwlrZm9yNV5LpdHLzxAHA7pnVdJ8UTgQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F7C2F80578; Thu, 21 Dec 2023 09:23:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 936CAF80571;
	Thu, 21 Dec 2023 09:23:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2828F80153; Thu, 21 Dec 2023 09:23:26 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C0AACF800D2
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 09:23:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0AACF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Dzc3cSB1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+bTzSugx;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Dzc3cSB1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+bTzSugx
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 50D8421A7D;
	Thu, 21 Dec 2023 08:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703146998;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ETCmlj8QhOlseKbzXN1E12xZ8w7MP8vejthvIoUcnTc=;
	b=Dzc3cSB14VZKeLrCAAsqtgIkIc4sjioMC51BFFu+1QArJi7xk3Xx6IVt2iJJEXu3xNpOKi
	Oc4DA2vcRpAX4lXBkauuBwiCPWwoAnE3H++WYWEPNcyyoygng3l8eMGJLkNlU0qVFfO1D5
	ll9lAQ6uXfgVruxuc6KoGvglMiPt8bA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703146998;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ETCmlj8QhOlseKbzXN1E12xZ8w7MP8vejthvIoUcnTc=;
	b=+bTzSugxXq4WRHA32hz43UXsPbAxISVuBhc/t8wn0wgA7OJTR2oInaIWMhpanJdeu3ePfU
	LzYjk3lZ4zJet6Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703146998;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ETCmlj8QhOlseKbzXN1E12xZ8w7MP8vejthvIoUcnTc=;
	b=Dzc3cSB14VZKeLrCAAsqtgIkIc4sjioMC51BFFu+1QArJi7xk3Xx6IVt2iJJEXu3xNpOKi
	Oc4DA2vcRpAX4lXBkauuBwiCPWwoAnE3H++WYWEPNcyyoygng3l8eMGJLkNlU0qVFfO1D5
	ll9lAQ6uXfgVruxuc6KoGvglMiPt8bA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703146998;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ETCmlj8QhOlseKbzXN1E12xZ8w7MP8vejthvIoUcnTc=;
	b=+bTzSugxXq4WRHA32hz43UXsPbAxISVuBhc/t8wn0wgA7OJTR2oInaIWMhpanJdeu3ePfU
	LzYjk3lZ4zJet6Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39E9513AC2;
	Thu, 21 Dec 2023 08:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p38IDfb1g2USIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 21 Dec 2023 08:23:18 +0000
Date: Thu, 21 Dec 2023 09:23:09 +0100
Message-ID: <s5h5y0sufpu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.7-rc7
In-Reply-To: <20231220132011.3D651C433CB@smtp.kernel.org>
References: <20231220132011.3D651C433CB@smtp.kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [0.89 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.01)[44.98%]
Authentication-Results: smtp-out1.suse.de;
	none
Message-ID-Hash: SZ4XCALE7CAUQB6ZEPHSACNDXUDVXP4T
X-Message-ID-Hash: SZ4XCALE7CAUQB6ZEPHSACNDXUDVXP4T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZ4XCALE7CAUQB6ZEPHSACNDXUDVXP4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 20 Dec 2023 14:20:03 +0100,
Mark Brown wrote:
> 
> The following changes since commit 0a10d15280a385e5971fb58a6d2eddbf7c0aa9f3:
> 
>   ASoC: qcom: Limit Digital gains on speaker (2023-12-04 21:42:29 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.7-rc7
> 
> for you to fetch changes up to 8f0f01647550daf9cd8752c1656dcb0136d79ce1:
> 
>   ASoC: fsl_sai: Fix channel swap issue on i.MX8MP (2023-12-19 13:23:39 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.7
> 
> Quite a big collection of fixes, as ever mostly in drivers.  There's one
> framework fix for the HDMI CODEC where it wasn't handling startup
> properly for some controllers, and one new x86 quirk, but otherwise all
> local fixes or dropping things we don't want to see in a release.

Thanks, pulled now.


Takashi
