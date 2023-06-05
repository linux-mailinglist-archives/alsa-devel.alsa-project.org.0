Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6D3721FFC
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 09:48:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E3B4839;
	Mon,  5 Jun 2023 09:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E3B4839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685951295;
	bh=XW1oDVjBS5pzfr2izLg5tjYe7JaNBqPBiqsFcnLpddg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZtXYpa5rPfRPe9fnKxErlBFDDgObnuy+eKYQlwC6BfA15yFfL+WM7Du96qZMhtQg/
	 wWJih24rYVtpT05FrAGJT6m17db4TXfpqZcfKXOZdDVWzKx+97oMa8TBQJEYamH688
	 aVXcgESN1F/ScvhhUAHXGn2TehFoEXyi+e5alAxo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11054F80520; Mon,  5 Jun 2023 09:47:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1584F80155;
	Mon,  5 Jun 2023 09:47:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4AD4F80199; Mon,  5 Jun 2023 09:47:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 156D5F80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 09:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 156D5F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xFJwyLsU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=upxesWqb
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 829B21F8AB;
	Mon,  5 Jun 2023 07:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1685951239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fXACBDWrWpm21SDboD4jk6Mj+IB2S3VWoHaVLLVQuEU=;
	b=xFJwyLsUXGZJhbw1lihTbO6nRG4gpH5nmhFu3RUjiS+NAMuiZu2x1IKsI11W/hEDy93OhV
	py+Nkhw9ZiwslZa0bffGAftmHdp06YERIn6E87w/wbJBa+2MdIcNTfzC1GyM9B6n1ZOixU
	9N2NS2wNnaZdLCI5PVHOo5rQ4qs5O+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685951239;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fXACBDWrWpm21SDboD4jk6Mj+IB2S3VWoHaVLLVQuEU=;
	b=upxesWqb19z56yRorzmCgNUorCU652+EbD50n18d67+r1HO8rZ5GrEx24uk4Klzdvg99Vr
	i95wtvV/usGwMTDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 53595139C7;
	Mon,  5 Jun 2023 07:47:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id rRBLEweTfWTmdAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 05 Jun 2023 07:47:19 +0000
Date: Mon, 05 Jun 2023 09:47:18 +0200
Message-ID: <87mt1eic55.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: <broonie@kernel.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	<tiwai@suse.com>,
	<perex@perex.cz>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v4 00/12] ALSA: hda: Adding support for CS35L56 on HDA
 systems
In-Reply-To: <87o7luic7c.wl-tiwai@suse.de>
References: <20230601154731.3210572-1-rf@opensource.cirrus.com>
	<87o7luic7c.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: T44XXXGIIVOQ24PSVPNB6VNURKZEWXFJ
X-Message-ID-Hash: T44XXXGIIVOQ24PSVPNB6VNURKZEWXFJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T44XXXGIIVOQ24PSVPNB6VNURKZEWXFJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 05 Jun 2023 09:45:59 +0200,
Takashi Iwai wrote:
> 
> On Thu, 01 Jun 2023 17:47:19 +0200,
> Richard Fitzgerald wrote:
> > 
> > This set of patches adds support for using the CS35L56 boosted smart
> > amplifier on HDA systems. In these systems the CS35L56 audio is
> > routed through a HDA-to-I2S bridge codec.
> > 
> > This doesn't include the changes to the Realtek driver to actually hook
> > up the CS35L56 driver, because we don't yet have the QUIRK IDs to
> > associate it with. But we want to publish the driver now so that it is
> > available for bringing up hardware with the CS35L56.
> > 
> > The first 9 patches are moving code out of the ASoC driver and into the
> > shared library so that it can be shared with the HDA driver.
> > 
> > Patch #10 fixes missing #includes in the HDA headers so that the CS35L56
> > driver doesn't have to #include headers that it doesn't use.
> > 
> > Finally, #11 and #12 actually add the support for CS35L56 on HDA.
> > 
> > CHANGES SINCE V3
> > Patch 01:
> > - Fix double-free of IRQ caused by passing wrong cookie to devm_irq_free()
> > Patch 12:
> > - Fix memory leak of struct firmware object and firmware name strings.
> > - Find and open firmware files before taking the irq_lock mutex and pm_runtime.
> > - Don't bother executing the firmware loading code if no firmware files were
> >   found.
> > 
> > Richard Fitzgerald (4):
> >   ASoC: cs35l56: Move runtime suspend/resume to shared library
> >   ASoC: cs35l56: Move cs_dsp init into shared library
> >   ASoC: cs35l56: Move part of cs35l56_init() to shared library
> >   ALSA: hda: Fix missing header dependencies
> > 
> > Simon Trimmer (8):
> >   ASoC: cs35l56: Move shared data into a common data structure
> >   ASoC: cs35l56: Make cs35l56_system_reset() code more generic
> >   ASoC: cs35l56: Convert utility functions to use common data structure
> >   ASoC: cs35l56: Move utility functions to shared file
> >   ASoC: cs35l56: Make common function for control port wait
> >   ASoC: cs35l56: Make a common function to shutdown the DSP
> >   ALSA: hda: Add mute_hook to hda_component
> >   ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier
> 
> It'd be likely easier to merge all those via ASoC tree, I suppose, as
> some patches seem to have prerequisite in the recent ASoC changes.
> So, Mark, could you take those through yours?
> 
> Feel free to put my ack:
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>

Oh, and after you merge them, please send a PR to sound.git tree,
too.  This will make our lives easier, as there will be other
conflicting changes for HD-audio component for TAS codecs, too.


thanks,

Takashi
