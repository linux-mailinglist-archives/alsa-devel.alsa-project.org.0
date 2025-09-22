Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F21B8F7A6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Sep 2025 10:22:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86A4F601F8;
	Mon, 22 Sep 2025 10:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86A4F601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758529367;
	bh=IT7w8ZepnL0LFrCL2VHKZi5Ot5arph80yGQXN0XZUwM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EDB+++5sgVPthTlNnVgX9BmDQrKMmehEuYyPRbNp8hOtIjsCDXc+Akv/pW7VpSAaa
	 5aL6UEhMuX0uk2kWTuYNynmH9PXV1AQu9/C4NSY7fzGaqfnoquQQflEokQAyRV8Phg
	 nSjeufkUTiA517T1hVqOvUELjK9iwc7/4jJMtQsw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA959F805CB; Mon, 22 Sep 2025 10:22:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DEC8F805C8;
	Mon, 22 Sep 2025 10:22:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5871F80254; Mon, 22 Sep 2025 10:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E54DFF800E3
	for <alsa-devel@alsa-project.org>; Mon, 22 Sep 2025 10:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E54DFF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rosC11Ip;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9bispL5/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=rosC11Ip;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9bispL5/
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2E0522273C;
	Mon, 22 Sep 2025 08:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1758529326;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=glyH9ZOGOITwWu1HVftETD+CJLg0nR07lueBBmuvGZ4=;
	b=rosC11IpWGX1kk8sg6/GXqkfRssS+zVSwzchqod6Ho8YFWDcgkYi/w8cT4Mtl/Mjxb2rVF
	ScIREPRTmYiiB2giahN2+a33w26hZdQAyVn1aZWEgoFs7Mazvt893WcpGCR8BvU8P94Pc2
	+/4IqTECa3TEqOjb0Rgduw8LsTUGJ0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758529326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=glyH9ZOGOITwWu1HVftETD+CJLg0nR07lueBBmuvGZ4=;
	b=9bispL5/umak162OJ/aHCwkX3EGya4VMj5QC0uCanlRA+KSGr8+tT7jFwPRqoBIbp6jTBk
	dQNSCPB7Qbx53NCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rosC11Ip;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="9bispL5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1758529326;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=glyH9ZOGOITwWu1HVftETD+CJLg0nR07lueBBmuvGZ4=;
	b=rosC11IpWGX1kk8sg6/GXqkfRssS+zVSwzchqod6Ho8YFWDcgkYi/w8cT4Mtl/Mjxb2rVF
	ScIREPRTmYiiB2giahN2+a33w26hZdQAyVn1aZWEgoFs7Mazvt893WcpGCR8BvU8P94Pc2
	+/4IqTECa3TEqOjb0Rgduw8LsTUGJ0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758529326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=glyH9ZOGOITwWu1HVftETD+CJLg0nR07lueBBmuvGZ4=;
	b=9bispL5/umak162OJ/aHCwkX3EGya4VMj5QC0uCanlRA+KSGr8+tT7jFwPRqoBIbp6jTBk
	dQNSCPB7Qbx53NCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94F8B1388C;
	Mon, 22 Sep 2025 08:22:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b90bIy0H0WhyEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Sep 2025 08:22:05 +0000
Date: Mon, 22 Sep 2025 10:22:05 +0200
Message-ID: <87a52mew2a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Baojun Xu <baojun.xu@ti.com>,
	andriy.shevchenko@linux.intel.com,
	13916275206@139.com,
	alsa-devel@alsa-project.org,
	shenghao-ding@ti.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	k-yi@ti.com,
	henry.lo@ti.com,
	robinchen@ti.com,
	jesse-ji@ti.com,
	will-wang@ti.com,
	jim.shil@goertek.com,
	toastcheng@google.com,
	chinkaiting@google.com
Subject: Re: [PATCH v1] ASoC: tas2781: Correct the wrong description and
 register address on tas2781
In-Reply-To: <aNEFtCV0Gm2koLKv@finisterre.sirena.org.uk>
References: <20250920062044.1904-1-baojun.xu@ti.com>
	<aNEFtCV0Gm2koLKv@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[ti.com,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,gmail.com,kernel.org,goertek.com,google.com];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 2E0522273C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: YMTV6HCTQTL2SOVDVJHJLH7OAW4YFLB5
X-Message-ID-Hash: YMTV6HCTQTL2SOVDVJHJLH7OAW4YFLB5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YMTV6HCTQTL2SOVDVJHJLH7OAW4YFLB5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 22 Sep 2025 10:15:48 +0200,
Mark Brown wrote:
> 
> On Sat, Sep 20, 2025 at 02:20:44PM +0800, Baojun Xu wrote:
> > Correct the wrong description for TAS257X. Combined TAS5825 with TAS2563,
> > as they use the same register address and number.
> > Correct the register address and number for TAS5827.
> 
> This depends on commits in Takashi's tree so it needs to go via there:
> 
> Acked-by: Mark Brown <broonie@kernel.org>

OK, applied now to for-next branch.


thanks,

Takashi
