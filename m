Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D27812E24
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 12:07:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F067950;
	Thu, 14 Dec 2023 12:07:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F067950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702552046;
	bh=aZd0ZEJFJrakJmNwnGh9+SlCxNKnzV8ovocOltUVZWM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EqrffR4s3QKN0mSwKouOQdN3z63d/+Cj8yuneYr2wJ/b9Ldi+9qtSPXYJbYNHdGnz
	 g91DJRkEVnGmXIIbmGdM9GRw2BogIkLcd2kmxJ4hqkIQPe2gxBVBvVIEzaARmEeown
	 2mpxJRmrK413NwYjHr74t8Y/Eak8B4QLWFHJa+7o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B614F805BE; Thu, 14 Dec 2023 12:06:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26A52F805E6;
	Thu, 14 Dec 2023 12:06:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8E80F8016A; Thu, 14 Dec 2023 12:05:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F16FF8001F
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 12:05:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F16FF8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QhD1r8Ka;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1BL54thY;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Juks4PQG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=meOGCL4w
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D8C701F7C5;
	Thu, 14 Dec 2023 11:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702551923;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jh37XTpPgpC2e/hQvtSi2xLMjUa4CLQ/Qc/4iU+ctz8=;
	b=QhD1r8KaNEnVlUiKbnubxJCrqYOdYnKAv8yx6nfxbPiYeVXYYlr80UGEDucDxWeJFXzkv8
	Pkxjkh1GdLDme0PojFw+wITS4K1WchK83pPixo8QMJ9o4GA9Qmo1PRCCupLEVDFqbmJnGg
	jG06Cfp3tYENU3AbZlyImW6wga2oD5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702551923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jh37XTpPgpC2e/hQvtSi2xLMjUa4CLQ/Qc/4iU+ctz8=;
	b=1BL54thYGVy/fgg4y0NQVekCcFPlpbPdyE9DB7zb3UCRlfSxSPruU2LNHqSz0SH2jZtRVH
	/wJ0XhtpEJ6peXAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702551922;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jh37XTpPgpC2e/hQvtSi2xLMjUa4CLQ/Qc/4iU+ctz8=;
	b=Juks4PQGiBnzKLV4rBuaIEt83E+4s01zPghD6/57nHXY7Oua5zbFkmd/9sAn9M/MxC4I49
	QoZdlm1TDbX5Z1Hh7j1jXAq6xdqxTSoMR5kSlklVXygG1TZ+Uf0TmJE3Qd/JdzRzbTGlvo
	UlflqhTW0enE4d7+iQ0zm0vs1Q+mmSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702551922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jh37XTpPgpC2e/hQvtSi2xLMjUa4CLQ/Qc/4iU+ctz8=;
	b=meOGCL4wEyUo5NiQk+oYjFsoFTlUC4kJOvFwXFflJLRe6nllAqXyaDBaMc2wfzutE9nikp
	zT9OWayuyFk2ODDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F8D1137E8;
	Thu, 14 Dec 2023 11:05:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id f8eRIXLhemUwZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 14 Dec 2023 11:05:22 +0000
Date: Thu, 14 Dec 2023 12:05:22 +0100
Message-ID: <87cyv9qc25.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/tas2781: reset the amp before component_add
In-Reply-To: 
 <4d23bf58558e23ee8097de01f70f1eb8d9de2d15.1702511246.git.soyer@irl.hu>
References: 
 <4d23bf58558e23ee8097de01f70f1eb8d9de2d15.1702511246.git.soyer@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.87 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[irl.hu:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.77)[98.99%]
Message-ID-Hash: FMBMYGEBZWKINFP3GJHSRWUPEZBCD4YY
X-Message-ID-Hash: FMBMYGEBZWKINFP3GJHSRWUPEZBCD4YY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FMBMYGEBZWKINFP3GJHSRWUPEZBCD4YY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 14 Dec 2023 00:49:20 +0100,
Gergo Koteles wrote:
> 
> Calling component_add starts loading the firmware, the callback function
> writes the program to the amplifiers. If the module resets the
> amplifiers after component_add, it happens that one of the amplifiers
> does not work because the reset and program writing are interleaving.
> 
> Call tas2781_reset before component_add to ensure reliable
> initialization.
> 
> Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
> CC: stable@vger.kernel.org
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Thanks, applied now.


Takashi
