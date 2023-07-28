Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB767675EF
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 20:59:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6C7C846;
	Fri, 28 Jul 2023 20:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6C7C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690570777;
	bh=ZN62DppbOyFDwirDsJUrASej8V4JTPBH+1JIE+N6jmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tNPane3oMq/eh9GpspvCaFWoq6Y21oz2ENtBYyhGh6iGoIU9H5qkHqeMlQt150msF
	 sR77G6UnH94cUtSetbIhbfyLdPlor6gXKpzOK/mjeX4X1lTLAT1LIO8PAWbXHhHmOB
	 O3Rd2LXjIWj6QEZtjU3pmx/Xvhzv4MtLoEEtuAis=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF882F802E8; Fri, 28 Jul 2023 20:58:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23AE3F80163;
	Fri, 28 Jul 2023 20:58:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A574DF8019B; Fri, 28 Jul 2023 20:58:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CA52F800D2
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 20:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CA52F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Z91cglUf
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bbdc05a93bso15026765ad.0
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jul 2023 11:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690570696; x=1691175496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MRu9xgGnnKvTga8mQ0gCn0FsFMxzoget4tYnN1J1xew=;
        b=Z91cglUfIrf8ob9zCEdA7W8HRPubyzVXm9Ewl5MgC6pR010pqkMIJ4656mQ7TtGXhu
         5oHq/ZYX2Nl7Sh30OhV+skJjCSEvUqdKqFoGBItsgwZVP04lT6XGuCfjzmshNI0aYiZN
         QRn31HXO75Sl1MdBUpGXcFl158iQzY4zmjudo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690570696; x=1691175496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRu9xgGnnKvTga8mQ0gCn0FsFMxzoget4tYnN1J1xew=;
        b=OAscSdZhNHZBIlsfa7gXgsT7fo0vCUxjZdZBkiECsPeIWds3YsA2+Csdp3vjNC96Ly
         Gi/O28DiZG5XAOs4PWHqyXQ3FLk1LDeqn23u85U2I1qBsVhMrPXLGX2ttuufdi8Fscuw
         /hJnTroDSSu6fHtjAe1iacMxyZfCNEV+lnpSMvm0S16xc+5qsuJJUN1zNzSaknbN3eN9
         mISh4uhwLvd68zwenWUzwoCWiwUJ8Mrvlx2E7EV6tyBR0yFJY1WBiDSsXkMLDt+fVc7n
         qIkHIVZpJITZUcnJxWaxG4PbEs0NnAjZWPTEYnQ3n3KVdeCTEr9X1IaXe0rAb12boYR0
         K73w==
X-Gm-Message-State: ABy/qLa4JYDC6qoV7djFEHWQ24eFv64rDyT5OGZaOEuSrmllh42aAjqa
	k9MmS0RTtvpnXjaf3pVv7xzbQ1dvid9plULrqjw=
X-Google-Smtp-Source: 
 APBJJlG900h32fIeodQCrN6pUaNehSSwvUfQMQ6ivtLVjRwRom8xzOk8E8avzyyed+zEa3U4TTtQVg==
X-Received: by 2002:a17:903:44e:b0:1b9:d362:426f with SMTP id
 iw14-20020a170903044e00b001b9d362426fmr1805280plb.3.1690570696561;
        Fri, 28 Jul 2023 11:58:16 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 l4-20020a63be04000000b0055386b1415dsm3556156pgf.51.2023.07.28.11.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 11:58:16 -0700 (PDT)
Date: Fri, 28 Jul 2023 11:58:15 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
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
Subject: Re: [PATCH v2] ASoC: Intel: Skylake: replace deprecated strncpy with
 strscpy
Message-ID: <202307281156.59CC304@keescook>
References: 
 <20230726-asoc-intel-skylake-remove-deprecated-strncpy-v1-1-020e04184c7d@google.com>
 <20230727-asoc-intel-skylake-remove-deprecated-strncpy-v2-1-152830093921@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20230727-asoc-intel-skylake-remove-deprecated-strncpy-v2-1-152830093921@google.com>
Message-ID-Hash: 2DNTER5FBOJSLONXIKHTBRBTZT7DBYIX
X-Message-ID-Hash: 2DNTER5FBOJSLONXIKHTBRBTZT7DBYIX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2DNTER5FBOJSLONXIKHTBRBTZT7DBYIX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 27, 2023 at 08:30:18PM +0000, Justin Stitt wrote:
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
> 
> [1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
> [2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
> 
> Link: https://github.com/KSPP/linux/issues/90
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Thanks for the updates! And based on the details from Amadeusz, it
looks safe.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
