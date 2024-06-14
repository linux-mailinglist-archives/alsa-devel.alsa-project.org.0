Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF186908C11
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2024 14:53:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA8071F5;
	Fri, 14 Jun 2024 14:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA8071F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718369603;
	bh=axe9h9XJQnqzIl4Osu4Tu67uLt+HRXkbhNrY/mdVmSw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UIusKr7Z5Pj6Jn7HNdptwinjvvQtVQTtsmew9aBWPy5lssKpmntGlYcFo5d+YK0f0
	 J1Bwy5TPOFMgFf2jx1rXICLVDmV+8/McbBqdRkK6LFfzJBP44l5Dl7QOKzVXMTr4xL
	 HLEBIZO/YnGtBG/KtNaYKdFlx58lSFFAGL9Kk+EY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE839F80578; Fri, 14 Jun 2024 14:52:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52F3DF805AF;
	Fri, 14 Jun 2024 14:52:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 408B7F80496; Fri, 14 Jun 2024 14:52:11 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 782E3F800FA
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 14:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 782E3F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Eg9Ci+UC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dhzwJL1j;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Eg9Ci+UC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dhzwJL1j
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9CC6C33806;
	Fri, 14 Jun 2024 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718369522;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2xVdax+HP6ifRzg30XsgcfzY2o3oHkgLBqIBm6pxQzk=;
	b=Eg9Ci+UCo2I+U623jvU2SedRezKEdehdDlWHSxLcuzHplJLi8UlzQRzaZGQvJD+4wkBqyD
	Mjqw4mte9LZVAig4fmK+LTYWhlNaczhcPS60N7+DtOELDRPVCNQOZ/c3mcUn/M7A+iiEol
	IBFJtRQ0gvoxY7H+F7zQMVOkh0UKvtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718369522;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2xVdax+HP6ifRzg30XsgcfzY2o3oHkgLBqIBm6pxQzk=;
	b=dhzwJL1jNgsH5HVeOzbLP22qCvW4XMnsRFJtmujDMTRHi1Arr+wcT+EDFL42v5FPdDF4Vj
	8CTDAIlrsR9dG1CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Eg9Ci+UC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dhzwJL1j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718369522;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2xVdax+HP6ifRzg30XsgcfzY2o3oHkgLBqIBm6pxQzk=;
	b=Eg9Ci+UCo2I+U623jvU2SedRezKEdehdDlWHSxLcuzHplJLi8UlzQRzaZGQvJD+4wkBqyD
	Mjqw4mte9LZVAig4fmK+LTYWhlNaczhcPS60N7+DtOELDRPVCNQOZ/c3mcUn/M7A+iiEol
	IBFJtRQ0gvoxY7H+F7zQMVOkh0UKvtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718369522;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2xVdax+HP6ifRzg30XsgcfzY2o3oHkgLBqIBm6pxQzk=;
	b=dhzwJL1jNgsH5HVeOzbLP22qCvW4XMnsRFJtmujDMTRHi1Arr+wcT+EDFL42v5FPdDF4Vj
	8CTDAIlrsR9dG1CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5CC2C13AB1;
	Fri, 14 Jun 2024 12:52:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Rs5vFfI8bGaqMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 14 Jun 2024 12:52:02 +0000
Date: Fri, 14 Jun 2024 14:52:27 +0200
Message-ID: <878qz78z5g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>,
	<soyer@irl.hu>,
	<shenghao-ding@ti.com>,
	<kevin-lu@ti.com>,
	<baojun.xu@ti.com>
Subject: Re: [PATCH 0/3] ALSA: hda: Component should be unbound before
 deconstruction
In-Reply-To: <20240613133713.75550-1-simont@opensource.cirrus.com>
References: <20240613133713.75550-1-simont@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 9CC6C33806
Message-ID-Hash: KLZCFJTFC33JHTT7RONX4A2KF3L26BI7
X-Message-ID-Hash: KLZCFJTFC33JHTT7RONX4A2KF3L26BI7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KLZCFJTFC33JHTT7RONX4A2KF3L26BI7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jun 2024 15:37:10 +0200,
Simon Trimmer wrote:
> 
> Small chain of fixes to correct hda drivers using the hda component
> infrastructure so that they unregister their component before proceeding
> to deconstruct the driver.
> 
> These three patches been separated from the chain "[PATCH v2 0/7] ALSA:
> hda: Improvements to hda_component"
> 
> Simon Trimmer (3):
>   ALSA: hda: cs35l56: Component should be unbound before deconstruction
>   ALSA: hda: cs35l41: Component should be unbound before deconstruction
>   ALSA: hda: tas2781: Component should be unbound before deconstruction

Applied to for-linus branch now.


thanks,

Takashi
