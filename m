Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ADF35A350
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 18:28:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3F301698;
	Fri,  9 Apr 2021 18:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3F301698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617985729;
	bh=XYCQKhdmB6QBCKVTkQVtHrpqV/FSusO0QpQtbiMNhHI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mEqHCraLSDi7HPCu2lq8DXGbcf4kdMtVOuKtCdn2MuqgrPVa/lwnd00iTNPKqdVOC
	 lHSV1fRjG3FZqRYs2gjBl8jgQV91eiNudFonjoODND9yQvG9hYSeF4F6v+6KggsY/Z
	 pMtWMWUaDX06l1UXJ44WH0K/E31l8uFHEiUf82f0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1391F804F3;
	Fri,  9 Apr 2021 18:24:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F476F804E4; Fri,  9 Apr 2021 18:24:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4341F804E2
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 18:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4341F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uxFrWTkZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF34261104;
 Fri,  9 Apr 2021 16:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617985451;
 bh=XYCQKhdmB6QBCKVTkQVtHrpqV/FSusO0QpQtbiMNhHI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uxFrWTkZW2PGitGAmmrdx55or1EblScKPIxcwVjWYbDhTMCZ/RjsNmGeCFNMAw5RC
 DuI8EbOJeur+yZpSV7Ied7wWWXd/4rNxWChZpLV2ythZvj2b9FTb6QBLEncHpaMwLB
 fx/kgU6Z8nZEboj4gZjooXLvZJ5pw+BlMGM+BisYIV1v0xk8jDhxI5I03G2a8K4yEe
 37b2eTcVMt9quWP/A6j9qZAmwt5qt/HBKQ5Vz5GMkJIt8rWlymYnW/R4CG+Ro+HZbP
 nasl0jPNsUea9a7VM+vauRULuVbL7BJerkS5ySopXjFtymwAKX3spiabXvAQfYb+Kq
 20P1ZLwwA+3NA==
From: Mark Brown <broonie@kernel.org>
To: 'Kuninori Morimoto' <kuninori.morimoto.gx@renesas.com>, cpgs@samsung.com,
 Gyeongtaek Lee <gt82.lee@samsung.com>
Subject: Re: [PATCH] ASoC: soc-compress: lock pcm_mutex to resolve lockdep
 error
Date: Fri,  9 Apr 2021 17:22:58 +0100
Message-Id: <161798344184.47643.11624764561910891903.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1891546521.01617772502282.JavaMail.epsvc@epcpadp3>
References: <CGME20210407041405epcas2p10649545662a5441230a3066481755cd0@epcas2p1.samsung.com>
 <1891546521.01617772502282.JavaMail.epsvc@epcpadp3>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, 'Takashi Iwai' <tiwai@suse.de>,
 Mark Brown <broonie@kernel.org>, hmseo@samsung.com, donggyun.ko@samsung.com,
 tkjung@samsung.com, pilsun.jang@samsung.com, s47.kang@samsung.com
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

On Wed, 7 Apr 2021 13:14:04 +0900, Gyeongtaek Lee wrote:
> If panic_on_warn=1 is added in bootargs and compress offload playback with
> DPCM is started, kernel panic would be occurred because rtd->card->pcm_mutex
> isn't held in soc_compr_open_fe() and soc_compr_free_fe() and it generates
> lockdep warning in the following code.
> 
> void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
> 			    int stream, int action)
> {
> 	struct snd_soc_dai *dai;
> 	int i;
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-compress: lock pcm_mutex to resolve lockdep error
      commit: 45475bf60cc1d42da229a0aa757180c88bab8d22

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
