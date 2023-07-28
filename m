Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC90A7675E8
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 20:57:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BB50843;
	Fri, 28 Jul 2023 20:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BB50843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690570651;
	bh=nhZZLRInlJ7lIy7r5/ql1ukFt019efNlwSXo0M39zbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZGSzVzTZHZzIlVWRkFx0ES4GSCBBT8MttyJjFioQebQ9frZ/bKTjjeSYlFwppo4Hm
	 w/h0WAtfgixTM00CLjLw3h8rrp5BqdiboA/zswiH2ENJztQG5VnfrXLZFlbdL19kTf
	 u4FMKpsBHB2yDfk6WOoEwbwlrwF2HxzflszwJGGo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE646F800D2; Fri, 28 Jul 2023 20:56:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FA65F80163;
	Fri, 28 Jul 2023 20:56:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E98CDF8019B; Fri, 28 Jul 2023 20:56:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AF2DF80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 20:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AF2DF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=nfFcmOBJ
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-666e97fcc60so1822466b3a.3
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jul 2023 11:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690570569; x=1691175369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=94oOxm0WoyXasJp0lxEK6G1xzuxiRUtkw48hzY+2KKA=;
        b=nfFcmOBJUm2G6WKuAfyEZ1v/efunAenmLDRiCwhUFkyB4/fhkaMB/a3ar/ZX1JHkJJ
         X52mM981hfdSShkGjg2Vvwpzny4IOVGJxvpmPnU9XZCRpZCXBTAxRkJJpuboGQBoFhra
         +GZ3CecY6skX6YlCNydRWv9yDDlEcDjHIMMLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690570569; x=1691175369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94oOxm0WoyXasJp0lxEK6G1xzuxiRUtkw48hzY+2KKA=;
        b=crh6KG1psocs1VKuWaEloDFObaVx18jyJDzmbI4dGo1+K5O03qAakPDUBJob2EEgYr
         HLIIJZOhNfNx3NZE2M+JV96Wp8MmuUOLgL6RzGzlOgMQEDDx8IYz0tC+TUgXbLKg5Ra3
         ZuAlI1Vr97IiYUzVRwU3o2BGoT9cxxNG6S8BO0zge7ALcbGWsSm4HCl9E3XcWDud10kk
         ZMYjx10G1Ugo4vMMvKlqeeZ8lO7eHWS0RBL1rGojJq1Hs6NrCc/84nR/vGqp+afKf8VR
         tuXCWhYkVlqw5qlm1PATDizCLuWfX29Uwmkpt+EsfSrYpRD9Z0khxFTeBKSfDqkGrxTx
         SGfA==
X-Gm-Message-State: ABy/qLYmB6vZn8Hi8iYxtEPjd7fjP5notkOWFnqrGoLSHOCCInT6LfYt
	hmMnA/MuHgv77Jc2Il6EpC54xiC0wt42mVuPsKw=
X-Google-Smtp-Source: 
 APBJJlGUxisSIvpw4EAEzjvpNjNfQyoa9MtaWQzi1HEOuQ+jPTd7IumEeb5BGAJdxPLLG2bRGYWaKw==
X-Received: by 2002:a05:6a00:170f:b0:686:254c:9d4e with SMTP id
 h15-20020a056a00170f00b00686254c9d4emr3001823pfc.14.1690570569293;
        Fri, 28 Jul 2023 11:56:09 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 a26-20020aa780da000000b00682802ca418sm3528085pfn.79.2023.07.28.11.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 11:56:08 -0700 (PDT)
Date: Fri, 28 Jul 2023 11:56:08 -0700
From: Kees Cook <keescook@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: Intel: Skylake: replace deprecated strncpy with
 strscpy
Message-ID: <202307281153.B9D0831710@keescook>
References: 
 <20230726-asoc-intel-skylake-remove-deprecated-strncpy-v1-1-020e04184c7d@google.com>
 <20230727-asoc-intel-skylake-remove-deprecated-strncpy-v2-1-152830093921@google.com>
 <f0f0ebe4-55fb-4861-a94c-77c82ec600c5@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0f0ebe4-55fb-4861-a94c-77c82ec600c5@sirena.org.uk>
Message-ID-Hash: AOVKZX5KOC2VIFRM6KIPQO52LABH7DVM
X-Message-ID-Hash: AOVKZX5KOC2VIFRM6KIPQO52LABH7DVM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AOVKZX5KOC2VIFRM6KIPQO52LABH7DVM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 28, 2023 at 12:27:24AM +0100, Mark Brown wrote:
> On Thu, Jul 27, 2023 at 08:30:18PM +0000, Justin Stitt wrote:
> > `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> > 
> > A suitable replacement is `strscpy` [2] due to the fact that it
> > guarantees NUL-termination on its destination buffer argument which is
> > _not_ the case for `strncpy`!
> 
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.

Hm, I see "X-Mailer: b4 0.12.3". Is this a default behavior of b4? (If
so, that needs fixing.)

-- 
Kees Cook
