Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 427CA555267
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 19:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 500F31DE3;
	Wed, 22 Jun 2022 19:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 500F31DE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655919070;
	bh=nbdRl8yrmOHkHu8DVnNH3Pr4b8c6Ku62sPIrhkAdeYo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mrVU7pOfL2mnCHpXlq5HfI/2O/6kaP6hzBwKA/50b5d4YIJl8DTh5Cuux6cTWQXav
	 26kts54U0dA2J/EjbgN5kVc1QFq8dLxoi50/owP1QoT1M1in4CwtOdlzDvlMt2yaux
	 EeEb08HfdIBO855z0FJnzeUVqhXLkxAarl6NhC3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C23E5F8032D;
	Wed, 22 Jun 2022 19:30:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A54EF802D2; Wed, 22 Jun 2022 19:30:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 499C5F80118
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 19:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 499C5F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WKyBLd2y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 07442B81DC6;
 Wed, 22 Jun 2022 17:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D37AC34114;
 Wed, 22 Jun 2022 17:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655919004;
 bh=nbdRl8yrmOHkHu8DVnNH3Pr4b8c6Ku62sPIrhkAdeYo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WKyBLd2y06uc2X/T0ZbOPh+D7H5TTEYcUlrayt2FwH3Zw9+QHhsK2CeQGFL7Gjocu
 +soosTrU06AbL6cWgvgLz98HoLVagGXuhLSTLP5pM6EnaGntEC8AzePt54xqmXzP1p
 52uZ4r+t1fFVhXR1j22E0HADo80olvbyvUhohjBzKLvVHpNQ0NNYhYAuRLKKerNyO/
 xG67FUJBAOEZV9w0rPUCwUeOImG4lmUmdWWOJVuGRykfF+L8B5MvfZNhuVkshZ0ZTQ
 pEABjEVs17SFwyWNthfYGb5r65sFQyo2937r9ys2epsEZK9mXzhZiXnxw/f1UM5hzp
 KF25qFJCTC/xg==
From: Mark Brown <broonie@kernel.org>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>, lgirdwood@gmail.com
In-Reply-To: <20220621145834.198519-1-u.kleine-koenig@pengutronix.de>
References: <20220621145834.198519-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: core: Make snd_soc_unregister_card() return void
Message-Id: <165591900215.1405752.6651339800557082462.b4-ty@kernel.org>
Date: Wed, 22 Jun 2022 18:30:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com,
 nicolas.ferre@microchip.com, linmq006@gmail.com, tiwai@suse.com,
 kernel@pengutronix.de, codrin.ciubotariu@microchip.com,
 claudiu.beznea@microchip.com, linux-arm-kernel@lists.infradead.org
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

On Tue, 21 Jun 2022 16:58:34 +0200, Uwe Kleine-König wrote:
> The function snd_soc_unregister_card() returned 0 unconditionally and most
> callers don't care to check the return value. Make it return void and
> adapt the callers that didn't ignore the return value before.
> 
> This is a preparation for making platform remove callbacks return void.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: core: Make snd_soc_unregister_card() return void
      commit: 1892a991886ace2c3450bec801df2cf4028a803a

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
