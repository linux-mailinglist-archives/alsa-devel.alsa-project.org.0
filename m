Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B44CF94E7C6
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2024 09:29:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F15161912;
	Mon, 12 Aug 2024 09:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F15161912
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723447783;
	bh=e4iG/Rv2hmbafwDzq0zo4JgOtrUeSZzZPoEnbxQKspw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uH4Q6FddAT1L1GAY5sbGfXsgQAwI0ZVkLmqhp82gWByaaUDaXdZ1SGQxKPFtAkPOu
	 O1nbRKpxhx69x5gR8H0QUqQ4QK5L9ZxCXQxVZfqGB7rF575TCDNS6uUyyO+lkkGCb8
	 H0RCMIeGL6SLSkFvRan3n/+n0ueo3pwBABPl/l7k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C26B2F805AE; Mon, 12 Aug 2024 09:29:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD788F805AF;
	Mon, 12 Aug 2024 09:29:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6359BF80423; Mon, 12 Aug 2024 09:26:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EE2ACF80107
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 09:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE2ACF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nxdPnQJL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tHALmea+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=nxdPnQJL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tHALmea+
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7CE532022C;
	Mon, 12 Aug 2024 07:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723447566;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6XPo09EObUeV+exTTCamgWy1ozO+qtvAX7oaVDoIEGY=;
	b=nxdPnQJLeSibhsbzX61UBYq6xMRjEGLrVs1gtqlMODk09dSjOcuqq7ryf0ntum+l+0k0kK
	4IfuaLGR8uzK+xZ7nGuGgDD0NGyfS0Qr6+AGrsbmG+tOoRI3rMj5rl2iIpT6FpgywPHBvA
	0MX3h4hMWfGpuyHyn5hPTZowM4JOcyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723447566;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6XPo09EObUeV+exTTCamgWy1ozO+qtvAX7oaVDoIEGY=;
	b=tHALmea+jAACss2DZPv4BPnTKhr3LP5HsbbYZUUUbuxBSXhb3tLaiM4i5sOSjf7zcmusK2
	TOluQBarsNrqoBBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nxdPnQJL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tHALmea+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723447566;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6XPo09EObUeV+exTTCamgWy1ozO+qtvAX7oaVDoIEGY=;
	b=nxdPnQJLeSibhsbzX61UBYq6xMRjEGLrVs1gtqlMODk09dSjOcuqq7ryf0ntum+l+0k0kK
	4IfuaLGR8uzK+xZ7nGuGgDD0NGyfS0Qr6+AGrsbmG+tOoRI3rMj5rl2iIpT6FpgywPHBvA
	0MX3h4hMWfGpuyHyn5hPTZowM4JOcyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723447566;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6XPo09EObUeV+exTTCamgWy1ozO+qtvAX7oaVDoIEGY=;
	b=tHALmea+jAACss2DZPv4BPnTKhr3LP5HsbbYZUUUbuxBSXhb3tLaiM4i5sOSjf7zcmusK2
	TOluQBarsNrqoBBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DCD5137BA;
	Mon, 12 Aug 2024 07:26:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WZcRBg65uWZRDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Aug 2024 07:26:06 +0000
Date: Mon, 12 Aug 2024 09:26:46 +0200
Message-ID: <87frra2ocp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jonathan LoBue <jlobue10@gmail.com>
Cc: perex@perex.cz,
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
	Antheas Kapenekakis <lkml@antheas.dev>,
	Richard Alvarez <alvarez.richard@gmail.com>,
	Miles Montierth <cyber_dopamine@intheblackmedia.com>
Subject: Re: [PATCH] ALSA: hda/realtek: tas2781: Fix ROG ALLY X audio
In-Reply-To: <20240812045325.47736-1-jlobue10@gmail.com>
References: <20240812045325.47736-1-jlobue10@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.01 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[16];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,ti.com,realtek.com,alsa-project.org,vger.kernel.org,gmail.com,ljones.dev,kylegospodneti.ch,antheas.dev,intheblackmedia.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7CE532022C
Message-ID-Hash: KDMRWU567IAAAQ2AYUW2GFMFF4J5Y7X6
X-Message-ID-Hash: KDMRWU567IAAAQ2AYUW2GFMFF4J5Y7X6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KDMRWU567IAAAQ2AYUW2GFMFF4J5Y7X6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 Aug 2024 06:53:25 +0200,
Jonathan LoBue wrote:
> 
> This patch enables the TI TAS2781 amplifier SoC for the ASUS ROG ALLY X.
> This is a design change from the original ASUS ROG ALLY, creating the need
> for this patch. All other Realtek Codec settings seem to be re-used from
> the original ROG ALLY design (on the ROG ALLY X). This patch maintains the
> previous settings for the Realtek codec portion, but enables the I2C
> binding for the TI TAS2781 amplifier (instead of the Cirrus CS35L41 amp
> used on the original ASUS ROG ALLY).
> 
> One other requirement must be met for audio to work on the ASUS ROG ALLY X.
> A proper firmware file in the correct location with a proper symlink. We
> had reached out to TI engineers and confirmed that the firmware found in
> the Windows' driver package has a GPL license. Bazzite Github is hosting
> this firmware file for now until proper linux-firmware upstreaming can
> occur. https://github.com/ublue-os/bazzite
> 
> This firmware file should be placed in
> /usr/lib/firmware/ti/tas2781/TAS2XXX1EB3.bin with a symlink to it from
> /usr/lib/firmware/TAS2XXX1EB3.bin
> 
> Co-developed by: Kyle Gospodnetich <me@kylegospodneti.ch>
> Signed-off-by: Kyle Gospodnetich <me@kylegospodneti.ch>
> Co-developed by: Jan Drogehoff <sentrycraft123@gmail.com>
> Signed-off-by: Jan Drogehoff <sentrycraft123@gmail.com>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> Tested-by: Richard Alvarez <alvarez.richard@gmail.com>
> Tested-by: Miles Montierth <cyber_dopamine@intheblackmedia.com>
> Signed-off-by: Jonathan LoBue <jlobue10@gmail.com>

Applied to for-next branch.

Meanwhile, could you ask TI guys to include the missing firmware files
in linux-firmware git tree, too?


thanks,

Takashi
