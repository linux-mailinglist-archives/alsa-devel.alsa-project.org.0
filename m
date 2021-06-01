Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DDD397AA7
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 21:22:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A32416D8;
	Tue,  1 Jun 2021 21:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A32416D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622575359;
	bh=+0GH9UNN80fFIz4cc3O39h1Um6r5aHzg2DXcrjJ2gts=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lsuHTI5pbXvaQ/0BFITPLkAi9XQsvj3ZgQ2Pxa64EguS+U4BuYy/+G/QDx4TIeJ99
	 Ijrrv6Zh/3sdAHJoEO+OvtZ2+YUCrVt/giTyn7eSnyw8HXdsEOWqavD7EIf63ooZwE
	 9aBP3c+rmFeVqCA2eXWEJ6UlYeNF0RecTCS1phIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 564A5F8025B;
	Tue,  1 Jun 2021 21:21:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C9D8F80254; Tue,  1 Jun 2021 21:21:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F04C7F800B2
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 21:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F04C7F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="MOHL6Rg4"
Received: by mail-pf1-x42a.google.com with SMTP id f22so324492pfn.0
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 12:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m15CB+ejyy1cEkOR8H2bWbxrq91PVD9VpCzkcmHk69k=;
 b=MOHL6Rg4BBPH5wiP7w1yra4HQYcxXWk5JaXhb8kOdJlrkaBNrVv7mmwsmtvCStcM1A
 OhKOQmGxSkEQcMAOjxfYcUHNTyz+O+AwoIjUhtVBIWwrbKhgzUiaGszsQnOPvxlZMj9S
 029lEjbq00R7EtmOTsV6VUMYldCmtYhQvZud8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m15CB+ejyy1cEkOR8H2bWbxrq91PVD9VpCzkcmHk69k=;
 b=unlBl7KhqfYe+D7re04Nsou5TdbbL49uXfTRkRnqVgY4WBbhKyHoNBsGrWC84lGRLD
 i+9JjdY0cDBusisKfYyj3EbzsuGHTFL7JOkrBOfDOhJKdMR99fd81LMAmkpFuHwr3/ZB
 VWSuTdJH/2fiT+0BoTdLyZudMcd2UCEply07v2JyDpw68T9evo5zOIoL94JiHtI/B+OI
 qZ0OFMv1q1nd/mEYvKXYKoa9NYII1vhDs61k2EQd00Ry67+oP5aImvMtbhwmb6QRTHHk
 3eL8K4yuyCUShGMRD+7ndrpMwMNIVwPqBUqp7ezCH4LU6FR3Xp11eFF3uoYaWo/IEU6o
 N7Eg==
X-Gm-Message-State: AOAM533YIGEWx8Qau67aipTBSA5MhCPV+2isK1zi3smFMehACJ3LLyOL
 VKdIXTOXDAIj6ClsCAzP2pQr5vaZ5DD2Jg==
X-Google-Smtp-Source: ABdhPJynQ1oAhjuOu6Yt5pPtGgDrZIwV5A6brhRT0bSHWLsB1ZGgvxq1cMuCHenAxXt3FQZ4B20oLg==
X-Received: by 2002:a65:4d03:: with SMTP id i3mr29670528pgt.422.1622575257623; 
 Tue, 01 Jun 2021 12:20:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id p26sm2507483pfw.178.2021.06.01.12.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 12:20:56 -0700 (PDT)
Date: Tue, 1 Jun 2021 12:20:55 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] ASoC: ti: davinci-mcasp: Fix fall-through warning
 for Clang
Message-ID: <202106011220.82270074FC@keescook>
References: <20210528202047.GA39602@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528202047.GA39602@embeddedor>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-hardening@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
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

On Fri, May 28, 2021 at 03:20:47PM -0500, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a goto statement instead of letting the code fall
> through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
