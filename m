Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2FF455090
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 23:33:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C8C518FF;
	Wed, 17 Nov 2021 23:32:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C8C518FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637188392;
	bh=jn1cqoJ3XZaDqZgqyRQKukXK0FQ0EKQh7jJIum/8OaQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ge59FHLa0HbNaZwnAOkHJ30unCi8tT9IGKVulP4/XJZ+wTYqiKvQxTgjzgNWVPXLP
	 WOgUbc6hUHfm6GdTi/sDCoJ4yHkpoQdrLQh2BfGAh2wmR1QpOB8NOwk12a7X/20fje
	 idmwfn7L+1iTAgdO/JX//H+6qcYcHxk/aCSL1ptA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52633F804BD;
	Wed, 17 Nov 2021 23:31:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04A5BF804BD; Wed, 17 Nov 2021 23:31:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FD43F8016C
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 23:31:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FD43F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hoTkBKgw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A10461882;
 Wed, 17 Nov 2021 22:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637188287;
 bh=jn1cqoJ3XZaDqZgqyRQKukXK0FQ0EKQh7jJIum/8OaQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hoTkBKgwg3wNI7wPETWtWKDEHpOczYSpXY7Fd7OfCnJaUCcB8havj6RGTOwsoLH90
 2jZSxxaMytPyaN2Wh7GIYQbsW7a7Jrrpq4Z5ckeblOBBiaua2ngMNUOISCM5IVsapE
 Hkt3bv7MBSB0so6oKFS1OQswjxfsPUx4jZPoK+MQiMRQeUoGUwKLbIqhqoJYXw4t2Y
 ITEgt9B4ELBvXWLwnovHZW/TiBIQZiCv1B7Imrjr9Zcx+Zo4vBMKA1FMnXao9feAfF
 AbLz8UFBxVi9O46VMrpU9ujlPm0QQaFoq8n6PzMaZmC7eryaQ27NJ2j9QW/lSChkdY
 wV5NXrh5OD5ww==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20211117110031.19345-1-olivier.moysan@foss.st.com>
References: <20211117110031.19345-1-olivier.moysan@foss.st.com>
Subject: Re: [PATCH] ASoC: stm32: sai: increase channels_max limit
Message-Id: <163718828521.136850.8228648734064724171.b4-ty@kernel.org>
Date: Wed, 17 Nov 2021 22:31:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
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

On Wed, 17 Nov 2021 12:00:31 +0100, Olivier Moysan wrote:
> From: Olivier Moysan <olivier.moysan@st.com>
> 
> The SAI peripheral supports up to 16 channels in TDM mode (8L+8R).
> The driver currently supports TDM over two channels.
> Increase SAI DAI playback/record channels_max,
> to also allow up to 16 channels in TDM mode.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: sai: increase channels_max limit
      commit: 7fabe7fed182498cac568100d8e28d4b95f8a80e

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
