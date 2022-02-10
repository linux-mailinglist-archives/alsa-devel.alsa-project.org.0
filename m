Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA484B13A1
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 17:55:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90F3F192D;
	Thu, 10 Feb 2022 17:54:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90F3F192D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644512131;
	bh=QQhZfdW64LTpTkLBsJ+VYIpO4vR+c1i9aVKNRteNGfU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HyFjBjx8gofNvOfeUDgVpB8wX/ujxVv8o51WjeDM3QBcSzjuS6ieVQEhWx/7QoRyV
	 qWsbp8VNOE4Io6c8qhJfAe7C878GWx8Qf1hZrLOF340J6EZt/MjZ1sQHOssa9y3JhD
	 Ca8fqY1Cer57HkocpPRtw+RLq2MA7aImwCWE5Wvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B67FDF80511;
	Thu, 10 Feb 2022 17:53:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB909F80517; Thu, 10 Feb 2022 17:53:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DEB4F80515
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 17:53:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DEB4F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aC7WTNGh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 88950B82665;
 Thu, 10 Feb 2022 16:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87251C340F0;
 Thu, 10 Feb 2022 16:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644512001;
 bh=QQhZfdW64LTpTkLBsJ+VYIpO4vR+c1i9aVKNRteNGfU=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=aC7WTNGhTPm1hBOHvQVzXbUElSHcZi9uuXPhurKvDjM9axlvLpQ/UTuTYL3vIK09z
 ZloXBcJiGJ2Igf+rmTwm47sYB3pR1DlJaYXR/8Wz0MXSDiH+0RO5cktiqR4IsQgeW0
 auiF/H07VVs7elCjViBK09S0nRfTm1x1646rTmx+5ygUvYzmrIsKAdeZ9s+W0D2L+u
 vKFBZ0+0G0CEWHGJxVE6jw87bGe3fa8nBIdYWVW+C+kF0KXNREs9ucN1VNi09U485e
 uF6w3uZiK98tsffgldc/+8MShpKQWcwsVxWOR4GqkvCVMth3ci3o1QbFmId8g02K1c
 40FGcgKQi5dsQ==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 alsa-devel@alsa-project.org, Jonathan Bakker <xc-racer2@live.ca>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20220129122357.45545-1-krzysztof.kozlowski@canonical.com>
References: <20220129122357.45545-1-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 0/6] ASoC: dt-bindings: samsung: convert to dtschema
Message-Id: <164451199927.2625306.12763946891056497371.b4-ty@kernel.org>
Date: Thu, 10 Feb 2022 16:53:19 +0000
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

On Sat, 29 Jan 2022 13:23:51 +0100, Krzysztof Kozlowski wrote:
> The patchset is based on Rob's sound-dai changes:
> https://lore.kernel.org/all/20220126231427.1638089-1-robh@kernel.org/
> 
> Changes since v1:
> 1. Correct samsung,snow cpu/sound-dai.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: dt-bindings: samsung,aries-wm8994: require sound-dai property
      commit: 7f021b723ea51ae94329e6d76f68189e1696deca
[2/6] ASoC: dt-bindings: samsung,arndale: convert to dtschema
      commit: 0412539614a223817646150d910ab6fedbb80507
[3/6] ASoC: dt-bindings: samsung,arndale: document ALC5631
      commit: b6145d8f0d6436a83a31024d4f9953d7088710b4
[4/6] ASoC: dt-bindings: samsung,smdk5250: convert to dtschema
      commit: 6752770d590594ff42fc19e74c30059d34f133af
[5/6] ASoC: dt-bindings: samsung,snow: convert to dtschema
      commit: a7e5305f7ab03cf3ae19ddd3f29919a7a2da0e5d
[6/6] ASoC: dt-bindings: samsung,tm2: convert to dtschema
      commit: c1fc51ebb098cd43a68ebc82fde51364c207de32

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
