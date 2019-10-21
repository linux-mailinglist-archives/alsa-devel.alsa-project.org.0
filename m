Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAACDE963
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 12:23:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59CD484C;
	Mon, 21 Oct 2019 12:22:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59CD484C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571653428;
	bh=ebL1YH4uid3RlK6FmsykK+n2HmiGHiTCzGJ/Iismw74=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kf4OIDr6eLOgCCI74Z+bG/Eg9Xv1+gPHSIdfoOLz0CSGpEqZhtS6Y4CkFw1lXn6nf
	 LAncoiFrZbgbHT5wj5coxa+xk5I+GqeZGEGmm+47MvslHUlnzxrS4FhZ8I62PsIMeb
	 K/RsMUKksqowKL7X738T4Jn//GQ00F/R29IFe3zA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E60BF80321;
	Mon, 21 Oct 2019 12:22:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A0F1F80368; Mon, 21 Oct 2019 12:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BF1EF801EB
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 12:21:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BF1EF801EB
Received: by mail-ed1-f68.google.com with SMTP id l21so9582337edr.5
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 03:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NTXwyuKPtae41ucu10e0jfWsFbRgsyPTHworMEWDZyQ=;
 b=dcBLaXFqfqvkMVvVkTUAojNLMbAS8n9WXeFchELjl2U0UIDpoXXNH2Lz8J8gfhDdCD
 OACuifLxK9DlbRaH2TfEmCTG58OhwVAxte0lTPyaDljkWTVhDYDMVe3j3TtTC1qdv7Ea
 x6P6IdngDaGMLvmD7/rD0NYFeTPb/TKCnQiYXD0FOHWjJXEPnVZ6M5m3mQeOVZF7K10k
 jpW4zwcP2DUHou0W1+BE8Ihj5oMkluE16cOGtXDnsew5NGdPaG79wgpIKuTSc5NkBWIt
 Ac32rWuUqoHZuAm6eTngEP4WjA+qLZsLmPh6I9rFXE/n0d3K8ZyzbeqJja3h1zq/b5cF
 Tlug==
X-Gm-Message-State: APjAAAUpKyNBb4ifb/xvKHcjzQ+0xbdD5gYe/QDl4L7U8WELwekrQaUw
 xIb//cCa0SqzIvwdIKoYRTc=
X-Google-Smtp-Source: APXvYqwXeK2/2BY3ORkuBAxMultEP+lVNX/1OoZXMoqOvq9xllY1syL/7QofFUXQ2efCb4ja3MbPsQ==
X-Received: by 2002:a50:ec0f:: with SMTP id g15mr24142459edr.59.1571653317618; 
 Mon, 21 Oct 2019 03:21:57 -0700 (PDT)
Received: from pi3 ([194.230.155.217])
 by smtp.googlemail.com with ESMTPSA id ay16sm181628edb.47.2019.10.21.03.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 03:21:56 -0700 (PDT)
Date: Mon, 21 Oct 2019 12:21:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20191021102154.GA1903@pi3>
References: <CGME20191017100534eucas1p1407cf6ef5606d6bd6a4140502cc95984@eucas1p1.samsung.com>
 <20191017100529.4183-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017100529.4183-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, Maciej Falkowski <m.falkowski@samsung.com>,
 Rob Herring <robh@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v2] dt-bindings: sound: Convert Samsung
 Exynos Odroid XU3/XU4 audio complex to dt-schema
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

On Thu, Oct 17, 2019 at 12:05:29PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
> to newer dt-schema format.
> 
> 'clocks' property is unneeded in the bindings and is left undefined in 'properties'.
> 
> 'samsung,audio-widgets' and 'samsung,audio-routing' are optional from driver
> perspective and they are set as unrequired.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> [mszyprow: reordered non-standard properties]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../bindings/sound/samsung,odroid.txt         | 54 -----------
>  .../bindings/sound/samsung,odroid.yaml        | 91 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung,odroid.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,odroid.yaml

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
