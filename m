Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEF61B0CF2
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 15:39:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9345F1687;
	Mon, 20 Apr 2020 15:39:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9345F1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587389994;
	bh=8pBXPljPGGgD7G9G7WPPoDba5tlB3IeSIJiJ8A4QQrc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SP3ZH0qBoJwJC4UiAIUcYlXAAESWRbICuF4bIBvEVkcfUhtqAFeah0FensDY6xvNj
	 rD/DM2EIztm9E0IPGFk/1Owx0uasqxTD3uYG6qv9+enBWDDKTOjDgurFkyAtN8HB3f
	 xGvRJVwWhS8RC2SKATc7D9yhBJERXdI7/yzqUXA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB2F0F80290;
	Mon, 20 Apr 2020 15:37:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7184F80290; Mon, 20 Apr 2020 15:37:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C87BF80290
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 15:37:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C87BF80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fQryNMJo"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 834CE2070B;
 Mon, 20 Apr 2020 13:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587389828;
 bh=8pBXPljPGGgD7G9G7WPPoDba5tlB3IeSIJiJ8A4QQrc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=fQryNMJoGFgeXErMNgMY3bHlPoXglQjc2CEsWr7H1VQ2pmV4VpLKGwhw4nrPZ68Iq
 vRM4k1TxElw7ope8fFA4M+irqxoIQLXv44ARYr9OK6XW9cCZv9ORk/e08KpQHWjVqE
 XmkCMEiNWCjSdU8GBc9tX+W+FA7VCAPoHv1Y2d2A=
Date: Mon, 20 Apr 2020 14:37:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthias Blankertz <matthias.blankertz@cetitec.com>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20200417153017.1744454-1-matthias.blankertz@cetitec.com>
References: <20200417153017.1744454-1-matthias.blankertz@cetitec.com>
Subject: Re: [PATCH 0/2] ASoC: rsnd: multi-SSI setup fixes
Message-Id: <158738981359.28730.2521567380411409191.b4-ty@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
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

On Fri, 17 Apr 2020 17:30:15 +0200, Matthias Blankertz wrote:
> Fix rsnd_dai_call() operations being performed twice for the master SSI
> in multi-SSI setups, and fix the rsnd_ssi_stop operation for multi-SSI
> setups.
> The only visible effect of these issues was some "status check failed"
> spam when the rsnd_ssi_stop was called, but overall the code is cleaner
> now, and some questionable writes to the SSICR register which did not
> lead to any observable misbehaviour but were contrary to the datasheet
> are fixed.
> 
> [...]

Applied to

	broonie/sound.git for-5.7

Thanks!

[1/2] ASoC: rsnd: Don't treat master SSI in multi SSI setup as parent
      commit: 0c258657ddfe81b4fc0183378d800c97ba0b7cdd
[2/2] ASoC: rsnd: Fix "status check failed" spam for multi-SSI
      commit: 54cb6221688660670a2e430892d7f4e6370263b8

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
