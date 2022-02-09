Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7BD4AF633
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 17:11:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 935DA18F2;
	Wed,  9 Feb 2022 17:11:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 935DA18F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644423112;
	bh=0ViYHYGupp0RVHwWiup4TjHH132SXczPULdGlmJS4Sk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ntebvgiYPmL5kPsD3B9bJiKtfoF3+ew+3tc3iiy1ciSYz55IqtnvQS4koTs6NSa1N
	 EwYTaxEpa0lYaIQiOUKZ9GwAFS2/m17QL8GNW+yVq9cAajwsJrVotZjM6bLSWQDmuo
	 EbnxoGIOPJtJBfnEVZwFKwJsYthroNo8Z8yJDibM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67AD7F80515;
	Wed,  9 Feb 2022 17:10:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5AD4F804AA; Wed,  9 Feb 2022 17:10:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 652D6F800A7
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 17:10:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 652D6F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Pdie2qDQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2023CB82217;
 Wed,  9 Feb 2022 16:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388CCC340ED;
 Wed,  9 Feb 2022 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644423017;
 bh=0ViYHYGupp0RVHwWiup4TjHH132SXczPULdGlmJS4Sk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Pdie2qDQcx/nuhGYnF+wph5D3XjR0Tnjb9L+uB/2bd/qP86rzAlZ82l8L1AY/DKlq
 p4LZFO6bs/a3nO2T+Tpd1Ecltklu8c0R0iAS+j6FoQaZw/qSqaUp80YhDL7eIHJksF
 mxdXmSvKIk/SkAR6kP5YRaOfz/m6/6yltTyxl/+5o7PkJxfegbEwFB0NsB5qeMKAyu
 +NJp30CtYoPOBqiU/Uh0KV59kuir4eInH4MEtTizRvTl8qgE2gG0Op+OjhEWBsjxvM
 PrLHGR+Rwb8QmTWZa+fzrgbRHyoWrpnY+baRwa+cfHvo32pNJXy5Ypn04PgbcygSkT
 lNxSb4XtBNDBg==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20220209063008.2928-1-j-choudhary@ti.com>
References: <20220209063008.2928-1-j-choudhary@ti.com>
Subject: Re: [PATCH v6] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
Message-Id: <164442301594.4135858.14145086977040876727.b4-ty@kernel.org>
Date: Wed, 09 Feb 2022 16:10:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski@canonical.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, peter.ujfalusi@gmail.com
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

On Wed, 9 Feb 2022 12:00:08 +0530, Jayesh Choudhary wrote:
> Convert the bindings for McASP controllers for TI SoCs from txt
> to YAML schema.
> 
> Adds additional properties 'clocks', 'clock-names', 'power-domains',
> '#sound-dai-cells' and 'port' which were missing from the txt file.
> Removes properties 'sram-size-playback' and 'sram-size-capture'
> since they are not used.
> Adds 'dmas' and 'dma-names' in the example which were missing from
> the txt file.
> Changes 'interrupts' and 'interrupt-names' from optional to
> required properties.
> Changes 'op-modes', 'serial-dir' to optional properties as they are
> not needed if the McASP is used only as GPIO.
> Changes 'tdm-slots' to required property only for I2S operation mode.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: davinci-mcasp: convert McASP bindings to yaml schema
      commit: 8be90641a0bbd9a3606547aa6a0f70b020e74c8f

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
