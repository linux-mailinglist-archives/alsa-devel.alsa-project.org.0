Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F898B0477
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Apr 2024 10:37:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6213CE7D;
	Wed, 24 Apr 2024 10:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6213CE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713947875;
	bh=Diwxh7oYymnJcN+8qW/fo95XYZ0IL5WSPMdte6hs+Ds=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vedmjlPZ7TQtY5LJuKMI3yrXCSGopBLtNzaZAzhPsGUeyN1yZYNU0+BJnyJgg9Kaq
	 bfkJkRQHJR9yQ8W+QWd5F2s01Hx3sq1/ZrHDebFRsmEXxsVg6Dh2XMJoJGWuoYWR5O
	 bGzrybiQrONhYbItSmVFiOr8qy/KiAhfI5g5suUM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A26BF805A9; Wed, 24 Apr 2024 10:37:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60260F80568;
	Wed, 24 Apr 2024 10:37:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5422AF80423; Wed, 24 Apr 2024 10:35:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F6C9F801C0
	for <alsa-devel@alsa-project.org>; Wed, 24 Apr 2024 10:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F6C9F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Z+fi5877;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6DyW8cLV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Z+fi5877;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6DyW8cLV
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B3F2A611F1;
	Wed, 24 Apr 2024 08:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713947713;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=elRg1WfuYIh3UN/+CGdWJcbo9zKqZDeKyAmj66ffYL0=;
	b=Z+fi5877P1yRb5OnHCTwGKdKWopshyLSofJgIRzvxIrzDqmJ9mTx1p2ynY2q8zSYxEiryl
	Wg0nTecO0P3olrNTwRs4B2yTxhpr4vU/0kQhYWid4JIpwbdHqCXFmgcJfB3QaqHl1o4Lha
	lu1Rw0qz7uonv7zhqwJyB6p0grTdBCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713947713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=elRg1WfuYIh3UN/+CGdWJcbo9zKqZDeKyAmj66ffYL0=;
	b=6DyW8cLVMVbUb/MEmadxQ/VFqiQ6Z0besAc/QjIxj9cAx6C82avzUQrBfNhvuEItFiyEcC
	eF43mJWiaUkbs7Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713947713;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=elRg1WfuYIh3UN/+CGdWJcbo9zKqZDeKyAmj66ffYL0=;
	b=Z+fi5877P1yRb5OnHCTwGKdKWopshyLSofJgIRzvxIrzDqmJ9mTx1p2ynY2q8zSYxEiryl
	Wg0nTecO0P3olrNTwRs4B2yTxhpr4vU/0kQhYWid4JIpwbdHqCXFmgcJfB3QaqHl1o4Lha
	lu1Rw0qz7uonv7zhqwJyB6p0grTdBCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713947713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=elRg1WfuYIh3UN/+CGdWJcbo9zKqZDeKyAmj66ffYL0=;
	b=6DyW8cLVMVbUb/MEmadxQ/VFqiQ6Z0besAc/QjIxj9cAx6C82avzUQrBfNhvuEItFiyEcC
	eF43mJWiaUkbs7Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 847C71393C;
	Wed, 24 Apr 2024 08:35:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wZmgH0HEKGaIKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 24 Apr 2024 08:35:13 +0000
Date: Wed, 24 Apr 2024 10:35:23 +0200
Message-ID: <87cyqfdupg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1 0/2] Add support for Lenovo Thinkbook 13X
In-Reply-To: <20240423162303.638211-1-sbinding@opensource.cirrus.com>
References: <20240423162303.638211-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.45 / 50.00];
	BAYES_HAM(-1.15)[88.70%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
Message-ID-Hash: ZWSZODGQECMFGTWWIJQGQ3TCTMZTIDXO
X-Message-ID-Hash: ZWSZODGQECMFGTWWIJQGQ3TCTMZTIDXO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZWSZODGQECMFGTWWIJQGQ3TCTMZTIDXO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 23 Apr 2024 18:23:01 +0200,
Stefan Binding wrote:
> 
> This laptop does not contain _DSD required to support CS35L41 HDA.
> To workaround this, add support for this laptop into the configuration
> table in cs35l41_hda_property.c.
> Also add the required entry into patch_realtek for this SSID.
> 
> Stefan Binding (2):
>   ALSA: hda: cs35l41: Support Lenovo 13X laptop without _DSD
>   ALSA: hda/realtek: Add quirks for Lenovo 13X

Applied both patches now to for-next branch.


thanks,

Takashi
