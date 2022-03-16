Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 229C84DB98C
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 21:38:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B340D181D;
	Wed, 16 Mar 2022 21:37:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B340D181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647463125;
	bh=3SuWnJIZVPzyeK9wzgNrICuvhgZfN6hXaxO3JUmohj8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vy+hCK9Qzh3Ry4coLsK77q2GjZPJ1TyNSZuzvV4sdzcncBdpUzTmEZQBCr4v75szp
	 PhN+ewX5dxvSFzyfPeQxnSgcbANxf6sSPAEiKDdOiMItoJnLvAFjEIkQYuicVhJ9uX
	 rEXan7SrXdzMrLGrJuA7lQDZkwM0QQMCXbqPQn40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA6B5F80527;
	Wed, 16 Mar 2022 21:36:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20E92F80519; Wed, 16 Mar 2022 21:36:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD407F80516
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 21:35:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD407F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sM9QtBrt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 42EDD6141B;
 Wed, 16 Mar 2022 20:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC8EC340EC;
 Wed, 16 Mar 2022 20:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647462956;
 bh=3SuWnJIZVPzyeK9wzgNrICuvhgZfN6hXaxO3JUmohj8=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=sM9QtBrt8BDz1o/Ci7oXFIztEdY6bcnrIpfOuzIqBhn5mfWQeSTx7qWfJ3oDxQe/Z
 ulA03Vao09TzKQJf4R+scnqomTFXr5FqhFEIRxJ6Ho6FQIzgV0YKKwZOp4BjC+TAI2
 tsGbXp6nmZkDmZtWhfa8otvDq07RceJcV5IxmJ/3teDxWN5LQWnQnwFM8RtRCMrq5G
 9ZL7pDAow1eU7vSDAAxc8byw1cYsq339rTP5GcqjOF74bhV5+qZYqSlO4FrdS7YqdH
 rrDJTiNKF5WjvDUhtsbVK81yMdH2R1meY4WyPDfnhNDDOR98BNvlXSBI7K/Fc1LAEy
 4MQjLlMhGYUYA==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Miaoqian Lin <linmq006@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Genoud <richard.genoud@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20220316111530.4551-1-linmq006@gmail.com>
References: <20220316111530.4551-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: atmel: Fix error handling in
 sam9x5_wm8731_driver_probe
Message-Id: <164746295410.1220201.13095126032756372624.b4-ty@kernel.org>
Date: Wed, 16 Mar 2022 20:35:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 16 Mar 2022 11:15:30 +0000, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
> 
> This function only calls of_node_put() in the regular path.
> And it will cause refcount leak in error path.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel: Fix error handling in sam9x5_wm8731_driver_probe
      commit: 740dc3e846537c3743da98bf106f376023fd085c

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
