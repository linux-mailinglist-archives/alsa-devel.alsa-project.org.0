Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 141865835E9
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 02:07:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92FB7100;
	Thu, 28 Jul 2022 02:06:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92FB7100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658966821;
	bh=wINtCHc5eLNlHmB53FT2rtl/5x4h8+wHWDC1bCkxcbk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qs1aox/I6zNJBgkN58ZCqn+rW4IeGKkbm2WgKAUfVGgkXKjnzFgYdfhT4P729DVve
	 P0zhwT16liAh2SaUoX8TXcuJeVDb6dnxpPRO21A+wJOfxj9xFrez1YdykXVcGIx4Hk
	 wEyVQrCVrcFJsH41winJPbKPfHnMa4M2qXaOqNHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF782F80171;
	Thu, 28 Jul 2022 02:05:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6B15F8015B; Thu, 28 Jul 2022 02:05:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 NO_DNS_FOR_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41261F800FA
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 02:04:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41261F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dju8klrp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05B6A6174B;
 Thu, 28 Jul 2022 00:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721D3C433C1;
 Thu, 28 Jul 2022 00:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658966677;
 bh=wINtCHc5eLNlHmB53FT2rtl/5x4h8+wHWDC1bCkxcbk=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=dju8klrp1eA2utIGaZDOwT8k5dc/FhHAPdDk5VpUIfEfc2/96bAGzrm/SsqnTYT2h
 ktBwE2mZh3wrLUhVR5j5FVCkuaovYlx+Y/PjI1Y5df5ALqHc7vYdpalpE2sU9aTwSg
 HZefOC0ohmx3Dxn7exySpyC8Q/TsbqoCBULagkrEv3XgILB3SdkkPTuhZyVnPcuUX6
 ptwCgH2eVJyA6JW1MbISoBB26Hm6phQkr43nJ/Nyj4KnISW2ZX06sDoMfNZYk4KWTl
 P/VWWvZdyC1wgi88hNTcmD+YS96uWLS8mNcETiWYvQLTabtOohrZmkmocRFAHHWAhx
 KXW2WYFdQcIOw==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 - <patches@opensource.cirrus.com>, Bogdan Togorean <bogdan.togorean@analog.com>,
 alsa-devel@alsa-project.org, 
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org
In-Reply-To: <20220727164050.385241-1-krzysztof.kozlowski@linaro.org>
References: <20220727164050.385241-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: use spi-peripheral-props.yaml
Message-Id: <165896667516.3927242.3602967595765365551.b4-ty@kernel.org>
Date: Thu, 28 Jul 2022 01:04:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d1cc2
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

On Wed, 27 Jul 2022 18:40:50 +0200, Krzysztof Kozlowski wrote:
> Instead of listing directly properties typical for SPI peripherals,
> reference the spi-peripheral-props.yaml schema.  This allows using all
> properties typical for SPI-connected devices, even these which device
> bindings author did not tried yet.
> 
> Remove the spi-* properties which now come via spi-peripheral-props.yaml
> schema, except for the cases when device schema adds some constraints
> like maximum frequency.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: use spi-peripheral-props.yaml
      commit: abed2baf6814597f244cd879285b2210b0870548

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
