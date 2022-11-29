Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F397563C8FA
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 21:09:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8415116B2;
	Tue, 29 Nov 2022 21:08:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8415116B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669752588;
	bh=dhgYtvXVWE+3u6CHu5/Xc0nBPdMNvTRgPGzzIVu9wl8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M0oMUgq0FQuZnVF3R0FX/yAJrkL7DZE5E70QsYZcpungcf7WNlthTp6Y/NIL0hRNm
	 SngmyRXdIS2cDT2o8BOdajlhqwgmLbZQWqRthDC/GOqzN8jFskljejzWTtVAFrKBIt
	 6MpaCKrDSfJYvrkd3VI1hsOEl1TSEmLkwZuRqA6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F93BF80212;
	Tue, 29 Nov 2022 21:08:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37A3EF800B6; Tue, 29 Nov 2022 21:08:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4199F800B6
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 21:08:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4199F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="OusJZI2D"
Received: by mail-io1-xd2a.google.com with SMTP id g26so10237902iob.11
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 12:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=584i24IeUmKZ9FcpWXtTGuzuY6S08oVRL30Y7AAE/c0=;
 b=OusJZI2DkUTTnSZw7asCvGiqP1rEgrNCYXdAsZ+IYRCHLN05pkpGPpyI2O4+torBtE
 CQAt55m4X3ZFv4zSy66ey3R+hYRJ1kmMH3RhGm8+etelW95tQF6Q1cTXjMU0FDKS3+28
 jqi3uByUKBG6Kz2BVYPVQLPlVlpCJglP5wcr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=584i24IeUmKZ9FcpWXtTGuzuY6S08oVRL30Y7AAE/c0=;
 b=iFb6zs/d4NW+XJvp/3AciYSNpdhD5wc/tE5bXthPlhza6VzPcIgoFogtrqQwOEV+hz
 MfABPhpAimqUFk2WhHYGaikc85b0Q6rMPWxjR0iUrJl60CnQhHP8ttnSzXSDUBb7PcvZ
 woHeXHHkFQ8TtxeBHbGbCLQj7rO6e7T8en+RTXZhNA0jkuK755gs2SM6Zf7ttZc69UeS
 xqpmAZ77fHBDZzNkzH3a6xzhfMI1Rnj20j3XmkEM1yTxTdXQ73Rh+Dfak5A9hQcoNtY+
 agQncQ9mGUc2bX9V2zX0h8CQ3DtOMCWrYUTIDIe3kKlOrBBiY2P1yqCtY9NNwyioqLJs
 XhzQ==
X-Gm-Message-State: ANoB5pl5XVdedRlUCMa1F7yYK8GS0eZgSx1qS5G1AZhTM7TRyOd/xeLc
 hhl71BfupnbzNL002h7tcOikuQ==
X-Google-Smtp-Source: AA0mqf6ol8N3/GmPVhHSQInbDQajrGI6x+Tajc/TzT1e611+PD/fYR0YwQGfVz90iFMJHGOaq/7w9w==
X-Received: by 2002:a6b:d314:0:b0:6bc:2a47:a874 with SMTP id
 s20-20020a6bd314000000b006bc2a47a874mr19340506iob.126.1669752521298; 
 Tue, 29 Nov 2022 12:08:41 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
 by smtp.gmail.com with UTF8SMTPSA id
 k37-20020a026625000000b003758bcba4b5sm5592509jac.153.2022.11.29.12.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 12:08:40 -0800 (PST)
Date: Tue, 29 Nov 2022 20:08:40 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add maybe_unused tag for
 system PM ops
Message-ID: <Y4ZmyO0o6SvrvaWq@google.com>
References: <1669726428-3140-1-git-send-email-quic_srivasam@quicinc.com>
 <Y4YpELN4/0cesonb@dev-arch.thelio-3990X>
 <65fd2068-4744-221f-f398-da4303b64fca@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <65fd2068-4744-221f-f398-da4303b64fca@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Nathan Chancellor <nathan@kernel.org>, agross@kernel.org,
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

On Tue, Nov 29, 2022 at 09:28:33PM +0530, Srinivasa Rao Mandadapu wrote:
> Thanks for your tie Nathan!!!
> 
> On 11/29/2022 9:15 PM, Nathan Chancellor wrote:
> > On Tue, Nov 29, 2022 at 06:23:48PM +0530, Srinivasa Rao Mandadapu wrote:
> > > Add __maybe_unused tag for system PM ops suspend and resume.
> > > This is required to fix allmodconfig compilation issue.
> > > Fixes: c3bf7699747c ("ASoC: qcom: lpass-sc7280: Add system suspend/resume PM ops")
> > > 
> > > Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> > A better solution would be replacing SET_SYSTEM_SLEEP_PM_OPS() with
> > SYSTEM_SLEEP_PM_OPS(), which was added to avoid needing to add these
> > '__maybe_unused' attributes to these functions. See commit 1a3c7bb08826
> > ("PM: core: Add new *_PM_OPS macros, deprecate old ones") for more info.
> 
> Tried this option but as this patch required for Kernel 5.4 version code
> base,
> 
> SYSTEM_SLEEP_PM_OPS didn't work.

Older downstream trees needing a change shouldn't impact how a change is done
upstream. The change should be what's best for the upstream kernel. Downstream
kernels can do backports which might differ from the upstream solution or
pick the missing dependencies (which might not be too hard in this case).

> > > ---
> > >   sound/soc/qcom/lpass-sc7180.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> > > index b96b85a..41db661 100644
> > > --- a/sound/soc/qcom/lpass-sc7180.c
> > > +++ b/sound/soc/qcom/lpass-sc7180.c
> > > @@ -163,14 +163,14 @@ static int sc7180_lpass_exit(struct platform_device *pdev)
> > >   	return 0;
> > >   }
> > > -static int sc7180_lpass_dev_resume(struct device *dev)
> > > +static int __maybe_unused sc7180_lpass_dev_resume(struct device *dev)
> > >   {
> > >   	struct lpass_data *drvdata = dev_get_drvdata(dev);
> > >   	return clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
> > >   }
> > > -static int sc7180_lpass_dev_suspend(struct device *dev)
> > > +static int __maybe_unused sc7180_lpass_dev_suspend(struct device *dev)
> > >   {
> > >   	struct lpass_data *drvdata = dev_get_drvdata(dev);
> > > -- 
> > > 2.7.4
> > > 
> > > 
