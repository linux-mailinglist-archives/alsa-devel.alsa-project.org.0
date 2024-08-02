Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5594A9462FE
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 20:22:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D60946DB;
	Fri,  2 Aug 2024 20:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D60946DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722622932;
	bh=CawFQq0JzNWd9rAAFylss7w6aAw+SMvSoc1d7h2tRyI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KHtyflYb/MnKlt0hIvQoHsVgxCqnnjtncHK+TiDyKnxL+FwOtss7NzGPf98Bt6RJG
	 gorpDjste10e+MkC473pVa6hqfCW0ygYg8aJD7jwWIbDAe7b13DKCAaUykUAd1wFgR
	 aFxj0J8S+MiUDxE9l3wm4Z+qXCuaGzsk78FHstX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1843CF805E1; Fri,  2 Aug 2024 20:21:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 448DDF805C3;
	Fri,  2 Aug 2024 20:21:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3117F805BE; Fri,  2 Aug 2024 20:21:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D26B9F801C0
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 20:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D26B9F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cJirmEhS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3187E62B24;
	Fri,  2 Aug 2024 18:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16925C32782;
	Fri,  2 Aug 2024 18:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722622875;
	bh=CawFQq0JzNWd9rAAFylss7w6aAw+SMvSoc1d7h2tRyI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cJirmEhSuJ0jCCnvoF/y3V3uaJwxr/+Ki/NYvGI5gH+ftaBcaQAy28OCxrrL658OR
	 0gxG8uim/Qq6btGYQlhRd/d8Nc8yqpUdEC/nvn4fxN05FNrOz9FhiTIPFgE9hx6cUu
	 lC7URGwoR/DonRwZZh/loyb3mLZK1hLY9tXpI/hBaWVPFgG1DyLvQ8q8wBbuFbhjw7
	 yxcRAscleI07hyNAGC1Vq6BmClil0goz+tTBEMGJoHPQldsXZ574pIUFjtcllyexPT
	 lxtAacIEy45T111cuUqEYCYbCWmkjjAJyOV0q8/uqLFugeUYq3VoheL5D1jxYbNW8t
	 4y6M81Qb0ZuZQ==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
 zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
 linux-kernel@vger.kernel.org, j-chadha@ti.com, liam.r.girdwood@intel.com,
 jaden-yue@ti.com, yung-chuan.liao@linux.intel.com, dipa@ti.com,
 yuhsuan@google.com, henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com,
 soyer@irl.hu, Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
 cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
 savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com, jesse-ji@ti.com,
 darren.ye@mediatek.com, antheas.dk@gmail.com,
 Jerry2.Huang@lcfuturecenter.com
In-Reply-To: <20240802072055.1462-1-shenghao-ding@ti.com>
References: <20240802072055.1462-1-shenghao-ding@ti.com>
Subject: Re: [RESEND PATCH v2] ASoc: tas2781: Fix a compiling warning
 reported by robot kernel test due to adding tas2563_dvc_table
Message-Id: <172262286781.83468.4726261083691249080.b4-ty@kernel.org>
Date: Fri, 02 Aug 2024 19:21:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: ACV2DI35H2WLCE5245HTBTRCF4R2RTBT
X-Message-ID-Hash: ACV2DI35H2WLCE5245HTBTRCF4R2RTBT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ACV2DI35H2WLCE5245HTBTRCF4R2RTBT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 02 Aug 2024 15:20:52 +0800, Shenghao Ding wrote:
> Move tas2563_dvc_table into a separate Header file, as only tas2781
> codec driver use this table, and hda side codec driver won't use it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: tas2781: Fix a compiling warning reported by robot kernel test due to adding tas2563_dvc_table
      commit: 92b796845a4a8789c2d9434c6a77baa88a99121e

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

