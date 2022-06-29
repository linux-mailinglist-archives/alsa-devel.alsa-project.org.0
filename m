Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E809A5600A2
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 15:07:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FF271640;
	Wed, 29 Jun 2022 15:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FF271640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656508031;
	bh=N32uSPu3EtNEptJhBogV/ogjkAX7TnX7yvm7ck5YAWQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n5uZErjoz9xJevCUHrD6RScA/+ChlBDikt0pj5y0G1hqEDQkTUCiOGS9g7Ci3aoSI
	 KyLQPRKg8AW70H/rV4bdrALdbV9q4Q1hNXhRRXOEQVCUqxI6V1SQfxrfxUUs1HeGE0
	 xrlMpMzefoe9C1Ohv1eUTrbTLzHL05eCd8Ogt1EQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87A87F80158;
	Wed, 29 Jun 2022 15:06:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 265B6F80245; Wed, 29 Jun 2022 15:06:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E667F80115
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 15:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E667F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gzHWbRkY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C1DE61CB6;
 Wed, 29 Jun 2022 13:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9DEC341CB;
 Wed, 29 Jun 2022 13:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656507962;
 bh=N32uSPu3EtNEptJhBogV/ogjkAX7TnX7yvm7ck5YAWQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gzHWbRkYwbx24y9LJruP9AkpJ1CUe6iBcRGu3s7pPuQzUxrTQsd2wpumX9sB+DVYR
 vh07XufcvGu0qGX1scyh3Lf2B0+PNwjdk2UeYEDy2oraxeWLjF+YTM5yVHx1q7GwuA
 4PSmfO/okQFYKTA/THthxGG2yOuIKX812dETW1bHurrK48T373vKmy+tN0IPd/gfaj
 BVCFdceIpD8Yg79tX4qm41i2DBomJ2NXGDQj8cPh3jnPrJA+WO1yxmaXtN/ui/eW1z
 e6d2McGrRAKfA9ILnpENOb/kNkWD9tNCwIcXhE5mSvbseP9JNN3V0ZUwwqrXFJQS+v
 983G4sCF/2Hrg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, marex@denx.de
In-Reply-To: <20220628165840.152235-1-marex@denx.de>
References: <20220628165840.152235-1-marex@denx.de>
Subject: Re: [PATCH] ASoC: doc: Capitalize RESET line name
Message-Id: <165650796136.1089020.10280239824537087786.b4-ty@kernel.org>
Date: Wed, 29 Jun 2022 14:06:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, linux-doc@vger.kernel.org
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

On Tue, 28 Jun 2022 18:58:40 +0200, Marek Vasut wrote:
> Make sure all AC97 interface lines are spelled in capitals,
> to avoid confusing readers about where the 5th line is.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: doc: Capitalize RESET line name
      commit: db7bc2741a2aca91b9a4df1bb03e4997a0e90807

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
