Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED846173ED6
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 18:49:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F58816E8;
	Fri, 28 Feb 2020 18:48:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F58816E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582912154;
	bh=TixKQq1AikWyPhXT9YHpbKFgI7V4TetvvUmIjcUCpPs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WkIHsi47ov6nduPrYfIntkSN7xMKAs/vTPK8JGcTShE9g7jg9YTg+3lFpT3dzsV2J
	 4tzmmOEpQcK9kxkX8bk+YocTRIQJOPn66U+2Rw/xghWVLlJYIroLAbE9E08hcZIEXy
	 S6CyFxEYhQ4rYEsKzEeXmyHRqNFOrAbJ0axrxKYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BEF0F80089;
	Fri, 28 Feb 2020 18:47:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65E47F80113; Fri, 28 Feb 2020 18:45:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CD19F80113
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 18:45:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CD19F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="I9phToTQ"
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD879246A3
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 17:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582911947;
 bh=TixKQq1AikWyPhXT9YHpbKFgI7V4TetvvUmIjcUCpPs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=I9phToTQsJpykSKcAfH4GE1MlEPcDh9ALUrH471gXGPTKkN0wWGPEzfFaH/uUk4Kb
 Pmk0o/uDZc3YQuoS7r0oiV2ulpBWlGO8KoPGjCyuz0Kgo6uOx7cPp+0QQucClPzek+
 e7jNtDwCmsOrStr6YdJSY/DDivxfkPiGJd6UIdf8=
Received: by mail-lj1-f170.google.com with SMTP id y6so4282652lji.0
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 09:45:46 -0800 (PST)
X-Gm-Message-State: ANhLgQ2D2Wc64rOxaMbC7WOXc/mmgEf//jE3I+ddPW09N1HP3lOTjVSQ
 8xnUQ5RfJ4Okzv9nKpWiA/xTWnDhFV1iJ7PHBXw=
X-Google-Smtp-Source: ADFU+vv5P7XBJ/Je+JbkoAnG9TjcRV6eyOW2OAzpsysHhynlOfi2t1apO7kCZmslnnvv8slmzCJXjuBPIQRruRUwBbA=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr1760343ljc.256.1582911944821; 
 Fri, 28 Feb 2020 09:45:44 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200228101124eucas1p1f6ab761a38f4a953a4eeed89859fcf4a@eucas1p1.samsung.com>
 <20200228101120.28819-1-m.szyprowski@samsung.com>
 <20200228161220.GB4956@sirena.org.uk>
In-Reply-To: <20200228161220.GB4956@sirena.org.uk>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 28 Feb 2020 18:45:33 +0100
X-Gmail-Original-Message-ID: <CAJKOXPdVRCtJcUS-jkAGoeOB5C8mBWPoZxmFNmg2On0STd6mkg@mail.gmail.com>
Message-ID: <CAJKOXPdVRCtJcUS-jkAGoeOB5C8mBWPoZxmFNmg2On0STd6mkg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: samsung: Silence warnings during deferred probe
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

On Fri, 28 Feb 2020 at 17:12, Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Feb 28, 2020 at 11:11:20AM +0100, Marek Szyprowski wrote:
>
> > Don't confuse user with meaningless warning about the failure in getting
> > resources and registering card in case of deferred probe.
>
> >       if (ret) {
> > -             dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n", ret);
> > +             if (ret != -EPROBE_DEFER)
> > +                     dev_err(&pdev->dev,
> > +                             "snd_soc_register_card() failed: %d\n", ret);
>
> This is completely removing the diagnostics so if things do get stuck
> the user will generally not have any hint as to what's going wrong -
> it's better with this sort of change to lower to dev_dbg() for deferral
> rather than completely removing the error message so the user has some
> ability to figure out what was missing.  However in this case it's also
> the case that snd_soc_register_card() is fairly noisy.

This dev_dbg could be achieved with ftrace for probe() as well. I
think it is quite common to skip all messages for deferred probes.

Best regards,
Krzysztof
