Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C97168081A9
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 08:13:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC6E986E;
	Thu,  7 Dec 2023 08:12:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC6E986E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701933189;
	bh=KbnnDoAaRuaa2Ro8sEBuj5iwptBYp4w1aTO+jDyhVzw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T5umiR6lPVlO9l9HVBcLK0ReQwyxEb15zh/KBdyIV5ZFuQs1VDWsLUz2uk7qN9Uan
	 4AYtjKYE/QhGB/utBkdKYT+c1I+4Nj5BmOrHXFb6XPbEEXHGLyQNUNA6zCd/+svUpI
	 /l8M8FAmcoei+99NLMsPRcMaKo0HlVSNg13ISYX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E5ABF8055C; Thu,  7 Dec 2023 08:12:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87E2FF80570;
	Thu,  7 Dec 2023 08:12:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4535F8024E; Thu,  7 Dec 2023 08:01:33 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CD1FBF800AC
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 08:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD1FBF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qaQxB4uB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+ZvYCdKG
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 536D41F889;
	Thu,  7 Dec 2023 07:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1701932461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4U0lAk8NbdC+cdGU9KnUxRIn2ig+xkrggEOI5au2aik=;
	b=qaQxB4uBCUWsvv4EnCHMMYV9CgnD9EyCtoC7LFVO3Ee6mK4JRcaCuWo8d4sawoHUV76mVW
	Fsi6bmOS4+XQ2qDcGYNzsJEYOiWNZl+Uttw6cs1aqo9UapTsDbSZ117O1rp/qdRbODT8f0
	4uvOHsHB5vcU69z8IjGZItXBwwzb2Mg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701932461;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4U0lAk8NbdC+cdGU9KnUxRIn2ig+xkrggEOI5au2aik=;
	b=+ZvYCdKGk90ZYfhXy9UVFT4f5IVK6MNM8BN7PFcVWKUOXx3akXVRsUKSyZ32YbsIS+5HKz
	944k2JSZhG0B+tDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19B3413976;
	Thu,  7 Dec 2023 07:01:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3CCuBK1tcWXbEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 07 Dec 2023 07:01:01 +0000
Date: Thu, 07 Dec 2023 08:01:00 +0100
Message-ID: <87wmtq1opf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	"moderated list:SOUND"
	<alsa-devel@alsa-project.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda/realtek: Add Framework laptop 16 to quirks
In-Reply-To: <20231206193927.2996-1-mario.limonciello@amd.com>
References: <20231206193927.2996-1-mario.limonciello@amd.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-2.50 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 TO_DN_ALL(0.00)[];
	 NEURAL_HAM_SHORT(-0.20)[-0.982];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-2.21)[96.24%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: JS3TDDWGFJQKJSE4P2UMLBWHWIHWYLFC
X-Message-ID-Hash: JS3TDDWGFJQKJSE4P2UMLBWHWIHWYLFC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JS3TDDWGFJQKJSE4P2UMLBWHWIHWYLFC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 06 Dec 2023 20:39:27 +0100,
Mario Limonciello wrote:
> 
> The Framework 16" laptop has the same controller as other Framework
> models.  Apply the presence detection quirk.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, applied now.


Takashi
