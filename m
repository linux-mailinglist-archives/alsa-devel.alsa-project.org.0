Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74257876A3A
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 18:52:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B87E6844;
	Fri,  8 Mar 2024 18:52:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B87E6844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709920342;
	bh=jSd7IIXQ7VLOmg5dOyp3aWtcasoACFv/Wzn1lQdNPGQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s3WHUSaHfI0k4UyS0Rfv0yuo+1QNepQTfkAXhs0tmAewVR1+ZYvxmihPAdbMGIK8p
	 woT2SOLq4ZUxu3dr5K6+j8elYigFIUK3gimux1wGz9A7Al84NAHSlhq5mqizb3EpoC
	 K8VWA1IP0JpW3VSAH8HlrAFhRW+wQTNBEkH+JbSQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A86DF80580; Fri,  8 Mar 2024 18:51:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67473F8059F;
	Fri,  8 Mar 2024 18:51:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9613CF80093; Fri,  8 Mar 2024 18:33:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	TIME_LIMIT_EXCEEDED,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D60DCF80093
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 18:28:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D60DCF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Q3v8WJFx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JabkKrle;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Q3v8WJFx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JabkKrle
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 32C7F38984;
	Fri,  8 Mar 2024 17:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709917300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JplA17DpVz2NSdYvWMuTpMBcFjE3T30ebSwmXrG1t4E=;
	b=Q3v8WJFx7o2fsPQpSOC/SLdlrPBcMqqbM6FKV/IVhO/MwGfFJJj26pmz4LyhP1E1Bp8rlY
	pldcsGR/3ihuclHzqHasc4eqEx87v58Iq+umN6WBJ3G5ZmWQGzBISyzBrKQbT/959FidAs
	U2rTWXmsUjBo/XeO+r1UtYvIs2xmU3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709917300;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JplA17DpVz2NSdYvWMuTpMBcFjE3T30ebSwmXrG1t4E=;
	b=JabkKrleE3jFzGoB6O82N27VgsmfyaAH0LcGEa2IiIIVG+usEXnMxjUP9EFgUgriAlTnsX
	YoOL9JKpQtqZkoDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709917300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JplA17DpVz2NSdYvWMuTpMBcFjE3T30ebSwmXrG1t4E=;
	b=Q3v8WJFx7o2fsPQpSOC/SLdlrPBcMqqbM6FKV/IVhO/MwGfFJJj26pmz4LyhP1E1Bp8rlY
	pldcsGR/3ihuclHzqHasc4eqEx87v58Iq+umN6WBJ3G5ZmWQGzBISyzBrKQbT/959FidAs
	U2rTWXmsUjBo/XeO+r1UtYvIs2xmU3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709917300;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JplA17DpVz2NSdYvWMuTpMBcFjE3T30ebSwmXrG1t4E=;
	b=JabkKrleE3jFzGoB6O82N27VgsmfyaAH0LcGEa2IiIIVG+usEXnMxjUP9EFgUgriAlTnsX
	YoOL9JKpQtqZkoDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDB0A133DC;
	Fri,  8 Mar 2024 17:01:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PvNnMHNE62XTYgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 08 Mar 2024 17:01:39 +0000
Date: Fri, 08 Mar 2024 18:01:38 +0100
Message-ID: <87bk7od5e5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <broonie@kernel.org>,
	<tiwai@suse.com>,
	<hdegoede@redhat.com>,
	<lenb@kernel.org>,
	<rafael@kernel.org>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>,
	<platform-driver-x86@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>
Subject: Re: [PATCH 0/3] ALSA: Add support for Cirrus Logic CS35L54 and
 CS35L57
In-Reply-To: <20240308135900.603192-1-rf@opensource.cirrus.com>
References: <20240308135900.603192-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Q3v8WJFx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JabkKrle
X-Spamd-Result: default: False [-2.82 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 URIBL_BLOCKED(0.00)[suse.de:dkim];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.51)[91.76%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Queue-Id: 32C7F38984
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: NQ3MHVJI3XQWXZ5U5IXE3PROCPUIEN63
X-Message-ID-Hash: NQ3MHVJI3XQWXZ5U5IXE3PROCPUIEN63
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NQ3MHVJI3XQWXZ5U5IXE3PROCPUIEN63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 08 Mar 2024 14:58:57 +0100,
Richard Fitzgerald wrote:
> 
> The CS35L54 and CS35L57 are Boosted Smart Amplifiers. The CS35L54 has
> I2C/SPI control and I2S/TDM audio. The CS35L57 also has SoundWire
> control and audio.
>     
> The hardware differences between L54, L56 and L57 do not affect the
> driver control interface so they can all be handled by the same driver.
> 
> The HDA patch has build dependencies on the ASoC patch.
> 
> The final patch updates serial-multi-instantiate and scan.c to trap
> the ACPI HID for HDA systems that declare multiple amps all under one
> Device() node. This patch does not have any build dependency on the
> first two patches so can be taken separately.
> 
> Simon Trimmer (3):
>   ASoC: cs35l56: Add support for CS35L54 and CS35L57
>   ALSA: hda: cs35l56: Add support for CS35L54 and CS35L57
>   platform/x86: serial-multi-instantiate: Add support for CS35L54 and
>     CS35L57

Applied all three patches to for-next branch now.


thanks,

Takashi
