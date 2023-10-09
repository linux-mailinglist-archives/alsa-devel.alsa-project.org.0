Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C47BEAE8
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 21:52:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AEA2EDB;
	Mon,  9 Oct 2023 21:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AEA2EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696881159;
	bh=A0xz3kxYosXOJXpCRvAUD8uTyrE2L/ZtJobCdIqS3s4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iHV1oTCQeuZn8zlH9NZU9YunXyu3s5n6yoaEExWMElZuAX2fXU79/h+SMtRIZKcri
	 f0Z2u6rHUq8pTNlf9c7vRdrFftM2K8Y+wMy1KyyclWcffqbflHAs/AzRQThjx7bl3c
	 KTLKNtZnnNg9KFA4h5TE3hAyR1nIYmQYcSRn79Jk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5329BF80552; Mon,  9 Oct 2023 21:51:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED6EAF8027B;
	Mon,  9 Oct 2023 21:51:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79549F802BE; Mon,  9 Oct 2023 21:51:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 844ACF8015B
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 21:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 844ACF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=GH9t4jNX
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-27ce160938fso128932a91.0
        for <alsa-devel@alsa-project.org>;
 Mon, 09 Oct 2023 12:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696881100; x=1697485900;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K2qK3/RPJGcH/Y4e4B3fj0OlYjfNOjt5OVjwpAAdhYw=;
        b=GH9t4jNXJY08NqVdsgyzMzSOAr1BmUW77paKFNglVHj9HuJJ4qRLBRtLX7Mn87irk9
         cGlcecU/IoNmoPP225j95oPGvP9+RtROU8xtaOrRsrkMIxl/zx2ewOYQ0qU/LKElvcJB
         S0ah08fnjlIzzGgEkKbblR2kZhHZLz9Z5L67s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696881100; x=1697485900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2qK3/RPJGcH/Y4e4B3fj0OlYjfNOjt5OVjwpAAdhYw=;
        b=OuqIOTkV8SKWf2OMLRgzBNQHWQbEIR7LhvgTAWLsyeprrwnfLtGVq3yt5/LXGiNISa
         UD6Ew7+vHDnUjP+yVHXWdcxtSiXm+htoOjJGBAWGwP0go/8KYnAu1z1KY6+BA28Sb0YN
         xo3R9uU4D4pRRt9aP2H78WNPJFpMYRNYAAmWZIQqfjxNzBKshEPSjfTxtnvCxoPSXAdU
         gDEGnNM6+IGtwaQT/zr7eh/6Ytj6iPs2mzRBMJ2yVb2ILC7O49nJOW4jQonS53BLImzC
         6uP1uHEgVJSIU5iZuc8GZ3vFvoHVGi0rpUcRA/sG2qMeH269xgGyo5Bcrt74q2K5ke8y
         f6fw==
X-Gm-Message-State: AOJu0YwQIz2DaNtjNdzw2ffX9o8/uc4h/Eo4BXrwyGcKER+iRpdRSfK6
	hsaac9N5ETEcDNrdlP9OyCzMXSZWTjiZFcRjLxI=
X-Google-Smtp-Source: 
 AGHT+IErKu5nijcGQNO4C5TTmPCzq/DLxiROmTLvRJ5rM8E6o7Mvo2fsCJGqYmjn1eMmUSEOjczf4w==
X-Received: by 2002:a17:90b:4d8b:b0:27c:df02:88b3 with SMTP id
 oj11-20020a17090b4d8b00b0027cdf0288b3mr787340pjb.8.1696881099801;
        Mon, 09 Oct 2023 12:51:39 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 ct19-20020a17090af59300b0026b3a86b0d5sm8806769pjb.33.2023.10.09.12.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 12:51:39 -0700 (PDT)
Date: Mon, 9 Oct 2023 12:51:37 -0700
From: Kees Cook <keescook@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev, alsa-devel@alsa-project.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ASoC: apple: mca: Annotate struct mca_data with
 __counted_by
Message-ID: <202310091251.B877B4AF@keescook>
References: <20230922175050.work.819-kees@kernel.org>
 <202310061321.E7247C52B@keescook>
 <6c7db067-78f2-4637-8064-3dc7c0489b90@sirena.org.uk>
 <202310090958.27F5025BDB@keescook>
 <6d665575-7658-4619-a763-438e0d3aaf2e@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d665575-7658-4619-a763-438e0d3aaf2e@sirena.org.uk>
Message-ID-Hash: QGD5AUPZWM6H4GI7E6B6U3GWGHJCJHTH
X-Message-ID-Hash: QGD5AUPZWM6H4GI7E6B6U3GWGHJCJHTH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QGD5AUPZWM6H4GI7E6B6U3GWGHJCJHTH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 09, 2023 at 08:43:44PM +0100, Mark Brown wrote:
> Off the top of my head I'd say wait at least three weeks for this sort
> of patch before doing anything and then prefer to do a resend, that's
> should avoid most issues.  If you're going to just apply things yourself
> I'd suggest waiting for -rc6 or so before doing so (assuming the patches
> were initially sent reasonably early), that does seem like a reasonable
> backstop so things don't completely miss releases.

Okay, sounds good. Thanks for the clarification!

-- 
Kees Cook
