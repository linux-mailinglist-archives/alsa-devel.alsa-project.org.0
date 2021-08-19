Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CB83F208B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 21:24:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AC9D169F;
	Thu, 19 Aug 2021 21:23:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AC9D169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629401067;
	bh=hjanTyI3N9VyIXFopjH48AbrKtMvCkP6wd0U5aKuEHM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dii0JuYKC+bmxETQtksQCL13dmgWiNWTzbmpXEu/NcfF8RhUkyZlXlWMKJWjoeSl5
	 MnwJJGSe8kVNUUmBv2OC2AeCsh+8bH/n1e9N9iDSs2pC6bZZnVLwNSDrPSmokFhBRj
	 +yfDJLIe5vLaG1h4wcBcxqQzs6LfRQDHRUJJC9KA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7A8BF80302;
	Thu, 19 Aug 2021 21:22:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBF38F800EC; Thu, 19 Aug 2021 21:22:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5643AF800CC
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 21:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5643AF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZPcyTnsU"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E119610A0;
 Thu, 19 Aug 2021 19:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629400956;
 bh=hjanTyI3N9VyIXFopjH48AbrKtMvCkP6wd0U5aKuEHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZPcyTnsUdognRf0uS/SnvDWG8oK3+/BsQay7ExsRyKgzV5TT/XWrL4nga3lwwSKZP
 fiMnksbLLlbXNaNBna5PlAPzMCZT0iNVOIne7Nb69k4QzxgKvIuqmw/BOx+ojq1TKi
 gUZhz0fpal7VU8p2B5TKDgX2P26NZFbVS6gCq3xCx9h9PmY6mf/VrKlv3lm2/3h0Ha
 DiixDjenXQ9I6FxVCQ2bOtHCtdPezRxbP3yXl40ORldbu/lPOpn0UwCQMX0gBmGMxT
 4qbtMBaRsjtAWdvS18q+0lrS7gSObwSiLY6vbQua5Lf+1k+Pt9eVsZFoHTl4dojPa4
 CuppptZDsxWlQ==
From: Mark Brown <broonie@kernel.org>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Colin King <colin.king@canonical.com>, Takashi Iwai <tiwai@suse.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: uniphier: make arrays mul and div static const,
 makes object smaller
Date: Thu, 19 Aug 2021 20:22:08 +0100
Message-Id: <162940023650.48070.9595577624316730352.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818151746.38520-1-colin.king@canonical.com>
References: <20210818151746.38520-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
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

On Wed, 18 Aug 2021 16:17:46 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the arrays mul and div on the stack but instead make them
> static const. Makes the object code smaller by 4 bytes.
> 
> Before:
>    text    data     bss     dec     hex filename
>   16226    4984      64   21274    531a ./sound/soc/uniphier/aio-cpu.o
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: uniphier: make arrays mul and div static const, makes object smaller
      commit: 5d925d9823aaf18d55fab784bd4ef11f80fe1099

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
