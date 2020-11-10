Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 901862AD2B1
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 10:42:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 263D416CF;
	Tue, 10 Nov 2020 10:41:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 263D416CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605001356;
	bh=tl5uo5wqeDQ09H5JMlBq0du5tMhgUZVt4o9ZH2GfrrI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gbrfx49aUqbljL3zss7ymqnclOnghhsFAg1gFr4UJQuTlhU+/ANPPcSxkHQbrmTwX
	 Wgzk++65PSiDpBzbdkNx8pzA4g4YW4IZciYqY+lo2MntTOWjxSznuUc3IOxrdFaLV/
	 fqKRP0FAgEgw+z8yqTcgPvkUyw2UV34+vlnTj0Vs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9014EF800EB;
	Tue, 10 Nov 2020 10:41:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D290F801D5; Tue, 10 Nov 2020 10:41:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 462D4F800EB
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 10:40:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 462D4F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="qO5mwF1J"
Received: by mail-lj1-x244.google.com with SMTP id o24so7219692ljj.6
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 01:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AXdt4/GVN4Y6ww6W0kBy4YLHXliyiP6kmKj8D1Wdz+s=;
 b=qO5mwF1JeGYhP/NW4uBHRxJwCTdGjTfHfchqISCSp2glgneKh+N0XQ6qPPIvY5RAc2
 oI0Qjx3dssYp2HnKfVuRxH+R9cmy5asjDX34qDK+PIVEG3npGguBzRWX3gNhCYdV3P3D
 nDAqGXR9CUQInuueX63CMmJNIk9QZLbY35+STE1FVcwdMXgb1AqMkm5GYy8MHz9atmyI
 N+AKEA1BC9N2eNYipwv3fQpRCHtdURnd5qnqF2oE60RosuX8WdvlPRJgTAKaQ0l2iZ7Q
 xR+ku5X7GnBhUJL+E4QYAQJrbPRQIyCVN5xMZ/XBoI2fLk75iI7GRVyk1g1vHeJOLFrH
 ddhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AXdt4/GVN4Y6ww6W0kBy4YLHXliyiP6kmKj8D1Wdz+s=;
 b=CGpRkngl3Z5z6o0wthl5sZY8DwTgLUW/kQKZ3HGZgN5BA6SKr9BXdCn1bgkWEKjXjx
 5fp0QahLoNmXb+OJw7srp56JkvBJuj65D2vfYDiDTrClAU7OlCvrzUd1W+LZ5nhPRPhX
 Ma9yoFw5qLP26R9ZzGcyBH2njsavJB93bzpm+DJbZP5j9cmdCeliOkcMRzisTqPmwWD8
 tPoOjqwSzc1/fB+PIn8OzMwFT0PsMXzap9IiaRK3B0SMQgA3lRRirBtFfsd2C6Ydx8Co
 VIiBXPjNYmTGgEUeSfV+MGQjCL7Vzb9f0arjkYewrl0om7hIfAR9YdH4cgdS1fZZRnM7
 VneQ==
X-Gm-Message-State: AOAM531doHqdGRaBr7qFTt3WIgN8RFQs6oY2l0lEf+3vy6KINo7FxHBY
 yg2hy8QcC3w9qH+cxpPcJCbq9I5/3nzheqML3n+6SQ==
X-Google-Smtp-Source: ABdhPJyxnYp8OqaXR3MO5Oeb6TIQXCDHSw6iz4a1K8EfahuJjytShDCZTNTXKb/a7OkIAAffzLbSLY5LhBt3p4R/yAc=
X-Received: by 2002:a2e:b54a:: with SMTP id a10mr7500764ljn.139.1605001251219; 
 Tue, 10 Nov 2020 01:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Tue, 10 Nov 2020 17:40:40 +0800
Message-ID: <CALprXBZCthdkxGbJBZZ+ESJRDBHY879FZMpB_4Mgpq1YAJun2g@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Modify documentation and machine driver for SC7180
 sound card
To: Ajye Huang <ajye.huang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>,
 ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Cheng-yi Chiang <cychiang@chromium.org>
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

Hi, Mark

Could you please kindly review the series patch v6? And may I get your
approval if the review is done.

thanks
Ajye

On Fri, Nov 6, 2020 at 2:14 PM Ajye Huang <ajye.huang@gmail.com> wrote:
>
> Note:
> - The patch is made by the collaboration of
>  Ajye Huang <ajye_huang@compal.corp-partner.google.com>
>  Cheng-Yi Chiang <cychiang@chromium.org>
>
> v6:
> - Documentation: Addressed suggestions from Rob Herring.
>   - Define "maxItems: 1" in dmic-gpios property.
>   - Only keep one example and add dmic-gpios property in.
> v5:
> - Machine driver:
>   - Fix a format string warning (Reported-by: kernel test robot <lkp@intel.com>).
>     detailed info at https://lore.kernel.org/patchwork/patch/1331087/
>
> v4:
> - Machine driver: Addressed suggestions from Tzung-Bi.
>   - Remove redundant judgments in dmic_set() and dmic_get().
>   - Remove 1 level indent of judgment of IS_ERR(data->dmic_sel).
>
> v3:
> - Machine driver: Addressed suggestions from Tzung-Bi.
>   - Move variables "dmic_switch" and "dmic_sel" into struct sc7180_snd_data.
>   - Remove redundant judgments in dmic_set().
>
> v2:
> - Documentation: Modify the dimc-gpios property description and examples.
> - Machine driver:
>   - Remove "qcom,sc7180-sndcard-rt5682-m98357-2mic" compatible
>   - See gpio property and use anadditional control.
>
> Thanks for the review!
>
> Ajye Huang (2):
>   ASoC: google: dt-bindings: modify machine bindings for two MICs case
>   ASoC: qcom: sc7180: Modify machine driver for 2mic
>
>  .../bindings/sound/google,sc7180-trogdor.yaml |  8 ++-
>  sound/soc/qcom/sc7180.c                       | 61 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>
