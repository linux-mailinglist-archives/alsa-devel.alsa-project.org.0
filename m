Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E2425C76D
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 18:49:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A24A1923;
	Thu,  3 Sep 2020 18:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A24A1923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599151771;
	bh=fgvrvS59jSgN+YToxsj2Nbt2XMbpHPk1z7zm+qtKIT8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sofviPBvbpgXAL84flBS2RIiNl3L5lnN8PuU9WYT2hO8v//KjByTwpFYSX+D5qo0s
	 q7r541ILZQ5GUmzFvaIDXGStEGnOAhvwZex3nvNSqDh5ia0xW9uVWiFMwZ9flHfOE1
	 NDVi6TT3srBmUrBaldV0YbIyiOLoYs9fBZpaag54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7FCFF800F0;
	Thu,  3 Sep 2020 18:47:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9F2AF80217; Thu,  3 Sep 2020 18:47:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2277F8020D
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 18:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2277F8020D
Received: by mail-il1-f193.google.com with SMTP id t13so3301859ile.9
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 09:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cpkYtO3goB70S5Zk4sLb1vXO3uhYcLt8YvepwZ1oACw=;
 b=OgiQrb0dJWL2TjGS3Vftcmu8gbvOA5rnePm077aX3dCrUPMdHNCDcTJ8Lr4SodEaFs
 kvNpuAZKwzDTvZNG+H4TdoBbn8birEmLyOdu2crQ2mioMNs9jqjoJfBqr2Fxf6UKDXOJ
 XPrj8SD01GNdVXFuDEUEjBPPumVMhts/IR3X02a+rGXlDuePKW0NamHNGplrs2LqGykH
 NDSsxgOMK9Ydo6n3NEyJLuaL654Bsd9BbEgHhmPF/5mqizjen/BGO3hUeE79SG8slrsd
 FYv29q8jb7xpraE9ED0d9JT7707pF3fha08w/epWvQVD1WjCeqXZPuvczgBVuWWPpxeY
 DQMw==
X-Gm-Message-State: AOAM532ga/18aWuY58w/BI4WMljT6CDMWVRiZBOITIlRfcsw5329ugqW
 6YidSp7pp/rzEo93uAq0PQ==
X-Google-Smtp-Source: ABdhPJzm0dZgqusi1IwGj/t8TXXA2VCoB4/ojBoVS5J1+GJ8RiWXpDpcvKXVi0SJpK3PWvduyYrVUA==
X-Received: by 2002:a92:60b:: with SMTP id x11mr3795331ilg.179.1599151659642; 
 Thu, 03 Sep 2020 09:47:39 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id h15sm1614283ils.74.2020.09.03.09.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 09:47:39 -0700 (PDT)
Received: (nullmailer pid 2931399 invoked by uid 1000);
 Thu, 03 Sep 2020 16:47:38 -0000
Date: Thu, 3 Sep 2020 10:47:38 -0600
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: midas-audio: Correct parsing
 sound-dai phandles
Message-ID: <20200903164738.GA2929052@bogus>
References: <20200830112633.6732-1-krzk@kernel.org>
 <159897179515.47719.6003518135515395142.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159897179515.47719.6003518135515395142.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
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

On Tue, Sep 01, 2020 at 03:50:05PM +0100, Mark Brown wrote:
> On Sun, 30 Aug 2020 13:26:32 +0200, Krzysztof Kozlowski wrote:
> > The "sound-dai" property has cells therefore phandle-array should be
> > used, even if it is just one phandle.  This fixes dtbs_check warnings
> > like:
> > 
> >   arch/arm/boot/dts/exynos4412-trats2.dt.yaml: sound: cpu:sound-dai:0:1: missing phandle tag in 0
> >   arch/arm/boot/dts/exynos4412-trats2.dt.yaml: sound: cpu:sound-dai:0: [158, 0] is too long
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/2] ASoC: midas-audio: Correct parsing sound-dai phandles
>       commit: 3e7ba1c0432ef9a792b9c77d36f78037626303b0
> [2/2] ASoC: odroid: Use unevaluatedProperties
>       commit: a57307ca6b661e16f9435a25f376ac277c3de697

This one should be reverted/dropped too. Patch 1 is fine.

