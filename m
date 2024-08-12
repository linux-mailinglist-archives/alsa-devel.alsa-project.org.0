Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C122D94EBC5
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2024 13:27:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 137D42190;
	Mon, 12 Aug 2024 13:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 137D42190
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723462027;
	bh=y8AnY0w3xhCC8neb3MrGBLnwuyNZ42E3p1kCNXQVsdE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u/RFkYS54UDJu2EZS+ofOmHwx7dq8Vz2weGRBOHRiXq5+Jg6PxlIOGnxXsySP1Atr
	 3dur0NZAHU3XveX7jSyalP6NMItvkLotBO5TJsNlBIJxt0fhW0ZOoisMgnayftYqiS
	 zJq9aTGh4aszFPVS6yjtRybvut+PvtwMjgnuniVU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41B35F805AD; Mon, 12 Aug 2024 13:26:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82974F80517;
	Mon, 12 Aug 2024 13:26:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 005F2F80423; Mon, 12 Aug 2024 13:26:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27F8DF80107
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 13:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27F8DF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=naDqM2r3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=DDc9XxgE;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=naDqM2r3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=DDc9XxgE
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0B1A32026B;
	Mon, 12 Aug 2024 11:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723461983;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khiFf9SIP2ZezIcDk+ksvyeFueV9sc4yutkPxw8YTgI=;
	b=naDqM2r3tf69bqrV8/R9VzeApHvRoVzBkFxm1+4/1gtfp0VpU1rolQHBQVM0xm/hO3r822
	BNnP/H/cj+FT9Ztwjwa0swKE9mYkHYWYss2GoK41ExPhVFFKdQHwMKFVxctP/W3nn7vt/7
	6VQDpjXvb0VOuQg3eI9G7iFASfoBF8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723461983;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khiFf9SIP2ZezIcDk+ksvyeFueV9sc4yutkPxw8YTgI=;
	b=DDc9XxgEejJK42DXPEFiQ2ROJaGB/lPGiBsg/ARB79gn3iYNkozkGlKYbJ6kW7fRToSQhy
	NGP0B+5LNOtgYUBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723461983;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khiFf9SIP2ZezIcDk+ksvyeFueV9sc4yutkPxw8YTgI=;
	b=naDqM2r3tf69bqrV8/R9VzeApHvRoVzBkFxm1+4/1gtfp0VpU1rolQHBQVM0xm/hO3r822
	BNnP/H/cj+FT9Ztwjwa0swKE9mYkHYWYss2GoK41ExPhVFFKdQHwMKFVxctP/W3nn7vt/7
	6VQDpjXvb0VOuQg3eI9G7iFASfoBF8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723461983;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khiFf9SIP2ZezIcDk+ksvyeFueV9sc4yutkPxw8YTgI=;
	b=DDc9XxgEejJK42DXPEFiQ2ROJaGB/lPGiBsg/ARB79gn3iYNkozkGlKYbJ6kW7fRToSQhy
	NGP0B+5LNOtgYUBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 927C7137BA;
	Mon, 12 Aug 2024 11:26:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id asF1Il7xuWaYVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Aug 2024 11:26:22 +0000
Date: Mon, 12 Aug 2024 13:27:02 +0200
Message-ID: <87cymedlrt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Jonathan LoBue <jlobue10@gmail.com>,
	perex@perex.cz,
	tiwai@suse.com,
	shenghao-ding@ti.com,
	kailang@realtek.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	derekjohn.clark@gmail.com,
	luke@ljones.dev,
	benato.denis96@gmail.com,
	Kyle Gospodnetich <me@kylegospodneti.ch>,
	Jan Drogehoff <sentrycraft123@gmail.com>,
	Richard Alvarez <alvarez.richard@gmail.com>,
	Miles Montierth <cyber_dopamine@intheblackmedia.com>,
	"Chen, Robin" <robinchen@ti.com>
Subject: Re: [PATCH] ALSA: hda/realtek: tas2781: Fix ROG ALLY X audio
In-Reply-To: 
 <CAGwozwF7aR5UypRTe7tNFR+xOfQ=rhqkzYUgBcYH4_LvO9_zXQ@mail.gmail.com>
References: <20240812045325.47736-1-jlobue10@gmail.com>
	<87frra2ocp.wl-tiwai@suse.de>
	<CAGwozwF7aR5UypRTe7tNFR+xOfQ=rhqkzYUgBcYH4_LvO9_zXQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.60 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[17];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,ti.com,realtek.com,alsa-project.org,vger.kernel.org,ljones.dev,kylegospodneti.ch,intheblackmedia.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: QIP2LXZ6CATFBJ7UZ4F5QEHQF4EZDBVH
X-Message-ID-Hash: QIP2LXZ6CATFBJ7UZ4F5QEHQF4EZDBVH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QIP2LXZ6CATFBJ7UZ4F5QEHQF4EZDBVH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 Aug 2024 09:45:59 +0200,
Antheas Kapenekakis wrote:
> 
> Hi,
> I have spoken with Shenghao and Robin Chen (who I CC) from Texas Instruments.
> 
> There is no such thing as TAS2XXX1EB3. For Ally X, there are two firmware files:
> TAS2XXX1EB30 and TAS2XXX1EB31. Both are licensed with GPL
> according to Shenghao.
> 
> Since the linux driver has no concept of the 0 and 1 suffix, I propose
> we symlink the
> 0 one to TAS2XXX1EB3. If required, the driver can be augmented in the future
> to either choose the 0 or 1 file.

Yes, symlinking in linux-firmware tree makes sense.
It's just a matter of a line in WHENCE file, after all.


Takashi
