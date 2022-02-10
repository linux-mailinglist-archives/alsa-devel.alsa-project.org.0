Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F564B139C
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 17:54:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF9471A2B;
	Thu, 10 Feb 2022 17:53:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF9471A2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644512067;
	bh=HAU9jECp8vk3akhAHZrT9sbV+MlXVMIjLGnKhGgo6v8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RDy1LXnAXEorviHJfYqndI7RnF1SzfOtbT/ME2vovg+++Zod+HEEZM4SuBhVgyVC4
	 ZeO915kH3v1Qo5YZBFzz8RdunJiXYBkrz6sfxyKETJiI6Tm5zSr/5/Mv8khSh3Opqh
	 mmmie2Psdykz+IxisyfWjmrEiXNLCe4GqEUhkd1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D2D2F8013D;
	Thu, 10 Feb 2022 17:53:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AAF0F8028B; Thu, 10 Feb 2022 17:53:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2E89F80054
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 17:53:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2E89F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o7Nw65ZD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 88D48B82662;
 Thu, 10 Feb 2022 16:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF44C004E1;
 Thu, 10 Feb 2022 16:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644511993;
 bh=HAU9jECp8vk3akhAHZrT9sbV+MlXVMIjLGnKhGgo6v8=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=o7Nw65ZDQ0K80ka/Paeu31omt3SmW1dxm5+mHMvPCzvzT8ogIfUh35GZN+m7Eg/+r
 XfaDIwJIsoKicy+eicDxgiQ4oF+GZtqA+W1TqbLJA4PiIUhAXAScr4x9TUoR7N8NrN
 /oMsmG8XQSx9FeT7lXtrkow9T339kvIwcLnxnHucMfLk4HnTBDDHLbQjNHc/B4MMnw
 ZgY7i8cUbMJwIfid6XO0Wbr8gDqL2kec1T0zSSJbCzKqh/9pSVRbmCMWMsILc89MIb
 7B5LPhwNmT7xCEttNiFrzKo6UqlEYgoDw2D74IECu83ZEJcKt+2nMtQmP0JieZiDFa
 VkRj2hsuITVZQ==
From: Mark Brown <broonie@kernel.org>
To: bgoswami@codeaurora.org, srinivas.kandagatla@linaro.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, tiwai@suse.com,
 perex@perex.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 plai@codeaurora.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 bjorn.andersson@linaro.org, judyhsiao@chromium.org, agross@kernel.org,
 swboyd@chromium.org, alsa-devel@alsa-project.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org
In-Reply-To: <1644413181-26358-1-git-send-email-quic_srivasam@quicinc.com>
References: <1644413181-26358-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [RESEND v8 0/3] Machine driver to support LPASS SC7280 sound card
 registration
Message-Id: <164451198976.2625306.6596305549471507379.b4-ty@kernel.org>
Date: Thu, 10 Feb 2022 16:53:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 9 Feb 2022 18:56:18 +0530, Srinivasa Rao Mandadapu wrote:
> This patch set is to add support for SC7280 sound card registration and
> to add dt-bindings documentation file.
> 
> Srinivasa Rao Mandadapu (3):
>   ASoC: google: dt-bindings: Add sc7280-herobrine machine bindings
>   ASoC: qcom: Add macro for lpass DAI id's max limit
>   ASoC: qcom: SC7280: Add machine driver
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: google: dt-bindings: Add sc7280-herobrine machine bindings
      commit: 7bd431486511482b6e789dd69d07654a1d8c5eba
[2/3] ASoC: qcom: Add macro for lpass DAI id's max limit
      commit: 77d0ffef793da818741127f4905a3e3d45d05ac7
[3/3] ASoC: qcom: SC7280: Add machine driver
      commit: 57350bd41c3ac01bcae1d94e2c85d47dd90b6a3f

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
