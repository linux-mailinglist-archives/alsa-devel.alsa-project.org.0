Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 519944F6D29
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 23:45:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C96191724;
	Wed,  6 Apr 2022 23:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C96191724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649281506;
	bh=Pt9dNZkY47pwmvmzw2l5RPQKmk3rUPiXwLVBiv+3418=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hFDUM+0Bo34OYrgy/sugTd9cJuoigq04bvGBvKrnyTGuoL1mylLMP8j3UNezmgCBa
	 NxK63Y7bX7QrJTlYC7FYIz2XVlwK0VM98VaRW8PZy/Ra4pSLYhpjcsvXcEZxwRK8U4
	 on1XmhReWBHES4L6L2mDL3GsCcDa5ydJ1FkTAnyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D88BBF8019B;
	Wed,  6 Apr 2022 23:44:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28E15F80161; Wed,  6 Apr 2022 23:44:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21146F80054
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 23:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21146F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RKlOfPtc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F13E061B72;
 Wed,  6 Apr 2022 21:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA13EC385A3;
 Wed,  6 Apr 2022 21:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649281439;
 bh=Pt9dNZkY47pwmvmzw2l5RPQKmk3rUPiXwLVBiv+3418=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=RKlOfPtcf9IvG9go3O5eJII31c0SsxFDXJvq6fGyWc+keiTYvDfQ3os+y7+WQ9mCY
 qIFhNKR15A1Z+eZREmSK5m7hfbEKmxMXP+iBGrXkfluiIKNfOJWZb1cKeIA7KVg8FI
 w//jGz3eZ+Ll5IpaloVOZ/33lfjzkYM+pEFKJ588rBCMv9uj6c4C6N1GHLKVQ5rS9t
 fXySDHXuaC4eMZG9KKvtMNjPabjPriMivRG9Zz1xcExYiyk4NuBJk4lLrT9qeP1Ndx
 mo8dFVACIgjU+et211rDlISGoj4W1pPMXWIh3EWer6jsJOp/g/YpyUqss9Cf4PV7BG
 9lHZF0DslL/FA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, agross@kernel.org, dianders@chromium.org,
 Krzysztof Kozlowski <krzk@kernel.org>, quic_srivasam@quicinc.com,
 bjorn.andersson@linaro.org, judyhsiao@chromium.org, devicetree@vger.kernel.org,
 srinivas.kandagatla@linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, robh+dt@kernel.org, swboyd@chromium.org
In-Reply-To: <1647852981-27895-1-git-send-email-quic_srivasam@quicinc.com>
References: <1647852981-27895-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH 0/3] Update dt-bindings for sc7280 platform
Message-Id: <164928143662.571581.13530656297112594722.b4-ty@kernel.org>
Date: Wed, 06 Apr 2022 22:43:56 +0100
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

On Mon, 21 Mar 2022 14:26:18 +0530, Srinivasa Rao Mandadapu wrote:
> This patch set is to update required clocks, power domain names for sc7280 platforms,
> and add mic bias supply for wcd938x codec.
> 
> Srinivasa Rao Mandadapu (3):
>   ASoC: qcom: dt-bindings: Update bindings for clocks in lpass digital
>     codes
>   ASoC: dt-bindings: wcd938x: Add mic bias supply property
>   ASoC: dt-bindings: lpass-cpu: Update clocks and power domain names for
>     sc7280 platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: qcom: dt-bindings: Update bindings for clocks in lpass digital codes
      commit: 852fda58d99a6c397f8303a8cd8ccec8702d82f5
[2/3] ASoC: dt-bindings: wcd938x: Add mic bias supply property
      commit: 9108c3446f6e86146f0d3141b94415eb98c39566
[3/3] ASoC: dt-bindings: lpass-cpu: Update clocks and power domain names for sc7280 platform
      commit: 98b7630a583fe970f59742dc855d1c03e258d645

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
