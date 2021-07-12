Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B75BA3C5272
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 12:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48FEF1686;
	Mon, 12 Jul 2021 12:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48FEF1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626087009;
	bh=dOT78/KX5HZL/3gKd0QY88lngji6DEA/0Sc7FJttRRg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qubb8dFEcM9Y5epDZWER4Rj9N3lsLglMVWwtmmqT+7BkLYnUP30URdIPdCeVh+P6p
	 hVAbmI9D9hpwZIuXVRimUpN7EHzKcM+hIE1sUinsLUFLr/JLObguFMqEoVFZ2yeKhR
	 2N91H6PEr/DdCbOsrZ+C1KvfHPFvvRXdD0M0o/Zw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DF79F804DF;
	Mon, 12 Jul 2021 12:47:53 +0200 (CEST)
X-Original-To: alsa-devel@Alsa-project.org
Delivered-To: alsa-devel@Alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F1ABF804D8; Mon, 12 Jul 2021 12:47:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6510F80253
 for <alsa-devel@Alsa-project.org>; Mon, 12 Jul 2021 12:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6510F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WGtbuoJw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5003161130;
 Mon, 12 Jul 2021 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626086862;
 bh=dOT78/KX5HZL/3gKd0QY88lngji6DEA/0Sc7FJttRRg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WGtbuoJwJ5ezlvMcW1gHJMyYsT5XQUIMTGze6TZOfskB2g4kQF9Txa8FOnB1H4xr9
 t/Fhn0dLvjio2nLN3FZPeudFiOu70tlr8qz6DxagjusXI08VF72tcXob8cbZzVy1CE
 mtHPTt3OeKWXdWPklSnFgxq+i7BgH7NCNS1ghxgwvP55JVPeIaVoLaLys/TVbFcp6Z
 /R9+kQyRV0OZ3dxfPdW2KYmu7olU5r3IwRRFhjqMc47xBqBv44dq6JiNbSCld5ef1K
 oM+hAzinbCCA5u/N26ehcV4Q6FYSKTwUo+7LV1YOvnZIDkivbm2K/DsglgcNW5NVLX
 MzYvuo43fU1YA==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: tlv320aic31xx: Make regmap cache only on probe()
Date: Mon, 12 Jul 2021 11:45:58 +0100
Message-Id: <162608623151.3192.8534888383368038413.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210707160234.16253-1-broonie@kernel.org>
References: <20210707160234.16253-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 alsa-devel@Alsa-project.org, Lucas Stach <l.stach@pengutronix.de>
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

On Wed, 7 Jul 2021 17:02:34 +0100, Mark Brown wrote:
> Currently the tlv320aic31xx driver has regulator support but does not
> enable the regulators during probe, deferring this until something causes
> ASoC to make the card active. It does put the device into cache only mode
> but only when the component level probe is called, however if interrupts
> are in use the driver will access the regmap before then which if the
> regulators are not powered on would cause I/O problems.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320aic31xx: Make regmap cache only on probe()
      commit: 6c621b811f99feb3941f04b386795b45f47cd771

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
