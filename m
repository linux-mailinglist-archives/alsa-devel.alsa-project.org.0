Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED27602A2C
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 13:31:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B70559C3A;
	Tue, 18 Oct 2022 13:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B70559C3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666092659;
	bh=aMk40YL2NOee5eZ/vBDbr31W8TTEy1EI+updjIv2MPw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pkjHMizMA+BzCz64eeLFjIcKCXZGeOILEM5p8IoN0JHknM3mvfjaxKq/8Nu8oYegt
	 ulUQzDvwpIsHBylVbvpApb4khWKevrTNbLauqSiHdwWbhlvpTMA3fLB1IVdHJ1PZVT
	 DIStCVk9zwA9KGhKuR13zUpBjETlykIrcveNgzxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63363F8057A;
	Tue, 18 Oct 2022 13:28:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C990CF80578; Tue, 18 Oct 2022 13:28:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84388F80566
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 13:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84388F80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Kh82c687"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6392C61530;
 Tue, 18 Oct 2022 11:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E326FC433D6;
 Tue, 18 Oct 2022 11:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666092511;
 bh=aMk40YL2NOee5eZ/vBDbr31W8TTEy1EI+updjIv2MPw=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=Kh82c6878xY2PUD74wX29c+T0kyWrRD4EKrnE631tDOUXD/9tOJ1gC9Hu9lKL66BG
 awfJv2tkW0AKPb+0tuyvNkqkqxt0JM3Iu1KSEBOTFwKG6bxjvFO1At1fBH1ePR3cYv
 aa4dFCArx6N7wC7WZiuqgkDMaVKkfmE/Ln2YOijmg0wCIEeMkt5iDM3XzkcxdRFwqC
 l6OFutkgLhHdCGIhlKDdO+s8eVAeaNQeGdIp/XvY0TSWZBcJslvg0ryP20wirBWrQE
 mYsbV+DWh0ZT7m8HIFcDvY9eN7fQ4QSDHjFvMGovqV1410slE899SP+OHYfogWNC01
 6KedUcebMbjTg==
From: Mark Brown <broonie@kernel.org>
To: Shang XiaoJing <shangxiaojing@huawei.com>, rf@opensource.cirrus.com,
 tiwai@suse.com, christophe.jaillet@wanadoo.fr, 
 james.schulman@cirrus.com, david.rhodes@cirrus.com, peter.ujfalusi@gmail.com,
 alsa-devel@alsa-project.org, 
 lgirdwood@gmail.com, patches@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, perex@perex.cz
In-Reply-To: <20220927140948.17696-1-shangxiaojing@huawei.com>
References: <20220927140948.17696-1-shangxiaojing@huawei.com>
Subject: Re: [PATCH -next 0/4] ASoC: Use DIV_ROUND_UP() instead of open-coding
 it
Message-Id: <166609250864.155136.11996964656320484311.b4-ty@kernel.org>
Date: Tue, 18 Oct 2022 12:28:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Tue, 27 Sep 2022 22:09:44 +0800, Shang XiaoJing wrote:
> Use DIV_ROUND_UP() instead of open-coding it, which intents and makes
> it more clear what is going on for the casual reviewer.
> 
> Shang XiaoJing (4):
>   ASoC: cs35l36: Use DIV_ROUND_UP() instead of open-coding it
>   ASoC: wm8978: Use DIV_ROUND_UP() instead of open-coding it
>   ASoC: rsnd: Use DIV_ROUND_UP() instead of open-coding it
>   ASoC: ti: davinci-mcasp: Use DIV_ROUND_UP() instead of open-coding it
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: cs35l36: Use DIV_ROUND_UP() instead of open-coding it
      commit: ff091dd23b423e19c8191928daedf62eab6ce523
[2/4] ASoC: wm8978: Use DIV_ROUND_UP() instead of open-coding it
      commit: c54402609820427ff6f725f9182216e7cfe7cfa7
[3/4] ASoC: rsnd: Use DIV_ROUND_UP() instead of open-coding it
      commit: 4aa2b05a24a83cc618fab4c4d343f2179962e5ed
[4/4] ASoC: ti: davinci-mcasp: Use DIV_ROUND_UP() instead of open-coding it
      commit: 98059ddfd1ada95fc9f535ea9c08618aa44ad5d3

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
