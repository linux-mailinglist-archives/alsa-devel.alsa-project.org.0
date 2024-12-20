Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFAD9F92D7
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2024 14:11:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75EBA60234;
	Fri, 20 Dec 2024 14:11:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75EBA60234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734700282;
	bh=TGHi3YXSvx0RI/w/dqizyLWvh/b2qLsTKEeodSkdRBw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vRxKFv5uy3f6w7TOH27TKCDudFTkuRV21AoDf0jnKZp9l1+wVJ77B4a93WDMr7f5Z
	 HAnQ3hlXc5ZKT8CxvmH+Yy2/s+lJtC+wFtO0qj9BGIe334NlCSrAHMOVKytiS6Zlm/
	 9m3P6XYiNMFIGEsgsJfAe/hiqWcqM1xLICM+uEw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B6F0F805AC; Fri, 20 Dec 2024 14:10:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFF64F805C0;
	Fri, 20 Dec 2024 14:10:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF9BCF80508; Fri, 20 Dec 2024 14:10:42 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A3450F800B0
	for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2024 14:10:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3450F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=mGpHwcyD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vxoCkGoc;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=mGpHwcyD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vxoCkGoc
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5B956210E4;
	Fri, 20 Dec 2024 13:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1734700239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aPvscbayyS+x2yJ87WRsObeSyrV3blrsK/yMde5yubE=;
	b=mGpHwcyD/MH6v9yWILiNv4B7piFQ8euo/AZD2jGPsHR59eH5Gc6bH3kOvyot1XfC7ce6Qb
	v1rl+b/xSpCsK9dnhskOl9OF2WEAC70gboq+AIP7fduF5dIW1WEYJjTLzasgom93YPXWb/
	LOzGSCORGWfOaIHft2McTaiVMR0qoZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734700239;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aPvscbayyS+x2yJ87WRsObeSyrV3blrsK/yMde5yubE=;
	b=vxoCkGocOSAqys6Kdq53+xkemNlA1ll+InXu3m4Td8FzySa1eUOTKQd1jryu8y9bRZV/7p
	LEgjufM5is+e9aBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mGpHwcyD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vxoCkGoc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1734700239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aPvscbayyS+x2yJ87WRsObeSyrV3blrsK/yMde5yubE=;
	b=mGpHwcyD/MH6v9yWILiNv4B7piFQ8euo/AZD2jGPsHR59eH5Gc6bH3kOvyot1XfC7ce6Qb
	v1rl+b/xSpCsK9dnhskOl9OF2WEAC70gboq+AIP7fduF5dIW1WEYJjTLzasgom93YPXWb/
	LOzGSCORGWfOaIHft2McTaiVMR0qoZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734700239;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aPvscbayyS+x2yJ87WRsObeSyrV3blrsK/yMde5yubE=;
	b=vxoCkGocOSAqys6Kdq53+xkemNlA1ll+InXu3m4Td8FzySa1eUOTKQd1jryu8y9bRZV/7p
	LEgjufM5is+e9aBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11EB113A63;
	Fri, 20 Dec 2024 13:10:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VWqcAM9sZWehNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Dec 2024 13:10:39 +0000
Date: Fri, 20 Dec 2024 14:10:29 +0100
Message-ID: <87pllmts8q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.13-rc3
In-Reply-To: <67e8fb989f3a3f402356388ebf7db4ab.broonie@kernel.org>
References: <67e8fb989f3a3f402356388ebf7db4ab.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 5B956210E4
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: LWSAXRVPEGTGXIV4EKOIM2Y2ZW2HJTSK
X-Message-ID-Hash: LWSAXRVPEGTGXIV4EKOIM2Y2ZW2HJTSK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LWSAXRVPEGTGXIV4EKOIM2Y2ZW2HJTSK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 20 Dec 2024 13:50:43 +0100,
Mark Brown wrote:
> 
> The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:
> 
>   Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.13-rc3
> 
> for you to fetch changes up to 32c9c06adb5b157ef259233775a063a43746d699:
> 
>   ASoC: mediatek: disable buffer pre-allocation (2024-12-19 11:15:09 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.13
> 
> A mix of quirks and small fixes, nothing too major anywhere.

Pulled now.  Thanks.


Takashi
