Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8818079B845
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:08:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9658F14F7;
	Tue, 12 Sep 2023 02:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9658F14F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477293;
	bh=+X6oAuJDVPwkq9UAfnOLPhvWhm6DRKSz6CTUYkjSb7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jFMK8HMOmSZ3Yo60cvwWyD/shk2jl4+VEq/3TFIsCOfNBF7L1Qn8VkUb2hFZOLWVq
	 ww7eCcHTsVN73ODc4b/B1sAlgHZdYSOsuLkhR1THuFlWIg+CBRbcguBmM1r8QYGfH1
	 HvLKmjRIYW2yvJaM3MVIOZW9H3ZJmpXyRShj+4vg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CDAFF806B1; Tue, 12 Sep 2023 01:58:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC437F806B9;
	Tue, 12 Sep 2023 01:58:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 478F7F8067E; Tue, 12 Sep 2023 01:58:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6890AF80637
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6890AF80637
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nqB4gevl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ECC04B81A21;
	Mon, 11 Sep 2023 23:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E51FC32781;
	Mon, 11 Sep 2023 23:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476675;
	bh=+X6oAuJDVPwkq9UAfnOLPhvWhm6DRKSz6CTUYkjSb7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nqB4gevlu+p8PlPRRgQ0trfjpHYSkxer+PoPhs5qIboLLWSb56AsB+CWPuienWb+E
	 VOpEN0rKh2XlV0dWbHgC3bui+FmQ/Ejamra/tmapzVoDGbDgan6GhZLgq+ARWEutH/
	 2EBmKN+LQC7eEaEXG9/R0ZQoUzKNRpeLp32iErSzvj49b4fFh+zsmPQiFNI9a1+/8n
	 S6iqBch+wPF9dVUlhlbIiihAyvqwaBToYvu77Rwuj3dWBrCxgrVW8OhIG8H1sQh+b+
	 tsd5v5wQY8xmQZi5J8Vig+gJ4MN1oT+1nn8LnmshJsHCp4TeuxAA4vl69T2GSkpHNK
	 BNcNnn32c5oPw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
References: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
Subject: Re: [PATCH v2 0/7] ASoC: Convert some Maxim codecs to use GPIO
 descriptors
Message-Id: <169447667397.2387538.10504456208825837880.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 5INBOQI2JQS57MEZQPGQIHYOW2EFSW75
X-Message-ID-Hash: 5INBOQI2JQS57MEZQPGQIHYOW2EFSW75
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5INBOQI2JQS57MEZQPGQIHYOW2EFSW75/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 11 Sep 2023 10:23:47 +0200, Linus Walleij wrote:
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

