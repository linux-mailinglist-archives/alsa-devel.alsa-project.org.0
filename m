Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A6D419D65
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:48:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12F7516AF;
	Mon, 27 Sep 2021 19:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12F7516AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632764909;
	bh=dPx7bHo8jG9UU5xNXr83nVAj4BfCB8k510iRNN74QGg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uO+kxHcLogYzwT/ZDVUMUa6+LehR0wa6jVkM1cEi7rCJyvdw68DIJm+xdVTLbOvoK
	 QVnS2qgy5dEpa7xebwfL4fjBcalwi/YDYKLm3s27Njn4Mi9EmaqtRkKJBB678RUNK5
	 lELJ6SA7mnwCIgGkcLMfhcrnOqEpGnsriNoBBw2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E71F80272;
	Mon, 27 Sep 2021 19:47:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 366C1F8026D; Mon, 27 Sep 2021 19:47:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6608BF80161
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6608BF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hso74KPc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49EF860F4F;
 Mon, 27 Sep 2021 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764820;
 bh=dPx7bHo8jG9UU5xNXr83nVAj4BfCB8k510iRNN74QGg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hso74KPcl1cC/yC0SGW5WZEyVM8W/3pYpB56u4WOIhuzRNA0xjoDaNOE+8cM2ZiFr
 2XeCHNtO0WS5ROwaFJbgGfz0jdAxcnb1cNlnFPQpafgFyDvyd0Sj6QvZSoWDE7asWU
 0WgkUbVJMhwzxwbY3svWnnL4TpxNVz2yu+jn8M3gGghlE+0Q2CMRr78S/gh7PU8XbF
 WA8zZ6PMnQ7UA2vVpiFpn8zKY2/bw4cnwSvEZuczJx+otb4tN+SLP8KWbqO9B/PsPc
 qLwcCL6P56A1nJrfk79AVA1NjgQxsIDN1U71Low0+p3o61WjCQn0hwd9OE8XoyiA+I
 v4EhUwzTVkA1A==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: ak5558: Use modern ASoC DAI format terminology
Date: Mon, 27 Sep 2021 18:45:23 +0100
Message-Id: <163276442022.18200.8523530331834727056.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920164753.17030-1-broonie@kernel.org>
References: <20210920164753.17030-1-broonie@kernel.org>
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

On Mon, 20 Sep 2021 17:47:53 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the ak5558 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak5558: Use modern ASoC DAI format terminology
      commit: b55f03436b28256f6b8fc09a66fe6449568d16a0

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
