Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E924751B90
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 10:31:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC48C6C1;
	Thu, 13 Jul 2023 10:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC48C6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689237115;
	bh=P4XVN+PqOcLGPRIMiFGwYxCT98/RvvNYS6Pq/ZBzw1c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q8ZyEiGwnZKqekER/eflUrssHjK/GdkUxYDTId/8V39hivC/Q6KaUrb3zzN13LKbS
	 q/2fj05qjcoW5OhR/xUeezGNYMABzLXnqMpbgnpAUvZmg2z4dBs/Cx2VFFeJ9+H0ER
	 3KRiBNXzCAzBrBLSPTpbb4uz1QUEDPPI0FSkMdWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C6D7F8024E; Thu, 13 Jul 2023 10:31:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6E41F80236;
	Thu, 13 Jul 2023 10:31:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78A2EF80249; Thu, 13 Jul 2023 10:31:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FEA0F800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 10:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FEA0F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sVkm3j9p;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NVPtRDb6
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A6FC81F8D9;
	Thu, 13 Jul 2023 08:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689237057;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WdIucHGho4BEvmS3An3p/A5yr4OwjAXNy3MtCiYUmhQ=;
	b=sVkm3j9p62yqulV9gX0dOfO+tSi/bZ6kN6y7zlT0pCZXeFJ5fXtPV/h//VvA0nxU4mv4D4
	r+VKqBLZ0kCLMBAjhbJFgRVBvls99KmVxTTfWFawlmSrQCpFoxsXnhbdGBjZ6d4PVL5QlO
	xZfXdRhX9vikTLL8E0kneIPFdaB08nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689237057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WdIucHGho4BEvmS3An3p/A5yr4OwjAXNy3MtCiYUmhQ=;
	b=NVPtRDb6YXgpx/a+VE0forcacbX4gmS8bkken609HctYg3/lUAu5FGsdn2JvUvok7T0JHz
	iZO5MqThj72sBGDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86493133D6;
	Thu, 13 Jul 2023 08:30:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wpPfH0G2r2QWMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 13 Jul 2023 08:30:57 +0000
Date: Thu, 13 Jul 2023 10:30:57 +0200
Message-ID: <87lefkfc1q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 2/3] ALSA: emu10k1: remove superfluous IRQ enable state
 saving
In-Reply-To: <20230712145750.125086-2-oswald.buddenhagen@gmx.de>
References: <20230712145750.125086-1-oswald.buddenhagen@gmx.de>
	<20230712145750.125086-2-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: BEFYBCQJO4345O2I3Q3ZL5BWUZXH2EEI
X-Message-ID-Hash: BEFYBCQJO4345O2I3Q3ZL5BWUZXH2EEI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BEFYBCQJO4345O2I3Q3ZL5BWUZXH2EEI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jul 2023 16:57:49 +0200,
Oswald Buddenhagen wrote:
> 
> The mixer, PCM prepare, MIDI, synth driver, and procfs callbacks are all
> always invoked with IRQs enabled, so there is no point in saving the
> state.
> 
> snd_emu1010_load_firmware_entry() is called from emu1010_firmware_work()
> and snd_emu10k1_emu1010_init(); the latter from snd_emu10k1_create() and
> snd_emu10k1_resume(), all of which have IRQs enabled.
> 
> The voice and memory functions are called from mixed contexts, so they
> keep the state saving.
> 
> The low-level functions all keep the state saving, because it's not
> feasible to keep track of what is called where.
> 
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

Applied now.  Thanks.


Takashi
