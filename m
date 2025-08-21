Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8597CB2EF26
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Aug 2025 09:13:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D64F860219;
	Thu, 21 Aug 2025 09:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D64F860219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755760392;
	bh=BYRNFkireHleEmmy0KTdwkXPjUC2Xdzolhv+YEAvMj4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M2PJSYJ3Xd6BV5QLtSP1o/WR0LZhYS5X+nTpRp2+Vi073h0nYK52bwXIcPas6uX40
	 dJ/quCd/1Zx+T2w3UGbY8NuO9rMX9wj9y2tavdNh5iQ08GMKx6jtBY3bHiD97eeM09
	 DCYDFhJMmfKIfT3iPtqX3x+s8BchQ5okSugEhO44=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F912F805CA; Thu, 21 Aug 2025 09:12:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADFFFF805CA;
	Thu, 21 Aug 2025 09:12:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 220C8F80518; Thu, 21 Aug 2025 09:12:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BBA94F80254
	for <alsa-devel@alsa-project.org>; Thu, 21 Aug 2025 09:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBA94F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=GpsF0yAX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iTG1BXdv;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=GpsF0yAX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iTG1BXdv
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7D4D221C35;
	Thu, 21 Aug 2025 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1755760332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NmfHWW0jFWPbjBVrxTprBSeQrh06MCbgYee85N8Q44o=;
	b=GpsF0yAXqVbJDkL92N0CBMQks4gAifwhJEiF+SZUKLHMtmY048WQzkdQL4BuffW11sr0k8
	tpmq6WB/5EjbwLMFWxlOKHbVHxf/by2wml/dswIdoNA6M5PUnfRFBLzWu4DlvAugft2QLQ
	AWI7QgthXTppwLGBV73dt/QKb/U84YY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755760332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NmfHWW0jFWPbjBVrxTprBSeQrh06MCbgYee85N8Q44o=;
	b=iTG1BXdv84suosNVe50vwIU8YzOLcsT7wBwDPMfWgslhZt3jLcNcpYgcV8ZgBXjMRzd2rX
	CczX5QbX70ghhDBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1755760332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NmfHWW0jFWPbjBVrxTprBSeQrh06MCbgYee85N8Q44o=;
	b=GpsF0yAXqVbJDkL92N0CBMQks4gAifwhJEiF+SZUKLHMtmY048WQzkdQL4BuffW11sr0k8
	tpmq6WB/5EjbwLMFWxlOKHbVHxf/by2wml/dswIdoNA6M5PUnfRFBLzWu4DlvAugft2QLQ
	AWI7QgthXTppwLGBV73dt/QKb/U84YY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755760332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NmfHWW0jFWPbjBVrxTprBSeQrh06MCbgYee85N8Q44o=;
	b=iTG1BXdv84suosNVe50vwIU8YzOLcsT7wBwDPMfWgslhZt3jLcNcpYgcV8ZgBXjMRzd2rX
	CczX5QbX70ghhDBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59C1E13867;
	Thu, 21 Aug 2025 07:12:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9peUFMzGpmh9fgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 21 Aug 2025 07:12:12 +0000
Date: Thu, 21 Aug 2025 09:12:11 +0200
Message-ID: <87frdl6tdg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.17-rc2
In-Reply-To: <c76f8af82172ef5d00fce6f17a50eae6@kernel.org>
References: <c76f8af82172ef5d00fce6f17a50eae6@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: RUDV74PM57PU6GUT2QXWN46JYEKM4IRG
X-Message-ID-Hash: RUDV74PM57PU6GUT2QXWN46JYEKM4IRG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RUDV74PM57PU6GUT2QXWN46JYEKM4IRG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 21 Aug 2025 01:25:59 +0200,
Mark Brown wrote:
> 
> The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:
> 
>   Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-rc2
> 
> for you to fetch changes up to 7c15e4cabfa96ed3cd717a2ed7a9961268ab21f7:
> 
>   ASoC: cs35l56: Fixes for CS35L63 for production (2025-08-20 19:56:20 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.17
> 
> A few fixes that came in during the past week, there's some updates for
> the CS35L56 which adjust the driver for production silicon and a fix for
> buggy resume of the ES9389.

Pulled now.  Thanks.


Takashi
