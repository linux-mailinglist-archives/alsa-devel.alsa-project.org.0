Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B367330263A
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 15:21:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B4191841;
	Mon, 25 Jan 2021 15:20:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B4191841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611584474;
	bh=u/+n6nnkvGvxt7zRdHaBLolJlN1oNzH+JqV1Ev9ooqk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LMBDdcoadI1quBUYdN1/exBPuVDM+dyUqg0yLzu6d/Gx+1jzBRhH5qi3xFYzE3HmJ
	 mqlDLxia3pGOuqXlXkvK1hX1o1euBkZyrY1kOp2gBbMG47SXP/Bs+stD71a6m1hfFO
	 AK+Lsm/9kw9TGN35UnNeLhOHMbthwhA+c37ufWL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 926ECF804DF;
	Mon, 25 Jan 2021 15:18:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1691F804D8; Mon, 25 Jan 2021 15:18:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0F5CF804CB
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 15:18:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0F5CF804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AR9v1e0+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 338772145D;
 Mon, 25 Jan 2021 14:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611584304;
 bh=u/+n6nnkvGvxt7zRdHaBLolJlN1oNzH+JqV1Ev9ooqk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AR9v1e0+/x8PY265K5Zk2IYqptFl+CHwFaw7Ycrl03Q8kI2o0C8tFdng21D5FjRPh
 MLWk0LMZ8Rg/CsiuJ3VxyqY4va6nMGJReezkw7MSYNLAi2NFBG+JBfzNW3H+zamJjK
 NWT7A05vvCARiXMe+GAOWp1ReJjuHrK47ekxLaHKrBib0duGrTlFy7u7urn9EaxGGP
 uN6c27M2lTjBWpy5O0s+46QMC0Jed1kPQs93PuWwFnpxdlyHQk9RpLsQrLpVWnYRTQ
 Hu/avjl5P4ePl2o+2txWZYw3uQOI63SZFbHDhkuqCehklzI0ZWNpP8DsR4h13SwLuG
 wDJcjzpvIdg1w==
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20210125061453.1056535-1-tzungbi@google.com>
References: <20210125061453.1056535-1-tzungbi@google.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8192-mt6359: add format constraints
 for RT5682
Message-Id: <161158424213.32959.10480375557812092532.b4-ty@kernel.org>
Date: Mon, 25 Jan 2021 14:17:22 +0000
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

On Mon, 25 Jan 2021 14:14:53 +0800, Tzung-Bi Shih wrote:
> MT8192 determines the I2S clock rates according to the sampling rates.
> 
> There is only 1 set of I2S in between MT8192 and RT5682.  If playing and
> capturing via RT5682 in different sampling rates, the I2S data will be
> corrupted.
> 
> Adds format constraints to the corresponding DAI links to make sure the
> sampling rates are symmetric.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192-mt6359: add format constraints for RT5682
      commit: 339f6c73d5abe85550a0c962edc8a5df1f2b4273

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
