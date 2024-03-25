Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFA388AFDE
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 20:25:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F346520C4;
	Mon, 25 Mar 2024 20:25:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F346520C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711394736;
	bh=FVbkQCzAdIw4q3itUG9P08Dcata9gXWtTydpboh50RU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q4tPLQmApeOsCB5yD3hpGHCdVqujzd1VoESHaUhjn0MK42yGdhCTGMVBKH65qhX1H
	 4uw+C/ljQBOB3cQXMdzmdJ49kJAr//BeWSwiF9LRdea5XqeAoVxyCrSqIxMEY4GsIi
	 lgkdEJ0GiglXYY8S67WG2VcB17n7lZNnM0iBCqUc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88C8CF80602; Mon, 25 Mar 2024 17:20:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 321F9F80601;
	Mon, 25 Mar 2024 17:20:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22055F805E8; Mon, 25 Mar 2024 17:20:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9986F805E3
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 17:20:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9986F805E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=dFQALtxg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3Jr5cvn4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=dFQALtxg;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3Jr5cvn4
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 34E423476E;
	Mon, 25 Mar 2024 16:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711383630;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=47zzowitN7FnCAMt8Wzhn4k4ZMZM2cQ36obDnp4K5bw=;
	b=dFQALtxgQrLApuv3dK4Gk/Y1evBLn6QNuDtcFGSoQhHViz9dkWKqEMTg6JyRXRSG/hWtd6
	NJe0Z5pwIpKu6GZeXPobp9tNQSQr9Gz3JPVUPjxfrqMaIIsZkLBOZBttrS2FJRLOHqyltV
	MFIQCNbS5KmNU14Igwb6L+hpKOGfXF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711383630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=47zzowitN7FnCAMt8Wzhn4k4ZMZM2cQ36obDnp4K5bw=;
	b=3Jr5cvn4sJk308DRLI/MyI7PwY0BRTNyQk5dth9jsGmT6eFXlKFVXHFA4/QMYuzIC58xeY
	5PZXJlmIWEBZItAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711383630;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=47zzowitN7FnCAMt8Wzhn4k4ZMZM2cQ36obDnp4K5bw=;
	b=dFQALtxgQrLApuv3dK4Gk/Y1evBLn6QNuDtcFGSoQhHViz9dkWKqEMTg6JyRXRSG/hWtd6
	NJe0Z5pwIpKu6GZeXPobp9tNQSQr9Gz3JPVUPjxfrqMaIIsZkLBOZBttrS2FJRLOHqyltV
	MFIQCNbS5KmNU14Igwb6L+hpKOGfXF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711383630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=47zzowitN7FnCAMt8Wzhn4k4ZMZM2cQ36obDnp4K5bw=;
	b=3Jr5cvn4sJk308DRLI/MyI7PwY0BRTNyQk5dth9jsGmT6eFXlKFVXHFA4/QMYuzIC58xeY
	5PZXJlmIWEBZItAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF1A213503;
	Mon, 25 Mar 2024 16:20:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WuaCOE2kAWYTFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 Mar 2024 16:20:29 +0000
Date: Mon, 25 Mar 2024 17:20:31 +0100
Message-ID: <87o7b2waeo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>,
	"Simon Trimmer" <simont@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda: cs35l56: Raise device name message log level
In-Reply-To: <20240325142937.257869-1-rf@opensource.cirrus.com>
References: <20240325142937.257869-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.15 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:97:from];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.14)[88.64%]
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dFQALtxg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3Jr5cvn4
X-Rspamd-Queue-Id: 34E423476E
Message-ID-Hash: ELO3CX5NOBP67BX665FD3KFGJSWECUDI
X-Message-ID-Hash: ELO3CX5NOBP67BX665FD3KFGJSWECUDI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ELO3CX5NOBP67BX665FD3KFGJSWECUDI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 25 Mar 2024 15:29:37 +0100,
Richard Fitzgerald wrote:
> 
> From: Simon Trimmer <simont@opensource.cirrus.com>
> 
> The system and amplifier names influence which firmware and tuning files
> are downloaded to the device; log these values to aid end-user system
> support.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Thanks, applied now.


Takashi
