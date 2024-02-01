Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E44845861
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 14:03:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1628DA4A;
	Thu,  1 Feb 2024 14:02:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1628DA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706792583;
	bh=LKjJBBd8SBZq1TlSMNPebvfGKgt0GBCGwuyqPIntk68=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AZ34cKSCa3ZwgQxKU/QxVXHTbcD7LathJe6BychHMddaDg2r5eP6VvKXSAw6P+axx
	 6gRwPB3uS3MYCeWI3za2I2dnXLeSpMHdMljfHMNIQ+Rw5yy5SpXZK7aaGZ6cvTnd38
	 Cbp2ypjjHpL0uNdu0wuN4/u4eIyWCVZNZUiDRKS8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1694CF80567; Thu,  1 Feb 2024 14:02:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 462D2F8057C;
	Thu,  1 Feb 2024 14:02:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1852DF8055C; Thu,  1 Feb 2024 14:02:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95DBEF80548
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 14:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95DBEF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Ek3OiIZq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JSK7qn6W;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Ek3OiIZq;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JSK7qn6W
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0660E21EC7;
	Thu,  1 Feb 2024 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706792537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ENmQXtGmZZRRih/heSUqRc9W6vtYC89xYf/keE9bwxc=;
	b=Ek3OiIZqYC4iLIYCWk/wLi1Cq2lFLS2CQ8GzvVIgUaHtyeiYAWo7/PbOhB8poGagpz8Ku4
	Hzrya7WB3qIDcgoWPA6v3dP4VAi7BJQmUdoK5vkomeRusu08mBoCXHLqKEAcScLZmq8PpB
	FTrMSlw3nIqJRZGL0Gqr8QedKPi5aAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706792537;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ENmQXtGmZZRRih/heSUqRc9W6vtYC89xYf/keE9bwxc=;
	b=JSK7qn6Wydw/r4maaUjwF06TVZP55+X8TgcOPrcNFfJgvYLQto2OWMEsIOXMrzQNpsfrUf
	TteNYxGoiACqwuBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706792537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ENmQXtGmZZRRih/heSUqRc9W6vtYC89xYf/keE9bwxc=;
	b=Ek3OiIZqYC4iLIYCWk/wLi1Cq2lFLS2CQ8GzvVIgUaHtyeiYAWo7/PbOhB8poGagpz8Ku4
	Hzrya7WB3qIDcgoWPA6v3dP4VAi7BJQmUdoK5vkomeRusu08mBoCXHLqKEAcScLZmq8PpB
	FTrMSlw3nIqJRZGL0Gqr8QedKPi5aAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706792537;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ENmQXtGmZZRRih/heSUqRc9W6vtYC89xYf/keE9bwxc=;
	b=JSK7qn6Wydw/r4maaUjwF06TVZP55+X8TgcOPrcNFfJgvYLQto2OWMEsIOXMrzQNpsfrUf
	TteNYxGoiACqwuBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE992139B1;
	Thu,  1 Feb 2024 13:02:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pPirLFiWu2XPPgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Feb 2024 13:02:16 +0000
Date: Thu, 01 Feb 2024 14:02:16 +0100
Message-ID: <87frycz6av.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Tsoy <alexander@tsoy.me>
Cc: vincenttew <vincenttew@google.com>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: retry clock validate when it takes some
 times
In-Reply-To: <6872e9ea993633dff4e248f01cafd1ac32651355.camel@tsoy.me>
References: <20240201070641.401684-1-vincenttew@google.com>
	<6872e9ea993633dff4e248f01cafd1ac32651355.camel@tsoy.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[22.88%]
Message-ID-Hash: PPJ2ONI64CTBSISGSWMOBSTBJNDU4AYM
X-Message-ID-Hash: PPJ2ONI64CTBSISGSWMOBSTBJNDU4AYM
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 01 Feb 2024 11:36:11 +0100,
Alexander Tsoy wrote:
> 
> В Чт, 01/02/2024 в 15:06 +0800, vincenttew пишет:
> > Behringer UMC202HD and UMC404HD take some times to validate the clock
> > source. To prevent more DAC have the same delay which return the
> > false
> > in the first time, remove the USB id check to have a chance to retry
> > the
> > clock validate.
> > 
> > Signed-off-by: vincenttew <vincenttew@google.com>
> 
> Thank you for the patch! My thought about this change:
> - Retrying clock source validation probably make sense only in the case
> of Internal clock. But I'm not sure.

It's an interesting point.

> - If we want to make this a standard driver behaviour, then the code
> needs to be moved out of the quirk function IMO.

I'm a bit afraid of applying this unconditionally to all cases.  At
first, we can start with the vendor matching (e.g. MOTU and Behringer)
to apply it...


thanks,

Takashi
