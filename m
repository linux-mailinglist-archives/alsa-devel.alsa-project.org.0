Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D54BB4D08AF
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 21:43:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71D3417F0;
	Mon,  7 Mar 2022 21:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71D3417F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646685833;
	bh=A56E0vmOp/YT5PrfBwMSlSMazuSnJdz9v37YbJ9aDww=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SCmIxSLSzukxM8ri2SPn32Tayq0zEAcZtZSvmSWrCgdRjpE3fMyyVJ434ZPdzB7Ph
	 ALzeSg+4KDCKISLmyZiRBnIdRgqMXTrdKHvwZfdqkECkhHzAYWwrGyfyDu4PQGZuyx
	 je36gkRuHiyxH+mEnOii4YSteODK1b8iIDSgdrpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37347F80567;
	Mon,  7 Mar 2022 21:39:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6491AF80558; Mon,  7 Mar 2022 21:39:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9A14F80542
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 21:39:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9A14F80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M0L1B7yR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 29D3AB81707;
 Mon,  7 Mar 2022 20:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87BFFC340E9;
 Mon,  7 Mar 2022 20:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646685563;
 bh=A56E0vmOp/YT5PrfBwMSlSMazuSnJdz9v37YbJ9aDww=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=M0L1B7yR/TkazCfrocdu5z7peB/y/WVFKIBpsqCyho1foIs0y6gJ/uLkxF5Lvb6Dy
 ay4Vc4UMjglO7kb+d0Dqoy31WdEug48X/JWr3xIItQ/PyIAtvmwBzhbhP0iBd3cjxO
 xlxpC7RP9Bs6EhCY5s5qa0GY32H6aRUGdAJSeSmusW2r88l5d9w010z3LalZ1anZYZ
 CPumO7Qi+h1ZR8UDvmUx7OesVjCpEDkbUcR1rlWGzc1YFzLhbiP76YDK1jNTQOu+1N
 WCoFjBZowdtrN7GY2X/gUYEJwMxD+1lvTyUERryE8bjbldK2XUbExTQkFsAzVjdjLQ
 aAP9+jDdJBtaw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Bo Shen <voice.shen@atmel.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miaoqian Lin <linmq006@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, Nicolas Ferre <nicolas.ferre@microchip.com>
In-Reply-To: <20220307124539.1743-1-linmq006@gmail.com>
References: <20220307124539.1743-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: atmel: Add missing of_node_put() in
 at91sam9g20ek_audio_probe
Message-Id: <164668556128.3137316.11962793804624015559.b4-ty@kernel.org>
Date: Mon, 07 Mar 2022 20:39:21 +0000
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

On Mon, 7 Mar 2022 12:45:39 +0000, Miaoqian Lin wrote:
> This node pointer is returned by of_parse_phandle() with refcount
> incremented in this function.
> Calling of_node_put() to avoid the refcount leak.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel: Add missing of_node_put() in at91sam9g20ek_audio_probe
      commit: f590797fa3c1bccdd19e55441592a23b46aef449

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
