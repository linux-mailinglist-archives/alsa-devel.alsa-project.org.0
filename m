Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC09B38B7FD
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 22:01:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53B5316A5;
	Thu, 20 May 2021 22:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53B5316A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621540915;
	bh=HvaQvXivO4hR1OdgoD5CMscGIZXrTvBzJX2J5sjQGd8=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LGzEWTCZUKnOMA3k+T2EENuyFzXHcougKV+2dHD6PAkt0AtHwj1ewOVvja3b6gfz+
	 m7AHqO5nOswsVoFZU+w1Mnesjgyv6KrwCcf9hlIFLWawb/AdcDxq68iuv46IlSJwLk
	 pvqm6GKvmzT8NSezMiikOdrOeaPILXaBEdNwu1Tw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74457F80229;
	Thu, 20 May 2021 22:00:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5DC4F80217; Thu, 20 May 2021 22:00:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F53CF800C1
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 22:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F53CF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net
 header.b="JWiESVFN"
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id D3783301;
 Thu, 20 May 2021 20:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D3783301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1621540808; bh=2WNLJX/xlZc5xTtT/m0BAIjR0dGVeWDMrn8wfYaNCUM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JWiESVFNzhYgP3LIrHH+2tY7pTjoh+gKnctlpgARBvgwBWg4BACU+o/zkUA8eRdPF
 jS85XmMhRO5jK77x2BlQkPxDSbCrzhxlhaMXvDctoM1+BMQOa0yL/SZHdunNPbhAgt
 4USigcfd0H+vMC4CmQMvwXkhr8hvfRf3UC0K6z2vi4HY7A5m+ShwS2LJ/UDdBlnsDP
 SPBGKoeOrTvsAjV7A36ox1hL3nOjKNp5cU8ATBlHyBRqSKzr5ElccrOeoSfEDcgg8h
 LH4udeqBoy+VzdXLKBnnbzSb6qpvpqwupJQPHnbWB4IHmqCdgQ0/NFGZsiTs5E64Wr
 JxMzmR3UeuhAA==
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 00/10] Documentation build warning fixes
In-Reply-To: <cover.1621413933.git.mchehab+huawei@kernel.org>
References: <cover.1621413933.git.mchehab+huawei@kernel.org>
Date: Thu, 20 May 2021 14:00:07 -0600
Message-ID: <87wnrtnpko.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-iio@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, kvm@vger.kernel.org,
 alsa-devel@alsa-project.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 patches@opensource.cirrus.com, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Jonathan Cameron <jic23@kernel.org>
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

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This small series contain a series of fixes for the documentation. it is
> against your docs-next branch.
>
> Three of the patches fix duplicated symbols at the ABI documents.
> There are still some ABI warnings from IIO, but all but one were
> already fixed at linux-next. So, hopefully, after having everything
> merged, the ABI warnings will be solved.
>
> Mauro Carvalho Chehab (10):
>   docs: update sysfs-platform_profile.rst reference
>   docs: vcpu-requests.rst: fix reference for atomic ops
>   docs: translations/zh_CN: fix a typo at 8.Conclusion.rst
>   docs: sched-bwc.rst: fix a typo on a doc name
>   docs: update pin-control.rst references
>   docs: virt: api.rst: fix a pointer to SGX documentation
>   docs: ABI: iommu: remove duplicated definition for
>     sysfs-kernel-iommu_groups
>   docs: ABI: sysfs-class-backlight: unify ambient light zone nodes
>   docs: ABI: sysfs-class-led-trigger-pattern: remove repeat duplication
>   iio: documentation: fix a typo

Seems like good stuff.  The last patch in the series, though, adds a
warning:

  Documentation/ABI/testing/sysfs-bus-iio:799: WARNING: Inline emphasis start-string without end-string.

So I left that one out and applied the rest.

Thanks,

jon
