Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E419763C4AA
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 17:07:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F3101650;
	Tue, 29 Nov 2022 17:06:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F3101650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669738020;
	bh=J1V3lMbkah+OkD2VRvQKWFgOy3p2gZiM1S+bTvQGf2Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ULFO+SoU87t+6Cj/t1qtyONOCAtlQSpkf/vRRTnQbsUlAKNm+GhUchqJlg3M6Gc93
	 oX2XwSV3R6MnghnipQR5ddJEQ7nj7qhTwAO+Wvh647wKCFywMKghp3PCp+0QBTpMCU
	 L76vUterpZb8lamTXwdE+uFlTVyciQRVZrnQ/1Qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E3B1F80212;
	Tue, 29 Nov 2022 17:06:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD11EF801F7; Tue, 29 Nov 2022 17:06:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62058F80137
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 17:05:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62058F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WZLJ14E8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1B5ADCE1366;
 Tue, 29 Nov 2022 16:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59839C433C1;
 Tue, 29 Nov 2022 16:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669737949;
 bh=J1V3lMbkah+OkD2VRvQKWFgOy3p2gZiM1S+bTvQGf2Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WZLJ14E89JorGzLxOMTFFH4QVsaSRTIM12lhAOCSyXUvHqve1H6SQVeqaKnCYSXgy
 9p/NgKzhuQRHiNhMwSA0HZKq3z3QU7nLqYdJfcfwJS7jktWDoGvPrPpHO1HaTvbcvc
 I+0vzuIeugtNjMgCXuI52GbvCe41lg55NVX2wRyAPJO5xVYVbvrOEqdaXJz6FPiu0v
 52rsov2Cs+wI9+cqlNbP2lT/tKTw6MyBYa+ZRyXKx8AU5SZO8wYj86ShUAc7xEdLaP
 /TvX2CH+9TLnRsI+Q272sYX2irtlykNIfjNfNggR5rAgV7TGt/CoW9/GaQ5NANveNe
 FUnW0owfZn2dQ==
Date: Tue, 29 Nov 2022 09:05:46 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add maybe_unused tag for
 system PM ops
Message-ID: <Y4Yt2oEZm+Yb/wyr@dev-arch.thelio-3990X>
References: <1669726428-3140-1-git-send-email-quic_srivasam@quicinc.com>
 <Y4YpELN4/0cesonb@dev-arch.thelio-3990X>
 <65fd2068-4744-221f-f398-da4303b64fca@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65fd2068-4744-221f-f398-da4303b64fca@quicinc.com>
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

Ah right, it is a more recent macro. I did not realize this patch was
needed to fix a patch destined for stable.

Perhaps keep this patch but add a second patch after it that converts
to using SYSTEM_SLEEP_PM_OPS() for future releases?

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
