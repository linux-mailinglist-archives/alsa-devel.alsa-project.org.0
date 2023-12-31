Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7EA8221C1
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:08:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 411E9EB0;
	Tue,  2 Jan 2024 20:08:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 411E9EB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704222531;
	bh=4/Boj2ab0V7qtEyROU+UoYB7mc+cHHRsevRmvPK77DI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JOFmoXJQsm26NgNzmnpZIL/tv2Ylpev4+KjShmz9SGpkYd9+sxLN+LJ8xB+7baYch
	 i9gqmdbTjQMAHQKbo5w70DGazKqeKI68l3onUJTNuLMdIU3VB/EMITvf9FFR/m6EeN
	 iTVuiQ2RMzDGJePfgnM0SoqfndRJIudqx3/AOH/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E489F80683; Tue,  2 Jan 2024 20:06:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC7DDF80691;
	Tue,  2 Jan 2024 20:06:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FB67F80579; Tue,  2 Jan 2024 20:04:07 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 94338F8065B
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 19:59:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94338F8065B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HZVxcC/y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=T5ztKVj1;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=HZVxcC/y;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=T5ztKVj1
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 22E3421DFB;
	Sun, 31 Dec 2023 08:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704011624;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N4RTRshVREzFDoQShoQSeJ7L1xCrv3rMfCKwpXDSiu4=;
	b=HZVxcC/yybZy9ySs7R1EzckIbpfuTkvqsqaGiunMvFXeP0u/PWrW7ktJmLQO7ihlMWx6rR
	9nuGxmsxp1tD50YZLX7GMmpiSzsurMftAsXFMU4cU2VcTcAUiORHrXmRTC21aQIToX7m0Z
	gsqw7b5xpKmOVAL+CiDLa/B0byxFgbE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704011624;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N4RTRshVREzFDoQShoQSeJ7L1xCrv3rMfCKwpXDSiu4=;
	b=T5ztKVj1Pk/2MNK6+rQHZd7Q0j92pkpdLJfYYfbyMMurDW0n3iYSVV6z6auWlXDEo1xSmE
	wVVRnlF0bfXm6HAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704011624;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N4RTRshVREzFDoQShoQSeJ7L1xCrv3rMfCKwpXDSiu4=;
	b=HZVxcC/yybZy9ySs7R1EzckIbpfuTkvqsqaGiunMvFXeP0u/PWrW7ktJmLQO7ihlMWx6rR
	9nuGxmsxp1tD50YZLX7GMmpiSzsurMftAsXFMU4cU2VcTcAUiORHrXmRTC21aQIToX7m0Z
	gsqw7b5xpKmOVAL+CiDLa/B0byxFgbE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704011624;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N4RTRshVREzFDoQShoQSeJ7L1xCrv3rMfCKwpXDSiu4=;
	b=T5ztKVj1Pk/2MNK6+rQHZd7Q0j92pkpdLJfYYfbyMMurDW0n3iYSVV6z6auWlXDEo1xSmE
	wVVRnlF0bfXm6HAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B96031398B;
	Sun, 31 Dec 2023 08:33:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4JsKKmcnkWWkHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 31 Dec 2023 08:33:43 +0000
Date: Sun, 31 Dec 2023 09:33:43 +0100
Message-ID: <87cyumwz2w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 0/4] ALSA: hda/tas2781: Add tas2563 support
In-Reply-To: <3933d97638cfe57de5f9651b1f9a168bf88e43a5.camel@irl.hu>
References: <cover.1701906455.git.soyer@irl.hu>
	<cover.1703891777.git.soyer@irl.hu>
	<87il4fwrs1.wl-tiwai@suse.de>
	<3933d97638cfe57de5f9651b1f9a168bf88e43a5.camel@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.67 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[ti.com,perex.cz,suse.com,gmail.com,kernel.org,vger.kernel.org,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.02)[54.96%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="HZVxcC/y";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=T5ztKVj1
X-Rspamd-Queue-Id: 22E3421DFB
Message-ID-Hash: ZYVKRBPXIFO4SKXQCAK5LSEA3B34HYQU
X-Message-ID-Hash: ZYVKRBPXIFO4SKXQCAK5LSEA3B34HYQU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZYVKRBPXIFO4SKXQCAK5LSEA3B34HYQU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 30 Dec 2023 21:18:06 +0100,
Gergo Koteles wrote:
> 
> Hi Takashi,
> 
> On Sat, 2023-12-30 at 17:59 +0100, Takashi Iwai wrote:
> > Thanks, I guess I'll take this series later for 6.8 unless any
> > objection is raised from reviewers.
> > 
> > But, I'd like to hear clarifications of some points beforehand:
> > 
> > - Did we get consensus about the ACPI HID?  I didn't follow the
> >   previous thread completely.
> > 
> 
> The INT8866 is a (wrong) PNP ID, that should only be used by the owner
> "Interphase Corporation".
> Intel has also mistakenly used the INT PNP prefix in the past, and now
> TI/leNovo.

Yeah, and the question is whether TI / Lenovo recognize the problem
and will avoid such a failure in future again.

> >   Since those models have been already in the market for quite some
> >   time, we'd have to accept "INT8866", I'm afraid.  But it's still
> >   very important to know whether a similar problem can be avoided in
> >   future.
> > 
> > - Will be the firmware files upstreamed to linux-firmware tree later?
> >   Otherwise users will have significant difficulties.
> 
> Shenghao sent the two files to linux-firmware@kernel.org a few days
> ago, but I think the "Allegedly GPLv2+ ... Found in hex form in kernel
> source." Licence needs to be fixed before acceptance.

OK, that sounds promising.

> But even if it is not included in the linux-firmware package, it is
> easier for users to put two files in place per OS installation than
> patching the kernel.

Sure.


thanks,

Takashi
