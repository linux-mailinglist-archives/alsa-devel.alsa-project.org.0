Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 004DF63C407
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 16:46:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91E201630;
	Tue, 29 Nov 2022 16:45:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91E201630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669736790;
	bh=OBajQxyPKWk4eBVakGjlcr0afXEUapA11McgDnqCERY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WcJeOslMTGeuHsGss+VRtNUQwLLSI4Xf704xbDPzswTtl7rAXWPzfFnGQIiSuwEYn
	 nUkqakK4XTrJu5vr49XJnHpMFgjkFGBewZspZSJf/r6q9YYyjKx3z1ZiuQFHB80nn4
	 RlktYCjTpss/RHctgXC075XX8FDP1e2D3IPr32pk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47015F80166;
	Tue, 29 Nov 2022 16:45:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FDADF801F7; Tue, 29 Nov 2022 16:45:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39631F80137
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 16:45:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39631F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o2Ho0a2R"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C2792617A7;
 Tue, 29 Nov 2022 15:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A20C433C1;
 Tue, 29 Nov 2022 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669736723;
 bh=OBajQxyPKWk4eBVakGjlcr0afXEUapA11McgDnqCERY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o2Ho0a2RYST8CGg8p8OHCzolQz82thLT7OpRnlwIAlED6f+4ob2GTjF49zM7kQfut
 fHmCMle3msv6TgsC318FXf48vL02wg3f/4+wfledN5W3CT2jakO9ER4TRC+fo/+FYy
 wzUU5epLEqVvkC81KSou9ozbbkv31MrakAysRe6rgb9zQqaCZJhgBLsqn++GIQ12tg
 C96EkZH/sz7f6JbPCmQvWIj0MJMNyCil8oSCETDJjAVMh9GzThPlZ0s0GZ5iQG1QmO
 m8I2X4ZM8yHxxwQMT83W6m9QgIf41vGyiMXU2D4Y3QNJKF0BW+swDFuTP/vr4FTlWl
 J/N5LZR1T5FbQ==
Date: Tue, 29 Nov 2022 08:45:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add maybe_unused tag for
 system PM ops
Message-ID: <Y4YpELN4/0cesonb@dev-arch.thelio-3990X>
References: <1669726428-3140-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1669726428-3140-1-git-send-email-quic_srivasam@quicinc.com>
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

On Tue, Nov 29, 2022 at 06:23:48PM +0530, Srinivasa Rao Mandadapu wrote:
> Add __maybe_unused tag for system PM ops suspend and resume.
> This is required to fix allmodconfig compilation issue.
> Fixes: c3bf7699747c ("ASoC: qcom: lpass-sc7280: Add system suspend/resume PM ops")
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>

A better solution would be replacing SET_SYSTEM_SLEEP_PM_OPS() with
SYSTEM_SLEEP_PM_OPS(), which was added to avoid needing to add these
'__maybe_unused' attributes to these functions. See commit 1a3c7bb08826
("PM: core: Add new *_PM_OPS macros, deprecate old ones") for more info.

> ---
>  sound/soc/qcom/lpass-sc7180.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> index b96b85a..41db661 100644
> --- a/sound/soc/qcom/lpass-sc7180.c
> +++ b/sound/soc/qcom/lpass-sc7180.c
> @@ -163,14 +163,14 @@ static int sc7180_lpass_exit(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int sc7180_lpass_dev_resume(struct device *dev)
> +static int __maybe_unused sc7180_lpass_dev_resume(struct device *dev)
>  {
>  	struct lpass_data *drvdata = dev_get_drvdata(dev);
>  
>  	return clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
>  }
>  
> -static int sc7180_lpass_dev_suspend(struct device *dev)
> +static int __maybe_unused sc7180_lpass_dev_suspend(struct device *dev)
>  {
>  	struct lpass_data *drvdata = dev_get_drvdata(dev);
>  
> -- 
> 2.7.4
> 
> 
