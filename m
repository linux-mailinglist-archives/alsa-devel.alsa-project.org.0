Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C84822252
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:55:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D832E99;
	Tue,  2 Jan 2024 20:55:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D832E99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704225350;
	bh=khWzkQqJL7+8CPl9GMHH9xV701KVBG53WE2y1YZdEzA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UFlKsKWCZ0LQL+FfcNzJEBraeDGHP0JIFYE7OSEJ0r7cGNWewYmZmaNsn/b2pLiJW
	 h2RiFw22X2ftxThapBSRo/39ZEYzZDYdBXb6ulxfDrF8aPekc5/qF6OhK08gutTjpb
	 TUh7TFVF6Pad55Qdt2QiXgsAA3izwU+4LyxLmoTQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79FC6F80558; Tue,  2 Jan 2024 20:55:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5D87F805EA;
	Tue,  2 Jan 2024 20:55:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 689C5F8055C; Tue,  2 Jan 2024 20:54:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61611F8055A
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:54:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61611F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1fNFYglS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=8i615z9f;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=1fNFYglS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=8i615z9f
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DA67D21E41;
	Fri, 29 Dec 2023 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703859338;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kQzfAYsuLbgtPe3qnqDoAaKCtE7KCl4zwYA1RE1jGqQ=;
	b=1fNFYglSuXed13Bt7FFfLQ+oW6E5zRCVD38vphDBWIom0LFTlyp/56jpqiwRKuatGhfwYY
	4YSEYhJuih/31SR+IHfrcnF7x54n/tPzNSY/UrplGGVDFgyWAJZdxvi9UJfWOehY6dNg3/
	bllYt7jsReWyxB4GKWYTi1Zp1PNygl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703859338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kQzfAYsuLbgtPe3qnqDoAaKCtE7KCl4zwYA1RE1jGqQ=;
	b=8i615z9f1Mg9DiR00o3ge00MUMPEQ0JlY7sgCQC60QTbdiGVKjm7zL5PQ6MBD+ZOIBWRmr
	uIXcHMLJ15J+BuCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703859338;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kQzfAYsuLbgtPe3qnqDoAaKCtE7KCl4zwYA1RE1jGqQ=;
	b=1fNFYglSuXed13Bt7FFfLQ+oW6E5zRCVD38vphDBWIom0LFTlyp/56jpqiwRKuatGhfwYY
	4YSEYhJuih/31SR+IHfrcnF7x54n/tPzNSY/UrplGGVDFgyWAJZdxvi9UJfWOehY6dNg3/
	bllYt7jsReWyxB4GKWYTi1Zp1PNygl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703859338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kQzfAYsuLbgtPe3qnqDoAaKCtE7KCl4zwYA1RE1jGqQ=;
	b=8i615z9f1Mg9DiR00o3ge00MUMPEQ0JlY7sgCQC60QTbdiGVKjm7zL5PQ6MBD+ZOIBWRmr
	uIXcHMLJ15J+BuCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9EA2B136D1;
	Fri, 29 Dec 2023 14:15:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FwI8JYrUjmUxeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Dec 2023 14:15:38 +0000
Date: Fri, 29 Dec 2023 15:15:38 +0100
Message-ID: <87le9dxfg5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/3] Support Dell models without _DSD
In-Reply-To: <20231221132518.3213-1-sbinding@opensource.cirrus.com>
References: <20231221132518.3213-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.12 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.02)[95.15%]
Authentication-Results: smtp-out1.suse.de;
	none
Message-ID-Hash: MCHCHDXLFDMVGYM4ZSRGSAPNBXCGBV6W
X-Message-ID-Hash: MCHCHDXLFDMVGYM4ZSRGSAPNBXCGBV6W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MCHCHDXLFDMVGYM4ZSRGSAPNBXCGBV6W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 21 Dec 2023 14:25:15 +0100,
Stefan Binding wrote:
> 
> Add Quirks and driver properties for Dell models.
> Driver properties are required since these models do not have _DSD.
> Additionally, some laptops, including some of these, have an issue
> with their BIOS which causes the SPI speed to be set too slow.
> To ensure a decent performance for laptops with this slow speed,
> disable firmware loading. Running without firmware results in lower
> volume.
> 
> Changes since v1:
> - Rebased onto for-linus
> 
> Stefan Binding (3):
>   ALSA: hda: cs35l41: Support additional Dell models without _DSD
>   ALSA: hda: cs35l41: Prevent firmware load if SPI speed too low
>   ALSA: hda/realtek: Add quirks for Dell models

Applied to topic/cs35l41 branch, which is merged to for-next (for
6.8).


thanks,

Takashi
