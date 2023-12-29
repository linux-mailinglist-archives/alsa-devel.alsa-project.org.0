Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F28822219
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:36:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFFC9EC0;
	Tue,  2 Jan 2024 20:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFFC9EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704224169;
	bh=zuLf/I5o7O5D+BJT+nlu/YsVOGhvJlLybYhtbzlkQv8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BYingZBjUXkc4yMZCAwOf8HfShmgG/LR+BF7E41Uy3qy+4T09fS3loHJ7g7eQP8OO
	 Bo+1AB6MgT0/C82voOGg4fTux3rkmLQia+oTEDzrRV/A1T7RXS4ra+Fq1UjH7ob9+b
	 s1pn05o6Tww4782f0zqaOh3rUWh9cSNmZOsSUM8E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECA43F805ED; Tue,  2 Jan 2024 20:35:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B752F805EA;
	Tue,  2 Jan 2024 20:35:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F424F80551; Tue,  2 Jan 2024 20:35:03 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D5E9AF80533
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:34:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5E9AF80533
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Y1SJsrhU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mch25re2;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Y1SJsrhU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mch25re2
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B354022079;
	Fri, 29 Dec 2023 12:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703853943;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I7Wfom3eiZsOxTmsNiOfUqJFjm7nHGnBwz7eB13WVM8=;
	b=Y1SJsrhUaaooLYrM5oqGMT9wqnfNw7LbXg4i3rJkSJrULI0JndLP+e1bOLTLwFgoMYRJKS
	WN/OjKO4Vl4UzlsEVHvHKykt5eBMLhqaClUBMAMzoeiCFwuCLcETnqWcOMbJ40V88ynfTQ
	BuGncbnWFNeC8Q8rSC1Jh6dyfKLUdBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703853943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I7Wfom3eiZsOxTmsNiOfUqJFjm7nHGnBwz7eB13WVM8=;
	b=mch25re2XeVd4pMrCHda6Tuo6sl+ttlPRTb1QHGzlxez5YlCMnxkBU3fKYZMYCNkjnoO04
	l4HMIuq4EKwoRzCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703853943;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I7Wfom3eiZsOxTmsNiOfUqJFjm7nHGnBwz7eB13WVM8=;
	b=Y1SJsrhUaaooLYrM5oqGMT9wqnfNw7LbXg4i3rJkSJrULI0JndLP+e1bOLTLwFgoMYRJKS
	WN/OjKO4Vl4UzlsEVHvHKykt5eBMLhqaClUBMAMzoeiCFwuCLcETnqWcOMbJ40V88ynfTQ
	BuGncbnWFNeC8Q8rSC1Jh6dyfKLUdBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703853943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I7Wfom3eiZsOxTmsNiOfUqJFjm7nHGnBwz7eB13WVM8=;
	b=mch25re2XeVd4pMrCHda6Tuo6sl+ttlPRTb1QHGzlxez5YlCMnxkBU3fKYZMYCNkjnoO04
	l4HMIuq4EKwoRzCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6BE61133E5;
	Fri, 29 Dec 2023 12:45:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fbsuGXe/jmVaaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Dec 2023 12:45:43 +0000
Date: Fri, 29 Dec 2023 13:45:43 +0100
Message-ID: <87y1ddxjm0.wl-tiwai@suse.de>
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
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/tas2781: do not use regcache
In-Reply-To: 
 <491aeed0e2eecc3b704ec856f815db21bad3ba0e.1703202126.git.soyer@irl.hu>
References: 
 <491aeed0e2eecc3b704ec856f815db21bad3ba0e.1703202126.git.soyer@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.89 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-2.79)[99.11%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[ti.com,perex.cz,suse.com,gmail.com,kernel.org,vger.kernel.org,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[]
Authentication-Results: smtp-out1.suse.de;
	none
Message-ID-Hash: 755PJBHSHZZEGA3WRHT27UQLE3D545U4
X-Message-ID-Hash: 755PJBHSHZZEGA3WRHT27UQLE3D545U4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/755PJBHSHZZEGA3WRHT27UQLE3D545U4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 22 Dec 2023 00:48:56 +0100,
Gergo Koteles wrote:
> 
> There are two problems with using regcache in this module.
> 
> The amplifier has 3 addressing levels (BOOK, PAGE, REG). The firmware
> contains blocks that must be written to BOOK 0x8C. The regcache doesn't
> know anything about BOOK, so regcache_sync writes invalid values to the
> actual BOOK.
> 
> The module handles 2 or more separate amplifiers. The amplifiers have
> different register values, and the module uses only one regmap/regcache
> for all the amplifiers. The regcache_sync only writes the last amplifier
> used.
> 
> The module successfully restores all the written register values (RC
> profile, program, configuration, calibration) without regcache.
> 
> Remove regcache functions and set regmap cache_type to REGCACHE_NONE.
> 
> Link: https://lore.kernel.org/r/21a183b5a08cb23b193af78d4b1114cc59419272.1701906455.git.soyer@irl.hu/
> 
> Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
> CC: stable@vger.kernel.org
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Applied to for-linus branch now.  Thanks.


Takashi
