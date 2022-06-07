Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A521D53FBD8
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:47:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7A1F19FD;
	Tue,  7 Jun 2022 12:46:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7A1F19FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654598825;
	bh=H7439HAhKBiBU5PJ0wEYhH+/aj2uOXs88io1cN6Ww+I=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lbTPIbjr7RfUfFKcxQ+zDaIzz2z5AVdG7TTmHwb5iIa31+dMw6V2KRG71XWNzn3f2
	 WSmyuMbaP8tv3+Kb7SwAK8rysJ+KwGj3IYQeO5EPbgRDtE6EnlovZ2Y6l0pYAy4iEA
	 1sRbZ/9eHSOhwsobHDcmayldHazlOyQACsqseMag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C34F8F80527;
	Tue,  7 Jun 2022 12:45:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55EFAF80527; Tue,  7 Jun 2022 12:45:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83674F804E6
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:45:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83674F804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IZJSFxF3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3246E61531;
 Tue,  7 Jun 2022 10:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1780BC3411E;
 Tue,  7 Jun 2022 10:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598722;
 bh=H7439HAhKBiBU5PJ0wEYhH+/aj2uOXs88io1cN6Ww+I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IZJSFxF3NIi3cewoR1VlvJQkQVHSUj3nrlHYEWLewWIaLDLl3OCLisXwJk8+U6N7k
 xAbXEtMyKf/faeh1lawU5kwfT3E6Wy0rTQ5QERHAt6NVjJ1DdVKsNtwmmB4eXkZumX
 s0qkSMeKyQbAiOT5ozjwAxPlyPDV7Zg+to24SS0nvp7oex+F10NyB+ax9Vn5ShVvzK
 Z8te27GrRgIwob/Vi5X2zadr+Q2ACUKhB7gIN56o+pBApMCXIO8IYkSbX8jz5zYd0m
 MMukOD4clitxdcEa2BeAq79ezlu9vZ9bFljGbxJpy3pQ63EFOdkNheKmQL3yMnzbUJ
 c5nRjaoG4seVw==
From: Mark Brown <broonie@kernel.org>
To: olivier.moysan@foss.st.com, Julia.Lawall@inria.fr
In-Reply-To: <20220521111145.81697-76-Julia.Lawall@inria.fr>
References: <20220521111145.81697-76-Julia.Lawall@inria.fr>
Subject: Re: [PATCH] ASoC: stm32: dfsdm: fix typo in comment
Message-Id: <165459871980.301808.7235614685174421255.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 alexandre.torgue@foss.st.com, Liam Girdwood <lgirdwood@gmail.com>,
 mcoquelin.stm32@gmail.com, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On Sat, 21 May 2022 13:11:26 +0200, Julia Lawall wrote:
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: dfsdm: fix typo in comment
      commit: 2685d5046962f018b1a155b3eef316562414638b

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
