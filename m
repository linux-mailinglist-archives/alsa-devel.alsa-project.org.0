Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F817B2029
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 16:52:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77562DE5;
	Thu, 28 Sep 2023 16:51:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77562DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695912746;
	bh=vtAG6cN4FFihjCJoKNItIO/oCqZM7u5zMuURdQJMWd4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VYMxdcNFqIObB91ohhGd28lEI0pJxpnXV1J/hua/iuZz01ro6G48kiRDM+E3MXHdQ
	 3rFOibgrMiae1qba9Yb091lbO8FC4t3fT5VYQuwNFuwyv+rndLfaFLfWk+5jox+VgO
	 iddf0BnTeEor5k+ZD9Ji6a143Z26DdRHJwmEpxmg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A68B2F80290; Thu, 28 Sep 2023 16:51:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0033F80130;
	Thu, 28 Sep 2023 16:51:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62789F80290; Thu, 28 Sep 2023 16:51:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81552F800AE
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 16:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81552F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mrJ3s6DZ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 56520B81CC4;
	Thu, 28 Sep 2023 14:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561DEC433C8;
	Thu, 28 Sep 2023 14:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695912678;
	bh=vtAG6cN4FFihjCJoKNItIO/oCqZM7u5zMuURdQJMWd4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=mrJ3s6DZjF8wixjaOzrLe9Udx9g8i1HtTEMgowCifYnZOr1hb79Bz/WtbZH8A7nSg
	 Ch35Aw6rP6UOhmn6Os7pCePBfwIdgUhl4Hm2vuMpT6GokC4VIZ7nnlEbVTs9wkXBwD
	 afpx/jy8qCRD6Q5ftt8RCg1AIdOnPDJ6+ilHhiULkIxBiMYx2H1FUoKfKkuAx/dlMM
	 hTtw5hcJmI8UM2Seaabk5NM/Kw4MaMHEiKuOFmQ76jBOIN3Ghlh20mgYZc+J0H2abh
	 ZwXJNA3I+QAkEDuk9ar7XJb7uzBn8X5ZdpAhijqgvpnqBDNkHerrO+7pq9I461eI6b
	 x237b0Ph/d13g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, rf@opensource.cirrus.com, herve.codina@bootlin.com,
 shumingf@realtek.com, ryans.lee@analog.com, 13916275206@139.com,
 linus.walleij@linaro.org, ckeepax@opensource.cirrus.com,
 povik+lin@cutebit.org, harshit.m.mogalapalli@oracle.com, arnd@arndb.de,
 yijiangtao@awinic.com, yang.lee@linux.alibaba.com, liweilei@awinic.com,
 u.kleine-koenig@pengutronix.de, colin.i.king@gmail.com, trix@redhat.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wangweidong.a@awinic.com
In-Reply-To: <20230919105724.105624-1-wangweidong.a@awinic.com>
References: <20230919105724.105624-1-wangweidong.a@awinic.com>
Subject: Re: [PATCH V4 0/7] ASoC: codecs: Add aw87390 amplifier driver
Message-Id: <169591267537.2776105.6073100654657258877.b4-ty@kernel.org>
Date: Thu, 28 Sep 2023 16:51:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: BUY7M2UJKTISE3LYOGK2CL7OOUFZPSFR
X-Message-ID-Hash: BUY7M2UJKTISE3LYOGK2CL7OOUFZPSFR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BUY7M2UJKTISE3LYOGK2CL7OOUFZPSFR/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 18:57:17 +0800, wangweidong.a@awinic.com wrote:
> The awinic aw87390 is a new high efficiency, low noise,
> constant large volume, 6th Smart K audio amplifier.
> 
> Add a DT schema for describing awinic aw87390 audio amplifiers.
> They are controlled using I2C.
> 
> v3 -> v4: Divide the changes of aw88395 into multiple patches
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: dt-bindings: awinic,aw88395: Add properties for multiple PA support
      commit: b99d8d8adfda1f9220dd2ee9bdb96ba02dc62bd7
[2/7] ASoC: dt-bindings: Add schema for "awinic,aw87390"
      commit: 457b6587c112e162d3bec871c7b93359168d5c0a
[3/7] ASoC: codecs: Modify the transmission method of parameters and property node
      (no commit info)
[4/7] ASoC: codecs: Add code for bin parsing compatible with aw87390
      commit: b116c832c9e84843c64eed087271e29b3bc6c1b8
[5/7] ASoC: codecs: Modify i2c name and parameter transmission methodls
      (no commit info)
[6/7] ASoC: codecs: Change the aw88261 variable name and i2c driver name
      (no commit info)
[7/7] ASoC: codecs: Add aw87390 amplifier driver
      commit: 37b4346ed8681660ae60de4facc3d499d8e5cf2a

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

