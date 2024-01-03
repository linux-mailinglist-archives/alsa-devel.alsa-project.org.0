Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 475D0822ADB
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 11:03:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67506E8A;
	Wed,  3 Jan 2024 11:02:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67506E8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704276186;
	bh=46H93ySY6KEfUSF6WHzoBxNZBXOBQRDTivQv1DO5/to=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zm0n0k5FqsFedenzQCcP9ajcK7RAG5AuwzrWh7kjhqi0C6Iv4BJ/zUbDS2GYEz0+8
	 csYT6Gxv0x3+gCalcP5M0dZjdu0tmQiPZIpFHqKvblyo69R7Z3AwJz5tAs272MP1mp
	 OjJLghC5f7I+8iEq23WPPCBmo6giv9RNsnOoJic8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 942EDF8055A; Wed,  3 Jan 2024 11:02:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7F7EF80578;
	Wed,  3 Jan 2024 11:02:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8EA8F80424; Wed,  3 Jan 2024 11:01:42 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 45B12F80022
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 11:01:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45B12F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=csPnfQS9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=BE9BWfc3;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=csPnfQS9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=BE9BWfc3
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 78B1F22000;
	Wed,  3 Jan 2024 10:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704276095;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRrlLOpUS4Z66xJflc9R/S145LEw3nb0i4YZ3phxOtA=;
	b=csPnfQS9M5QU2QqH7JDwqqGD6CM3dLH2+gP9oEJTVi9C2ZshkT4btm0pf7Evf0je3aOE/e
	oaePhQzne7j5Zt4NG2E73Y+UH/n9Lt8VvEgWtVVnTpUM5JiX/1VDkkvmIjy7SKglxrE/JU
	UIhaLNLkxxMenT3XEsGnjLkGLQqdohw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704276095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRrlLOpUS4Z66xJflc9R/S145LEw3nb0i4YZ3phxOtA=;
	b=BE9BWfc3P9bGZXFttHPxV0tG4rfn+tb8w1Em/0KWdSALYyApVsO6+qxXpTiao2XtRIIPGf
	496PLZOZMblWvhBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704276095;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRrlLOpUS4Z66xJflc9R/S145LEw3nb0i4YZ3phxOtA=;
	b=csPnfQS9M5QU2QqH7JDwqqGD6CM3dLH2+gP9oEJTVi9C2ZshkT4btm0pf7Evf0je3aOE/e
	oaePhQzne7j5Zt4NG2E73Y+UH/n9Lt8VvEgWtVVnTpUM5JiX/1VDkkvmIjy7SKglxrE/JU
	UIhaLNLkxxMenT3XEsGnjLkGLQqdohw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704276095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRrlLOpUS4Z66xJflc9R/S145LEw3nb0i4YZ3phxOtA=;
	b=BE9BWfc3P9bGZXFttHPxV0tG4rfn+tb8w1Em/0KWdSALYyApVsO6+qxXpTiao2XtRIIPGf
	496PLZOZMblWvhBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D90A13AA6;
	Wed,  3 Jan 2024 10:01:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1NCwBX8wlWXUdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 03 Jan 2024 10:01:35 +0000
Date: Wed, 03 Jan 2024 11:01:34 +0100
Message-ID: <87h6juburl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lorenz Brun <lorenz@brun.one>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda: cs35l41: Support more HP models without
 _DSD
In-Reply-To: <20240102214821.3394810-1-lorenz@brun.one>
References: <20240102214821.3394810-1-lorenz@brun.one>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.84 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.53)[97.91%]
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=csPnfQS9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BE9BWfc3
X-Rspamd-Queue-Id: 78B1F22000
Message-ID-Hash: GXCLM32WAEKJ7EJYU7QZSG5AIIRXQDXQ
X-Message-ID-Hash: GXCLM32WAEKJ7EJYU7QZSG5AIIRXQDXQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GXCLM32WAEKJ7EJYU7QZSG5AIIRXQDXQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 02 Jan 2024 22:48:20 +0100,
Lorenz Brun wrote:
> 
> This adds overrides for a series of notebooks using a common config
> taken from HP's proprietary Windows driver.
> 
> This has been tested on a HP 15-ey0xxxx device (subsystem 103C8A31)
> together with another Realtek quirk and the calibration files from the
> proprietary driver.
> 
> Signed-off-by: Lorenz Brun <lorenz@brun.one>

Applied now.  Thanks.


Takashi
