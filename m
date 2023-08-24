Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92400787B9B
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 00:44:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E280384B;
	Fri, 25 Aug 2023 00:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E280384B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692917074;
	bh=hQ1fgLiWLR8trUuCaYLEOSHIOYHu6hkDSCVcbXCSY+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oS/q5eYKskJkZrydQLayehbXC68t4PLMp0NDNKC0h8ztxv6gla3CZlBXG27Flz65k
	 a9H0fCn79kXkl86kjKnn9UVSeBgrPR89jE3sZUN59zkO8dgCCPC//98xI7ht2pIgw4
	 TpI37iZR7jMc5WOw6hWsxlNZRG5A0kI8y2TM90C0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98ABDF80536; Fri, 25 Aug 2023 00:43:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1F98F800D1;
	Fri, 25 Aug 2023 00:43:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1140F800D1; Fri, 25 Aug 2023 00:43:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF347F800AE
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 00:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF347F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rrZfqM18
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0A0576316F;
	Thu, 24 Aug 2023 22:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4231C433C8;
	Thu, 24 Aug 2023 22:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692917015;
	bh=hQ1fgLiWLR8trUuCaYLEOSHIOYHu6hkDSCVcbXCSY+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rrZfqM18bVtzaiGaUuKP9b7xmnkXs8g8c3wSLjDJ9HzgvNmH1i2m8emrAWI22C21D
	 FHYQa5K/Xvxz9/lDO7HHXUlWLdV4vvrN94IQYKumiqfmDGWUwd2FRaogmS2/L1lAyi
	 /tjXD+/k1vOAQnMppF2o5IP53a9TV3sg6ePYqRXorT/qChWJ7NDY6HbXzwUDBLrvST
	 E9uKOIjPBXdr59q5RMQ4zTSCflL+vR7vf98eVvLDQWmMa9ieWWehqU5DUZKQc7WHUH
	 iOQYoLdmjWSg9RSQtPTAiQZ4EETCktewKG8lTbcdwEkJRUNOdtKrYgvLHhLL2M2sbt
	 qPvBqcszAOpEA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Weidong Wang <wangweidong.a@awinic.com>,
 Arnd Bergmann <arnd@arndb.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com, kernel test robot <lkp@intel.com>
In-Reply-To: <20230824191722.2701215-1-harshit.m.mogalapalli@oracle.com>
References: <20230824191722.2701215-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH next] ASoC: codecs: Fix error code in
 aw88261_i2c_probe()
Message-Id: <169291701152.2997200.14506800052724539808.b4-ty@kernel.org>
Date: Thu, 24 Aug 2023 23:43:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: T7WTJQNODNP3QW3NVBGWEER2PPXF7GI3
X-Message-ID-Hash: T7WTJQNODNP3QW3NVBGWEER2PPXF7GI3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T7WTJQNODNP3QW3NVBGWEER2PPXF7GI3/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 24 Aug 2023 12:17:10 -0700, Harshit Mogalapalli wrote:
> Passing zero to dev_err_probe is a success which is incorrect when
> i2c_check_functionality() fails.
> 
> Fix this by passing -ENXIO instead of zero to dev_err_probe().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Fix error code in aw88261_i2c_probe()
      commit: 8886e1b03669c498f7a24bc5e483f46db5e81f82

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

