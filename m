Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8F77D866E
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 18:03:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A8A4827;
	Thu, 26 Oct 2023 18:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A8A4827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698336208;
	bh=eRwwL2iJAEFLB6AW9+oxN6MHp5G4A0t24nB8GiwikD0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j1tNChXenBg0oBoFc56HMxVQ3AV7D+fGKb68dbd1OBtxK268JDm5Nz/oOBsDlzpuc
	 lV3mN/84jJA5pPGpTEORnHt6GjOZqD1WG3333GyIa0TWVbFp0rkp/+IiqIQZAJ1YKX
	 gYl3O/+uNIZuISCo/QiNHfJSz5gaZccwoHC8xoVM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E54BEF80558; Thu, 26 Oct 2023 18:02:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C095F80165;
	Thu, 26 Oct 2023 18:02:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7DADF8019B; Thu, 26 Oct 2023 18:02:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EED4F8014B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 18:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EED4F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=p7FXIHhl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9BRuisOQ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B468721AD4;
	Thu, 26 Oct 2023 16:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1698336142;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L3jBrvFhTDe3eSEyZfXz/IDIQ4Au/tRbSyyjMpWYOH4=;
	b=p7FXIHhl4tnDCzRNTEN0pQxOwffpZn5iv4Zb/cDJxuf9BpruBhMQI87kMN4UD6LBHEefif
	4lmAw5PB/fLAkdPVFkaQ5FXocGHzfmrsITxxwqVuqRslLZLmqw/KarwmyRs9FEiyd5+rbC
	8NMv+eH/LH5NpwhbKUnvSyZgib7l0d8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698336142;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L3jBrvFhTDe3eSEyZfXz/IDIQ4Au/tRbSyyjMpWYOH4=;
	b=9BRuisOQJv2wORhgQ/1G/i13/Ps0I0A8/dEhcAzhyJbD79zrf9Rbuiw+Sn/M/KxYdorOcw
	ddH6E/lP/YNdQrAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C831133F5;
	Thu, 26 Oct 2023 16:02:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qlNbHY6NOmUPDAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 26 Oct 2023 16:02:22 +0000
Date: Thu, 26 Oct 2023 18:02:21 +0200
Message-ID: <87zg05xtgy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Mark Brown" <broonie@kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1 0/8] System Suspend fixes and improvements for CS35L41
 HDA
In-Reply-To: <20231026150558.2105827-1-sbinding@opensource.cirrus.com>
References: <20231026150558.2105827-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-8.35 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.25)[89.59%]
Message-ID-Hash: ETWRXW4JUQ2MO6ABHJZFXIKL5BJCKOZN
X-Message-ID-Hash: ETWRXW4JUQ2MO6ABHJZFXIKL5BJCKOZN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETWRXW4JUQ2MO6ABHJZFXIKL5BJCKOZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 26 Oct 2023 17:05:50 +0200,
Stefan Binding wrote:
> 
> There is a report of a single laptop which uses CS35L41 HDA having an
> issue with System Suspend. This particular laptop uses S3 (Deep) Sleep.
> The reported issue states that when the laptop resumes from a system
> suspend, audio no longer works.
> 
> The root cause of this issue is due to the CS35L41 being returned to us
> in an unexpected state after a suspend/resume cycle.
> When the driver resumes, it expects the parts to have been reset, which
> leads to issues with audio and firmware loading.
> 
> To prevent this issue, and the possibility of similar issues, patches
> 2-5 force the driver to reset during probe, system suspend, and system
> resume, which ensures that the part is always in the correct state.
> Patches 6-8 are improvements in the suspend and firmware loading code,
> which makes it easier to detect issues in the future, as well as
> simplifiying the suspend code.
> 
> Patch 1 is a fix for an incorrect configuration for the HP Zbook Fury
> 17, which is the laptop which had the original issue.
> 
> Stefan Binding (8):
>   ALSA: hda: cs35l41: Use reset label to get GPIO for HP Zbook Fury 17
>     G9
>   ALSA: hda: cs35l41: Assert reset before system suspend
>   ALSA: hda: cs35l41: Assert Reset prior to de-asserting in probe and
>     system resume
>   ALSA: hda: cs35l41: Run boot process during resume callbacks
>   ALSA: hda: cs35l41: Force a software reset after hardware reset
>   ALSA: hda: cs35l41: Do not unload firmware before reset in system
>     suspend
>   ALSA: hda: cs35l41: Check CSPL state after loading firmware
>   ASoC: cs35l41: Detect CSPL errors when sending CSPL commands

Applied to for-next branch now.  Thanks.


Takashi
