Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DC638C9CD
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 17:09:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0233F16A1;
	Fri, 21 May 2021 17:09:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0233F16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621609792;
	bh=+s3tbWsUsJ09qhWtcfTtaWKIFSjqWd/CEMzp6/HYzbY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ByV+EL7YxFMGw4YYv1qSedz24rgOf8E+eIx5I+smYVaFF5dMQhGhEFZt/J3I9ynxV
	 Q8Ez8QY1DqyP1DGRIZxmFHr9iW49i2npTxzAXw7SkPz0rl87uzDkASM43MC1MbSvc5
	 z64dnwE5TA9lsY4QL+BO7J64KrUdKXFbcZWYxmjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67655F800C1;
	Fri, 21 May 2021 17:08:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9BE8F800E5; Fri, 21 May 2021 17:08:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B406DF8016E
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 17:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B406DF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ogm/5ZQl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F0F7613CB;
 Fri, 21 May 2021 15:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621609691;
 bh=+s3tbWsUsJ09qhWtcfTtaWKIFSjqWd/CEMzp6/HYzbY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ogm/5ZQld7rsZ/9TfQAff2RHEDW8OVM39rnphBcnTamJind06DP1tBjVo5zNHBGy4
 KIeeQdnHzwt/a1czwHEiM4jywDNn6gkVVB8ii5Zvou9dxNtN4vemj1gYmjk86uwWpB
 03J/fxJ3eKGYNiNUnbr75jgAlr8H6oos14jcUhE4y9EIbTFLDFax8LjG8oXiCQ4Hnq
 bnhi70IkNbh4yGczKoq136z6SZrA2nrB2hVAnuXvFIlIMz8NZrmFa1UbZAHNwC5fEM
 ON4RTHp6H4sYL9PfDc9q9Qfw6xo4W9KtdeaJdUXIlm/Gyqvltc5GOG060H15PiwPDW
 jCPf+SBmG15Iw==
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Use optional clk APIs
Date: Fri, 21 May 2021 16:08:01 +0100
Message-Id: <162160953475.10636.11463749705483843535.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520014807.3749797-1-swboyd@chromium.org>
References: <20210520014807.3749797-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Banajit Goswami <bgoswami@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
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

On Wed, 19 May 2021 18:48:07 -0700, Stephen Boyd wrote:
> This driver spits out a warning for me at boot:
> 
>  sc7180-lpass-cpu 62f00000.lpass: asoc_qcom_lpass_cpu_platform_probe() error getting optional null: -2
> 
> but it looks like it is all an optional clk. Use the optional clk APIs
> here so that we don't see this message and everything else is the same.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-cpu: Use optional clk APIs
      commit: af2702549d68519ac78228e915d9b2c199056787

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
