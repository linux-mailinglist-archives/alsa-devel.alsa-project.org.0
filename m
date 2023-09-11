Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBC979B5DD
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:04:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 836B2FCC;
	Tue, 12 Sep 2023 02:03:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 836B2FCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477059;
	bh=eOmDusuTp1utIJYuSczsLIAkbuZQLw7Sxoi8jQp9lAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RUMhtH6eh1ezxbsCjlkEC1mdhmr+aheHamIAJiFju40fUFkQ5WEXN/U9OpNDTCges
	 lkgf/JCJegy6oilqDJny2vZdEJElzy5U+UYla2LiWLW5uDdzSrxmN0cleLflglmOm5
	 y9JSermpDOt7mPkcMA7/Ixd1K6D41qX6XmaIPBXA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48281F805C3; Tue, 12 Sep 2023 01:57:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 362A8F805AB;
	Tue, 12 Sep 2023 01:57:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A25EAF8057B; Tue, 12 Sep 2023 01:57:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D8B7F80549
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D8B7F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cVzAtPbk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 69ADBCE1915;
	Mon, 11 Sep 2023 23:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E72C116D4;
	Mon, 11 Sep 2023 23:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476631;
	bh=eOmDusuTp1utIJYuSczsLIAkbuZQLw7Sxoi8jQp9lAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cVzAtPbk9FxAp/DM3cm0Jw4Z3tqtzaiTutJkJD5vd7PDjSz02Blz+Hxkaeoiez6j1
	 GTUbU27tSlkpodhs7NZ/pvQM69djJLYrtnUVpJcfcqBkSKJfgTfnS+9IgEhbP8yJzB
	 DHvCCKk7UZMHATdPec+GzX/Z6t0GGv7YM+Xf+o5bUQ3vFCQKTcAtSKvyhEeAwP3dFA
	 PCCUbRxA6RqQv4yjJgH3WabWCcmbhaLpKKMj2t9siX3nIS1xQpkgey/d1yal58MYz0
	 1Ob0MRSRxexi6dGYcCdNnvDY1MIaYu0qlzM/mXQzn+/RRPSgoQ9xyN75nFaQv2tl3G
	 GnpGD2lVRKNaQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
References: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
Subject: Re: [PATCH 0/7] ASoC: Convert some Maxim codecs to use GPIO
 descriptors
Message-Id: <169447662997.2387538.6093833545457230678.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: SMOEIH2OVZORGIYQ3AZVJSNXISUJBMMY
X-Message-ID-Hash: SMOEIH2OVZORGIYQ3AZVJSNXISUJBMMY
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
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

On Fri, 25 Aug 2023 10:12:10 +0200, Linus Walleij wrote:
> The Maxim devices are pretty straight-forward to convert
> over to use GPIO descriptors, so let's do it.
> 
> Tested with some x86_64 allmodconfig and aarch64 allmodconfig
> to smoke out the worst bugs this time.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: max9768: Convert to use GPIO descriptors
      commit: 0015a18acf9ceafbf7e24f5addefce566326132b
[2/7] ASoC: max98357a: Drop pointless include
      commit: a3b68ba9f594ae4f9a96e0730e9aeadb9f64c43e
[3/7] ASoC: max98373: Convert to use GPIO descriptors
      commit: c5cb83a104a2d95ba4ba182051eff2a8c82d5beb
[4/7] ASoC: max98388: Correct the includes
      commit: 4b0dfc0e8cdebd6aa6ce25593c0dcc71d9d21961
[5/7] ASoC: max98396: Drop pointless include
      commit: 70f29a3078f7bc1f1011b7b5fee41fcd52ff189f
[6/7] ASoC: max98520: Drop pointless includes
      commit: d9241aaea1418fa4bd6653bee093f63cf47a2c6e
[7/7] ASoC: max98927: Drop pointless includes
      commit: 0307ba5420cd785615efc94be6b101b4ac2538cf

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

