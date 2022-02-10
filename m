Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A35494B139F
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 17:55:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1380B1A43;
	Thu, 10 Feb 2022 17:54:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1380B1A43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644512103;
	bh=jU4woLASpR6Ex/J6X55lhs4XNVlGTKqO4+sal3OhZzg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FHH7oZ4pGV/ySSOy1XMwZlvBdaxXtdxirVFOpIB8geuyi8Fdzu5FOEGrYilWeqDfN
	 gZoWc936SvS4POIcdHjK3DjdjohmLhAhrg9Pz2GCRI9BNm+Pz55BwCzh5w2DhnJzVw
	 vOT9ST4GVY7PAVbeY8UVGg+0YjQNf5UGiVU0/dJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAA21F80054;
	Thu, 10 Feb 2022 17:53:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A059DF804AB; Thu, 10 Feb 2022 17:53:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B222F80302
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 17:53:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B222F80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MtSnP5go"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A946161D99;
 Thu, 10 Feb 2022 16:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6A0C340EB;
 Thu, 10 Feb 2022 16:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644511999;
 bh=jU4woLASpR6Ex/J6X55lhs4XNVlGTKqO4+sal3OhZzg=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=MtSnP5goZivyhhcyM1qavOq0s+jAuT2xOsOPztOxRfCVXqxOgtmL+EzpUdD9Ie9vd
 /CaIzzqw2YbXKjaqPVdI3x7xrep0rLJ6CIkSuMoPdN4SsWxGi/nTvSOj757LD/taku
 HqLDfWdBeO3X9hcDWADDFwCpzQAt1ZA5/IM39/JQCorHxM3kCLpyD4MLqPNl83lXXY
 L7xmwvYH5Lyo7SRGDOGn7IXMcwkfxDzp5iT5sL3PIoNO+bz9n3Xd3t2wcnqNN/RtvK
 MHoyLVYSdYuhw5dyN3rk3YxbnXMwIOtXTxSWHcsfE8iMvQIS9aj/137kyiFQPzoIUr
 xvXkJ5VSiCpVQ==
From: Mark Brown <broonie@kernel.org>
To: bgoswami@codeaurora.org, srinivas.kandagatla@linaro.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, tiwai@suse.com,
 perex@perex.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 plai@codeaurora.org, robh+dt@kernel.org, judyhsiao@chromium.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, agross@kernel.org,
 swboyd@chromium.org, alsa-devel@alsa-project.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org
In-Reply-To: <1644497415-25291-1-git-send-email-quic_srivasam@quicinc.com>
References: <1644497415-25291-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH v9 0/3] Machine driver to support LPASS SC7280 sound card
 registration
Message-Id: <164451199562.2625306.8749637139176937235.b4-ty@kernel.org>
Date: Thu, 10 Feb 2022 16:53:15 +0000
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

On Thu, 10 Feb 2022 18:20:12 +0530, Srinivasa Rao Mandadapu wrote:
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
