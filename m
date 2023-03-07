Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A978D6AE734
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 17:48:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D95314DB;
	Tue,  7 Mar 2023 17:48:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D95314DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678207733;
	bh=tWHY74LDT/b6EZ7F+GAwXmd+0jAzOowdpwZxT8Ys6rs=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NB3OzWYapDwEc36HlVgCRizM1F3Io/EX1QpoQ0+Bn0m4kX8lPJZNZ6Y+aiaq9HyP6
	 dPSadu/2iQp1DJqJvTg87vLIQpt4CZms+eN5DEo5OAnyJ2yrqrsuRmoHZ0m6P+vdog
	 vW/yYy4wrWbotxbgvEJA9aQLrVG0+2umASNYxnGI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7AE7F80236;
	Tue,  7 Mar 2023 17:48:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF313F8042F; Tue,  7 Mar 2023 17:47:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98242F800DF
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 17:47:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98242F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gQLsd9pR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D058DB81928;
	Tue,  7 Mar 2023 16:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C05FC433EF;
	Tue,  7 Mar 2023 16:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678207669;
	bh=tWHY74LDT/b6EZ7F+GAwXmd+0jAzOowdpwZxT8Ys6rs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gQLsd9pRvBygB3wZOKVsOzU0ryCnJReMc3aJM77s7lrv/2eGm76FBxGV7P21WB5HT
	 ycx9diHo9HTNS9efHIMUUIM8sfJqZNvBO7SnVs5aI5Wxf/QMHvBzWXDjksjcTVRccV
	 dNWsQjp7Iqq4C6zFxjxbC4AfH6qsJZ9a8ff9dytzmw1imMVup3iGyIMskELzUi+5NC
	 9u8ypTEePfQeGkfoIprxGPlYSSlTkApkb42Kluv4WZlQRt91PYApQcLRoue97iauuS
	 r/XjpyuJnna86oJQHtWG4+8yJjS8aaE+x8tPURCvb0LCz/wEDR6p+oh5TPX12SnDSJ
	 GIT4n4qpkoFSQ==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230303134854.2277146-1-amadeuszx.slawinski@linux.intel.com>
References: <20230303134854.2277146-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: Intel: avs: Machine board fixes
Message-Id: <167820766821.97141.1375249629325104056.b4-ty@kernel.org>
Date: Tue, 07 Mar 2023 16:47:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: BBQNWNDPXE5YKCSOOZX6TLOUYXGFHPN4
X-Message-ID-Hash: BBQNWNDPXE5YKCSOOZX6TLOUYXGFHPN4
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBQNWNDPXE5YKCSOOZX6TLOUYXGFHPN4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 03 Mar 2023 14:48:49 +0100, Amadeusz Sławiński wrote:
> Series of adjustments to machine board files. Use fixed format in boards
> that were not using one. Fix clock handling.
> 
> Amadeusz Sławiński (3):
>   ASoC: Intel: avs: max98357a: Explicitly define codec format
>   ASoC: Intel: avs: da7219: Explicitly define codec format
>   ASoC: Intel: avs: rt5682: Explicitly define codec format
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: Intel: avs: max98357a: Explicitly define codec format
      commit: d16c893425d07ada1fdd817ec06d322efcf69480
[2/5] ASoC: Intel: avs: da7219: Explicitly define codec format
      commit: 61f368624fe4d0c25c6e9c917574b8ace51d776e
[3/5] ASoC: Intel: avs: rt5682: Explicitly define codec format
      commit: d24dbc865c2bd5946bef62bb862a65df092dfc79
[4/5] ASoC: Intel: avs: ssm4567: Remove nau8825 bits
      commit: 933de2d127281731166cf2880fa1e23c5a0f7faa
[5/5] ASoC: Intel: avs: nau8825: Adjust clock control
      commit: 6206b2e787da2ed567922c37bb588a44f6fb6705

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

