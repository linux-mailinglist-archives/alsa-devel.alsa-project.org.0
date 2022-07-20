Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 372C657BECC
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 21:44:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D420B1750;
	Wed, 20 Jul 2022 21:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D420B1750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658346287;
	bh=PnFEDzlN7mX92Wmglf1wrhAi7PN1WR65H5TpqJw7YAA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eeGctK/l9YkuL5ZaG79hwrT9LQROsgq7hmqMwX9O3kji1gX8ZR/sADHHK3yEFOilC
	 Ml+aA4wsCsK7qWNGNdPxvJGFtPNrR1YUS7ND5JJF/qr2Q6ouA7PxXyzcpYA0rkxajW
	 UB0KTUw8/gnfdzQ4y2ep6rCxbW/+TlFZ/RVvWRa4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 887A1F8028B;
	Wed, 20 Jul 2022 21:43:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D542F800BA; Wed, 20 Jul 2022 21:43:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 408AAF800BA
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 21:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 408AAF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PbvTSz0z"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6830361B0C;
 Wed, 20 Jul 2022 19:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CCFC3411E;
 Wed, 20 Jul 2022 19:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658346186;
 bh=PnFEDzlN7mX92Wmglf1wrhAi7PN1WR65H5TpqJw7YAA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PbvTSz0zl6XDNeT/6lXsvFkeYyD8SNq/0/k6ZBeHAMhsCh4g+tm+DclKVN+6Saiby
 z0P3Gl09jkwjmCfKjgaaiJEuwW+r71c1KdEqRXL+u/Hv++ow5l8e7oMBv9iiOGU3ey
 bwJbDKcfM3+GzH0Vr0hSGoapVlNCc3OSj5ogDvO8QbdXh6bQOLeU3jEeciMxALZGhJ
 Lm+6aHjMascnccl4ZNo64oHTp5E603S/pZyaqZNfDyU/FkL0P/ojJtkjx3viqi5Vgt
 fqFyMXa0+QukVxWFilfLX0vwnBhvSeBEKIg53tCJ5pIWkNQOLH88rMKDyg0Ghxc39c
 f9j58/PQxa1Rw==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, nicolas.ferre@microchip.com, Ryan.Wanner@microchip.com,
 alexandre.belloni@bootlin.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@microchip.com, lgirdwood@gmail.com
In-Reply-To: <20220715162922.660859-1-Ryan.Wanner@microchip.com>
References: <20220715162922.660859-1-Ryan.Wanner@microchip.com>
Subject: Re: [PATCH v3 0/2] ASoC: dt-bindings: atmel-classd: Convert to
Message-Id: <165834618426.685508.3523782122255231487.b4-ty@kernel.org>
Date: Wed, 20 Jul 2022 20:43:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Fri, 15 Jul 2022 09:29:20 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This patch series converts atmel-classd and atmel-pdmic device tree
> bindings to json-schema.
> 
> v1 -> v2:
> - Fix commit formatting.
> - Fix titles in yaml file.
> - Removed trivial descriptions.
> - Correct formatting errors.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: atmel-classd: Convert to json-schema
      commit: a3b19e0c9cdd0ece48f34f68f922764f26435f73
[2/2] ASoC: dt-bindings: atmel-classd: PDMIC convert to json-schema
      commit: ca0e30b19dbe5f23cf0abe047259a9e9495624c6

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
