Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B26681C16
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 22:02:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7916DF1;
	Mon, 30 Jan 2023 22:01:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7916DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675112546;
	bh=4kTM7qZTPCTN7vtUc2O1W4p+zcVF/sa0deMNMF+1J5o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mRhHzvmTzA0tUlyVHNOxPTE79syVRmuVYwqLGF8Ry65elX/nQ1/je07ro/ae8uL8N
	 i5LKnWzA6PEushgB1YRQh5UDaDHsuzsD3L/LGiaa4D6cmekR0cpgVKZat+9SbnbfoK
	 ildO42YSnicoyE7y3WHtcp1oZh0K0UQtLFj1wuJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B84C1F80558;
	Mon, 30 Jan 2023 22:00:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49344F80557; Mon, 30 Jan 2023 22:00:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8B71F80549
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 22:00:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8B71F80549
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PG1ECVPt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6E3E61263;
 Mon, 30 Jan 2023 21:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D4FC433EF;
 Mon, 30 Jan 2023 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675112418;
 bh=4kTM7qZTPCTN7vtUc2O1W4p+zcVF/sa0deMNMF+1J5o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PG1ECVPtvhUFMQEyQ9udjXNZeOuPi8QpZSWJSqRjiQIYL8Djne8Gqu2DH+WkwjCaT
 PQBalZJ6ekV4ZreDtCBtwkh5okBTObHB9BmEW7q83pnaEMcLHGVP1pQs6+mp5gSJGU
 yueSg9Ta/IvdJeGYR+DfOwNBBnKDNYXLb/DInGK95rMtI6YgHOJAM1Xr5vygZVQxGk
 QXiq62aVpZLuGfGWKlGdkNPTlzL7c5lVgBKnQZSuqSOkU0b9XWGZSQEEcHpZb+eczA
 ZSE9DF7sVXALaK7n+gy+g7ZZQcWPS8dMLA8+AobyTgmMEF6cKRHjr5SRg4hRmbSgNR
 L2D3fwL0SJHVw==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, 
 Alexandru Ardelean <alex@shruggie.ro>
In-Reply-To: <20230128082744.41849-1-alex@shruggie.ro>
References: <20230128082744.41849-1-alex@shruggie.ro>
Subject: Re: [PATCH v2 1/4] ASoC: codecs: tas5720: split a
 tas5720_mute_soc_component() function
Message-Id: <167511241532.2141894.5359389287914359338.b4-ty@kernel.org>
Date: Mon, 30 Jan 2023 21:00:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: steffen.aschbacher@stihl.de, tiwai@suse.com, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, 28 Jan 2023 10:27:41 +0200, Alexandru Ardelean wrote:
> This is to be re-used in tas5720_mute() (which is part of the dai_ops) and
> also in the tas5720_fault_check_work() hook.
> 
> The benefit here isn't too great (now).
> It's only when we add support for a new device with a slightly different
> regmap that this becomes more useful.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codecs: tas5720: split a tas5720_mute_soc_component() function
      commit: 879142be618c05d234db31cbf69f101c53b7892f
[2/4] ASoC: codecs: tas5720: add support for TAS5720A-Q1 (automotive) variant
      commit: c24a62be09d8a0c7ede1c209055a4ac6760a45ee
[3/4] ASoC: tas5720: set bit 7 in ANALOG_CTRL_REG for TAS5720A-Q1 during probe
      commit: 88f748e38b283702a620e635820f1864bf32db0e
[4/4] ASoC: dt-bindings: add entry for TAS5720A-Q1 driver
      commit: 8d076a992eb86b99afb04980ac4b57e3a79f6704

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

