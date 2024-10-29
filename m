Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4625F9B4529
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2024 10:03:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E51CEDB;
	Tue, 29 Oct 2024 10:02:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E51CEDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730192580;
	bh=NtdFzJOp97394Q4Et/3bYuJRFxfOOMBt1r8lk0rQYXU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rb6NgDnZeOLFdmjz6asXOuyIznd9jsY2eY1Ihh+Ijbbu+gn3YAJUYwqKvOU8d4pRl
	 8az/gw34x+Du1hgOtQCSZS7zP9+BBxQxq67T2sK11EQhhxFSlt5x5+cJvrnk2qucxl
	 xCfU5lXPHk0GdRn1cgvXBmxQmPTmwscFb419c99U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99F90F805BB; Tue, 29 Oct 2024 10:02:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF49CF80301;
	Tue, 29 Oct 2024 10:02:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5140F80269; Tue, 29 Oct 2024 10:02:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8938F800E5
	for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2024 10:02:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8938F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=m2o11jjn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zk9NTIB9;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=m2o11jjn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zk9NTIB9
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 502201FE50;
	Tue, 29 Oct 2024 09:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1730192535;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2cDfEk7mo7OlH4G2ONhSdrP33D0dS24zcU36TyeVhLQ=;
	b=m2o11jjnjdC9uxt5ob38YJzaiv9nugfA6KS7lpdRP3iLeXw4LQcOgTXXGtZssAj1fROXup
	xyIHs9BCfmLAsXiN8e3km0jrnPLGHeVlfTyHM2KwhDP69COmoOgNx/RPBEwF3JSexMQqR7
	S+6GGwo/Ad+t1Gp9xpCydTTtFFqmJm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730192535;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2cDfEk7mo7OlH4G2ONhSdrP33D0dS24zcU36TyeVhLQ=;
	b=zk9NTIB953jKYqkqV4GQ84gfsqk4Nh7saVxOuym46UAvP7EkTr+zJ4mwtEuYYvKtC2tEb3
	GuOuWQVZzj01mIAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=m2o11jjn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zk9NTIB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1730192535;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2cDfEk7mo7OlH4G2ONhSdrP33D0dS24zcU36TyeVhLQ=;
	b=m2o11jjnjdC9uxt5ob38YJzaiv9nugfA6KS7lpdRP3iLeXw4LQcOgTXXGtZssAj1fROXup
	xyIHs9BCfmLAsXiN8e3km0jrnPLGHeVlfTyHM2KwhDP69COmoOgNx/RPBEwF3JSexMQqR7
	S+6GGwo/Ad+t1Gp9xpCydTTtFFqmJm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730192535;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2cDfEk7mo7OlH4G2ONhSdrP33D0dS24zcU36TyeVhLQ=;
	b=zk9NTIB953jKYqkqV4GQ84gfsqk4Nh7saVxOuym46UAvP7EkTr+zJ4mwtEuYYvKtC2tEb3
	GuOuWQVZzj01mIAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2435B136A5;
	Tue, 29 Oct 2024 09:02:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qCt0B5ekIGdTFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Oct 2024 09:02:15 +0000
Date: Tue, 29 Oct 2024 10:03:18 +0100
Message-ID: <874j4v2sdl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Piyush Raj Chouhan <piyushchouhan1598@gmail.com>
Cc: =inux-sound@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add subwoofer quirk for Infinix ZERO
 BOOK 13
In-Reply-To: <20241028155516.15552-1-piyuschouhan1598@gmail.com>
References: <20241028155516.15552-1-piyuschouhan1598@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 502201FE50
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: MY233IAYBS6NCUB2AKSUP3OICOJSSTBA
X-Message-ID-Hash: MY233IAYBS6NCUB2AKSUP3OICOJSSTBA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MY233IAYBS6NCUB2AKSUP3OICOJSSTBA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 28 Oct 2024 16:55:16 +0100,
Piyush Raj Chouhan wrote:
> 
> Infinix ZERO BOOK 13 has a 2+2 speaker system which isn't probed correctly.
> This patch adds a quirk with the proper pin connections.
> Also The mic in this laptop suffers too high gain resulting in mostly fan noise being recorded,
> This patch Also limit mic boost.
> 
> HW Probe for device; https://linux-hardware.org/?probe=a2e892c47b
> 
> Test: All 4 speaker works, Mic has low noise.
> Signed-off-by: Piyush Raj Chouhan <piyushchouhan1598@gmail.com>

Applied now.  Thanks.


Takashi
