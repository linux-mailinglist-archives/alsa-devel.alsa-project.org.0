Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F78D2FDDA7
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 01:09:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C344C1894;
	Thu, 21 Jan 2021 01:08:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C344C1894
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611187786;
	bh=YL44CnZctD7Nrp8a6u+xZn8iahwWctK4Iz+i4D+mucY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xag2J/9a3klgeGqbfx5Ox0pcUHVdTpY9c4yagz4gczeA2MJJiT8/zgcH4ckagdSdF
	 Me9wYbo02AJkYjUYG6aFhRctK542sm4M2gcKyrc1lMH4O2034kijTobo3YxJOK6Iq0
	 gaTpTzk4hJhl6vE+16JKoiiLmgP+63A7O4TWH5wE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 281A5F804E3;
	Thu, 21 Jan 2021 01:06:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C359BF804E2; Thu, 21 Jan 2021 01:06:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A51DF804DF
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 01:06:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A51DF804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dRO3JocM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A15B2054F;
 Thu, 21 Jan 2021 00:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611187613;
 bh=YL44CnZctD7Nrp8a6u+xZn8iahwWctK4Iz+i4D+mucY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dRO3JocMwyhg34lTsNp5TXa88yVEQZvzQK7XwYm0ApTDG2Gkhz5tQNvfAKX2ZL+sp
 GGXTaDtrwikf016MO9C9A7xvVGF2dv3dp9yEvE9XblV0dyVn0TYVofo4qFLb2lPfb1
 fc4f/hdDvbMu3xtFFOttXTqiWGuS2kW6n9qjBXNt7Iarwhr8TzWcmct1WGi1g12xAO
 pxS2MZHUuoqr3Yx0tN/3QfjJD39xXZmCsoLSzV/vWb86cdWG0iYQSycrGMvUMHR1s8
 ReS9PFjVvX7HEORJ/jk9X2ppKreh4Q9RRvSdRAef2YNNqN/ro5JsGPaoz8CbOJ0ojC
 AXyZlCQuyhyLA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20210119174700.32639-1-srinivas.kandagatla@linaro.org>
References: <20210119174700.32639-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: lpass-ipq806x: fix bitwidth regmap field
Message-Id: <161118753484.45718.12934710533567816798.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 00:05:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, lgirdwood@gmail.com
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

On Tue, 19 Jan 2021 17:47:00 +0000, Srinivas Kandagatla wrote:
> BIT_WIDTH field in I2S_CTL register is two bits wide, however
> recent regmap field conversion patch trimmed it down to one bit.
> Fix this by correcting the bit range!

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-ipq806x: fix bitwidth regmap field
      commit: 1e066a23e76f90c9c39c189fe0dbf7c6e3dd5044

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
