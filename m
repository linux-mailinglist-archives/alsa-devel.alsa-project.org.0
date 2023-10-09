Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F05D7BEE0E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 00:05:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F0B1F00;
	Tue, 10 Oct 2023 00:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F0B1F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696889153;
	bh=8wtTlCSUgAmNIWY0LQQgbIMHT6LUWzHuO0qjNkW3Jkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YneQpT+awhP+YDjiDWQ3v03UAJ5mnJ1gCgCArkm0NsrrNvZNhXHIb1zW3MW0hSfKe
	 1bXxGUFa5KerbGDT7uyC9fhBO4LKkYTi6qfzGTfwAu5zkGURzHKhHi9lPNy5h5MIts
	 XXwz/A3qyin6EeabC+n26Sa5B/B2+VkhaahH7/Q0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ABE3F80536; Tue, 10 Oct 2023 00:04:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16BCCF80536;
	Tue, 10 Oct 2023 00:04:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE5FBF8055A; Tue, 10 Oct 2023 00:04:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59DEAF8027B
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 00:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59DEAF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=VcIXLQvy
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-277564f049dso2937696a91.1
        for <alsa-devel@alsa-project.org>;
 Mon, 09 Oct 2023 15:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696889086; x=1697493886;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OMGseJH3xVpjS3Dz1XvWa31fmlgKwg7+vZGsOfoEaiI=;
        b=VcIXLQvyOov0d9u1wjP0BaZ+chrmDCg+x44Zbv5+JbQ+R2mJbTK4FaB6MDu20wqR5/
         g23F0mG6dXlFB6KFuxBKy6/mpPLqCtichscHZsGQb/e8u8UN+40MnLaeElnc/2452s8U
         Id8tyWHFGvdL/VzbI5itJeCRFhJRKTuBEcQDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696889086; x=1697493886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMGseJH3xVpjS3Dz1XvWa31fmlgKwg7+vZGsOfoEaiI=;
        b=GIbPoL4qAVYuhZAdMzrLj01H0tHB1I0NF28Wp+t0RuFInK/UZVhpD4wPFUA+NsXvgo
         bvVvNbHwK77DSlriSHyBg6aqN4eaytktXcyoRch7p72EkuPzDcbA7/DYX8GhqMyW7esj
         2kuKoMAwaZK6fO488BztUxOCFi4E+jMGAQRHOWiMi/3get3nbxHzMNNImg23XR3Gj4bC
         3Ko16jTQaiX9x9VzuG9mIGMwtJsIWpzLGEnKsllz3DRLBFssCe7mMjYhE4ZOwZmtE1K3
         5hZ+QT/YanbwTEeUayLaCQhBkFpl04v/u3sZvB+lBep5Mb6oTW5O2nWhrW4HubqrABVc
         xk5A==
X-Gm-Message-State: AOJu0Yznx3K4AT3CM64T2xVY0LbprSsCCh18BD7XcpKkgs1a9N54c+SX
	YhUwme4Y+4AayOI1iQc0OREom4cGLMaGjToHVzA=
X-Google-Smtp-Source: 
 AGHT+IFwi/Hx77Qov3jXx2LoubrzaSvq6vp4/lVzgPmZBiOZdmu2RVJwmuDRCsMOZxlgxrP9y1bTLA==
X-Received: by 2002:a17:90a:9205:b0:267:f5d1:1dd3 with SMTP id
 m5-20020a17090a920500b00267f5d11dd3mr13172366pjo.11.1696889085748;
        Mon, 09 Oct 2023 15:04:45 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a170902e5c400b001bf6ea340b3sm10155489plf.116.2023.10.09.15.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 15:04:45 -0700 (PDT)
Date: Mon, 9 Oct 2023 15:04:44 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] soc: qcom: apr: Add __counted_by for struct
 apr_rx_buf and use struct_size()
Message-ID: <202310091504.0C46189372@keescook>
References: <ZSRw6RNi3Crhd32H@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSRw6RNi3Crhd32H@work>
Message-ID-Hash: GPKG5XZLU43HUGUYJEWESEUM4JT6VVPL
X-Message-ID-Hash: GPKG5XZLU43HUGUYJEWESEUM4JT6VVPL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GPKG5XZLU43HUGUYJEWESEUM4JT6VVPL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 09, 2023 at 03:30:17PM -0600, Gustavo A. R. Silva wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> While there, use struct_size() helper, instead of the open-coded
> version, to calculate the size for the allocation of the whole
> flexible structure, including of course, the flexible-array member.
> 
> This code was found with the help of Coccinelle, and audited and
> fixed manually.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Yup, looks right.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
