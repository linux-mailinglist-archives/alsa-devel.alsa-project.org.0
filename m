Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0EA45508F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 23:32:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35AA918FB;
	Wed, 17 Nov 2021 23:32:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35AA918FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637188370;
	bh=uU2qHnUEljTCEgcQnVLhefzFnphaBzkPX4DWASgLNyg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zs13nHBTGVGc4lAuU4i+VAxjVbWQ9vktRrhW7LrVb0tqYuLuYxhCaRDyMNwEqKiGA
	 8MkuLyr8tmfqfvipmthOhxN9luRUb4ZHp0MUVSnZpJ+IwR38yV8sOTJD+I/sEb6OeK
	 aqfbxTUVlOcRy6M33wTzvBM1NW3luyc4e9/9BfVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 974E6F8028B;
	Wed, 17 Nov 2021 23:31:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32CAAF8027D; Wed, 17 Nov 2021 23:31:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 170C7F800FA
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 23:31:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 170C7F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ijHAK4jp"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27DC861B51;
 Wed, 17 Nov 2021 22:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637188281;
 bh=uU2qHnUEljTCEgcQnVLhefzFnphaBzkPX4DWASgLNyg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ijHAK4jp/W3+yP3SjYIwyudnH1gsROgiOIUR6o3QBOWhju89RKd1Nf+EzfqVJ3y5G
 D8aXK9pihpRlXkeH0IzZydkb/bpVeLKzxye4sWYcMLTfA0psDu9HFDc4Hw+oVfhapc
 ZhTthq0YfMMAIdzXhZ44ZMjKWO5PhEIg6kz8ql7L6npP+CosNDQIPdqPfUDAOjIVVE
 xx1uJ4aUU3/35gP2rNnUlDBknO10Q7Wf3CqG5aptbx1I1IrtpOoBkXHnK7EJkp8esd
 aoIsottl3SoS4aYhuL6HOepm20J6JVlkg3G29pDprOFW8l0o3oBhnkazG89fTUjoUp
 6ur/vZ+GudlnA==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
In-Reply-To: <20211117104404.3832-1-olivier.moysan@foss.st.com>
References: <20211117104404.3832-1-olivier.moysan@foss.st.com>
Subject: Re: [PATCH] ASoC: stm32: i2s: fix 32 bits channel length without mclk
Message-Id: <163718827890.136789.10813827893934217729.b4-ty@kernel.org>
Date: Wed, 17 Nov 2021 22:31:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
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

On Wed, 17 Nov 2021 11:44:04 +0100, Olivier Moysan wrote:
> Fix divider calculation in the case of 32 bits channel
> configuration, when no master clock is used.
> 
> Fixes: e4e6ec7b127c ("ASoC: stm32: Add I2S driver")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: stm32: i2s: fix 32 bits channel length without mclk
      commit: 424fe7edbed18d47f7b97f7e1322a6f8969b77ae

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
