Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B11B9565A80
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 17:58:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07DAC1724;
	Mon,  4 Jul 2022 17:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07DAC1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656950319;
	bh=BpTmJubMs2qUx6naTQaapSEcEv4ZyxAHDy8bQevFv3U=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V43ZS40RO9Nh7NMTVC8mvojczJVKXxdXy+PTxVZzQ3aYmIKucwJ/Xlt+QBNxJHV0o
	 cq57KBK7oRx+9psH654u1exzg0Os7zVfXVmGGvqYUrvXREx3IpEEBNvWZKBmDGA+83
	 96EslDGkKEuQdtNCN96PcTKtKTYQxqrjuSJB+J10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C22FF8016E;
	Mon,  4 Jul 2022 17:57:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF604F80165; Mon,  4 Jul 2022 17:57:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F99CF80139
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 17:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F99CF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ORTk4Kp3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 29D6060E84;
 Mon,  4 Jul 2022 15:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCA1C3411E;
 Mon,  4 Jul 2022 15:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656950258;
 bh=BpTmJubMs2qUx6naTQaapSEcEv4ZyxAHDy8bQevFv3U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ORTk4Kp3CH9Tjltwn0WeW+St5tAC10Eay5u0OHmU4rAGGQgO6Cd/9CwUcdMzyEbla
 FiRpAC8izJ4RcQb8DPGKn05abiCPZ6zwWPyLMex/1vIJQ9DUcT/IHYMks733p5vM1G
 XDZOiTM8k4KZwg/iOfZz4R/tpXPvZmQMWYHFJMjR4Aa2vslwJ024/hJ1xqNarNaGj9
 gKFTXGhV76remIq7v/N7KpN4cPWkTWXm+PnYoLD7pFBqlz/KoNNmPtW6m6LSB7muEt
 t4ZjqxjcDurlFdJzVqbvxJTgpCNyi5pveRQmkiOJ6vu3fEQTS9tfx0pPsJhRmV9RKV
 +K3bwrA+J1z/g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, jiapeng.chong@linux.alibaba.com
In-Reply-To: <20220701073039.64556-1-jiapeng.chong@linux.alibaba.com>
References: <20220701073039.64556-1-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: codecs: max98088: Clean up some inconsistent
 indenting
Message-Id: <165695025694.481068.15705857947367046275.b4-ty@kernel.org>
Date: Mon, 04 Jul 2022 16:57:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org
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

On Fri, 1 Jul 2022 15:30:39 +0800, Jiapeng Chong wrote:
> This was found by coccicheck:
> 
> sound/soc/codecs/max98088.c:1761 max98088_i2c_probe() warn: inconsistent indenting.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: max98088: Clean up some inconsistent indenting
      commit: 1d5c7a91dfc2b7a5672a2706553e5782482d6e6f

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
