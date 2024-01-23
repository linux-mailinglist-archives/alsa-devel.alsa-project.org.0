Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC586838A05
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 10:11:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92026846;
	Tue, 23 Jan 2024 10:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92026846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706001088;
	bh=bNFdOL02CBO0C44RvehTzLxd9AZl2fYVPseevYUViPQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fU1DUJjLZtutegzgG07dDc7gXoUfARCdyp/h9NKbeUpSFK7y8GtKiNz8zalSvpR0V
	 ur8fg4DmECzE3GhnRtAcQZR3thUflb/dv7C00CmerYgUXBowatYghW4eQAIVEWA0to
	 HqN41jzdcfBeTjZBQcakw35O8D5cUsbbfGBz2tAM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90F48F8057C; Tue, 23 Jan 2024 10:10:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7513AF8057F;
	Tue, 23 Jan 2024 10:10:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2505F8028D; Tue, 23 Jan 2024 10:10:50 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E4AE0F800C1
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 10:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4AE0F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=D0x1Ak+4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=IYC6YHnA;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=D0x1Ak+4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=IYC6YHnA
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0558921F85;
	Tue, 23 Jan 2024 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706001044;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2QC3VW3QBC1l58sfwYheFxzzmmh18eRd63H9zA1NV1w=;
	b=D0x1Ak+4hF433f08BKxC9mPEzCwmmKzbEIVh5p6iazDYIFDdgQBYUzEaNIKpmklwLnpfH6
	GvRTyKkIXa8WeApq8h5q0aiXPyJiE8Ywi4jnlCed1sKEsrTpHVeNdbI8U/RWr3qwfTOSWo
	QoH6zjOyNVavnXZ3n5TDs5TNA2tjkFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706001044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2QC3VW3QBC1l58sfwYheFxzzmmh18eRd63H9zA1NV1w=;
	b=IYC6YHnAMSOBN27RdukcOOlGiZ9so+T0b6UWzaeVDQTna0NhSSN8qxi2waUBYo/L/od8aP
	nE5HTN+yVGxtd1Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706001044;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2QC3VW3QBC1l58sfwYheFxzzmmh18eRd63H9zA1NV1w=;
	b=D0x1Ak+4hF433f08BKxC9mPEzCwmmKzbEIVh5p6iazDYIFDdgQBYUzEaNIKpmklwLnpfH6
	GvRTyKkIXa8WeApq8h5q0aiXPyJiE8Ywi4jnlCed1sKEsrTpHVeNdbI8U/RWr3qwfTOSWo
	QoH6zjOyNVavnXZ3n5TDs5TNA2tjkFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706001044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2QC3VW3QBC1l58sfwYheFxzzmmh18eRd63H9zA1NV1w=;
	b=IYC6YHnAMSOBN27RdukcOOlGiZ9so+T0b6UWzaeVDQTna0NhSSN8qxi2waUBYo/L/od8aP
	nE5HTN+yVGxtd1Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8B6C136A4;
	Tue, 23 Jan 2024 09:10:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KWadK5OCr2U3fgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 23 Jan 2024 09:10:43 +0000
Date: Tue, 23 Jan 2024 10:10:43 +0100
Message-ID: <87msswmn3g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Julian Sikorski <belegdol@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org,
	Julian Sikorski <belegdol+github@gmail.com>
Subject: Re: [PATCH] Add a quirk for Yamaha YIT-W12TX transmitter
In-Reply-To: <20240123084935.2745-1-belegdol+github@gmail.com>
References: <20240123084935.2745-1-belegdol+github@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=D0x1Ak+4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IYC6YHnA
X-Spamd-Result: default: False [-1.34 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-1.53)[91.89%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[github];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_SOME(0.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[perex.cz,suse.com,alsa-project.org,vger.kernel.org,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0558921F85
Message-ID-Hash: BHRKMWFPAFTMNFALZX5VELYJN7RC27CO
X-Message-ID-Hash: BHRKMWFPAFTMNFALZX5VELYJN7RC27CO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BHRKMWFPAFTMNFALZX5VELYJN7RC27CO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 23 Jan 2024 09:49:35 +0100,
Julian Sikorski wrote:
> 
> The device fails to initialize otherwise, giving the following error:
> [ 3676.671641] usb 2-1.1: 1:1: cannot get freq at ep 0x1
> 
> Signed-off-by: Julian Sikorski <belegdol+github@gmail.com>

Thanks, I applied now.

But at the next time, try to check the following:

- Use a proper subject prefix; each subsystem has an own one, and this
  case would be "ALSA: usb-audio: Add a quirk..."

- Use the same mail address for both author and sign-off
  
- Put Cc-to-stable in the patch description instead of actually
  sending to it now


Takashi
