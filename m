Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF90F845817
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 13:50:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EE0A85D;
	Thu,  1 Feb 2024 13:50:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EE0A85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706791817;
	bh=73yNjbX3V5CwANTEQjLTld89ILQCh/j/Q6b2MYKvOug=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vBY8ws3WiXRHDF9mMZo8g0RqW2gikMq7oeu8VSWbHyGNEjbQM9BIPbvb6FKzf3UKf
	 K9/U6Q7ihzhtfUhYwnsNG0Wc7AqH5A17JTZaNrpMEFJ/DT695jDXOp0koBUEk36mAM
	 rHfO2z03JNnWLEwpNw+VQXinrQjW75s1/TX9/v0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77B89F8058C; Thu,  1 Feb 2024 13:49:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBC61F805A8;
	Thu,  1 Feb 2024 13:49:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3094DF8055C; Thu,  1 Feb 2024 13:49:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0BF4F80548
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 13:49:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0BF4F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sVkuvq9M;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=U3iAOdW4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=igZEU4SK;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5n7VExPE
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E79B61FB83;
	Thu,  1 Feb 2024 12:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706791775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0OPATdqXvb+caoegnnSuXx1SUc1odadlEih9NfSLUgs=;
	b=sVkuvq9My99tel6yzls+aOPbmI5KRf2qL6l4MgCTWKRZLCxJrpAGURLWLPE3tKKo5vRt16
	5YLG9O9ZasCyiEf1H0Yeigsr/Zyo7c6+WRqB2NcAJfV/tVb2ShJeICKfmNIMBeLGGG6Zgk
	WTbazjGlEuEmFzsKlh4e2i9QCpjiBDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706791775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0OPATdqXvb+caoegnnSuXx1SUc1odadlEih9NfSLUgs=;
	b=U3iAOdW4Mhkj2iThF5ZtIKItLDpdXCEseESa7zVN4wxEPqCxcY400oVuPch5xsKMCZ+7bY
	Hvb5oKkNtw5kWWAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706791774;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0OPATdqXvb+caoegnnSuXx1SUc1odadlEih9NfSLUgs=;
	b=igZEU4SKS2Hu9A5IDMqwX9MDFkJ9hQUfhB6qKDGEceK6QjdnB4EXiZoOA+AL/JidoftTsI
	QjRe0szEKCJPz8SI0Z00GWAphEb+nLV8ls+z4szoF18sSEk3XMB6UDAy3P2DI3Mdye6upy
	JL5QAjIxg4G6M93N8Qi5NRTsx1r2I58=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706791774;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0OPATdqXvb+caoegnnSuXx1SUc1odadlEih9NfSLUgs=;
	b=5n7VExPEYQcJR3mjewXySgWcwTfX1DyLpogo/QHlF6xs4za9C6VuNJRkIR4ONS2A/YBQ/a
	HVBWwDHJX29KvgBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD037139B1;
	Thu,  1 Feb 2024 12:49:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WJwOKV6Tu2XkOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Feb 2024 12:49:34 +0000
Date: Thu, 01 Feb 2024 13:49:34 +0100
Message-ID: <87msskz6w1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 00/18] ALSA: Various fixes for Cirrus Logic CS35L56
 support
In-Reply-To: <1cc8d9c7-2af5-43f1-a022-75624deae51f@sirena.org.uk>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
	<1cc8d9c7-2af5-43f1-a022-75624deae51f@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=igZEU4SK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5n7VExPE
X-Spamd-Result: default: False [-0.39 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.08)[87.99%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E79B61FB83
X-Spamd-Bar: /
Message-ID-Hash: OBYCE4UY4O3KJNUOKG6VMSIJQ2HCGKT3
X-Message-ID-Hash: OBYCE4UY4O3KJNUOKG6VMSIJQ2HCGKT3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBYCE4UY4O3KJNUOKG6VMSIJQ2HCGKT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 01 Feb 2024 13:47:38 +0100,
Mark Brown wrote:
> 
> On Mon, Jan 29, 2024 at 04:27:19PM +0000, Richard Fitzgerald wrote:
> > This chain of patches fixes various things that were undocumented, unknown
> > or uncertain when the original driver code was written. And also a few
> > things that were just bugs.
> > 
> > The HDA patches have dependencies on the ASoC patches, except for the final
> > patch that removes a bogus test stub function.
> 
> Takashi, should I apply the ALSA bits of this via ASoC?

Judging from the amount, better to go through your tree.
Please go ahead.


thanks,

Takashi
