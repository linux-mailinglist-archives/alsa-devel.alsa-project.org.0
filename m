Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BA4662BB7
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 17:52:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90795C5FD;
	Mon,  9 Jan 2023 17:51:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90795C5FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673283136;
	bh=6whJ0QANOCNjC53KMKQK8y/6ON4VOmcSnjxW6oSg+18=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Rbl52AIxk4YiFa15ABkyuuXwDVOOJCbIbQf6wRq1oWBuRL8I9DYdZEzhaMAbXnlk7
	 9XCGqn5lkmieutEBe9vhCHE4tfZ+ymCt/BABIrcfo9ojiehQ/zA+yMTFxjWRdWp2Ij
	 xDffCyLAjIFpI2bIfRmqGQQ9NRy6eU4DUhvFhmqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD398F80578;
	Mon,  9 Jan 2023 17:49:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A4F4F8057C; Mon,  9 Jan 2023 17:49:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36AFEF80578
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 17:49:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36AFEF80578
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SPfMRdmH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2437F611EA;
 Mon,  9 Jan 2023 16:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7282EC433F2;
 Mon,  9 Jan 2023 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673282963;
 bh=6whJ0QANOCNjC53KMKQK8y/6ON4VOmcSnjxW6oSg+18=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SPfMRdmHECXZTtZv1ZvHUGpq0ZwPTX9P0MyD7fcfoH7BwGFeXHV5MqTiAXc50PNvB
 CSEmyNOhQgCc2agg8aF1jSH0KgNmjua6OE3R6s1yydki/KP3AvArUEWLBQGLW6v/o7
 QkpWmK9rguLjDJYZsC9FrWnXQ7HjEFf3P0mAhlkW94mMqLIhXk/PgpTDf/y6KzGNdI
 UTw+/pifw+NVd98vYfn9wNKAaL7BZC71mq59bMy1rKGkrx1UT4NZmbqCne7nQy7wXY
 /Gb93WKXPX64QqwrlDBPghFDZiB2CPMdBeLQBldeJGkCC59Yd5jVoCil4ttXlJGbwk
 i365bagjqf5SQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20230107175933.12973-1-ajye_huang@compal.corp-partner.google.com>
References: <20230107175933.12973-1-ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v1] ASoC: mediatek: mt8186-rt5682: primary_codec_init()
 warn: missing error code? 'ret'
Message-Id: <167328296017.323147.11445236874272404892.b4-ty@kernel.org>
Date: Mon, 09 Jan 2023 16:49:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, "chunxu . li" <chunxu.li@mediatek.com>,
 Dan Carpenter <error27@gmail.com>, kernel test robot <lkp@intel.com>,
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 tongjian <tongjian@huaqin.corp-partner.google.com>,
 linux-mediatek@lists.infradead.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 =?utf-8?q?=2C?= AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sun, 08 Jan 2023 01:59:33 +0800, Ajye Huang wrote:
> The function primary_codec_init() should return 0 if dmic_sel is null.
> 
> Here is the warning message reported by 0-DAY CI Kernel Test Service.
> 
> smatch warnings:
> primary_codec_init() warn: missing error code? 'ret'
> ...
> 2022-11-02  141       if (!priv->dmic_sel) {
> 2022-11-02  142               dev_info(card->dev, "dmic_sel is null\n");
> 2022-11-02 @143               return ret;
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186-rt5682: primary_codec_init() warn: missing error code? 'ret'
      commit: 05d450b06d6a299bd5a7f209c81db681c3cdbcd9

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
