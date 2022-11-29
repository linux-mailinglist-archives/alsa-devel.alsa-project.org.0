Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7D263BFDA
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 13:16:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BCED16BF;
	Tue, 29 Nov 2022 13:15:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BCED16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669724159;
	bh=VB01RoMecb1fnZrCwPJYgm/ivTMxFqaFVHgPsPPtEQU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sb7RmwVWGr4cC8YUye8bLsPavV7tJnwX2VhtMA0PExve1aw7RONyi64/2YaRvCnPZ
	 KNvmvaixnEZq6gX6WAvJGYrpWv2B88CmtKlNg7dBMHc8iBbH0jWlHYSV38u0AAfv55
	 C2XIpdpYTG5zQumufaX2ZTcS05c+WsoBUCxZH1zw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB6CFF80224;
	Tue, 29 Nov 2022 13:15:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9131F801F7; Tue, 29 Nov 2022 13:15:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBC32F80166
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 13:14:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBC32F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="YEtZTJOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1669724098; x=1701260098;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VB01RoMecb1fnZrCwPJYgm/ivTMxFqaFVHgPsPPtEQU=;
 b=YEtZTJOQNZoxp1Gbb8UliV7DD1hSofgGlmBr2dVTxjBKzQZ1cuYC8O1A
 bJZ2s6Y/pnkaJMxjfohczfrMCgYpFuc7E/qi+Iqouc3qiel3kulU/ROP6
 +mtRXaXsv3HaIVzWbT3Q/1evwIvKqKviHLZ6uG1knBquObWihpihodQD2
 KvX3p4xwWiFVJzcn7/fNeB68t3bIqw9GloyIMsI9gg9v4JvNrih2MW+kw
 IbO7o4rLA00FmDB21TccxbJkyNt7N3CRjGkPqMwtle7R8vNOvvllYd+Ne
 mBOAc9pkEFvIGwMZoCVTlh5UHjSy9K8bqhuQw0u2NcboVYf0lE5A1BIHM A==;
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; d="scan'208";a="201836035"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Nov 2022 05:14:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 29 Nov 2022 05:14:54 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 29 Nov 2022 05:14:51 -0700
Date: Tue, 29 Nov 2022 12:14:32 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add system suspend/resume PM ops
Message-ID: <Y4X3qKIaSx3lYlsr@wendy>
References: <1669621742-28524-1-git-send-email-quic_srivasam@quicinc.com>
 <CAMuHMdUBojHkaAPsjOEadfaikth+L0R_NrKzvqXrmZS9Kc5zHw@mail.gmail.com>
 <3b00c04c-cb6d-9e9a-ba0c-0ce093b4a3fb@quicinc.com>
 <CAMuHMdUfRJmy56eO=ET-Togg-EOgxSjnTgAUYWmixD_zVonipA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUfRJmy56eO=ET-Togg-EOgxSjnTgAUYWmixD_zVonipA@mail.gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, broonie@kernel.org, bgoswami@quicinc.com,
 quic_plai@quicinc.com, swboyd@chromium.org, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org,
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

On Tue, Nov 29, 2022 at 11:53:10AM +0100, Geert Uytterhoeven wrote:
> Hi Srinivasa,
> 
> On Tue, Nov 29, 2022 at 11:36 AM Srinivasa Rao Mandadapu
> <quic_srivasam@quicinc.com> wrote:
> > On 11/29/2022 1:23 PM, Geert Uytterhoeven wrote:
> > > On Mon, Nov 28, 2022 at 8:50 AM Srinivasa Rao Mandadapu
> > > <quic_srivasam@quicinc.com> wrote:
> > >> Update lpass sc7180 platform driver with PM ops, such as
> > >> system supend and resume callbacks.
> > >> This update is required to disable clocks during supend and
> > >> avoid XO shutdown issue.
> > >>
> > >> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> > >> Tested-by: Rahul Ajmeriya <quic_rajmeriy@quicinc.com>
> > > Thanks for your patch, which is now commit 2d68148f8f85ca5a ("ASoC:
> > > qcom: lpass-sc7180: Add system suspend/resume PM ops") in next-20221129.
> > >
> > >> --- a/sound/soc/qcom/lpass-sc7180.c
> > >> +++ b/sound/soc/qcom/lpass-sc7180.c
> > >> @@ -12,6 +12,7 @@
> > >>   #include <linux/module.h>
> > >>   #include <linux/of.h>
> > >>   #include <linux/platform_device.h>
> > >> +#include <linux/pm_runtime.h>
> > >>   #include <dt-bindings/sound/sc7180-lpass.h>
> > >>   #include <sound/pcm.h>
> > >>   #include <sound/soc.h>
> > >> @@ -156,10 +157,34 @@ static int sc7180_lpass_exit(struct platform_device *pdev)
> > >>          struct lpass_data *drvdata = platform_get_drvdata(pdev);
> > >>
> > >>          clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
> > >> +       return 0;
> > >> +}
> > >> +
> > >> +static int sc7180_lpass_dev_resume(struct device *dev)
> > >> +{
> > >> +       int ret = 0;
> > >> +       struct lpass_data *drvdata = dev_get_drvdata(dev);
> > >>
> > >> +       ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
> > >> +       if (ret) {
> > >> +               dev_err(dev, "sc7180 clk prepare and enable failed\n");
> > >> +               return ret;
> > >> +       }
> > >> +       return ret;
> > >> +}
> > >> +
> > >> +static int sc7180_lpass_dev_suspend(struct device *dev)
> > >> +{
> > >> +       struct lpass_data *drvdata = dev_get_drvdata(dev);
> > >> +
> > >> +       clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
> > >>          return 0;
> > >>   }
> > > noreply@ellerman.id.au reports for e.g. m68k-allmodconfig:
> > >
> > >      sound/soc/qcom/lpass-sc7180.c:179:12: error:
> > > 'sc7180_lpass_dev_suspend' defined but not used
> > > [-Werror=unused-function]
> > >      sound/soc/qcom/lpass-sc7180.c:166:12: error:
> > > 'sc7180_lpass_dev_resume' defined but not used
> > > [-Werror=unused-function]
> > >
> > >> +static const struct dev_pm_ops sc7180_lpass_pm_ops = {
> > >> +       SET_SYSTEM_SLEEP_PM_OPS(sc7180_lpass_dev_suspend, sc7180_lpass_dev_resume)
> > >> +};
> > > Please use DEFINE_SIMPLE_DEV_PM_OPS()...
> > Actually, we need to use this patch in in previous kernels 5.4 and 5.15.
> > I think these changes won't apply on previous kernel.
> > Hence ignoring for now and will take care next time.
> 
> In that case you should add __maybe_unused tags to
> sc7180_lpass_dev_suspend() and sc7180_lpass_dev_resume() first, so it
> can be backported to 5.4 and 5.15, and do the DEFINE_SIMPLE_DEV_PM_OPS()
> conversion later.

FWIW, this is now breaking allmodconfig on RISC-V for this reason:

make[2]: *** [../scripts/Makefile.build:504: lib] Error 2
../sound/soc/qcom/lpass-sc7180.c:179:12: error: 'sc7180_lpass_dev_suspend' defined but not used [-Werror=unused-function]
  179 | static int sc7180_lpass_dev_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~
../sound/soc/qcom/lpass-sc7180.c:166:12: error: 'sc7180_lpass_dev_resume' defined but not used [-Werror=unused-function]
  166 | static int sc7180_lpass_dev_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Thanks,
Conor.

