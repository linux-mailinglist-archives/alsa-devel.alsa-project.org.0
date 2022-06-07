Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EAA53FC8A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:57:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 079501AD2;
	Tue,  7 Jun 2022 12:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 079501AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599460;
	bh=TWAVt5W4YZhsp8W6n15G1e4zRyt7HsouZ1vSTVMoJ3A=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kp0p5DGBqcv2fAH4ukvSIX/rcynmZvrvVHflJKsItB6kFy2Yi2Ds9LmnW4HZtgZRB
	 G50TdCVcy+Rcz3Gt5tWQlmOBZyX2ZiVp3xdi3Y8xviYw4izbf3xnKpCcic81tHDQQN
	 k8jkxPUs1FRABNZB5Fx50SnVG5hA4AlAvJVwC5w8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B88EDF80563;
	Tue,  7 Jun 2022 12:55:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3178CF80551; Tue,  7 Jun 2022 12:55:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F1F8F8053A
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F1F8F8053A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lcEzC+zY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CC3D6B81F01;
 Tue,  7 Jun 2022 10:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A869C34114;
 Tue,  7 Jun 2022 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654599305;
 bh=TWAVt5W4YZhsp8W6n15G1e4zRyt7HsouZ1vSTVMoJ3A=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lcEzC+zYZgAjFqCi/jicqHUrI9YCo/4aFHkHqnQhcd0pgam/j1ZBQgtz4bXegephm
 3Xxh5fdpqReFR0FMPM3WKEJNusI/1NIXGafsN1xI3uWSaCdJXFaRmeIbGXUrGbtAyv
 zVhtJ0QHXVZ2QzlSh1XBwARmMj51YKEwNvtHkF2D7XlGNN/cQMWSSUZIgoA6L/rybj
 Hu/UC56kpoKqwzz2zpM+6INahBXTDKDTX0glud4PDI7Gh5+b9qRQaRLNbBoSdQmzyI
 iX5pr8JeekeGjarH0BEhB3F132w2MQNcdrt6lV6/PApPe4J9hdE/vhwstnvUKMBRvd
 gALU9ZV77n9HQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Vsujithkumar.Reddy@amd.com
In-Reply-To: <20220525203415.2227914-1-Vsujithkumar.Reddy@amd.com>
References: <20220525203415.2227914-1-Vsujithkumar.Reddy@amd.com>
Subject: Re: [PATCH v4 0/2] Add Machine driver support for nau8825,
 max98560 and rt5682s, rt1019
Message-Id: <165459930409.399031.10028377605725666573.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:55:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 ajitkumar.pandey@amd.com, Vijendar.Mukunda@amd.com
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

On Thu, 26 May 2022 02:04:12 +0530, V sujith kumar Reddy wrote:
> This patch set depends on:
>         --gpio patch
>         --https://patchwork.kernel.org/project/alsa-devel/patch/20220516160619.17832-1-Vsujithkumar.Reddy@amd.com/
>         --https://patchwork.kernel.org/project/alsa-devel/patch/20220516160619.17832-2-Vsujithkumar.Reddy@amd.com/
> 
> v3 --> v4:
> Resolved:
> . Assigning direct address without (void *) typecast.
> . Used snd_soc_card_jack_new instead of snd_soc_card_jack_new_pins as per suggestion.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: acp: Add support for nau8825 and max98360 card
      commit: 0439eb4d94e0fc17c6dd3829fabd88c11773381d
[2/2] ASoC: amd: acp: Add support for rt5682s and rt1019 card with hs instance
      commit: 4dc6737cfe882765d914fcb88b5eaa14551ffddd

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
