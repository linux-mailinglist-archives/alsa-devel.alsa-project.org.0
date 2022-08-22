Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7378059C3E6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 18:18:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4B4EE0E;
	Mon, 22 Aug 2022 18:17:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4B4EE0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661185102;
	bh=u35J4IpHSFEfh+GYLrukSlUjmHxOKq2CFdVZojhZiak=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JhgsA4Aze7Eu1n7ITHMee5mEeiPV+0LsXGJeln6wgQbDz99KOHnqFvSTyBMBr4un3
	 JOD4iXeu4VxWipJCLeDkU5y8TARiVcsGx0eucfEOyxoKuYrgp7Zw0TqkA1zd/ukWqc
	 XCTiY7IZWeo35K270U3By1grNnfdU3zQZ3S2dazM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B1D3F80517;
	Mon, 22 Aug 2022 18:16:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37972F804D1; Mon, 22 Aug 2022 18:16:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 516D2F800ED
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 18:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 516D2F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OGr4nayo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9F689B815F3;
 Mon, 22 Aug 2022 16:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACB0C433D6;
 Mon, 22 Aug 2022 16:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661185005;
 bh=u35J4IpHSFEfh+GYLrukSlUjmHxOKq2CFdVZojhZiak=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OGr4nayobT6fT8ydoU5LaYZCf1MEoWJVF9F9YmHC7hO56OMJpwx+AyNNt4o7KVqiF
 x57Bv/LtnMW8C7gcV3uqwyiZQweD07AZ7wmFX16zjILwaF2SxjU+JyZujFcAx18ztk
 d+bHBKHVw7FRlxhtTPIfdOvzlMORUUa+e5UbGkFksjve2vIQZB+N3wQdRErwYaQBcd
 EFcSDq9eB+QBQ4GxA4GTN+egSUCfTF8GlnpskD5pE3ehyWMhgsfpWFwAaE/j6o1ERd
 GwmqQo1kWXPESQ58hduyI2bEnAWtNrR2MX7s2O7eVsUvwu0Xhwj5TikzIAA9Vfenun
 uHln2YHXB2/Ww==
From: Mark Brown <broonie@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, linux-samsung-soc@vger.kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20220821160914.2207116-1-jic23@kernel.org>
References: <20220821160914.2207116-1-jic23@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Use iio_get_channel_type() accessor.
Message-Id: <166118500362.214851.13933856221972874063.b4-ty@kernel.org>
Date: Mon, 22 Aug 2022 17:16:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
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

On Sun, 21 Aug 2022 17:09:14 +0100, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> struct iio_chan_spec is meant to be opaque to IIO consumer drivers
> which should only use the interfaces in linux/iio/consumer.h.
> Use the provided accessor function to find get the type of the
> channel instead of directly reading it form the structure.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: Use iio_get_channel_type() accessor.
      commit: 94f072748337424c9cf92cd018532a34db3a5516

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
