Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DC250E512
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 18:02:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E5A617BC;
	Mon, 25 Apr 2022 18:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E5A617BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650902521;
	bh=sg3XtHPLSczY3NZ40BxP/EE3YmODP2FdrdZxozyy11c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LXH86O0J8IOqJFJg77Br2CdbGuferztCMMZQAFATPVOcW5z7Q0pjXO+aIyFWWjx3G
	 RrcFfxnqQ8iEQFJk/TkZWrC0SdAs/8YTybTe9jWAs6QpO3ssahSS/T3qqDXYU/dP68
	 oYFAVCnXpA5+qa/xncB56cdfHPrqOjID7jnricts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F33AEF804AA;
	Mon, 25 Apr 2022 18:00:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B72B5F8016A; Mon, 25 Apr 2022 18:00:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56289F8014B
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 18:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56289F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zsw+eJFO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F75D61295;
 Mon, 25 Apr 2022 16:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC4CC385A4;
 Mon, 25 Apr 2022 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650902420;
 bh=sg3XtHPLSczY3NZ40BxP/EE3YmODP2FdrdZxozyy11c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Zsw+eJFOfD/PqY8ZV5Z5rIUxhV5Eb0R1Kk4OYj3xzAxB0hoMWjdvUVHPWKska8/OG
 ZfNmYneTEbjO61WnAiGDKkS96/Et08nkWaexnVdjE/wRY6fS24uqOrRXyc8wGTUBNX
 pOiPTjS5+E/kSCrQyDba18B4ejKn0dxZFjq4l/d8Eme1A++jqLjvYav/hfj/1FBaa3
 nHHOrsMBPYM33dhRVpR+EZdoNyumyxzhmCD/mGGD3RtaagJ+o7r4ihuQE1xKONvFwE
 KQB5bPLp9qWTCLxOkrs6FtZtya9n817UxKZfUCb4Zd7mw+mpvb+GQSm94q09fX0Fzp
 2ciKp6qIFv7Jw==
From: Mark Brown <broonie@kernel.org>
To: codrin.ciubotariu@microchip.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220421125403.2180824-1-codrin.ciubotariu@microchip.com>
References: <20220421125403.2180824-1-codrin.ciubotariu@microchip.com>
Subject: Re: [PATCH 1/2] Revert "ASoC: dmaengine: do not use a NULL
 prepare_slave_config() callback"
Message-Id: <165090241813.345430.3503254961552314811.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 17:00:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alexandre.belloni@bootlin.com, tiwai@suse.com, sha@pengutronix.de
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

On Thu, 21 Apr 2022 15:54:02 +0300, Codrin Ciubotariu wrote:
> This reverts commit 9a1e13440a4f2e7566fd4c5eae6a53e6400e08a4.
> 
> As pointed out by Sascha Hauer, this patch changes:
> if (pmc->config && !pcm->config->prepare_slave_config)
>         <do nothing>
> to:
> if (pmc->config && !pcm->config->prepare_slave_config)
>         snd_dmaengine_pcm_prepare_slave_config()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] Revert "ASoC: dmaengine: do not use a NULL prepare_slave_config() callback"
      commit: 660564fc9a92a893a14f255be434f7ea0b967901
[2/2] ASoC: atmel: mchp-pdmc: set prepare_slave_config
      commit: 2bde1985e39173d8cb64005dad6f34e9bee4c750

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
