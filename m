Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 338FB89E2CB
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 20:58:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D10A42BC3;
	Tue,  9 Apr 2024 20:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D10A42BC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712689091;
	bh=XEPl6rvMdUEJUxQcF63UGqxzYLQBf+b+068mHOKHyKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lMRul7qL0Fph/cslQlzwWjG2BIN/WmXC4ro26pzmyXu/WWb0tBjr5cK+mphsvmtP8
	 HgzgiQA+OSr0v3Y5z3arTqIuYvgQAzpkJrAExuXO5g2i4kt4hMy+MQB3akWZATLDQy
	 PHsm3TwxkqlOMRRf0+uG7tb7ZUdacLsSQ6wbt4Ks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E3D7F805A1; Tue,  9 Apr 2024 20:57:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F57EF8059F;
	Tue,  9 Apr 2024 20:57:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9A44F8026D; Tue,  9 Apr 2024 20:57:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 251FAF800C9
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 20:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 251FAF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ri9oDrsK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4077ECE1B42;
	Tue,  9 Apr 2024 18:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A60C433C7;
	Tue,  9 Apr 2024 18:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712689041;
	bh=XEPl6rvMdUEJUxQcF63UGqxzYLQBf+b+068mHOKHyKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ri9oDrsKK06MjsP2/S9PlJBEbNIckYh92Uv1G/Gmnkhr3bfO0N2QdqI05KYfFZZsZ
	 E9wZSeOYWK24MzrQ5A92d6m+K9gYEWujsLt90AyZ5IZeE5MD3zwQo0bzcYXOUy3oKd
	 iJ9Sdu+8T98pdzlgxnaPEGsmYHnui4FEvTQiPBCjI3UYPE0ZEgIJpJtMp/b2GWNbdZ
	 AZDWH3qQJNa3C7rRonVq+jx2AfYjh78P9ntBBXdg+Wy49Y+lN8Pi3geg/jP2jYSzzl
	 3rnbJLIA1L2Ke4csy+Fw1n9bE/vQ61P8no25P1/LX3akwobrJmfzPekpoBisHzwNHE
	 iVOhXGEHPvpGA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, venkataprasad.potturu@amd.com,
 kernel test robot <lkp@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Lucas Tanure <lucas.tanure@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20240408180229.3287220-1-Vijendar.Mukunda@amd.com>
References: <20240408180229.3287220-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: fix for soundwire build dependencies for
 legacy stack
Message-Id: <171268903831.71903.8798252407593021756.b4-ty@kernel.org>
Date: Tue, 09 Apr 2024 19:57:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: BRLSP3PXD7WEIVCO3KEPKBSMHF54MLWV
X-Message-ID-Hash: BRLSP3PXD7WEIVCO3KEPKBSMHF54MLWV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BRLSP3PXD7WEIVCO3KEPKBSMHF54MLWV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 08 Apr 2024 23:32:26 +0530, Vijendar Mukunda wrote:
> The SND_SOC_AMD_SOUNDWIRE Kconfig symbol has build dependency on
> SOUNDWIRE_AMD. It gets it wrong for a configuration involving
> SND_SOC_AMD_SOUNDWIRE_LINK_BASELINE=y,SND_SOC_AMD_PS=y and SOUNDWIRE_AMD=m,
> which results in a link failure:
> 
> ld: vmlinux.o: in function `amd_sdw_probe':
> >> sound/soc/amd/ps/pci-ps.c:271:(.text+0x1d51eff):
> 	undefined reference to `sdw_amd_probe'
> ld: vmlinux.o: in function `acp63_sdw_machine_select':
> >> sound/soc/amd/ps/pci-ps.c:294:(.text+0x1d525d5):
> 	undefined reference to `sdw_amd_get_slave_info'
> ld: vmlinux.o: in function `amd_sdw_exit':
> >> sound/soc/amd/ps/pci-ps.c:280:(.text+0x1d538ce):
> 	undefined reference to `sdw_amd_exit'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: fix for soundwire build dependencies for legacy stack
      commit: 56437a561fefab2be708dfebf80e31c4715eb52e

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

