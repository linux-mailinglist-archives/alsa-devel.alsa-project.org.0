Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B634952F7E8
	for <lists+alsa-devel@lfdr.de>; Sat, 21 May 2022 05:14:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 374F216F6;
	Sat, 21 May 2022 05:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 374F216F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653102893;
	bh=FZd13pZCFQKmh70x0NcIe45LpnT6IDRPv19fzQBfHRQ=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NC1zTYTqoFx+2JoBO4/HbGHhLfzlyzwPPRc0lVkSjGIZQJX0HhvnwTE98jFFChE/v
	 zdyqlXFxsPeeSlki0f2aA06yCrolD0NPlrTZZomxZm2WMu0CRl8zsHwOWxF1g0X0M3
	 WljoZwGCSvUM3LAvNkFVl2MbMESC0JGlyKdJ1i8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A1DF80212;
	Sat, 21 May 2022 05:13:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94057F8015B; Sat, 21 May 2022 05:13:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65DB5F8014C
 for <alsa-devel@alsa-project.org>; Sat, 21 May 2022 05:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65DB5F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="cLDsvBQl"
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-f1d5464c48so12309509fac.6
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 20:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=z9YTOjtD+Dp8ysX3Zqk41W0+lPLgTo0iBxjrvvqtCBU=;
 b=cLDsvBQl3CZnZjmn3PmDvOxQs7A+4qpMSGeH+GcvPeqE6Rvcs0ccD3rvO0oo6H8M4v
 yEhmbpIEQToKgIxmIMitMFetTqQiY55KOQGQWEmS9133pgxN41HPQqgKkrwNCHndBuAT
 h66dGug5YTy2lURMzBPiPK2i5uxrMz3oPziA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=z9YTOjtD+Dp8ysX3Zqk41W0+lPLgTo0iBxjrvvqtCBU=;
 b=Sk+fRWdaqClC3f5cXeTWzMfcdVgW3H+aZXjPF158O//l2NbjzDt2FuJjCiinOLKPb5
 4EBBVTNj0Kt+QOMqmqTlXemh8JMVvN86eTF0Qx8sjctzXOmpxP493jqW2A5NyqSiRM4y
 qlIThN+IcCxZUhWvdAgol0lMskLfKDDJWUt+EFMXyuamUEJb5EjEacHKT1+HBqq2OeBT
 G4Trn74iARD+2f2MxhOCQOcGrOWIDP2Y5P5CPUDyAscmg3FIhkwZe156jU89oqcUy7cx
 13RHDg1qItXKxHIZLh7r/2H/fQuL+35cMjAftyytdD58kAAg6qfHoREgJs2jad0ba838
 5BPw==
X-Gm-Message-State: AOAM530VAGyxc/K/EvPjfyhgU77601Gsajx+9dNWzPuHlXO5jrDkdUV+
 sCbbKnzQ4nR7olsNOTehf+pCcEsnAN7U++mWohWVRg==
X-Google-Smtp-Source: ABdhPJyIw+llNRTQ/iWjLecfnj7stFoJrXY3wx+LQdTK0mDBx0mttcqVey3oWixUE9g2fqdMqfohHlynJ4sBtrZiqhk=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr6985165oap.193.1653102821168; Fri, 20
 May 2022 20:13:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 May 2022 20:13:40 -0700
MIME-Version: 1.0
In-Reply-To: <1652877755-25120-1-git-send-email-quic_srivasam@quicinc.com>
References: <1652877755-25120-1-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 20 May 2022 20:13:40 -0700
Message-ID: <CAE-0n53g9rWks+euk5KHBzmJNEB3xLbJzMgCxN52DO5x+9-Wgg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: qcom: soundwire: Add support for controlling
 audio CGCR from HLOS
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, bgoswami@quicinc.com, bjorn.andersson@linaro.org, 
 broonie@kernel.org, devicetree@vger.kernel.org, judyhsiao@chromium.org, 
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 quic_rohkumar@quicinc.com, robh+dt@kernel.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Quoting Srinivasa Rao Mandadapu (2022-05-18 05:42:35)
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index da1ad7e..445e481 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1333,6 +1337,10 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>         ctrl->bus.compute_params = &qcom_swrm_compute_params;
>         ctrl->bus.clk_stop_timeout = 300;
>
> +       ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
> +       if (IS_ERR(ctrl->audio_cgcr))
> +               dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");

Why is there no return on error here? Is the reset optional?

> +
>         ret = qcom_swrm_get_port_config(ctrl);
>         if (ret)
>                 goto err_clk;
