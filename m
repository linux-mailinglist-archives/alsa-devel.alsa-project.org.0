Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0DD7DC7E6
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 09:10:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20F07A4B;
	Tue, 31 Oct 2023 09:09:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20F07A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698739841;
	bh=It9hRsKk8BI+iwOvCMFCj9pEOsxAMirmqnEgUE2ihJg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B8e3VwBitgo5QxcQoai590+BYjfbcevUSRzphBA9A/ilTs2MEKdSs0TIYYDu1uX2f
	 jtrnshdHJYbasQ9i91ZkGsOlXWNEWetFqoqONfPmjSRINLeZdre1a2paQEijimlC4o
	 OeCsbs+tc7NhvrCAey94dkRpkaqIpPBqmu74oWvc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09B93F8020D; Tue, 31 Oct 2023 09:09:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48D4FF8016D;
	Tue, 31 Oct 2023 09:09:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5E7FF8020D; Tue, 31 Oct 2023 09:07:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42F1FF80166
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 09:07:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F1FF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=mmDqo67t;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uDHlhELu
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9CC04212AE;
	Tue, 31 Oct 2023 08:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1698739664;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1riz8bQeeXcvoXNgHyHNziY5KOCRb8jrTCklE5GZ+tw=;
	b=mmDqo67t/Bz7m7dT2kTGng+H9/07qlxxJPQKLqc85yoxe+UkCBppy9zL4gNABnM3lIbytn
	OiwTNJIaC04tIMrtFhMxT334fq+fsD/TF0xyoxDDo6V2FORNiG2X8pOufuX+A4h9qK5Ift
	0fHcrak+j7cNddb1/NcmjAW1kExL5u4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698739664;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1riz8bQeeXcvoXNgHyHNziY5KOCRb8jrTCklE5GZ+tw=;
	b=uDHlhELuUaZkPgdStI0HajsAo5X75Art+8K6rif0DRHqkaPIWC3ubWWkGKxMQRORTDdZKV
	0ogKidt4UsctkgBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 603391391B;
	Tue, 31 Oct 2023 08:07:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id /a5mFtC1QGWfNAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 31 Oct 2023 08:07:44 +0000
Date: Tue, 31 Oct 2023 09:07:43 +0100
Message-ID: <87bkcfw6y8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Brady Norander <bradynorander@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2] ALSA: hda: intel-dsp-cfg: Use AVS driver on
 SKL/KBL/APL Chromebooks
In-Reply-To: <2f5ffc3b-01be-413d-843e-8654d953f56f@gmail.com>
References: <2f5ffc3b-01be-413d-843e-8654d953f56f@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: K4AWBFW6X6KJWHCDIE6K2MXFDSGN6IAQ
X-Message-ID-Hash: K4AWBFW6X6KJWHCDIE6K2MXFDSGN6IAQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K4AWBFW6X6KJWHCDIE6K2MXFDSGN6IAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 30 Oct 2023 19:58:52 +0100,
Brady Norander wrote:
> 
> The legacy SKL driver no longer works properly on these Chromebook
> platforms. Use the new AVS driver by default instead.
> 
> Signed-off-by: Brady Norander <bradynorander@gmail.com>

It's fine to switch to the new and more maintained AVS (once after the
topology is ready), but I wonder how the breakage of SKL happened.
Was it our intentional breakage in the past?  If so, why can't we
recover it?


thanks,

Takashi

> ---
> v2: Only use quirk if AVS is enabled
>  sound/hda/intel-dsp-config.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
> index 756fa0aa69bb..e056aca01900 100644
> --- a/sound/hda/intel-dsp-config.c
> +++ b/sound/hda/intel-dsp-config.c
> @@ -16,10 +16,11 @@
>  static int dsp_driver;
> 
>  module_param(dsp_driver, int, 0444);
> -MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP
> (0=auto, 1=legacy, 2=SST, 3=SOF)");
> +MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP
> (0=auto, 1=legacy, 2=SST, 3=SOF, 4=AVS)");
> 
>  #define FLAG_SST			BIT(0)
>  #define FLAG_SOF			BIT(1)
> +#define FLAG_AVS			BIT(2)
>  #define FLAG_SST_ONLY_IF_DMIC		BIT(15)
>  #define FLAG_SOF_ONLY_IF_DMIC		BIT(16)
>  #define FLAG_SOF_ONLY_IF_SOUNDWIRE	BIT(17)
> @@ -56,7 +57,7 @@ static const struct config_entry config_table[] = {
>  /*
>   * Apollolake (Broxton-P)
>   * the legacy HDAudio driver is used except on Up Squared (SOF) and
> - * Chromebooks (SST), as well as devices based on the ES8336 codec
> + * Chromebooks (AVS), as well as devices based on the ES8336 codec
>   */
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
>  	{
> @@ -79,9 +80,9 @@ static const struct config_entry config_table[] = {
>  		.codec_hid =  &essx_83x6,
>  	},
>  #endif
> -#if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
> +#if IS_ENABLED(CONFIG_SND_SOC_INTEL_AVS)
>  	{
> -		.flags = FLAG_SST,
> +		.flags = FLAG_AVS,
>  		.device = PCI_DEVICE_ID_INTEL_HDA_APL,
>  		.dmi_table = (const struct dmi_system_id []) {
>  			{
> @@ -96,13 +97,13 @@ static const struct config_entry config_table[] = {
>  #endif
>  /*
>   * Skylake and Kabylake use legacy HDAudio driver except for Google
> - * Chromebooks (SST)
> + * Chromebooks (AVS)
>   */
> 
>  /* Sunrise Point-LP */
> -#if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
> +#if IS_ENABLED(CONFIG_SND_SOC_INTEL_AVS)
>  	{
> -		.flags = FLAG_SST,
> +		.flags = FLAG_AVS,
>  		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
>  		.dmi_table = (const struct dmi_system_id []) {
>  			{
> @@ -114,15 +115,17 @@ static const struct config_entry config_table[] = {
>  			{}
>  		}
>  	},
> +#endif
> +#if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
>  	{
>  		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
>  		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
>  	},
>  #endif
>  /* Kabylake-LP */
> -#if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
> +#if IS_ENABLED(CONFIG_SND_SOC_INTEL_AVS)
>  	{
> -		.flags = FLAG_SST,
> +		.flags = FLAG_AVS,
>  		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
>  		.dmi_table = (const struct dmi_system_id []) {
>  			{
> @@ -134,6 +137,8 @@ static const struct config_entry config_table[] = {
>  			{}
>  		}
>  	},
> +#endif
> +#if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
>  	{
>  		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
>  		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
> @@ -667,6 +672,9 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
>  		}
>  	}
> 
> +	if (cfg->flags & FLAG_AVS)
> +		return SND_INTEL_DSP_DRIVER_AVS;
> +
>  	return SND_INTEL_DSP_DRIVER_LEGACY;
>  }
>  EXPORT_SYMBOL_GPL(snd_intel_dsp_driver_probe);
> -- 
> 2.42.0
> 
