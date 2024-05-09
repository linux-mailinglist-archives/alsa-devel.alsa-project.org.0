Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7B68C1027
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 15:11:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D65EB60;
	Thu,  9 May 2024 15:11:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D65EB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715260271;
	bh=GbED1ASAvUu9cR9cP/ZIvyIeUMu9E2KtmKHRWYzD8IU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kOnDEIagPMCjbUvfbmUH5LFYYFbGEo6wUpj+VunIJXhP4sN1Yh/d/faPcDNIfS8Vc
	 0c74LcuDLuf2DoItKhNJTqIFm9M/6u2QBzhY/W2D71A7RIYK+6pT34YGV1g+7lD+ni
	 yQ1oaRtFe3Rp/+wZosojVfN84UL1eNmursKNvzwQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DF5AF805A0; Thu,  9 May 2024 15:10:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47E58F805A1;
	Thu,  9 May 2024 15:10:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B558F8049C; Thu,  9 May 2024 15:08:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FBA7F800E2
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 15:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FBA7F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sBpwW0mG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=14iwO4pD;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=sBpwW0mG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=14iwO4pD
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9BD065FFEC;
	Thu,  9 May 2024 13:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715260093;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MaznJ7A0eJe7cZnKz2+6GvxYOVW8UckEyNMM7FdU89Q=;
	b=sBpwW0mGLtNvA/9DvjcA7aUpq0u+foiYUjxRHy0zjFsK+lVEGSkIa7YzQhdIviPc1GiQUU
	eDc8l7i7ENMy3eP8QiFw0v4JGx8uMBLsF3ofxXHjwC7GxkAW29lBcHFT+SA7fmCzZ46h4U
	GxMSl2X6A7FL4R/QqST1E3TUTC2KKa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715260093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MaznJ7A0eJe7cZnKz2+6GvxYOVW8UckEyNMM7FdU89Q=;
	b=14iwO4pDtCHQB908XwsBA3xvGyYBg9qSz5+8/HBGePpAT8CXdbqqzu9dDrpzFQPYB7RGbW
	Df/pIUiznSw4QMAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sBpwW0mG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=14iwO4pD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715260093;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MaznJ7A0eJe7cZnKz2+6GvxYOVW8UckEyNMM7FdU89Q=;
	b=sBpwW0mGLtNvA/9DvjcA7aUpq0u+foiYUjxRHy0zjFsK+lVEGSkIa7YzQhdIviPc1GiQUU
	eDc8l7i7ENMy3eP8QiFw0v4JGx8uMBLsF3ofxXHjwC7GxkAW29lBcHFT+SA7fmCzZ46h4U
	GxMSl2X6A7FL4R/QqST1E3TUTC2KKa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715260093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MaznJ7A0eJe7cZnKz2+6GvxYOVW8UckEyNMM7FdU89Q=;
	b=14iwO4pDtCHQB908XwsBA3xvGyYBg9qSz5+8/HBGePpAT8CXdbqqzu9dDrpzFQPYB7RGbW
	Df/pIUiznSw4QMAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A26013A24;
	Thu,  9 May 2024 13:08:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mZ7FFL3KPGbAawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 May 2024 13:08:13 +0000
Date: Thu, 09 May 2024 15:08:28 +0200
Message-ID: <87v83n9lpv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>,
	<hdegoede@redhat.com>,
	<rafael@kernel.org>
Subject: Re: [PATCH 1/2] ALSA: hda: intel-dsp-config: Switch to ACPI NHLT
In-Reply-To: <87zfsz9n8d.wl-tiwai@suse.de>
References: <20240419084307.2718881-1-cezary.rojewski@intel.com>
	<20240419084307.2718881-2-cezary.rojewski@intel.com>
	<892ad456-cfe5-4ff1-ab67-7709677608cd@intel.com>
	<87zfsz9n8d.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9BD065FFEC
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,intel.com:email];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: VQJI4DZUM2RG4TQBJXKJ3ONFA5WBAHP4
X-Message-ID-Hash: VQJI4DZUM2RG4TQBJXKJ3ONFA5WBAHP4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VQJI4DZUM2RG4TQBJXKJ3ONFA5WBAHP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 May 2024 14:35:46 +0200,
Takashi Iwai wrote:
> 
> On Thu, 09 May 2024 13:15:15 +0200,
> Cezary Rojewski wrote:
> > 
> > On 2024-04-19 10:43 AM, Cezary Rojewski wrote:
> > > From: Amadeusz S³awiñski <amadeuszx.slawinski@linux.intel.com>
> > > 
> > > Now that NHLT support in ACPI framework was introduced, migrate
> > > intel-dsp-config driver to new API.
> > 
> > Hello,
> > 
> > I see that this patch has not landed in Mark's for-next. Takashi,
> > what's the verdict here? Should this go entirely (entire patchset)
> > through Mark or should the NHLT changes [1] plus this patch alone be
> > incorporated into for-next of yours separately?
> 
> OK, I took the patch now to my tree.

... and it turned out that this doesn't work easily because
include/linux/acpi/nhlt.h isn't a part of Linus tree yet.  I'd need to
pull the change via an immutable branch or such at first.

I don't know how Mark applied the ASoC patch, but if that actually
worked, it's better to take from his tree.  Or, in such a case, at
best to be merged through the tree where the new API got introduced
(i.e. ACPI tree).

In anyway, feel free to take my ack for the patch

Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

> 
> 
> thanks,
> 
> Takashi
> 
> 
> > 
> > 
> > [1]:
> > https://lore.kernel.org/linux-acpi/20240319083018.3159716-1-cezary.rojewski@intel.com/
> > 
> > 
> > Kind regards,
> > Czarek
