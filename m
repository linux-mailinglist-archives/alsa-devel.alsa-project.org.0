Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E32B63BE48
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 11:54:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D793A16BB;
	Tue, 29 Nov 2022 11:53:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D793A16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669719266;
	bh=aYZ4/diRmYfTVwQVwka9YG6YN5W5wVGCScqdXSK42es=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JArauomnssokfhSNPDyvk6VTvPrLx4Z+Y/cnXy5N7Tkls3CYC8rDsGHYi4l02kTJ+
	 WAf4FkBmEpbZQiMkDa4h5bEeFQmXN5xlixJi5gAeQ6e1YjzPNOrxCLxGEnWLJFOe7R
	 vCr2IPIihAXQK1H00PaNoeOr9M6NJzGu7K+mEPbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F918F80212;
	Tue, 29 Nov 2022 11:53:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44F9BF801F7; Tue, 29 Nov 2022 11:53:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 031C4F80137
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 11:53:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 031C4F80137
Received: by mail-qv1-f54.google.com with SMTP id a17so7657235qvt.9
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 02:53:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=byCqNO9wNjp3bMa2bdQ4RMa3BFEO/vUEjR67iUdLdSk=;
 b=eULYUuO4gU2fefQKG4m0A9fru6l2BMBZkjQPjmzx40d1X4ey6hf9EnEk+O8EQH+Zv/
 oe+6hI5DNagQmuU7/fEN9VfAYiS1WBG7ECjr7iRd35+cMpNDCaqRrIUpe54qFX1n2MfX
 D95Cv0BIhd1QmSgXDn9tEryfjvv/vzb/zbhzv6pSdy7hT3nSLNldMUbLamjec64PrajB
 PeL0VNDVb5Q0G9Pvx0HiCDwcJrfhmyXAY5xH95kYQbtJojtORfyd0i5DjVoISKn3gHlg
 8vy02hTkp9jE19TkxdEm4e3RJdnV8BzDFKQMGBYjssw/AarTYgFqqx3xWVw7EG27+oXl
 2ypQ==
X-Gm-Message-State: ANoB5pkz+MjCaONnqRxtZUndTU6lgCJMxWIme3pNeEKlRmgstni5yW8a
 2IipNEJkTL6zz0QyLoBCURK6GTO9cXkkIA==
X-Google-Smtp-Source: AA0mqf57quo+h983i1jLExHfap5im/QVZpa2DlyK9UlnumjaL3DtQxz8H160ORGrsAWRCGlpl+PtJA==
X-Received: by 2002:a05:6214:a61:b0:4bb:746b:b643 with SMTP id
 ef1-20020a0562140a6100b004bb746bb643mr33474883qvb.19.1669719203377; 
 Tue, 29 Nov 2022 02:53:23 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 cf22-20020a05622a401600b0039cc47752casm8384767qtb.77.2022.11.29.02.53.22
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 02:53:23 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-3bfd998fa53so81687487b3.5
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 02:53:22 -0800 (PST)
X-Received: by 2002:a05:690c:b81:b0:37e:6806:a5f9 with SMTP id
 ck1-20020a05690c0b8100b0037e6806a5f9mr36739244ywb.47.1669719202235; Tue, 29
 Nov 2022 02:53:22 -0800 (PST)
MIME-Version: 1.0
References: <1669621742-28524-1-git-send-email-quic_srivasam@quicinc.com>
 <CAMuHMdUBojHkaAPsjOEadfaikth+L0R_NrKzvqXrmZS9Kc5zHw@mail.gmail.com>
 <3b00c04c-cb6d-9e9a-ba0c-0ce093b4a3fb@quicinc.com>
In-Reply-To: <3b00c04c-cb6d-9e9a-ba0c-0ce093b4a3fb@quicinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Nov 2022 11:53:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUfRJmy56eO=ET-Togg-EOgxSjnTgAUYWmixD_zVonipA@mail.gmail.com>
Message-ID: <CAMuHMdUfRJmy56eO=ET-Togg-EOgxSjnTgAUYWmixD_zVonipA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add system suspend/resume PM ops
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, broonie@kernel.org, bgoswami@quicinc.com,
 quic_plai@quicinc.com, swboyd@chromium.org, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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

Hi Srinivasa,

On Tue, Nov 29, 2022 at 11:36 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:
> On 11/29/2022 1:23 PM, Geert Uytterhoeven wrote:
> > On Mon, Nov 28, 2022 at 8:50 AM Srinivasa Rao Mandadapu
> > <quic_srivasam@quicinc.com> wrote:
> >> Update lpass sc7180 platform driver with PM ops, such as
> >> system supend and resume callbacks.
> >> This update is required to disable clocks during supend and
> >> avoid XO shutdown issue.
> >>
> >> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> >> Tested-by: Rahul Ajmeriya <quic_rajmeriy@quicinc.com>
> > Thanks for your patch, which is now commit 2d68148f8f85ca5a ("ASoC:
> > qcom: lpass-sc7180: Add system suspend/resume PM ops") in next-20221129.
> >
> >> --- a/sound/soc/qcom/lpass-sc7180.c
> >> +++ b/sound/soc/qcom/lpass-sc7180.c
> >> @@ -12,6 +12,7 @@
> >>   #include <linux/module.h>
> >>   #include <linux/of.h>
> >>   #include <linux/platform_device.h>
> >> +#include <linux/pm_runtime.h>
> >>   #include <dt-bindings/sound/sc7180-lpass.h>
> >>   #include <sound/pcm.h>
> >>   #include <sound/soc.h>
> >> @@ -156,10 +157,34 @@ static int sc7180_lpass_exit(struct platform_device *pdev)
> >>          struct lpass_data *drvdata = platform_get_drvdata(pdev);
> >>
> >>          clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
> >> +       return 0;
> >> +}
> >> +
> >> +static int sc7180_lpass_dev_resume(struct device *dev)
> >> +{
> >> +       int ret = 0;
> >> +       struct lpass_data *drvdata = dev_get_drvdata(dev);
> >>
> >> +       ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
> >> +       if (ret) {
> >> +               dev_err(dev, "sc7180 clk prepare and enable failed\n");
> >> +               return ret;
> >> +       }
> >> +       return ret;
> >> +}
> >> +
> >> +static int sc7180_lpass_dev_suspend(struct device *dev)
> >> +{
> >> +       struct lpass_data *drvdata = dev_get_drvdata(dev);
> >> +
> >> +       clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
> >>          return 0;
> >>   }
> > noreply@ellerman.id.au reports for e.g. m68k-allmodconfig:
> >
> >      sound/soc/qcom/lpass-sc7180.c:179:12: error:
> > 'sc7180_lpass_dev_suspend' defined but not used
> > [-Werror=unused-function]
> >      sound/soc/qcom/lpass-sc7180.c:166:12: error:
> > 'sc7180_lpass_dev_resume' defined but not used
> > [-Werror=unused-function]
> >
> >> +static const struct dev_pm_ops sc7180_lpass_pm_ops = {
> >> +       SET_SYSTEM_SLEEP_PM_OPS(sc7180_lpass_dev_suspend, sc7180_lpass_dev_resume)
> >> +};
> > Please use DEFINE_SIMPLE_DEV_PM_OPS()...
> Actually, we need to use this patch in in previous kernels 5.4 and 5.15.
> I think these changes won't apply on previous kernel.
> Hence ignoring for now and will take care next time.

In that case you should add __maybe_unused tags to
sc7180_lpass_dev_suspend() and sc7180_lpass_dev_resume() first, so it
can be backported to 5.4 and 5.15, and do the DEFINE_SIMPLE_DEV_PM_OPS()
conversion later.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
