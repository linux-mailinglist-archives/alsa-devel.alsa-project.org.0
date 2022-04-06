Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3862D4F6DEC
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 00:41:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B782316F8;
	Thu,  7 Apr 2022 00:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B782316F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649284905;
	bh=SLBmZmUQFu6ocPpiTXg/ZfKopGRrWNCkVkI/W8/zI8c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YlfduLpc7KG8vWj/6fGoc470MeVl2GHA5YTXYHzfHbDuQznPpMK9F5wwrpq3CiK6p
	 rv0AVYwSbrt0M/tQ5LJwFLqd2Mt7dOoqDNc2lO3nqulxsL8PyziDoTWbKqA9eGqdiq
	 Z58v53PP2g7XeZODNKd+Gu9C3lE8zD/yJYrAGTXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 428ACF8019B;
	Thu,  7 Apr 2022 00:40:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84456F800D2; Thu,  7 Apr 2022 00:40:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3EA0F800D2
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 00:40:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3EA0F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C3r93B7N"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5E3F5B82528;
 Wed,  6 Apr 2022 22:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B20C385A3;
 Wed,  6 Apr 2022 22:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649284840;
 bh=SLBmZmUQFu6ocPpiTXg/ZfKopGRrWNCkVkI/W8/zI8c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=C3r93B7NMrOaojcfkklSZljw1rKZTdD3K4A8FORKTIH7CuCuFFDtVN4zQonXs74Tk
 TYVT/WHUB7YXqdR6dXRMEWMLKSc+Q9PgW+qhPXyORqzNpu0A3fO4QrwuRFcXDbrFbw
 D52E0OBjMGoC+vtBfY0/eO5sMQ6ZdXHu4Cb9mEek4YZdJawNFrJdusdGp8TienuUrQ
 8IJSTAGkWKQXXx/JFudtkIdT4e5nmxDStQkBIV03VsEPxRvmFDr2Wx7DMOzx8Ojx1w
 Ejqbs9ZKmKBPQ58pRVFzfAs6l6m4aZHJqTzb+CABK/31VO5353mSrYLEZ8Sf+51lIh
 6P0pfLbufR/EQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
References: <87h778p9mx.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/6] ASoC: ak4613: add TDM256 test support
Message-Id: <164928483922.1687192.11746744849051499713.b4-ty@kernel.org>
Date: Wed, 06 Apr 2022 23:40:39 +0100
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

On Tue, 5 Apr 2022 02:05:42 +0000, Kuninori Morimoto wrote:
> Renesas is the only user of ak4613 driver on upstream for now.
> It has STEREO/TDM512/TDM256/TDM128 mode, but STEREO only is used,
> because of Renesas board connection.
> 
> I noticed that I can test first 2ch out of TDM256 mode 8ch
> Playback even in such a situation.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: ak4613: add missing mutex_lock()
      commit: 3407e36dc78f4a980588c9347076aee9925ca51f
[2/6] ASoC: ak4613: tidyup ak4613_interface
      commit: f7c0e14f5717aabc5db7e4eb6324d750d415d022
[3/6] ASoC: ak4613: return error if it was setup as clock provider
      commit: c08673ede71fba70a10be0470565ed2470ef1fe5
[4/6] ASoC: ak4613: priv has ctrl1 instead of iface
      commit: e67d19a400cb12650169e4f57b8943e41266de53
[5/6] ASoC: ak4613: rename constraint to constraint_rates
      commit: 7bbb049c961a4e6b33520ab56d4b3abd947315ca
[6/6] ASoC: ak4613: add TDM256 support
      commit: f28dbaa958fbd8fb7ffe40211b0e083156191f84

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
