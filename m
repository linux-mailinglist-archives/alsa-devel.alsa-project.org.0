Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AEC95AF64
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 09:34:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DB2782A;
	Thu, 22 Aug 2024 09:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DB2782A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724312097;
	bh=9obgFoJVDuu+cuXVOOYGhKXD3vcRQoTWjiYaFflOjZI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e1TG9PO4pZdwG/0415zG1yEXZwfMCAnulrSyOzqoVd3jY8I6E4JEYirNLYWtSk4hz
	 hFmO3lcYevcDKweJSvhVtxs8T9xPVf6YZ4ZEM+kOIlaEoiVfRLycdFIe0Ub4HqyT1v
	 ZrxBoWsNX4o5dtR8SvcDL/8UOePY+pU6hqWSUPMQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B06CF8049C; Thu, 22 Aug 2024 09:34:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24091F8058C;
	Thu, 22 Aug 2024 09:34:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AFAEF80496; Thu, 22 Aug 2024 09:34:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5201DF800F0
	for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2024 09:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5201DF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=PgvhaeOC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zhTWgoN6;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=vfp2QdE6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=khIv14Xp
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3E40121D3A;
	Thu, 22 Aug 2024 07:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724312045;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7EZQQPkbFojRcmTnsRGTQ4XEdGHuJu7FZNRbUuNuqIM=;
	b=PgvhaeOCKgN1UMT2FBXJo9kBb35b04VW9MDiSznxmpya/PMaGQl3qOj5n9WBZA6De2GXU5
	bMXnFXC6YQzkpoetHrmyrjURkRrQnObJpWpNO3tqvdF1/EPl1gc2x6LTRfUDS1GrB32QmN
	ZGZ3dNRb1160JJkuROZY7ggtCB5p8bE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724312045;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7EZQQPkbFojRcmTnsRGTQ4XEdGHuJu7FZNRbUuNuqIM=;
	b=zhTWgoN6KbDjKoxq1mRqgmmp/vfD/qD993sMVQrwMwsOmBja9X/det5eIKwfwqO5U0z6z4
	+oTRBqL/2nUOL8BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724312044;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7EZQQPkbFojRcmTnsRGTQ4XEdGHuJu7FZNRbUuNuqIM=;
	b=vfp2QdE65pKqvbcLECUXN0rZU8/2thisdVxvzelPlaG0cmwcwexZexlshE+s8jzvsSAzio
	RZM9TwcDDzerbW2SSS8ubqC+h7jb6vtBfTTPO1avbf/icqmXsqRv1C5jyngece5S6BJnPL
	oN8dgkpaUIzozYWhVGRDOBfxeeIRjMI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724312044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7EZQQPkbFojRcmTnsRGTQ4XEdGHuJu7FZNRbUuNuqIM=;
	b=khIv14XpIv2R4Y5BwE0miwFK/ZPbD16rrEwJvM0rFz4gQVegrI6KmZZfayQ6Y2gpVi96gj
	G8IVwtd+63FwDeCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1964713297;
	Thu, 22 Aug 2024 07:34:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rIvVBOzpxmYkWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Aug 2024 07:34:04 +0000
Date: Thu, 22 Aug 2024 09:34:46 +0200
Message-ID: <87frqxnh7t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: ALC256 headphone no sound
In-Reply-To: <bb8e2de30d294dc287944efa0667685a@realtek.com>
References: <bb8e2de30d294dc287944efa0667685a@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: 3GXLV32T2PDTDYCYLVL3R65MCJE5POVM
X-Message-ID-Hash: 3GXLV32T2PDTDYCYLVL3R65MCJE5POVM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GXLV32T2PDTDYCYLVL3R65MCJE5POVM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 22 Aug 2024 05:14:06 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach patch will solve headphone issue for alc256.
> Many Thanks.

There was a minor coding-style issue, and I corrected locally and
applied.


thanks,

Takashi
