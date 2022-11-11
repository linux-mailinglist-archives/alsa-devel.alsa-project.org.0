Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CFE626043
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 18:17:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 047A316A3;
	Fri, 11 Nov 2022 18:16:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 047A316A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668187040;
	bh=sRrcqdhjs5tdOOy/Xr2UWVJV5Rz1PelJ/qkJs9nCdDA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UezlaTppNaAFDMF/bZBlI9mhBtvugzsh/Z9SjoN8cz07IvA0lnKOs7w3LMfxSy6bY
	 FobEPwLy2qmdz8EL6LdoAGjXdQfL1YeMsQpv8v6lOP16SPYdHBm4QSPHxHMFHpCH5D
	 TeZMiPPaf7A7iRz/Wmv/sPGNrg6NnhlKV6Hwjfbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A90D0F80571;
	Fri, 11 Nov 2022 18:15:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A796FF80564; Fri, 11 Nov 2022 18:15:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A117F80557
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 18:15:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A117F80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="egwJvE1a"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56B9FB82681;
 Fri, 11 Nov 2022 17:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A124AC433D7;
 Fri, 11 Nov 2022 17:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668186908;
 bh=sRrcqdhjs5tdOOy/Xr2UWVJV5Rz1PelJ/qkJs9nCdDA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=egwJvE1ao56OyeCS9vLRbCQMQIPeqe3PdeRlk5JqGZhCOOhU7yfdKkN2kAPKCgYcR
 +IhINWqoF6KOwI7wKaGBttKzi/tGKXhrDbNhcQFt8hVjFkqYFXd687LLUV5zZCQ8eA
 c905apaWAldHEu7OgiVMev0rDjuAi5qQ2SUQaIsCx8r7NwAHJ4l7WGe/if28H3CHTY
 /qevDGUcIAWWbbPPFkIIMHSoY2Pgsnk5s+nxdHxYP/mqaDcAE60jvdvkpYZzYjNadc
 SAMaSLwCALeT0Vw8fn8uCI3dDjyQ1YeCEvNsPKmRq0FlDFd6iRvTWxse8puwdBaqGy
 2I3ir/RiwBQ9w==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20221104132213.121847-1-rf@opensource.cirrus.com>
References: <20221104132213.121847-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open()
Message-Id: <166818690633.487154.17424502068366763517.b4-ty@kernel.org>
Date: Fri, 11 Nov 2022 17:15:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, fparent@baylibre.com, bcousson@baylibre.com,
 misael.lopez@ti.com
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

On Fri, 4 Nov 2022 13:22:13 +0000, Richard Fitzgerald wrote:
> The DAI tx_mask and rx_mask are set by snd_soc_dai_set_tdm_slot()
> and used by later code that depends on the TDM settings. So
> __soc_pcm_open() should not be obliterating those mask values.
> 
> The code in __soc_pcm_hw_params() uses these masks to calculate the
> active channels so that only the AIF_IN/AIF_OUT widgets for the
> active TDM slots are enabled. The zeroing of the masks in
> __soc_pcm_open() disables this functionality so all AIF widgets
> were enabled even for channels that are not assigned to a TDM slot.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open()
      commit: 39bd801d6908900e9ab0cdc2655150f95ddd4f1a

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
