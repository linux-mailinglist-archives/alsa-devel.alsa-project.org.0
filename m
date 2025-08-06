Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA9FB1CBDE
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Aug 2025 20:22:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C64AB6027A;
	Wed,  6 Aug 2025 20:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C64AB6027A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754504566;
	bh=Zk2ZtTHqvJTrS+ZkX9n/x+P0MFuQQeD4YV6wwI1iCXY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M6qHP4s/0kDZjJO2boOreU/3OXq9+Vi0JE94vgH81uLNgFvmC4ZOMc6qV2GP4Ufr3
	 aEMsV1g+JdpM6GetmWqeQN0lycMr83vm1eOPz5z94g5DmmsaAfT+uZdZKhZueUHEII
	 VE/HDVyboUVgpb/DQVw43dBqWoHmUJK/z1/NuCos=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 886B7F805C9; Wed,  6 Aug 2025 20:22:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00A92F805C3;
	Wed,  6 Aug 2025 20:22:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3859FF80423; Wed,  6 Aug 2025 20:21:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3817CF80016
	for <alsa-devel@alsa-project.org>; Wed,  6 Aug 2025 20:21:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3817CF80016
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OrvmbIpA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bmmIMUXl;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=OrvmbIpA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bmmIMUXl
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3FA912065F;
	Wed,  6 Aug 2025 18:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1754504506;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0fmjtkAecwqd7+oUf8k4SEcD73eAscErBAtrWqq82g=;
	b=OrvmbIpA4Ftl3PeYgzNArM4mS7B9KyeFlBd29SLC5X/QDDz8VgU8g8vkKlaEZQ7W7qH9zs
	vbJ5qRACMQWmTmUJUe3GjrTdLogjDxjXHdO5q3FGEiNNZ2J30QFN69yzLhopYa5ywYi1ss
	KUlqgwj2oFgH0R8dQe9hTicoF6njBYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754504506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0fmjtkAecwqd7+oUf8k4SEcD73eAscErBAtrWqq82g=;
	b=bmmIMUXlkt10Wo6ImTeU0931fjfa38zoUaW08k2gR5lS3k5jxPjRYcgkvNoWCyNDI07OjV
	iqDCEz7/+r5XiGCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1754504506;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0fmjtkAecwqd7+oUf8k4SEcD73eAscErBAtrWqq82g=;
	b=OrvmbIpA4Ftl3PeYgzNArM4mS7B9KyeFlBd29SLC5X/QDDz8VgU8g8vkKlaEZQ7W7qH9zs
	vbJ5qRACMQWmTmUJUe3GjrTdLogjDxjXHdO5q3FGEiNNZ2J30QFN69yzLhopYa5ywYi1ss
	KUlqgwj2oFgH0R8dQe9hTicoF6njBYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754504506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0fmjtkAecwqd7+oUf8k4SEcD73eAscErBAtrWqq82g=;
	b=bmmIMUXlkt10Wo6ImTeU0931fjfa38zoUaW08k2gR5lS3k5jxPjRYcgkvNoWCyNDI07OjV
	iqDCEz7/+r5XiGCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CD2413AA8;
	Wed,  6 Aug 2025 18:21:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XqwfATqdk2hFRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 Aug 2025 18:21:46 +0000
Date: Wed, 06 Aug 2025 20:21:45 +0200
Message-ID: <87pld81fba.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.17-merge-window
In-Reply-To: <97abce5e5d42120dc07961f73b548c7d.broonie@kernel.org>
References: <97abce5e5d42120dc07961f73b548c7d.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: XJHEISBZIFDVUE63N5BQYYJA4UNS6O3Q
X-Message-ID-Hash: XJHEISBZIFDVUE63N5BQYYJA4UNS6O3Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XJHEISBZIFDVUE63N5BQYYJA4UNS6O3Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 06 Aug 2025 19:14:43 +0200,
Mark Brown wrote:
> 
> The following changes since commit e95122a32e777309412e30dc638dbc88b9036811:
> 
>   ASoC: codecs: Add acpi_match_table for aw88399 driver (2025-07-25 13:44:29 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-merge-window
> 
> for you to fetch changes up to 614d416dd8aee2675fb591c598308a901a660db8:
> 
>   ASoC: SOF: Intel: hda-sdw-bpt: fix SND_SOF_SOF_HDA_SDW_BPT dependencies (2025-08-06 12:02:32 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.17
> 
> This is a relatively small set of fixes and device quirks that came in
> during the merge window, the AMD changes adding support for ACP 7.2
> systems are all just adding IDs for the devices rather than any
> substantial code - the actual code is the same as for prior versions of
> the platform.

Pulled now.  Thanks.


Takashi
