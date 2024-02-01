Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3A84585A
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 14:00:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A90D857;
	Thu,  1 Feb 2024 13:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A90D857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706792404;
	bh=A1CD3TizeGw0gRAijqITFwb/9CtDxOQbCofvlJYs5ao=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V+uXibL/8zxqjie6K2so4gcxrG2LGW9B5PUsbhh8lydVsdAkAP2WH/yBFvanY9hNF
	 SyLPjpUq/eeyCATgqZf+zTa2SzzPc1Ui+iI43XwFusPMPBvzlSTRC7DDh7lqasQIuI
	 pgisljiGyChsN8S2YI0Zw0wkeudlZ7r8p0cRfeCY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C34E5F8059F; Thu,  1 Feb 2024 13:59:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61C97F8056F;
	Thu,  1 Feb 2024 13:59:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 395A0F8055C; Thu,  1 Feb 2024 13:59:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85075F80548
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 13:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85075F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=YA0M6cJ7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jIUCe02b;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=MsrqlhHN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=P0FAgXbY
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D4541FB83;
	Thu,  1 Feb 2024 12:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706792363;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5xEfsZdcZNKLoLgOZMCSO1egAPw9Osdd2UHzN8nHQNA=;
	b=YA0M6cJ7Cp5IzY3PAaLgt8DdgeiR9MWRX5YhWA9A6nZSFX6UQ9giAaYhGkOWrHhw7Rab5r
	lCzh01R865f6zLAwSvJzx3anFVjpRa6lVYbVeBwvyyWdJP/hv2scuxm9yRzsAuN3SnOhTi
	Vq18QjxuN63PUfUnJql+YOyLg06d8iE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706792363;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5xEfsZdcZNKLoLgOZMCSO1egAPw9Osdd2UHzN8nHQNA=;
	b=jIUCe02b4Pc9lcfb2O+j5Ru63dvQVu/lzk9mZWdhaMoiqNEMlt8yUAOTfqWab68mDNqotW
	qppsTrHnaQ8CE4CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706792362;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5xEfsZdcZNKLoLgOZMCSO1egAPw9Osdd2UHzN8nHQNA=;
	b=MsrqlhHNsOyc+e178DG1NqnTpOSut9i746Vobhdz3HfJ732sirbKtYHfRwepznz53FDVoH
	rqIfs3V4Yk+WCYTzNksIsIk3sLkj17+XJ1jQ0iQkIA10OiX2oX1tuxSnxgCAiyZrNaFng8
	eCXOHq+MwQkieaVBAtSTNjfemgUBQDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706792362;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5xEfsZdcZNKLoLgOZMCSO1egAPw9Osdd2UHzN8nHQNA=;
	b=P0FAgXbY+g/YiiORM/RUPmyNqRH4uM+bCpV4qoLk+DSBZi7I6QTZYmFjPE9E0yHoyhWSuk
	nI/6NPwr1uuliNAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3EF15139B1;
	Thu,  1 Feb 2024 12:59:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OTMyDaqVu2X5PQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Feb 2024 12:59:22 +0000
Date: Thu, 01 Feb 2024 13:59:21 +0100
Message-ID: <87h6isz6fq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: rp@nrp.de
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk for PioneerDJ DDJ-1000
In-Reply-To: <2322911.ElGaqSPkdT@pc>
References: <2322911.ElGaqSPkdT@pc>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.86 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWO(0.00)[2];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[nrp.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.04)[58.72%]
Message-ID-Hash: 2MRDRDEWFELPYKKSH3R7XNLBRLKDZSDE
X-Message-ID-Hash: 2MRDRDEWFELPYKKSH3R7XNLBRLKDZSDE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2MRDRDEWFELPYKKSH3R7XNLBRLKDZSDE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 31 Jan 2024 21:28:48 +0100,
rp@nrp.de wrote:
> 
> Problems:
> 	- PioneerDJ DDJ-1000 audio channels are not recognized.
> 	- Jog dial displays are showing permanently "NO AUDIO DRIVER" 
> 
> The attached patch fixes this.
> The jog displays and all output and input channels are working now.
> 
> Signed-off-by: Ralf Pachali <rp@nrp.de>

The code changes look OK, but the submission has a minor problem.

> --- sound/usb/quirks-table.h
> +++ sound/usb/quirks-table.h

Please create a patch that is applied with -p1, just like what git
format-patch provides.

Also, when applied to git tree, there is "attached patch".  It'll be
the commit log text, hence better to rephrase the texts to fit as a
git commit log.

Last but not least, please use the "From:" line aligned with your
Signed-off-by line.  If you don't want to change the mailer setup, put
the From: line in the patch itself, so that it's taken at applying.

Could you address those and resubmit?


thanks,

Takashi
