Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41610989BEE
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 09:52:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7C5F1923;
	Mon, 30 Sep 2024 09:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7C5F1923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727682753;
	bh=0lZGkMbvK4eW7PhLpxdSQPbY8tL3Zs56wzN308/AjFQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T0IYrcSRNNl/EvCsBGUPoJClu0rcYv0WvZUX+8cTj3g8YwlW7PtDKQGqqR2C0KaKk
	 GeRq67ZYCmtWL9fEB4NsaFL+VST3E+m6XStHevaeKc7kWIQ5Y0xhIYyE7cnlbB1wMX
	 A/DUcPrxLN/k1sWhg1oU8NgjE7hd5EUC4B+DmtpM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81EF6F805B6; Mon, 30 Sep 2024 09:52:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9083BF80508;
	Mon, 30 Sep 2024 09:52:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C621BF80517; Mon, 30 Sep 2024 09:51:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D366DF80074
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 09:51:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D366DF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=z/fqHy4u;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uVggnxor;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=z/fqHy4u;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uVggnxor
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BC47721A3A;
	Mon, 30 Sep 2024 07:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1727682714;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SJVAb+BuJivyGAGxd+xpSwRXJE6u71PNtHQgXRC8H+w=;
	b=z/fqHy4uKxjlmJ1+fOZv6xdwVcRP6aGTYEWtPaPw32QYLa1zLa2wI2XdcxVSyA5hPfB+DL
	6ZpgDsTi0m/OAgoo2XAq6+OoDTP1jL6/+oiO7eHL7ENpfOpHDBGLeDnIh4baCmUg4remox
	4pdTWiPxOO6sT3isMg0A4QChh0+u3F0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727682714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SJVAb+BuJivyGAGxd+xpSwRXJE6u71PNtHQgXRC8H+w=;
	b=uVggnxorqSGIY1KzgMATKKbqyxiDQxYVjdwwvC5aKAGK1yYIwdRKp/iuRYHs+Fi4cCXtP2
	jfbsgT0E0w/YOACQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1727682714;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SJVAb+BuJivyGAGxd+xpSwRXJE6u71PNtHQgXRC8H+w=;
	b=z/fqHy4uKxjlmJ1+fOZv6xdwVcRP6aGTYEWtPaPw32QYLa1zLa2wI2XdcxVSyA5hPfB+DL
	6ZpgDsTi0m/OAgoo2XAq6+OoDTP1jL6/+oiO7eHL7ENpfOpHDBGLeDnIh4baCmUg4remox
	4pdTWiPxOO6sT3isMg0A4QChh0+u3F0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727682714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SJVAb+BuJivyGAGxd+xpSwRXJE6u71PNtHQgXRC8H+w=;
	b=uVggnxorqSGIY1KzgMATKKbqyxiDQxYVjdwwvC5aKAGK1yYIwdRKp/iuRYHs+Fi4cCXtP2
	jfbsgT0E0w/YOACQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FF0813A8B;
	Mon, 30 Sep 2024 07:51:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GzYWGppY+mahDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Sep 2024 07:51:54 +0000
Date: Mon, 30 Sep 2024 09:52:47 +0200
Message-ID: <87frphk27k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christian Brauner <brauner@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Pavel Hofman <pavel.hofman@ivitera.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v2] ALSA: Fix typos in comments across various files
In-Reply-To: <20240924041749.3125507-1-yujiaoliang@vivo.com>
References: <20240924041749.3125507-1-yujiaoliang@vivo.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: RPIW2SQX4HK7ZJM4IUAY3UZCFYTYIJ6G
X-Message-ID-Hash: RPIW2SQX4HK7ZJM4IUAY3UZCFYTYIJ6G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RPIW2SQX4HK7ZJM4IUAY3UZCFYTYIJ6G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 24 Sep 2024 06:17:45 +0200,
Yu Jiaoliang wrote:
> 
> This patch fixes typos in comments within the ALSA subsystem.
> These changes improve code readability without affecting
> functionality.
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
> ---
> v2: Update commit message.

Thanks, applied now.


Takashi
