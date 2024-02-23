Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DAD86136D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 14:58:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DD75847;
	Fri, 23 Feb 2024 14:58:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DD75847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708696707;
	bh=xaO4cUScFrSD4pTs/VF4FjHkzV69WCYv1eyYZyogaag=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jd6k5fE6+DSHOEQn5w7vQwX5UczB3r5kSt9f6fYyk0f8c/rtpgcUY452LceKlY/6H
	 duk4XttRC8s6rDoKTBjrXCDhSUyDuE8TUX8hbPjh8CHN6QDOHVIGvFbMQsSzuG6Bc5
	 k5Vriv01YqbMV+cxBpF77yJRPZNq6vhDVaYeqlqA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 500C5F80567; Fri, 23 Feb 2024 14:57:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC9B5F80568;
	Fri, 23 Feb 2024 14:57:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A6D9F80496; Fri, 23 Feb 2024 14:57:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90849F800EE
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 14:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90849F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BplvIKk+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6BUBAebZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=UDw2Hkg/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NsPt6L+L
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EB59D21228;
	Fri, 23 Feb 2024 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708696664;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V2VnXiwBMr8OEGNfOOEISrIRVqyNDwzg6Yi1yiJ6y0k=;
	b=BplvIKk+ejYyXBCvNq3pwruGLaaPmqdSTY672Ro0Z2fHVuHO3PHMVBGbflUa3RaLTjx5U5
	dp57nWhedA5bCpLe5CdP/K3rMv5u/XrZWU1AnIKbgcqDcfDuFTLN5/fplwHn83Qe4UzylK
	7Fy/GD+IZISbuMmPlhpONAa5G3ww2FU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708696664;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V2VnXiwBMr8OEGNfOOEISrIRVqyNDwzg6Yi1yiJ6y0k=;
	b=6BUBAebZ6+9gidjUaXigSgp3mYqrqFZkq5uNE4/Z+xB1eG99ih36C5W4kiJ4l3rVTmdMnj
	MtdNPveetwF/MAAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708696663;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V2VnXiwBMr8OEGNfOOEISrIRVqyNDwzg6Yi1yiJ6y0k=;
	b=UDw2Hkg/L+Gn0/o/DaJP2u5bkdWaWfXqX3Sjryb4hPilgT5aTF2zungS3bWHejOuU4FtcM
	eykc4d/nyjieflb+eTVbaCgQHeI7c2U9Nyd2/8Oe4hB/XgYv14MwsYsdxveP0SKRO6+BYP
	iGxYTWoSEJZRLBkBsTSqKkEjUt1kM3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708696663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V2VnXiwBMr8OEGNfOOEISrIRVqyNDwzg6Yi1yiJ6y0k=;
	b=NsPt6L+L3H8lwvCuJ/eFnghQ3Y3WyLMpOTV6bcJ9tsLa+px1PUP6NVgF5cI80Tef1JCxyO
	miy7s1nigjDq2CBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C6875132C7;
	Fri, 23 Feb 2024 13:57:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +WXyLlek2GUnDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 13:57:43 +0000
Date: Fri, 23 Feb 2024 14:57:43 +0100
Message-ID: <87sf1j2sh4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: PCI SSID and Codec SSID collision?
In-Reply-To: <d5b42e483566a3815d229270abd668131a0d9f3a.camel@irl.hu>
References: <d5b42e483566a3815d229270abd668131a0d9f3a.camel@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-0.75 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 SUBJECT_ENDS_QUESTION(1.00)[];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.45)[91.29%]
Message-ID-Hash: FPGG2FNMTKLAZEP4RXDA4SELLEQNU2BY
X-Message-ID-Hash: FPGG2FNMTKLAZEP4RXDA4SELLEQNU2BY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPGG2FNMTKLAZEP4RXDA4SELLEQNU2BY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Feb 2024 13:05:12 +0100,
Gergo Koteles wrote:
> 
> Hi,
> 
> The Lenovo Yoga Slim Pro 9 14IRP8 has tas2781 amplifiers, but it can
> only pickup its fixup with the hda_model=17aa:38be module parameter.
> 
> The 17aa:38be is the SSID of its Codec. The PCI SSID is 17aa:3802.
> 
> The patch_realtek.c has these fixup:
> SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga DuetITL 2021",
> ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
> SND_PCI_QUIRK(0x17aa, 0x38be, "Yoga S980-14.5 proX YC Dual",
> ALC287_FIXUP_TAS2781_I2C),
> 
> And the snd_hda_pick_fixup() picks the former fixup because of the same
> PCI SSID, but that is a Codec SSID?
> 
> At least it worked without that line.
> https://bugzilla.kernel.org/show_bug.cgi?id=208555#c839
> 
> It would be nice if it can be work without the module parameter.
> 
> What is the best way to add this strangeness to patch_realtek.c?

That's a bad collision that happens rarely but more than once...

In this case, we'd need to fix 17aa:3802 matching to be a special
function that checks the model more closely.  e.g. create a quirk
function that checks the codec SSID additionally and apply the
different quirks from there.


thanks,

Takashi
