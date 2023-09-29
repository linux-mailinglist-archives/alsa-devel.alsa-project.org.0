Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA3D7B38F5
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 19:28:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 331B0DF5;
	Fri, 29 Sep 2023 19:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 331B0DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696008511;
	bh=JHVli4pvb5ByrQNcvtdJFMebLZ+PfOz2xZbBxg+qzMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mSIkZQAb30FaGOT2SIqT520+O20erFyWBqXL+5zeqQoxEmolhR4zIjyR+31642AF3
	 ZRgVe/2fgW3F9M/rFoBTi0TiAfNLPuPjpn2FZ937DcseOOpC51fFHaSCXQihl8Zzk7
	 n0AZ5C0M/8+M+N22dniangk0FzcZZpxjH0KojtZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C338F80549; Fri, 29 Sep 2023 19:27:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 275DCF80553;
	Fri, 29 Sep 2023 19:27:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9737AF8055A; Fri, 29 Sep 2023 19:27:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EABEF801D5
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 19:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EABEF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=JbWG+3/Z
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-691c05bc5aaso12665527b3a.2
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Sep 2023 10:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696008423; x=1696613223;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wd8ES7UTRS4g/SWmf5zxBULHM/lF3w6VRAdiJYs6Tsc=;
        b=JbWG+3/Z8YQwcOrKGCc0zwXmjp17XzFa/daNRDiBNS9JUtb00ismpQKIjjL7H92Rji
         kddS1LznNfnFW88Sc+8p8p3RGQfFrtzOACv1h93QnQiMu2XTisLm38N+mqmnbaBebV8O
         RKfKSvaEoS+G4lxLwaDWCouEMiC1G6qmpysFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696008423; x=1696613223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wd8ES7UTRS4g/SWmf5zxBULHM/lF3w6VRAdiJYs6Tsc=;
        b=WRkXK4AuH+yuLt/uHQe8Vu+iFsSipSAuQWcNiMpjwHzNV/UMjnttU2auzl4Yu9TmDh
         SYGuPvjiiz7PIwSodTLLsivAfyW0qM6LVchtikpPU8wFTKzcXAB+NS0VBtZorD/val3E
         5BltBcL4sBmPxQpeoMAjqKbroj6kcsGaHsg+rA9koxGovgyJX/dPIp4eWqR4QbYpV9jI
         PNapPo2XqzSnA1VKcvJ3gPV+YQsDHYr7nZ6mlVsJukfdODKngCTMuz3OKMTeECDgBY7X
         E81B3YR/zGGvPAvg9bx3qEGpJTcDhUkMqe5e6Bh5J3pNqUAlABG01ViD7EnXpE5rEmql
         XYBA==
X-Gm-Message-State: AOJu0YxIiyoREtolk27nRVOKa0NnApkhPTu0hgBS/UBK2tHqKt286ZpR
	fJdW7vzRsJ/8PHbtDk2ynQPjtal5XUl2Q5fdais=
X-Google-Smtp-Source: 
 AGHT+IEXWkksRK1toVy3j5D1s4dbzSv/nL8bWHO6yyUqYwQr+UgzfldVKiEECFSqaadF6uH++QvI9w==
X-Received: by 2002:a05:6a20:d42f:b0:14e:315b:d9c with SMTP id
 il47-20020a056a20d42f00b0014e315b0d9cmr4362465pzb.22.1696008423179;
        Fri, 29 Sep 2023 10:27:03 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 i6-20020aa787c6000000b0068a0b5df6b2sm15242690pfo.196.2023.09.29.10.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:27:02 -0700 (PDT)
Date: Fri, 29 Sep 2023 10:27:02 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Torsten Schenk <torsten.schenk@zoho.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] ALSA: 6fire: Fix undefined behavior bug in struct
 midi_runtime
Message-ID: <202309291026.06071AC@keescook>
References: <ZRb2CKHuaCu0u38i@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRb2CKHuaCu0u38i@work>
Message-ID-Hash: 4QBRFMPPEQO7V3GHTIJCT27E22EP2QGC
X-Message-ID-Hash: 4QBRFMPPEQO7V3GHTIJCT27E22EP2QGC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4QBRFMPPEQO7V3GHTIJCT27E22EP2QGC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 29, 2023 at 06:06:32PM +0200, Gustavo A. R. Silva wrote:
> `struct urb` is a flexible structure, which means that it contains a
> flexible-array member at the bottom. This could potentially lead to an
> overwrite of the objects following `out_urb` in `struct midi_runtime`,
> among them a function pointer.
> 
> Fix this by placing the declaration of object `out_urb` at the end of
> `struct midi_runtime`.
> 
> Fixes: c6d43ba816d1 ("ALSA: usb/6fire - Driver for TerraTec DMX 6Fire USB")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Another good find. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
