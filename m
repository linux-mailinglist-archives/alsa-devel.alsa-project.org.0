Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 515CD8B6120
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 20:31:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 756B71E8;
	Mon, 29 Apr 2024 20:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 756B71E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714415475;
	bh=owUnCLYoRPgs0mrdKX/Pm+hC5u4zNv8hMMak4UZoZHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FEvWuvvNjhUkxASFKAAPhSM19eMNEOCu7RejpydsWHoa5YR6NwZZTuVEE1x1yIm5v
	 PXRWn0Yf26Nvd+saBFO3oq8N4VTtvuu5lfF4/i88fFZMB4aKkGFAAFJmGZsXbRO2Fp
	 coXtAn3jSf7AdT8noJNM9liqAj/3luVtrh2Frn/k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70F71F805A8; Mon, 29 Apr 2024 20:30:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F229F805A0;
	Mon, 29 Apr 2024 20:30:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AB7AF8028D; Mon, 29 Apr 2024 20:30:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD4BDF80100
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 20:30:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD4BDF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=GRHM5cRT
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6ed112c64beso4555581b3a.1
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Apr 2024 11:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714415428; x=1715020228;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TkpFuoY5aQyyw+nrgLES9BJOsJzkqq/5/Ik8pmOE86s=;
        b=GRHM5cRThLYKA/17gf8MLHY0qNUsiUm95MGMfFc3bM2di22GGRDFjiJINyau0uwNj6
         9lXZgvd334nQdaXAYCYc1Gpt3+WqqoKOEtdCN3zOfni++yT/qDsUoawRqYJWO/UP9dNK
         DLtwMTO3NYqQTWswIm+/OYO2uZZZKOAtdQdOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714415428; x=1715020228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkpFuoY5aQyyw+nrgLES9BJOsJzkqq/5/Ik8pmOE86s=;
        b=aXSBjhLg1XTLcl/ru1i2U7o3WuGCOA93hOE4Q6PyrUmfO2PUkiAuvqyKZThGRFTsVN
         g7mll1y6SZdAs+2KQP42yeaMw6GouzIN+B7p/kUB9RUy7sUvaZtxJIE1HS5hpxnP+G/T
         rd9GoI/bDPe6P9pDSzuJ+v8rdq1Yfk4XZpKGggpXNRj8ALgMpDEFQrDDR2wvBHXjj7tW
         yXXXThe4VPOVQTn7Kmo2zrTQQBcC6BYBTmgQ/491C0xwIAvntzeMub2ZoLjA+5HYKUMz
         3yTOLZJ3Qnsjw9JGVAZ56Wijf9aEvOTMCCdla/XMdInkBtD+mDNcVlVRNo293Gqj14RL
         braw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKwEaczWbQ+tylZZADYuMCWAXO7DZyGsmImCeLZnOhETZqxHzIw0i2a8pVHQ9kEQcAfLu+KD/Zde7FO5cDl+Op28bHyOSFrqpyNd8=
X-Gm-Message-State: AOJu0YyHfFJO0hBhdwFVJ7gPAFHTqAmSRKF3dYAsNHxxp/qlEi/3fI9o
	iXs1cA+5xXwE5V2L6juUY6xvCipyAkXWK+P9d2xdG319DHgBr974n82XPYQiiFlvAu6/C63N5Dg
	=
X-Google-Smtp-Source: 
 AGHT+IFm/F0nByuRkm7UdHH7GTHif1EcCEbCwry9uts5YLa+VEPBdJBvu/5Z6ZOh3u/DAHGVzCektg==
X-Received: by 2002:a05:6a00:4b4a:b0:6eb:40:6bff with SMTP id
 kr10-20020a056a004b4a00b006eb00406bffmr8812728pfb.14.1714415428214;
        Mon, 29 Apr 2024 11:30:28 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 fu16-20020a056a00611000b006ecca2f2a32sm19545034pfb.168.2024.04.29.11.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 11:30:26 -0700 (PDT)
Date: Mon, 29 Apr 2024 11:30:26 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net
Subject: Re: [PATCH 0/2][next] firewire: Avoid -Wflex-array-member-not-at-end
 warnings
Message-ID: <202404291129.F261DEA21F@keescook>
References: <cover.1709658886.git.gustavoars@kernel.org>
 <20240306011030.GA71684@workstation.local>
 <6a7854af-a183-4db2-8400-4d9eb0cc4308@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a7854af-a183-4db2-8400-4d9eb0cc4308@embeddedor.com>
Message-ID-Hash: 3ZAIMRC3S4EAEBVBHDJZWHXFO77G22WN
X-Message-ID-Hash: 3ZAIMRC3S4EAEBVBHDJZWHXFO77G22WN
X-MailFrom: keescook@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZAIMRC3S4EAEBVBHDJZWHXFO77G22WN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 06, 2024 at 10:18:59AM -0600, Gustavo A. R. Silva wrote:
> 
> > Thanks for the improvements, however we are mostly at the end of
> > development period for v6.8 kernel. Let me postpone applying the patches
> > until closing the next merge window (for v6.9), since we need the term to
> > evaluate the change. I mean that it goes to v6.10 kernel.
> 
> Sure, no problem.
> 
> Actually, I'll send a v2 with DEFINE_FLEX(), instead.

I was just going through the patch tracker to make sure stuff got
handled -- did a v2 of these ever get posted? I don't see anything in
the tracker nor changes here in -next.

Thanks!

-Kees

-- 
Kees Cook
