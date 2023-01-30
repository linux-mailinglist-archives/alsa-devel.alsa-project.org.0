Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7B681A95
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 20:34:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9960852;
	Mon, 30 Jan 2023 20:33:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9960852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675107284;
	bh=iJbwZV4UQ2TeruOJ4+84FIVZxAP9R4mCDnySdUbbU2M=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=l545AZNfiixQ/IFGzYRwwqYlhJVFrDUCALEO1u84QGShD1g394d8bhnnDSvhKtH2K
	 9DGgcJEEGZyY0e+nJsrgIgNfw88Y78Vh52sj3l6UpIsbZpjI0sYEZAV783e4B+uD0G
	 o/SP1FHB7HJONKpJ3Is646+xnHLc8xhnVh3O1sCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01A63F80423;
	Mon, 30 Jan 2023 20:33:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0588CF8032B; Mon, 30 Jan 2023 20:33:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8442F80155
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 20:33:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8442F80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FhL4DraK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4252AB815E9;
 Mon, 30 Jan 2023 19:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD89C4339B;
 Mon, 30 Jan 2023 19:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675107214;
 bh=iJbwZV4UQ2TeruOJ4+84FIVZxAP9R4mCDnySdUbbU2M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FhL4DraKIftOi2RVJDZGxNSwKkTd1afAp1DTz5I0CrD+Jpd9wqyib12jVejhnw/CI
 gDlDHLFMu2e+WO/cLNcvI4kZyLJdeA13hl0R+cQtjg8dqiXmX5mDHFhw5+fZvkHwfK
 SaqWUxjINPXpFxkgbLgK1bH1qNg6FAdzq7cEI7cVpImP76U52aH9LLJ+T6n3RuPS50
 gRXuZ2JKmjxj4tXwEH1JU/8C6qZpENjVbp5ehEvwsuoqEEgUF5BmUb2IeHThXkgyum
 udPbkcxHHB71Qkdu1djC2om805t01z8tRvnIQvt2MMiSkX5i/rpC46eV45vkLiZZ8p
 eDWD89VTfJDdw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
In-Reply-To: <574b6586267a458cac78c5ac4d5b10bd@realtek.com>
References: <574b6586267a458cac78c5ac4d5b10bd@realtek.com>
Subject: Re: [PATCH] ASoC: rt715-sdca: fix clock stop prepare timeout issue
Message-Id: <167510721304.1539540.12025220772981094616.b4-ty@kernel.org>
Date: Mon, 30 Jan 2023 19:33:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, shumingf@realtek.com,
 "Flove\(HsinFu\)" <flove@realtek.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 30 Jan 2023 02:43:25 +0000, Jack Yu wrote:
> Modify clock_stop_timeout value for rt715-sdca according to
> the requirement of internal clock trimming.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt715-sdca: fix clock stop prepare timeout issue
      commit: 2036890282d56bcbf7f915ba9e04bf77967ab231

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

