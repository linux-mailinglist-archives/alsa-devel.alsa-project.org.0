Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B50CF461C1C
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 17:48:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 650371F65;
	Mon, 29 Nov 2021 17:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 650371F65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638204501;
	bh=L1sUoNjRpQOBjNP1DUDEYD6IERNsu6y7djZ9pbkuNGA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ya1Fd3dtaSdApxWzEbAlCLzJADCNUOEAp71md5j7oRfDIOSMQFmYce8uTErKGz75m
	 5eL5Gb0gA7jMI8Z56MBlNhnKsTOytutvR12DZMSaMKjt8ZNGdZpy2OA28kUd4yqS6r
	 2GhTM02FWTZGVZm5nzsSeOgprjKrea/fYUtO949o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E50FDF80511;
	Mon, 29 Nov 2021 17:45:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02CC9F80510; Mon, 29 Nov 2021 17:45:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81DACF80256
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 17:45:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81DACF80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Kb1iiedm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6462615AF;
 Mon, 29 Nov 2021 16:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B927C53FCD;
 Mon, 29 Nov 2021 16:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638204344;
 bh=L1sUoNjRpQOBjNP1DUDEYD6IERNsu6y7djZ9pbkuNGA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Kb1iiedmiN4yjjhDuzhFykBkQI9W1rD9dMiiVOjT/v2rDURhm5oJKzknqsrsuak+g
 5LnT9dIfGteKuUcRTw9wgsD4uJOSI7Ojja6AjIsmgdjVk2PHAwIae3PjHwR/K0osUs
 JlPGBe+VMfKDYP7AxN+6bd/wpoCth9g796J+VAfgYhdmRXew2np6WqEtbKd/HlgN6s
 O8jq4s7ufiH5ZhgvzgL9QEkh6O3h4tGcD2xW24lgfNhfagGcgU+iL/nVbPz9ni1/T5
 0t58mTLXnPRWTdpkAfRBsBi0QRZnSpqylkPJYvc89hBnWnZ5DCnL3IM90N/VTurkLB
 3HzIcVVvMUHjg==
From: Mark Brown <broonie@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, mripard@kernel.org,
 wens@csie.org
In-Reply-To: <20211117194458.2249643-1-jernej.skrabec@gmail.com>
References: <20211117194458.2249643-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2] ASoC: sunxi: sun4i-spdif: Implement IEC958 control
Message-Id: <163820434202.1716750.14592457406948310338.b4-ty@kernel.org>
Date: Mon, 29 Nov 2021 16:45:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-sunxi@lists.linux.dev,
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

On Wed, 17 Nov 2021 20:44:58 +0100, Jernej Skrabec wrote:
> SPDIF core is capable of sending custom status.
> 
> Implement IEC958 control handling.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sunxi: sun4i-spdif: Implement IEC958 control
      commit: 679de7b64f9622eff8f74357fc3ee071629d25b3

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
