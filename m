Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F0B4C4C97
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 18:37:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 166331E81;
	Fri, 25 Feb 2022 18:36:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 166331E81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645810661;
	bh=yn+4QGgrb+hRdHd7URm2rvtm9OKXT+OZKFqIplXZbrg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TJbIhxvXvxFsKYJ249WZ9wDtd+Y6NsKZ70T8By60yyLDxO5HbhCwsO+mKJAoOL245
	 gpplO3I561enCBFVOQiMkCVCsMlKN0Uzrw8fR1srAjgmz2Yt+IbINVO+DkCMry+L4c
	 RgOgWtHjiE0A50dchSyGNQU77cv1etaCBKdcQqGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38B4AF8051A;
	Fri, 25 Feb 2022 18:35:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98A73F80511; Fri, 25 Feb 2022 18:35:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13541F800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 18:35:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13541F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A/t86dbF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B696461DC2;
 Fri, 25 Feb 2022 17:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4110C340E7;
 Fri, 25 Feb 2022 17:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645810551;
 bh=yn+4QGgrb+hRdHd7URm2rvtm9OKXT+OZKFqIplXZbrg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=A/t86dbFxRwK/irOOihhpq+yEV02CjMZ05GfgR2oppe70ni7L+m0vCmyEMSrb6BaF
 vLkbUGvwZQMX5hPnIp0lXgwiY5sM8rMUkw/y7Gm3QtJCoe3tU61jPwvcN0rUNDcMIr
 3fBEb2KseT2hBANbJUQb6a9LnigH3AipRorE50vWOZeeYnrPhbMNZmNnZHlKCjuTxe
 NN2caP1MgF+n2LSAsmN9HB4FLFcWFk5qQDDnmJMiySfh3ITliOutmsHiNohPt5Y25t
 TxHDwIgFaj5OFw5GafqC4pk5kKhLGfT86/LM0VlTmtq6FRnddQKl/NMVVPzv+/1Yt4
 wn6eZCLx77eYg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, quic_plai@quicinc.com, robh+dt@kernel.org,
 perex@perex.cz, linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
 devicetree@vger.kernel.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, swboyd@chromium.org,
 judyhsiao@chromium.org, rohitkr@codeaurora.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org
In-Reply-To: <1645792943-24845-1-git-send-email-quic_srivasam@quicinc.com>
References: <1645792943-24845-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-platform: Update warning print to
 control excess logging
Message-Id: <164581054746.2548431.12085357818762890090.b4-ty@kernel.org>
Date: Fri, 25 Feb 2022 17:35:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

On Fri, 25 Feb 2022 18:12:23 +0530, Srinivasa Rao Mandadapu wrote:
> Update dev_warn to dev_warn_ratelimit to control excess xrun logging
> in lpass platform driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-platform: Update warning print to control excess logging
      commit: 5a5d2316a5292222383d4e3589b8f5144f7c9b49

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
