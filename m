Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD991762A91
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 07:05:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F1B5820;
	Wed, 26 Jul 2023 07:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F1B5820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690347931;
	bh=e9H3JC4nrF1mlH7bgAYFwCwqqme2EeRSHsKv5h5ytm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nd2+l4tEsq/EbO86guv81SK9VMmxtuczb0Wmk3nklBZ7KFrLj/dfVqqCt17sF/Egy
	 LuJbP+IQGakgGKTdGBPpOAIBv9F7+M/ptZqQNZI7umLYx2lYxLzcnGwWhq4vthDNs+
	 pUXGj3W8VyNbZ4KqwHxXkyeKPK5kT7ZBh/SAWUw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA09EF802E8; Wed, 26 Jul 2023 07:04:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EACFF80153;
	Wed, 26 Jul 2023 07:04:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FE9AF8019B; Wed, 26 Jul 2023 07:04:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 791DDF80149
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 07:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 791DDF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=i8e5D386
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1bb8e45185bso18415815ad.1
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jul 2023 22:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690347842; x=1690952642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EmNxf7H0BywXLtYlbyzZ0cohOxG3KN5qwoqWHBea/DE=;
        b=i8e5D386JPazAaCSpTbvVvQTdkpO/Ce+xooq5vf1A56euX8LkYV7aNAeJur95KwXHH
         ycurDepI7RCrgNILIlWlKTX7cyLGIWzf4CfyzwHQWGa8r30kjLHPbjR9KGdkvoeh1xvl
         sFpkufDwIYceHjLLxu80f6mvHGi7o4Hh+AyhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690347842; x=1690952642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmNxf7H0BywXLtYlbyzZ0cohOxG3KN5qwoqWHBea/DE=;
        b=K9fxmXoDDzJjXPyF1rRMafKtmLbid12tfbWxzLgfei1jgMu1Oz7w1KF+UVejUyoQmk
         yVc/fPYam5ELIaJmX98pkdWo2QkfLKc/0nyy2lnAeqlpBsTXEM2kHR8U7CuEtqQ9gRQx
         46fPpGt/XjoRApDQgAUXLAvjEMfoLZbLNNFumG9MZ3+QjblCMET7gOJQi5DrxWC/HDf+
         A2BtM+oG2hyODLhkiv689GKshkhZGuZTcyg5fiEccdu8auHcBhQ1hXpPdVYxWM7OFhk/
         jWKYr5hkyKZ43slxBeLT9CD1IgL6EFOLe84AUox+TXq8SA/2nwg7zlWSo0n8odD3k4/I
         G94g==
X-Gm-Message-State: ABy/qLY1VbAH14binFP9bS8l476CbPwhClbNv/cFgO5lXJoiyrE8V6+Q
	D8mHbWDpRdl+DIadWgfQzJ/3yjiszbqLpvj0UBM=
X-Google-Smtp-Source: 
 APBJJlHCsyMGDfR/HSI4jTFBKt05j4ib5fipfp9CPEPiAJolZuOa93xPQomZb9+LBBoHaiuhXeFkKA==
X-Received: by 2002:a17:903:120d:b0:1b7:c0b3:b17d with SMTP id
 l13-20020a170903120d00b001b7c0b3b17dmr1003936plh.5.1690347841574;
        Tue, 25 Jul 2023 22:04:01 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 p1-20020a1709028a8100b001b3ce619e2esm11893529plo.179.2023.07.25.22.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 22:04:01 -0700 (PDT)
Date: Tue, 25 Jul 2023 22:04:00 -0700
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
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] ASoC: intel: avs: refactor strncpy usage in topology
Message-ID: <202307252157.90B1933@keescook>
References: 
 <20230725-sound-soc-intel-avs-remove-deprecated-strncpy-v1-1-6357a1f8e9cf@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20230725-sound-soc-intel-avs-remove-deprecated-strncpy-v1-1-6357a1f8e9cf@google.com>
Message-ID-Hash: GJDUXBZJG2CHFQLUD62RJCT6IYUVS642
X-Message-ID-Hash: GJDUXBZJG2CHFQLUD62RJCT6IYUVS642
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJDUXBZJG2CHFQLUD62RJCT6IYUVS642/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 25, 2023 at 10:08:38PM +0000, justinstitt@google.com wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings
> [1].
> 
> A suitable replacement is `strscpy` [2].

For future patches like this, can you include the rationale for _why_
strscpy() is suitable? (i.e. how did you check that it doesn't need
zero-padding, the dest is expected to always be NUL-terminated, etc.)

I had fun looking through this code -- it's a bit of a maze! I can see
in the initializer for "route" (soc_tplg_dapm_graph_elems_load()), that
all the strings pointed at from "elem" are being checked for NUL-termination.

That this code is doing an in-place rewrite of the string is pretty
unusual (i.e. specifically casting around the "const"), but it looks
quite intentional. :)

> There are some hopes that someday the `strncpy` api could be ripped out

This can be rephrased, perhaps, as:

There is a goal to eliminate the `strncpy` API in the kernel, as its
use is too ambiguous, instead moving to the unambiguous replacements
(strscpy, strscpy_pad, strtomem, strtomem_pad, strlcpy) [1].

> due to the vast number of suitable replacements (strscpy, strscpy_pad,
> strtomem, strtomem_pad, strlcpy) [1].
> 
> [1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
> [2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
> 
> ---
^^^^ this triple-dash is going to cause some tooling to lose your S-o-b,
as it indicates the end of the commit log.

> 
> 
> Link: https://github.com/KSPP/linux/issues/90
> Signed-off-by: Justin Stitt <justinstitt@google.com>

But otherwise, looks good:

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  sound/soc/intel/avs/topology.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
> index cdb4ec500261..45d0eb2a8e71 100644
> --- a/sound/soc/intel/avs/topology.c
> +++ b/sound/soc/intel/avs/topology.c
> @@ -1388,12 +1388,12 @@ static int avs_route_load(struct snd_soc_component *comp, int index,
>  		port = __ffs(mach->mach_params.i2s_link_mask);
>  
>  		snprintf(buf, len, route->source, port);
> -		strncpy((char *)route->source, buf, len);
> +		strscpy((char *)route->source, buf, len);
>  		snprintf(buf, len, route->sink, port);
> -		strncpy((char *)route->sink, buf, len);
> +		strscpy((char *)route->sink, buf, len);
>  		if (route->control) {
>  			snprintf(buf, len, route->control, port);
> -			strncpy((char *)route->control, buf, len);
> +			strscpy((char *)route->control, buf, len);
>  		}
>  	}
>  
> 
> ---
> base-commit: 0b4a9fdc9317440a71d4d4c264a5650bf4a90f3c
> change-id: 20230725-sound-soc-intel-avs-remove-deprecated-strncpy-2bc41a5a5f81
> 
> Best regards,
> -- 
> Justin Stitt <justinstitt@google.com>
> 

-- 
Kees Cook
