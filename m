Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2FC97880A
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 20:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67F81DF6;
	Fri, 13 Sep 2024 20:40:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67F81DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726252867;
	bh=9t2HvxX45Epib8wlyNUVz1Q/1jzZFCo1U0fealirHZE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aXrYgCSYV1kPy6SNbkufLtSmDa4Lt7snl29cKxSbP3ijJ/kT1SAZXhv58/HlwhCvH
	 79xc7k7e+r2ojNCdoLPSEJqdpcgRlY3fNN2tRUWY5eKzjtlA/KV/KTWijfrEdM2zzz
	 BYLAUbvZcw847MsHUQ6GHrPs4GDo/l6/QtaXYG0Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B58C6F805B1; Fri, 13 Sep 2024 20:40:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 232E5F805A0;
	Fri, 13 Sep 2024 20:40:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AC1EF801F5; Fri, 13 Sep 2024 20:40:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA5AFF80074
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 20:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA5AFF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gOqrCoMx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87D535C26EF;
	Fri, 13 Sep 2024 18:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FFAC4CEC0;
	Fri, 13 Sep 2024 18:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726252828;
	bh=9t2HvxX45Epib8wlyNUVz1Q/1jzZFCo1U0fealirHZE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gOqrCoMxd/M9E/73QMCBpCopKSBCqOqAv0xp1ZeNP6nBN+n2PaTyFhSFMiD+V34ot
	 gD2UjapZ7HJnnuFC6fwF7NPlnLKKAeAwqEqHLZ1J5hW82XQMtNQJZpN9dYcVcdHatR
	 hDs483ohoq9nyjJsHsb8hFgV/s/0ExL1Z4/839cDKLY5ngeNONoPUJ3FCCNK2wpLcE
	 ptmah7kBwSyXo2To3dXFa5SK/REk9Rz8ZPXOgjIAKW4oY7DrlxN+eR9ULTRuK3t5mq
	 J222rjJiztXrvdgZBgDDwEIblM2eCMqk3Ek4+Bb2CdGTtxOZPEpAQAXwVfEu8zfFbv
	 qhJKnjNHPvG2g==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
 zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
 liam.r.girdwood@intel.com, jaden-yue@ti.com,
 yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
 henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, Baojun.Xu@fpt.com,
 judyhsiao@google.com, navada@ti.com, cujomalainey@google.com, aanya@ti.com,
 nayeem.mahmud@ti.com, savyasanchi.shukla@netradyne.com,
 flaviopr@microsoft.com, jesse-ji@ti.com, darren.ye@mediatek.com,
 antheas.dk@gmail.com, Jerry2.Huang@lcfuturecenter.com, v-hampiholi@ti.com,
 jim.shil@goertek.com, jeep.wang@goertek.com, will-wang@ti.com
In-Reply-To: <20240911232739.1509-1-shenghao-ding@ti.com>
References: <20240911232739.1509-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v3] ASoC: tas2781: Add Calibration Kcontrols for
 Chromebook
Message-Id: <172625282267.78184.4732964772935944831.b4-ty@kernel.org>
Date: Fri, 13 Sep 2024 19:40:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: ETAXIACHNUAIDHHLDNPTDNQBARYXY45Y
X-Message-ID-Hash: ETAXIACHNUAIDHHLDNPTDNQBARYXY45Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETAXIACHNUAIDHHLDNPTDNQBARYXY45Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 12 Sep 2024 07:27:37 +0800, Shenghao Ding wrote:
> Add calibration related kcontrol for speaker impedance calibration and
> speaker leakage check for Chromebook.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Add Calibration Kcontrols for Chromebook
      commit: 49e2e353fb0dbef8dced3e8e65365580349c4b14

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

