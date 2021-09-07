Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D85402F30
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 21:56:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF047171F;
	Tue,  7 Sep 2021 21:55:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF047171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631044564;
	bh=BOxC2uLzqSclYUFis5PTRVy3j+KG412yeuq7R6Zt+yw=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Divnx3WqqdZ1cx99bfF5ys3FZ17VzwgUWPgVB1jzgFAqpvlXxZkl6J/QVXpLdLQhJ
	 bhrlNr7CUmnb38RFRaGVBtMcxuVZG5kWLCGCn8vXWEub+k9TcQj19wH8crnGqmEYkm
	 QYxFwN+MEJz+kR1WkOpo0JN3XOQQoaGx9oZzXUHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4310FF80253;
	Tue,  7 Sep 2021 21:54:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F2B0F80224; Tue,  7 Sep 2021 21:54:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 444AEF800C7
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 21:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 444AEF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="YWKQpuDT"
Received: by mail-ot1-x32e.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so560202otc.4
 for <alsa-devel@alsa-project.org>; Tue, 07 Sep 2021 12:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=eNsppomO2keBxhHRJ7cqRlPWMOENEgbNhprLa49KjSM=;
 b=YWKQpuDTWMbaSnr4MYGCvvYX0uC0P8bk55rrQDQuuTxwbve1htEfv+rNldGQGBFijR
 lTuL+tWvTOIU9bogyI7lhadaIhzVw4LkeAxdmOmmTD235DXvZdEBHuyW31GWRjgrmPDq
 ClYW2lZJFPY0cRtQVL6Nr8IeQDQzPNs0EmE44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=eNsppomO2keBxhHRJ7cqRlPWMOENEgbNhprLa49KjSM=;
 b=g9wvD6jdm2cEidAcvn2ytz8moVtMLoyjEL43lEPYiYpK8DuSwbAyxYEiTwzbk0p2Rv
 iT5Ep+6HyiKm5GRO0Xvq7LFXT9Dpl5ma0Syq+DLxIV9yad2zIqfsJDZ5d45/ArcWjnOT
 /Hn4m/geqKijHRnJFUJOeduPEWYuWtgBiFehuVgADsaETr4btsFDV5lGVc7fsCzZYgB8
 qav0EHMas0VlS1tZjr430KJePep6wZUrQFAHJjyiutyKgQPBLStNu6stN7afU5E5zvsP
 tSjcum3r3kTK+1e9c1qRXVtHJkFyZTw3nWvMIQiw03EzdvCmaw6tHePqjgDliw9lXC1O
 moUQ==
X-Gm-Message-State: AOAM531D7vgQ6YoR687jkDIm8+XRRaTh2UNODc6hBxIXw63hbmSU49vR
 6/0r02/b+oheFEuzaWRd09FNNSLcyH3yy3NHFII7Pw==
X-Google-Smtp-Source: ABdhPJyzr8qP5oUk1QZh/gt5W0hV8SHhW6pfNwmQGQwevcEdl4gAcrYQ1vaogwGyVNGWcD4XZl+Z04zpjOFAEiXA6aI=
X-Received: by 2002:a05:6830:719:: with SMTP id y25mr87159ots.77.1631044476816; 
 Tue, 07 Sep 2021 12:54:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Sep 2021 19:54:36 +0000
MIME-Version: 1.0
In-Reply-To: <587ed6fd-0203-cb7d-338f-185185d88f76@codeaurora.org>
References: <20210903100153.9137-1-srivasam@codeaurora.org>
 <CAE-0n50=vL0MHHHkc22ahrqqD3DskFXZzFU8qjU8=EY1kZ+__Q@mail.gmail.com>
 <587ed6fd-0203-cb7d-338f-185185d88f76@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 7 Sep 2021 19:54:36 +0000
Message-ID: <CAE-0n52cvV3yqaU0Ea50MYXMQa6Ot2z1_0NfUpDeZj9_M=joiQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-platform: Reset irq clear reg post
 handling interrupts
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com
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

Quoting Srinivasa Rao Mandadapu (2021-09-06 06:35:46)
> Thanks for Your time Stephen!!
>
> On 9/4/2021 12:10 AM, Stephen Boyd wrote:
> > Quoting Srinivasa Rao Mandadapu (2021-09-03 03:01:53)
> >> Update interrupt clear register with reset value after addressing
> >> all interrupts. This is to fix playback or capture hanging issue in
> >> simultaneous playback and capture usecase.
> >>
> >> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> >> ---
> > Any Fixes tag?
> Actually it's incremental change. I will add base commit of this function.

Ok.

> >
> >>   sound/soc/qcom/lpass-platform.c | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> >> index f9df76d37858..1a0a4b0b1a03 100644
> >> --- a/sound/soc/qcom/lpass-platform.c
> >> +++ b/sound/soc/qcom/lpass-platform.c
> >> @@ -749,6 +749,12 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
> >>                  }
> >>          }
> >>
> >> +       rv = regmap_write(drvdata->lpaif_map, LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
> >> +       if (rv) {
> >> +               pr_err("error writing to irqstat reg: %d\n", rv);
> >> +               return IRQ_NONE;
> > I was thinking we should return IRQ_HANDLED still, but then I guess
> > failing to clear the irq be treated as a spurious irq so that if we fail
> > enough times we'll shut off the irq at the irqchip. Things are going bad
> > if the write fails.
> Here bit confusing. Could You please suggest How to go ahead on this?

Sorry. I think it is fine as is.
