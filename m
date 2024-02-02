Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DFD8475B6
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 18:07:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5892C844;
	Fri,  2 Feb 2024 18:07:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5892C844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706893640;
	bh=BpK08wDTcgdXavtNX448erqRPqnfLK+o8n6BTGSGMyE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G2DS6OlUPW9EsMBIbaS4GP4zqn/km6TioiYhtiWqQjOKp3yUt4wYXH1H16dsTUQpo
	 AyHJeT5pHXvfPEkeiH0hMe4I/hxxGVAcgIfzN5rGZz8PesonxymjFL2lMnYJEGxnH6
	 4xAaUluGxpUs3DBAS6HiiMySESJ1YoB5WuZ3xeUk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02B99F8057E; Fri,  2 Feb 2024 18:06:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56E81F805AA;
	Fri,  2 Feb 2024 18:06:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11FABF8055C; Fri,  2 Feb 2024 18:06:41 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DB9B0F800E3
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 18:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB9B0F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=gTZvNztB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rFJQ1ubs;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=gTZvNztB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rFJQ1ubs
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF76521F6B;
	Fri,  2 Feb 2024 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706893593;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ucgZQctdh62JeDhECOYgc2GaF1+IHkTyWVsFmEYdamI=;
	b=gTZvNztB0rZBW487G2QczNcvV/R8jahxRBhPnCG5MJ3Y0JUpX/6Z0jWPd4bJ33I7G3XipV
	CBdi95Wkt3HQ/J2/xW5Ofg/mjzGmaPjrBxTiENzfaiVs2pJKRWXB+OC3Q7plziAvky1qxo
	CWjMDJk6cZPsKMC3Wcjy2CBgGY8Vmkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706893593;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ucgZQctdh62JeDhECOYgc2GaF1+IHkTyWVsFmEYdamI=;
	b=rFJQ1ubsRiLgO+GD5ZEu8xL4K74BI0EOl24TjqalmrN6+UFelDSe3sFDPxr7igSaDUUUZL
	CwXew/YrkfxZPXCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706893593;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ucgZQctdh62JeDhECOYgc2GaF1+IHkTyWVsFmEYdamI=;
	b=gTZvNztB0rZBW487G2QczNcvV/R8jahxRBhPnCG5MJ3Y0JUpX/6Z0jWPd4bJ33I7G3XipV
	CBdi95Wkt3HQ/J2/xW5Ofg/mjzGmaPjrBxTiENzfaiVs2pJKRWXB+OC3Q7plziAvky1qxo
	CWjMDJk6cZPsKMC3Wcjy2CBgGY8Vmkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706893593;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ucgZQctdh62JeDhECOYgc2GaF1+IHkTyWVsFmEYdamI=;
	b=rFJQ1ubsRiLgO+GD5ZEu8xL4K74BI0EOl24TjqalmrN6+UFelDSe3sFDPxr7igSaDUUUZL
	CwXew/YrkfxZPXCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FA11139AB;
	Fri,  2 Feb 2024 17:06:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ha6uIRkhvWWvSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 02 Feb 2024 17:06:33 +0000
Date: Fri, 02 Feb 2024 18:06:33 +0100
Message-ID: <87r0hubxt2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1] ALSA: hda/realtek: Remove two HP Laptops using CS35L41
In-Reply-To: <5792f9bc-b77d-4a90-be61-a09797295a8b@opensource.cirrus.com>
References: <20240202161727.321373-1-sbinding@opensource.cirrus.com>
	<87v876bz6b.wl-tiwai@suse.de>
	<5792f9bc-b77d-4a90-be61-a09797295a8b@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gTZvNztB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rFJQ1ubs
X-Spamd-Result: default: False [-2.37 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
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
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.06)[87.81%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CF76521F6B
Message-ID-Hash: KJQNKRYDNQMWWWJS2WCAT636PIXPJIDH
X-Message-ID-Hash: KJQNKRYDNQMWWWJS2WCAT636PIXPJIDH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KJQNKRYDNQMWWWJS2WCAT636PIXPJIDH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 02 Feb 2024 17:49:06 +0100,
Stefan Binding wrote:
> 
> Hi Takashi,
> 
> On 02/02/2024 16:37, Takashi Iwai wrote:
> > On Fri, 02 Feb 2024 17:17:27 +0100,
> > Stefan Binding wrote:
> >> These two HP laptops are changing configurations.
> > What exactly does this mean?  The PCI SSIDs are no longer valid, or
> > the quirk became wrong, or what?
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
> The SKUs, and associated SSIDs, are no longer going to include the CS35L41.
> They may come back, but will need a different quirk.Sorry for the churn.

OK, care to resubmit with those explanations?


thanks,

Takashi
