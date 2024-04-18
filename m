Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF068A92FC
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 08:23:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BD6DEBE;
	Thu, 18 Apr 2024 08:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BD6DEBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713421416;
	bh=MVR9kW8GYmH5/f3ydJqRav8n0QGMCnzkMxXk40HDLDA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qDcfK4ExLS62JDL24nD6sfJExWbtbNrnzbnq0n+pZBmbhJ7zePs29eYWS/FLH7CDY
	 xG2pBhWc9sZvmHzVTjMUlb0plchN7fcb+3v5+qJ5gKvuAhuDxexx3da4JOHWhE9YA7
	 hKM7ZvjVLV/mg9jnT+UUmtiXc2ndwsTVk/D1dKVs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA224F80571; Thu, 18 Apr 2024 08:23:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F604F80571;
	Thu, 18 Apr 2024 08:23:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D70FF8025A; Thu, 18 Apr 2024 08:21:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBA3AF80124
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 08:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBA3AF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=B/09kTfP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3wjZpCVB;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=B/09kTfP;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3wjZpCVB
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 52B6F5C4CD;
	Thu, 18 Apr 2024 06:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713421299;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7M4i+UVK0F+empy/LMGObPthSTBH9MhF7D9G9XyaTA=;
	b=B/09kTfPoE1mIrEzm5OTQLKI7cTDurNjLJcXxJuPSG6j1Kmdf65zK3mC/g1BJ2rlvrrgw0
	c4uE+0gDuBpH9MZyzWSIwR4rk4yPcqDMp6S4rjV9ArZGFTKyAVMxfuxP+7C1BlZV0P2tcf
	iBLKgvJc3PJzQLZMJBiYy6b6s0CVkDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713421299;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7M4i+UVK0F+empy/LMGObPthSTBH9MhF7D9G9XyaTA=;
	b=3wjZpCVBkeAvaUfehaPG9LuWC5oW2v2StOt2mWd11A9DnffH0Lr+bs5xHgQmNePfCMRd9O
	tqcAFpZJB0/tRpAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="B/09kTfP";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3wjZpCVB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713421299;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7M4i+UVK0F+empy/LMGObPthSTBH9MhF7D9G9XyaTA=;
	b=B/09kTfPoE1mIrEzm5OTQLKI7cTDurNjLJcXxJuPSG6j1Kmdf65zK3mC/g1BJ2rlvrrgw0
	c4uE+0gDuBpH9MZyzWSIwR4rk4yPcqDMp6S4rjV9ArZGFTKyAVMxfuxP+7C1BlZV0P2tcf
	iBLKgvJc3PJzQLZMJBiYy6b6s0CVkDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713421299;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7M4i+UVK0F+empy/LMGObPthSTBH9MhF7D9G9XyaTA=;
	b=3wjZpCVBkeAvaUfehaPG9LuWC5oW2v2StOt2mWd11A9DnffH0Lr+bs5xHgQmNePfCMRd9O
	tqcAFpZJB0/tRpAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2CDA013687;
	Thu, 18 Apr 2024 06:21:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jtS8CPO7IGb8cAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Apr 2024 06:21:39 +0000
Date: Thu, 18 Apr 2024 08:21:47 +0200
Message-ID: <87o7a7xkas.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: Thinkpad with ALC1318 has a chance of damaging the IC
In-Reply-To: <c646c8ef954d41e6b8fa78b202fd306d@realtek.com>
References: <c646c8ef954d41e6b8fa78b202fd306d@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 52B6F5C4CD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.50 / 50.00];
	BAYES_HAM(-2.99)[99.96%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: YF4LNXA2AKXWGVLKPUMR4EQ3ZGKU7QUZ
X-Message-ID-Hash: YF4LNXA2AKXWGVLKPUMR4EQ3ZGKU7QUZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YF4LNXA2AKXWGVLKPUMR4EQ3ZGKU7QUZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 Apr 2024 11:27:50 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Please don't apply this patch.
> They want to add stream open to enable GPIO3 functions.

OK, let me know if the new patch is ready.


thanks,

Takashi

> 
> BR,
> Kailang
> 
> > -----Original Message-----
> > From: Kailang
> > Sent: Wednesday, April 10, 2024 5:23 PM
> > To: Takashi Iwai (tiwai@suse.de) <tiwai@suse.de>
> > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > Subject: Thinkpad with ALC1318 has a chance of damaging the IC
> > 
> > Hi Takashi,
> > 
> > Thinkpad with ALC1318 has a chance of damaging the IC at S4 resume.
> > 
> > BR,
> > Kailang
