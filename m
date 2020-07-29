Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD292322A5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 18:26:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67FF9171D;
	Wed, 29 Jul 2020 18:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67FF9171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596039963;
	bh=bb4zuQGhtPo9xAh3UaRQ5Q1apxoMxdA4XPIwcRvHT/E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FUJVnP69BJjBKwYXae0qZdax5M7pYcbt+g0z7hai3HricIbXmHADvohBW92pmka5D
	 +L1mgsOWYaDIDEO4HFdkfi3Us1pfwXSx0NAAHsVjFneCJ+VGKVoty8zlsLAg+pB9Em
	 cJHwXxgzAiRGaM3Ji1ceczHkBK0WhDTcFVNhQbNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81702F801D9;
	Wed, 29 Jul 2020 18:24:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D0B7F801A3; Wed, 29 Jul 2020 18:24:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE0B0F80125
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 18:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE0B0F80125
Received: by mail-ed1-f68.google.com with SMTP id o10so8173645edh.6
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 09:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cS3+221AHZYDhz8vJwUJuKP1AL5RGbuh31j+wmF7oUU=;
 b=Xz1ITpV5+43tMJ5S1wehOsXHssP7GNrLfY31dvTik6teOTRS1jv1muh9gF4Y8+3amH
 UsTTInzrPADql3+hzvetaad9JF2doHmS9C9gk217cxuAS5DfoGvFX9YUZ/lOOssqru5Y
 1+1lHJrG2EUZ2GhzqEEM3VTAhiPxAFiQ/CZmxL9B9MWThkLC2QCI7/61J9YGBKpG9Oat
 b+4H6zAbnM+G9/s+iyd06mmokz4hkrbeY7EulU6D2qF2VHvHmEYz1AUrE4BUEwbfpLTW
 VR9RpHAPNyVJSbARaaTs9tOap8/iU6eHfL2puUzJdl3RBRZftbEj5cRqe+Gw10Xq2k6M
 aDzQ==
X-Gm-Message-State: AOAM5326LMMRTLVjqhtIKo4ZQw9blwL9nQbsrLBDc3OPnQI6LECN1M1c
 H/6TDJXUYLPS3ijY8lN02lk=
X-Google-Smtp-Source: ABdhPJzrXVWpA0e/54O+SdDq9PueVFgMc6upBS6jL4XfQLfXkn58bf/2j89VIVWgToUmT/t20TgnfQ==
X-Received: by 2002:aa7:d58c:: with SMTP id r12mr33304657edq.160.1596039847872; 
 Wed, 29 Jul 2020 09:24:07 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id dh16sm2193450edb.3.2020.07.29.09.24.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 09:24:07 -0700 (PDT)
Date: Wed, 29 Jul 2020 18:24:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 1/3] ASoC: samsung: Document DT bindings for Midas
 sound subsystem
Message-ID: <20200729162405.GA5302@kozik-lap>
References: <CGME20200728131126eucas1p16365622c52f91104373a2cd3e0ebb619@eucas1p1.samsung.com>
 <20200728131111.14334-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200728131111.14334-1-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: simon@lineageos.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, robh+dt@kernel.org, broonie@kernel.org,
 m.szyprowski@samsung.com
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

On Tue, Jul 28, 2020 at 03:11:09PM +0200, Sylwester Nawrocki wrote:
> This patch adds documentation of DT biding for the Midas sound complex.
> Partially based on the *txt version by Simon Shields <simon@lineageos.org>.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes for v3:
>  - change the sound-dai property type in cpu, codec nodes from
>    phandle-array to phandle
> 
> Changes for v2:
>  - fix wrong *-gpios entries in the example,
>  - mark sound-dai properties as required.
> ---
>  .../bindings/sound/samsung,midas-audio.yaml        | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
