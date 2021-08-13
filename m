Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8C53EBB76
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 19:28:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A653185B;
	Fri, 13 Aug 2021 19:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A653185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628875682;
	bh=VThyJvP43YmAmnkp3rqr1CPohIuzoclnjntpTJXxW7I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aOBBnTqwsKwHyp95Nvr/EmPUvl3FQ4UM9BJeV4Zpme11uSzv63Rkqb0cMc4NepD+6
	 SSRu/SSOGOfqGLSz744x3XrOgXGbACfVl2cPKsi+2bdcPekVInA0P7Zih6jwc8Ly5p
	 b195459rjbvdYlSbXA8pGy5e6zTP5oRBP5bEannU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A172EF8032D;
	Fri, 13 Aug 2021 19:26:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2B55F802D2; Fri, 13 Aug 2021 19:26:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40064F800E5
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 19:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40064F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aPUZgdas"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 604FF60F57;
 Fri, 13 Aug 2021 17:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628875585;
 bh=VThyJvP43YmAmnkp3rqr1CPohIuzoclnjntpTJXxW7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aPUZgdaswye7wTBsjEWm4y/fB50R9EeVpV2SFWjaLX1ikmwuogbyrNeaMeziZoEbA
 eh+2+lgPmteJ5DrpEMViPUyqFaJQMW/Su5GEtDqH+yHLon0/XnZQDddnovHOaWo6TS
 u0lGmkoxE7Z3yanYENgcnrqv+zaAhWG1i8j60khqBZyrMsc1tj1H1gBuAZgO7wXV5f
 3Dx+NOSIb0Q//zPDt0lv2M8WpyH7y8MSRaeqVSCTHc5IcS+ffoISur6fx0KM0YUuRk
 PqWfO6YZEwmcyE0iefMiU7er9Ld3BVIy88Lu0rIWpL9tANjmykJyAc/gYiuIlMzwUu
 ImOLbKFM7vowQ==
From: Mark Brown <broonie@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ASoC: rt5682: Remove unused variable in
 rt5682_i2c_remove()
Date: Fri, 13 Aug 2021 18:26:00 +0100
Message-Id: <162887455325.19744.837395939498410454.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813073402.1.Iaa9425cfab80f5233afa78b32d02b6dc23256eb3@changeid>
References: <20210813073402.1.Iaa9425cfab80f5233afa78b32d02b6dc23256eb3@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 Stephen Boyd <swboyd@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
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

On Fri, 13 Aug 2021 07:34:05 -0700, Douglas Anderson wrote:
> In commit 772d44526e20 ("ASoC: rt5682: Properly turn off regulators if
> wrong device ID") I deleted code but forgot to delete a variable
> that's now unused. Delete it.
> 
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: Remove unused variable in rt5682_i2c_remove()
      commit: a1ea05723c27a6f77894a60038a7b2b12fcec9a7

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
