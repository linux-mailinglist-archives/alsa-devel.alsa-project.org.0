Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37331758D6A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 08:05:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 082EAF0;
	Wed, 19 Jul 2023 08:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 082EAF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689746750;
	bh=k2HJCh+21yJtPbmW70H9LOJWiPuybfZ5y1AL/7vp3UI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J4ahjmo/G7c9bo9FzoK/9PwiINpoHYAnYiiQXYz2JVsMrkyk47TrfBb5cOl7S3Nid
	 J/OmNluqqBJQZr/DqjNGL9pDWKteoK3txfDuZ796cnhsVTZyZejzniJhhtDYzxdNdE
	 rFaz6mebqcnvGOQofPcDt/SxfTccaGK8b5mELLzA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83D3FF804DA; Wed, 19 Jul 2023 08:04:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 216D5F8032D;
	Wed, 19 Jul 2023 08:04:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8F28F8047D; Wed, 19 Jul 2023 08:01:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C72DF8007E;
	Wed, 19 Jul 2023 08:01:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C72DF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=h+0Ruqz2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=OngDeZ4S
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0918D218FE;
	Wed, 19 Jul 2023 06:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689746462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dgQgxlFcepDaInfoxrsHrXxt5AXoVTbhkF6IGVf5cpg=;
	b=h+0Ruqz2CalI1XiDmKNvlyGndFSw7ERXP+PZjYhItCW7Wa8qHRlYAyS+ImQm6rKrLeis8T
	7Qs1ZGhvKdfO801WdT2Wa4eWTt2q1LoAFabYJnIOz5qXgTySXpm71BOtQoxv0TQg1lDKfb
	2hanErmJryg7pAGehHTL75Q4sLrVXJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689746462;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dgQgxlFcepDaInfoxrsHrXxt5AXoVTbhkF6IGVf5cpg=;
	b=OngDeZ4SaqRjusrxyHy6gBD4FR6gZjmfsTpJ87Z+foKyZS0MV5RgCVILNvMK/W4hD76mOR
	zHOm9Lfjp21/A+DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A311C1361C;
	Wed, 19 Jul 2023 06:01:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eALPJh18t2TXMgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 19 Jul 2023 06:01:01 +0000
Date: Wed, 19 Jul 2023 08:01:00 +0200
Message-ID: <874jm0modf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Alsa-devel <alsa-devel@alsa-project.org>,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 6/7] ASoC: SOF: Intel: Remove deferred probe for SOF
In-Reply-To: 
 <alpine.DEB.2.22.394.2307181922160.3532114@eliteleevi.tm.intel.com>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
	<20230718084522.116952-7-maarten.lankhorst@linux.intel.com>
	<alpine.DEB.2.22.394.2307181922160.3532114@eliteleevi.tm.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: PDLZONL7D4436VZFU7NYHHNGSL2SIPKD
X-Message-ID-Hash: PDLZONL7D4436VZFU7NYHHNGSL2SIPKD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PDLZONL7D4436VZFU7NYHHNGSL2SIPKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Jul 2023 19:04:41 +0200,
Kai Vehmanen wrote:
> 
> > diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
> > index f1fd5b44aaac9..344b61576c0e3 100644
> > --- a/sound/soc/sof/intel/hda-codec.c
> > +++ b/sound/soc/sof/intel/hda-codec.c
> > @@ -415,7 +415,7 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
> >  		return 0;
> >  
> >  	/* i915 exposes a HDA codec for HDMI audio */
> > -	ret = snd_hdac_i915_init(bus, true);
> > +	ret = snd_hdac_i915_init(bus, false);
> >  	if (ret < 0)
> >  		return ret;
> 
> My only bigger concern is corner cases where the display PCI device is on 
> the bus and visible to kernel, but for some reason there is no working 
> driver in the system or it is disabled.
> 
> With this patch, not having a workign display driver means that there is 
> also no audio in the system as the SOF driver will never get probed.
> 
> In current mainline, one will get the 60sec timeout warning and then
> audio driver will proceed to probe and you'll have audio support (minus 
> HDMI/DP).

Yeah, that was a concern in the past, too.  e.g. when you pass
"nomodeset" boot option, the driver will become unusable, even if the
bus is used generically for both analog and HDMI codecs.

> This is mostly an issue with very new hardware (e.g. hw is still 
> behind force_probe flag in xe/i915 driver), but we've had some odd
> cases with e.g. systems with both Intel IGFX and other vendors' DGPU. 
> Audio drivers see the Intel VGA controller in system and will
> call snd_hdac_i915_init(), but the audio component bind will never
> succeed if the the Intel IGFX is not in actual use.
> 
> Will need a bit of time to think about possible scenarios. Possibly this 
> is not an issue outside early development systems. In theory if IGFX is 
> disabled in BIOS, and not visible to OS, we are good, and if it's visible, 
> the i915/xe driver should be loaded, so we are good again.

The 60 seconds timeout is a thing "better than complete disablement",
so it's not ideal, either.  Maybe we can add something like the
following:

- Check when the deferred probe takes too long, and warn it
- Provide some runtime option to disable the component binding, so
  that user can work around it if needed


thanks,

Takashi
