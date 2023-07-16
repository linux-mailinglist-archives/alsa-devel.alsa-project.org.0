Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B45754EA6
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jul 2023 14:52:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18784A4E;
	Sun, 16 Jul 2023 14:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18784A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689511920;
	bh=sLKsVDawrwgzTPx3TUcAYSIUz981uURhPR7BTm1zdfo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vAnRNoDpvSS6L+wKulDVCypXKYcXlvCMvQXbBQFU6Fr6Us2pM3o/VvBT5yr0ZLjoJ
	 IPSq9UMj9c6aq43EKx0E+Ez+guQzZ+DV+lbjTJa/VxGiIpxfKlBkEkw4IY+snCc5mP
	 7Y0qT3+H/GB1E6C2nsAvj7jrffUjXjSEkWS8UgEE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87025F80527; Sun, 16 Jul 2023 14:51:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19B1CF8032D;
	Sun, 16 Jul 2023 14:51:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10B87F8047D; Sun, 16 Jul 2023 14:49:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C0FAF8027B
	for <alsa-devel@alsa-project.org>; Sun, 16 Jul 2023 14:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C0FAF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=U6GnsSjk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kM/QMplG
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AD8811F8BB;
	Sun, 16 Jul 2023 12:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689511759;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5iMTPDb4EAC5F/3a1KEzow3eeMPXGxYwXkQm53JlpR0=;
	b=U6GnsSjkB8EA2oqYEdpn9YsPhisH99afJCxcs2lQcOCQjwMKp+sY9lNIiSN3JZ5Gibkp8A
	UW3NaYJvNU7WpQVJfCGfYw1T1OPwE9KScUvdIHIMgBzyv0aYwzuFOlHNt/kDZmIwgJkFs8
	EG8lHV/zBT8JU5A9r+J2ZQZ4j3+4Ohk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689511759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5iMTPDb4EAC5F/3a1KEzow3eeMPXGxYwXkQm53JlpR0=;
	b=kM/QMplGPX+11kosa/FGDTR6+A+YQeOCk7EzKmYXxppia6ZkgqIC3FU5BswNIKuHK7QTbB
	hjdsLTVTrXpzb4Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E4D313252;
	Sun, 16 Jul 2023 12:49:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id n88vFk/ns2RyeQAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 16 Jul 2023 12:49:19 +0000
Date: Sun, 16 Jul 2023 14:49:18 +0200
Message-ID: <87zg3waunl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: David Xu <xuwd1@hotmail.com>
Cc: James Schulman <james.schulman@cirrus.com>,	David Rhodes
 <david.rhodes@cirrus.com>,	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,
	"Luke D. Jones" <luke@ljones.dev>,	Stefan Binding
 <sbinding@opensource.cirrus.com>,	Andy Chi <andy.chi@canonical.com>,	Tim
 Crawford <tcrawford@system76.com>,	Philipp Jungkamp <p.jungkamp@gmx.net>,
	Kacper =?ISO-8859-2?Q?Michaj=B3ow?= <kasper93@gmail.com>,	Matthew Anderson
 <ruinairas1992@gmail.com>,	Yuchi Yang <yangyuchi66@gmail.com>,	Yang
 Yingliang <yangyingliang@huawei.com>,	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix CSC3551 speaker sound problem for machines
 without a valid ACPI _DSD
In-Reply-To: 
 <SY4P282MB18352D4FD343A2E8290EA9BEE037A@SY4P282MB1835.AUSP282.PROD.OUTLOOK.COM>
References: 
 <SY4P282MB18352D4FD343A2E8290EA9BEE037A@SY4P282MB1835.AUSP282.PROD.OUTLOOK.COM>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: FPOSOPN7W3QY2WMAAP4JZTW3IVZJ5ED3
X-Message-ID-Hash: FPOSOPN7W3QY2WMAAP4JZTW3IVZJ5ED3
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPOSOPN7W3QY2WMAAP4JZTW3IVZJ5ED3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jul 2023 18:29:53 +0200,
David Xu wrote:
> 
> 
> As the comments added in commit 4d4c4bff4f8ed79d95e05 ("ALSA: hda:
> cs35l41: Clarify support for CSC3551 without _DSD Properties"), CSC3551
> requires a valid _DSD to work and the current implementation just
> fails when no _DSD can be found for CSC3551. However it is a fact
> that many OEMs hardcoded the configurations needed by CSC3551 into their
> proprietary software for various 2022 and later laptop models,
> and this makes the Linux installations on these models cannot make
> any speaker sound. Meanwhile, at this point of time, we see no hope
> that these OEMs would ever fix this problem via a BIOS update. 
> 
> To address the problem, this patch series contains two patches: 
> 
> Patch 1 for cs35l41 hda driver: a fixup mechanism is introduced that 
> when the driver found there is no valid _DSD that contains the 
> configurations, a fixup function would try to find a fixup entry that
> contains a proper cs35l41 configuration from a pre-defined fixup table
> by matching the CSC3551 ACPI _SUB id. If found, the fixup function
> would apply the cs35l41 configurations retrived from the entry. 
> In this patch the fixup table only contains some entries for three 
> Lenovo laptop models: namely 16IAH7, 16IAX7 and 16ARHA7. However 
> as is known, several other laptop models from ASUS and HP also suffer
> from this no valid _DSD problem and could have it addressed with this 
> fixup mechanism when proper fixup entries are inserted.
> 
> 
> Patch 2 for realtek hda driver: add quirks for Lenovo 16IAH7, 16IAX7 
> and 16ARHA7 so that cs35l41 playback hook could be registered. Please 
> note that for these quirks to work patch 1 has to be applied.

Thanks for the patches.

I've seen the lots of pains with CS35L41 codec stuff on the recent
machines.  But, first of all, it still needs to be agreed by Cirrus
people whether this approach is acceptable.  Judging from the current 
situation, such workaround appears inevitable, but we need a
consensus.

So, Cirrus people, please check this.


Also, some ideas about the current patch set:

- Do we need yet another listing and check of each ID in another
  place?  The existing entry in the SSID quirk table is already unique
  enough to identify which configuration is taken, I suppose.

- The quirk entries can be gathered in patch_realtek.c, and the hw_cfg
  and other items are overwritten in cs35l41_no_acpi_dsd() when no
  _DSD is found.  In that way, we can avoid fixing two places for each
  update.

- The workaround is a workaround, and it's fundamentally dangerous.
  We should warn it in a kernel message.


Takashi
