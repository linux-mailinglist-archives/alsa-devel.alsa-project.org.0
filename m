Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0DC6E695C
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 18:23:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59669E89;
	Tue, 18 Apr 2023 18:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59669E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681834998;
	bh=KYDGQ9LC4dPkxsMX1LMYuetVwQ+YdQq+9bWbGBBitMU=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r8RE+wVcwzmJKXQhkNJa3p9oluo58Lx1/X2PdtHVCrCVdXNyNQ3bsve9v2Hdrze2M
	 fIhzAKUiNteCB/djK5ynEJ6BLezex7HHVfRr+7u8spuV3XX0ON0C3PK0TrtvqNWA1l
	 pquF7foOsOqA6ZSu68LApzXSautjYad4YHNfOe8g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAAE4F80149;
	Tue, 18 Apr 2023 18:21:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28DBBF804FC; Tue, 18 Apr 2023 18:21:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C4D3F80149
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 18:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C4D3F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FAjdS1X1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C2306364E;
	Tue, 18 Apr 2023 16:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF6EC4339B;
	Tue, 18 Apr 2023 16:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681834884;
	bh=KYDGQ9LC4dPkxsMX1LMYuetVwQ+YdQq+9bWbGBBitMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FAjdS1X12XnDLtdc2vxXiUiZEUSoRx5JQwgiqbIyXf5jNtZK+REYZ4mBKDmCmoQv7
	 0KQmMicHUPbbSHyIqfCjadsugLbUtHK5hG6ze75e48XCs0hBYzs2vlQGEz/NeEI71e
	 mZT5BYh4uh7RuG4gYtpS5A0risLPIElTJiDQsOi86KTj2r78ALN7wymPglJaVKblWW
	 Axe0NQA1J4qRT6ZluipdMEvB9XEtGJrz16VypAWyMbgieK6a3kn+G0kgMMsh8ZWgl/
	 yVAFnvVZfNg7/idwIYz55Oh9jLxw9/CRXRO+7yKAv+IAmnSPzBtEFjL4DTLRlbJAEx
	 De1HdNSCQZeOA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, nathan@kernel.org,
 ndesaulniers@google.com, CTLIN0@nuvoton.com, luca.ceresoli@bootlin.com,
 peda@axentia.se, javierm@redhat.com, u.kleine-koenig@pengutronix.de,
 ckeepax@opensource.cirrus.com, Tom Rix <trix@redhat.com>
In-Reply-To: <20230418120955.3230705-1-trix@redhat.com>
References: <20230418120955.3230705-1-trix@redhat.com>
Subject: Re: [PATCH] ASoC: nau8825: fix bounds check for adc_delay
Message-Id: <168183488148.87933.1461165483240440828.b4-ty@kernel.org>
Date: Tue, 18 Apr 2023 17:21:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: PUYF3M7CFCVDGP23YRTPVE22ZRZFPCXP
X-Message-ID-Hash: PUYF3M7CFCVDGP23YRTPVE22ZRZFPCXP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Apr 2023 08:09:55 -0400, Tom Rix wrote:
> clang build reports
> sound/soc/codecs/nau8825.c:2826:31: error: overlapping comparisons
>   always evaluate to false [-Werror,-Wtautological-overlap-compare]
>         if (nau8825->adc_delay < 125 && nau8825->adc_delay > 500)
>             ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This is a bug, a logical-or should have been used.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8825: fix bounds check for adc_delay
      commit: 5f3d94eb7ae877430d9fe6a9aae7dcef6c3e5fea

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

