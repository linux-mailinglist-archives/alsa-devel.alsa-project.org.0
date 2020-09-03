Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A74825C753
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 18:46:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 255291934;
	Thu,  3 Sep 2020 18:45:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 255291934
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599151583;
	bh=+RN+tred1kejqXIdlddVwHGuj/QRKXoNuX9WzHzJ6+c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YCmnObEaHV3HM5e/qC5shk/+CzgJSYPOkS+lgZt124jcFQLhFXNjVYeT6GYoOIIib
	 WmNvg+ciU+sxO9gnRPoNluEd+nsAVLGyAw2AeXvKPN/ooYNgrA2eg1oHoN1nZen7Me
	 lr6BGvdKHAMnIMYyLCfdvUbjhSLH5hlKuCWRzdq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2717F80217;
	Thu,  3 Sep 2020 18:45:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF87CF8025F; Thu,  3 Sep 2020 18:45:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D38BF800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 18:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D38BF800F0
Received: by mail-io1-f68.google.com with SMTP id g128so3596231iof.11
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 09:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZP59A809vUXPKAmKCl/+/Toy2Yc+dTL7EkzSdpcrdXA=;
 b=KtKgRiiukdGBKskzZINnHup9+Z3R/mHdisqVvqgJ5d4REYv/q2eQ1CffBErRlIu8pV
 +WUtSkG4bi/37obedwRjWPor0wBlCvsT1l48dBZhg93uxteJ+zhqDZvWIl3ayUj9TRM4
 Atve+aBiN6h5H4S+yG869DN1u3XTlUqrbp0GVU3t75g4vquDNHn3tHoEttVDT4Lt75lQ
 m3RDHeoc9ifKCta8slevXXkgPE1VY0CUtFLCMtXCtTBHDVY2QIOoOs1HEG1jXP7xLHlc
 EbIIpt0gWUpGOFptimBmDnKQx85ykWowXaFV5wO772bxhA/gcIOATnG7E2eANm/sLs1k
 L1Ew==
X-Gm-Message-State: AOAM531ZYc9i0RrTlKNpPR4p4FRaND+OGOXML1ACQT6YxD0oMPn+/s1z
 Fq8aubmG9/FkxnK2+VSrww==
X-Google-Smtp-Source: ABdhPJz3QtFdJj9xf68T2MjYHLUlRhw4wqkk0yrCjfmHkP7HHKrqIxRy5KYmadUP48rBi4sy6gDkig==
X-Received: by 2002:a05:6638:d4f:: with SMTP id
 d15mr4016623jak.119.1599151518184; 
 Thu, 03 Sep 2020 09:45:18 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id p78sm1582218iod.0.2020.09.03.09.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 09:45:17 -0700 (PDT)
Received: (nullmailer pid 2928036 invoked by uid 1000);
 Thu, 03 Sep 2020 16:45:13 -0000
Date: Thu, 3 Sep 2020 10:45:13 -0600
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 01/10] dt-bindings: arm: samsung: pmu: Use
 unevaluatedProperties
Message-ID: <20200903164513.GB2925151@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
 <159897179515.47719.9922715760129781914.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159897179515.47719.9922715760129781914.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Chanwoo Choi <cw00.choi@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
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

On Tue, Sep 01, 2020 at 03:50:00PM +0100, Mark Brown wrote:
> On Sat, 29 Aug 2020 16:24:52 +0200, Krzysztof Kozlowski wrote:
> > Additional properties actually might appear (e.g. assigned-clocks) so
> > use unevaluatedProperties to fix dtbs_check warnings like:
> > 
> >   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: system-controller@105c0000:
> >     'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/1] ASoC: samsung-i2s: Use unevaluatedProperties
>       commit: 8187d8300251a99e40e288be80bef6a15b7b22e4

Please revert or drop. All these 'unevaluatedProperties' changes are 
wrong.

Rob
