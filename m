Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 828BD461C1A
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 17:48:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EA301F56;
	Mon, 29 Nov 2021 17:47:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EA301F56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638204484;
	bh=gGQZ1XxL/JzQ52kfNY/nOzOWpgFUv70PvloYw+e/SUw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X8d5z6stEh8ojCKMiJ8Zuruq7o+prkEgWcS6nIaTAO50iEMgPWPO84T9SUxNJwghB
	 BRd4ghgZpud3u2eqnOOsOumgs5S0mhXh5k7RuW5t5+tf5hdnAa5KgJ/DgReEVuqCNo
	 qQtEikatrx5ehr8j9ju2cvnbuqE091OJgZUtlz+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47E0EF80506;
	Mon, 29 Nov 2021 17:45:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9235F80240; Mon, 29 Nov 2021 17:45:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FE21F804FE
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 17:45:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FE21F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hiE2Yk2U"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1F26BB81216;
 Mon, 29 Nov 2021 16:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399A1C53FC7;
 Mon, 29 Nov 2021 16:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638204341;
 bh=gGQZ1XxL/JzQ52kfNY/nOzOWpgFUv70PvloYw+e/SUw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hiE2Yk2U385ARDIrpA2Xp8RIz9vooK0BTnopEitzgQEBTTn7DszILuWGh0HmFlbDZ
 8CoS635XzAUBXepyJ91t6lSdg441BlJK1REAYNGB+UdxZRpqdxbhhMxJ4McNa+4XDr
 j/avWi96rnFgt8TH/f8E8LXRz3LTsw8Eo2ug1n0KJKb2Ntz9IdZJWkhMECsqjwdEks
 B9le8Tf75F/l6eQ54uhiMij4ZRjI90kNGk4PuRQnd9wqZtV3di18biCQ2UAHYIpeLi
 TnZg/i40ZEIGv5QQ15jrNqRH37sBzzEwVpvIQd2VKTN4WSG/cVrRRoarNj+5JD7J6S
 6i67b5EbGDzgg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Samuel Holland <samuel@sholland.org>
In-Reply-To: <20211118033645.43524-1-samuel@sholland.org>
References: <20211118033645.43524-1-samuel@sholland.org>
Subject: Re: [PATCH] ASoC: sun8i-codec: Add AIF, ADC, and DAC volume controls
Message-Id: <163820433995.1716750.12532237321592669986.b4-ty@kernel.org>
Date: Mon, 29 Nov 2021 16:45:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev
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

On Wed, 17 Nov 2021 21:36:45 -0600, Samuel Holland wrote:
> This allows changing the volume of each digital input/output
> independently, and provides the only "master volume" for the DAC.
> (The ADC also has a gain control on the analog side.)
> 
> While the hardware supports digital gain up to +72dB, the controls here
> are limited to +24dB maximum, as any gain above that level makes volume
> sliders difficult to use, and is extremely likely to cause clipping.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sun8i-codec: Add AIF, ADC, and DAC volume controls
      commit: fd03cf7f5b4726028cfc2ef76e42d0d5c66377aa

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
