Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA574A8795
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Feb 2022 16:21:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA4FC1759;
	Thu,  3 Feb 2022 16:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA4FC1759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643901707;
	bh=+oMipdTqeGn3t2g6jeKchCDXYGGczB91ZYbqdBllfk0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FZ/7stHySKEYoyEMg2yDw+QJv2zsdTXbv3qdNJvaPT7wIcOiWXjs3rhqyilMNJATQ
	 1twBEhkgGPagNSGgmtwWzu3nGUlH5MbM8SQPm9Sttz0mMn2Cg8VJMSzFeir2VbYFj6
	 +qZJQ2fB/tGLYqC806gCi3HR9DIHt3RX7erQPzLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75EE7F8051A;
	Thu,  3 Feb 2022 16:20:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB565F802BE; Thu,  3 Feb 2022 16:20:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6063AF80171
 for <alsa-devel@alsa-project.org>; Thu,  3 Feb 2022 16:19:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6063AF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="itPTw0gL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DA0B60B82;
 Thu,  3 Feb 2022 15:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB126C340E4;
 Thu,  3 Feb 2022 15:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643901597;
 bh=+oMipdTqeGn3t2g6jeKchCDXYGGczB91ZYbqdBllfk0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=itPTw0gLEjL3s15URQDHf3SmNEb44BLN8VY72AqnLPJOMUFXvMZ8KxtyYKhwCs0hz
 M1IoM9t2k9gjHOz0gWu5RN/riCkIWL9gBa3rVXS8yZnllVmHQmCPTe+9yUt86qDanj
 fKNC8I+KvNwELEOeTzJZhF8LB/Bp1cxY0ccAacqwqBfriC1Abc3mlYDPuluJvr/+pA
 mKxyhtsxWLBqfNQHbkV9+VrfjakjI134e+CnooSkR7F1GhkZT9sDeljhMR6sp6wnEl
 GzKzdCs4bCGMdZyb1SfvY7qoOmR6I1U7EyPDG0/U+rfPYRPhcLuk00v5iIYgIRZbdB
 QKR49XsCHj/Cg==
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220203020116.12279-1-samuel@sholland.org>
References: <20220203020116.12279-1-samuel@sholland.org>
Subject: Re: [PATCH 0/3] ASoC: sun4i-i2s: Support for Allwinner R329 and D1
 SoCs
Message-Id: <164390159447.786717.831868545725165555.b4-ty@kernel.org>
Date: Thu, 03 Feb 2022 15:19:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 2 Feb 2022 20:01:12 -0600, Samuel Holland wrote:
> This series extends the sun4i-i2s binding and driver to support some
> newer versions of the hardware. Each instance of the hardwar now has
> multiple input/output pins, and channels can be muxed between them.
> Since so far the driver only supports a "default" linear channel map,
> the driver changes are minimal.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: sun4i-i2s: Add compatibles for R329 and D1
      commit: 7f97b2ad948343c3be543d12c2965f74bddc34c7
[2/3] ASoC: sun4i-i2s: Update registers for more channels
      commit: c8bbc1de9088fedb5d71db7d185c37db18feb2e1
[3/3] ASoC: sun4i-i2s: Add support for the R329/D1 variant
      commit: e2ce580f1fffc009807da73adf7dc86912ab6a19

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
