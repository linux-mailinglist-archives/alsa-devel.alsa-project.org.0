Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4E487DC9E
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 09:38:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12C9C238C;
	Sun, 17 Mar 2024 09:38:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12C9C238C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710664702;
	bh=znTX9eAIHyWQ7f5ssmtNNZv+t2Yeo0/G0gKKGQUKCnE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BpC2dJQpr9s7QSep5L1EGwXHyLRXltX1EySNqUnD1QSWFPbgB8bYYOxGyVPaPOnwo
	 PpG3BsgLG84d2b/xHjddKoVncz9Q8PU9RfA5/F+4wB8QDHXXCeIpgB5HdDzxMNpUNy
	 3DdoYftIZ0nGf3MQvHN7PWle9q76UD0ZLmN/f/KE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6C8AF80587; Sun, 17 Mar 2024 09:37:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CD7CF8059F;
	Sun, 17 Mar 2024 09:37:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDC19F804E7; Sun, 17 Mar 2024 09:35:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BA95F8025F
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 09:35:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BA95F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BPA/uIC5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9BpFYTqp;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=BPA/uIC5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9BpFYTqp
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 026CA20883;
	Sun, 17 Mar 2024 08:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710664516;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WeS2ELhNfkGsLzrI905ZXWqhNufqsqpTOo3C0vyBpRQ=;
	b=BPA/uIC5hgPhnKuLVsgq/zVJJ9u6Dxz7vT5vWLPHZPdPofgLcuizOmVMap0WKnGVzE3Tzm
	rdM13D6HMRxTsRaivpSGSpyYOG/GVwLwLpKnvRxA02YgIyDi/xGOuZwm7t3JsWArmVKSGc
	drwTxxsOfOUoJNnwXHTtpJ9/PFa1FSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710664516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WeS2ELhNfkGsLzrI905ZXWqhNufqsqpTOo3C0vyBpRQ=;
	b=9BpFYTqp/GPWjJbYU/kv4P3pSWzd+NJfXk7GbxY+MDk2W5ruhFF43sqKAZZYtKBRnUH+Dw
	dbhPnVZB0bRtgzBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1710664516;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WeS2ELhNfkGsLzrI905ZXWqhNufqsqpTOo3C0vyBpRQ=;
	b=BPA/uIC5hgPhnKuLVsgq/zVJJ9u6Dxz7vT5vWLPHZPdPofgLcuizOmVMap0WKnGVzE3Tzm
	rdM13D6HMRxTsRaivpSGSpyYOG/GVwLwLpKnvRxA02YgIyDi/xGOuZwm7t3JsWArmVKSGc
	drwTxxsOfOUoJNnwXHTtpJ9/PFa1FSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710664516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WeS2ELhNfkGsLzrI905ZXWqhNufqsqpTOo3C0vyBpRQ=;
	b=9BpFYTqp/GPWjJbYU/kv4P3pSWzd+NJfXk7GbxY+MDk2W5ruhFF43sqKAZZYtKBRnUH+Dw
	dbhPnVZB0bRtgzBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB74E1349D;
	Sun, 17 Mar 2024 08:35:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fRgrMEOr9mWbRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 17 Mar 2024 08:35:15 +0000
Date: Sun, 17 Mar 2024 09:35:15 +0100
Message-ID: <875xxl9ry4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ian Murphy <iano200@gmail.com>
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: add in quirk for Acer Swift Go 16 -
 SFG16-71
In-Reply-To: <20240316094157.13890-1-iano200@gmail.com>
References: <20240316094157.13890-1-iano200@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-2.45 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.15)[95.92%]
Message-ID-Hash: URXAGUSACHCG5PDKLKOJXEKGOQTCFMVM
X-Message-ID-Hash: URXAGUSACHCG5PDKLKOJXEKGOQTCFMVM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/URXAGUSACHCG5PDKLKOJXEKGOQTCFMVM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 16 Mar 2024 10:41:57 +0100,
Ian Murphy wrote:
> 
> Keyboard has an LED that is ON/OFF when mic is muted/active
>  - LED is controlled by GPIO pin
>  - Patch enables led to appear in /sys/class/leds/ as hda::micmute
>  - Enables LED when mic is MUTED
>  - Disables LED when mic is active
> 
> Signed-off-by: Ian Murphy <iano200@gmail.com>

Applied now with corrections of white spaces.  Thanks.


Takashi
