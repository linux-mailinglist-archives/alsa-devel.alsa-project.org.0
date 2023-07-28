Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E414B7675DC
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 20:54:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5C09207;
	Fri, 28 Jul 2023 20:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5C09207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690570444;
	bh=wrmZ9BiypI/Mpp4o4+YfRJYOVgGlef3h1kEtLsKi8ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ujp2e0wZ6CHAk4y7kUvAbzZBYS4WIOpQryOAUaGeCu+ka+logZhXObz9oW7ZdSOF3
	 kKCtJHB4wjQXc+2RV23URq/xHnCeD9OIwKqLuTl1Nj2XAYHmJ7UTro3ukOswOrnk04
	 ccNV2tqrMQSyDOfzqoQwRjB+b2egekKCnoqXCbH4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DB1CF80153; Fri, 28 Jul 2023 20:53:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD631F80163;
	Fri, 28 Jul 2023 20:53:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97205F8019B; Fri, 28 Jul 2023 20:53:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90986F80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 20:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90986F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=d0IX++FZ
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bb775625e2so15858635ad.1
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jul 2023 11:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690570383; x=1691175183;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4sz3fdz5ASL81uIRwaUvVdUPGG/7NGI0jRB0c78sZ30=;
        b=d0IX++FZw48K0U6wYhl7mnSyskHucEutaQxvWgvxM4NYMAUX2D82J+WUfC9O7+teVP
         cAAIUvU3rJH3Z2qhdIiaQ5DZTOLcWTsG4XxOcXc3iSA62354iMMXUusRI5Oo5OBigONt
         pxRqB4RCr125sKliFdzBVUrlZTp0G6YVOqpMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690570383; x=1691175183;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4sz3fdz5ASL81uIRwaUvVdUPGG/7NGI0jRB0c78sZ30=;
        b=hZsgh3kRQ9P5VLQhi9pDvGTGkzsZ7aR57U3g4TdybeyEpWOZvtUyE0rbEih+ORk6fN
         hFs3GlVJM6E/IQ+6w/BYwENv/snPOnHEqD6Y/1DFPpoWF+tOfOVYIi1FfpQQtrCxf8sF
         VDlk4XssQfG7STmTVkOXa1vB287HoQZFLwvci8sEIaGC2DsWgoMxSwamzmfTjJbIQrte
         dTK+hOsZwf8042rdagCA3CBFw2i+4PY5ZJpndV8QWHZzCnL2ZQAl93AA6n6H80Xr04L9
         wxh/5DxZE5XaxYBCt4OR3f/8mJ9+zJ62bRQkAekL9qk3waLm40mOPwsPfonlBue6FvsN
         Wp4Q==
X-Gm-Message-State: ABy/qLYOEHyj3qLfA55ry+REeVPO9RTw3ufF1NUeKEbBRXWPP/IWC6dg
	r2NAanePvWoIVy42Xv6qVdG5CuUHqmZa8BBNArs=
X-Google-Smtp-Source: 
 APBJJlFZtVPnVSe+QaD0w5VK3Xw+yr0QbYVt3cbtUKxfEN73/VRkLvzX/WeR43f5vhKJLl8KX2OnCA==
X-Received: by 2002:a17:902:f691:b0:1b4:5699:aac1 with SMTP id
 l17-20020a170902f69100b001b45699aac1mr3264358plg.12.1690570382884;
        Fri, 28 Jul 2023 11:53:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 jh3-20020a170903328300b001b8b6a19bd6sm3940878plb.63.2023.07.28.11.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 11:53:02 -0700 (PDT)
Date: Fri, 28 Jul 2023 11:53:01 -0700
From: Kees Cook <keescook@chromium.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: justinstitt@google.com, Cezary Rojewski <cezary.rojewski@intel.com>,
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
Message-ID: <202307281143.AE254E3A@keescook>
References: 
 <20230726-asoc-intel-skylake-remove-deprecated-strncpy-v1-1-020e04184c7d@google.com>
 <202307261532.3EFCF04F1@keescook>
 <402a7a63-5584-ef79-e42f-e2102f42b9aa@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <402a7a63-5584-ef79-e42f-e2102f42b9aa@linux.intel.com>
Message-ID-Hash: CWSJ4TJK2DCC3V52KY6B3P34KFC3UBIB
X-Message-ID-Hash: CWSJ4TJK2DCC3V52KY6B3P34KFC3UBIB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWSJ4TJK2DCC3V52KY6B3P34KFC3UBIB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 28, 2023 at 09:25:24AM +0200, Amadeusz Sławiński wrote:
> On 7/27/2023 12:34 AM, Kees Cook wrote:
> > On Wed, Jul 26, 2023 at 09:12:18PM +0000, justinstitt@google.com wrote:
> > > `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> > > 
> > > A suitable replacement is `strscpy` [2] due to the fact that it
> > > guarantees NUL-termination on its destination buffer argument which is
> > > _not_ the case for `strncpy`!
> > > 
> > > It was pretty difficult, in this case, to try and figure out whether or
> > > not the destination buffer was zero-initialized. If it is and this
> > > behavior is relied on then perhaps `strscpy_pad` is the preferred
> > > option here.
> > > 
> > > Kees was able to help me out and identify the following code snippet
> > > which seems to show that the destination buffer is zero-initialized.
> > > 
> > > |       skl = devm_kzalloc(&pci->dev, sizeof(*skl), GFP_KERNEL);
> > > 
> > > With this information, I opted for `strscpy` since padding is seemingly
> > > not required.
> > 
> > We did notice that str_elem->string is 44 bytes, but
> > skl->lib_info[ref_count].name is 128 bytes. If str_elem->string isn't
> > NUL-terminated, this can still hit an over-read condition (though
> > CONFIG_FORTIFY_SOURCE would have caught it both before with strncpy()
> > and now with strscpy()). So I assume it is expected to be
> > NUL-terminated?
> > 
> 
> Yes it is a filename of additional library which can be loaded, topology
> UAPI only allows for passing 44 bytes long strings per string token (see
> snd_soc_tplg_vendor_array -> union -> string flex array ->
> snd_soc_tplg_vendor_string_elem -> SNDRV_CTL_ELEM_ID_NAME_MAXLEN), so we

Thanks for the details! And just to confirm, these are (expected to be)
NUL-terminated?

> could also change length of
> skl->lib_info[ref_count].name and potentially save few bytes. And looking at
> it again I also think that we should not copy destination size number of
> bytes, by which I mean ARRAY_SIZE(skl->lib_info[ref_count].name), which is
> 128 in this case... so either need to change destination buffer size to be
> same as topology field or calculate it differently.

If the source is NUL-terminated, it's fine as-is. (And
CONFIG_FORTIFY_SOURCE will catch problems if not.)

-- 
Kees Cook
