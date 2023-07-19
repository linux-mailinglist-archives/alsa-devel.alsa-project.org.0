Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD53F7595E2
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 14:48:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B6AA1F7;
	Wed, 19 Jul 2023 14:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B6AA1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689770926;
	bh=eULpCTANuOwXdcm8NRzZzI00PPYK0V9rPMvU55WagdM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=elSyFHgp2JZ2TOVdg/9iN2QWZWSIm3hqXbct4WBdxc4i3DMXmX1beAOwRl8q6qO86
	 SP50bJJucA5VigJzUOS28Xei5ueYPGQULYPA+vkgwALyDsXSkzmhFlFhWsqTa/ToLz
	 VUEqf1T6qUcqINJsZEoZd5fM2iBOLkyzymKs66TQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 896B6F800D2; Wed, 19 Jul 2023 14:47:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F107F8032D;
	Wed, 19 Jul 2023 14:47:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F9B9F8047D; Wed, 19 Jul 2023 14:47:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B7B9DF80153;
	Wed, 19 Jul 2023 14:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7B9DF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1aKSfbgn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Ov/01hsT
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B731F1FF13;
	Wed, 19 Jul 2023 12:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689770864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kxETokD9SAc/wRhOVt8MvBPZMGFuOcbQTtb5gLkVU78=;
	b=1aKSfbgn2PvswS2cwrPQIVjoUw4GqWZswnTB1uZtTDGT1ZQqXfBd22iKJ8Va/dV5Dfx9CL
	RY+5IRBgau/GJ0d0VvM2Za/biKliJ46PMbzbesIxY3hYKnK6DdLxXAa11iQvrZmbtdZcW1
	jGdnaZJfhU6Hnl+9lr8FO35n9FQkZKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689770864;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kxETokD9SAc/wRhOVt8MvBPZMGFuOcbQTtb5gLkVU78=;
	b=Ov/01hsT/NEJyHEdy7OhhqmQhtaQFxa+O3GW/ggQ+MryZOe8HiEwslYkGrDMPjhnnOsL2b
	ed085g26KkbFviAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9614D13460;
	Wed, 19 Jul 2023 12:47:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EvgaJHDbt2SmEAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 19 Jul 2023 12:47:44 +0000
Date: Wed, 19 Jul 2023 14:47:44 +0200
Message-ID: <87edl4f4pb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
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
Subject: Re: [PATCH] ASoC: SOF: Intel: Remove deferred probe for SOF
In-Reply-To: <2ed288d0-c8fe-1856-dbe9-74f4f7c075ba@linux.intel.com>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
	<20230718084522.116952-7-maarten.lankhorst@linux.intel.com>
	<alpine.DEB.2.22.394.2307181922160.3532114@eliteleevi.tm.intel.com>
	<874jm0modf.wl-tiwai@suse.de>
	<66d22637-069f-5262-2249-6041ef9d4614@linux.intel.com>
	<875y6g5feo.wl-tiwai@suse.de>
	<2ed288d0-c8fe-1856-dbe9-74f4f7c075ba@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: OKKRWO23D7CX2WM4LTNZU3M7567L5D7O
X-Message-ID-Hash: OKKRWO23D7CX2WM4LTNZU3M7567L5D7O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OKKRWO23D7CX2WM4LTNZU3M7567L5D7O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Jul 2023 14:13:59 +0200,
Maarten Lankhorst wrote:
> 
> 
> On 2023-07-19 13:06, Takashi Iwai wrote:
> > On Wed, 19 Jul 2023 11:48:06 +0200,
> > Maarten Lankhorst wrote:
> >> 
> >>      The 60 seconds timeout is a thing "better than complete disablement",
> >>      so it's not ideal, either.  Maybe we can add something like the
> >>      following:
> >>           - Check when the deferred probe takes too long, and warn
> >> it
> >>      - Provide some runtime option to disable the component binding, so
> >>        that user can work around it if needed
> >>      A module option to snd_hdac_i915_init would probably be the
> >> least of all evils
> >> here.
> > 
> > Yes, probably it's the easiest option and sufficient.
> > 
> > 
> > thanks,
> > 
> > Takashi
> Hey,
> 
> Patch below, can be applied immediately iresspective of the other patches.
> 
> ---->8----------
> 
> Selecting CONFIG_DRM selects CONFIG_VIDEO_NOMODESET, which exports
> video_firmware_drivers_only(). This can be used as a first
> approximation
> on whether i915 will be available. It's safe to use as this is only
> built when CONFIG_SND_HDA_I915 is selected by CONFIG_I915.
> 
> It's not completely fool proof, as you can boot with "nomodeset
> i915.modeset=1" to make i915 load regardless, or use
> "i915.force_probe=!*" to never load i915, but the common case of booting
> with nomodeset to disable all GPU drivers this will work as intended.

The check of video_firmware_drivers_only() may help a bit, but I
believe we still need an option to override the behavior, from the
same reason as why i915.modeset option behaves so.  In general,
nomodeset is for a debugging purpose, and without an option, you'll
have no way to re-enable the HD-audio even if you could reload the
graphics driver.


thanks,

Takashi

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
> index 1637dc6e630a6..90bcf84f7b2ce 100644
> --- a/sound/hda/hdac_i915.c
> +++ b/sound/hda/hdac_i915.c
> @@ -11,6 +11,8 @@
>  #include <sound/hda_i915.h>
>  #include <sound/hda_register.h>
> 
> +#include <video/nomodeset.h>
> +
>  #define IS_HSW_CONTROLLER(pci) (((pci)->device == 0x0a0c) || \
>  				((pci)->device == 0x0c0c) || \
>  				((pci)->device == 0x0d0c) || \
> @@ -122,6 +124,9 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
>  {
>  	struct pci_dev *display_dev = NULL;
> 
> +	if (video_firmware_drivers_only())
> +		return false;
> +
>  	for_each_pci_dev(display_dev) {
>  		if (display_dev->vendor == PCI_VENDOR_ID_INTEL &&
>  		    (display_dev->class >> 16) == PCI_BASE_CLASS_DISPLAY &&
> 
