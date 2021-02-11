Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43329318EE8
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 16:41:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 923CE16F2;
	Thu, 11 Feb 2021 16:40:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 923CE16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613058074;
	bh=LsU6IY0XMvB35GCkDSTyQJjmM/Iv44ftFdEgZbsQGzo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ku9C3BAObNA27ISOQO3ULFaGeFgtv20f/4IChR1QF9i5KD3VSKRYs7CoAxsAuAVKO
	 X4hPnjXfj7OkVqWRaqX5dOsouP6msEI81v7wH7t1UDQBfFQ4vBe3zszLEiWGUsuM4+
	 mOSGvBKLdSuAYaM+fxypL9dkSAn7r+7ofhBDg5zA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3E36F8010D;
	Thu, 11 Feb 2021 16:39:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18370F801D5; Thu, 11 Feb 2021 16:39:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C98E5F80165
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 16:39:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C98E5F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="I7qwTeL2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 081C364E8B;
 Thu, 11 Feb 2021 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613057974;
 bh=LsU6IY0XMvB35GCkDSTyQJjmM/Iv44ftFdEgZbsQGzo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=I7qwTeL246KJjiI9qrbAo9OfDiaTLtBfHqWRmF2UDaKuNvQEw9HVa7/O/o3V6hDUg
 hZnsF92tW2J10kdBGkX2roF1PUo6he4vxFVy0TeCfor8ebJmn8eWLFvkYEEw6Iyp11
 kZv7qNqcPx+x/J/KohqG00KEIgN4MVZQFTurAfapkryRBv+fby5VEQ/dr//X4gUMAR
 +I4g3c7ur4ZR6BED1N9Ht9LmD1FjeCbUWf46mT2mq6i4c9Dto5xSXqMX/+yvE7LyW4
 ph80WGB4yrsLIAzmlHXdNcmmni9ZDFI8eOisSrysMlFQen4l5lwNiWp3xYvlEKc+ZF
 MrMeiGpGY9YKQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20210211122735.5691-1-srinivas.kandagatla@linaro.org>
References: <20210211122735.5691-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v5 0/7] ASoC: codecs: add support for LPASS Codec TX and
 RX macros
Message-Id: <161305792123.12370.16328158570413320155.b4-ty@kernel.org>
Date: Thu, 11 Feb 2021 15:38:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

On Thu, 11 Feb 2021 12:27:28 +0000, Srinivas Kandagatla wrote:
> This patchset adds support for two Codec Macro blocks(TX and RX) available in
> Qualcomm LPASS (Low Power Audio SubSystem).
> 
> There are WSA, VA, TX and RX Macros on LPASS IP, each of the Macro block
> has specific connectivity like WSA Macros are intended to connect
> to WSA Smart speaker codecs via SoundWire. VA Macro is intended for DMICs,
> and TX/RX for Analog codecs via SoundWire like other WCD938x Codecs to provide
> headphone/ear/lineout/amic/dmic etc ..
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: qcom: dt-bindings: add bindings for lpass rx macro codec
      commit: f133de9e32374841c5ed1ad5cf18ed14098a0f4c
[2/7] ASoC: codecs: lpass-rx-macro: add support for lpass rx macro
      commit: af3d54b99764f0bdd83fcbd1895d23b83f8276be
[3/7] ASoC: codecs: lpass-rx-macro: add dapm widgets and route
      commit: 4f692926f562ff48abfcca6b16f36ff8d57473b6
[4/7] ASoC: codecs: lpass-rx-macro: add iir widgets
      commit: f3ce6f3c9a994d3fa5057cadfaa1d883e0d938fa
[5/7] ASoC: qcom: dt-bindings: add bindings for lpass tx macro codec
      commit: ca955cc980afc066a380567e371480634e48eb7e
[6/7] ASoC: codecs: lpass-tx-macro: add support for lpass tx macro
      commit: c39667ddcfc516fee084e449179d54430a558298
[7/7] ASoC: codecs: lpass-tx-macro: add dapm widgets and route
      commit: d207bdea0ca9efde321ff142e9b9f2ef73f9cdf5

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
