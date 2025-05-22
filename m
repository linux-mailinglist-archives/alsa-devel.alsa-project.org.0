Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F77AC136D
	for <lists+alsa-devel@lfdr.de>; Thu, 22 May 2025 20:33:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 665E8601EB;
	Thu, 22 May 2025 20:33:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 665E8601EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747938833;
	bh=6LM622WFR3mxaUGN31bzCrpJ8UwoczWpQvl4J3mJYjY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ku20TojFoWZZT9OSHj4+4fcHwOP/4KFsAtbvm1xaJ6ilPPRZ//Py+hccCgB2xr5wt
	 P1r+44dQja9XaO965h+NwEcX9Gdj5iHqdsx1lZrQQw/lEvabFBXOnv2UN02XLHfiiU
	 BlokMQgD7DfxpGoq06PpoYG+ntCTHfq0ZzBl7kro=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 418D9F805BA; Thu, 22 May 2025 20:33:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EE19F805A8;
	Thu, 22 May 2025 20:33:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F7D0F80549; Thu, 22 May 2025 20:33:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9A50F80549
	for <alsa-devel@alsa-project.org>; Thu, 22 May 2025 20:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9A50F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Ets7CONf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZwpM2twM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Ets7CONf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZwpM2twM
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 549281F790;
	Thu, 22 May 2025 18:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747938794;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hU3MCP5yMsXUEL+jMf7ufzf6YJ75Cx/PaabUUUpP7No=;
	b=Ets7CONfwJLIwjRizOshFlvF2NJYjJseheRSv76tdxgr/QmLE+myKQAId5raW/Hm/NFAo/
	3ACNiklfht310EJ7AmAFTUVt4TaTBfVStnNtfWjT0dD/Ytm2H99+7m3tMCg5kRKbNMAbwI
	Gbs8diI+j8sGWu5zUq2aOwO+Shtt/6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747938794;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hU3MCP5yMsXUEL+jMf7ufzf6YJ75Cx/PaabUUUpP7No=;
	b=ZwpM2twMRPRjuEl2b1kFOPOhABgODPcgroWro4scVJSrybDjeO3xqTgYE4NRU3w2vxQ5t8
	dpvh4fcUZHC9cICw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ets7CONf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZwpM2twM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747938794;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hU3MCP5yMsXUEL+jMf7ufzf6YJ75Cx/PaabUUUpP7No=;
	b=Ets7CONfwJLIwjRizOshFlvF2NJYjJseheRSv76tdxgr/QmLE+myKQAId5raW/Hm/NFAo/
	3ACNiklfht310EJ7AmAFTUVt4TaTBfVStnNtfWjT0dD/Ytm2H99+7m3tMCg5kRKbNMAbwI
	Gbs8diI+j8sGWu5zUq2aOwO+Shtt/6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747938794;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hU3MCP5yMsXUEL+jMf7ufzf6YJ75Cx/PaabUUUpP7No=;
	b=ZwpM2twMRPRjuEl2b1kFOPOhABgODPcgroWro4scVJSrybDjeO3xqTgYE4NRU3w2vxQ5t8
	dpvh4fcUZHC9cICw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CA9C13A62;
	Thu, 22 May 2025 18:33:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w4qpDeptL2iPWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 May 2025 18:33:14 +0000
Date: Thu, 22 May 2025 20:33:13 +0200
Message-ID: <874ixc8phy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.15-rc7
In-Reply-To: <2929fef2a55f1eb5ac9befdebe65c18c.broonie@kernel.org>
References: <2929fef2a55f1eb5ac9befdebe65c18c.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Bar: /
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 549281F790
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.51 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: P72F4J5NSHEC6RAQRRI4HNNZUDTTZOHV
X-Message-ID-Hash: P72F4J5NSHEC6RAQRRI4HNNZUDTTZOHV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P72F4J5NSHEC6RAQRRI4HNNZUDTTZOHV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 22 May 2025 18:02:15 +0200,
Mark Brown wrote:
> 
> The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:
> 
>   Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-rc7
> 
> for you to fetch changes up to 688abe2860fd9c644705b9e11cb9649eb891b879:
> 
>   ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params() (2025-05-20 10:24:59 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.15
> 
> A couple more small fixes for v6.15, both of which could also easily
> wait until the merge window.

Pulled now.  But I already sent a PR for 6.15 in this morning, and
this slipped from it.

In anyway, it'll be included in the PR in the next week.


thanks,

Takashi
