Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BE896EBEC
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 09:27:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4901EB70;
	Fri,  6 Sep 2024 09:26:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4901EB70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725607620;
	bh=w24ClMpk/3FWOO/uXiViU0olb2BuJQQrGQS/6CnBfuE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=seimTCz6mR0713Id17loBHfqgeWh0t5+OKeNpnGJyMgKjxwayMPWDbVzQs249IFIk
	 EeS/3jZPlLV+AEgQrpWHhf6d2n8dMAv4GmCa/dK3gmyZ4insnEvWvarfVdjqJMqLdQ
	 59WAmAtb1cFarFCH9QNUq3JyQSG8s6v8VBGV/wVM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 668CCF805B2; Fri,  6 Sep 2024 09:26:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57721F805B1;
	Fri,  6 Sep 2024 09:26:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89C7DF8016C; Fri,  6 Sep 2024 09:26:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFF71F80027
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 09:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFF71F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=0bdCY3yK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Eyqhmktm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=0bdCY3yK;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Eyqhmktm
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0786C1F896;
	Fri,  6 Sep 2024 07:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725607578;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hqoweOcBDbSA+7HZiUYq5Pgtsyq80P3DQd88C5/WAT4=;
	b=0bdCY3yKGm8H/78zikBOmnv7J25+SU5hegtuofsLGKVl7Kmn32ajD46MIeamJytzFXGFLy
	hFsTIqfcv8HhbeeTJpiPSwzFKSt9W5DW8LwKnH6vP3K+8h/LRTusEHbnph/otzjRy8OZVq
	V8YVw8wobPDbmOYC+EeWEDUojry7QLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725607578;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hqoweOcBDbSA+7HZiUYq5Pgtsyq80P3DQd88C5/WAT4=;
	b=EyqhmktmWFiZJmZW8M/wUVN8guG1vJe0G6sWL8OW3r9Rxm1DVjHnSTVToLVfVZbdSRUEOq
	UI+ULZ/FmGxqD7BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725607578;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hqoweOcBDbSA+7HZiUYq5Pgtsyq80P3DQd88C5/WAT4=;
	b=0bdCY3yKGm8H/78zikBOmnv7J25+SU5hegtuofsLGKVl7Kmn32ajD46MIeamJytzFXGFLy
	hFsTIqfcv8HhbeeTJpiPSwzFKSt9W5DW8LwKnH6vP3K+8h/LRTusEHbnph/otzjRy8OZVq
	V8YVw8wobPDbmOYC+EeWEDUojry7QLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725607578;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hqoweOcBDbSA+7HZiUYq5Pgtsyq80P3DQd88C5/WAT4=;
	b=EyqhmktmWFiZJmZW8M/wUVN8guG1vJe0G6sWL8OW3r9Rxm1DVjHnSTVToLVfVZbdSRUEOq
	UI+ULZ/FmGxqD7BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E2B61395F;
	Fri,  6 Sep 2024 07:26:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CgfEFZmu2mYgNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Sep 2024 07:26:17 +0000
Date: Fri, 06 Sep 2024 09:27:03 +0200
Message-ID: <87h6atfdiw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 00/13] ALSA: update sample rate definitions
In-Reply-To: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,cirrus.com,opensource.cirrus.com,gmail.com,kernel.org,intel.com,linux.intel.com,linaro.org,csie.org,sholland.org,vger.kernel.org,alsa-project.org,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: UYJRTUH42CIJQ7HMGZA3H2U2JBOKWZSW
X-Message-ID-Hash: UYJRTUH42CIJQ7HMGZA3H2U2JBOKWZSW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UYJRTUH42CIJQ7HMGZA3H2U2JBOKWZSW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 05 Sep 2024 16:12:51 +0200,
Jerome Brunet wrote:
> 
> This patchset adds rate definitions for 12kHz, 24kHz and 128kHz.
> 
> It is follow-up on the series/discussion [0] about adding 128kHz for
> spdif/eARC support. The outcome was to add 12kHz and 24kHz as well and
> clean up the drivers that no longer require custom rules to allow these
> rates.
> 
> Identifying these drivers is not straight forward, I tried my best but I
> may have missed some. Those will continue to work anyway so it is not
> critical. Some drivers using these rates have not been changed on
> purpose. The reason for this may be:
> * The driver used other uncommon rates that still don't have a definition
>   so a custom rule is still required.
> * The constraint structure is used in some other way by the driver and
>   removing it would not help the readability or maintainability. This is
>   the case the freescale asrc drivers for example.
> 
> There is one change per driver so, if there is a problem later on, it will
> easier to properly add Fixes tag.
> 
> The series has been tested with
> * ARM64 defconfig - spdif 128kHz at runtime.
> * x86_64 allmodconfig - compile test only
> 
> Last, the change adding IEC958 definitions has been dropped for this
> patchset and will be resent separately
> 
> [0]: https://lore.kernel.org/all/20240628122429.2018059-1-jbrunet@baylibre.com/
> 
> ---
> Jerome Brunet (13):
>       ALSA: pcm: add more sample rate definitions
>       ALSA: cmipci: drop SNDRV_PCM_RATE_KNOT
>       ALSA: emu10k1: drop SNDRV_PCM_RATE_KNOT
>       ALSA: hdsp: drop SNDRV_PCM_RATE_KNOT
>       ALSA: hdspm: drop SNDRV_PCM_RATE_KNOT
>       ASoC: cs35l36: drop SNDRV_PCM_RATE_KNOT
>       ASoC: cs35l41: drop SNDRV_PCM_RATE_KNOT
>       ASoC: cs53l30: drop SNDRV_PCM_RATE_KNOT
>       ASoC: Intel: avs: drop SNDRV_PCM_RATE_KNOT
>       ASoC: qcom: q6asm-dai: drop SNDRV_PCM_RATE_KNOT
>       ASoC: sunxi: sun4i-codec: drop SNDRV_PCM_RATE_KNOT
>       ASoC: cs35l34: drop useless rate contraint
>       ASoC: spdif: extend supported rates to 768kHz

A nice cleanup series.
Applied all now to for-next branch.


Thanks!

Takashi
