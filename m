Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AEA59A2E0
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 19:26:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CE28828;
	Fri, 19 Aug 2022 19:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CE28828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660930008;
	bh=JhHcje9yYleMZ3ecjitQtSAT3TxoK/+DbnRDbF78uxw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sd4LXhRvzlivKqbGunpF0t8eVI9b4SRzUz0SECw9vh5inkzRqoDiHt/Q5pERM9FFg
	 aHJ+HjFD37esbKBrfcA+HOm4LiFZV9Df0TIARAXR2KYTWRUGHwgoG+S/bdbf1MkS8C
	 PlD0i90S90uokZMdmHC9ofLIOouRqETLYjUr/njo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50EA0F80217;
	Fri, 19 Aug 2022 19:25:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CC2CF801F7; Fri, 19 Aug 2022 19:25:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D606BF800EE
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 19:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D606BF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org
 header.b="m5eMFu3n"
Received: by mail-ed1-x52d.google.com with SMTP id u6so1379909eda.12
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=qzkYwMAvtyCh+8EMy7xCsIla1LIY8R7DNTHAUz0os4I=;
 b=m5eMFu3nPHM0b9xCXd42yvSzIy6NRnYZPewwOGO5BVMGgwKnDLOGfSFJDOIvU94kDL
 I8mrTDyDsaDg0cF+Dz6llUdBkgKXT9/8uXQuWDSafDakxnvBnEkaj4yEHMr01PLb8BuL
 5wk1BcBYzaPsFcEnW9qZJ1PgirWEPWk1qulXFs/eoulcGYsMpxoXxgBJsNwP1qYZDsy7
 DrQs/pNeL9Q9iftvFr+mtFfdErPj4wUwEu4sSbIdz8TR+gvILK7xLTyg/m/MtX9O0Tjy
 82cLDWBOIoZmPuZcMNmttdzYMs9IhrWe6EACiQPQNxHjiCdyVy8Dbf2fa+Y7ojJZoEur
 3Gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=qzkYwMAvtyCh+8EMy7xCsIla1LIY8R7DNTHAUz0os4I=;
 b=m0LwGqawavZnHG1CfGGU5jHCgY/oxmG72eUwrxV20CqRJGVgGbo/2+wZu1AvDXwaAx
 icvgfBa9G2NKAz0WQh3GeCUS88XbRc63Fx/HmRr9cDyCp7Y/w+RdfIkQcKxajNWLTkFV
 3TEAeeG6heecX74WyIB/l/yf+Ej03OdvqA8itoBxGcWl7JAXPp6r6lR3kaK5VDdfiB8g
 Ic3xKEwVQuZv/PlH7t9ejtKSRv6y16ocUbq/3K6CGJEJMOEqI4Q2h/t9pqpBTDRbDQen
 D3ghj16/J300l3z7gxsMchX21kkkZSH9fwSgo7D7hDGdlCz/XmBiiBitCbesG/IQgUTt
 zSAQ==
X-Gm-Message-State: ACgBeo33vy/Tv+uRyUMre6vdL6qBeY4m1US3+P/RfO4IVdqvDvv3UzPe
 kLUrX/ztwARy7zDXVVRipMlhhmbOp0VwPoRd/PD+Wg==
X-Google-Smtp-Source: AA6agR4xeUfyO9PUiWAnoGFIOuh+WIOVeXWdawvtypKh9M5LE6JbKb1hr9u1STK+EEhPb7d+ysfeAamEXb6BOH+h1eE=
X-Received: by 2002:a05:6402:50ce:b0:43d:559d:43f4 with SMTP id
 h14-20020a05640250ce00b0043d559d43f4mr6697005edb.325.1660929937682; Fri, 19
 Aug 2022 10:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220818035105.5510-1-steev@kali.org>
 <CAMi1Hd2uqbs7mmX+FbNxsnqxTCkBW1CbR3En5f+ov7XZ87qPrA@mail.gmail.com>
In-Reply-To: <CAMi1Hd2uqbs7mmX+FbNxsnqxTCkBW1CbR3En5f+ov7XZ87qPrA@mail.gmail.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Fri, 19 Aug 2022 12:25:26 -0500
Message-ID: <CAKXuJqjnoZh1azpdAk-QbPQsOK6bLf-RCng1PgA+p6esQj0g7Q@mail.gmail.com>
Subject: Re: [PATCH] soundwire: qcom: remove unneeded check
To: Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Oh perfect, I'm not sure how I missed that when I was searching.  This
can be abandoned but it's nice to know I got the fix right :D

On Fri, Aug 19, 2022 at 3:51 AM Amit Pundir <amit.pundir@linaro.org> wrote:
>
> Hi Steev,
>
> Thank you for looking into this crash. Srini submitted the same fix
> earlier this week
> https://www.spinics.net/lists/alsa-devel/msg146137.html
>
> Regards,
> Amit Pundir
>
> On Thu, 18 Aug 2022 at 09:21, Steev Klimaszewski <steev@kali.org> wrote:
> >
> > commit 1fd0d85affe4d6 ("soundwire: qcom: Add flag for software clock gating check")
> > added a flag for software clock gating check, however in commit
> > 33ba01788889666 ("soundwire: qcom: Add support for controlling audio CGCR from HLOS")
> > the same check was added without the flag, so we would still end up failing
> > the software clock gating check.
> >
> > Originally reported by Amit Pundir on DB845c, I also saw it on the
> > Lenovo Yoga C630, right before the splat, we would see
> >
> > qcom-soundwire wcd934x-soundwire.6.auto: Failed to get audio_cgcr reset required for soundwire-v1.6.0
> >
> > however, SDM845 has a soundwire-v1.3.0
> >
> > Since the flag was added in 1fd0d85affe, lets just remove this one.
> >
> > Fixes: 33ba01788889 ("soundwire: qcom: Add support for controlling audio CGCR from HLOS")
> > Signed-off-by: Steev Klimaszewski <steev@kali.org>
> > Reported-by: Amit Pundir <amit.pundir@linaro.org>
> > ---
> >  drivers/soundwire/qcom.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> > index 709a7c1e0704..b621f7fb866f 100644
> > --- a/drivers/soundwire/qcom.c
> > +++ b/drivers/soundwire/qcom.c
> > @@ -1355,10 +1355,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
> >         ctrl->bus.compute_params = &qcom_swrm_compute_params;
> >         ctrl->bus.clk_stop_timeout = 300;
> >
> > -       ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
> > -       if (IS_ERR(ctrl->audio_cgcr))
> > -               dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");
> > -
> >         ret = qcom_swrm_get_port_config(ctrl);
> >         if (ret)
> >                 goto err_clk;
> > --
> > 2.35.1
> >
