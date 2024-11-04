Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD469BBE34
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2024 20:43:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E88BB60;
	Mon,  4 Nov 2024 20:43:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E88BB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730749405;
	bh=/s92982cc/MdC2q4FYzyn4p9mBlEM898SljOJNES+l4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KMVLjWXqPImfkwQNdExMX/uDLHE5HvtatuQQjEp2GFFImXhYG3IrFRLgmgQxJjTPU
	 ftEHH8VPYC5so2kAShR6bgYLEOnfSTbFU8lIva/uwKc/WaVkIqAyGR9igRen5kJ5DH
	 lQfx9ndorsAy62gcXIREFC56FxgIkMfiTkBFCBhI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38484F805B0; Mon,  4 Nov 2024 20:42:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94071F8026A;
	Mon,  4 Nov 2024 20:42:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91C91F8026A; Mon,  4 Nov 2024 20:42:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B19E9F80104
	for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2024 20:42:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B19E9F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nPcxgZ4c
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E7535C0FAB;
	Mon,  4 Nov 2024 19:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B257BC4CECE;
	Mon,  4 Nov 2024 19:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730749364;
	bh=/s92982cc/MdC2q4FYzyn4p9mBlEM898SljOJNES+l4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nPcxgZ4cUif3dTkaKxy0Z07nOemCV0kB33MSKir78wv64NucIK74YUcBryIMqB3br
	 zxanUKxlpEeIUf3muBOT8RTGKBgcdl870y+iCLSCusMLu3fbo+wWBzzTtp3d77tSMp
	 ZLUvHlpUqq2M3+YQWrgbXj2xyA9ofoO4uP1ELYSn1i47j0h//JftZWn4dxRS3HNWHe
	 D6tAg7CTF946zyYZzc+N9EgbsB+Zu0MvvT+E7kP8aD8Jay5LfvkXcI1/CQMRVgmr76
	 mZpixnn9pMPw9kIRs+fPbh/0pJMq/eHY664YR3qtwcg7Zy3RjHzw4E/HB9CEWq246a
	 E0en81OsjKFcg==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, 13916275206@139.com,
 alsa-devel@alsa-project.org, tiwai@suse.de, baojun.xu@ti.com,
 Baojun.Xu@fpt.com, navada@ti.com, flaviopr@microsoft.com,
 v-hampiholi@ti.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20241104100055.48-1-shenghao-ding@ti.com>
References: <20241104100055.48-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Add new driver version for tas2563 &
 tas2781 qfn chip
Message-Id: <173074936244.127848.13340343910986887412.b4-ty@kernel.org>
Date: Mon, 04 Nov 2024 19:42:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: YGFBIO4HL64UNWDE5PHQBQ3BTFXAAOVI
X-Message-ID-Hash: YGFBIO4HL64UNWDE5PHQBQ3BTFXAAOVI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGFBIO4HL64UNWDE5PHQBQ3BTFXAAOVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Nov 2024 18:00:55 +0800, Shenghao Ding wrote:
> Add new driver version to support tas2563 & tas2781 qfn chip
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Add new driver version for tas2563 & tas2781 qfn chip
      commit: fe09de2db2365eed8b44b572cff7d421eaf1754a

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

