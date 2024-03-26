Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F25188C6C1
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:23:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B28482BAE;
	Tue, 26 Mar 2024 16:22:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B28482BAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711466585;
	bh=fBNcQUHOtvyZsysftwY23WAq61KVO16Ox520bWwmTKE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DiUOjQL1fXzKl0cM2K14Ru3BWPRSBgJEZ5Sx0gAAH9l7da2oEdcvLEbeW7dhypZWu
	 ogbVLoa3VWZOjmxKTbY6j42Ta9hC6U5aIwDKU6EXOeixAbQlFeDUVgfeVHj4ye/t/J
	 FsFbjlujASGk/HJyjC/NBIRIyle0knWtPc296b24=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E625F80589; Tue, 26 Mar 2024 16:22:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1174FF80571;
	Tue, 26 Mar 2024 16:22:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA533F8025F; Tue, 26 Mar 2024 16:22:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27DFCF80093
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:22:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27DFCF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hWjOzW1H;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pNMv7idU;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=hWjOzW1H;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pNMv7idU
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 73B3221E3D;
	Tue, 26 Mar 2024 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711466554;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KXH5uUDLtBRAB47YTVHB6bZditscTqY6M49f3hWQIm0=;
	b=hWjOzW1HqNS1ii0R8rstNDFJMG0KONLVKpbkNxwUISXQ3rq84H7y7dbv2TAc/G9D5vxGTU
	uY7/9kFo2jqr45S8FQXU8mZjC4ur4oIIdBddNeYGV0KekJFMeOoCzUTvYu36tcy1KCLiPG
	YSH1+bY0pSP7F6HFSgaKsc9lSy1i/LQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711466554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KXH5uUDLtBRAB47YTVHB6bZditscTqY6M49f3hWQIm0=;
	b=pNMv7idUbMhs/IcgPQmJKVhGDE3oaaAPdU69K4zrkrZ8OkyivBHN1W9uDLa8fagjaOvHhx
	booslhzqaTBZz0Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711466554;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KXH5uUDLtBRAB47YTVHB6bZditscTqY6M49f3hWQIm0=;
	b=hWjOzW1HqNS1ii0R8rstNDFJMG0KONLVKpbkNxwUISXQ3rq84H7y7dbv2TAc/G9D5vxGTU
	uY7/9kFo2jqr45S8FQXU8mZjC4ur4oIIdBddNeYGV0KekJFMeOoCzUTvYu36tcy1KCLiPG
	YSH1+bY0pSP7F6HFSgaKsc9lSy1i/LQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711466554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KXH5uUDLtBRAB47YTVHB6bZditscTqY6M49f3hWQIm0=;
	b=pNMv7idUbMhs/IcgPQmJKVhGDE3oaaAPdU69K4zrkrZ8OkyivBHN1W9uDLa8fagjaOvHhx
	booslhzqaTBZz0Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B83613306;
	Tue, 26 Mar 2024 15:22:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JwdzATroAmYETQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 Mar 2024 15:22:34 +0000
Date: Tue, 26 Mar 2024 16:22:35 +0100
Message-ID: <877chpuif8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	pierre-louis.bossart@linux.intel.com,
	kevin-lu@ti.com,
	13916275206@139.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com,
	yung-chuan.liao@linux.intel.com,
	broonie@kernel.org,
	soyer@irl.hu
Subject: Re: [PATCH v1 2/8] ALSA: hda/tas2781: Add tas2781 SPI-based driver
In-Reply-To: <ZgLjAz99JZQvrx_h@smile.fi.intel.com>
References: <20240326010905.2147-1-baojun.xu@ti.com>
	<20240326010905.2147-2-baojun.xu@ti.com>
	<ZgLjAz99JZQvrx_h@smile.fi.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.12 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_RATELIMIT(0.00)[to_ip_from(RL3kqsx7g8wwj8c3joodxqsamu)];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-1.08)[88.02%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[dt];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,perex.cz,ti.com,139.com,alsa-project.org,vger.kernel.org,intel.com,irl.hu];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
Message-ID-Hash: 2BIDBVRIGIB2W67AMPU2W7HM745QVWUH
X-Message-ID-Hash: 2BIDBVRIGIB2W67AMPU2W7HM745QVWUH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2BIDBVRIGIB2W67AMPU2W7HM745QVWUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 26 Mar 2024 16:00:19 +0100,
Andy Shevchenko wrote:
> 
> On Tue, Mar 26, 2024 at 09:08:59AM +0800, Baojun Xu wrote:
> > Add TXNW2781 support in smi.
> 
> Same comment WRT the commit message.

Yeah, in general, all patches in this series have too short patch
descriptions.

Baojun, please give more words to explain what those patches do, and
more importantly tell why they are needed in that way.  Silence isn't
golden in the case of patches.  So, please resubmit the patch set with
the proper descriptions in each patch.


thanks,

Takashi
