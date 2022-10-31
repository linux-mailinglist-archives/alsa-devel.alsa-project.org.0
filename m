Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 379216139E4
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 16:19:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B26E8163B;
	Mon, 31 Oct 2022 16:18:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B26E8163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667229575;
	bh=5ImeOscq9YaVQO2U0AE/eN73YuOvrFN9YE64Im7ZJHE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g0r/3ez+yOtWWd6VJ/Iu9N9/p6MxIe3oZ5Rvb62epD6qd0sGZJ2acKYoEXYD2dNgJ
	 WqMK5MJ6Y44OnnL7GZzCLmbcjhqj+L/kojrXbyP/wQIs7ygnRmYK7a2RvdNGeb4fiC
	 aoYQbnFY37/F6aHsBLcxAVxnjWvZxTFO1SGrjIe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3957CF80256;
	Mon, 31 Oct 2022 16:18:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29ADCF8021D; Mon, 31 Oct 2022 16:18:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB848F800CC
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 16:18:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB848F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="br+E86Jj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84031612AB;
 Mon, 31 Oct 2022 15:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF920C433C1;
 Mon, 31 Oct 2022 15:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667229509;
 bh=5ImeOscq9YaVQO2U0AE/eN73YuOvrFN9YE64Im7ZJHE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=br+E86JjMHh2jBZwsZwp/uN/u8/4wKJQ9uqAhqizX04RCJGO7Kg4aRfYVLlJCcTd6
 N0sejut8Oy3ss2MW531oSyPudi1m1i2WzLrn+3UOkedrTk1xtv4gkE8T9M3WukAdCt
 KQoLMRmIgPXhw4AYhZ3dTgIL+YmV9reQvBczkjzXKR66puUiD+a/+t0UBALZigQCIL
 C6LqQ2KBRMYrxunja/fZrbHoVghySp38ZdRYAee40qmBbZzBWqeT4uJjvI1ovif35X
 wm25dzuoK4t+sm0tqSWcsOLnpHbSRip3+mYvUxcTlOR8QXpLEXRlvy2LrJz6liNW+l
 RALDZIbi/tcyg==
From: Mark Brown <broonie@kernel.org>
To: Martin Povišer <povik+lin@cutebit.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20221027095800.16094-1-povik+lin@cutebit.org>
References: <20221027095800.16094-1-povik+lin@cutebit.org>
Subject: Re: [PATCH 1/3] ASoC: tas2770: Fix set_tdm_slot in case of single slot
Message-Id: <166722950654.326387.4999935001407082845.b4-ty@kernel.org>
Date: Mon, 31 Oct 2022 15:18:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 linux-kernel@vger.kernel.org, shenghao-ding@ti.com, kevin-lu@ti.com,
 Jos Dehaes <jos.dehaes@gmail.com>, Frank Shi <shifu0704@thundersoft.com>,
 Raphael-Xu <13691752556@139.com>, asahi@lists.linux.dev
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

On Thu, 27 Oct 2022 11:57:58 +0200, Martin Povišer wrote:
> There's a special branch in the set_tdm_slot op for the case of nslots
> being 1, but:
> 
>  (1) That branch can never work (there's a check for tx_mask being
>      non-zero, later there's another check for it *being* zero; one or
>      the other always throws -EINVAL).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: tas2770: Fix set_tdm_slot in case of single slot
      commit: e59bf547a7dd366f93bfebb7487959580ca6c0ec
[2/3] ASoC: tas2764: Fix set_tdm_slot in case of single slot
      commit: faac764ea1ea6898d93e46c403271fb105c0906e
[3/3] ASoC: tas2780: Fix set_tdm_slot in case of single slot
      commit: 6f934afa6a980bb8d3ce73836b1a9922685e50d7

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
