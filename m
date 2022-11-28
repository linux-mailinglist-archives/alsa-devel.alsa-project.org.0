Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E867363B631
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 00:58:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75ADA168F;
	Tue, 29 Nov 2022 00:57:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75ADA168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669679915;
	bh=Tvb04B8qulmmO4t/XjT4/PPN4xjLoCXvhvef9ekUxIA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c0qcFB+4MQI1oN0ucDf4tIYoeHpneb1IzanNSSc0pqj+pv9HvdUVqqda9MYPDFDzW
	 lgdGL3hFC5JpOne450Fg1x44LUIPgP40kGaOA81SuCfZ9DAGqutj4gQtzZhuQuYLtU
	 d3yh1uaGed717ZD4+Q+k0PwS+kD/Np0GJNCuoM1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1A02F800B6;
	Tue, 29 Nov 2022 00:57:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48092F8020D; Tue, 29 Nov 2022 00:57:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=FSL_HELO_FAKE,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF515F800B6
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 00:57:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF515F800B6
Received: by mail-il1-f174.google.com with SMTP id bp12so5854754ilb.9
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 15:57:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x00pKbn9+H6xDvVmnJr0fVpmzLwRZcBMKb+33fEVyHU=;
 b=oiyPoDHXSnIjC856nhazNLmkf5x6iDziIpOgQ2dYdx960dHb7G9xt8PnWm5STIwCIw
 TVRBu9Gi8TP0y/WihEGuriyGBddimuSD5LM4WPVN+YXuOzrCI9AQzyqN6JDCD0DQhuVc
 BMYHtdAQE04dFWQiHEUXTjzqIR1X88Li0VxxKeocrWk+KWtCEskSrzMN3v38rZPx0rZI
 QRhNNMmgZPJtTHP/KWvNl1Y5NqaeJDe6ZRIwFPYA4TBV/557jMkRNNh2gCki++M6n6Zi
 B+KYXSF1eLUQilK9lgIuKt0kC2wu69ielaMpWYRQT8Qb8XSfeJWx2ooqYBHrtLAZXDHk
 NqMw==
X-Gm-Message-State: ANoB5plomKYn+wMJC2bi7t5rr5d0BJOTWg6ctwQaBIT/oq3vPcon7inK
 V2elo7KaoalB8S4skLvZ7BnU3g==
X-Google-Smtp-Source: AA0mqf5SlAkoGQ/TCkMXOmL4n4pQuC48iVJEBauxfEbjXjep4YjY3Xye9sciBmjr3kykO/yVPeMpjA==
X-Received: by 2002:a05:6e02:4ac:b0:303:395:7359 with SMTP id
 e12-20020a056e0204ac00b0030303957359mr5806045ils.253.1669679849932; 
 Mon, 28 Nov 2022 15:57:29 -0800 (PST)
Received: from google.com (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a027142000000b003585ff0233asm4799183jaf.150.2022.11.28.15.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 15:57:29 -0800 (PST)
Date: Mon, 28 Nov 2022 23:57:26 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] ASoC: qcom: lpass-sc7180: Return 0 instead of 'ret'
 at the end of _resume()
Message-ID: <Y4VK5ijXW7Kqnfjn@google.com>
References: <20221128221152.1.Ia805c688ee968fbbec7b93dc10742876fdef8024@changeid>
 <20221128221152.2.I8d1993f41f0da1eac0ecba321678ac489f9c0b9b@changeid>
 <CAD=FV=Uf3JiNf=339ktULYSUjreRU2k_tR2Q=LSNb+u-U4hQ6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=Uf3JiNf=339ktULYSUjreRU2k_tR2Q=LSNb+u-U4hQ6A@mail.gmail.com>
Cc: Judy Hsiao <judyhsiao@google.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
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

On Mon, Nov 28, 2022 at 02:48:28PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Mon, Nov 28, 2022 at 2:12 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > sc7180_lpass_dev_resume() returns 'ret' at the end of the function,
> > where 'ret' is always 0. Just return 0 to make it plain obvious that
> > this is always the success path.
> >
> > Also add an empty line between the error handling path and the
> > return.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> >  sound/soc/qcom/lpass-sc7180.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> > index 7a81e609727c..30a28e3152cb 100644
> > --- a/sound/soc/qcom/lpass-sc7180.c
> > +++ b/sound/soc/qcom/lpass-sc7180.c
> > @@ -173,7 +173,8 @@ static int sc7180_lpass_dev_resume(struct device *dev)
> >                 dev_err(dev, "sc7180 clk prepare and enable failed\n");
> >                 return ret;
> >         }
> > -       return ret;
> > +
> > +       return 0;
> 
> Yeah, I noticed this too when I was approving your pick. FWIW, I
> probably would have written this way, but it's 6 of one and half dozen
> of the other:
> 
> if (ret)
>   dev_err(dev, ...);
> return ret;

Yeah, I was considering this too, either is fine IMO :)

> ...but I just dug a tiny bit deeper and actually, there's no need for
> the error print here and it's just wasteful. clk_bulk_prepare_enable()
> already prints errors for you. So really this whole function could
> just be:
> 
> struct lpass_data *drvdata = dev_get_drvdata(dev);
> return clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);

Right, the log isn't really needed if clk_bulk_prepare_enable() already
logs errors. I'll adjust the patch accordingly, and drop the first one
since 'ret' is going away.

> I guess theoretically one could even go further and look at pm_clk,
> but perhaps that's overboard.

Maybe let's leave that for another iteration :)

Thanks for the review!

m.
