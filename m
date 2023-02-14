Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6446971B0
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 00:18:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C7C5847;
	Wed, 15 Feb 2023 00:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C7C5847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676416737;
	bh=+Ktame/4jtPvnb9sYOBz6qPC5/cHYroMmf7jNzrpg20=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W2NdqQZr6R9dp1UFwQENCS9Y++6QB2WBakvfTJp0WhC6QG+6Lj+GquW2lStIWoPM3
	 w+v7w0bVN82j8RAHF7j95QsjzTzNtXuqVIv/JYGdObDMvEi7TTDwZCUvZoNQPDsIhc
	 zgiOcedq4cMiFC4NVktfbF4z+Uay2IlBF94h6MkM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4B80F801C0;
	Wed, 15 Feb 2023 00:18:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F4130F8047C; Wed, 15 Feb 2023 00:18:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47D21F800B6
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 00:17:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47D21F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=TeS+oJxQ
Received: by mail-pl1-x62a.google.com with SMTP id v23so18614061plo.1
        for <alsa-devel@alsa-project.org>;
 Tue, 14 Feb 2023 15:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZAEgb/wrQf0JqjYwGZMCJQPLxnItvPPQlo4EcC0kp14=;
        b=TeS+oJxQkxbRV1Y3bEgv6HbmAvHXBu3poohlt5jJGxvJIHFavbBJ2hLU5Y4ULf9/qF
         NfZ3T0OdskBakOnk7lTg+2sesPDAqDYti9fmci3Bnr74MPBWFuu/mO5iH3ucn9hYdmv7
         Aqm1X3KYrJf2I7sx8vRg5Rm3A6989NUVJ48IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAEgb/wrQf0JqjYwGZMCJQPLxnItvPPQlo4EcC0kp14=;
        b=dK4d/jktBO1ZQYDzNCL0EGzTYQtp1r/k+jzPy9R7hoddii9COdvyS+40xGs0iHi8sn
         8l3NoL+lgsXTnMWDet7sXaGGlGZLR4vCyb+p5j3q3aE8PTdJKzoz8NE6+NuxRNzzAuAF
         /FDM1j5PUxD52q1p/UkBLIhmIpP6mGHhkX6lXhB9pXRCzNg9ele2v5YpmrOJphH2lhKc
         CwEJ8dxdJflDMy1wpdoIveTcexLroutc/Ao+jh7FZD3prx238wnPFyX3E2sTz3KcbjsQ
         u0bteUTqY8L51m8rlGZHlfFutNBWa5wEyk7zq3qZxJdthjJ/QendOlmUNFuERyZznrhZ
         aKsw==
X-Gm-Message-State: AO0yUKUirdqRNS/sACO7czyHiNfJ9AWqDonxEduj6OUEWzm6nHqhM6XQ
	svVuRAt+ECwfM8w+64jBiOXBYwGoShn135fs
X-Google-Smtp-Source: 
 AK7set/ZlLNyRW8lVh9dgUhGFb9Uhnsy31JsVZn6aHO3Q7YzFjCjOdzVJNwtg41nLg48EvfoQGk3GA==
X-Received: by 2002:a05:6a20:160a:b0:bf:8a97:6e48 with SMTP id
 l10-20020a056a20160a00b000bf8a976e48mr4713196pzj.37.1676416670201;
        Tue, 14 Feb 2023 15:17:50 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 19-20020aa79213000000b00576259507c0sm10336057pfo.100.2023.02.14.15.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 15:17:49 -0800 (PST)
Message-ID: <63ec169d.a70a0220.ed5ca.3d7d@mx.google.com>
X-Google-Original-Message-ID: <202302141514.@keescook>
Date: Tue, 14 Feb 2023 15:17:48 -0800
From: Kees Cook <keescook@chromium.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: Fix struct definition
References: <20230213205223.2679357-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230213205223.2679357-1-amadeuszx.slawinski@linux.intel.com>
Message-ID-Hash: 4GGY6R7CYXZ5QWQ7A4TX6DE7V5WZMLMA
X-Message-ID-Hash: 4GGY6R7CYXZ5QWQ7A4TX6DE7V5WZMLMA
X-MailFrom: keescook@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Sasa Ostrouska <casaxa@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GGY6R7CYXZ5QWQ7A4TX6DE7V5WZMLMA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Feb 13, 2023 at 09:52:23PM +0100, Amadeusz Sławiński wrote:
> The kernel is globally removing the ambiguous 0-length and 1-element
> arrays in favor of flexible arrays, so that we can gain both compile-time
> and run-time array bounds checking[1]. In this instance, struct
> skl_cpr_cfg contains struct skl_cpr_gtw_cfg, which defined "config_data"
> as a 1-element array.
> 
> However, case present in sound/soc/intel/skylake/skl-topology.h is not a
> simple one as the structure takes part in IPC communication. Apparently
> original definition missed one field, which while not used by AudioDSP
> firmware when there is no additional data, is still expected to be part
> of an IPC message. Currently this works because of how 'config_data' is
> declared: 'config_data[1]'. Now when one replaces it with a flexible
> array there would be one field missing. Update struct declaration to fix
> this.
> 
> Reported-by: Sasa Ostrouska <casaxa@gmail.com>
> Link: https://lore.kernel.org/all/CALFERdwvq5day_sbDfiUsMSZCQu9HG8-SBpOZDNPeMdZGog6XA@mail.gmail.com/
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: alsa-devel@alsa-project.org
> CC: Kees Cook <keescook@chromium.org>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/soc/intel/skylake/skl-messages.c | 2 +-
>  sound/soc/intel/skylake/skl-topology.h | 5 ++++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
> index 5ab0917a2b3d..d31509298a0a 100644
> --- a/sound/soc/intel/skylake/skl-messages.c
> +++ b/sound/soc/intel/skylake/skl-messages.c
> @@ -549,7 +549,7 @@ static void skl_copy_copier_caps(struct skl_module_cfg *mconfig,
>  	if (mconfig->formats_config[SKL_PARAM_INIT].caps_size == 0)
>  		return;
>  
> -	memcpy(cpr_mconfig->gtw_cfg.config_data,
> +	memcpy(&cpr_mconfig->gtw_cfg.config_data,

Unfortunately, this is going to run afoul of a compiler bug. :( GCC is
still working on getting it fixed (and Clang will follow). But for now,
this will just result in a run-time warning instead, since memcpy won't
be able to "see through" the fact that "config_data" ends with a
flexible array, meaning it will think it has a 4 byte size:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101832

>  			mconfig->formats_config[SKL_PARAM_INIT].caps,
>  			mconfig->formats_config[SKL_PARAM_INIT].caps_size);
>  
> diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
> index 6db0fd7bad49..30a0977af943 100644
> --- a/sound/soc/intel/skylake/skl-topology.h
> +++ b/sound/soc/intel/skylake/skl-topology.h
> @@ -115,7 +115,10 @@ struct skl_cpr_gtw_cfg {
>  	u32 dma_buffer_size;
>  	u32 config_length;
>  	/* not mandatory; required only for DMIC/I2S */
> -	u32 config_data[1];
> +	struct {
> +		u32 gtw_attrs;
> +		u32 data[];
> +	} config_data;
>  } __packed;

I recommend leaving the original memcpy() as it was, and instead
creating an anonymous union in place of "config_data":

	union {
		u32 gtw_attrs;
		DECLARE_FLEX_ARRAY(u32, data);
	};

>  
>  struct skl_dma_control {
> -- 
> 2.34.1
> 

-- 
Kees Cook
