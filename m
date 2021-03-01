Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF87329549
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:40:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 215161694;
	Tue,  2 Mar 2021 00:40:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 215161694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614642053;
	bh=SEezi0hF1/v6AV9st48t53kpPLAS0sc43As5yWnPWDs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MUmy83QdsSEGERv1f9CeZUMK6rphgHXq1YI0kpHcBgw7Ek0XK3hKKXnivxJvK+lN9
	 igo6Fcv4I4J35srP8Z0ct1aoD32Xi7x48Ip0j4tgK/pkSGQm+qmfuXfsQ9rR03lZCG
	 0ncyUHpnsbLtl5saI0cBaPMblSi/pVQ/9y3irjxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59CC1F804D1;
	Tue,  2 Mar 2021 00:36:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64B3BF804E0; Tue,  2 Mar 2021 00:36:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0440AF804D1
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0440AF804D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BOad/XSH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9367160295;
 Mon,  1 Mar 2021 23:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641796;
 bh=SEezi0hF1/v6AV9st48t53kpPLAS0sc43As5yWnPWDs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BOad/XSHSUZ9SqzabrCCGi2RHF7/+1HOzuIbIA74tIEjBOfrNn7rPEpRDXlbaQ/4g
 OVk6T5rQ77GOZSJfnNl369fSfJY/wU78uxN0gFYgrK7dOyk4hV0RDX36HOH1xpq9B2
 R5YFK6qeHHZAUC32sOTmjy5a2Fj95bUxLY1OLsrAe9tArkzpseaxjHEWDMkqLHsxvp
 wmUgNw4bUb2k3gDVPVBVvQYc0NP0ayy2CTuqbrM0wx52MBZBDjsx8sSq6WQCtL1gOU
 ZvUXbjl3aSSL8FlMFSY0UNrjD4TPBohmm2elawnCRSkUpFRF84OMC4yFIt9t/3zpkf
 BvQplM/VX2v/g==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210219231635.5749-1-pierre-louis.bossart@linux.intel.com>
References: <20210219231635.5749-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: (subset) [PATCH 0/8] ASoC: sh: remove cppcheck warnings
Message-Id: <161464168097.31144.3559452144915356602.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Fri, 19 Feb 2021 17:16:27 -0600, Pierre-Louis Bossart wrote:
> No functional changes except for patch 4 where a missing error check
> was added for consistency.
> 
> Pierre-Louis Bossart (8):
>   ASoC: sh: dma-sh7760: remove unused variable
>   ASoC: sh: rcar: align function prototypes
>   ASoC: sh: rcar: simplify return
>   ASoC: sh: rcar: core: rename shadowing variables
>   ASoC: sh: rcar: ctu: add  missing error check
>   ASoC: sh: rcar: ssi: remove redundant assignment
>   ASoC: sh: siu_pcm: remove useless assignment
>   ASoC: sh: siu_pcm: remove unused variable
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: sh: dma-sh7760: remove unused variable
      commit: 2497d156c297992ef1254fda2277ce055f48db64
[2/8] ASoC: sh: rcar: align function prototypes
      commit: 8644cbf296de7440f8d53d333da89f79d3258d25
[3/8] ASoC: sh: rcar: simplify return
      commit: d15737e24a962941bae0373b8a89173e2451e7c9
[5/8] ASoC: sh: rcar: ctu: add missing error check
      commit: a029ad994d24c92228b4460cc374846170720a05
[6/8] ASoC: sh: rcar: ssi: remove redundant assignment
      commit: 0711cb41ce02ae8994e4f75551545b114e8922d6
[7/8] ASoC: sh: siu_pcm: remove useless assignment
      commit: 075bfe61c88a267755bf4cc54af19cab3141f23f
[8/8] ASoC: sh: siu_pcm: remove unused variable
      commit: 69011a3193be54b04b3cfd652c484e6b77cf59b0

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
