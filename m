Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A6925635A
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Aug 2020 01:14:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBB3818D2;
	Sat, 29 Aug 2020 01:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBB3818D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598656454;
	bh=NAuYfTn7l2Olqc2mIK8A5IL35SDAJWKJAS/dDFuy/LY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lCrOT2H110/xSD126gZLFs4sCwbACdEgWdHRoRlv37aV0DfxLB2qoKieL8naEvuzu
	 SbOcan9/wMhvWHe7wVxcQ8fNSLy2ScGxVT14WjO7ILwjcJZdVBwMT1nBIyzERz4X9e
	 GOsYo2bRbwzdxkT/Ap8Zdfkbexen7ochmE4aNYms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E092BF80118;
	Sat, 29 Aug 2020 01:12:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7F6CF8016F; Sat, 29 Aug 2020 01:12:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70D3AF800EB
 for <alsa-devel@alsa-project.org>; Sat, 29 Aug 2020 01:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70D3AF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="DTx98g6e"
Received: by mail-pj1-x1043.google.com with SMTP id g6so257705pjl.0
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 16:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eTKdXiRCKS6tUmMOhEk7xSRiz3K0QjMIqXKfgOUTwVI=;
 b=DTx98g6eHjR9eWZ8L8pNZvzNzyyoyGJGoCSVzxnwe383QCEf6CiPXBYd7KGVxtcyWM
 imHYSMTzYzDKbP9GdybbwuCc5YWmZJB/nMyEkOnXnO1PMF4GDNLmCJ3JJQnnthHL+c6q
 B4VizqndaVWBqtihAlgf8low/9/yvPUV9bIiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eTKdXiRCKS6tUmMOhEk7xSRiz3K0QjMIqXKfgOUTwVI=;
 b=AxVyKb/19QAKgp9Yepp16K9ZwZC2RuHNPMtq1u4kEGfn9XavXRmMDFV9Sq3pTVJNTt
 Sqz/vxp61thIycxYRlZNOiGfT1+6gfreNeLo1mYGs70Jl0Sat5xb380DE9rJnNsHvcux
 nCCdBLvrEIxVqaHq/gxNFpPv1WtqPikVw6bGEhrkUXT+ennUDIj7yphGeSzLDgHLmUy3
 xj+88d7eFKY6ueGt7zlLCV9ZEh3fDy8FDM1O8zj4uLC22I9kyNQ+a0IwskmzOB1u9rHl
 a7KQSqisT4rJk7RhiLa1ZvqCm+recCRjQcmGRvqRCNtxFLNCuECXIyG80taLRyZijaF4
 oSvQ==
X-Gm-Message-State: AOAM53292v6TgB40anxZ65dTyfDQEhwG1AoHHt6ptps4F7+kIkYF8t3/
 WvkibAM00Y3MM1Qi5BuKQC7Bzt1vvyD8FQ==
X-Google-Smtp-Source: ABdhPJwVu33Bchz3j9SPnIwTilSVMCP4t6VJW47O4wFatMjRUOTNk21WctdSGp1UZeQoqKVPv1Ab2g==
X-Received: by 2002:a17:902:b486:: with SMTP id
 y6mr903874plr.100.1598656338714; 
 Fri, 28 Aug 2020 16:12:18 -0700 (PDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com.
 [209.85.216.54])
 by smtp.gmail.com with ESMTPSA id a200sm492002pfd.182.2020.08.28.16.12.18
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 16:12:18 -0700 (PDT)
Received: by mail-pj1-f54.google.com with SMTP id i13so262326pjv.0
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 16:12:18 -0700 (PDT)
X-Received: by 2002:a1f:d6c4:: with SMTP id n187mr874772vkg.65.1598655985575; 
 Fri, 28 Aug 2020 16:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200826110454.1811352-1-cychiang@chromium.org>
 <20200826110454.1811352-3-cychiang@chromium.org>
In-Reply-To: <20200826110454.1811352-3-cychiang@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 28 Aug 2020 16:06:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XaCt6V+VXfk8T+2mS4d5sKQzMC12AcH9a=MNkgguvmjQ@mail.gmail.com>
Message-ID: <CAD=FV=XaCt6V+VXfk8T+2mS4d5sKQzMC12AcH9a=MNkgguvmjQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To: Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Ajit Pandey <ajitp@codeaurora.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, tzungbi@chromium.org,
 Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
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

Hi,

On Wed, Aug 26, 2020 at 4:05 AM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
>
> +config SND_SOC_SC7180
> +       tristate "SoC Machine driver for SC7180 boards"
> +       depends on SND_SOC_QCOM
> +       select SND_SOC_QCOM_COMMON
> +       select SND_SOC_LPASS_SC7180
> +       select SND_SOC_MAX98357A
> +       select SND_SOC_RT5682

I haven't done any significant testing / review of your patch (I'm
mostly sound-clueless), but I believe that the above needs to be
"select SND_SOC_RT5682_I2C" atop the current top of the sound tree.
When I fix that I can confirm that I see the rt5682 probe on
sc7180-trogdor with Rob Clark's dts patch.

-Doug
