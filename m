Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD038D61F2
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 14:39:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F2B2852;
	Fri, 31 May 2024 14:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F2B2852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717159170;
	bh=4MiyUforjyB3VfuRbKh44YTCsg7n4QA1jPNVui+GC3w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HcE4dilr1bDqwc1N96tLolzMCFxO86JBI1qlcyTbcUl5HGLUbePBUvvLmPz0VMRij
	 JomlZuAQ0z18J57qKDMgfS6Ihpe4JvhkmG5ZdECaDAXp5DHfLQsuSfRCNubzn3r5/0
	 WWXZvIqWxr6QjSWYJbgr/69hwzmYhgeHGQahlzmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B27ABF805AE; Fri, 31 May 2024 14:38:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52B19F80496;
	Fri, 31 May 2024 14:38:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A195EF8026D; Fri, 31 May 2024 14:38:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F8CAF8003A
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 14:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F8CAF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ouPDBjzw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=0hRp0J1l;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ouPDBjzw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=0hRp0J1l
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 08FE221BCB;
	Fri, 31 May 2024 12:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1717159125;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P5BzJwpGnxTW/HqgTgsLDeSdFdC9YNrVOg8pJXtP7aQ=;
	b=ouPDBjzw2s4BW9b24KvY0QnKPV1QSAqto123uhFPmCO5TON1K6ZmUVO21548Ia1hKrgirw
	oJNRol4KSBz5bKTQvNXyXC93xovvRJBRFARwhCeFSg0XaJkdfZk0I03PwvestE0kAytGQz
	rI1ysyJ/RVnut1XZTsf8wZuLvWxZrro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717159125;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P5BzJwpGnxTW/HqgTgsLDeSdFdC9YNrVOg8pJXtP7aQ=;
	b=0hRp0J1lxEnwNk20tou4WnZAWy3w8Vb/bdPAKBrJJOBMhxePyiVGXnUR9eM9En50dsisdH
	tFJ77Lyp+TvtPIDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1717159125;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P5BzJwpGnxTW/HqgTgsLDeSdFdC9YNrVOg8pJXtP7aQ=;
	b=ouPDBjzw2s4BW9b24KvY0QnKPV1QSAqto123uhFPmCO5TON1K6ZmUVO21548Ia1hKrgirw
	oJNRol4KSBz5bKTQvNXyXC93xovvRJBRFARwhCeFSg0XaJkdfZk0I03PwvestE0kAytGQz
	rI1ysyJ/RVnut1XZTsf8wZuLvWxZrro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717159125;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P5BzJwpGnxTW/HqgTgsLDeSdFdC9YNrVOg8pJXtP7aQ=;
	b=0hRp0J1lxEnwNk20tou4WnZAWy3w8Vb/bdPAKBrJJOBMhxePyiVGXnUR9eM9En50dsisdH
	tFJ77Lyp+TvtPIDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C30E9137C3;
	Fri, 31 May 2024 12:38:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LvouLtTEWWbOVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 31 May 2024 12:38:44 +0000
Date: Fri, 31 May 2024 14:39:07 +0200
Message-ID: <8734py40lw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda: cs35l56: Fix lifecycle of codec pointer
In-Reply-To: <20240531112716.25323-1-simont@opensource.cirrus.com>
References: <20240531112716.25323-1-simont@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.21 / 50.00];
	BAYES_HAM(-2.91)[99.62%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: H5U7UTXE4EVFO3TPTFXCVIUFXGQWB7A4
X-Message-ID-Hash: H5U7UTXE4EVFO3TPTFXCVIUFXGQWB7A4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H5U7UTXE4EVFO3TPTFXCVIUFXGQWB7A4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 31 May 2024 13:27:16 +0200,
Simon Trimmer wrote:
> 
> The codec should be cleared when the amp driver is unbound and when
> resuming it should be tested to prevent loading firmware into the device
> and ALSA in a partially configured system state.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>

Thanks, applied.


Takashi
