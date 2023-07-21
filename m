Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6375875CAA8
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 16:52:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB4D200;
	Fri, 21 Jul 2023 16:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB4D200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689951120;
	bh=/lt2nCXl8oRLecjuKOUeljZWk5t++dKudm0w8izZB+8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YhxbQ8dKVFXL7aojWCyLWkGRmfbmrae+tspggD6xwqAgTg+RcVVJ++RvCwyBW2th3
	 ASdmpQZR/hfhvyNhIYTILA3gNlrRwYe6FngKUHH76sUT1cwGEqDFB30j8lLNXrVrYr
	 +Lg9OyeyjNg7xch5NEIcE98CaGlbzbaapSkPoVLA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32173F80494; Fri, 21 Jul 2023 16:50:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A1C6F8032D;
	Fri, 21 Jul 2023 16:50:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3775F8047D; Fri, 21 Jul 2023 16:50:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AF7EF8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 16:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AF7EF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ONVDuTkf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7abz8qmX
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 431DE218A0;
	Fri, 21 Jul 2023 14:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689951036;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vCBDLdIX566wZPqhuE9j3nMUEKvAtwBa3Y1ipHMwwHM=;
	b=ONVDuTkf/fZMUwAz/38SG08TVMvLgLI2o9TLB9RCx0OqPdvjp/AS3PD20nsVMAT1zHHfH+
	r/gfRuRVN3YGakUqctsm3ZYPhZcROLfT5y1+zMIF9E77Bo8f87FeOy7K3b0yffgO9eu4Ye
	AV6ydvb4Twf41cqrtoViHo6s6FpCYa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689951036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vCBDLdIX566wZPqhuE9j3nMUEKvAtwBa3Y1ipHMwwHM=;
	b=7abz8qmX5hP+OmDH2enyXnwVkG2M8DYye3Tw4grfB2kjlYSD5GpQeTEnfoMQ8TWJUpwDtk
	/sNi1yclVWJv5dAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A7C8134BA;
	Fri, 21 Jul 2023 14:50:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4H2WATybumQ2GQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 21 Jul 2023 14:50:36 +0000
Date: Fri, 21 Jul 2023 16:50:35 +0200
Message-ID: <87bkg5z5c4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <broonie@kernel.org>,
	<tiwai@suse.com>,
	<perex@perex.cz>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v5 00/11] ALSA: hda: Adding support for CS35L56 on HDA
 systems
In-Reply-To: <20230721132120.5523-1-rf@opensource.cirrus.com>
References: <20230721132120.5523-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: OHKZOCRXJM7AAJ7XI43SWAD5NR3NYFPD
X-Message-ID-Hash: OHKZOCRXJM7AAJ7XI43SWAD5NR3NYFPD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OHKZOCRXJM7AAJ7XI43SWAD5NR3NYFPD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023 15:21:09 +0200,
Richard Fitzgerald wrote:
> 
> This set of patches adds support for using the CS35L56 boosted smart
> amplifier on HDA systems. In these systems the CS35L56 audio is
> routed through a HDA-to-I2S bridge codec.
> 
> This doesn't include the changes to the Realtek driver to actually hook
> up the CS35L56 driver, because we don't yet have the QUIRK IDs to
> associate it with. But we want to publish the driver now so that it is
> available for bringing up hardware with the CS35L56.
> 
> The first 9 patches are moving code out of the ASoC driver and into the
> shared library so that it can be shared with the HDA driver.
> 
> Patch #10 fixes missing #includes in the HDA headers so that the CS35L56
> driver doesn't have to #include headers that it doesn't use.
> 
> CHANGES SINCE V5
> The series has been rebased onto commit df4167d658d4
> ("ASoC: cs35l56: Patch soft registers to defaults"), which removes
> cs35l56_reread_firmware_registers() and adds cs35l56_set_patch().
> 
> Changes are trivial so I have carried forward Mark's and Takashi's acks.

Mark, I suppose it's fine to take all of those to my sound.git tree?


Takashi
