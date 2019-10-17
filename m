Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE903DB785
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 21:30:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31E6D16B1;
	Thu, 17 Oct 2019 21:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31E6D16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571340614;
	bh=XC5jvDMtO6P9H1jBAgSCw2y52X5kgCUDNmtKoi9Ky4c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fW73A/TGkjOcr1i57THqk0oJAA+A/8ZFPGJsua/U2BpdqmDej+5RSxHTt5w7+LO9+
	 sbutgmZb7M30gmzFit3vwY2NZokQRN8gchfAsD4U90t92I30Wq+qH0as9bv4sYse6F
	 ATt4mVVUPK5jwGrMDZfS5V6cTe6XvXeEw7Gwkb7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35D1DF804AB;
	Thu, 17 Oct 2019 21:28:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC8B2F804AA; Thu, 17 Oct 2019 21:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18973F80322
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 21:28:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18973F80322
Received: by mail-oi1-f195.google.com with SMTP id i185so3147439oif.9
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 12:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SqAFHmUiEpU5rAmf8Tug9HDaQyGE8/7zvO3FldJ1AqM=;
 b=nyUYabKzQhSF6b1HZicrB6NbkmJIdEQqs6f+EHyv9H+8+Ljxa9tmUwPKoFN4BDJaGt
 2bqHthrCxCjAcQfAyuGWJZ1PUUQfW1/U+XQKvW83U56hM3FbGJa/y2cUGaUPSgX+Zt4S
 qzciOJHOhqx0Iv7uvkjKxZ2xXipXd+oDl81fYGxYv7V/OnKSVV+rbRVEf7+uRL4q/EmT
 6kv6D/G/XAyNfoUs17NA8AMq/C76ffZ7ZzJA+dAYkCmebPfmVoLQSy57jCqtGwfT3ePO
 QHE7BVlOt4CdKyZHZM+p5vYskjIMskoGeuoGNSCkanqn9tG5pUAfVWQ0xk0Itgq2FE6g
 Zrpw==
X-Gm-Message-State: APjAAAWyKpUnXvPL9go6LvaKSXgPc/cHFOL56e4y75nWmdVxjiw/w4u5
 jE1vKHnM+2CMTlN1EmtcUg==
X-Google-Smtp-Source: APXvYqwB11uurv4LKiBTMRl3GG7b35sfh5jfB3nvxXh730JUGJ8/aXCy41c7F0cQoRKMXbYcf965bg==
X-Received: by 2002:a54:4582:: with SMTP id z2mr4497593oib.53.1571340495419;
 Thu, 17 Oct 2019 12:28:15 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b31sm818240otc.70.2019.10.17.12.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 12:28:14 -0700 (PDT)
Date: Thu, 17 Oct 2019 14:28:14 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20191017192814.GA11356@bogus>
References: <CGME20191017100534eucas1p1407cf6ef5606d6bd6a4140502cc95984@eucas1p1.samsung.com>
 <20191017100529.4183-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017100529.4183-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, Maciej Falkowski <m.falkowski@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

On Thu, 17 Oct 2019 12:05:29 +0200, Marek Szyprowski wrote:
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
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
