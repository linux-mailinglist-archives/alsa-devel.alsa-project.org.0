Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED80B12B85
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Jul 2025 18:51:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E53D16024E;
	Sat, 26 Jul 2025 18:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E53D16024E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753548704;
	bh=zDpIBHnyHepg3obhHPwbHPZ6/B84BaLrE2pLUyfYpsk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BMmAMAX2btFoj4gkgRjxhjxJzcEIg02jbq9boooMwU0HecXvdfWUUoQjKov69I4Fw
	 jH7pryBQCRkWKl1QqCmeW/vYqRkLO+JQFR6mgly1nmLQCa0xuRbjoytruUNt7M/kIJ
	 WrFGGBJkmWur/QyZck3J27P9s9AOvIViy7sJyuQU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1B40F8057E; Sat, 26 Jul 2025 18:51:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75EE8F805C2;
	Sat, 26 Jul 2025 18:51:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43D6EF8053D; Sat, 26 Jul 2025 18:50:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC505F80134
	for <alsa-devel@alsa-project.org>; Sat, 26 Jul 2025 18:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC505F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OSZVFW+z;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YqfEVXTw;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=OSZVFW+z;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YqfEVXTw
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 313CA219E9;
	Sat, 26 Jul 2025 16:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1753548632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEhiDTcKgxemrdqd09WTVsmXruXt1rZDsbRfz6qthKA=;
	b=OSZVFW+zBE+I3r2yZoP86GujVV5u/COUcUR+8ZMo1UeO2ffnePpHcM7exeH2Vfs8VfeL4D
	KHwHWA8dfKz0p8EnQgbLJb16ob41yk97IF8ox6Z/3S88QauHykLnSYDxAwyaGpxlmURuWP
	glOQCmlYmzECtveXISTnM3SYQ/RAbII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753548632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEhiDTcKgxemrdqd09WTVsmXruXt1rZDsbRfz6qthKA=;
	b=YqfEVXTw6ECEVvYEqCH3SfeTLF8252M6+9bzm8NsOa47EgUbtwe8ezyUUwzG+j16NovVuj
	iiMymkKVLJLnEjDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OSZVFW+z;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YqfEVXTw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1753548632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEhiDTcKgxemrdqd09WTVsmXruXt1rZDsbRfz6qthKA=;
	b=OSZVFW+zBE+I3r2yZoP86GujVV5u/COUcUR+8ZMo1UeO2ffnePpHcM7exeH2Vfs8VfeL4D
	KHwHWA8dfKz0p8EnQgbLJb16ob41yk97IF8ox6Z/3S88QauHykLnSYDxAwyaGpxlmURuWP
	glOQCmlYmzECtveXISTnM3SYQ/RAbII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753548632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEhiDTcKgxemrdqd09WTVsmXruXt1rZDsbRfz6qthKA=;
	b=YqfEVXTw6ECEVvYEqCH3SfeTLF8252M6+9bzm8NsOa47EgUbtwe8ezyUUwzG+j16NovVuj
	iiMymkKVLJLnEjDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E2D381388B;
	Sat, 26 Jul 2025 16:50:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xcN5NVcHhWgbXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 26 Jul 2025 16:50:31 +0000
Date: Sat, 26 Jul 2025 18:50:31 +0200
Message-ID: <87zfcqvqug.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Xu, Baojun" <baojun.xu@ti.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Ding, Shenghao"
	<shenghao-ding@ti.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"P O, Vijeth" <v-po@ti.com>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [EXTERNAL] Re: [PATCH v2] ALSA: hda: Add TAS2770 support
In-Reply-To: <cc99c78e042b47cca92f4a3050f36a9c@ti.com>
References: <20250723142423.38768-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [1.29 / 50.00];
	SEM_URIBL(3.50)[139.com:email];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	SUSPICIOUS_URL_IN_SUSPICIOUS_MESSAGE(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	R_DKIM_ALLOW(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,alsa-project.org,ti.com,139.com,vger.kernel.org];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	REDIRECTOR_URL(0.00)[proofpoint.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:mid,suse.de:dkim,suse.de:email]
X-Spamd-Bar: +
X-Rspamd-Queue-Id: 313CA219E9
Message-ID-Hash: 44WSSYHKEV5CGIJOTESLU2QEGNGYXZWR
X-Message-ID-Hash: 44WSSYHKEV5CGIJOTESLU2QEGNGYXZWR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/44WSSYHKEV5CGIJOTESLU2QEGNGYXZWR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 26 Jul 2025 13:34:28 +0200,
Xu, Baojun wrote:
> 
> > 
> > ________________________________________
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: 23 July 2025 22:40
> > To: Xu, Baojun
> > Cc: broonie@kernel.org; andriy.shevchenko@linux.intel.com; alsa-devel@alsa-project.org; Ding, Shenghao; 13916275206@139.com; P O, Vijeth; linux-sound@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: [EXTERNAL] Re: [PATCH v2] ALSA: hda: Add TAS2770 support
> > 
> > On Wed, 23 Jul 2025 16: 24: 23 +0200, Baojun Xu wrote: > > Add TAS2770 support in TI's HDA driver. And add hda_chip_id for > more products. Distinguish DSP and non-DSP in firmware > loading function. > > Signed-off-by: Baojun
> > ZjQcmQRYFpfptBannerStart
> > This message was sent from outside of Texas Instruments.
> > Do not click links or open attachments unless you recognize the source of this email and know the content is safe.
> > <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!vxdrHf3EPmdQig3vfxtoX0ga-ZW2grb4pJ-90xEaom-nVsHT8xHY3D2nK8v5mdWlEw0t3Q$>
> > Report Suspicious
> > 
> > ZjQcmQRYFpfptBannerEnd
> > 
> > On Wed, 23 Jul 2025 16:24:23 +0200,
> > Baojun Xu wrote:
> > >
> > > Add TAS2770 support in TI's HDA driver. And add hda_chip_id for
> > > more products. Distinguish DSP and non-DSP in firmware
> > > loading function.
> > >
> > > Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> > 
> > Applied now, thanks.
> > 
> > 
> > BTW, is include/sound/tas2770-tlv.h used by any other driver?
> > (Also include/sound/tas2781-tlv.h).
> > 
> > If those are used only by tas2781-hda-i2s/spi drivers, the files can
> > be moved to sound/hda/codecs/side-codecs as local headers.
> > 
> > In general, include/sound is rather for public headers that are read
> > by multiple drivers in different places.
> 
> Thanks for the apply!
> Yes, include/sound/tasxxxx-tlv.h will also be used by other drivers
> (for example, sound/soc/codecs/tas2xxx-i2c.c)

OK, in that case, it's fine.


thanks,

Takashi
