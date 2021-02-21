Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B1D3209AD
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Feb 2021 12:05:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FAE21677;
	Sun, 21 Feb 2021 12:04:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FAE21677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613905548;
	bh=19YL9I239qVJsl0oLWYW1RwHZDiR5XCOKdNUFtc7pis=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UDM0hCVc/8bFP1lmusuZLpBwCn2ifhUjhw50GEBgrVKhmkSWL61peWP1LJ9VPPuM8
	 RHAXj9Sx0odQ88vCXXxPU2xSnD9LBrZ8F4zMXJ/3uJHhhUgOo62CYjAA/WpLwvuJT+
	 d2DXw+n/VNLnUL8oZwehxjcQwTKqvSWw1wA1RNE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72E3AF80082;
	Sun, 21 Feb 2021 12:04:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ABD4F80082; Sun, 21 Feb 2021 12:04:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8395BF80082
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 12:04:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8395BF80082
Received: by mail-wm1-f46.google.com with SMTP id x16so10868327wmk.3
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 03:04:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fv1MGWHAHRfBei1NggEG7/yOVNuAnlJ9QR7t+JYrDik=;
 b=jR5gm4qhxCjHfdHmC9DNOK2s2NUgny32ECrbQbw2hK3xbX/9bdw03M/qHIhbMoaZzI
 +6bKqWGGp/Bux18IPK17dbrJlZEWJKQuFnrjD9zewMkg6mQFz4WgesJX3BtbcMbbVat0
 U1GC4EdayIpSWKGIJ+aMUD+X9Gq3XcgSZ3v8VZBrN4hwFPoE4IdoVRD0Lj+aYUx8Wwa0
 u7qdinSMHSrZGOWEIhRQgXmYbYj0yJP18E6ATuhVw/Ufy1K6gIOQl9bFE8xCRT9hA5OI
 jGaUn4fy6P2OkiMhQHZaoFJ0g34NAJHs4yMRh30nvQmNKkFnK3wK7VbfWtMYsdhaxW0N
 c/bA==
X-Gm-Message-State: AOAM533oNpIi3U8KG6zV0IYppNIgDEYdu0syfYpxWj/Vl9JIB+OrxaCV
 TR2hHiSEbN7Wue6WHYpwRx8=
X-Google-Smtp-Source: ABdhPJyfyWbkmJZfzYi4GbygYNWRV3xqEarldc+RWQBO7zsz8sC3/IvDrHIcF+QxhheKeSWN4r8VGg==
X-Received: by 2002:a05:600c:3550:: with SMTP id
 i16mr14685603wmq.170.1613905447170; 
 Sun, 21 Feb 2021 03:04:07 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id c12sm12750191wru.71.2021.02.21.03.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 03:04:06 -0800 (PST)
Date: Sun, 21 Feb 2021 12:04:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 4/6] ASoC: samsung: snow: remove useless test
Message-ID: <20210221110404.lx34nuac4gjtbzz2@kozik-lap>
References: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
 <20210219230918.5058-5-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210219230918.5058-5-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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

On Fri, Feb 19, 2021 at 05:09:16PM -0600, Pierre-Louis Bossart wrote:
> cppcheck warning:
> 
> sound/soc/samsung/snow.c:112:2: style:inconclusive: Found duplicate
> branches for 'if' and 'else'. [duplicateBranch]
>  if (rtd->num_codecs > 1)
>  ^
> sound/soc/samsung/snow.c:114:2: note: Found duplicate branches for
> 'if' and 'else'.
>  else
>  ^
> sound/soc/samsung/snow.c:112:2: note: Found duplicate branches for
> 'if' and 'else'.
>  if (rtd->num_codecs > 1)
>  ^
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/samsung/snow.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Fixes: 7de6b6bc1a58 ("ASoC: samsung: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer")
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
