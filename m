Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC394CBBBE
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 11:53:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 233371A2D;
	Thu,  3 Mar 2022 11:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 233371A2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646304821;
	bh=kYd61QzL8LFDJ8X94pCoPLjTA1e3xpkd4KGQZXgFad8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=urerGPAx9WZ+y/nUoZn0RXE0b30FR7A4NxTkc9o24DMMWvMB5AjUMie0zoulD0vl7
	 1ApZ3G9NexWaKx+twCxuFX5jTo4HPe4X65i5mJ9C5pcceVjY/piCtBVYV0unqsDG8x
	 N9PONusDAK73sHMKhZAA5Jj4mvspP3iKllaeCPw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FAD1F80166;
	Thu,  3 Mar 2022 11:52:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBA60F80152; Thu,  3 Mar 2022 11:52:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE0F5F8013D
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 11:52:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE0F5F8013D
Received: by mail-vk1-f176.google.com with SMTP id k15so2391340vkn.13
 for <alsa-devel@alsa-project.org>; Thu, 03 Mar 2022 02:52:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jy/eLWfmHZk4p4Njv6BVmkKZB0XpsQJckLrKwVAajxo=;
 b=UPCbKWhTGTsbLeJ8wWBqCly87ddDrlDb0wcK0GIb8ZALazQ25TJREqDFDTYWuBHdxf
 XC8GYb/Ha29xOXHxAPSgtru/3sXv8F4HmqaHDauNsiDEeBtjQE74MYKgKYbj2czUxGeh
 znCpcUmBKkZ3cM3CcCBK4hyOxhnR4rJ6lrjwnZZ2bLz2mArpi8iWKBKbA/bv041r+D9z
 KnG7LKVGxX56wSAsbpfvuDMEdKatLDGNyYemyJXQWav6t7FxMfVNtLD8pvY1GJ8DT82K
 /LTh4X6HRmCdGoM3w4ftuhfw14pBdIvvULa7cUGyfk+OIjjsMk6VkIKHhp6kF2TlYcVt
 Ne2w==
X-Gm-Message-State: AOAM533URfPotjU3lIftJNxmfN2oB1mYYsG/e8XwTzJGFShI7smwouZa
 11EQZHFAiwWQqoBK9uPtmezPqltul5JCpg==
X-Google-Smtp-Source: ABdhPJyxeQx9PmeKkYeZkwugAeP27TwR105gk0A9Hy+iCKa+WPb2q3orPLBd4EWYDLlT6iTXhtaUrw==
X-Received: by 2002:a05:6122:134f:b0:330:f4d8:22c5 with SMTP id
 f15-20020a056122134f00b00330f4d822c5mr14652261vkp.1.1646304740200; 
 Thu, 03 Mar 2022 02:52:20 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43]) by smtp.gmail.com with ESMTPSA id
 n22-20020a1fa416000000b0031e658fd080sm259040vke.43.2022.03.03.02.52.19
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 02:52:20 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id t22so5051434vsa.4
 for <alsa-devel@alsa-project.org>; Thu, 03 Mar 2022 02:52:19 -0800 (PST)
X-Received: by 2002:a67:c499:0:b0:320:2cd8:9e1a with SMTP id
 d25-20020a67c499000000b003202cd89e1amr2476378vsk.38.1646304739297; Thu, 03
 Mar 2022 02:52:19 -0800 (PST)
MIME-Version: 1.0
References: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
 <20220228172528.3489-2-srinivas.kandagatla@linaro.org>
In-Reply-To: <20220228172528.3489-2-srinivas.kandagatla@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Mar 2022 11:52:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYWs=PYLJhg54wDEcTzxMtkPn2dvL7_AdqxRVJn_JUGA@mail.gmail.com>
Message-ID: <CAMuHMdUYWs=PYLJhg54wDEcTzxMtkPn2dvL7_AdqxRVJn_JUGA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] soundwire: qcom: add runtime pm support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 yung-chuan.liao@linux.intel.com, quic_srivasam@quicinc.com
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

Hi Srinivas,

On Mon, Feb 28, 2022 at 7:13 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
> Add support to runtime PM using SoundWire clock stop Mode0 on supported
> controller instances and soft reset on instances that do not support
> clock stop.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Thanks for your patch, which is now commit 74e79da9fd46a597
("soundwire: qcom: add runtime pm support") in next-20220303.

> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c

> @@ -1345,6 +1399,105 @@ static int qcom_swrm_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *swrm)
> +{

[...]

> +}
> +
> +static int __maybe_unused swrm_runtime_suspend(struct device *dev)

This is causing build failures if CONFIG_PM=n:

drivers/soundwire/qcom.c:1460:12: error: 'swrm_runtime_resume' defined
but not used [-Werror=unused-function]

http://kisskb.ellerman.id.au/kisskb/buildresult/14704362/

> +{

[...]

> +}
> +
> +static const struct dev_pm_ops swrm_dev_pm_ops = {
> +       SET_RUNTIME_PM_OPS(swrm_runtime_suspend, swrm_runtime_resume, NULL)
> +};
> +
>  static const struct of_device_id qcom_swrm_of_match[] = {
>         { .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
>         { .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
