Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B06F6909C3B
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jun 2024 09:39:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCE9D84A;
	Sun, 16 Jun 2024 09:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCE9D84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718523544;
	bh=xsJunObOHYvTmkmmNYAdoRsCPO9tBXmwA4HekcNlrJ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Da1qxL5FjqqH2ec3GjXTeRlapM4NOlYzLHYlGXDCuDVYqdLPkNaZ6onYbzuZr9LbP
	 Gbfwap9ORI5JBHnDlm1OZ1EBbQ9bX8lJe690zL1WONLAMW1EOz1YzRQaYQ9bTVCoOG
	 xDvTuBDQSX3wCTj9LykqFPWQhtVE+qw2hBUUF0aA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05630F805B4; Sun, 16 Jun 2024 09:38:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27BF2F8058C;
	Sun, 16 Jun 2024 09:38:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAF02F8023A; Sun, 16 Jun 2024 09:38:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56C2DF800ED
	for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2024 09:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56C2DF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=yOIDwBEW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jtzf6lfq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=yOIDwBEW;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jtzf6lfq
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4E5945CCCA;
	Sun, 16 Jun 2024 07:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718523492;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Tap0GsPP7pc1P9FCevbnU7pnjtJrdhQybL5YgnNd38=;
	b=yOIDwBEWrttlcFBuJ/SIjpO1wS3Z0EN/rF2yP03WdHVi2yrnRqtUUeU6lsJz638pmoCl6m
	oLH8PWJHohJ3TC/H0578cAT33pQWBdqTlDQyfTL33JcohpQyATz6l48QcdvkKPEqDBm9yi
	V43VXtuHvdA0fDHfbhlR98ABdqIkwNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718523492;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Tap0GsPP7pc1P9FCevbnU7pnjtJrdhQybL5YgnNd38=;
	b=jtzf6lfqRKYP52PhyET904lY0Abh8g75Y4TDbmD/+e3GcWIV6xlceLd3FHtYAfajWhWuXs
	PkziJ8lhtyTQoGDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yOIDwBEW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jtzf6lfq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718523492;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Tap0GsPP7pc1P9FCevbnU7pnjtJrdhQybL5YgnNd38=;
	b=yOIDwBEWrttlcFBuJ/SIjpO1wS3Z0EN/rF2yP03WdHVi2yrnRqtUUeU6lsJz638pmoCl6m
	oLH8PWJHohJ3TC/H0578cAT33pQWBdqTlDQyfTL33JcohpQyATz6l48QcdvkKPEqDBm9yi
	V43VXtuHvdA0fDHfbhlR98ABdqIkwNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718523492;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Tap0GsPP7pc1P9FCevbnU7pnjtJrdhQybL5YgnNd38=;
	b=jtzf6lfqRKYP52PhyET904lY0Abh8g75Y4TDbmD/+e3GcWIV6xlceLd3FHtYAfajWhWuXs
	PkziJ8lhtyTQoGDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E75B713AB9;
	Sun, 16 Jun 2024 07:38:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lylBN2OWbmboCwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 16 Jun 2024 07:38:11 +0000
Date: Sun, 16 Jun 2024 09:38:36 +0200
Message-ID: <87a5jl5ocj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ajrat Makhmutov <rautyrauty@gmail.com>
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	luke@ljones.dev,
	shenghao-ding@ti.com,
	simont@opensource.cirrus.com,
	foss@athaariq.my.id,
	rf@opensource.cirrus.com,
	wzhd@ustc.edu,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable headset mic on IdeaPad
 330-17IKB 81DM
In-Reply-To: <20240615125457.167844-1-rauty@altlinux.org>
References: <20240615125457.167844-1-rauty@altlinux.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-5.23 / 50.00];
	BAYES_HAM(-2.72)[98.79%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4E5945CCCA
Message-ID-Hash: WSP3W2V2BRETHSIOL5GI5YMIDNAIG2T2
X-Message-ID-Hash: WSP3W2V2BRETHSIOL5GI5YMIDNAIG2T2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WSP3W2V2BRETHSIOL5GI5YMIDNAIG2T2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 15 Jun 2024 14:54:57 +0200,
Ajrat Makhmutov wrote:
> 
> Headset microphone do not work out of the box with this laptop. This
> quirk fixes it. Zihao Wang specified the wrong subsystem id in his patch.
> 
> Link: https://lore.kernel.org/all/20220424084120.74125-1-wzhd@ustc.edu/
> Fixes: 3b79954fd00d ("ALSA: hda/realtek: Add quirk for Yoga Duet 7 13ITL6 speakers")
> Signed-off-by: Ajrat Makhmutov <rauty@altlinux.org>

Your From address and Signed-off-by address are different.
Could you try to align them?

I can take as-is if inevitably necessary, but usually it's a wrong
sign.


thanks,

Takashi
