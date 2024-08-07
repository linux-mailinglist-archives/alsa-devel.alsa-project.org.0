Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEAC949FD2
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 08:29:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6E9D191C;
	Wed,  7 Aug 2024 08:29:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6E9D191C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723012194;
	bh=doEkfBty8yHnkmU/dcv+esAHbqQm4ati1no+D/5AJuA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YEq6IwDSKf4zk7Ti946TWvTwANpgn6e7u6m2VmWW1ONNvreDAjl4MQjqWj/cmkabl
	 LngEbqpb0/ukag5vcBYO9l1Sd6/J8QTBOe2NCEjb4PvgYNpyIOuwvcR0qsSBy330td
	 h4PFQwCSmLKJjXeWlVVuV471WkTAPJ39wixjECL8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA0C5F805AC; Wed,  7 Aug 2024 08:29:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BAA8F805AE;
	Wed,  7 Aug 2024 08:29:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C708F802DB; Wed,  7 Aug 2024 08:29:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D764EF800BF
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 08:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D764EF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=XXU6ANtz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cUCyH7GZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=XXU6ANtz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cUCyH7GZ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7C1A121C48;
	Wed,  7 Aug 2024 06:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723012145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RL3/QfkcciWS0BIa0+EWxe5Gq3RZMv71W//0V0q0gAU=;
	b=XXU6ANtz+ICqQ03tx8ZCD+7fgkendJYpQKlper3SrboK9hCmyEwm6IwWNxdg/eqkAbZF8s
	5gt+F1yyadi12R8BnSAlZRWcKfBa463v2rgc2pqI3agBpRhd2U5W8H37i0tpPrHLssf1Kl
	6M2HHzejyzMRKbyg9zaxeTzQbb4loUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723012145;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RL3/QfkcciWS0BIa0+EWxe5Gq3RZMv71W//0V0q0gAU=;
	b=cUCyH7GZJ+FmCiZfBqe+u7AcuNOymgLQpfCssldMxHfEgNinzA5OT3ykTXSWGsxwI09dWj
	avbwhQQH+bhqdQAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723012145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RL3/QfkcciWS0BIa0+EWxe5Gq3RZMv71W//0V0q0gAU=;
	b=XXU6ANtz+ICqQ03tx8ZCD+7fgkendJYpQKlper3SrboK9hCmyEwm6IwWNxdg/eqkAbZF8s
	5gt+F1yyadi12R8BnSAlZRWcKfBa463v2rgc2pqI3agBpRhd2U5W8H37i0tpPrHLssf1Kl
	6M2HHzejyzMRKbyg9zaxeTzQbb4loUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723012145;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RL3/QfkcciWS0BIa0+EWxe5Gq3RZMv71W//0V0q0gAU=;
	b=cUCyH7GZJ+FmCiZfBqe+u7AcuNOymgLQpfCssldMxHfEgNinzA5OT3ykTXSWGsxwI09dWj
	avbwhQQH+bhqdQAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5B33413297;
	Wed,  7 Aug 2024 06:29:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /jTFFDEUs2aqVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 06:29:05 +0000
Date: Wed, 07 Aug 2024 08:29:44 +0200
Message-ID: <875xsc976v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Dustin L. Howett" <dustin@howett.net>
Cc: alsa-devel@alsa-project.org,
	Kieran Levin <ktl@frame.work>
Subject: Re: [PATCH] ALSA: hda/realtek: Add Framework Laptop 13 (Intel Core
 Ultra) to quirks
In-Reply-To: 
 <20240806-alsa-hda-realtek-add-framework-laptop-13-intel-core-ultra-to-quirks-v1-1-42d6ce2dbf14@howett.net>
References: 
 <20240806-alsa-hda-realtek-add-framework-laptop-13-intel-core-ultra-to-quirks-v1-1-42d6ce2dbf14@howett.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: SDMNSRBKYJHF54AL5BDLXQCBAJEWH7FC
X-Message-ID-Hash: SDMNSRBKYJHF54AL5BDLXQCBAJEWH7FC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SDMNSRBKYJHF54AL5BDLXQCBAJEWH7FC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Aug 2024 04:33:51 +0200,
Dustin L. Howett wrote:
> 
> The Framework Laptop 13 (Intel Core Ultra) has an ALC285 that ships in a
> similar configuration to the ALC295 in previous models. It requires the
> same quirk for headset detection.
> 
> ---

This dash line makes your Signed-off-by tag below trimmed at applying
git-am.  At the next time, don't put that.

> Signed-off-by: Dustin L. Howett <dustin@howett.net>

Applied the patch now to for-linus branch.


Thanks!

Takashi
