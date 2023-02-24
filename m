Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7396A215C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 19:20:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 446041E1;
	Fri, 24 Feb 2023 19:19:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 446041E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677262826;
	bh=IP3WmVGiSdHPgtth19FmgMeNWLngRTpXqmuQC7OcnYE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CchMEk9v2ijpxc7iB9e2M12YFcBW1E/bzx9yPYboc78M+DQyal33qvP2zfRD9IPFj
	 45OInB85W5uoEtN6NSXwNO2IFmzavZLInh6GBe37EFTYA0yoilidK6z+SzF4uc1pb5
	 nRyw06TVYfNoLzSRb1t6C+0FYNh58tXT+3HMr0TA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A15E7F800BA;
	Fri, 24 Feb 2023 19:19:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E95F4F80125; Fri, 24 Feb 2023 19:19:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D842DF800DF
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 19:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D842DF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CuHTWtUw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7CCBA61924;
	Fri, 24 Feb 2023 18:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F570C433EF;
	Fri, 24 Feb 2023 18:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677262761;
	bh=IP3WmVGiSdHPgtth19FmgMeNWLngRTpXqmuQC7OcnYE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CuHTWtUwJmsByLaDSGrpYnkmjXg3kjw8kyKorqYDc1kBRZbuxpGH6xmRev2LcVS92
	 rBb6sEHPIteFv+xOZDnsQuzjCDL4iXV/0+muHPdDMZkSvpUPOEdLYvSl54fL9MrKvE
	 GByIOBuOtAxHY/DoHi5yb4/6u1RNzNZ8MkT1Pqzm4Jwp+qgH0Mr/Hv5FZAqCeeHGe0
	 UqVAquIOC26y3XJEVo8NfanW6rucia08Xdd6g31EUci5BNjWPc+lYq2+wtzlYZIfuE
	 hWgqBnGW7CYD1avOwFJovMCuA/OINR+GZnhU0jJxpBy2oFky9BP2tLgkfT3uapMiQY
	 aVXyNN07oE0ww==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20230224153302.45365-1-povik+lin@cutebit.org>
References: <20230224153302.45365-1-povik+lin@cutebit.org>
Subject: Re: [PATCH 1/3] ASoC: apple: mca: Fix final status read on SERDES
 reset
Message-Id: <167726276023.536872.10083688435650517455.b4-ty@kernel.org>
Date: Fri, 24 Feb 2023 18:19:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.0
Message-ID-Hash: AOBVBYVJNPSI3EW345RJTK32L2QDIMSE
X-Message-ID-Hash: AOBVBYVJNPSI3EW345RJTK32L2QDIMSE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: asahi@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AOBVBYVJNPSI3EW345RJTK32L2QDIMSE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 Feb 2023 16:33:00 +0100, Martin Povišer wrote:
> From within the early trigger we are doing a reset of the SERDES unit,
> but the final status read is on a bad address. Add the missing SERDES
> unit offset in calculation of the address.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: apple: mca: Fix final status read on SERDES reset
      commit: aaf5f0d76b6e1870e3674408de2b13a92a4d4059
[2/3] ASoC: apple: mca: Fix SERDES reset sequence
      commit: d8b3e396088d787771f19fd3b7949e080dc31d6f
[3/3] ASoC: apple: mca: Improve handling of unavailable DMA channels
      commit: fb1847cc460c127b12720119eae5f438ffc62e85

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

