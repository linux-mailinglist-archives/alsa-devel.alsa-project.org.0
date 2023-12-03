Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67712802229
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Dec 2023 10:11:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 439FDDEB;
	Sun,  3 Dec 2023 10:11:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 439FDDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701594699;
	bh=hh0/gP6cLsh9t1y6+uiIIAh0Q5EDVaptXD7M7Fcm0qk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vLVF/T1CUlNHEnIZJA8KGaj6VUYszoKicaaITwOvsg/jbrrMemMXBjBOZjyxgQRZe
	 PNDpsJCauK5HNJK0/LKI/FILqsdH/GeKgK+AuiGzB+A+zDXE1lWnIEKck0Dd7C442H
	 ZyutlsHMQCO4Cez/CxQhsYoemjUAGI56Ec8TrMHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3FE1F80578; Sun,  3 Dec 2023 10:11:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B520BF8025A;
	Sun,  3 Dec 2023 10:11:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA969F8024E; Sun,  3 Dec 2023 10:06:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E21BAF800E4
	for <alsa-devel@alsa-project.org>; Sun,  3 Dec 2023 10:05:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E21BAF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MUHxxr0j;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HnFXMDV7
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 99F9C1FE00;
	Sun,  3 Dec 2023 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1701594308;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QUQkMSGDlg7cS17sfLdWXqdFy/NR/mww5ITfoMP17/k=;
	b=MUHxxr0jTRD9DtwmJH8DPIEFptN3ZcGIOvjv0knucgPk6GqShNRLY7rwYhhrXgumwQ9RHO
	wKybs2urmm7bm/8e2c6DH8kdeBmQ+fTloyeyGDwV5jB5AqkuivnQPxEd5FHSz++DhX0ivL
	FWAZwEgHkhCzqHY8VOpN8QwgD5u9fr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701594308;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QUQkMSGDlg7cS17sfLdWXqdFy/NR/mww5ITfoMP17/k=;
	b=HnFXMDV7oKuI5ZhUK59xQ2ytTbqDHwyforkjfV5WVjheA6zWF0sLLkC22PzTFTSaIcVeFP
	hFCSVQ5exBtJ2uDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 257D91399F;
	Sun,  3 Dec 2023 09:05:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cGUJB8REbGWoTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 03 Dec 2023 09:05:08 +0000
Date: Sun, 03 Dec 2023 10:05:07 +0100
Message-ID: <878r6bac70.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pascal =?ISO-8859-1?Q?No=EBl?= <pascal@pascalcompiles.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	luke@ljones.dev,
	andy.chi@canonical.com,
	shenghao-ding@ti.com,
	l.guzenko@web.de,
	ruinairas1992@gmail.com,
	yangyuchi66@gmail.com,
	vitalyr@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Apply quirk for ASUS UM3504DA
In-Reply-To: <20231202013744.12369-1-pascal@pascalcompiles.com>
References: <20231202013744.12369-1-pascal@pascalcompiles.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.35 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.05)[59.87%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,web.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[perex.cz,suse.com,realtek.com,opensource.cirrus.com,ljones.dev,canonical.com,ti.com,web.de,gmail.com,alsa-project.org,vger.kernel.org];
	 RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: H2IR7J7PE5I3A7IO2FFSKIBLFOAOQBF7
X-Message-ID-Hash: H2IR7J7PE5I3A7IO2FFSKIBLFOAOQBF7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H2IR7J7PE5I3A7IO2FFSKIBLFOAOQBF7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 02 Dec 2023 02:37:44 +0100,
Pascal Noël wrote:
> 
> The ASUS UM3504DA uses a Realtek HDA codec and two CS35L41 amplifiers via I2C.
> Apply existing quirk to model.
> 
> Signed-off-by: Pascal Noël <pascal@pascalcompiles.com>

Thanks, applied.


Takashi
