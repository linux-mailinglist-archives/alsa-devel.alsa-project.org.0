Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 387AE46558C
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 19:34:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE76C2673;
	Wed,  1 Dec 2021 19:33:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE76C2673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638383681;
	bh=p+gM64NP+iunNzUXn4I/RtPaQ0kGiLpth9TxehEubfU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oGV+kAc/9t+E10GFCfdZXxvqIgN7iNzXfrQQatC8geq0J1Q34DENO4yms8ygCcjxm
	 8CWM6DytreksEt5u0zjpNvSRUB581ejsHyLqbTWm8OganGw0yHfQdOsaiHgmg3RXLG
	 8jz+SsdvR9Px1MraVnL5Ek8EbyzbPgIhY2ImbEIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5356AF80506;
	Wed,  1 Dec 2021 19:32:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91619F804FD; Wed,  1 Dec 2021 19:32:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DD53F804ED
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 19:32:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DD53F804ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mE1MsPlf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EADB0CE207D;
 Wed,  1 Dec 2021 18:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9EFC53FAD;
 Wed,  1 Dec 2021 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638383525;
 bh=p+gM64NP+iunNzUXn4I/RtPaQ0kGiLpth9TxehEubfU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mE1MsPlf+7tnToA7MTm76YtwYt3RtcQbGfqmYIJW0kXuXpWjy6cLFI5BGVZjTt0B9
 xqBcXAf5dGNCj3ZiMBuHYIO4tCZ1R77hpfUeIS/K2vlPYeKpSlShJoRH+wvWWqumwV
 25ibl2r0RaZkyhY7uEMXiLNxklrsy3G9L5J/eNY9nqEH/W4AhIZWc0djf2dWwqxURf
 4drtUYbDMXghIy/BJyOrpsfSlxWcP9vmzeOqa8t04b+OT/xTgf109e5Z7XxDSwjBiU
 aoeBylv0+6rOvikIwlLTVkGSLjt/DUbDJ5v4TjvW1pV9OU41ETpKiHhtLU0wwxajeE
 MWYvvQfRSQJBQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20211130160507.22180-1-srinivas.kandagatla@linaro.org>
References: <20211130160507.22180-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/4] ASoC: codecs: Qualcomm codecs fix kcontrol put return
 values
Message-Id: <163838352348.2179725.18246298333579842383.b4-ty@kernel.org>
Date: Wed, 01 Dec 2021 18:32:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com
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

On Tue, 30 Nov 2021 16:05:03 +0000, Srinivas Kandagatla wrote:
> Some recent testing found few issues with wcd934x and wsa881x codec drivers that
> are not handling kcontrol put correctly. This patchset fixes those instances.
> Along with this there is also a bug fix for the way channel list was updated for
> wcd934x dais.
> 
> --srini
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/4] ASoC: codecs: wcd934x: handle channel mappping list correctly
      commit: 23ba28616d3063bd4c4953598ed5e439ca891101
[2/4] ASoC: codecs: wcd934x: remove redundant ret variable
      (no commit info)
[3/4] ASoC: codecs: wcd934x: return correct value from mixer put
      commit: d9be0ff4796d1b6f5ee391c1b7e3653a43cedfab
[4/4] ASoC: codecs: wsa881x: fix return values from kcontrol put
      commit: 3fc27e9a1f619b50700f020e6cd270c1b74755f0

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
