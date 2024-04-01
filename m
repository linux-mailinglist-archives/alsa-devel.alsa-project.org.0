Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9C1894370
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 19:03:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C17222CE;
	Mon,  1 Apr 2024 19:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C17222CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711991023;
	bh=ninn/z7ZCYQ+97xWVtP4eupP0aR0pjpWioxA8MelATg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=US6WYubJYtNW6ly7Kf02AOm5pFiesK7xfSc1KsKAecghZu2GzehIYMhwMBnkQSu1+
	 TG/47vXn3MKxT3UrQo7dAh4c2BPEP2KBZ9qwbOTBKxfD6vPB8rDV9G8Be31BwlA8qx
	 MQlDoLV2v93uDhUT21LT7E2j2pNVydw8oM7W6xGU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5311BF8056F; Mon,  1 Apr 2024 19:03:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8969CF80588;
	Mon,  1 Apr 2024 19:03:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B92AF80236; Mon,  1 Apr 2024 19:03:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCA69F80114
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 19:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCA69F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=CVCVfKw7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5nLQK+c6
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CC63333C3D;
	Mon,  1 Apr 2024 17:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711990957;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M1U28ycJbkT+xebI+PpF9yoFNV9CayGMbI079VPMnRk=;
	b=CVCVfKw7b072xD0+y8zk/RvIqpU7M8/pKgE7iAzGJLZeHPz0TdNk7f+CHH5Gh+GIueik5Y
	QTakfD18T9118scWWF4ua4L4sOm8myqR9yS7T21xLSfi337zSULipaAYN0du3XlOXDET3j
	h3vB8V8XSsJtV/lMh8GflaNnhsMVAl4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711990957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M1U28ycJbkT+xebI+PpF9yoFNV9CayGMbI079VPMnRk=;
	b=5nLQK+c647S3sYNt0Oxp3zpF6fwb/xmuqGDOudlWjx0XBbMEyQuQ9eubfjSAFoq6YghhB4
	oRuAEyQg/DXr6qAQ==
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id AC3191348C;
	Mon,  1 Apr 2024 17:02:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id aOXrKK3oCmbTZAAAn2gu4w
	(envelope-from <tiwai@suse.de>); Mon, 01 Apr 2024 17:02:37 +0000
Date: Mon, 01 Apr 2024 19:02:42 +0200
Message-ID: <87edbpt3rh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: Re: [PATCH] Revert "ALSA: emu10k1: fix synthesizer sample playback
 position and caching"
In-Reply-To: <20240401145805.528794-1-oswald.buddenhagen@gmx.de>
References: <20240401145805.528794-1-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.50 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de,internode.on.net];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.998];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmx.de];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[alsa-project.org,perex.cz,internode.on.net];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.20)[71.15%]
Message-ID-Hash: HVNIRKULCECGKYTCSWNUJJ2EH3OIXEQL
X-Message-ID-Hash: HVNIRKULCECGKYTCSWNUJJ2EH3OIXEQL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVNIRKULCECGKYTCSWNUJJ2EH3OIXEQL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Apr 2024 16:58:05 +0200,
Oswald Buddenhagen wrote:
> 
> As already anticipated in the original commit, playback was broken for
> very short samples. I just didn't expect it to be an actual problem,
> because we're talking about less than 1.5 milliseconds here. But clearly
> such wavetable samples do actually exist.
> 
> The problem was that for such short samples we'd set the current
> position beyond the end of the loop, so we'd run off the end of the
> sample and play garbage.
> This is a bigger (more audible) problem than the original one, which was
> that we'd start playback with garbage (whatever was still in the cache),
> which would be mostly masked by the note's attack phase.
> 
> So revert to the old behavior for now. We'll subsequently fix it
> properly with a bigger patch series.
> Note that this isn't a full revert - the dead code is not re-introduced,
> because that would be silly.
> 
> Fixes: df335e9a8b (ALSA: emu10k1: fix synthesizer sample playback position and caching, 2023-05-18)
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218625
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

Thanks, applied now.


Takashi
