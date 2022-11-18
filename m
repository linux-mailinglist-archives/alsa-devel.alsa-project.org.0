Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B5C62F93C
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 16:26:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49F17169F;
	Fri, 18 Nov 2022 16:25:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49F17169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668785183;
	bh=GygClQT09XAwMmXr6yHUgwEriuF+/HCUV6OOmACC2J8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pH6rKXVgh0DbWvSG/NYFV/Hpbx3E9R+7bSCPGtxuBrDXZKZZ/w6FIYv2qjwhsgAes
	 ngvuT8YHdRgO8Om8oRj1I5/ACWL5eJWW7Aq+ZPYklAyB5vQa3O8UppTY+RZsWj/MCt
	 DaPxgPW8BoxvxgLAqfhYxJtrM2FTqLg6Fwh6pbGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02D95F800B5;
	Fri, 18 Nov 2022 16:25:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B99D2F8024C; Fri, 18 Nov 2022 16:25:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29CDDF800B8
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 16:25:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29CDDF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LEukaIck"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2DE62CE2176;
 Fri, 18 Nov 2022 15:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F9EC433D6;
 Fri, 18 Nov 2022 15:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668785117;
 bh=GygClQT09XAwMmXr6yHUgwEriuF+/HCUV6OOmACC2J8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LEukaIck+kATcrrmKi4ZBqC9IYH4rsRZTFW5XAW47VaRX5HAgTMTg8qe5coVeLUsA
 9bJXgUOZgcmM3NwM2aA0cx1EwmRgnhPvEQlLOwUl3P91bCrgDWyuYCjPffBQUAAxfs
 UWGq4g5oB/OEreMVn9CCQQjospgM73728iVuMmRdAXnfMrSdO2u079C1wotL1AhJk/
 OtTM3v/h2Z+uW+fczhFM39GOx5zMndB0mMJz2AOhLgMmqQ4EXWbKFHMZG2MfinJVfH
 IfcOeOSJpLrp5bIFhDspiKDZ/PJQ5IJ6Jbz4ndyjPKc/9slVVW7L373fFya9l29Ih5
 cvwZv2Gmi93SA==
From: Mark Brown <broonie@kernel.org>
To: nicolas.ferre@microchip.com, tiwai@suse.com, lgirdwood@gmail.com,
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 perex@perex.cz, alexandre.belloni@bootlin.com
In-Reply-To: <20221117123750.291911-1-claudiu.beznea@microchip.com>
References: <20221117123750.291911-1-claudiu.beznea@microchip.com>
Subject: Re: [PATCH 0/3] ASoC: mchp-spdiftx: add power saving features
Message-Id: <166878511492.955590.9958880472187232412.b4-ty@kernel.org>
Date: Fri, 18 Nov 2022 15:25:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
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

On Thu, 17 Nov 2022 14:37:47 +0200, Claudiu Beznea wrote:
> This series adds support for runtime PM and system suspend/resume
> for Microchip SPDIFTX (patches 2/3, 3/3). Along with it I took the
> chance and added a minor cleanup (patch 1/3).
> 
> Thank you,
> Claudiu Beznea
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/3] ASoC: mchp-spdiftx: simplify locking around ctrl->ch_stat
      commit: 215450eb8b0fac000a42c1cd52c8966fb5159037
[2/3] ASoC: mchp-spdiftx: add runtime pm support
      commit: 4bf54ca60f99643cfaa3e5b532f139f6501f318e
[3/3] ASoC: mchp-spdiftx: add support for system suspend/resume
      commit: abc7edb0329cd2eabc0b948f5e248c85f6268296

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
