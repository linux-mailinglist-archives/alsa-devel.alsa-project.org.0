Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA00233B67
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 00:33:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 622C21673;
	Fri, 31 Jul 2020 00:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 622C21673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596148383;
	bh=oCtQbMc0yIjwTyoUHceGAsyCS/EgZDfLbcmV5WPOPq0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jfYTf6EEktShYbs71sTSYZVPpCaAk2guu8hX7lO0S4MtKwCnm8ZaCV4ZvacXEwyyH
	 0D0JocV3GTbNiHFdVoxKt2FuJ0w5f3/aM28QUH3Z2GoY0x14fZZUioWxcz9h4ETF/z
	 E3f1P8PK8s7ZphtGJ3PBrOrQZS6MR1ioGjySlA4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51F38F802E7;
	Fri, 31 Jul 2020 00:28:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD592F800C9; Fri, 31 Jul 2020 00:28:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32CD0F800C9
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 00:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32CD0F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WzaL/zUJ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 23CBD20829;
 Thu, 30 Jul 2020 22:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596148100;
 bh=oCtQbMc0yIjwTyoUHceGAsyCS/EgZDfLbcmV5WPOPq0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=WzaL/zUJErKB3SDcOhK2ZY2fXDqKFTF5FjgwwZn6aP1IpBFKKvuCcgIiZVnarVC5k
 K3PjnyLsLJJtnuTmWVgq3kb2WjdUC5p26skGiZX5BmQpXsgswCRAwA7VrJam5ojv37
 EuoKoYOjT06TXuX+cxfnzVDVi10I4G5TwNlYRUh4=
Date: Thu, 30 Jul 2020 23:28:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20200729154456.1983396-1-jbrunet@baylibre.com>
References: <20200729154456.1983396-1-jbrunet@baylibre.com>
Subject: Re: [PATCH 0/4] ASoC: meson: tdm fixes
Message-Id: <159614804534.1473.9918282900203412134.b4-ty@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
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

On Wed, 29 Jul 2020 17:44:52 +0200, Jerome Brunet wrote:
> This patcheset is collection of fixes for the TDM input and output the
> axg audio architecture. Its fixes:
>  - slave mode format setting
>  - g12 and sm1 skew offset
>  - tdm clock inversion
>  - standard daifmt props names which don't require a specific prefix
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: meson: axg-tdm-interface: fix link fmt setup
      commit: 6878ba91ce84f7a07887a0615af70f969508839f
[2/4] ASoC: meson: axg-tdmin: fix g12a skew
      commit: 80a254394fcfe55450b0351da298ca7231889219
[3/4] ASoC: meson: axg-tdm-formatters: fix sclk inversion
      commit: 0d3f01dcdc234001f979a0af0b6b31cb9f25b6c1
[4/4] ASoC: meson: cards: remove DT_PREFIX for standard daifmt properties
      commit: e44815a295a50027a9953f3ef62827d14631b96b

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
