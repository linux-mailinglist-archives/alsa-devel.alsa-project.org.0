Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAA74735D8
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 21:25:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C20418D7;
	Mon, 13 Dec 2021 21:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C20418D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639427151;
	bh=b1R+J4akPpoXXgsg1aCdNrM2aWuE8CC/t4BsN44FW4Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sFgkKD30wtCagtAZ9qxWhL62lkrnC+yPwzMwMtKk0l8VXyrW+Zs/JtneJ/kwT8cdU
	 Ko1bJ5NyJztf851JoMI17oetzTH5bYamMAmBORB9xXIsVB2OfbUrkOfuw8BHFfkoRI
	 QQhMR5nuqYW4a6+7Y76q9Mf5DJCc/DHkrqLy8iA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8949AF8025F;
	Mon, 13 Dec 2021 21:24:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04ECFF8025D; Mon, 13 Dec 2021 21:24:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78EE0F8013C
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 21:24:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78EE0F8013C
Received: by mail-oo1-f43.google.com with SMTP id
 t9-20020a4a8589000000b002c5c4d19723so4447317ooh.11
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 12:24:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LhGvUNDb2qUBD9rBv6rZtX1oyE5kPlCD9Eq4rAZyadI=;
 b=lV0kmBOVqohCv9wSfR/VeGjA6r3cCAtUVvOU2A/yI1i/mgKEHl8h3Dq8KsRRzYpZQ6
 WqP9MGhRYG3vOdy6MM0Kg+GylsHnZKe0cKhGVXYdPP20wX1QzWC4lzR636cdIJR7aXbf
 kEn5FDMqY9xunouMRHz8ebinaWcgEyPAAizCdXuZ83cyaGUlJuN7xn2uTgeD65I7TO4g
 NXFuwW3yEPy72b3K22gI6yxKjb3GwTgEVSjszLYMihZ3f0MCD02M0VWkb5nz0N1oaQj5
 A1h10T1aIv/9/hYCFOoL1Fi7b4x1GrMuU2/l4Y1plqKhclYlAQgM8QLhqfmnAbUYZ471
 JTaw==
X-Gm-Message-State: AOAM530fOSondZvkZeusfxfwgcpdL/b1lBV2jgMd84/f1Fb9+3cjPp26
 Wn4YHruN67xrMFo24ec1+g==
X-Google-Smtp-Source: ABdhPJy5CBy2AtPDJx7SyqPMKhOoo3LAEkkSR//lTbXBm8PXvKicjkSpnjUo6sr0bSpN5yZ4moOrFQ==
X-Received: by 2002:a4a:b24b:: with SMTP id i11mr492460ooo.17.1639427074724;
 Mon, 13 Dec 2021 12:24:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t3sm2398483otk.44.2021.12.13.12.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 12:24:34 -0800 (PST)
Received: (nullmailer pid 1510166 invoked by uid 1000);
 Mon, 13 Dec 2021 20:24:33 -0000
Date: Mon, 13 Dec 2021 14:24:33 -0600
From: Rob Herring <robh@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 4/5] ASoC: dt-bindings: qcom: Document
 qcom,msm8916-qdsp6-sndcard compatible
Message-ID: <YbesAWThTrpKxzZa@robh.at.kernel.org>
References: <20211202145505.58852-1-stephan@gerhold.net>
 <20211202145505.58852-5-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202145505.58852-5-stephan@gerhold.net>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht
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

On Thu, 02 Dec 2021 15:55:04 +0100, Stephan Gerhold wrote:
> There are two possible audio setups on MSM8916/APQ8016: Normally the audio
> is routed through the audio/modem DSP (covered by the qdsp6 driver). During
> upstreaming for the DragonBoard 410c it was decided to bypass it and
> instead talk directly to the audio controller using the "lpass" driver.
> 
> Bypassing the DSP gives more control about the audio configuration but limits
> the functionality: For example, routing audio through the audio/modem DSP is
> strictly required for voice call audio. Also, without the special changes in
> the DB410c firmware other MSM8916 devices can only use the bypass as long as
> the modem DSP is not started. Otherwise, the firmware will assume control of
> the LPASS hardware block and audio is no longer functional.
> 
> Add support for using the DSP audio setup instead using a new
> "qcom,msm8916-qdsp6-sndcard" compatible. It is basically a mixture of
> the apq8016-sbc-sndcard and the newer sm8250-sndcard, which uses
> indirect QDSP6 DAI links instead of the direct LPASS DAI links.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../bindings/sound/qcom,sm8250.yaml           | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
