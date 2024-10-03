Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0464B98EA3E
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Oct 2024 09:18:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A8F984A;
	Thu,  3 Oct 2024 09:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A8F984A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727939891;
	bh=pUz7jEzDnK7DyodoQRSKkUqubeYJPWiekNw0BYEEoIk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UinbrTMgFV5/r098DbbRWPyeCEPjLcYvrINo4T7VJy5sFpQEAJn8mp6Vy0idYa2KV
	 5CIt5tZWtwLnNzL8fa0mXccWoZOtbeDd0gnDEZUYwYkbo1VfONjhwZncMjnSSTgOQJ
	 Hps2VQ1GHI7SFAr9nxzi2A+Fynr5nqho36S9RLTk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3B39F805A0; Thu,  3 Oct 2024 09:17:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D86DDF80517;
	Thu,  3 Oct 2024 09:17:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8978AF80517; Thu,  3 Oct 2024 09:17:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 23B63F8001E
	for <alsa-devel@alsa-project.org>; Thu,  3 Oct 2024 09:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23B63F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=jwCXJ90l;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=MO6F0T9M;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=jwCXJ90l;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=MO6F0T9M
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3C72521BA5;
	Thu,  3 Oct 2024 07:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1727939848;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ltMrNibS1nysINBf/vSVmDtA5DFhIsFb1aXJJwEx0uw=;
	b=jwCXJ90lQRmfOCdxiDNtYQdhvNpYGEYqupDC6lcdHq3ECTwClkHTCavp0oQLqcupmugV5X
	TASAMwcK6orDQJv7MmrSMo1NlAhiaxaAMP0vvcRUvIQg/7rJBeyEFyEpc4+fSjuMJVcV+4
	zG5hw6YCt87I1GIpxIONrNWWZMZkYMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727939848;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ltMrNibS1nysINBf/vSVmDtA5DFhIsFb1aXJJwEx0uw=;
	b=MO6F0T9MDGeWb6E8PTlhyIGOihQVWOuJZBJsMZcCOmDiC1bKQYhxWClexCOAp6zpxfaexA
	ARd45+/xfC4D/OBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1727939848;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ltMrNibS1nysINBf/vSVmDtA5DFhIsFb1aXJJwEx0uw=;
	b=jwCXJ90lQRmfOCdxiDNtYQdhvNpYGEYqupDC6lcdHq3ECTwClkHTCavp0oQLqcupmugV5X
	TASAMwcK6orDQJv7MmrSMo1NlAhiaxaAMP0vvcRUvIQg/7rJBeyEFyEpc4+fSjuMJVcV+4
	zG5hw6YCt87I1GIpxIONrNWWZMZkYMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727939848;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ltMrNibS1nysINBf/vSVmDtA5DFhIsFb1aXJJwEx0uw=;
	b=MO6F0T9MDGeWb6E8PTlhyIGOihQVWOuJZBJsMZcCOmDiC1bKQYhxWClexCOAp6zpxfaexA
	ARd45+/xfC4D/OBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C9B2139CE;
	Thu,  3 Oct 2024 07:17:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9jG8BQhF/mZlRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Oct 2024 07:17:28 +0000
Date: Thu, 03 Oct 2024 09:18:21 +0200
Message-ID: <87y135k62q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.12-rc1
In-Reply-To: <5f818aaf36b2430322c003fc92b605d3.broonie@kernel.org>
References: <5f818aaf36b2430322c003fc92b605d3.broonie@kernel.org>
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
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: 5V6EHRDRMXLLIZI3WPZZWG4JEQYMBVXK
X-Message-ID-Hash: 5V6EHRDRMXLLIZI3WPZZWG4JEQYMBVXK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5V6EHRDRMXLLIZI3WPZZWG4JEQYMBVXK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 02 Oct 2024 20:32:27 +0200,
Mark Brown wrote:
> 
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.12-rc1
> 
> for you to fetch changes up to eb1df4bbf53c29babf68fcb36e80d9c62a345257:
> 
>   qrb4210-rb2: add HDMI audio playback support (2024-10-02 18:38:11 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.12
> 
> A bunch of fixes here that came in during the merge window and the first
> week of release, plus some new quirks and device IDs.  There's nothing
> major here, it's a bit bigger than it might've been due to there being
> no fixes sent during the merge window due to your vacation.

Thanks, pulled for 6.12-rc2 PR.


Takashi
