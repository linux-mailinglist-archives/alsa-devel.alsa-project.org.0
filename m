Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B83885071D0
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 17:30:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CEEC1B10;
	Tue, 19 Apr 2022 17:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CEEC1B10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650382251;
	bh=ko3RAF/kN6O+ylXY84hZCl0PJ8FXOQQ2/ef3C7UkP24=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JgdSKplfB+lJujEzyXf9RTEJVFm3Z9Ht1Xi2OEav4qxvZZXP7NFTT11tBOyBcPemq
	 YDPhcW3cgIYtcEGUeV+x+TMTJYV29kuoa+9c4eaOSArbgSrfgsS+60iSAgu7HifP51
	 57AmBU/+qIuLzBVmg7/qpEKceguFLoXofIcwSKBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99F55F804A9;
	Tue, 19 Apr 2022 17:29:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F276CF8025D; Tue, 19 Apr 2022 17:29:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F13C4F80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 17:29:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F13C4F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fIi23HTo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B951616C6;
 Tue, 19 Apr 2022 15:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91631C385A5;
 Tue, 19 Apr 2022 15:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650382182;
 bh=ko3RAF/kN6O+ylXY84hZCl0PJ8FXOQQ2/ef3C7UkP24=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fIi23HToxUsC8+EqGrh1ntRjKbOsovdIeAVT320F/X8DbBivQExY7i5K/tQXsKRMG
 lNA4Up3CP4VwyfdKrm7zudTxiQrOdz+Wi5s78Nk9FTsgfMj+jVJnz3WpyJeETZzrqZ
 X8RklYMLoSxkWCw8/9j4SAVgVby/+hQOQmf+85KFeT3I64hSw8oysBhXYTdp5NosNA
 hoUZQyDfUVV0ZCtpI7B0vcchn00mus8ifQH5jI9xiSeH+pfmjnhX1svIx6IbQB1Tx3
 EBUzf9TglxFD+uNH5tGk+hXRt7eMi++LN1AFLyvrByRKNqHHPZd1HHbEP1qMYmg18l
 wNmfpIsr8Fz4w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, swboyd@chromium.org, tiwai@suse.com,
 quic_srivasam@quicinc.com, agross@kernel.org, srinivas.kandagatla@linaro.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, quic_rohkumar@quicinc.com,
 linux-kernel@vger.kernel.org, judyhsiao@chromium.org,
 bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_plai@quicinc.com, devicetree@vger.kernel.org, perex@perex.cz
In-Reply-To: <1649844596-5264-1-git-send-email-quic_srivasam@quicinc.com>
References: <1649844596-5264-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-platform: Update memremap flag to
 MEMREMAP_WC
Message-Id: <165038217929.995461.3857305274282871060.b4-ty@kernel.org>
Date: Tue, 19 Apr 2022 16:29:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: quic_potturu@quicinc.com
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

On Wed, 13 Apr 2022 15:39:56 +0530, Srinivasa Rao Mandadapu wrote:
> Update memremap flag from MEMREMAP_WT to MEMREMAP_WC for better
> performance.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-platform: Update memremap flag to MEMREMAP_WC
      commit: 0a8ff26dea6e9aeb11db3f1af9fc1848b7042661

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
