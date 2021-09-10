Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9E2406F31
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Sep 2021 18:10:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F51C169C;
	Fri, 10 Sep 2021 18:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F51C169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631290249;
	bh=NAdHDVgWOlnGUIEsitFUU7JyMJqE/TRMT6To3NgX/WY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jmvzeQhz8v0oRHO2Kap+IDkmszt9Z72lRXpRHwjU2mhwmrXm4j50oWaLsO6t7Jgaw
	 8IrWw+C17mXWSfVH+gRxAeILD9/5UgXYXyLyarX2C55ooE0eXRRQDkftoh0N1Zc2C5
	 8AaTReeqVyGwR4heQgBxlKhG2py3ADiNAAZasqvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABFAEF8049C;
	Fri, 10 Sep 2021 18:09:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88404F802E7; Fri, 10 Sep 2021 18:09:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EB76F80166
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 18:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EB76F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dxluCGT0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8424E61207;
 Fri, 10 Sep 2021 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631290163;
 bh=NAdHDVgWOlnGUIEsitFUU7JyMJqE/TRMT6To3NgX/WY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dxluCGT0bYGZFNFZc85+kqYpMMa0oSSx6DNqXX7YihcTVNTGe7Vdu90gLK4t067S9
 1qqEytrA1vk7vaYdpMp8z2teqlcndAbpD8lbdzuNKJEYlr/MCeGazHlO2XeMoD1Vju
 zqHXBGaR7//552U2lQDB3KA/dFOcTuprLUs4RkHRqK16IfR6Ob6a4FfW2fylcmrtfD
 /D3J8FfVsVTsC4aiDVJvQodQ28gUMa1A40zJM0eF5U8EFJHrEWuHI8rAhUL/Wa0+w6
 dU0qlvOP7IK9SDGA0MVX4bM3v4kN1dcFAwS8ZpbVw96jx2SbJSlthTi6iPfqkdTvuj
 UTvGrdegzUnUA==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, timur@kernel.org, festevam@gmail.com
Subject: Re: [PATCH for-5.15 0/5] ASoC: fsl: register platform component
 before registering cpu dai
Date: Fri, 10 Sep 2021 17:08:43 +0100
Message-Id: <163128974014.2897.9681301071931751805.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1630665006-31437-1-git-send-email-shengjiu.wang@nxp.com>
References: <1630665006-31437-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
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

On Fri, 3 Sep 2021 18:30:01 +0800, Shengjiu Wang wrote:
> There is no defer probe when adding platform component to
> snd_soc_pcm_runtime(rtd), the code is in snd_soc_add_pcm_runtime()
> 
> snd_soc_register_card()
>   -> snd_soc_bind_card()
>     -> snd_soc_add_pcm_runtime()
>       -> adding cpu dai
>       -> adding codec dai
>       -> adding platform component.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: fsl_sai: register platform component before registering cpu dai
      commit: 9c3ad33b5a412d8bc0a377e7cd9baa53ed52f22d
[2/5] ASoC: fsl_esai: register platform component before registering cpu dai
      commit: f12ce92e98b21c1fc669cd74e12c54a0fe3bc2eb
[3/5] ASoC: fsl_micfil: register platform component before registering cpu dai
      commit: 0adf292069dcca8bab76a603251fcaabf77468ca
[4/5] ASoC: fsl_spdif: register platform component before registering cpu dai
      commit: ee8ccc2eb5840e34fce088bdb174fd5329153ef0
[5/5] ASoC: fsl_xcvr: register platform component before registering cpu dai
      commit: c590fa80b39287a91abeb487829f3190e7ae775f

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
