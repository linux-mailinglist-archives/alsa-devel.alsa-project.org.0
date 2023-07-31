Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E312D769B77
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:55:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5607DF2;
	Mon, 31 Jul 2023 17:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5607DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818943;
	bh=ueceRC8emkG4kPVnpSpTSaxXlJmbVu7DzzHm5DQT3yA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q8gCpFotWDmEECocoyRsrut2ofRblxHUlgsPWfjWQAjM+N4OWrXKXwP6R30E340LP
	 8iEen6wF3sm09/tfbBdjzRS0hVU9A4G38Ve3+qgKY9UeH0hSH5wnyCw3b+2ITuSK31
	 vMbbiH0XNDDdLsNSbQNRFUc8RAJHST0ujEQDQT7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFC0DF8057A; Mon, 31 Jul 2023 17:52:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82451F80557;
	Mon, 31 Jul 2023 17:52:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA10EF8055B; Mon, 31 Jul 2023 17:52:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C6A54F80153;
	Mon, 31 Jul 2023 17:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6A54F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rCaCGA62;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5TUHmTvG
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A68FC221BF;
	Mon, 31 Jul 2023 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2u0dLn7hjxy/youRd5pKqbthQhRipuIEteybjBKpN4E=;
	b=rCaCGA62SE/QwvolETdgLfypTGMcJovoyoslABstBWyEUmBEvGP18X+VhPVlPgrHJu4um/
	zAcRBAZypKa8zzZOhSuXw5J3z0LO6d48L3GpK0De3Q5lO/k/PwwmdHeHOkyPFGBMixhD6F
	aZIDmE8hVbkWvS1EEbIPBu04oH9EBC8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2u0dLn7hjxy/youRd5pKqbthQhRipuIEteybjBKpN4E=;
	b=5TUHmTvGfr9XRNykMv51Iya5erMQ673fMYetRY8lG+u3mmaBSMW3Ur/MCvpeyP86sMUQly
	vZjayjD7xdF7WODA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BEC651322C;
	Mon, 31 Jul 2023 15:51:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id RgGHLZ3Yx2TqAgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:51:57 +0000
Date: Mon, 31 Jul 2023 17:51:57 +0200
Message-ID: <87r0oohyea.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v2 0/9] sound: Use -EPROBE_DEFER instead of i915 module
 loading.
In-Reply-To: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: QEWY6IS3XNOBUJSSWK6ZM3CV35SEO24G
X-Message-ID-Hash: QEWY6IS3XNOBUJSSWK6ZM3CV35SEO24G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QEWY6IS3XNOBUJSSWK6ZM3CV35SEO24G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Jul 2023 18:41:32 +0200,
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
> 
> ---
> New since first version:
> 
> - snd_hda_core.gpu_bind is added as a mechanism to force gpu binding,
>   for testing. snd_hda_core.gpu_bind=0 forces waiting for GPU bind to
>   off, snd_hda_core.gpu_bind=1 forces waiting for gpu bind. Default
>   setting depends on whether kernel booted with nomodeset.
> - Incorporated all feedback review.

Maarten, are you working on v3 patch set?
Or, for moving forward, should we merge v2 now and fix the rest based
on that later?


thanks,

Takashi
