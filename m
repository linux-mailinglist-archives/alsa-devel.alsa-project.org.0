Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CDF8A9369
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 08:45:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F812E65;
	Thu, 18 Apr 2024 08:45:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F812E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713422725;
	bh=jFbHu/heAjXaIjCpcnhTfqFBsbEQCpoQU/YCuHvZGNU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qil0gv+enlqEqc4UzVojmhuch0b8rkhgj8DLyF376JvBNEPgJcJd1aXmETw7arTEC
	 BZBKofE8cwA/j5GYI9qhZNRd1f0sXCYh3BV0UTH2MfnY6uTB93zVyGOgl09NLr28dA
	 XjT9FenNy4B8vZV6ffGEICh29l8Iw936SNMcYIs0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0389EF805CA; Thu, 18 Apr 2024 08:44:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00363F805CB;
	Thu, 18 Apr 2024 08:44:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EC50F8025A; Thu, 18 Apr 2024 08:43:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1EACF8003A
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 08:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1EACF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=y9bgnkYp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Unpk3zC1;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=y9bgnkYp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Unpk3zC1
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6B86E34A5E;
	Thu, 18 Apr 2024 06:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713422613;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=60G8of3gS7cctmrTlQSZrR+KoHO+FvZsBEhHd82NKFw=;
	b=y9bgnkYplswsJEa+d/unVhrH4MaF2yk1g8S1kYWBu7f5Y0qKwt7+X9aGQEPU/iikseBiJh
	uf689J+o+kR7BuT2EZVYGffJcNALx+89H3V6iVwi96O6x4f+rf7r/XbzBppSLV5TuOa8mj
	r5GgYWpum/60oh1iFd0On9WeRnj6A5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713422613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=60G8of3gS7cctmrTlQSZrR+KoHO+FvZsBEhHd82NKFw=;
	b=Unpk3zC18OGtawvsjCHDNoJizTctGvVNN+BI2F7yfzhpxySdb7majp45PL4PIMuHK7+nrM
	sIX8bHjbUOPCVqCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713422613;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=60G8of3gS7cctmrTlQSZrR+KoHO+FvZsBEhHd82NKFw=;
	b=y9bgnkYplswsJEa+d/unVhrH4MaF2yk1g8S1kYWBu7f5Y0qKwt7+X9aGQEPU/iikseBiJh
	uf689J+o+kR7BuT2EZVYGffJcNALx+89H3V6iVwi96O6x4f+rf7r/XbzBppSLV5TuOa8mj
	r5GgYWpum/60oh1iFd0On9WeRnj6A5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713422613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=60G8of3gS7cctmrTlQSZrR+KoHO+FvZsBEhHd82NKFw=;
	b=Unpk3zC18OGtawvsjCHDNoJizTctGvVNN+BI2F7yfzhpxySdb7majp45PL4PIMuHK7+nrM
	sIX8bHjbUOPCVqCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36AB513687;
	Thu, 18 Apr 2024 06:43:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mvscDBXBIGY9eAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Apr 2024 06:43:33 +0000
Date: Thu, 18 Apr 2024 08:43:41 +0200
Message-ID: <87il0fxjaa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/7] Add features, fixes and laptops for CS35L41 HDA
In-Reply-To: <20240411110813.330483-1-sbinding@opensource.cirrus.com>
References: <20240411110813.330483-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
Message-ID-Hash: N336LVLMVTAE6LDQS74PB5TWQII2GSKE
X-Message-ID-Hash: N336LVLMVTAE6LDQS74PB5TWQII2GSKE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N336LVLMVTAE6LDQS74PB5TWQII2GSKE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 Apr 2024 13:08:06 +0200,
Stefan Binding wrote:
> 
> This chain adds a number of improvements for CS35L41, including a new
> firmware loading feature, as well as some additional cleanup.
> 
> Patch 1 adds support for a new firmware tuning file which is used to set
> special tuning parameters used by the firmware. The HP Omen laptop added
> in patches 2 and 3 use such a feature.
> 
> Patch 4 changes the DSP1RX5/6 Source used by the firmware to depend on
> the boost type. A similar change in the ASoC driver will be needed later.
> 
> Patches 5 and 6 are cleanup patches, with the first of those re-using
> cs-amp-lib for calibration which as added for CS35L56 drivers, ensuring
> that all laptops are using the correct calibration values.
> 
> Patch 7 fixes a small error in the CS35L41 Property table for the
> Lenovo Legion slim 7 16ARHA7.
> 
> Changes since v1:
> - Fixed print statements based on warnings from kernel test robot
> 
> Richard Fitzgerald (1):
>   ALSA: hda: cs35l41: Remove redundant argument to
>     cs35l41_request_firmware_file()
> 
> Stefan Binding (6):
>   ALSA: hda: cs35l41: Set the max PCM Gain using tuning setting
>   ALSA: hda: cs35l41: Support HP Omen models without _DSD
>   ALSA: hda/realtek: Add quirks for HP Omen models using CS35L41
>   ALSA: hda: cs35l41: Update DSP1RX5/6 Sources for DSP config
>   ALSA: hda: cs35l41: Use shared cs-amp-lib to apply calibration
>   ALSA: hda: cs35l41: Remove Speaker ID for Lenovo Legion slim 7 16ARHA7

Now applied to for-next branch.  Thanks.


Takashi
