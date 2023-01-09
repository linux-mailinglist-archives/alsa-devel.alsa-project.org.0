Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 840286630E3
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 21:03:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71D74C3C0;
	Mon,  9 Jan 2023 21:02:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71D74C3C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673294583;
	bh=YAYz0p0oVOLsolT5f6Kmw9DyIZncLtGliZqae8vjQ0c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QpmTIF8VDI/PGomMroSr7PeZebDDrBuXA9UhZUaXpd/agxsUCGW4YNsF+2zSiSFtM
	 8/gyBjKNEQUQi9c3gX0ynlFbm/4ZZ57sWhaHiqivHAwrgaOb+8nFRwnyQRBrBKney+
	 RgNtGR4BE/eKULnE+uE5tdp4cde8cu2+Fa6pGFF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CA35F802BE;
	Mon,  9 Jan 2023 21:02:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 297D1F802BE; Mon,  9 Jan 2023 21:02:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94307F802BE
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 21:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94307F802BE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gDjxK4yh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78013B80F79;
 Mon,  9 Jan 2023 20:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E487DC433EF;
 Mon,  9 Jan 2023 20:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673294519;
 bh=YAYz0p0oVOLsolT5f6Kmw9DyIZncLtGliZqae8vjQ0c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gDjxK4yhRWI1GNYTq6ciYMfndn+yP+JCIhNb1Lh0b1cvBA5mWeRVdw4mgH2w0UhCl
 HL3u+iok43AFAm6n4foaEgQF+tUPhNFi6FYHQ47YlDYDn6cZG/Np7jGToyjK6Cg9YO
 SiXbEexND3lcwX5ThDXnOy8/5SnWKT+RFpVuQYIj+Alf37/smjMgijSmpozwOPn1CU
 msVq3yYdGwZ59PEiEHkWlEY9M4u9G+bAd1jaQunTKEuRd1bkEE+y8pP7/D004/lOCh
 fmsndXIM0smtGAVgNTnrwTlQcYG+ocD/lj8aaMSZZ3fw1u1Y0y2ISNi/F0Q0NT5Gq7
 k72KUeYyuQjGA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Francesco Dolcini <francesco@dolcini.it>
In-Reply-To: <20230104140412.35575-1-francesco@dolcini.it>
References: <20230104140412.35575-1-francesco@dolcini.it>
Subject: Re: (subset) [PATCH v2 0/3] ASoC: nau8822: add speaker Bridge Tied
 Output
Message-Id: <167329451666.378391.8486999662961595073.b4-ty@kernel.org>
Date: Mon, 09 Jan 2023 20:01:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: wtli@nuvoton.com, kchsu0@nuvoton.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Benjamin Marty <info@benjaminmarty.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 04 Jan 2023 15:04:09 +0100, Francesco Dolcini wrote:
> Add support for BTL (Bridge Tied Load) configuration to NAU8822 audio codec,
> since this requires adding a new property to the binding convert it from
> txt to yaml first.
> 
> v2:
>  - added Krzysztof reviewed-by and acked-by
>  - removed non-relevant information about SPI not being supported from binding document
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] ASoC: dt-bindings: nau8822: add nuvoton,spk-btl property to dtschema
      commit: af20f01e4d1d8fdb0ef14dcb95bd76fa8006dfdd

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
