Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C589F639115
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 22:30:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AE4C17B7;
	Fri, 25 Nov 2022 22:29:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AE4C17B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669411801;
	bh=gpXPBtkhlxtel6UIyjoIqn1pao+hcbuVms341nimoJQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HFkE1iFEjYcUe7UNF6P1px5ekqLSwhhGqbQH5ua8MAbXQCkRnD2t54DozwNVBUnXN
	 0+q9624qkl+bpMyGH9ffXhzgEiKPQDM8YL32BYkrqmywdD6/9U+LEpiy/JTgCfPjuQ
	 ZFRsIiWm/Tg1+yXWrPEGdwh9VZn94azlbpSX2mqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96E53F80536;
	Fri, 25 Nov 2022 22:28:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 155E4F800B6; Fri, 25 Nov 2022 22:28:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F41D7F800F4
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 22:28:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F41D7F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Nl9DUJ3v"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96A0560EF5;
 Fri, 25 Nov 2022 21:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43908C433C1;
 Fri, 25 Nov 2022 21:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669411711;
 bh=gpXPBtkhlxtel6UIyjoIqn1pao+hcbuVms341nimoJQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Nl9DUJ3vMi8UC8RHx3P+XDA2HgU08oruVOHNvBs651LwYsWMFRU4R4hQ4d7mQ/kTe
 kCqE3b6gSIhwgk2qqX+0soOhAq+q84w3ztomCxUszjVR6xM6vK/5dmOGVM04XaVkHT
 Rr5Wbk5zGQOneBwGQdrMuf0Qbs6/izdmwubpQguAh6t+iqK6ZIPQJWEUzaUHrsEtny
 C3VgwPLCh3I7TgxulJwdwr/mHLhbFRYdtbpCyXxHh1kUEFtRskh52vDE2Jy2uD9GNa
 mIEh+ra80smqk0EsgMjYs/Zg5KHYJCJG/oSQxtj/MMRgatj5xt/6dRv+f/ijIHl9Be
 RAHSy6wS+7ezA==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, lgirdwood@gmail.com, matthias.bgg@gmail.com, tiwai@suse.com,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
In-Reply-To: <20221116030750.40500-1-jiasheng@iscas.ac.cn>
References: <20221116030750.40500-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: mediatek: mtk-btcvsd: Add checks for write and read
 of mtk_btcvsd_snd
Message-Id: <166941170899.2089698.737782395946563424.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 21:28:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Wed, 16 Nov 2022 11:07:50 +0800, Jiasheng Jiang wrote:
> As the mtk_btcvsd_snd_write and mtk_btcvsd_snd_read may return error,
> it should be better to catch the exception.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mtk-btcvsd: Add checks for write and read of mtk_btcvsd_snd
      commit: d067b3378a78c9c3048ac535e31c171b6f5b5846

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
