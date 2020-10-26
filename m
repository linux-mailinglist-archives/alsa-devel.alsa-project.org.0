Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDA6299B5C
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 00:50:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DEA416BC;
	Tue, 27 Oct 2020 00:50:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DEA416BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603756256;
	bh=4F6i81r5LS+FRPkxH0xgnsavevu9gaX/KuKprU82Egk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eyd8EzmKh1TE3s5m2xtiC5YCGRI5Lcc3+0D/welsoDtpn1AkOrdpwxB13viioiGEX
	 DEEJbOFVafsH24124+m5PDzlvopJj59ZKf+qJ67nRFTjDmJPPSuQIkzj8qL+UBomsx
	 61rlD6MP1iCOgmJWNR74tnJYjCk70PgHA0AHe3Mo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31C1AF80511;
	Tue, 27 Oct 2020 00:46:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCE03F804FF; Tue, 27 Oct 2020 00:46:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9E07F804FF
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 00:46:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9E07F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pyJpf/eE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D00CA20809;
 Mon, 26 Oct 2020 23:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603755986;
 bh=4F6i81r5LS+FRPkxH0xgnsavevu9gaX/KuKprU82Egk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=pyJpf/eEY+TAWPrSMbCDjdQToBWKsI6DxCCMm22sNVPpQvoeTNBYqc4kqsrtIcCL8
 0Ch8pAm7xS9qL0gGMerXMBqAeeRCXoxjOhaA19bHb57jeGI3SvSaeKPa6gQTbQhllG
 scilAEyKxFLQME38YPQnIqObqB92nOcQy0t8Vk7o=
Date: Mon, 26 Oct 2020 23:46:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20201026170947.10567-1-srinivas.kandagatla@linaro.org>
References: <20201026170947.10567-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v1 0/2] ASoC: qcom: add support for QRB5165 RB5 machine
Message-Id: <160375592348.31132.700517684060539910.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: spapothi@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Mon, 26 Oct 2020 17:09:45 +0000, Srinivas Kandagatla wrote:
> This patchset adds support to Qualcomm Robotics RB5 Development Kit based on
> QRB5165 Robotics SoC. This board has 2 WSA881X smart speakers with onboard
> DMIC connected to internal LPASS codec via WSA and VA macros respectively.
> 
> Srinivas Kandagatla (2):
>   ASoC: qcom: dt-bindings: Add SM8250 sound card bindings
>   ASoC: qcom: sm8250: add sound card qrb5165-rb5 support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qcom: dt-bindings: Add SM8250 sound card bindings
      commit: 765c37598494cdb6c8f833e8e46f494af5c7d39e
[2/2] ASoC: qcom: sm8250: add sound card qrb5165-rb5 support
      commit: aa2e2785545aab21b6cb2e23f111ae0751cbcca7

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
