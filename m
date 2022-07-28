Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E1A5835FB
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 02:23:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3ECE1620;
	Thu, 28 Jul 2022 02:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3ECE1620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658967807;
	bh=HxiryJ8L9JZnkbc4LNGwPNPSKfAYMYLquH7AyHXAAYs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EawKBR9+ljJys0i4imRGHCjbUcUTzcgm0P0tYhB0gX3W4Icr3rkPtIIlE+JhuF5jO
	 odTPN3cqgyplwNhX8MHNL4LcZWgnYKotzRgJFVJX6VUCFKOz4OE0rPNnvo8UcDXaYr
	 Knjk+KVEoLzHSW4TBYpL18p/zlcOgskm7Xt4GDsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F55AF800C9;
	Thu, 28 Jul 2022 02:22:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C5E8F8015B; Thu, 28 Jul 2022 02:22:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FBC6F800C9
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 02:22:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FBC6F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T73HDmQu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2AD9361760;
 Thu, 28 Jul 2022 00:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D99C433D6;
 Thu, 28 Jul 2022 00:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658967740;
 bh=HxiryJ8L9JZnkbc4LNGwPNPSKfAYMYLquH7AyHXAAYs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=T73HDmQuknGRE227L8b0rFz7NW90PE9+O8+rrub5aPfbZZUXoQ7lE0dA8N3vwBWE8
 ZEbHwIVXh1AiNCcJGr+bk8Gqg4Ag9BD9Ng+NnJwrd6O9NT776CTOgX0/IHnrojTWQh
 fh8F4emFryx1afKSQ5EUnvNWvKB7pUaSGc0LM6nqw5qdEnsZPrdlwosj2EeceaRrDU
 Uk5XUbu+DbSg/9xhsA6j6mtidObqDYUvig3gD6QExQPdndHBJX2RVYmBC/Z73IdGdi
 9iLl8tdzXuGSyvpqYDqizv8h8PQb+KvmdTP1S4Gydsgetv7eyaCE1zpSVSWUCYvMQw
 rfQJJ8GeQH8fw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, lgirdwood@gmail.com,
 Claudiu Beznea <claudiu.beznea@microchip.com>, tiwai@suse.com, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
In-Reply-To: <20220727090814.2446111-1-claudiu.beznea@microchip.com>
References: <20220727090814.2446111-1-claudiu.beznea@microchip.com>
Subject: Re: [PATCH v3 0/2] ASoC: atmel: one fix and one cleanup
Message-Id: <165896773851.4001859.16860255721720252799.b4-ty@kernel.org>
Date: Thu, 28 Jul 2022 01:22:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d1cc2
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
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

On Wed, 27 Jul 2022 12:08:12 +0300, Claudiu Beznea wrote:
> The series adds one fix for mchp-spdifrx and one cleanups for
> mchp-spdifrx and mchp-spdifrx drivers.
> 
> Thank you,
> Claudiu Beznea
> 
> Changes in v3:
> - changed cover letter title s/few/one, s/cleanups/cleanup
> - fix compilation error and warnings
> - keep only patch 1/5 and patch 3/5 from previous version as the rest
>   of them were integrated
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mchp-spdifrx: disable end of block interrupt on failures
      commit: 768ac4f12ca0fda935f58eb8c5120e9d795bc6e3
[2/2] ASoC: mchp-spdiftx: remove references to mchp_i2s_caps
      commit: 403fcb5118a0f4091001a537e76923031fb45eaf

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
