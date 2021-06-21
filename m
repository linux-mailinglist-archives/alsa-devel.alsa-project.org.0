Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4AD3AF5AD
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:51:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EDF91658;
	Mon, 21 Jun 2021 20:50:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EDF91658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624301487;
	bh=GNyIa4fa2uI8VR7bS9Ty1jjFSGpmNLNuoPJXPMaZs7E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uJb/4tp2mwQ+iPSXabQ9FIUTG8hajsiPIy15hYmmZpje9AFQ3CQcoHA2B13gj+OFU
	 U5cvhXaXH1vPz87v4bN7z1/gtoxovFoRhR1U2XjqIdODMcmdlhyEr9/z90PTSDYCQp
	 WpmFOgFrgT7W/Pjkv+IuTKZssL0LgpO+qYGyVZuo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D18F7F80511;
	Mon, 21 Jun 2021 20:47:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C598CF804E5; Mon, 21 Jun 2021 20:47:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6398EF804DF
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6398EF804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jX8fa7ly"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E5D261107;
 Mon, 21 Jun 2021 18:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624301232;
 bh=GNyIa4fa2uI8VR7bS9Ty1jjFSGpmNLNuoPJXPMaZs7E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jX8fa7lyBY/ap9StCFLsika0Ms80+tOYIQGxMCkmW4+FWNR3OxCUj0OnWor7kdi32
 2clQrlEnSnilQPJIGJZwvq8Aex0HJjdulXnCrNaSNOUja0aS8BVM3K9rfmkXKFkT+L
 5tAxWGeR7q93wzIEd+pasyNAzSWoGeF3FcNKRTCWtZvv2VUW7x+/inBNFY4uLCsdZz
 Uu+qHcwFXNRVuvm6l5/CSJJhq/yGt84u1J6FGSrM1LWoHfTH7x5zcvgY5vG4KC5ubd
 Tjzq9vLowZBRgow6ULj/eIbhVkZIESBM2xygcIZcoNGuc85mHwk3Ie098I4JY5hf+x
 23jI0rqb63jVQ==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/5] soundwire: export sdw_update() and sdw_update_no_pm()
Date: Mon, 21 Jun 2021 19:46:04 +0100
Message-Id: <162430055264.9224.8953420856630209073.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614180815.153711-2-pierre-louis.bossart@linux.intel.com>
References: <20210614180815.153711-1-pierre-louis.bossart@linux.intel.com>
 <20210614180815.153711-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Hui Wang <hui.wang@canonical.com>,
 vkoul@kernel.org, Mark Brown <broonie@kernel.org>,
 Shuming Fan <shumingf@realtek.com>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Bard Liao <bard.liao@intel.com>
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

On Mon, 14 Jun 2021 13:08:11 -0500, Pierre-Louis Bossart wrote:
> We currently export sdw_read() and sdw_write() but the sdw_update()
> and sdw_update_no_pm() are currently available only to the bus
> code. This was missed in an earlier contribution.
> 
> Export both functions so that codec drivers can perform
> read-modify-write operations without duplicating the code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] soundwire: export sdw_update() and sdw_update_no_pm()
      commit: d38ebaf2c88442a830d402fa7805ddbb60c4cd0c
[2/5] ASoC: rt700-sdw: fix race condition on system suspend
      commit: 60888ef827e354d7a3611288d86629e5f1824613
[3/5] ASoC: rt711-sdw: fix race condition on system suspend
      commit: 18236370a098428d7639686daa36584d0d363c9e
[4/5] ASoC: rt5682-sdw: fix race condition on system suspend
      commit: 14f4946d55d335692462f6fa4eb4ace0bf6ad1d9
[5/5] ASoC: rt711-sdca-sdw: fix race condition on system suspend
      commit: d2bf75f4f6b277c35eb887859139df7c2d390b87

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
