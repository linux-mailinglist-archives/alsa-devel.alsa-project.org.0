Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 950AA45FAE4
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Nov 2021 02:32:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32DC91714;
	Sat, 27 Nov 2021 02:31:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32DC91714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637976755;
	bh=ZpNC2uXBWg4aE1yqjzMMzmZtkt79PHdcIC+9Ks0xsCU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H7n5nW01281W99q5QnZItDotU5NvVm5bDfg8H0aR7c++LxrN+R0tj4xjuMI1jd9XI
	 tNwU052t2MoTYsX2bwizQdBVKQAJ0bb/s8eC4nD76BtvFePb9egp1WNtSHSBZWsyQA
	 8U+vcMqdYQkMbtc/dQ3ytaPLGJI2qVwN4DtdnKr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E201F80506;
	Sat, 27 Nov 2021 02:30:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B48A4F804ED; Sat, 27 Nov 2021 02:29:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF551F80166
 for <alsa-devel@alsa-project.org>; Sat, 27 Nov 2021 02:29:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF551F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XGfVPOjI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1EE0D60B32;
 Sat, 27 Nov 2021 01:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58888C53FAD;
 Sat, 27 Nov 2021 01:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637976592;
 bh=ZpNC2uXBWg4aE1yqjzMMzmZtkt79PHdcIC+9Ks0xsCU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XGfVPOjI52SEbgP0ABhWqMJsZSiLY+/PcBhZL5YzNftisw3AvnUveTCbyceziGGRf
 eWUu6R+0fPk7iBi5KQRV5c1BpphyMpT/7yGKIxoZwgAKYZL3WRkqSZ6q8FzY1Ze43s
 yez08Ri0mXHl7HO64O27D/86rZIzGc4PUzj3502KAfcoOYHWvPhe2rJUB+GEVI7hxs
 Zb4jxv4sImTjgFcXSoZwzZiQhqczMRdnN1gf7fr9jzvCRHUW3yAZbOjWC8z0jhCnO8
 hpkex93yFe0ybx7GLkQWjMxdPL159+QxBL56d2Zls9yKXSNiYPJurX0+zE79f+M8K2
 2NTXdbSQWhRlQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David Rhodes <david.rhodes@cirrus.com>
In-Reply-To: <20211125143501.7720-1-tanureal@opensource.cirrus.com>
References: <20211125143501.7720-1-tanureal@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l41: Fix link problem
Message-Id: <163797659108.2987942.14749282669169455911.b4-ty@kernel.org>
Date: Sat, 27 Nov 2021 01:29:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Thu, 25 Nov 2021 14:35:01 +0000, Lucas Tanure wrote:
> Can't link I2C and SPI to the same binary, better
> to move CS35L41 to 3 modules approach.
> And instead of exposing cs35l41_reg, volatile_reg,
> readable_reg and precious_reg arrays, move
> cs35l41_regmap_i2c/spi to new module and expose it.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l41: Fix link problem
      commit: a5e0091d62abb9599d9dea505ec0e8c820001831

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
