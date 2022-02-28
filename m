Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 034184C78AD
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:20:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93D7F18A3;
	Mon, 28 Feb 2022 20:19:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93D7F18A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646076030;
	bh=qXz64UzAUTPXSV9SiLywgCeQ/64fwI9G+5Ew5tiSkPg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hd1s9qnhm5Q9UJ/ikiDUf1g1RrbiK2uFA7LvrTZX35mDA60ebFPwouyffmQomBRhL
	 DOAkbw3fYSaZs1dimylt01irNN/HKEmQft4su9l1INpfMOkCu1Jy2XfVxN1TufuEdZ
	 MUo9ql7wtMAo1sP8cv/W4G3HMpB4DVlcN0A6Ij4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3CB7F80568;
	Mon, 28 Feb 2022 20:15:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1309F80533; Mon, 28 Feb 2022 20:15:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64BA8F8051E
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64BA8F8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H+WhSdv7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89B25B8162D;
 Mon, 28 Feb 2022 19:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81785C340F1;
 Mon, 28 Feb 2022 19:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075730;
 bh=qXz64UzAUTPXSV9SiLywgCeQ/64fwI9G+5Ew5tiSkPg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=H+WhSdv7JKK/RNX93iHCZ8s3PeoEmW8robj9/X/6EM1PaXINlUXp2zhBKTzt8D2DS
 gtNzNkZhFeJmbXjYfHQpr9M1nl1lYd+psjuJXI7A88M9zxhG4cx5D1PnI7BcvROlcY
 lvqGYlvEkJhlySOixS2GZLqWxCROnejxy7fvsPkDytQDsF9v0rIAW1fEjdpgnD3cnk
 pIjnHBLfzRqW0jIBlpf5WTXgcJhfZtSxE8PpAhMx3zL2n8s1hPdh/N9zpeRzb+5Woz
 oIBga7HgjoYo/oRwQfZpUL6XKLw7QfH7kakEOVTArZWRTvc/10Twjl1lEqtI0Jxica
 xMtN3yuEoSoXQ==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220223003409.1820405-1-broonie@kernel.org>
References: <20220223003409.1820405-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: uda134x: Use modern ASoC DAI format terminology
Message-Id: <164607572924.3538791.11972497931161258197.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Wed, 23 Feb 2022 00:34:09 +0000, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the uda134x driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: uda134x: Use modern ASoC DAI format terminology
      commit: 6370c4436b639069d5c5d97cb896157f780cb779

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
