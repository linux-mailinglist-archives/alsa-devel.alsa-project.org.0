Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF259B6491
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2024 14:47:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B477FE64;
	Wed, 30 Oct 2024 14:46:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B477FE64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730296027;
	bh=ecAWEcqGywxLhnHrviW6pJdJSR7/fKmM1sKyFFWdzs0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XliMHVwuOx5gV6Alw83Nd1kOrmHrBJCOLByxK3Sf7ABzCEQ8ANhFkqZl8SZR+4Pvi
	 /QT4A83uKHK4R2ZaZ7IqxgVWUiA8hJRmRrQFuhVhJMaSzG2XIq/SGc5017hKeddEUp
	 ygJjkQALb6bcROW55XjaX7nH3pbs+pjGHVaaZz3w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E134F80579; Wed, 30 Oct 2024 14:46:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14BD7F8058C;
	Wed, 30 Oct 2024 14:46:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8330FF80269; Wed, 30 Oct 2024 14:46:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE996F800E5
	for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2024 14:46:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE996F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ULSo8m18;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JUqArJ2R;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ULSo8m18;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JUqArJ2R
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CD60B21F21;
	Wed, 30 Oct 2024 13:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1730295987;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rrhYfhQbw/vUOBRo3fiDWlzNAMIE9jCQAvTU9icdqxY=;
	b=ULSo8m18nJw+UIs8iCRH9y5g0wSc8h7Z0nFHDHKc8apgK0VymOjFajg/V0GgMVvfAnO/Fx
	jnQEYw+qDdgjMygyg8MRZDU1wH/WmS40ezSOmB/65Y6fx07u2fu+VjBFIxXuznBx8gn1M/
	v2jDe+4JRYBzw+cc0kKmcBZxyDHif8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730295987;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rrhYfhQbw/vUOBRo3fiDWlzNAMIE9jCQAvTU9icdqxY=;
	b=JUqArJ2RlIS33sT3FO6VZHwV9ZmABRt+tRpctsjp1t+aB2TN4wkz8NkSUMJQJs6Eaq7D5i
	ctHt5fM3f8B7VYBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ULSo8m18;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JUqArJ2R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1730295987;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rrhYfhQbw/vUOBRo3fiDWlzNAMIE9jCQAvTU9icdqxY=;
	b=ULSo8m18nJw+UIs8iCRH9y5g0wSc8h7Z0nFHDHKc8apgK0VymOjFajg/V0GgMVvfAnO/Fx
	jnQEYw+qDdgjMygyg8MRZDU1wH/WmS40ezSOmB/65Y6fx07u2fu+VjBFIxXuznBx8gn1M/
	v2jDe+4JRYBzw+cc0kKmcBZxyDHif8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730295987;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rrhYfhQbw/vUOBRo3fiDWlzNAMIE9jCQAvTU9icdqxY=;
	b=JUqArJ2RlIS33sT3FO6VZHwV9ZmABRt+tRpctsjp1t+aB2TN4wkz8NkSUMJQJs6Eaq7D5i
	ctHt5fM3f8B7VYBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD2BC13AD9;
	Wed, 30 Oct 2024 13:46:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w6ALKbM4ImdTdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Oct 2024 13:46:27 +0000
Date: Wed, 30 Oct 2024 14:47:30 +0100
Message-ID: <87v7x9ya6l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.12-rc5
In-Reply-To: <4326ff8a13b27d320ea10dcbe8eafc15.broonie@kernel.org>
References: <4326ff8a13b27d320ea10dcbe8eafc15.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: CD60B21F21
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: PM4M2FOHOG55CSR66PKVZD4OX4UK7ZV2
X-Message-ID-Hash: PM4M2FOHOG55CSR66PKVZD4OX4UK7ZV2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PM4M2FOHOG55CSR66PKVZD4OX4UK7ZV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 30 Oct 2024 14:38:14 +0100,
Mark Brown wrote:
> 
> The following changes since commit db7e59e6a39a4d3d54ca8197c796557e6d480b0d:
> 
>   ASoC: qcom: sc7280: Fix missing Soundwire runtime stream alloc (2024-10-22 21:00:38 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.12-rc5
> 
> for you to fetch changes up to 2db63e92186d7201ee1cb2f5af11757c5e5a1020:
> 
>   wcd937x codec fixes (2024-10-29 19:18:48 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.12
> 
> The biggest set of changes here is Hans' fixes and quirks for various
> Baytrail based platforms with RT5640 CODECs, and there's one core fix
> for a missed length assignment for __counted_by() checking.  Otherwise
> it's small device specific fixes, several of them in the DT bindings.

Pulled now.  Thanks.


Takashi
