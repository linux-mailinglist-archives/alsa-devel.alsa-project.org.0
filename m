Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE18527F33
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:07:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DBE216B5;
	Mon, 16 May 2022 10:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DBE216B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652688436;
	bh=gGCJAro/EEvZdKRASvvSmxNaUsz3RkUIHeQcUhJauoE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aHgCa29rH0XdHpto3gcLIfkD7smkvoS9GGuV0LnJLbFQSmsKjPUngPgNuMb8wdfBJ
	 2jm8DhsffI8azHBn0gKQLIzAT0XOX10mHS8AEv9+RKi/oE7VKpXKCwou9woaxkXGHC
	 3IgAJ9/m3lfcnmPclWt4j4ht6hgHLFKc2tfeTLX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A51FF8053D;
	Mon, 16 May 2022 10:03:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C73C7F80245; Thu, 12 May 2022 13:10:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73DB7F8010B
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 13:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73DB7F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.b="Usvq3FnQ"
Received: by mail-ej1-x62f.google.com with SMTP id i19so9442404eja.11
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 04:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=63TDKIJsFtOS/DXIb3WtgkfvcQzEXqcjOyVr2jqb54g=;
 b=Usvq3FnQ9GXr1MzKxpo62PSGW4NqFiN6LixFSNJsFFLfa0JSzfO8liMPHUrcIRHxUu
 dWe2SR01XzUYrhQPOH4VcjnrQ8uJEiUS7quyQSAim76+3Yti3jSLcDRem8YN4eYNynAK
 xwt0PzMF6gVV+OitQGQUm1AUv2fS/I3GIh5I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=63TDKIJsFtOS/DXIb3WtgkfvcQzEXqcjOyVr2jqb54g=;
 b=nYb/+37ftRgSc3B3aC9skfQQq2hQ1rKqDwHBIkdRJsznsN2Gabyv+DzXwRxoq9aACq
 RMEp4pBuJiVMi0JHtojyUlm+OGjJ3oGPWS9lZ/TcVfI4N0rYEoWfGowUyOdIji+oadAG
 W33P81/877cl5xEY2XI+UYyvvW6lO7q82tZP5HuYU4Rs0vCPolL8NXMQfXYs3IMIM5Hn
 obeai4WpIE022gXe9HtUuwLu2FRd2DxtwZZn+RrK5uKZ/51uXI0g58CJ1rQvANiw79bk
 9+QEXyp1lQmnQS4z+GwfiRHU+AGjkmsGPLj1ElHptsZxQiosGtKiDqBd4KvgHFchZhpg
 1GEQ==
X-Gm-Message-State: AOAM531nxyEZRZYsZYNrxcJx36bZSuh5qgIj4gpvmrb1yT9QaTanqgDO
 t6O+m27ri3ECd0XvmobEmuFB7A==
X-Google-Smtp-Source: ABdhPJwbN0DndoP+G6HJ6OXeD58gLSzwQHv7EZjWb8yzL1y8kHpHA//NGkSaVITaTMps4V9vzHT8aQ==
X-Received: by 2002:a17:907:6e07:b0:6f4:d185:9f57 with SMTP id
 sd7-20020a1709076e0700b006f4d1859f57mr29890450ejc.668.1652353801609; 
 Thu, 12 May 2022 04:10:01 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i
 (net-188-217-59-245.cust.vodafonedsl.it. [188.217.59.245])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170906494300b006f3ef214df4sm2021115ejt.90.2022.05.12.04.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 04:10:01 -0700 (PDT)
Date: Thu, 12 May 2022 13:09:59 +0200
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: max98088: add support for reg_4a_cfg_bypass reg
Message-ID: <20220512110959.GF649073@tom-ThinkPad-T14s-Gen-2i>
References: <20220512074359.446999-1-tommaso.merciai@amarulasolutions.com>
 <YnzdcubW7m+CwnvN@sirena.org.uk>
 <20220512104642.GD649073@tom-ThinkPad-T14s-Gen-2i>
 <YnznExLDOvRpXNVh@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnznExLDOvRpXNVh@sirena.org.uk>
X-Mailman-Approved-At: Mon, 16 May 2022 10:03:51 +0200
Cc: alsa-devel@alsa-project.org, linux-amarula@amarulasolutions.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linuxfancy@googlegroups.com, linux-kernel@vger.kernel.org
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

On Thu, May 12, 2022 at 11:53:07AM +0100, Mark Brown wrote:
> On Thu, May 12, 2022 at 12:46:42PM +0200, Tommaso Merciai wrote:
> > On Thu, May 12, 2022 at 11:12:02AM +0100, Mark Brown wrote:
> 
> > > These look like they should be DAPM controls since they're controlling
> > > audio routing but they're being added as regular controls.
> 
> > Sorry again. You suggest to create a new structure for these entries,
> > for example:
> 
> > /* Out Bypass mixer switch */
> > static const struct snd_kcontrol_new max98088_out_bypass_mixer_controls[] = {
> >        SOC_DAPM_SINGLE("INA Switch", M98088_REG_4A_CFG_BYPASS, 7, 1, 0),
> >        SOC_DAPM_SINGLE("MIC2 Switch", M98088_REG_4A_CFG_BYPASS, 4, 1, 0),
> >        SOC_DAPM_SINGLE("REC Switch", M98088_REG_4A_CFG_BYPASS, 1, 1, 0),
> >        SOC_DAPM_SINGLE("SPK Switch", M98088_REG_4A_CFG_BYPASS, 0, 1, 0),
> > };
> 
> If that's how they fit into the routing for the device, yes - you'd need
> to define the bypass mixer as well and set up appropraite routes.

Hi,
I added this reg as regular controls because this reg is pretty generic
as you can see this controll bypass of some output, not all. 
What do you think about?

Thanks,
Tommaso
-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
