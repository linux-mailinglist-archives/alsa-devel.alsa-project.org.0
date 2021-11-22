Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 268F54598E0
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 01:01:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0CA61658;
	Tue, 23 Nov 2021 01:00:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0CA61658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637625684;
	bh=R4inWEq2iQQrWDi7YP3Cg9zv9pdAIG3tab5qNYq/Ugg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fz0zCjBkBwiWsWUpCYGNck2kY3SvY9KSUIL6di7n0QmgBJygpGGw6UH2P6WeS4Uas
	 Enx2tflXES+l0r1nZSyNWKQ7F6DhneTWGaW//fg0QLQKjMJ6pSiWUpZrfl7IBXs/Xu
	 Jpcf+G74CoL++RVPTvqaDv02RCmrYAEwhedhR2Ss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BF1BF80245;
	Tue, 23 Nov 2021 01:00:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FFECF80245; Tue, 23 Nov 2021 01:00:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DD0AF80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 00:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DD0AF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="COvgZoc7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B742860FF2;
 Mon, 22 Nov 2021 23:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637625597;
 bh=R4inWEq2iQQrWDi7YP3Cg9zv9pdAIG3tab5qNYq/Ugg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=COvgZoc7HlJJ60EycIB0dfNuLnZzk+M4tFPKrTjncQD5K88aSvDUQxufN60ImBDu0
 3NiCGoVblqFbUnJNsrdrB3dk3VSXT51+Pb6t+XitCKYasqScRA8HYh/jK30bNH6c4m
 VCIVr4wa0zJkIfh2P5YpQ3CPx0A9WfaoSqyqQ8rRDi1t62pM3rx3plT9KoqsJXsEPf
 z1naa6EWk/WFH7bhR0IOrbleUET0YBTxG33AlHfK4/4TRuEtcvVaVtljPHAOQbE3cI
 +TSyOoeDwS7ESLxRrU8WyH5QxStCya4J4YE177YWbPiRTuE3Wk1txyh6XQSi9FRFXo
 O+SPjnDeftT0g==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Lee Jones <lee.jones@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20211121150521.159543-1-frattaroli.nicolas@gmail.com>
References: <20211121150521.159543-1-frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH] ASoC: rk817: Add module alias for rk817-codec
Message-Id: <163762559549.2471670.593188809347574663.b4-ty@kernel.org>
Date: Mon, 22 Nov 2021 23:59:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org
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

On Sun, 21 Nov 2021 16:05:20 +0100, Nicolas Frattaroli wrote:
> Without a module alias, autoloading the driver does not occurr
> when it is built as a module.
> 
> By adding a module alias, the driver now probes fine automatically
> and therefore analog audio output works as it should.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: rk817: Add module alias for rk817-codec
      commit: 428ee30a05cd1362c8aa86a4c909b0d1c6bc48a4

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
