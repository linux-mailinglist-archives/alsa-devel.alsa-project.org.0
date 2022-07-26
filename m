Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B618E5813E2
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 15:09:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BC9A15DC;
	Tue, 26 Jul 2022 15:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BC9A15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658840968;
	bh=BZmZhFMvhLCfzVe94NTIXknZfxg09pwJ9ByOmnsT3gU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XW1ohh99MSXtd4MS2Va76otjP5/bt92fvL9yQoVO6KGfRZVBp7yqIobleOP8Om8Sf
	 ilIXR8q8Dw+wA3D6Cc1FEZD5r8yhlhglZ9mB/DN4EY1zW+5TDIEEkdx3vWJnA2nOwQ
	 Dt8lK34a/+653c0bHih6CpkefrBZQuSeg0sdfXng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EE37F80539;
	Tue, 26 Jul 2022 15:07:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52CC2F8025A; Tue, 26 Jul 2022 15:07:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1232CF80153
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 15:07:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1232CF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lmDZxIKq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 41AE761559;
 Tue, 26 Jul 2022 13:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2880C341C8;
 Tue, 26 Jul 2022 13:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658840865;
 bh=BZmZhFMvhLCfzVe94NTIXknZfxg09pwJ9ByOmnsT3gU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lmDZxIKquK0sZqC17xEg183oakX/provokEGWmoKdwdMwjXP+0KfY9ggxIuKmXJkj
 BYEIJbqUCJKXUZxZT4PiyPjSfMoNUmS6VoD60zT38EE+HeC5o2eNs9apFLpwOiMon9
 PF5k/qX5x7/74H5IoXKlKatJ7EKL1Tx28OswV58LhTsyqYYhpjkCiMJGb3pU6WDQPB
 jx/h22t6v9srB68kmhDvH5NyVruMgO64EZ91N4Gz0ZBbutD8PGV94O5kdjvl02Fa68
 7GVR7cZv2l2BxUh+jQA/DpmTI49jNBPBfbj97QS7W//2jT/dWRTqzsK1bYu5pKVRQ5
 MeSQl1Qs2xFhA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, alexandre.belloni@bootlin.com,
 perex@perex.cz, nicolas.ferre@microchip.com, 
 Claudiu Beznea <claudiu.beznea@microchip.com>
In-Reply-To: <20220725130925.1781791-1-claudiu.beznea@microchip.com>
References: <20220725130925.1781791-1-claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 0/5] ASoC: atmel: one fix and few cleanups
Message-Id: <165884086364.21705.11925129890328770083.b4-ty@kernel.org>
Date: Tue, 26 Jul 2022 14:07:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-c7731
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

On Mon, 25 Jul 2022 16:09:20 +0300, Claudiu Beznea wrote:
> The series adds one fix for mchp-spdifrx and few cleanups for
> mchp-spdifrx and mchp-spdifrx drivers.
> 
> Thank you,
> Claudiu Beznea
> 
> Changes in v2:
> - s/tag/tab in the title of patch 2/5
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: mchp-spdifrx: disable end of block interrupt on failures
      (no commit info)
[2/5] ASoC: mchp-spdifrx: use single tab indent for structure
      commit: 24e89d6d7da52f8678dc111ffb0ae3590b678ef0
[3/5] ASoC: mchp-spdiftx: remove references to mchp_i2s_caps
      (no commit info)
[4/5] ASoC: mchp-spdiftx: return directly ret
      commit: d346a4ad305bf3f99e5824e0c132fac7e0b53657
[5/5] ASoC: mchp-spdiftx: add and remove black line around MODULE_DEVICE_TABLE()
      commit: 96f6017d652a78e06e34e535526826a22aa69dfa

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
