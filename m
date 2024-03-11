Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8BC877B92
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 09:15:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0078EBC0;
	Mon, 11 Mar 2024 09:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0078EBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710144948;
	bh=FVllI8QtFIZjIjnFvsA8JdzVNs0CfuBSrBpd59Qk24M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BomokDZf0JFlNbtIXMldPMdpZi5KhW/0cAsr3KFItkfgOlbdixn454vn6oox3zAbf
	 th5M+/cC4uwRb0f7qenO7ICeVQTYITHwXqs3mCJQmx6+qyyxLRbfWyvo0INvhYHX+s
	 SD+y3sHpEW3rvagJFkLTaLblo/VSsNvdtRTLnw+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAFFEF805A9; Mon, 11 Mar 2024 09:15:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7A4FF80571;
	Mon, 11 Mar 2024 09:15:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74DB5F8028D; Mon, 11 Mar 2024 09:15:10 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C616BF800E4
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 09:15:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C616BF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=f7lgkKtM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=I6y/si1t;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=f7lgkKtM;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=I6y/si1t
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BAE59349CA;
	Mon, 11 Mar 2024 08:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710144902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JjwpVhv0qVF2xZiPxWjWjVpiLGlOhSeZIiEq/w2dGR4=;
	b=f7lgkKtMwMV2hIDIYXvXVPR9zINayVgPSLIq9mR5P5vQi+rabKkfVjr6VCxXDR1wtjGGFd
	WOQedzNpXA2Zbu5dZZSHePjl3DIvs6p6DBYfT4BCJEeDvOks4B8+oY0ONUjrDSTRqXjbth
	8FjDnJan9t07anoDRfgY0MN7MVmlOow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710144902;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JjwpVhv0qVF2xZiPxWjWjVpiLGlOhSeZIiEq/w2dGR4=;
	b=I6y/si1td0owmJpP1ib1zLHSw9Jmfq0xmPdypbAgjybXc+nOKnZIcZYavk47jEMs3XF7jD
	kZZknlfWx9FDy8Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710144902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JjwpVhv0qVF2xZiPxWjWjVpiLGlOhSeZIiEq/w2dGR4=;
	b=f7lgkKtMwMV2hIDIYXvXVPR9zINayVgPSLIq9mR5P5vQi+rabKkfVjr6VCxXDR1wtjGGFd
	WOQedzNpXA2Zbu5dZZSHePjl3DIvs6p6DBYfT4BCJEeDvOks4B8+oY0ONUjrDSTRqXjbth
	8FjDnJan9t07anoDRfgY0MN7MVmlOow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710144902;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JjwpVhv0qVF2xZiPxWjWjVpiLGlOhSeZIiEq/w2dGR4=;
	b=I6y/si1td0owmJpP1ib1zLHSw9Jmfq0xmPdypbAgjybXc+nOKnZIcZYavk47jEMs3XF7jD
	kZZknlfWx9FDy8Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6865A1383D;
	Mon, 11 Mar 2024 08:15:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VFWoF4a97mXeaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Mar 2024 08:15:02 +0000
Date: Mon, 11 Mar 2024 09:15:01 +0100
Message-ID: <87plw1b2wq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] ALSA: hda/tas2781: restore power state after
 system_resume
In-Reply-To: <cover.1709918447.git.soyer@irl.hu>
References: <cover.1709918447.git.soyer@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f7lgkKtM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="I6y/si1t"
X-Spamd-Result: default: False [-1.75 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.44)[97.42%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Queue-Id: BAE59349CA
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: RZWBJIFXKEMFWJUBFFFNTOICAYU4TREL
X-Message-ID-Hash: RZWBJIFXKEMFWJUBFFFNTOICAYU4TREL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZWBJIFXKEMFWJUBFFFNTOICAYU4TREL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 08 Mar 2024 18:41:39 +0100,
Gergo Koteles wrote:
> 
> This series makes some simplifications, speeding up the start of the 
> playback and restoring the power state of the amplifiers after 
> system_resume.
> 
> Gergo Koteles (5):
>   ALSA: hda/tas2781: use dev_dbg in system_resume
>   ALSA: hda/tas2781: add lock to system_suspend
>   ALSA: hda/tas2781: do not reset cur_* values in runtime_suspend
>   ALSA: hda/tas2781: do not call pm_runtime_force_* in
>     system_resume/suspend
>   ALSA: hda/tas2781: restore power state after system_resume

Applied all patches now.  Thanks.


Takashi
