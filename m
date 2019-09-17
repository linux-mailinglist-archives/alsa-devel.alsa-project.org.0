Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B84DB502F
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 16:17:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2B67166F;
	Tue, 17 Sep 2019 16:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2B67166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568729844;
	bh=rJA0kxinDZS1n5q/zrMPp2LDUuK8dZXJBrL6ukiCuH4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tgQ21z1qqL7THXk7ak4quxVAtvnt1Qj7pDHeR73XiPJutIq2jM9kM1DH+ZVTBJjkM
	 bUkjBmyWlw+adIoIlSPtuaxN3iTHsh+PtTRt+cT/vq7NM1vIBGS/kunVSBciqZQ7zn
	 L8eKrBtYnkow0yYLWV0ucDXxJoC8A0F7uSKFkqVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8CD6F803D6;
	Tue, 17 Sep 2019 16:15:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A41E5F80361; Tue, 17 Sep 2019 16:15:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CE66F80146
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 16:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CE66F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="w4/ghrVG"
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4DE22189D
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 14:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568729728;
 bh=+B3sRZPhkAukMdMBAYVICiPGgK/51bRCH3pDovTUbwo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=w4/ghrVGz+s1Xa8HKjmbSv+EFYoQomNvEU6uW/JCHc+xPgFpAla3Ef1Xc5bXWrW5B
 jhuTmBt1NGRBsA9acQjl2Py4L2JmtbGWUEhiSdVFNBg8ihClrjcR+9TNLOGfO7bkGE
 k+2UvRiT6gdfnian3dWHLECSTFJD+KRDO8Ckiw2M=
Received: by mail-qt1-f175.google.com with SMTP id u40so4538807qth.11
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 07:15:28 -0700 (PDT)
X-Gm-Message-State: APjAAAWacagYlUiCiehKZdl5MwfZfetUOamjfmMsqT8oi4QnUKi2sg0r
 SkXWnVbqcNxHxuTrPGth+M/FybgSQrQViYyyAg==
X-Google-Smtp-Source: APXvYqzA95YGsDAHuNNPxRimcQ6KIo1Xu3z8j8WHVokwnL8nyFMsfVMoZXe73MnOTmOXNpjhJW2nI4GI0hnrbY/hLoI=
X-Received: by 2002:ac8:31b3:: with SMTP id h48mr4019256qte.300.1568729727989; 
 Tue, 17 Sep 2019 07:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190917120634eucas1p20addfc4e369468561714f3c44d3d8bf5@eucas1p2.samsung.com>
 <20190917111413.22711-1-m.falkowski@samsung.com>
 <20190917120627.28357-1-m.falkowski@samsung.com>
In-Reply-To: <20190917120627.28357-1-m.falkowski@samsung.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 17 Sep 2019 09:15:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLwkVQ6VFYtUfOErA8vG2qnE+nquo_m5s0zLRqgn+bJLg@mail.gmail.com>
Message-ID: <CAL_JsqLwkVQ6VFYtUfOErA8vG2qnE+nquo_m5s0zLRqgn+bJLg@mail.gmail.com>
To: Maciej Falkowski <m.falkowski@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Sangbeom Kim <sbkim73@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [alsa-devel] [PATCH v2 2/2] dt-bindings: sound: Convert Samsung
	SMDK audio complex
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

On Tue, Sep 17, 2019 at 7:06 AM Maciej Falkowski
<m.falkowski@samsung.com> wrote:
>
> Convert Samsung SMDK audio complex to newer dt-schema format.
>
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - Added missing Signed-off-by certificate
> ---
>  .../bindings/sound/samsung,smdk-wm8994.txt    | 14 -------
>  .../bindings/sound/samsung,smdk-wm8994.yaml   | 38 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 14 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
