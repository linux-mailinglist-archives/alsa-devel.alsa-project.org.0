Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8648875CB4
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 04:28:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED787868;
	Fri,  8 Mar 2024 04:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED787868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709868508;
	bh=uT5NxCosrcGa0uMON5obvvuAZK/yHU43ALWlFYP0uko=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lPpz0KQcQFVctQaVkNpWtTJCUvLxOQdpQ9uZYgJi3ydffyuBqN61DRoTN2hf0UhNo
	 n+I5wXTZ68wL+otx9nI26oLsqiuF8OmlumpGYDcgCAEe+K/3Fe/1ZonGck/bpwg0Hh
	 YLbnfW/qPAC7bUWvYvXyIs+tZKiCdAG4oAZOMaPk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17ABEF8059F; Fri,  8 Mar 2024 04:27:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E44BF80494;
	Fri,  8 Mar 2024 04:27:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84196F80088; Fri,  8 Mar 2024 04:27:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BFBAF80088
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 04:27:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BFBAF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nocBvkjm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=OK+uAUHW;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=nocBvkjm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=OK+uAUHW
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0FFBD8CDF0;
	Thu,  7 Mar 2024 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709828938;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TcYB3THyLEHAGqQD5ulPE5CsY6vdqyT5FGwSx8tObPQ=;
	b=nocBvkjmC+2+qVgS3MNjA0sKHbC4JjTj4jfMJbFYOqa22+/6IYkFqvQYqkLj/unUB1RjTD
	D4v3p+Og9hgVt8YtKUDGOyJxhX9TAj9Dt0PoR+6lj0b4pNNTvmNsaWxFwaPVEb0jFtYMbs
	yfGhWAa8ytoquW6HvtOxv5lB4yBZ1lU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709828938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TcYB3THyLEHAGqQD5ulPE5CsY6vdqyT5FGwSx8tObPQ=;
	b=OK+uAUHWj2F47iM2fqT6RBehlSwP2l3ejUIllxfehNfG9arsaydRyRtLMlhgyHZRjaEdMm
	JJI4p/ejf4XpQSDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709828938;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TcYB3THyLEHAGqQD5ulPE5CsY6vdqyT5FGwSx8tObPQ=;
	b=nocBvkjmC+2+qVgS3MNjA0sKHbC4JjTj4jfMJbFYOqa22+/6IYkFqvQYqkLj/unUB1RjTD
	D4v3p+Og9hgVt8YtKUDGOyJxhX9TAj9Dt0PoR+6lj0b4pNNTvmNsaWxFwaPVEb0jFtYMbs
	yfGhWAa8ytoquW6HvtOxv5lB4yBZ1lU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709828938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TcYB3THyLEHAGqQD5ulPE5CsY6vdqyT5FGwSx8tObPQ=;
	b=OK+uAUHWj2F47iM2fqT6RBehlSwP2l3ejUIllxfehNfG9arsaydRyRtLMlhgyHZRjaEdMm
	JJI4p/ejf4XpQSDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CCCC3136C7;
	Thu,  7 Mar 2024 16:28:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Mgz6L0nr6WULegAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 07 Mar 2024 16:28:57 +0000
Date: Thu, 07 Mar 2024 17:28:57 +0100
Message-ID: <87le6uxaye.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ALSA: hda: hda_component: Add missing #include guards
In-Reply-To: <20240307111216.45053-1-rf@opensource.cirrus.com>
References: <20240307111216.45053-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nocBvkjm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OK+uAUHW
X-Spamd-Result: default: False [-0.34 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.03)[87.49%]
X-Rspamd-Queue-Id: 0FFBD8CDF0
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: N2OX3NSZYYHO3TTPGLMRCPWBWFDHADZG
X-Message-ID-Hash: N2OX3NSZYYHO3TTPGLMRCPWBWFDHADZG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N2OX3NSZYYHO3TTPGLMRCPWBWFDHADZG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 07 Mar 2024 12:12:15 +0100,
Richard Fitzgerald wrote:
> 
> Add the conventional include guards around the content of the
> hda_component.h header file. This prevents double-declaration of
> struct hda_component if the header gets included multiple times.
> 
> This isn't causing any problems with current code, so no need to
> backport to older kernels.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Applied both patches now.  Thanks.


Takashi
