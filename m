Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 435BC242825
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 12:18:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3931166F;
	Wed, 12 Aug 2020 12:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3931166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597227507;
	bh=OoOzRVDwOrmRumcxHSBS2z0GC6QVFh9JBw90/tmx8QY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H+loUhq1JcgXKdCu0+paR+emGBObGHO18SuEpEaETUCPfXVXGnPC7QXLFfAij/6/J
	 lDMVo6+BoN7ccmFQYEJLU2LgPH9sCtyobvoYDM/CtkG1r7o1f7Rh6bzBBMxwh6tU8D
	 3I1sSrIb0vicXPCV68kqB867WuXtrEhYrhNAggGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9455F8022D;
	Wed, 12 Aug 2020 12:16:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00669F8022B; Wed, 12 Aug 2020 12:16:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CF1BF80147
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 12:16:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CF1BF80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pBg6MVxL"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0151D206B2;
 Wed, 12 Aug 2020 10:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597227394;
 bh=OoOzRVDwOrmRumcxHSBS2z0GC6QVFh9JBw90/tmx8QY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=pBg6MVxL7Mfxz7JpwB2oc6XyQZvDlKcpRIX1JhO9cfFaaBI2+awWEF/EDyTN3sUzd
 otfBNSnuzWNJgP552TaCin8sse4XfQI9L5ox3SD20jaMNeifJePihw1Lfea5+pls0U
 hgrZUOl8Fad5lAAZLEoSSGu1FIf2J46nq4u17D58=
Date: Wed, 12 Aug 2020 11:16:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20200810134631.19742-1-tiwai@suse.de>
References: <20200810134631.19742-1-tiwai@suse.de>
Subject: Re: [PATCH] ASoC: Make soc_component_read() returning an error code
 again
Message-Id: <159722736188.10105.15386949261795637088.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, John Stultz <john.stultz@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Mon, 10 Aug 2020 15:46:31 +0200, Takashi Iwai wrote:
> Along with the recent unification of snd_soc_component_read*()
> functions, the behavior of snd_soc_component_read() was changed
> slightly; namely it returns the register read value directly, and even
> if an error happens, it returns zero (but it prints an error
> message).  That said, the caller side can't know whether it's an error
> or not any longer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Make soc_component_read() returning an error code again
      commit: efc913c8fb88728626759735e1b09370a6813180

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
