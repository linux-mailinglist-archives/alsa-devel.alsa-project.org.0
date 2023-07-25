Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCFE761109
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 12:38:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8C1C14F3;
	Tue, 25 Jul 2023 12:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8C1C14F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690281501;
	bh=USO4V+iNRnmmNuqolBRuL0e2I+Iywlj9/mDrFioxTrY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EfSGcwfNLnPdP+zi7GzALqRqzzVZY/IbFRNa3BFFNzG7Tz+9McvwdjDskz/wH7o3V
	 wb5ZYO9gnbEfNSKUxzN/5KEcMI+s8dkmvBGcrkj6okZh5DgLmRcbVOLOhahjK2KnFU
	 YKB7ozFbq8ooZJU+jOS1S7phNUZ7C7PNugOU91h0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 190D5F80310; Tue, 25 Jul 2023 12:37:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDA64F80163;
	Tue, 25 Jul 2023 12:37:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE7B1F8019B; Tue, 25 Jul 2023 12:37:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 779C3F80153;
	Tue, 25 Jul 2023 12:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 779C3F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Anmy3eLg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Q7mJIHYE
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D808C2233B;
	Tue, 25 Jul 2023 10:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690281440;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3I1WKvqsunGpCu04gF1CzawY3Z1Ke8IscFjJf/ki7zs=;
	b=Anmy3eLgFHbKBj2cjMNNdQbkHBEvMJcRnucHgh4tsabGpnMaq1ZeAH2r3zxZXgnqObU9wG
	2KRrapITI96kHiufdxBnQfcn/Ukvib4qaMIyIshLQ0KUEI/05637FsFZH1SZsCiQ5eHMQS
	3OhgFJA8HBZYVWnYvfenh8YTG3pb6W8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690281440;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3I1WKvqsunGpCu04gF1CzawY3Z1Ke8IscFjJf/ki7zs=;
	b=Q7mJIHYEFRyDNOXBZljgdkx0YOncHEupc9cS+pA92vzRmqozTWVVNoKbjOgEH1s3G0IiS1
	NGLaY1Gofub74vBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7F7EF13342;
	Tue, 25 Jul 2023 10:37:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id D7/LHeClv2SGAQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 25 Jul 2023 10:37:20 +0000
Date: Tue, 25 Jul 2023 12:37:20 +0200
Message-ID: <87ila8tgyn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown
 <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 8/9] ASoC: SOF: Intel: Remove deferred probe for SOF
In-Reply-To: <1bb7858d-fab0-f3c2-b786-a93f3789b400@linux.intel.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
	<20230719164141.228073-9-maarten.lankhorst@linux.intel.com>
	<03d5abcd-53a6-bf61-227e-d608c5fbfe70@linux.intel.com>
	<1bb7858d-fab0-f3c2-b786-a93f3789b400@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YN3C7X6EPZKQAYFGRH6MCVABZ6YT3DSJ
X-Message-ID-Hash: YN3C7X6EPZKQAYFGRH6MCVABZ6YT3DSJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YN3C7X6EPZKQAYFGRH6MCVABZ6YT3DSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jul 2023 12:29:07 +0200,
Maarten Lankhorst wrote:
> 
> Hey,
> 
> On 2023-07-24 13:32, Pierre-Louis Bossart wrote:
> > 
> > 
> > On 7/19/23 18:41, Maarten Lankhorst wrote:
> >> This was only used to allow modprobing i915, by converting to the
> >> -EPROBE_DEFER mechanism, it can be completely removed, and is in
> >> fact counterproductive since -EPROBE_DEFER otherwise won't be
> >> handled correctly.
> > 
> > I personally remember only that the request_module("i915") was the main
> > motivation for the use of the workqueue, but when it comes to the
> > HDaudio codec management we don't even know what we don't know.
> > 
> > I am a bit worried that the snd-hda-intel driver keeps the workqueue for
> > HDaudio codec initialization, and this patch removes the workqueue
> > completely for SOF. That doesn't seem right. Either both drivers need a
> > workqueue or none need a workqueue.
> > 
> > Maybe what we need is to move the i915/xe initialization out of the
> > workqueue, and see in a second pass if that workqueue can be safely
> > removed from the SOF driver?
> > 
> As I mentioned in some of the other sound driver conversions. I
> believe it's possible to completely kill off most workqueues.
> 
> However, I don´t have the hardware or knowledge to test it. I saw
> that the SOF had the non-workqueue path already, so it felt less risky
> to simply convert it to always use that path.
> 
> avs/skylake drivers should be easy to convert too. This is why I left
> the comment: "Removing the workqueue would simplify init even further,
> but is left as exercise for the reviewer."
> 
> HDA-intel has this retry-probe logic used on AMD's,
> which makes me more hesitant to convert it.

Yes, HDA-Intel requires either a workqueue or async firmware-loader
callback because there is some codec module-autoload mechanism that
may happen during the probe phase.  It's not only on AMD, but it's
required in general for all codecs.


Takashi
