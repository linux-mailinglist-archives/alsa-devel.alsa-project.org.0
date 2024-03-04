Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B087686FB69
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 09:14:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32837868;
	Mon,  4 Mar 2024 09:14:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32837868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709540062;
	bh=oO135Fa/uS3SIRBNyJjRCHjRGBBD0/Uzfhsefl3DMTM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CSJo00tqQWSG8Le9raC33lDolWTmXfsdIQjEEAZYlZ688EBkr4BN4+X+OGxkBsXgK
	 aqfig5+dtmMKgw/T7Rgzx8R9QySgvLScKqBN9UASvQ+B9v0q0DSSco213rLMbm9z5P
	 BCqnzB+qsVu8EMsowGm5sGCVWFUgPhScbQ9+TM/4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F330EF80589; Mon,  4 Mar 2024 09:13:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA267F805A0;
	Mon,  4 Mar 2024 09:13:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 335A0F802E8; Mon,  4 Mar 2024 09:13:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8A68F8024E
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 09:13:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8A68F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=RM9Nev/0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tvADZt7s;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=RM9Nev/0;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tvADZt7s
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F416C4DCF1;
	Mon,  4 Mar 2024 08:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709540005;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRMWlyBJcUjbUDZsGjmU9vTL1z05F0OtmydHQLE3nTs=;
	b=RM9Nev/04IT+HRrBGWR/jZnC8y0aHt3QTqK9gRvdj3q5AfKWwuGKFm7Ebw9HsPsnaDQuM1
	C0kcq3gixND3kAM06wlwT626vsO6+6Ke2qcl4DM8pMdA6xKoZwcmSNkVWoYOmHEfHMzeza
	CHsTIFI3r+s6TAZ5qmEGZYZk4Kzfyi0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709540005;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRMWlyBJcUjbUDZsGjmU9vTL1z05F0OtmydHQLE3nTs=;
	b=tvADZt7s+HdTSMFbP7gkI8TvODp64I2R1YZuSwookWkqrnnxCooO+wskyrGUVx/bMKKiw/
	cGPOWCsA76JD50AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709540005;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRMWlyBJcUjbUDZsGjmU9vTL1z05F0OtmydHQLE3nTs=;
	b=RM9Nev/04IT+HRrBGWR/jZnC8y0aHt3QTqK9gRvdj3q5AfKWwuGKFm7Ebw9HsPsnaDQuM1
	C0kcq3gixND3kAM06wlwT626vsO6+6Ke2qcl4DM8pMdA6xKoZwcmSNkVWoYOmHEfHMzeza
	CHsTIFI3r+s6TAZ5qmEGZYZk4Kzfyi0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709540005;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRMWlyBJcUjbUDZsGjmU9vTL1z05F0OtmydHQLE3nTs=;
	b=tvADZt7s+HdTSMFbP7gkI8TvODp64I2R1YZuSwookWkqrnnxCooO+wskyrGUVx/bMKKiw/
	cGPOWCsA76JD50AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B6BF913A58;
	Mon,  4 Mar 2024 08:13:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eL9tK6SC5WW9aAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 Mar 2024 08:13:24 +0000
Date: Mon, 04 Mar 2024 09:13:24 +0100
Message-ID: <8734t62z4r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1 0/3] ALSA: hda: cs35l41: Add support for a couple of
 Lenovo and Asus Laptops
In-Reply-To: <20240301160154.158398-1-sbinding@opensource.cirrus.com>
References: <20240301160154.158398-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-3.24 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.94)[99.75%]
Message-ID-Hash: HTVVB54BIY3YB6Q4SVMVNPFE6BTOF2HE
X-Message-ID-Hash: HTVVB54BIY3YB6Q4SVMVNPFE6BTOF2HE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HTVVB54BIY3YB6Q4SVMVNPFE6BTOF2HE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 01 Mar 2024 17:01:51 +0100,
Stefan Binding wrote:
> 
> Add support for a couple of Lenovo Thinkbook 16P laptops using CS35L41
> HDA. Also fix a _DSD BIOS error for the ASUS UM5302LA laptop.
> 
> Stefan Binding (3):
>   ALSA: hda: cs35l41: Support Lenovo Thinkbook 16P
>   ALSA: hda/realtek: Add quirks for Lenovo Thinkbook 16P laptops
>   ALSA: hda: cs35l41: Overwrite CS35L41 configuration for ASUS UM5302LA

Thanks, applied now.


Takashi
