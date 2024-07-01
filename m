Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8889391E1DD
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 16:08:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 828CC2390;
	Mon,  1 Jul 2024 16:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 828CC2390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719842890;
	bh=ZBAKGJAGSV+H/m3GHtG7ymiIUhr5IvN5TH2knK9pQeQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mznaR+iLSVwC21t127FsmvqdfdiBCJwryciauks6iPtZXURoOb9OSnqdntoF7aLZa
	 mNjxqQHMK6jr5M501F3zdUsZwskrkhg2azsa9JfK0TwYyQHNsNStRV39Y8A/eYU+AM
	 UIgRb+iXuz+6AVGvWKZCbibkmjMXWJNFtu+1fgk4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DC2FF805B0; Mon,  1 Jul 2024 16:07:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61901F805B0;
	Mon,  1 Jul 2024 16:07:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FE8BF8028B; Mon,  1 Jul 2024 16:07:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2FC8F800E4
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 16:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2FC8F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ypyVO43S;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jdz4wQxt;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ypyVO43S;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jdz4wQxt
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 860A821954;
	Mon,  1 Jul 2024 14:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719842841;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtlzkwrZIIJkT3HCBs0N620wqfDVAZr83yziKKaWSIw=;
	b=ypyVO43SuVxHKsVYL8+0ubJ1+z1a2UyQ8o/ttHeSuON0kDc7avDTiHiuMN1rJ8ERMd0K0H
	0d5Y79KIc2VKpHpAOrTBkWG39ZdQR2UmNI59k1t4c8e/XGloOCpQJcuVG7VRUFAAaBxOfA
	eIkMEm1n9sQpZo7XnAQsGdk6WrsskEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719842841;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtlzkwrZIIJkT3HCBs0N620wqfDVAZr83yziKKaWSIw=;
	b=jdz4wQxtr0hJaag6rzWLpiC53E17IuqslE959yaZ5XQB4cOftaoxCieQJ+jFxEQq6mNaRn
	dJ/4rgJoYaPMOKDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719842841;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtlzkwrZIIJkT3HCBs0N620wqfDVAZr83yziKKaWSIw=;
	b=ypyVO43SuVxHKsVYL8+0ubJ1+z1a2UyQ8o/ttHeSuON0kDc7avDTiHiuMN1rJ8ERMd0K0H
	0d5Y79KIc2VKpHpAOrTBkWG39ZdQR2UmNI59k1t4c8e/XGloOCpQJcuVG7VRUFAAaBxOfA
	eIkMEm1n9sQpZo7XnAQsGdk6WrsskEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719842841;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtlzkwrZIIJkT3HCBs0N620wqfDVAZr83yziKKaWSIw=;
	b=jdz4wQxtr0hJaag6rzWLpiC53E17IuqslE959yaZ5XQB4cOftaoxCieQJ+jFxEQq6mNaRn
	dJ/4rgJoYaPMOKDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40C5813800;
	Mon,  1 Jul 2024 14:07:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qokbDhm4gmZRaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 01 Jul 2024 14:07:21 +0000
Date: Mon, 01 Jul 2024 16:07:49 +0200
Message-ID: <874j99434a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ALSA: pcm: add support for 128kHz sample rate
In-Reply-To: <326792b9-e706-4ab0-a1e8-cc48943e357d@linux.intel.com>
References: <20240628122429.2018059-1-jbrunet@baylibre.com>
	<20240628122429.2018059-2-jbrunet@baylibre.com>
	<326792b9-e706-4ab0-a1e8-cc48943e357d@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,suse.com,perex.cz,alsa-project.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: MSSQCLD6NGMXBUJXGMLGJ5ZBLU7ZF3S2
X-Message-ID-Hash: MSSQCLD6NGMXBUJXGMLGJ5ZBLU7ZF3S2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MSSQCLD6NGMXBUJXGMLGJ5ZBLU7ZF3S2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Jul 2024 10:50:02 +0200,
Amadeusz S³awiñski wrote:
> 
> On 6/28/2024 2:23 PM, Jerome Brunet wrote:
> > The usual sample rate possible on an SPDIF link are
> > 32k, 44.1k, 48k, 88.2k, 96k, 172.4k and 192k.
> > 
> > With higher bandwidth variant, such as eARC, and the introduction of 8
> > channels mode, the spdif frame rate may be multiplied by 4. This happens
> > when the interface use an IEC958_SUBFRAME format.
> > 
> > The spdif 8 channel mode rate list is:
> > 128k, 176.4k, 192k, 352.8k, 384k, 705.4k and 768k.
> > 
> > All are already supported by ASLA expect for the 128kHz one.
> > Add support for it but do not insert it the SNDRV_PCM_RATE_8000_192000
> > macro. Doing so would silently add 128k support to a lot of HW which
> > probably do not support it.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> 
> From what I remember the recommendation is to not add new rates, but
> use SNDRV_PCM_RATE_KNOT for all rates not included already.

In general yes -- unless the new rate is used for significant amount
of drivers.

So this case is a sort of on a border line; if it's only for ASoC
SPDIF codec driver, I'd rather implement with an extra rate list
instead of extending the common bits (that has some potential risks by
breaking the existing numbers).  OTOH, if we can take this for further
cleanups of the existing requirement of 128khz rate, we can go with
it.


thanks,

Takashi
