Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBFC852999
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 08:18:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BE0682A;
	Tue, 13 Feb 2024 08:18:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BE0682A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707808693;
	bh=+vzgJHGB21CmFNaPwMTlSN7copnCy4aT9rIMOVIU3rw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c2g7F8sfi2dAUv9RAIdbEe790IIZgkL2kTXnp+fj0y2Uk6c7dYLAOhUcq0d023Sma
	 AjpfZ94VOToduGoHxTUr/sz8AkgvUnQbS1jEOYEOMYxsuQI0kDoBt9wc64oF15PcBs
	 nPgRVYnDro6bMeIBnvZ5siDqiZhDPYBEry0xbefU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C666F805A0; Tue, 13 Feb 2024 08:17:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E54DF805AA;
	Tue, 13 Feb 2024 08:17:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08341F80238; Tue, 13 Feb 2024 08:13:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A80A2F800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 08:12:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A80A2F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=fHAkAZ0E;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uxQoIPVl;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=fHAkAZ0E;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uxQoIPVl
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5C2661F7D4;
	Tue, 13 Feb 2024 07:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707808376;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V2HMBYlo6MPzo/mOplX1T0/FFqhj2lYh2wTDDLwynds=;
	b=fHAkAZ0EOM9dLUSBKkYKZfBibV94nUy4Uf5+LlDe8xiZvzoRQeJxqQZXe0XUSDFBo1mFTH
	ghlC5/TxNAmaviSRxrDaKddEWCvsGfbZDBkKeMaAZ7UDsrIG7/EKAm7masWTfEKt30MQ22
	CRW/B2Impffmw2Lr/qRKxsfUAQ8KZmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707808376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V2HMBYlo6MPzo/mOplX1T0/FFqhj2lYh2wTDDLwynds=;
	b=uxQoIPVlQVrX9wvqHh6EgUIHqdrDgzmD0HHGmkjn2GlB31nQdTjowE+CBPIbDmdHwKnuuv
	g29WU73PW9/yJeBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707808376;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V2HMBYlo6MPzo/mOplX1T0/FFqhj2lYh2wTDDLwynds=;
	b=fHAkAZ0EOM9dLUSBKkYKZfBibV94nUy4Uf5+LlDe8xiZvzoRQeJxqQZXe0XUSDFBo1mFTH
	ghlC5/TxNAmaviSRxrDaKddEWCvsGfbZDBkKeMaAZ7UDsrIG7/EKAm7masWTfEKt30MQ22
	CRW/B2Impffmw2Lr/qRKxsfUAQ8KZmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707808376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V2HMBYlo6MPzo/mOplX1T0/FFqhj2lYh2wTDDLwynds=;
	b=uxQoIPVlQVrX9wvqHh6EgUIHqdrDgzmD0HHGmkjn2GlB31nQdTjowE+CBPIbDmdHwKnuuv
	g29WU73PW9/yJeBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E59E513404;
	Tue, 13 Feb 2024 07:12:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0bPaNncWy2XLNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Feb 2024 07:12:55 +0000
Date: Tue, 13 Feb 2024 08:12:55 +0100
Message-ID: <87il2skfbc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "T. Kudela" <ramzes005@gmail.com>
Cc: james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	luke@ljones.dev,
	andy.chi@canonical.com,
	shenghao-ding@ti.com,
	ruinairas1992@gmail.com,
	vitalyr@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Add Lenovo Legion 7i gen7 sound quirk
In-Reply-To: <20240212193327.59507-1-ramzes005@gmail.com>
References: <20240212193327.59507-1-ramzes005@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fHAkAZ0E;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uxQoIPVl
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.07 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_TWELVE(0.00)[17];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FREEMAIL_CC(0.00)[cirrus.com,opensource.cirrus.com,perex.cz,suse.com,realtek.com,ljones.dev,canonical.com,ti.com,gmail.com,alsa-project.org,vger.kernel.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.56)[98.05%]
X-Rspamd-Queue-Id: 5C2661F7D4
Message-ID-Hash: LXAPIDCBKLBSSDQYFGZGCUANMBFXNIK2
X-Message-ID-Hash: LXAPIDCBKLBSSDQYFGZGCUANMBFXNIK2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LXAPIDCBKLBSSDQYFGZGCUANMBFXNIK2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 Feb 2024 20:33:27 +0100,
T. Kudela wrote:
> 
> Add sound support for the Legion 7i gen7 laptop (16IAX7).
> 
> Signed-off-by: T. Kudela <ramzes005@gmail.com>

Use a full real name for your sign-off, as it's a legal requirement.


thanks,

Takashi
