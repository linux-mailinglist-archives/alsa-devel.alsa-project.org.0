Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A4464FBA
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 02:58:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3BF216B0;
	Thu, 11 Jul 2019 02:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3BF216B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562806724;
	bh=qjP3zgos2vyE5hqA4Mzr/hWzCZ9m845cW7Zm654s+cI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tiDFSd8T43juldTrpPKf538Tm095MsjcjBUaf0rbFnf1btSWXwI+877qEJ5kxtHHi
	 CbP4CzusyH3iJ7XXhFl4DjJ1Sncww4F1nvDHwSz5pR7ph+Xvbvmi2K7YKagTPkAKN5
	 FzqOZBi1Kvq5XZnSE2t9+GpNV2s+0yEZEQA8qS0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1D48F801A4;
	Thu, 11 Jul 2019 02:56:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E36AFF802A1; Thu, 11 Jul 2019 02:56:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, ENV_AND_HDR_SPF_MATCH, PDS_NO_HELO_DNS,
 SPF_HELO_NONE, 
 SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D813F800DE
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 02:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D813F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="feDM+JzL"
Received: by mail-oi1-x241.google.com with SMTP id t76so3168028oih.4
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 17:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AalxJ/0/4/HhJ4tT+kKi8ndOcJn6LMuItEJqdKXAcas=;
 b=feDM+JzLX6ZYupFIs1WJex58Bh6TfL3ayl08gQisIdm7ErZl/DncNAUvnAIlLKOmUq
 e+6Ki1Ejt6mbzvwjUqNZT9GUqHKRX6lNivSrOZ/9XBP7J2XsQs+kfXlDOATp4w9+bhW1
 RojnFUs/1i5y52KZPkyQ4i/dvW21+afF0Kkeo6dP60akxJGHHWbiLzfSK/b5KdSmiyMB
 E4PJ1cau+i5Xz93yta5MXDbAHKurEkEbjwn4QqMDSuotETqP04+u6FYsyORTvOzNQybE
 EvIa/bVZnsFpM7uM1A+dEDg60AaU9eOWIFVWnrF7G0iah4Byc50A52zpAzL4tmMvakpA
 dn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AalxJ/0/4/HhJ4tT+kKi8ndOcJn6LMuItEJqdKXAcas=;
 b=ZsMgIc36wu9ADT7YUxy0rfIEnOUPfVWxxu/R/jtG6AaOtHrRVhWmBncz9A4wzLzxnU
 ZazpFR6m8weBM3bqlaatyHVi0zPQu8m0W2wNDqcZYLK2QbKTRJHw1y9ZVgYEgcttm+Wd
 1pzJfxgG5B2QBOZBhVysndqTV3+d2YaZkjJ9SS5g+eacuP8+XiOZyOLLSPoVPhdyfPz6
 i8N5lMCSJsh2flJxYBdnaaIu1aWuf/Z63jcPONsmaLOEWyHR7Yh+H6KJvx6PhENP0UR9
 jBZrPSCgYLeVrTPrMkvpcPTixxJuV2b8Fh5wRvzzzAozCQsxgpjBJw3JP1XpC0uSMNEk
 +8Pw==
X-Gm-Message-State: APjAAAWOC0Yc7nwzDfXHZUPWWbi+F/uIaWz5LJTQztXAtvaEoaewS3nl
 MAHVC0+1VY+EZQ6K/yRMCKGff257PuEviE++E82Eag==
X-Google-Smtp-Source: APXvYqzUq43i3qVgeErFkn+22Myvu3MI/Z5yKlci8Ref6fCz1j4jeuFWDBz+2XjUbAzKbthQs7NBdBR/53DRrdbqdNM=
X-Received: by 2002:aca:4d84:: with SMTP id a126mr769189oib.23.1562806602830; 
 Wed, 10 Jul 2019 17:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190710105119.22987-1-codrin.ciubotariu@microchip.com>
In-Reply-To: <20190710105119.22987-1-codrin.ciubotariu@microchip.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 11 Jul 2019 08:56:32 +0800
Message-ID: <CA+Px+wWa9MvK4UVqsrMGtSQ=ZUSQrX837JFma5EYdhu465YhXg@mail.gmail.com>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: ALSA development <alsa-devel@alsa-project.org>, lars@metafoo.de,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: codecs: ad193x: Use
	regmap_multi_reg_write() when initializing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jul 10, 2019 at 6:51 PM Codrin Ciubotariu
<codrin.ciubotariu@microchip.com> wrote:
>
> Using regmap_multi_reg_write() when we set the default values for our
> registers makes the code smaller and easier to read.
>
> Suggested-by: Tzung-Bi Shih <tzungbi@google.com>
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

LGTM.  Thanks.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
