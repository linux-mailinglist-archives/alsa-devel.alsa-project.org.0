Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED97F413824
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 19:11:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2FF15E2;
	Tue, 21 Sep 2021 19:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2FF15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632244307;
	bh=VcGKhT2BmGcFIV/hqhfMYjGJ5bIMEZu7OrzwKNG+zwY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qWz/gPy0fr44vTQX2UJZAFeFRbkf48NQjlExU+5lLGR8rVwZmUvLR0iojAcFy6Qb6
	 PX76mOAgfMzf9p7f2BDgqGljqYKbpO3lj8KNKc2Y47TzzIlnurYzQAln0pOWa5kuSZ
	 P++oWnX+ksYd3f95hrBrm1UTTah6tH/qgeGR3uJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 134CFF8026A;
	Tue, 21 Sep 2021 19:10:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B89DF80268; Tue, 21 Sep 2021 19:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08F31F8011F
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 19:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08F31F8011F
Received: by mail-oo1-f53.google.com with SMTP id
 p22-20020a4a8156000000b002a8c9ea1858so3344907oog.11
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 10:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S4rWK627e6yBDbCEhLg6VsNoB81RgebdS3Ln+6wAGas=;
 b=JJRP9Nh18+UemuOR73GNeBQ/0WMM7/kSMUlGZ/VNkJOYrzIBdjC9oM0zK1e9AeWeq9
 Rz/MvXs/pP2R6d6gtXKDFx/sXWq2H2D9DVPIWGteN0n2pSqxA5wHHnQSD8o/ttkN0Mlg
 n4TDRQeFYPc1dULaRqSAtsqqlFUWve1d9nijPybokeVqmPQLxQXsKE7AnYjAkrwTn7fk
 KRYsePBSS61PedQTPOV/niXSqihGOoNkZ7v4P9ez3jswYh81twuQGYIaTGcImg9Dri1+
 zsY7mYd5oF3X2ZYc1t80o71Hm5Wc0q2ttr8A4k8c9ingIJYungi4DVdiwE5qIG5BXqTe
 pkjw==
X-Gm-Message-State: AOAM533FYO9+8eWphsJdfu553+eTk44IW3kCqDGmCL9g2Mz879Z8PYoS
 RZEeiINo9UXc8zirxJ/xKw==
X-Google-Smtp-Source: ABdhPJws4TdO+DPNS83SxM7XXfOVzOeooClPFMk6APULxosklf1aAoTwygi1il30jNMUX7PawpRkzg==
X-Received: by 2002:a4a:52c4:: with SMTP id d187mr10680196oob.53.1632244221024; 
 Tue, 21 Sep 2021 10:10:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h15sm372163ots.2.2021.09.21.10.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:10:19 -0700 (PDT)
Received: (nullmailer pid 2967390 invoked by uid 1000);
 Tue, 21 Sep 2021 17:10:17 -0000
Date: Tue, 21 Sep 2021 12:10:17 -0500
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Subject: Re: [PATCH 2/7] dt-bindings: iio: adc: add nvmem support for vrefint
 internal channel
Message-ID: <YUoR+Z5HEE56odzj@robh.at.kernel.org>
References: <20210908155452.25458-1-olivier.moysan@foss.st.com>
 <20210908155452.25458-3-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908155452.25458-3-olivier.moysan@foss.st.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
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

On Wed, 08 Sep 2021 17:54:47 +0200, Olivier Moysan wrote:
> Add support of nvmem. This allows to retrieve calibration data from OTP
> for vrefint internal channel.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
