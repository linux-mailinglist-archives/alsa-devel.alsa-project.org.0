Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 253065204B9
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 20:48:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA2FF16C6;
	Mon,  9 May 2022 20:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA2FF16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652122103;
	bh=p7HuNEoLVAfJ9j3uyjrKWwmQvfEfC4JfRx5T9daNFa0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vmZuV2tHe6XX59FBF6ICxgLTrybAHfFeGZdkx1XhZ5DKcTrOkOPRujoA9/26j/KCv
	 CO5t0HvPmsJCwszdkXWMyI7HLEbyE7A5ju8fS/QafOawlcKovbin4drtOiiNjEjwHD
	 4UwYf/YVLq2ApxnNW0v66+0uL+Y2F+OyE1vbxgaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A413F80269;
	Mon,  9 May 2022 20:47:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFA17F80237; Mon,  9 May 2022 20:47:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47580F8011C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 20:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47580F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EL4GDAP1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5AB19B810EA;
 Mon,  9 May 2022 18:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E7AC385B6;
 Mon,  9 May 2022 18:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652122038;
 bh=p7HuNEoLVAfJ9j3uyjrKWwmQvfEfC4JfRx5T9daNFa0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EL4GDAP1iF89mPzheQj9VmI5CRQMXXCv/D2nAwkCgBlp9YJqlPzZWm6EU7eViwm/h
 nPe9/sl+/MrUSP3fOA0tU9CnJ/FWKBj5Eu4DgvS2DmOCQtvTLcEpZEmfkyKMLxPklz
 Xag3WdHgutkk5HJTafYoYq6aid3oi4c8kTNzA++vwNj6sMCuj/psoW8ZfgrJVij4m8
 9BAg6nEgDGgte6njuD8kykbTZCDFfUy6RttEnsq5Ei0eggbbfbKZP030JCjJS/I0In
 dllGdPba00PJVcXpOdppwuPP1QoSRQm8PWFsLXU2wyGj+gErK32ShaSYcRbQ2LihOO
 PhlgMo/A/dPCw==
From: Mark Brown <broonie@kernel.org>
To: codrin.ciubotariu@microchip.com, broonie@kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220506130349.451452-1-broonie@kernel.org>
References: <20220506130349.451452-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: sam9g20_wm8731: Use dev_err_probe() for
 snd_soc_register_card()
Message-Id: <165212203694.1274938.11416951870088105385.b4-ty@kernel.org>
Date: Mon, 09 May 2022 19:47:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Fri, 6 May 2022 14:03:49 +0100, Mark Brown wrote:
> Log the error code when snd_soc_regster_card() fails, but fold in the
> silencing of deferred probe errors.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sam9g20_wm8731: Use dev_err_probe() for snd_soc_register_card()
      commit: 29f4078f777fed4cb47695b284938fbfd80f990e

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
