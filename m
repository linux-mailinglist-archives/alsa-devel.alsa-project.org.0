Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7621E77DB
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 10:06:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5256017BC;
	Fri, 29 May 2020 10:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5256017BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590739598;
	bh=LKZzrM+l9OMB4esFD8ZN4IW1RFKvKR/dJC1crxtDzaM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e/ar1fVbKuaooV9Clgo3ZX6YWUhixwxG/fpn1T8DjOOnh44qDrRuSXMx1E2fX9BEE
	 V2KD8RCPvl9Ln6NnrSO3mBAX3kLmaWU3R8sdeK18MT3gNfYC9coIjYAGI2q1ykalJe
	 adW7+JWE7zhYllAqSXwRDcSCEkxQEo/98yRUlfIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E4BAF80107;
	Fri, 29 May 2020 10:04:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30837F8014E; Fri, 29 May 2020 10:04:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13655F80107
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 10:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13655F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MQJ/t30z"
Received: by mail-lj1-x244.google.com with SMTP id z6so1425330ljm.13
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 01:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Xro8I38WGB1vy4pn7r6IuOsUYoevHSF9a+82U3l5yY=;
 b=MQJ/t30zQcK6C9mw2k6k+xRtyvza3+g5NHHI4THl99n7ec9e17BtB1OzrvB3OB0g1z
 hjHnr9kYPJ2ZERhidkb3XANBk69T4Rko1VbwMrvGx8fLS0Ic+tvmb0XpEAk9YY6rQMTY
 ayDFinZWg5ZRmGs2MuOFArBSEAHcGNiI+u/6lGC+OLJ/mTmJEu88Be1AauOpQagHG+0C
 GNRD+wA8yFdvgTABgxdXFOlwvwnVh45gZH8raON/pp/zqqua/DgS0gO6J7XKsX1NiQzE
 jJoqqT4wAD3c6YO+T+InW1bDZsZpU/7PVAVAV7K1j+Y3YI41CVPPUeKGZbsJIY2iZ0KN
 U+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Xro8I38WGB1vy4pn7r6IuOsUYoevHSF9a+82U3l5yY=;
 b=GcfhWvLXQYGgzmTBZDwamsas8fuEzyhxcLkLMJ4Dtpsego1qOEpSE0QtlfB+fWXhmB
 BEIhYW9A1jhvNBhLVCPSY0pdhu2E0m0H2YvPtfZPQo8AHz+R6a9vXSXv0iVTTeB3Q3Xr
 +4hvpcS7M+vkQYY+6gRmV8951XZq3kF8kjOdvWS7B2O+dspx7/OQZy5p1XlXQkU+mdpy
 v3/drADR4q+F7o3z8e/J2gMXCegkUvxQJON+nnSnDdHTSqcwTJ6LQTHRGWHIlo+RH/D/
 FEuPUm1f9jexsFQcTI4Q6numEa/aRM9gwBu4y+WQLk+ZxZCtYBCNwILH0F5KqtiIqdqP
 YB3w==
X-Gm-Message-State: AOAM533ZokbsaYX4+sHWAMGe/Wo1HF/8ZEZ7cddLT53wHSCa6egfIXqJ
 Jrd/nyZm0V6vAHPdHcEovDHCWnvWbmNcPEj/k18=
X-Google-Smtp-Source: ABdhPJwyA+BHbVbYT1WVanqisX6tqpuXN2oOqrt/1LkU+5dRO5m92sc1wnozuX8q5uyeHHTICQA6kmzYrqyxuhrwL84=
X-Received: by 2002:a2e:5712:: with SMTP id l18mr1246986ljb.87.1590739487819; 
 Fri, 29 May 2020 01:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200528103942.17432-1-steves.lee@maximintegrated.com>
 <20200528115408.GA15800@sirena.org.uk>
In-Reply-To: <20200528115408.GA15800@sirena.org.uk>
From: Steve Lee <steves.lee.maxim@gmail.com>
Date: Fri, 29 May 2020 17:04:36 +0900
Message-ID: <CABff4NSc6oW9dt-2VbdKUnk=+8Tc52m8f2irr1P4_cGyXNq41A@mail.gmail.com>
Subject: Re: [V6 PATCH 2/2] ASoC: max98390: Added Amplifier Driver
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: jack.yu@realtek.com, ALSA development <alsa-devel@alsa-project.org>,
 ryan.lee.maxim@gmail.com, ckeepax@opensource.cirrus.com,
 ryans.lee@maximintegrated.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, nuno.sa@analog.com,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, geert@linux-m68k.org,
 dmurphy@ti.com,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 Steve Lee <steves.lee@maximintegrated.com>, rf@opensource.wolfsonmicro.com
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

On Thu, May 28, 2020 at 8:54 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, May 28, 2020 at 07:39:42PM +0900, Steve Lee wrote:
> > This is the initial amplifier driver for max98390.
>
> Please do not submit new versions of already applied patches, please
> submit incremental updates to the existing code.  Modifying existing
> commits creates problems for other users building on top of those
> commits so it's best practice to only change pubished git commits if
> absolutely essential.
>

  Thanks for feedback. I will send incremental patches.

> > Reported-by: kbuild test robot <lkp@intel.com>
>
> Don't think the lkp bot asked for this driver! :P

  Thanks, I will send split patch for this.
