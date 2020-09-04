Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D789725D5A0
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 12:06:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9826A1AFB;
	Fri,  4 Sep 2020 12:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9826A1AFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599213961;
	bh=+M+weXZdADm0+Y06gszlZNtZQw0daMkBFofaFo4MaBY=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fTtKxNEVENOXLwFEfsa4bUHgaajiU2AG8s+Fxj4BDLM9N99vloz9GMKexdo8ykzw+
	 waDOLri1i9Y3Ui+HfqMDRT20LLC1ueAISYpeB05u6wrzNxGnStTSVb6fTZbgpEKEVq
	 X9lli0p4vQNGVdaw/xDhOV4sIEA4qiLjHYPdSqqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B82BFF8024A;
	Fri,  4 Sep 2020 12:04:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DDA2F8024A; Fri,  4 Sep 2020 12:04:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39F6AF80113
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 12:04:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39F6AF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PMj3BkdQ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 467BB206D4;
 Fri,  4 Sep 2020 10:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599213852;
 bh=+M+weXZdADm0+Y06gszlZNtZQw0daMkBFofaFo4MaBY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=PMj3BkdQ+PMRRu2YPLBzbN3l/GYDAAeOTCHSUFQpY8QHUmnegq0pES6fXZzmtelAr
 NtMX+f6mBortUXSzlFMyyF3kYYdNzGXqd3ZZup1Qw6MenzN4WTAX5mPuSTqNMcRdut
 AmWfpNT9UOUorQJdWXYWbxKfJX8l5qZ7QgE+6hUc=
Date: Fri, 04 Sep 2020 11:03:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20200903203250.19830-1-krzk@kernel.org>
References: <20200903203250.19830-1-krzk@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: odroid: Add missing properties
Message-Id: <159921381111.42159.13882665224294101699.b4-ty@kernel.org>
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

On Thu, 3 Sep 2020 22:32:47 +0200, Krzysztof Kozlowski wrote:
> Usage of "unevaluatedProperties: false" is not correct as it suppresses
> warnings about all undocumented properties.  Instead, add all missing
> properties.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: odroid: Add missing properties
      commit: 6997e462b39b5041e6e4b9d547ebbcacb69052ae
[2/2] ASoC: samsung-i2s: Add missing properties
      commit: 0c5f8ca49cff1e2e18300cca4fb0c17ba794dcb0

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
