Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F573627D5
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 20:37:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D40816EF;
	Fri, 16 Apr 2021 20:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D40816EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618598245;
	bh=pWLfhc7A2Zk1siwtOzIJytrVcu7YBShN53M2Vki0ppQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gVkBzbC/ImAK3MtgFJraAbxBLsFq763LuS7XnfuJSG798OKg7dH1QF5BaYve5mS51
	 UAqY2v1R6N+rnx3oWWlqo705whVlfbW0Zd/sZzXkTRmubH2DY3QV7XOFxmx/i8pkrk
	 ZfLWve9VbnXzE1tuP8fT8qbI5hW0rNBWBUN8CZGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B87BF800FF;
	Fri, 16 Apr 2021 20:35:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2080CF8032D; Fri, 16 Apr 2021 20:35:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A34FF80290
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 20:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A34FF80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="chQ0KkXo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 938036137D;
 Fri, 16 Apr 2021 18:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618598106;
 bh=pWLfhc7A2Zk1siwtOzIJytrVcu7YBShN53M2Vki0ppQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=chQ0KkXoj9a5wENwCCadRWYSVxd+kCpaEBpbFpsGAtw6YmdsXuhGzFVkt7TZCfKR5
 p+jziowp0byyEA4j+CJgxFGX7Ho1oCDXR1Q1OzJ8g7p7UCO/0jNtGbYtWMAn2rL24w
 EaVg3FFif5IG2hVb1wuvj3LhNQ3eIOjs7Bxpstd7+1bqpQcSyY5ZXzZFkyTJ1MSYOz
 6Db+ieMXmFuLGNNxqWEqOafqrTyX1dSQRA70cwIGtjtvbEX053Lj8mtr+6DYTOYas1
 EF7aarDmsw5iS3X7KseVN6N4c7rfT3wP0BNjhtVm6yDG2Uz+PFNGDeyGDnMDPsd47l
 DeG9RHXZYIDSA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
	Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH v2 3/3] ASoC: rt715: modification for code simplicity
Date: Fri, 16 Apr 2021 19:34:33 +0100
Message-Id: <161859792865.33058.8999459933890793060.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <340ee2df83ce47fcb1b59541b12ba7f4@realtek.com>
References: <340ee2df83ce47fcb1b59541b12ba7f4@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 lars@metafoo.de, Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?Derek=20=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 =?UTF-8?q?Shuming=20=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 bard.liao@intel.com, pierre-louis.bossart@intel.com
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

On Mon, 29 Mar 2021 06:54:05 +0000, Jack Yu wrote:
> Modification for code simplicity.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/3] ASoC: rt715: modification for code simplicity
      commit: a48f928e13a01d60c9c2a7a7ffab3afd1f7337bf

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
