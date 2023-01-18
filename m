Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B0B671E4C
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 14:43:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 779B73C81;
	Wed, 18 Jan 2023 14:42:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 779B73C81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674049417;
	bh=3aw2Of8C8dj0Sl2s2WbPQ4HaD1owl4Omnh3YKIftZSU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AZAjs5W98xqZTiUxXss5m0oeJPFapnUVNyWgEWWk/CON77Oh4IFCqt44CNH/qKjNG
	 L3C2pEJdTZJT93MkKptM/iOBFdD1c99jx83216aUI/AaHdpayDpJPUTVICfhCDA/0N
	 emhWKxvbz2m0qSK2WMdDHKgzYQzsVoyK9DULqmEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3146F80083;
	Wed, 18 Jan 2023 14:42:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB67AF80557; Wed, 18 Jan 2023 14:42:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34922F80083
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 14:42:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34922F80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SEAzXHBa
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D382BB81D15;
 Wed, 18 Jan 2023 13:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9815C433F1;
 Wed, 18 Jan 2023 13:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674049359;
 bh=3aw2Of8C8dj0Sl2s2WbPQ4HaD1owl4Omnh3YKIftZSU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SEAzXHBa6pUh42R8aSZQ8mep00K65aAwIAYt03OIA1yAqEk3Lh1t9RZnPjY4lZOMm
 +jzbZbATJHB9xhbD5T0ZNQcuneI6wT7j0xtBXyqAv8aun2KnSGfFvueZ+LMLVYelY4
 eHguuCw8v5z4vWMIFn8+bdgMQHNYSkq4Tw5U7WZWk1CCksDbNgwu757O4GNLWftzZH
 HvPPJggcAmDftf/c/l6JGnGLrZNt4cMfihFtlWj7SSweCekAuBH1dydaQc9eWrfdeM
 hZJ0Nvbg1SItcJ0yWxxyGpD7NQyWbFn77rSD5oVb5GIV4jRcvuxpjddSYhW9TrzA2T
 OJxNw12FHol6A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com, perex@perex.cz, 
 tiwai@suse.com, pankaj.dubey@samsung.com, alim.akhtar@samsung.com, 
 rcsekar@samsung.com, aswani.reddy@samsung.com, 
 Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
In-Reply-To: <20230116103823.90757-1-p.rajanbabu@samsung.com>
References: <CGME20230116103841epcas5p17b33f2b6567935d6be59b4d2b5d9f847@epcas5p1.samsung.com>
 <20230116103823.90757-1-p.rajanbabu@samsung.com>
Subject: Re: (subset) [PATCH v4 0/5] ASoC: samsung: fsd: audio support for
 FSD SoC
Message-Id: <167404935251.749539.9077335076740575140.b4-ty@kernel.org>
Date: Wed, 18 Jan 2023 13:42:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-77e06
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 16 Jan 2023 16:08:18 +0530, Padmanabhan Rajanbabu wrote:
> This patch series enables audio support on FSD SoC.
> 
> Changes in v4:
> 1. Rebased and addressed review comments provided for v3.
> 
> Changes in v3:
> 1. Addressed all the review comments provided for v2 patch.
> 2. Fixed compilation warnings reported by kernel test robot.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/5] ASoC: dt-bindings: Add FSD I2S controller bindings
      commit: 93d79d410c0b33ff7b31015b9c2459bb5cabf030
[2/5] ASoC: samsung: i2s: add support for FSD I2S
      commit: bc36d761cad7f3fec22cd97ddaa80f0120610181

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

