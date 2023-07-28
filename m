Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5153E766B70
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 13:12:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E50F7820;
	Fri, 28 Jul 2023 13:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E50F7820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690542719;
	bh=ROFPNCsXBYFcGx9GoWfw6tnhYTLVKGb29oowE2+dn0k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fieX0QpmFoEsYAssr2XQj46UALl2oJZlOIouj4E8EDnymFPywlWJcD2V52R82KpI0
	 46uL9NDEnSrK1qkfb3dQR0vkiqdG95mmQcz5a9HiDR/vD76IhKEPNF4XoSnbi9kMvi
	 uEdiynnoSI1+7MFifMPvmshlmH4HjQLn+GbY6e20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22AF5F80153; Fri, 28 Jul 2023 13:11:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86253F80163;
	Fri, 28 Jul 2023 13:11:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 583A1F8019B; Fri, 28 Jul 2023 13:11:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3B1DF800C7
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 13:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3B1DF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bUgNbXCS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wDH39ZHI
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E020C2198B;
	Fri, 28 Jul 2023 11:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690542642;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aNiBGJXE72ww7HkTJtt6PR1CpjKb97wubuBgNaM6XTc=;
	b=bUgNbXCSn6aW185cjmZ6ntotpIY0g1GvcL7gt6L7U8Ry/tRfQitz1pBr44swsRz3z1Ar7h
	fWrCJHup5E4b0NAkNeFCp8Y++N6QtdUXOCma5Jfh6/OB4Exxu+trczxfZRDohQU7rkG0j/
	8PgDT9JPt732dVNHsbj3mDbxbhEPQ5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690542642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aNiBGJXE72ww7HkTJtt6PR1CpjKb97wubuBgNaM6XTc=;
	b=wDH39ZHIRFRwI66u5L6Mdmvnao5se0aV582Fr7kBeZw2DhC8WweoAMbfbJkeXrIrxwYryu
	4ZSUifapSRz6MNDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AAD00133F7;
	Fri, 28 Jul 2023 11:10:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iMayKDKiw2SPPgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 28 Jul 2023 11:10:42 +0000
Date: Fri, 28 Jul 2023 13:10:42 +0200
Message-ID: <87ila4cmvh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi
 Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 00/11] Fix support for System Suspend for CS35L41 HDA
In-Reply-To: <87jzupwuo9.wl-tiwai@suse.de>
References: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
	<87jzupwuo9.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 3744F6ELSQJS2UILWW43YERLLK7PZWV4
X-Message-ID-Hash: 3744F6ELSQJS2UILWW43YERLLK7PZWV4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3744F6ELSQJS2UILWW43YERLLK7PZWV4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 24 Jul 2023 11:00:38 +0200,
Takashi Iwai wrote:
> 
> On Fri, 21 Jul 2023 17:18:05 +0200,
> Stefan Binding wrote:
> > 
> > There have been a couple of customer reports of intermittant issues after
> > system resume, where sometimes the DSP firmware stops responding.
> > Investigations into this issue show that there is a race between receiving
> > a prepare from the HDA core, and the firmware reload which is started by
> > the system resume. This can causes the Global Enable on the CS35L41 to be
> > enabled during the firmware load, which can sometimes cause issues in the
> > DSP.
> > 
> > The existing system resume behaviour also did not resume the audio, if
> > audio was previously playing when it was suspended.
> > In addition, during investigation, it was found there were additional
> > problems in the System Resume sequence, as well as the Playback sequence
> > with External Boost, where the driver does not correctly follow its
> > enable sequence for this mode. This can cause additional issues such as
> > pops and clicks.
> > 
> > This chain intends to correct the sequences for playback and system
> > suspend/resume so that the driver: obeys the external boost enable sequence;
> > resumes audio on system resume; and avoids the race condition on firmware
> > load and playback during system resume.
> > 
> > Changes since v1:
> > - Split patch 1 into 2 separate patches
> > - Combine Patches 6 and 9
> > 
> > Stefan Binding (11):
> >   ALSA: cs35l41: Use mbox command to enable speaker output for external
> >     boost
> >   ALSA: cs35l41: Poll for Power Up/Down rather than waiting a fixed
> >     delay
> >   ALSA: hda: cs35l41: Check mailbox status of pause command after
> >     firmware load
> >   ALSA: hda: cs35l41: Ensure we correctly re-sync regmap before system
> >     suspending.
> >   ALSA: hda: cs35l41: Ensure we pass up any errors during system
> >     suspend.
> >   ALSA: hda: cs35l41: Move Play and Pause into separate functions
> >   ALSA: hda: hda_component: Add pre and post playback hooks to
> >     hda_component
> >   ALSA: hda: cs35l41: Use pre and post playback hooks
> >   ALSA: hda: cs35l41: Rework System Suspend to ensure correct call
> >     separation
> >   ALSA: hda: cs35l41: Add device_link between HDA and cs35l41_hda
> >   ALSA: hda: cs35l41: Ensure amp is only unmuted during playback
> 
> Applied all patches now to for-next branch.

It seems that this patch set causes occasional freeze at suspend:
  https://bugzilla.suse.com/show_bug.cgi?id=1213745

Could you take a look?


thanks,

Takashi
