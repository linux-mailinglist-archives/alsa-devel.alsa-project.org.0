Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D6F60E852
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 21:06:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80DEF3987;
	Wed, 26 Oct 2022 21:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80DEF3987
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666811211;
	bh=U+R8INu9G+SgFDxjAisYOYC9BdZ7qdOXy8lBhXyOEwE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MHlXK/r6pFCOKgVpq1Kwww7HqWBOKWMrmTjU2h9GkEAuFtSHz4sszeL7ewht6LtyI
	 FYWd+AJsjTrdNkpHhpaYRub8ierbyW2TlcACI8m9GXlTdBLP3+3K4A/wN8bS8i/Bhs
	 oJi2JWED51tdSqtciZv46XL3hYWxqyhwAOI92RjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 294B4F80571;
	Wed, 26 Oct 2022 21:04:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10727F80571; Wed, 26 Oct 2022 21:04:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53443F8055B
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 21:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53443F8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rI4nDtKH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD2FEB8238C;
 Wed, 26 Oct 2022 19:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2740C433D6;
 Wed, 26 Oct 2022 19:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666811075;
 bh=U+R8INu9G+SgFDxjAisYOYC9BdZ7qdOXy8lBhXyOEwE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rI4nDtKHjUysmmUGj09yG6xS8huuOsMAGRr1z4i7boXV2jOUSegFC8c0jzlnnklBh
 QZghP+s7yItJfFxeBtKdiDnojkqHThYxwjwpUt3SVs++c8/ZG+1I6PzLSZ5+xuIycQ
 X8FPkkip5XZyWzrtQaZbTrucYseGGhEeyyOHt3pWuL92WyBxIed6Jx/2+0uY2jUiKT
 AI/0YlNxPWu/pleo0PxcyuhgVSONw2Q9l1auUZVo3Z7fyrBzqjGhQKHfx+iminrKCL
 5HoJKBhWNXVAV3Mf4CiFoJJcFyau3SH6zwcDzuCoijKASZpM1Jt2KAgha7K3h7FE6j
 9rpimXL2LU/qQ==
From: Mark Brown <broonie@kernel.org>
To: paul@crapouillou.net, lgirdwood@gmail.com, tiwai@suse.com,
 Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, perex@perex.cz
In-Reply-To: <20221023143328.160866-1-aidanmacdonald.0x0@gmail.com>
References: <20221023143328.160866-1-aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH v6 0/9] ASoC: cleanups and improvements for jz4740-i2s
Message-Id: <166681107350.960840.12779879137607542680.b4-ty@kernel.org>
Date: Wed, 26 Oct 2022 20:04:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, zhouyu@wanyeetech.com
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

On Sun, 23 Oct 2022 15:33:19 +0100, Aidan MacDonald wrote:
> This series is a preparatory cleanup of the jz4740-i2s driver before
> adding support for a new SoC. The two improvements are lifting
> unnecessary restrictions on sample rates and formats -- the existing
> ones appear to be derived from the limitations of the JZ4740's internal
> codec and don't reflect the actual capabilities of the I2S controller.
> 
> I'm unable to test the series on any JZ47xx SoCs, but I have tested
> on an X1000 (which is the SoC I'll be adding in a followup series).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: jz4740-i2s: Handle independent FIFO flush bits
      commit: 8b3a9ad86239f80ed569e23c3954a311f66481d6
[2/9] ASoC: jz4740-i2s: Convert to regmap API
      commit: cf375e693252f4e8ecb6256af631ff381381a3dd
[3/9] ASoC: jz4740-i2s: Simplify using regmap fields
      commit: 0fddb4bce669fd255f6ffade6905da5c8ed3e254
[4/9] ASoC: jz4740-i2s: Use FIELD_PREP() macros in hw_params callback
      commit: b355ebebb17c438b90c3d339f38a79559f7259df
[5/9] ASoC: jz4740-i2s: Align macro values and sort includes
      commit: dacc06b812f46e0d4cfdda98134a8b5d64375341
[6/9] ASoC: jz4740-i2s: Support S20_LE and S24_LE sample formats
      commit: 7abd01cfc5428581b21099eb629d88e76a47b67a
[7/9] ASoC: jz4740-i2s: Support continuous sample rate
      commit: 84a914349ba2634e8db6b0815f100697d878d033
[8/9] ASoC: jz4740-i2s: Move component functions near the component driver
      commit: 165afe6b66aafaafc95484ac2f0f09f78d62386b
[9/9] ASoC: jz4740-i2s: Refactor DAI probe/remove ops as component ops
      commit: 4e02fd6207474ef2d882b8620f4c3db9a02d4ddd

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
