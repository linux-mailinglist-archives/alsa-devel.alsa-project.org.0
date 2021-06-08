Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED14839FBFA
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 18:08:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 846FA1775;
	Tue,  8 Jun 2021 18:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 846FA1775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623168525;
	bh=RLYClvzf+9zh8zPCA1AZ11On8MN7nXwqdgFy13xhXyw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=euVZgrBTIfYJDHn5VLi2eBABFkv2Bp4uJVuZZyswQL7Jy4UexN5bnbcEewXMwLKgg
	 VFRbVAI5IQhH9LAZ0utFapiD+OkgWOhZi1mJCQpj97X7ST5ubDUNn22GXJc3oG4H3O
	 mElU09lszh15Cn6XK5bxpGUEr0OHVw1zpNAVU3g8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B811F80256;
	Tue,  8 Jun 2021 18:07:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81AA1F80256; Tue,  8 Jun 2021 18:07:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC4A7F801EC
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 18:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC4A7F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KQS6ecLe"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A46BB61078;
 Tue,  8 Jun 2021 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623168431;
 bh=RLYClvzf+9zh8zPCA1AZ11On8MN7nXwqdgFy13xhXyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KQS6ecLeAgLlnZNbkCA7n22fN+y9GGAl2b/zvkSTdodMboq4PbvxDyZYUEPuOHOGN
 w28Jb08XSl0n50MnGPVdWm3R6T4BqY1iDgVFA881ALKcWN4l7QMsbDrh8nD7othG3y
 Mra1Q8FcUj99OydSA8hZs5WJufbcnfxrPMDaVMG5w160NpG7/UqMyXeNAauQnoMTAi
 Txti6e35BGe+NEx8V0QlUPEcz+aHKcsbp58X7BhLym3kpg5KbqHZ0X1AGVA3FfdDyf
 5FtVJxlcxkYCHYgdlyfZH1xjXuAKQCAjgUhW59cQYZowYdpUYuyIBvwMm2bCMwlPU1
 8ONjgJs3efp9w==
From: Mark Brown <broonie@kernel.org>
To: kaichieh.chuang@mediatek.com, perex@perex.cz, lgirdwood@gmail.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, tiwai@suse.com,
 lumi.lee@mediatek.com, matthias.bgg@gmail.com,
 pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH] ASoC: mediatek: mtk-btcvsd: Fix an error handling path in
 'mtk_btcvsd_snd_probe()'
Date: Tue,  8 Jun 2021 17:06:37 +0100
Message-Id: <162316808974.49749.9800374437345817638.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0c2ba562c3364e61bfbd5b3013a99dfa0d9045d7.1622989685.git.christophe.jaillet@wanadoo.fr>
References: <0c2ba562c3364e61bfbd5b3013a99dfa0d9045d7.1622989685.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

On Sun, 6 Jun 2021 16:31:09 +0200, Christophe JAILLET wrote:
> If an error occurs after a successful 'of_iomap()' call, it must be undone
> by a corresponding 'iounmap()' call, as already done in the remove
> function.
> 
> While at it, remove the useless initialization of 'ret' at the beginning of
> the function.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mtk-btcvsd: Fix an error handling path in 'mtk_btcvsd_snd_probe()'
      commit: b6052c3c7a78f5e2b9756c92ef77c0b56435f107

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
