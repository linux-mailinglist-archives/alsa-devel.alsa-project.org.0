Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C6B764231
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 00:35:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 916EF827;
	Thu, 27 Jul 2023 00:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 916EF827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690410958;
	bh=rNwAfFExXIaeiqSmj007w3yvwxSWV/1QaU5Eyqhh25M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PSmeB1Ulx+3wVHu/kPSZTUVxdPxBpcY6kSo4CdRt82fZdHHsIRG/ysUMqFvPIB7uU
	 Re0Ig0GeAiW6kefAKNu7+88tIYeU4/50tvfTZFLpStr7KpOk3ETSdY2hDqYegO2S4D
	 a5EO5W4pMEsko25k7GRBjAQnFn78Lveg5ZhJkPNg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3F4CF80544; Thu, 27 Jul 2023 00:35:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AE64F80163;
	Thu, 27 Jul 2023 00:35:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A95C6F8019B; Thu, 27 Jul 2023 00:35:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB8A1F80153
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 00:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB8A1F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=MDSzK2GG
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-686b9964ae2so288200b3a.3
        for <alsa-devel@alsa-project.org>;
 Wed, 26 Jul 2023 15:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690410889; x=1691015689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X6w8VhI1tk0nbJkJuK2Pgr9+I/2HSSEWHGbvHhOGVr0=;
        b=MDSzK2GGWDQaVDiugDXkQzVkMDMY24BHrqfDNMHZYw5//XnmJWJ4+M/zkGp9BHCfJS
         wY5HWu6H+bWg1buQsNwJNB2ADKb7sMcMvdNQZv2TB49Lw+4Y6uN0cb50krwJdtgVKcVe
         0v2qCojo9/Epjv+QQg/83tZXts6hFyovv7UHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690410889; x=1691015689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6w8VhI1tk0nbJkJuK2Pgr9+I/2HSSEWHGbvHhOGVr0=;
        b=iMuvAIVr5T/GcFhXlNasF7BLvXRRDRFsm0kz/hrHuHvitcBvMtFyTPBjj5DhaZSjum
         bpFQOom3lu1Nip9j4TEeqjQxwjkadMiklyoo4Om9wRR0Td2K7COrvYMQCOJTM9Qu0pa8
         3cCcVtAv0nczzAzpx7WPm+wMU+ZkN6n+BMwqMEJ6Vf2tLfDV8TZT4CVIrhhOFtHWm7ou
         qx3LjgUnIGYdIMWIGUddMPAvTzeK6xEBRV/+upI2ghJ5+f+6xOo8+79TKChJRislyt0c
         lNNa993Ue3Zgv3K4/efx9LbI1qULA1gTsKnUsURGx/l8CIdJ5k7H3W1IlqI7S0fVW+9F
         iYOw==
X-Gm-Message-State: ABy/qLafXXVBRyOXyTQSvda4GuHMyqTkltfV5wECv+6lFTnf373n/Wvv
	9s7gcVwS8xrbrupG976Z0/dEYKZDCjb0hvQoHRY=
X-Google-Smtp-Source: 
 APBJJlFYSi/2EqdK53JZP66OEANSKSh8FOVfXLOR/d6VUzsQzuojiQ9yyqmqmVyNQz2uMUcCYgAHbg==
X-Received: by 2002:aa7:88c3:0:b0:680:f6fe:8908 with SMTP id
 k3-20020aa788c3000000b00680f6fe8908mr3521901pff.9.1690410889247;
        Wed, 26 Jul 2023 15:34:49 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 n9-20020a62e509000000b006749c22d079sm92392pff.167.2023.07.26.15.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 15:34:48 -0700 (PDT)
Date: Wed, 26 Jul 2023 15:34:48 -0700
From: Kees Cook <keescook@chromium.org>
To: justinstitt@google.com
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: Intel: Skylake: replace deprecated strncpy with
 strscpy
Message-ID: <202307261532.3EFCF04F1@keescook>
References: 
 <20230726-asoc-intel-skylake-remove-deprecated-strncpy-v1-1-020e04184c7d@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20230726-asoc-intel-skylake-remove-deprecated-strncpy-v1-1-020e04184c7d@google.com>
Message-ID-Hash: J66EYHUWW27XNUDDIRIJ43QFW5NDZCKK
X-Message-ID-Hash: J66EYHUWW27XNUDDIRIJ43QFW5NDZCKK
X-MailFrom: keescook@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J66EYHUWW27XNUDDIRIJ43QFW5NDZCKK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 26, 2023 at 09:12:18PM +0000, justinstitt@google.com wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ the case for `strncpy`!
> 
> It was pretty difficult, in this case, to try and figure out whether or
> not the destination buffer was zero-initialized. If it is and this
> behavior is relied on then perhaps `strscpy_pad` is the preferred
> option here.
> 
> Kees was able to help me out and identify the following code snippet
> which seems to show that the destination buffer is zero-initialized.
> 
> |       skl = devm_kzalloc(&pci->dev, sizeof(*skl), GFP_KERNEL);
> 
> With this information, I opted for `strscpy` since padding is seemingly
> not required.

We did notice that str_elem->string is 44 bytes, but
skl->lib_info[ref_count].name is 128 bytes. If str_elem->string isn't
NUL-terminated, this can still hit an over-read condition (though
CONFIG_FORTIFY_SOURCE would have caught it both before with strncpy()
and now with strscpy()). So I assume it is expected to be
NUL-terminated?

> Also within this patch is a change to an instance of  `x > y - 1` to `x >= y`
> which tends to be more robust and readable. Consider, for instance, if `y` was
> somehow `INT_MIN`.

I'd split this change into a separate patch -- it's logically unrelated
(but seems a reasonable cleanup).

> 
> [1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
> [2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
> 
> Link: https://github.com/KSPP/linux/issues/90
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  sound/soc/intel/skylake/skl-topology.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
> index 96cfebded072..67f08ec3a2ea 100644
> --- a/sound/soc/intel/skylake/skl-topology.c
> +++ b/sound/soc/intel/skylake/skl-topology.c
> @@ -3154,12 +3154,12 @@ static int skl_tplg_fill_str_mfest_tkn(struct device *dev,
>  
>  	switch (str_elem->token) {
>  	case SKL_TKN_STR_LIB_NAME:
> -		if (ref_count > skl->lib_count - 1) {
> +		if (ref_count >= skl->lib_count) {
>  			ref_count = 0;
>  			return -EINVAL;
>  		}
>  
> -		strncpy(skl->lib_info[ref_count].name,
> +		strscpy(skl->lib_info[ref_count].name,
>  			str_elem->string,
>  			ARRAY_SIZE(skl->lib_info[ref_count].name));
>  		ref_count++;
> 
> ---
> base-commit: 0b4a9fdc9317440a71d4d4c264a5650bf4a90f3c
> change-id: 20230726-asoc-intel-skylake-remove-deprecated-strncpy-9dbcfc26040c
> 
> Best regards,
> -- 
> Justin Stitt <justinstitt@google.com>
> 

-- 
Kees Cook
