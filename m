Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF1C388D6B
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 14:02:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56732820;
	Wed, 19 May 2021 14:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56732820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621425769;
	bh=qpOUo/1OPomn6BOtbk0XucgyClN0PK62f+3ROHAjefQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BqTosWBQLHAJuNF0VZD3MH6ESGVhlsTc73t0Csp1jaMt+fmVk+PKqNYTAZQ6TJM6K
	 RN54gEOh9xcGAz57uYDTqn1lzqVw+0MTCXOjENk0i2Rng+4nqW69Gq9tblUGjg22NJ
	 wU/tsPtxwDhD54aR+fzjIVWO7LhzwuL5wJk9NU9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0E40F80246;
	Wed, 19 May 2021 14:01:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78FDEF8016E; Wed, 19 May 2021 14:01:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4644AF8014C
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 14:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4644AF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="I5W8vvf0"
Received: by mail-wr1-x431.google.com with SMTP id h4so13702238wrt.12
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 05:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FgJXe092fVJTVH6ejwO4wfc5Nc9nKe3wdraEnWWFM7M=;
 b=I5W8vvf031eATZORnhplLR5Z5aIn8yRnsj1y68iM6X1GLxuS7ROEvPVbg05UzCKw6t
 9A/y/d4++M/llKhrgs529Pj1AMxR2356tsl4ryWPROx/1BN3U13xGG4rGVd4js6UMTIu
 PWZNAqeWzyV+Fnz0Z0eqRaS3JJVPV4osHfCU5lifDlNUJ1tH8cHSMMCPY62Iy2ZP5wV+
 cEMUo99AzpyYZSw9LfLZeUxWOEjfaN3JIKho4nNfqz72Lwp/rs9eb6cW37Feu/ZaVX42
 Kl2WpYi7NnLzrOm5l1mS3RuUenpKgwz6t2q57XIdsCgyfokMEzUqPJn4HTuQn/72e/xO
 JCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FgJXe092fVJTVH6ejwO4wfc5Nc9nKe3wdraEnWWFM7M=;
 b=nVnu/0oJ+oY/zR7x/X2PhexwGkhvDnOpjFF4IQZqnqA5vi2C/zCPOn+8Vu64nL/zju
 EFHUB4RsgU+BNZOZ/4ggpzfts+icq4lDhQTIb4T4pN0PxLxXXCBkVUyhO46MP7kd7CoO
 j7VxNtorCVKW9bVRoBAzwDanCtj8Yk5Fdf3l6OFZblpwnfYNg/HsoWDjxYxrFHK+1RMu
 3KcHsX98X8QkObZrJ/3vbdEFdg9Xoe8s47VVqFdPiPoVE9WoQx/dg1sUJ1wsdoUJJ8y+
 MA0GDGrwXxvSMiPVU9JLUjGTbn1M4/NaXGbgT6lecP0sXqBcnVHH0ocjhov4aoXPAgIi
 A49w==
X-Gm-Message-State: AOAM532mKgarhBKOn/1u7cOV+tOLmB7JVn6ggNHBTRpigGfY+AuBVOx0
 0nHdRTAJkLMv35v7rypuiPsg2A==
X-Google-Smtp-Source: ABdhPJzZzi7cj4Z2N2iWHqnB6LB9e4qpIW3MroeSPIqDPZBR4QgtKyHCG66gmBBu17f7DS63HZkfqA==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr13669264wrs.276.1621425670866; 
 Wed, 19 May 2021 05:01:10 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id y14sm5509366wmj.37.2021.05.19.05.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 05:01:10 -0700 (PDT)
Date: Wed, 19 May 2021 13:01:08 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] mfd: wcd934x: add macro for adding new interrupts
Message-ID: <20210519120108.GF2403908@dell>
References: <20210510091239.2442-1-srinivas.kandagatla@linaro.org>
 <20210510091239.2442-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210510091239.2442-2-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 10 May 2021, Srinivas Kandagatla wrote:

> Currently only two interrupts supported is added in wcd934x interrupt controller,
> however if we are adding more interrupts the file will become too much unreadable.
> 
> So add a macro to make adding new interrupts easy and also convert existing
> slim and soundwire interrupts to use it.
> This is in preparation to enable Multi Button Headset Control support on this
> codec.
> 
> WCD934x supports Multi Button Headset control which enable headset detection
> along with headset button detection.
> 
> This patch adds interrupts required for MBHC functionality.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/mfd/wcd934x.c | 43 +++++++++++++++++--------------------------
>  1 file changed, 17 insertions(+), 26 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
