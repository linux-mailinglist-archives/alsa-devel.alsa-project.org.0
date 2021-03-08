Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C21A331304
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 17:10:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD9F218B4;
	Mon,  8 Mar 2021 17:09:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD9F218B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615219849;
	bh=prCh/xGiHbNquextTbUBnmsLnM6OjHCR/I80pp00SsU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jo1HehXW5uZ/MZgCLWzPpCZ+1Y6YM7t8+9296+xFOfkPCRW8s2Ka/ltgAI1MiDzEn
	 5awaePQTj02mdT+4bnrPIHbZKeTRXlWOeRRJswvs0MC0uGCxXQdZYCeHZSVo32jq82
	 nGeYKXIjFbrE3mtDauzcOE/eQhZi54fLD9tkyImc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52975F80431;
	Mon,  8 Mar 2021 17:08:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57643F80430; Mon,  8 Mar 2021 17:08:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D708F80279
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 17:08:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D708F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gb+oYKAX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0756C65227;
 Mon,  8 Mar 2021 16:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615219695;
 bh=prCh/xGiHbNquextTbUBnmsLnM6OjHCR/I80pp00SsU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gb+oYKAXJIzpXVYIbMN1vWuHVFEeQWDYFCJe7JnEAYcWMq1fcar5Y47NtfhdeKvAT
 2MCwS8hQiY2NR1M5N09x/8zp4uT1xBWinGDnhJ2Dv3o2uw6IrsunmfqmxTmKRTFnH2
 nZ+l+7a6uMYn4iYc2cTp35BtBNR3mA459Ts5i+iLEn4akOuyM38Kwi1k+a0RMQLIzs
 zhbYQCnTPhtdZ9ZthYPpOn9M0ZPA7ea1RqW4a2dbqgy/ulRkbY1f7AUMUB7FiyqhzX
 2AWKRsLWIFuZGU5uc0Yo14Fy6B/YP3fs5GKdibkCtxooRy+6CVuJqljMMq22HDUwQw
 BF5lhUuaI2MHQ==
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com, lgirdwood@gmail.com
In-Reply-To: <20210302091506.18745-1-shumingf@realtek.com>
References: <20210302091506.18745-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt711-sdca: Add RT711 SDCA vendor-specific driver
Message-Id: <161521960848.9621.1458662142974315741.b4-ty@kernel.org>
Date: Mon, 08 Mar 2021 16:06:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, bard.liao@intel.com,
 flove@realtek.com, pierre-louis.bossart@intel.com
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

On Tue, 2 Mar 2021 17:15:06 +0800, shumingf@realtek.com wrote:
> This is the initial codec driver for rt711 SDCA version.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt711-sdca: Add RT711 SDCA vendor-specific driver
      commit: 1cd2219246bd8a07d490e463ee24d2c813bb5b7c

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
