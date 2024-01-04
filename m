Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E022823EC4
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 10:36:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A2EAE9B;
	Thu,  4 Jan 2024 10:36:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A2EAE9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704361018;
	bh=ymERd/P8H9zDLCFBT7Ua6sofrqv5Ae8OOj6FLPoLYT0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TQs7LjzM1glbtlqKzM2Nqi2q0yEbHEi5LClKqG37OX4dxZiGw46odTBalle1OYSap
	 fKB4TPNlAoe9gxu6IhsdiImYCQtkE7N1TplHqeofC7ktuAWkmM4SDVxZVOWDZsILoc
	 kZ+JkXlZwE57VsftkczCUud/FD9sU+hbcnZRk9Xo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 885A5F802DB; Thu,  4 Jan 2024 10:36:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6D01F8057F;
	Thu,  4 Jan 2024 10:36:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5360AF804B0; Thu,  4 Jan 2024 10:36:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AB51F802DB
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 10:36:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AB51F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=zOxUEE1I;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zSPGc6/a;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=zOxUEE1I;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zSPGc6/a
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7745D21E11;
	Thu,  4 Jan 2024 09:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704360967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wCC2Cqka0ThfsVWehN5bZIJn79HD8yA3L7KVMrzWJC4=;
	b=zOxUEE1IL7CrQfOcOmtr/2orimz4bzTdiAlBXqOzf+rkQsNmwyU8md+TTbOPHDn6VxFF3j
	aZLo+OMZPqEYXGgMOHmF2oXap+KdCahM8RzN8HK3R2j4/bsGpTYpHf5UFWLPwn1dZGRi5x
	VecOWJV4Far3MjR7HMxoxCkW+Wlm5Ug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704360967;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wCC2Cqka0ThfsVWehN5bZIJn79HD8yA3L7KVMrzWJC4=;
	b=zSPGc6/atvrRxg2R/2cyRa6ypt8OX14m4P85XDyJ+vKlzt9+vBBczNoYbvLCGAqLu0OnME
	nFtL1ArW7By4FzAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704360967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wCC2Cqka0ThfsVWehN5bZIJn79HD8yA3L7KVMrzWJC4=;
	b=zOxUEE1IL7CrQfOcOmtr/2orimz4bzTdiAlBXqOzf+rkQsNmwyU8md+TTbOPHDn6VxFF3j
	aZLo+OMZPqEYXGgMOHmF2oXap+KdCahM8RzN8HK3R2j4/bsGpTYpHf5UFWLPwn1dZGRi5x
	VecOWJV4Far3MjR7HMxoxCkW+Wlm5Ug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704360967;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wCC2Cqka0ThfsVWehN5bZIJn79HD8yA3L7KVMrzWJC4=;
	b=zSPGc6/atvrRxg2R/2cyRa6ypt8OX14m4P85XDyJ+vKlzt9+vBBczNoYbvLCGAqLu0OnME
	nFtL1ArW7By4FzAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E47D3137E8;
	Thu,  4 Jan 2024 09:36:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zTOfNgZ8lmWFYgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 04 Jan 2024 09:36:06 +0000
Date: Thu, 04 Jan 2024 10:36:06 +0100
Message-ID: <87cyuha1a1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matthew Anderson <ruinairas1992@gmail.com>
Cc: tanure@linux.com,
	voreck-lukas@tutanota.com,
	Bagasdotme <bagasdotme@gmail.com>,
	Alsa Devel <alsa-devel@alsa-project.org>,
	Andy Chi <andy.chi@canonical.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Faenkhauser <faenkhauser@gmail.com>,
	James Schulman <james.schulman@cirrus.com>,
	Kailang <kailang@realtek.com>,
	L Guzenko <l.guzenko@web.de>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Linux Sound <linux-sound@vger.kernel.org>,
	Luke <luke@ljones.dev>,
	Overloader <overloader@tutanota.com>,
	Patches <patches@opensource.cirrus.com>,
	Perex <perex@perex.cz>,
	Rf <rf@opensource.cirrus.com>,
	Sbinding <sbinding@opensource.cirrus.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Tiwai <tiwai@suse.com>,
	Tsengalb99 <tsengalb99@gmail.com>,
	Vitalyr <vitalyr@opensource.cirrus.com>,
	Yangyuchi66 <yangyuchi66@gmail.com>
Subject: Re: Fwd: No sound drivers on HP Envy x360 ey0xxx
In-Reply-To: 
 <CAEnG5GADVZeFe55dPyEDbQA_jeNqQLNvCRPK4vBCMPCq25gmdA@mail.gmail.com>
References: <NnE33wh--3-9@tutanota.com>
	<CAJX_Q+0NL1_dkLD2oePhW+EjvGiPLQ7S-1jarz4dANm12iHNMg@mail.gmail.com>
	<CAEnG5GAsD_Db7G3TGkfA+bjO64V6tJuGph1dLOnvGhYicvLW_Q@mail.gmail.com>
	<CAJX_Q+1OoXdBAv=tMFdD1-Kfg0sDdnDjbYDpU9g8YfOeECwukA@mail.gmail.com>
	<CAEnG5GADVZeFe55dPyEDbQA_jeNqQLNvCRPK4vBCMPCq25gmdA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.13 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,web.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 NEURAL_SPAM_LONG(2.43)[0.695];
	 RCPT_COUNT_TWELVE(0.00)[24];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[tutanota.com:email,linux.com:email];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[linux.com,tutanota.com,gmail.com,alsa-project.org,canonical.com,cirrus.com,realtek.com,web.de,vger.kernel.org,ljones.dev,opensource.cirrus.com,perex.cz,ti.com,suse.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Message-ID-Hash: HXAI6HKN3SHGLRAINL5GLQEQ76DSCKLL
X-Message-ID-Hash: HXAI6HKN3SHGLRAINL5GLQEQ76DSCKLL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HXAI6HKN3SHGLRAINL5GLQEQ76DSCKLL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 Jan 2024 17:19:31 +0100,
Matthew Anderson wrote:
> 
> They have something working around it on Windows. It's the same issue we've
> had to work around on Asus devices such as the ROG Ally.
> 
>  You can use DSDT overrides to enable audio on Linux but this is dangerous
> and not recommended because we have no way of knowing the safe values to
> use.
> 
> Asus eventually pushed an update adding the missing information for the ROG
> ally so it's no longer an issue. This is the proper solution.

There are recent additions to apply the static configuration for such
machines with broken BIOSen.  For HP, it'll be included in 6.8,
currently found in for-next branch (or topic/cs35l41 branch) of
sound.git tree.

You'd need to adjust the quirk tables in both
sound/pci/hda/patch_realtek.c and sound/pci/hda/cs35l41_hda_property.c
to match with yours.


HTH,

Takashi

> 
> On Wed, Jan 3, 2024, 9:56 AM Lucas Tanure <tanure@linux.com> wrote:
> 
> >
> >
> > On Wed, 3 Jan 2024, 11:47 Matthew Anderson, <ruinairas1992@gmail.com>
> > wrote:
> >
> >> The issue is that HP does not provide the DSD information in the BIOS for
> >> the Cirrus Amp. I've already emailed HP informing them of the issue. I too
> >> have a newer HP Envy X360 which has the same problem.
> >>
> >> On Wed, Jan 3, 2024, 8:28 AM Lucas Tanure <tanure@linux.com> wrote:
> >>
> >>>
> >>>
> >>> On Wed, 3 Jan 2024, 08:23 , <voreck-lukas@tutanota.com> wrote:
> >>>
> >>>> I hope I'm responding correctly
> >>>>
> >>>> On bugzilla I was asked to attach dmesg and lspci output. I'm sending
> >>>> both as attachments (cause of their length) and hope it works, it's my
> >>>> first time working with these mailing lists.
> >>>>
> >>>
> >>> Hi,
> >>>
> >>> The most important thing to start is the DSDT dump from your Bios.
> >>> That should describe the key points about the hardware configuration.
> >>>
> >>> Thanks
> >>> Lucas Tanure
> >>>
> >>
> > Are you sure?
> > How the can  Windows driver be loaded without that?
> >
> >>
