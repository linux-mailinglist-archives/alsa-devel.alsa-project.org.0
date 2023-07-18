Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3678B757877
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 11:51:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 204EDAE8;
	Tue, 18 Jul 2023 11:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 204EDAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689673893;
	bh=EWJ9v+sqKYIETpZCVEyQynV2fPliMVWFdM2vzQcs+Pk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iKYrAICFMoFUt0YCF8qmmGIUrZHv9iXFto3ZbSHxkq7ndfQYyUUNYhgu2PayDBcRO
	 HX7WZRHYGwUuTVuBjVEOx0LeErCCvNj5l32a4XikanCQ5ynj7wHCG6P4aBHKfwA4ZU
	 NxfWY+wafisDd8fQTOOJDwu0iqUns0Z9On1/tUCM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A7FBF8032D; Tue, 18 Jul 2023 11:50:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01340F8027B;
	Tue, 18 Jul 2023 11:50:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00931F8032D; Tue, 18 Jul 2023 11:50:37 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F9F3F800D2;
	Tue, 18 Jul 2023 11:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F9F3F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=lnIDl0nc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=2PbfZtKF
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6AAD921910;
	Tue, 18 Jul 2023 09:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689673825;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7J1v+WSoILr6AH3Tx5jxu8P6Bp2lrhJAJ/ulrw+nlT8=;
	b=lnIDl0nc492/ylKgUuFVl24wXiOi785Yjna0OWnGPBruklJSogdUkT7FxVEZJhTR63ElS1
	Zph4BZCbu5OKG2ZcpwiYZudeCgPPHZarFIoOaXh0rlvHJ+w3VJnB+irCCJSc9FbRcoMrW7
	NxOARnzqj0QFn9uhscs17WRrKAndSgc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689673825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7J1v+WSoILr6AH3Tx5jxu8P6Bp2lrhJAJ/ulrw+nlT8=;
	b=2PbfZtKFd//uJXBwF4u2xh/SRmPoVQCyBq5dUHaTkR6xPesLiDV4VrqD6S1HVautTbgpUQ
	adZUu5r9VaoViIAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 16D0C134B0;
	Tue, 18 Jul 2023 09:50:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id d1OcA2FgtmRrbwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 09:50:25 +0000
Date: Tue, 18 Jul 2023 11:50:24 +0200
Message-ID: <87ilaho8f3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org,
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
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH 0/7] sound: Use -EPROBE_DEFER instead of i915 module
 loading.
In-Reply-To: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: RCZDG3TZZSU3MSUS7PBNLZRMLQKQVVW6
X-Message-ID-Hash: RCZDG3TZZSU3MSUS7PBNLZRMLQKQVVW6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCZDG3TZZSU3MSUS7PBNLZRMLQKQVVW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Jul 2023 10:45:15 +0200,
Maarten Lankhorst wrote:
> 
> Explicitly loading i915 becomes a problem when upstreaming the new intel driver
> for Tiger Lake and higher graphics (xe). By loading i915, it doesn't wait for
> driver load of xe, and will fail completely before it loads.
> 
> -EPROBE_DEFER has to be returned before any device is created in probe(),
> otherwise the removal of the device will cause EPROBE_DEFER to try again
> in an infinite loop.
> 
> The conversion is done in gradual steps. First I add an argument to
> snd_hdac_i915_init to allow for -EPROBE_DEFER so I can convert each driver
> separately. Then I convert each driver to move snd_hdac_i915_init out of the
> workqueue. Finally I drop the ability to choose modprobe behavior after the
> last user is converted.
> 
> I suspect the avs and skylake drivers used snd_hdac_i915_init purely for the
> modprobe, but I don't have the hardware to test if it can be safely removed.
> It can still be done easily in a followup patch to simplify probing.

Thanks for the patches.  I naively thought that issuing the component
binding at the early stage could be problematic, but in this case,
this doesn't look OK, since the all i915 stuff is bound always at the
HD-audio controller level, not at the codec level like others.

So, it's definitely worth to try.


Takashi

> Maarten Lankhorst (7):
>   ALSA: hda/i915: Add an allow_modprobe argument to snd_hdac_i915_init
>   ALSA: hda/i915: Allow xe as match for i915_component_master_match
>   ASoC: Intel: avs: Move snd_hdac_i915_init to before probe_work.
>   ASoC: Intel: Skylake: Move snd_hdac_i915_init to before probe_work.
>   ALSA: hda/intel: Move snd_hdac_i915_init to before probe_work.
>   ASoC: SOF: Intel: Remove deferred probe for SOF
>   ALSA: hda/i915: Remove extra argument from snd_hdac_i915_init
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-kernel@vger.kernel.org
> Cc: sound-open-firmware@alsa-project.org
> 
>  sound/hda/hdac_i915.c         | 15 +++------
>  sound/pci/hda/hda_intel.c     | 58 +++++++++++++++++++----------------
>  sound/soc/intel/avs/core.c    | 13 +++++---
>  sound/soc/intel/skylake/skl.c | 31 ++++++-------------
>  sound/soc/sof/Kconfig         | 19 ------------
>  sound/soc/sof/core.c          | 38 ++---------------------
>  sound/soc/sof/intel/Kconfig   |  1 -
>  sound/soc/sof/intel/hda.c     | 32 +++++++++++--------
>  sound/soc/sof/sof-pci-dev.c   |  3 +-
>  sound/soc/sof/sof-priv.h      |  5 ---
>  10 files changed, 75 insertions(+), 140 deletions(-)
> 
> -- 
> 2.39.2
> 
