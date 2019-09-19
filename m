Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27174B74AC
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 10:02:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F21A168E;
	Thu, 19 Sep 2019 10:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F21A168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568880164;
	bh=pULAgNhlaSudAG0g9pfqa0stf3Usb6KtFfObU11QYjU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OpS7v8z0E/0cdtIqa4n/UOAa7P4/0ejMFUVgKvR8oE16v6iEFy78ukpWiBJvk+ZyG
	 V9/Gf23Zg6Se4RWniC3rmscn5IgBAZaZ704BKS+iVnhIcyUyVlQ1SJ3oQynTVbK4ah
	 3CH89YYG7gqI39xcBJnInSEGpe5iXdrQQALD8RcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 865AFF803D6;
	Thu, 19 Sep 2019 10:01:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ED98F803D6; Thu, 19 Sep 2019 10:01:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56907F80307
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 10:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56907F80307
Received: by mail-wm1-f66.google.com with SMTP id 3so2783949wmi.3
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 01:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9l/Q4EUeY/MLFd+AQm4TkiqnhshHiOklBHU3BARdFdE=;
 b=oT5nJ7xVRM50e50Jl9jblwUevdembNw8UYiFZ8LpAnaNs0eSRN1gvaDn+xZw86N4rk
 toLPcrHB6cPaidqwzh3ak/jlvLP6n78juH/EjREYxkj6MdZzvnmHVLTMdXczVpKLLYTT
 Xi2J0LqWnDKKnWM0wgax5bAS4Pk0AsiU761i5chUXKNseip26PHKS8hH1achC4mE6npG
 f+hoVCY1f+5UfrhqtsTPvwOAqD/cfe8cT5pgBJJQfrkVZfE1hVzQp6ATvY777mRndWuM
 23uHbbheipkJbSPedYapXSt2Pa2OTZZ92INpVlkkKmwo2AOIoIbPmDLstiZp6nbV7zw4
 1IIw==
X-Gm-Message-State: APjAAAXXUG+JaB03fj+oh7tjVlXDwwm0jg+dwkixIbxzLO90kMmieKL9
 bC/oCvspLxB5jipi0KrXfIk=
X-Google-Smtp-Source: APXvYqwkmLUV4hPJJcWaqDDccNR6SsgGU7jssMHyEYDdwsyrDM+pO+zL1vqcxlXKfE+aZippLMXTaw==
X-Received: by 2002:a05:600c:291c:: with SMTP id
 i28mr1559297wmd.98.1568880094991; 
 Thu, 19 Sep 2019 01:01:34 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id u10sm15352265wrg.55.2019.09.19.01.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 01:01:33 -0700 (PDT)
Date: Thu, 19 Sep 2019 10:01:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20190919080131.GD13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104702eucas1p213070d06c69c4836d15d071b1926e60d@eucas1p2.samsung.com>
 <20190918104634.15216-6-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-6-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v1 5/9] ASoC: samsung: arndale: Simplify
 DAI link initialization
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

On Wed, Sep 18, 2019 at 12:46:30PM +0200, Sylwester Nawrocki wrote:
> There is only one DAI link so we can drop an unnecessary loop statement.
> Use card->dai_link in place of direct static arndale_rt5631_dai[] array
> dereference as a prerequisite for adding support for other CODECs.
> Unnecessary assignment of dai_link->codecs->name to NULL is removed.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/arndale_rt5631.c | 42 ++++++++++++------------------
>  1 file changed, 17 insertions(+), 25 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
