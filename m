Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8509ADC0B
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2024 08:21:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D060A83B;
	Thu, 24 Oct 2024 08:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D060A83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729750907;
	bh=vMUGRgb5C/YYqnjmkkQYwMzqfctDYe06VyUiO/TzgV4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jmK8JzzJ4zQ8TxIH+vzUZ6411cjOClr8m31pE4M2Y4lqrOhHkSTsLlP+9pVTBfdYQ
	 n8vBt/gX+nsh1Bs+C9XB33LVIHgdPcCUqmui6lBNuF/4abK1dRRspvY78XLmABH/S7
	 68lUhc++3kqM6bePE0uwE12gibELDZHbrcekFWN0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A10CFF805B5; Thu, 24 Oct 2024 08:21:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78656F80104;
	Thu, 24 Oct 2024 08:21:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13524F8016C; Thu, 24 Oct 2024 08:21:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39009F80149
	for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2024 08:21:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39009F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=DTHoboNh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EWTMNpb1;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=DTHoboNh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EWTMNpb1
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1917B21D6B;
	Thu, 24 Oct 2024 06:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1729750868;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r0homlUsGJ0HbNekwMhXZWDgl9Stq1r749kkkUJfjt4=;
	b=DTHoboNhElOgdSbCDG70o0G6lWM2vRZyP/jV9DJ9PWgTuNzrZsY6rQD0RWltzRJAnaLun4
	HYQovAexaC8IM3qXReSchWKP5G5K82vNb5p/sGklQOusemaFCj/cnGcZJzs31siDXYCQWW
	PLoKZyhgGx+9kWdpAu8bkN8Yq5tQR6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729750868;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r0homlUsGJ0HbNekwMhXZWDgl9Stq1r749kkkUJfjt4=;
	b=EWTMNpb1QmQ0l6/e/voWo8tl1KU4lz3ApVQJcODGwPlvk3ij2gK4xwhK/1WN/pHYBq1hEx
	tHu9XS8i1o8Tb7BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DTHoboNh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EWTMNpb1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1729750868;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r0homlUsGJ0HbNekwMhXZWDgl9Stq1r749kkkUJfjt4=;
	b=DTHoboNhElOgdSbCDG70o0G6lWM2vRZyP/jV9DJ9PWgTuNzrZsY6rQD0RWltzRJAnaLun4
	HYQovAexaC8IM3qXReSchWKP5G5K82vNb5p/sGklQOusemaFCj/cnGcZJzs31siDXYCQWW
	PLoKZyhgGx+9kWdpAu8bkN8Yq5tQR6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729750868;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r0homlUsGJ0HbNekwMhXZWDgl9Stq1r749kkkUJfjt4=;
	b=EWTMNpb1QmQ0l6/e/voWo8tl1KU4lz3ApVQJcODGwPlvk3ij2gK4xwhK/1WN/pHYBq1hEx
	tHu9XS8i1o8Tb7BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDC5D136F5;
	Thu, 24 Oct 2024 06:21:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q1WNOFPnGWcBEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 24 Oct 2024 06:21:07 +0000
Date: Thu, 24 Oct 2024 08:22:09 +0200
Message-ID: <87ldye10mm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.12-rc4
In-Reply-To: <0db698090dd7ea59422ec8f778d20dba.broonie@kernel.org>
References: <0db698090dd7ea59422ec8f778d20dba.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 1917B21D6B
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: X6HY6M3NVONLMUV77F2KXLFR62PI5XYB
X-Message-ID-Hash: X6HY6M3NVONLMUV77F2KXLFR62PI5XYB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6HY6M3NVONLMUV77F2KXLFR62PI5XYB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 23 Oct 2024 23:44:38 +0200,
Mark Brown wrote:
> 
> The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b:
> 
>   Linux 6.12-rc2 (2024-10-06 15:32:27 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.12-rc4
> 
> for you to fetch changes up to db7e59e6a39a4d3d54ca8197c796557e6d480b0d:
> 
>   ASoC: qcom: sc7280: Fix missing Soundwire runtime stream alloc (2024-10-22 21:00:38 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.12
> 
> An uncomfortably large set of fixes due to me not getting round to
> sending them for longer than I should due to travel and illness.  This
> is mostly smaller driver specific changes, but there are a couple of
> generic changes:
> 
>  - Bumping the minimal topology ABI we check for during validation, the
>    code had support for v4 removed previously but the update of the
>    define used for initial validation was missed.
>  - Fix the assumption that DAPM structs will be embedded in a component
>    which isn't true for card widgets when doing name comparisons, though
>    fortunately this is rarely triggered.
> 
> We've pulled in one Soundwire fix which was part of a larger series
> fixing cleanup issues in on Intel Soundwire systems.

Pulled now.  Thanks.


Takashi
