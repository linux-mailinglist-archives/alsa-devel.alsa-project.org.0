Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1669EAB9889
	for <lists+alsa-devel@lfdr.de>; Fri, 16 May 2025 11:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84D08601B8;
	Fri, 16 May 2025 11:18:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84D08601B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747387122;
	bh=HxJ0zomJxsC859r5uNqfidaKLnTYha7lNyBFrjvmdoo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qdJNtBF1ElcVlX4t5ryCj2w9+LIoajIchaW+k5UpalpqeAA1e+dFDS5Z9LU8w7Ceo
	 NlX9QEt+YnywvTxXmwxDXiIDZd4ObBSwX/9L+mkI6PPYytZwm3cVio2eUNnl5sXOo/
	 8pbIJZyoLqZxlj738KgGloLRNK84JE5UxBQdRtMY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E313F80301; Fri, 16 May 2025 11:18:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EE2DF80269;
	Fri, 16 May 2025 11:18:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9109BF80134; Fri, 16 May 2025 11:18:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2DABF80038
	for <alsa-devel@alsa-project.org>; Fri, 16 May 2025 11:17:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2DABF80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=DPNo2kG+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pFFLyARA;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=DPNo2kG+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pFFLyARA
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2D9BA1F7EE;
	Fri, 16 May 2025 09:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747387077;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I1RP/TBGWZiCnpafH4dwaOMGrs4FWLp2cb99EJa1Lmg=;
	b=DPNo2kG+OJThnb/enFRQNc171I0xwMFyXDlwyz+VTPR7ucCRMLG/YGJ9UYS6BkPlR8LoSh
	+9MM2tLdeGZjIZkM/o5kOubgTjvubnuvj/ZKCRQ2f/LoqpMc/yFQOJyi5iwLXKmvSXrYuS
	huuPTTjLr9dHCx8ZcwySThMAwMtJnus=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747387077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I1RP/TBGWZiCnpafH4dwaOMGrs4FWLp2cb99EJa1Lmg=;
	b=pFFLyARAJKaHzcspING0mhrXgGmXIpYvYcFvuWq4u6lrZJm8LsIyEfqu5JrZCidkQQMKl4
	tSDehFkuVqrVN1Aw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DPNo2kG+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pFFLyARA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747387077;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I1RP/TBGWZiCnpafH4dwaOMGrs4FWLp2cb99EJa1Lmg=;
	b=DPNo2kG+OJThnb/enFRQNc171I0xwMFyXDlwyz+VTPR7ucCRMLG/YGJ9UYS6BkPlR8LoSh
	+9MM2tLdeGZjIZkM/o5kOubgTjvubnuvj/ZKCRQ2f/LoqpMc/yFQOJyi5iwLXKmvSXrYuS
	huuPTTjLr9dHCx8ZcwySThMAwMtJnus=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747387077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I1RP/TBGWZiCnpafH4dwaOMGrs4FWLp2cb99EJa1Lmg=;
	b=pFFLyARAJKaHzcspING0mhrXgGmXIpYvYcFvuWq4u6lrZJm8LsIyEfqu5JrZCidkQQMKl4
	tSDehFkuVqrVN1Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D4F813977;
	Fri, 16 May 2025 09:17:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sl/MAcUCJ2hDaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 May 2025 09:17:57 +0000
Date: Fri, 16 May 2025 11:17:56 +0200
Message-ID: <87h61klxrv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 1/1] bat: Fix buffer time configuration
In-Reply-To: <3051761.mvXUDI8C0e@steina-w>
References: <20250410110120.1997264-1-alexander.stein@ew.tq-group.com>
	<3051761.mvXUDI8C0e@steina-w>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 2D9BA1F7EE
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
Message-ID-Hash: GKPLLFGJ7YCADULKJA7NDFDOIPI3P3N5
X-Message-ID-Hash: GKPLLFGJ7YCADULKJA7NDFDOIPI3P3N5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKPLLFGJ7YCADULKJA7NDFDOIPI3P3N5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 16 May 2025 10:41:05 +0200,
Alexander Stein wrote:
> 
> Hi,
> 
> Am Donnerstag, 10. April 2025, 13:01:19 CEST schrieb Alexander Stein:
> > By swapping time configuration some hardware constraints can be supported.
> > Fixes the error: Set parameter to device error: buffer time: 500000
> > hw:tqmtlv320aic32: Invalid argument(-22)
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> Any feedback here? Or should I create a PR on github instead?

Sorry, it was just overlooked.
Now applied the patch.  Thanks!


Takashi
