Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D18568C14BC
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 20:28:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2E52208;
	Thu,  9 May 2024 20:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2E52208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715279279;
	bh=QT8+M1coKRSlLIayB6aQ0AXkEhny/yVnFWMbGYUb3wQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jE5uJyTSQSTWKVKaAElm+294o3OogvljrH9nU6bMAiF0zVk73um7SyQZStMrCVrex
	 7tWa5EyPKz8iyRNa92sheW57dWVu7NfNC1JpSBLrpuCJ5NYdb9mrQFYTGIZGOwvRcU
	 RZlGOyYQjVR5KJ7C/OvYK4a80Wt6vyHxhwmrJiQg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 424BCF805AA; Thu,  9 May 2024 20:27:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7BE7F805A1;
	Thu,  9 May 2024 20:27:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 646C0F8049C; Thu,  9 May 2024 20:27:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8C3CF80152
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 20:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8C3CF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Li4v7CKI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=8VU1rzuw;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=gXWy0ih/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UaxbYG+W
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D35D5605C0;
	Thu,  9 May 2024 18:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715279238;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=68YP2/T4YVfuIp8UC5uVHGv4H2aCqnPVBqXmfin03aU=;
	b=Li4v7CKIKZDwwtb9mpwGb6bcR5UpRLe3FHQsE5YDUvMnrjhCqKZigDcFmqNrlcZKaaPbk5
	Lt4Y5U6BjIx5yQvhpVEFXP2jSdw6643qiC7EQ8vKiKAK7gCMzCBRj4a4LhuukCM4BbujgE
	iMLWuQ0PeeMSqqnUuTQgu7dam+5bo78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715279238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=68YP2/T4YVfuIp8UC5uVHGv4H2aCqnPVBqXmfin03aU=;
	b=8VU1rzuw2EEiE+cLLxvs1E5idOVCEeYUQB2uG2QtfBcvJQN7KCUs9i/Q6ptbOTWvClWt64
	MVLDkrwRHHqpYpCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="gXWy0ih/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UaxbYG+W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715279237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=68YP2/T4YVfuIp8UC5uVHGv4H2aCqnPVBqXmfin03aU=;
	b=gXWy0ih/+DB5A5k3Cm2H21qKiOQ+AW6GvMxbspV98mIFlcAKv82OpxQTfSOq2jnAVyaibV
	ILorz7vdk3eJNEALXCc42b6nBSUgJ1akQsS7sLf71jF972GPU0cx3TqdleSgzvuMHoumLO
	i3lwnE+KbmvrHF0FRZIBl2X6PCH4Jo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715279237;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=68YP2/T4YVfuIp8UC5uVHGv4H2aCqnPVBqXmfin03aU=;
	b=UaxbYG+Wn+TTuncV13Yewx6z+jMjCEuCX0Ke7hp4/ubpCobf80pffly/GQ4WYb7m2D1aEu
	sq3cqHdkgtiWKDDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A93C013941;
	Thu,  9 May 2024 18:27:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LSutJ4UVPWZRRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 May 2024 18:27:17 +0000
Date: Thu, 09 May 2024 20:27:32 +0200
Message-ID: <87pltualij.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: Re: [PATCH 0/9] ALSA/ASoC: Intel: clarify Copyright information
In-Reply-To: <5630c56e-6639-47f6-81a9-6b52f8b540de@linux.intel.com>
References: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
	<5630c56e-6639-47f6-81a9-6b52f8b540de@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D35D5605C0
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: JX2PFU2XDXTZOQYHCBCLTLOVNDO5IUQ5
X-Message-ID-Hash: JX2PFU2XDXTZOQYHCBCLTLOVNDO5IUQ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JX2PFU2XDXTZOQYHCBCLTLOVNDO5IUQ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 May 2024 18:00:06 +0200,
Pierre-Louis Bossart wrote:
> 
> 
> 
> On 5/3/24 09:03, Pierre-Louis Bossart wrote:
> > This patchset does not change any functionality. It only clarifies the
> > Copyright information in ASoC/HDAudio contributions, where an "All
> > rights reserved" notice was mistakenly added in a number of files over
> > the years, likely due to copy/paste. The Intel template never included
> > this statement.
> > 
> > I chose to group all these patches together, they could be merged with
> > either of the ALSA or the ASoC tree.
> > 
> > Pierre-Louis Bossart (9):
> >   ASoC: SOF: Intel: clarify Copyright information
> >   ASoC: Intel: boards: clarify Copyright information
> >   ASoC: Intel: common: clarify Copyright information
> >   ASoC: codecs: Intel: clarify Copyright information
> >   ASoC: Intel: catpt: clarify Copyright information
> >   ASoC: Intel: avs: clarify Copyright information
> >   ASoC: soc-topology-test: clarify Copyright information
> 
> The first 7 patches were merged by Mark
> 
> >   ALSA: hda: clarify Copyright information
> >   ALSA/ASoC: include: clarify Copyright information
> 
> But these last two weren't. Should I resend them? Or can Takashi pick
> them? It's just a minor clarification, this can also wait for the next
> cycle.

I took now the remaining two to for-next branch.


thanks,

Takashi
