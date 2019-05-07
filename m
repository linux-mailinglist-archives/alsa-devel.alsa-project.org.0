Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2757515794
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 04:26:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD2221923;
	Tue,  7 May 2019 04:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD2221923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557196009;
	bh=+0pH/yy5uE47RiDDZQc09nwQPgNV16ScjUim6zbbiDY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=idw+J+lg/NWbUms+2awtVg7ygw3lp4ZsCyICLS2BtVmq+USFmPvGEP00qtoq24PPI
	 DhTGm7Z3Pir+LN7rv85mVabPaPkkiOqiLGVHfCw/tXJGRzUdLiOnWFAtAGoEXW83e9
	 etqkxb0ffC3MBUR8nsRo/7vToKYK/fWoupsSrqA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68B15F896DA;
	Tue,  7 May 2019 04:24:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C275AF896DF; Tue,  7 May 2019 04:24:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 570F5F80726
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 04:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 570F5F80726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Bns0Ectz"
Received: by mail-oi1-x231.google.com with SMTP id y25so4118064oih.11
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 19:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ENt8EH2AAnwBKCorpSXemefyGkNkcFdd76Kvn0m/73I=;
 b=Bns0EctzfedQpalxj+ZfwBrnI8ZtOQ3/N3ixrvIbT5nXLenik6VZUxxKdWfB18lZTz
 l3nzmIyPnXWgQ21B9uVy3vKuGTuKTw5S+4q9XCObk/ziGBvRoTsPW36reK51sWC7fZok
 BrCLD8yfUlGYzrVtHDldVmfZqgYlnBc6KiaxCK19X8nTCtb5CrT7/wJk90lLw2w+6ts0
 xBC3qfcxw9KiJBILYFaHM2hyIk/pKa5s32kY81F+OJKysmygMBTwGyjhYGboL1kxqs8t
 cYj9Fl2LhCmcarl0ArssFpmyt34UhTz6ApSHUwXzvOwc3bC1y36MIAxo0emuNofnGPx1
 hP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ENt8EH2AAnwBKCorpSXemefyGkNkcFdd76Kvn0m/73I=;
 b=CPTDVlSxVXCmRHoUjYwZEZLBtInz0R2KxE/VDpkyNntz76gpZdEcgdGRRvAB0+1nRz
 S/xa3KNIpJAQOvg+YuSvuxIwMrQzrI7i7EXvY21Kas1yGoNU+W4PS9Bmr68qDEByJYN+
 WuHA86ZbIUFOZLXvtR8mXF8iTS3YrKV2PKBfewdwGE8ZO2ddoFnE4olCI4ZdIYUl+le6
 wPPR1MZf/lGW1V7DvGiKfabLaQT8IWB0iHe7UXIyMkmsUwbx5eLcsF5OdsAupufld8Im
 johgE6z9vIE8N9SDmr6PJmcrsBL8s3R5Wpiz9NU9Ub/dhZZoCe5l7FHCilVQC4gXCGQm
 Gt6w==
X-Gm-Message-State: APjAAAUlvbc8jpenY5GMp76NXczGerGHgwOgCBpute2Rv2YFhXJzw9XQ
 b0d1ZXsFpdNj1N6T7WSx/ZGU4Srtyt+YDdcLHV8OHQ==
X-Google-Smtp-Source: APXvYqxDFhz3zuwYGZ7tCI6PtDhGBgsbl0VYgZTW61EsTkBcv+Uine20QXZFV3YEWb4Lpi368CvUqaZLnGfKujZezk4=
X-Received: by 2002:aca:b8c4:: with SMTP id i187mr861789oif.6.1557195889449;
 Mon, 06 May 2019 19:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <ee4a22c3491628abf94c8d356dccd67984604811.1555049554.git.baolin.wang@linaro.org>
 <20190418102606.AE0181126DA9@debutante.sirena.org.uk>
 <CAMz4kuLK_XS93Wpq+BkXVAJA3M+vFnL8pR0gR7aRpYxBzwLv9w@mail.gmail.com>
 <20190506134856.GP14916@sirena.org.uk>
In-Reply-To: <20190506134856.GP14916@sirena.org.uk>
From: Baolin Wang <baolin.wang@linaro.org>
Date: Tue, 7 May 2019 10:24:38 +0800
Message-ID: <CAMz4kuLdRspCGNFxATjzWXvBMwBGwXFczGUQKFEyiOSxGwaMcw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Orson Zhai <orsonzhai@gmail.com>
Subject: Re: [alsa-devel] Applied "ASoC: sprd: Add reserved DMA memory
	support" to the asoc tree
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

On Mon, 6 May 2019 at 21:49, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, May 06, 2019 at 03:37:39PM +0800, Baolin Wang wrote:
>
> > I did not find this patch in your sound git tree and the linux-next
> > tree, so could you check if you missed this patch? Or did I miss
> > anything? Thanks a lot.
>
> Something seems to have gone wrong at some point which caused some
> patches to go AWOL, not sure what.  I thought I'd caught all of them but
> I guess not this one, I restored it now.

OK. Thanks :)

-- 
Baolin Wang
Best Regards
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
