Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FCE221002
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 16:57:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A7481669;
	Wed, 15 Jul 2020 16:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A7481669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594825031;
	bh=GgPnYHpNm2oznfLx6IEpYwjUn3MMxbG0NfJb7a0V2F0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pV2nelAb4O7QKjJEJs8rn5mF4sax0M4oL+A4gNwBACz/Wzen6XgklagiSG/d6bT43
	 KpA605UEggrLBRk8UFz3/Rtk9FdkOKnfDdRIcfXZa8XGDVERhqg/Y6+SSni/GEbYwc
	 zrQ25Wgpa+O++FgTOKv0yNVLErBJyjdnn/SkoOo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74424F80113;
	Wed, 15 Jul 2020 16:55:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD3C0F8021D; Wed, 15 Jul 2020 16:55:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36C7FF80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 16:55:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36C7FF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mZ7zMteF"
Received: by mail-wr1-x442.google.com with SMTP id k6so3056908wrn.3
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 07:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Xx3joU+7lj4tPv3i1MBeu7gIGjv2jVS4xXq0wsixJEw=;
 b=mZ7zMteF9Dkbv4smJYU6GqQ+rNM4I9cTbn4pjKCwKenfFj3y8WMi6xF/5lDE87m0mn
 0ipw1YhEn3wMmPaqWymXg7qytDbvgBHRAmy0zz1wWns9j+WrdH3Hr0dkvY3bzZC8Y8cc
 rak79OzoglUWnTrb3nQGygOzoyTJ8+F0sb9OTXIRFkfcLdTB9yhGDUy+7aV9jFXsXhu/
 j6gvw1HI5lHnqNVrqLdvgwYJ0JR+kzUEHZqeYlDPG7AJFP8aMG2u4Wg0aXFp00ezS96E
 3TRB6il2spjRMxMrg0mN0LPgz0Dq9Og+iXFLR/R5sfl0SaYoRYSB/Hp4LCKsSAhE/EhW
 fA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Xx3joU+7lj4tPv3i1MBeu7gIGjv2jVS4xXq0wsixJEw=;
 b=L9mUS+X39PfGpb6lCSL07byUnzV8zsByozjyuN7wBDo6NJ7eX+W2FWzlQGVVHsNu5m
 XngkEgE8kQnH9LH5NF/9nrFjSE9o77WdNHjbrSY+4JltGyZBvkGGR+/JmV+xALYuANoX
 mpIub3U1wLmg4fojC0sbgAZ7dax+Sdh0LLsO1Y0guiVJfRrCsG/WodnL0F4fgQbCdr3S
 A8Qd9OsoqC3i74k+94hmtw2PfQGVGvnGkYGJq0S2gMiJgktk13RlcsVGd5DetLqJNC/9
 YsMPDWsDq37IqMesiB7KyHRNpv5ktfvjJ3Uu025pgZN5im5WOAQCCev7a2HgKRg/+W9V
 rUtw==
X-Gm-Message-State: AOAM5316gt5bPtObTleO8+kOlKgFwxLJvwUdl96lnkn/FrlufIgKFQqp
 nrIsLR7ZC7MDktjWM5yJwbrxZw==
X-Google-Smtp-Source: ABdhPJweQjLfl3Z2I4EIWZw8pwB7r6eyoCyj4BdjN5QJI5YwTdyLpOuupQoYb9sgXDe+xqjyl9/7CA==
X-Received: by 2002:a5d:628b:: with SMTP id k11mr11838681wru.107.1594824919525; 
 Wed, 15 Jul 2020 07:55:19 -0700 (PDT)
Received: from dell ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id c15sm3733251wme.23.2020.07.15.07.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 07:55:18 -0700 (PDT)
Date: Wed, 15 Jul 2020 15:55:16 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/1] ASoC: fsl: fsl-asoc-card: Trivial: Fix misspelling
 of 'exists'
Message-ID: <20200715145516.GH3165313@dell>
References: <20200715094447.3170843-1-lee.jones@linaro.org>
 <20200715142651.GA44014@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200715142651.GA44014@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 15 Jul 2020, Mark Brown wrote:

> On Wed, Jul 15, 2020 at 10:44:47AM +0100, Lee Jones wrote:
> 
> >  /*
> > - * This dapm route map exits for DPCM link only.
> > + * This dapm route map exists for DPCM link only.
> >   * The other routes shall go through Device Tree.
> 
> This doesn't apply against current code, please check and resend.

What is 'current code'?  It's applied against today's -next.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
