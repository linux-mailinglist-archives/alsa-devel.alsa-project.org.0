Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E337883E412
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 22:39:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 798CE823;
	Fri, 26 Jan 2024 22:39:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 798CE823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706305158;
	bh=Wz1o7Q6iD89nk8IWCSK5qkbgtWiTCWqUvD9d8tOORmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A2rgWmSsNbVwumaV9NORnk2IM0ijNInteve9onZi4AXonx6GYuMgbF1qCtlKj++6b
	 Kcs3I8f9aRbG/DG5o5ZDzl8AEjcJBtpaqmiLNrt2kjR2JzHoB+2gjO8KhgasEgM7Ip
	 dcLAaIiaz1WbVwVmM+aSFEiBGTWQW7Zo/eESVQ7k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDCC7F805BF; Fri, 26 Jan 2024 22:38:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D35F805C3;
	Fri, 26 Jan 2024 22:38:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39731F8028D; Fri, 26 Jan 2024 22:38:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AF19F8022B
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 22:38:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AF19F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PSouTCKR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FF606233A;
	Fri, 26 Jan 2024 21:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7835C43394;
	Fri, 26 Jan 2024 21:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706305091;
	bh=Wz1o7Q6iD89nk8IWCSK5qkbgtWiTCWqUvD9d8tOORmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PSouTCKRzpMb+0QjyfZkgg0YMPC0NUqyMf1CdlBG94IrogewicQlhyMBKUpMo9E9Z
	 7iu56vP4G6H8f41QMSBrFHGy/JGuGo9EcJ2nZolotAtJkGV7mEjp+HFWL7FxvqkZjK
	 p8EES4aoIR/VN4e7TPn5xLRA03r8R9so9Yazqg1/NpEGq3/X35tb3087gHQnx8vtgw
	 DjlCOdhlHsal5ppMBpHxM0pw7Mx0VWEkK/kQNKWD213o1Wt1JPAM3UStfAIrGqwVII
	 K97U0mnQfVF9P1ovcvWDBMGw/LezHwJTXP2gtFLX6/kuNxXxQXWKcPtlOVmQNrVfmE
	 G7vgo3FG1p+NQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: andy.shevchenko@gmail.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org
In-Reply-To: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/7] ASoC: cs42l43: Tidy up header includes
Message-Id: <170630509047.52716.9195906453206651565.b4-ty@kernel.org>
Date: Fri, 26 Jan 2024 21:38:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: UA6EHMBSG2JUY5ETK725YTG3E5V25K4K
X-Message-ID-Hash: UA6EHMBSG2JUY5ETK725YTG3E5V25K4K
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UA6EHMBSG2JUY5ETK725YTG3E5V25K4K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 25 Jan 2024 10:31:11 +0000, Charles Keepax wrote:
> Use more forward declarations, move header guards to cover other
> includes, and rely less on including headers through other headers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: cs42l43: Tidy up header includes
      commit: fb430b06397e5eebefd42584fe4dfabf2a3632e0
[2/7] ASoC: cs42l43: Minor code tidy ups
      commit: 40f6281c1e7d733399bd42fe97a0aae00b967a91
[3/7] ASoC: cs42l43: Check error from device_property_read_u32_array()
      commit: a2e7cf55db781654fdb2d3b2529e28c4d93e24fc
[4/7] ASoC: cs42l43: Add pm_ptr around the power ops
      commit: 7a93a9abe44386b4caa0e67977f41b8c9f06b51c
[5/7] ASoC: cs42l43: Use USEC_PER_MSEC rather than hard coding
      commit: 96c716887c1a918d4cb4610f5cf111280fda48f0
[6/7] ASoC: cs42l43: Refactor to use for_each_set_bit()
      commit: fe04d1632cb4130fb47d18fe70ac292562a3b9c3
[7/7] ASoC: cs42l43: Use fls to calculate the pre-divider for the PLL
      commit: 31c6e53a4da5fe626b99e1ebf777d751994e3281

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

