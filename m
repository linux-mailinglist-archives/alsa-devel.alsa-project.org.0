Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD30F5B854C
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 11:41:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02703184E;
	Wed, 14 Sep 2022 11:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02703184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663148481;
	bh=NON4s+poYWHm0+VBJ/uGgY91L7qbBPDPpCAWUeFl1lQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ftgqx9emw2CBRCCjKLVauPLkrZISh8gvuQPgB/6REv22NOPs5l5QfECOoimXBDJ4S
	 9aQebcMKUg9RK/q9m2UIp3yrE9kIuRSG1dJAt5UZ4hiMrL//sUJ2kPbdgEsJB1b6d7
	 Pfuo5zqHbjow3c2D9zUeE8eDVFzcU66YIuG+R4Qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 526E4F8014B;
	Wed, 14 Sep 2022 11:40:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65EFBF8016E; Wed, 14 Sep 2022 11:40:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62EE0F800C0
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 11:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62EE0F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="klEq28NY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B5E061B01;
 Wed, 14 Sep 2022 09:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F57C433D6;
 Wed, 14 Sep 2022 09:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663148415;
 bh=NON4s+poYWHm0+VBJ/uGgY91L7qbBPDPpCAWUeFl1lQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=klEq28NYTOqDeVhY2NdGRM0PlDlswUR5qIWh+2AWYNxJdn7RcOBnjqEnUi+RONow2
 WFdL1AeUbgwrXcS9+mMNx8q1f1g6141YjXiX6e9j2Jke5BWWE5im8tT1lnwDpcgWNr
 vIkviUNK34/7W6Bs9WL/J/fcvEtrLgfMkyo9bINmuzWG0et2ddXfKCPUoFO+gxfLwy
 Nla7cSqNNS33XLMVlsOCja3hJdBRTMzKFN2W9dr8L28gXBvD8JqGc6GBJrT5kl12RO
 f51sJmQjqJENyb2tDNlhOA4Yq8hCq69MRPZhSiiPNs6zkhhkb4SHaItJNRGF+BF8xV
 cvuHCLGYiSV0g==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20220911145713.55199-1-mike.rudenko@gmail.com>
References: <20220911145713.55199-1-mike.rudenko@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: sunxi: sun4i-codec: silence misleading error in
 probe
Message-Id: <166314841203.314266.13063838088895693930.b4-ty@kernel.org>
Date: Wed, 14 Sep 2022 10:40:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-7dade
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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

On Sun, 11 Sep 2022 17:57:11 +0300, Mikhail Rudenko wrote:
> In the case when a codec device is probed before codec analog
> controls, snd_soc_register_card() returns -EPROBE_DEFER, resulting in
> a misleading error message
> 
>     sun4i-codec 1c22c00.codec: Failed to register our card
> 
> even if the device is probed successfully later. Use dev_err_probe()
> to demote the above error to a debug message.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: sunxi: sun4i-codec: silence misleading error in probe
      commit: 30248f618d30cf1ad9d5a72126799f2f0239860c
[2/2] ASoC: sunxi: sun4i-codec: set debugfs_prefix for CPU DAI component
      (no commit info)

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
