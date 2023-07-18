Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D00F67578AC
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 11:59:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2895BDEB;
	Tue, 18 Jul 2023 11:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2895BDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689674358;
	bh=ObG8jP/TF2HZIFyl7F2jfjT3Sd1V3WGNF8C2tPJoqFQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EZOuQmhoIKVTUOeeTRoSZgP12SyGIItXi1rC3pPrSaF6H+L0vsRJGSJttlQho1/xZ
	 T1Q2PUinGI3ndeJop066DBf/fko/HtHx+RAftVBHFWc4b/qDyNwnV2GU9rZXof4J0G
	 Fkn0ud0yenbqr+CFizy6yfgDtlqzxFmOOmlMy748=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2190CF8053B; Tue, 18 Jul 2023 11:58:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 383A6F8027B;
	Tue, 18 Jul 2023 11:58:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F062F8032D; Tue, 18 Jul 2023 11:58:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8F1EF800D2;
	Tue, 18 Jul 2023 11:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8F1EF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Zog+VIVW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=syDuMOgO
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 55FAE1F461;
	Tue, 18 Jul 2023 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689674275;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lwIxpcfnyfN+KZS/1z2ZFiDuJVrbeqjicTOWKPtxSG0=;
	b=Zog+VIVWq11HVDTBNsOYrxvvKRdCA8JWasflPIKt3qpnx6IrhjnR+9Wzfm4+3q9bn3rIQX
	PnTPWKf/qfPWBlOY13CX103A5wTR8IgYvKj9m1EMVqCaUPTVFQo99xH9Sn7FY5+LzoQFGK
	X+KETTWAWdfyQ7pIym92oHjr1YlFoHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689674275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lwIxpcfnyfN+KZS/1z2ZFiDuJVrbeqjicTOWKPtxSG0=;
	b=syDuMOgOIwBZCCOsED6KHN1Zknk1kspsD4yZpBAYUa4WndhNcKfD0tQ+9fd/ymSZFV2wdO
	IMF7eSlodqIsMTDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06E0D134B0;
	Tue, 18 Jul 2023 09:57:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wTeiACNitmQzcwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 09:57:55 +0000
Date: Tue, 18 Jul 2023 11:57:54 +0200
Message-ID: <87h6q1o82l.wl-tiwai@suse.de>
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
Subject: Re: [PATCH 5/7] ALSA: hda/intel: Move snd_hdac_i915_init to before
 probe_work.
In-Reply-To: <20230718084522.116952-6-maarten.lankhorst@linux.intel.com>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
	<20230718084522.116952-6-maarten.lankhorst@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: V7LM4SKPE6VRHUXBI5RLIXEULD4T3AAN
X-Message-ID-Hash: V7LM4SKPE6VRHUXBI5RLIXEULD4T3AAN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V7LM4SKPE6VRHUXBI5RLIXEULD4T3AAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Jul 2023 10:45:20 +0200,
Maarten Lankhorst wrote:
> 
> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> the snd_hdac_i915_init into a workqueue.
> 
> Use the -EPROBE_DEFER mechanism instead, which must be returned in the
> probe function.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  sound/pci/hda/hda_intel.c | 58 +++++++++++++++++++++------------------
>  1 file changed, 31 insertions(+), 27 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 5af1138e745bc..d40345a0088d8 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -213,6 +213,7 @@ MODULE_DESCRIPTION("Intel HDA driver");
>  #endif
>  #endif
>  
> +static DECLARE_BITMAP(probed_devs, SNDRV_CARDS);
>  
>  /*
>   */
> @@ -2094,8 +2095,6 @@ static const struct hda_controller_ops pci_hda_ops = {
>  	.position_check = azx_position_check,
>  };
>  
> -static DECLARE_BITMAP(probed_devs, SNDRV_CARDS);
> -
>  static int azx_probe(struct pci_dev *pci,
>  		     const struct pci_device_id *pci_id)
>  {

Any specific reason to move the definition?  Otherwise let's
concentrate on the needed change.

> @@ -2174,7 +2173,36 @@ static int azx_probe(struct pci_dev *pci,
>  	}
>  #endif /* CONFIG_SND_HDA_PATCH_LOADER */
>  
> -#ifndef CONFIG_SND_HDA_I915
> +#ifdef CONFIG_SND_HDA_I915
> +	/* bind with i915 if needed */
> +	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
> +		err = snd_hdac_i915_init(azx_bus(chip), false);
> +		if (err < 0) {
> +			/* if the controller is bound only with HDMI/DP
> +			 * (for HSW and BDW), we need to abort the probe;
> +			 * for other chips, still continue probing as other
> +			 * codecs can be on the same link.
> +			 */
> +			if (CONTROLLER_IN_GPU(pci)) {
> +				if (err != -EPROBE_DEFER)
> +					dev_err(card->dev,
> +						"HSW/BDW HD-audio HDMI/DP requires binding with gfx driver\n");
> +
> +				clear_bit(chip->dev_index, probed_devs);
> +				pci_set_drvdata(pci, NULL);
> +				snd_device_free(card, chip);
> +				return err;

This may leak resources, I'm afraid.

Here you just need to "goto out_free;" instead of manual resource
releases, which eventually calls snd_card_free(), and that's all.

(Though, pci_set_drvdata(pci, NULL) might be still missing; but it's
 not only for this change, and we'll need to address it in another
 patch.)


thanks,

Takashi
