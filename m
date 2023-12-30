Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6298221C3
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:09:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBD0AEBD;
	Tue,  2 Jan 2024 20:09:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBD0AEBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704222562;
	bh=Ph4lU0/ZAI1PlSbReHSUSFONi352NmOTwTgHBC6uhGc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YT2syBAfVOJ5wDr90LJhiXzO9MFuAESfFO58soFaAGTUeq2yKBWwU8Xox0TfwsyKV
	 7bdvOuBvzaXIaMmHnWk4MlIkxTlr+07INr2YImUbOgzDnCl+P99HIuiWm34HklF+df
	 H86FZyvfM4feDz9f8cxbHMK6fr1dqr8OtHjpy0iI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFA31F806C6; Tue,  2 Jan 2024 20:07:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27DBCF806F7;
	Tue,  2 Jan 2024 20:07:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C262F80424; Tue,  2 Jan 2024 20:04:58 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BB76DF80051
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:04:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB76DF80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bHFdo5/k;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iypEELcL;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=bHFdo5/k;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iypEELcL
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8C11822116;
	Sat, 30 Dec 2023 09:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703927967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=URKImpaQyJorzPDB6yG8qAmmJpe9snvzzVaY0SrX8rM=;
	b=bHFdo5/kTbXZRz3l2kbaFmeHTXzKzKXQZUyUpnO+NE51QN/czfzJ56YI3Xb96xU/qvxouW
	9ax9wVhtPelHSoUA/AP/YpsebV25s7QkovHMns7401p3rEytzm5lKR1SlCXD1xclnolyij
	AYSwpZaI1EH0+WwiiTlGtFJ7+UG5BHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703927967;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=URKImpaQyJorzPDB6yG8qAmmJpe9snvzzVaY0SrX8rM=;
	b=iypEELcLcsEGQ7PFSePp81LZY6j+hYPra2NjCO+BnKbUXXVTlunfjMS0WM5/v8IZ4fozmc
	5+hNhpBxQX2PBFCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703927967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=URKImpaQyJorzPDB6yG8qAmmJpe9snvzzVaY0SrX8rM=;
	b=bHFdo5/kTbXZRz3l2kbaFmeHTXzKzKXQZUyUpnO+NE51QN/czfzJ56YI3Xb96xU/qvxouW
	9ax9wVhtPelHSoUA/AP/YpsebV25s7QkovHMns7401p3rEytzm5lKR1SlCXD1xclnolyij
	AYSwpZaI1EH0+WwiiTlGtFJ7+UG5BHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703927967;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=URKImpaQyJorzPDB6yG8qAmmJpe9snvzzVaY0SrX8rM=;
	b=iypEELcLcsEGQ7PFSePp81LZY6j+hYPra2NjCO+BnKbUXXVTlunfjMS0WM5/v8IZ4fozmc
	5+hNhpBxQX2PBFCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3905E136D1;
	Sat, 30 Dec 2023 09:19:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pJnSC5/gj2VwNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 30 Dec 2023 09:19:27 +0000
Date: Sat, 30 Dec 2023 10:19:26 +0100
Message-ID: <87v88gvyht.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dorian Cruveiller <doriancruveiller@gmail.com>
Cc: james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Add driver properties for cs35l41 for Lenovo Legion
 Slim 7 Gen 8 serie
In-Reply-To: <20231229230703.73876-1-doriancruveiller@gmail.com>
References: <20231229230703.73876-1-doriancruveiller@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [0.38 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.52)[80.35%]
Authentication-Results: smtp-out1.suse.de;
	none
Message-ID-Hash: H52KGXP6EDM4ASSQ7J4MIJTCGB5IIJ6B
X-Message-ID-Hash: H52KGXP6EDM4ASSQ7J4MIJTCGB5IIJ6B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H52KGXP6EDM4ASSQ7J4MIJTCGB5IIJ6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 30 Dec 2023 00:07:03 +0100,
Dorian Cruveiller wrote:
> 
> Add driver properties on 4 models of this laptop serie since they don't
> have _DSD in the ACPI table
> 
> Signed-off-by: Dorian Cruveiller <doriancruveiller@gmail.com>

This doesn't seem applicable any longer, as the cs35l41_hda_property.c
had some reworks.  Could you rebase on top of topic/cs35l41 (or
for-next) branch of sound.git tree and resubmit both patches?


thanks,

Takashi
