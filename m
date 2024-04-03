Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5A1896EA9
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 14:07:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B3C42CCE;
	Wed,  3 Apr 2024 14:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B3C42CCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712146027;
	bh=rdpu1fv+YDNO5DeUj4K9w41evcL2oZyCQ49s+KEpRqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f9HdsZpgyIKVvKAT5QKVem451XGxoh1xktAsVVfQZiB5TTlT7sm1gcGEPXNp42bJS
	 TsMDd0VgqBjYq/JPgVYPAIns59GnIxIq55zV8Q1z2bZlZqu3O4gxEFYGVAvFORJJnq
	 FKYvqVnV2uGVBq/e+e3D/UqUEDQYIPhC1lWXjEiU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28244F8020D; Wed,  3 Apr 2024 14:06:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A637AF8056F;
	Wed,  3 Apr 2024 14:06:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 248E2F8020D; Wed,  3 Apr 2024 14:06:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10A59F80130
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 14:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10A59F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=azZm6Uv0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CBFF61384;
	Wed,  3 Apr 2024 12:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D94EC433F1;
	Wed,  3 Apr 2024 12:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712145973;
	bh=rdpu1fv+YDNO5DeUj4K9w41evcL2oZyCQ49s+KEpRqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=azZm6Uv0mlW4ar7arnzKIHwMwtIbZOnVdp1NvEA03p9/EaJzlYrflnTW/kaEE5BWx
	 H9U3+G4ONMBRmCxSjXxpBqBOGF7Di8QV3z9C5OhIK3UfdF7Qrii6dUvy+d3EB1+A99
	 4G6ZumJBZLu/r+UlG1PzB+ZGvwcE3LaumHcLguc3JitDl/7AE49fDCPZmqe1OPVmwm
	 NYMhNu1k81AsTvJr7EqUe52gP8Pvitmv+FxJ/34HYhrApynyZ5T0KYabegA2Wr0SxI
	 PFn43OVj7vmOBuD5766DCHNlE9xpKWEQcqBSiu4Q+Qhd3YTcX2GrO3PJXt8zJxbnym
	 y/L+5D1hFEXSw==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 00/10] Use const where applicable
Message-Id: <171214597120.799854.18095797972355599249.b4-ty@kernel.org>
Date: Wed, 03 Apr 2024 13:06:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: BC3VCC4H7U6ZGN3B6YUBHGWCIIPK7CRH
X-Message-ID-Hash: BC3VCC4H7U6ZGN3B6YUBHGWCIIPK7CRH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BC3VCC4H7U6ZGN3B6YUBHGWCIIPK7CRH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 Apr 2024 11:31:35 +0200, Amadeusz Sławiński wrote:
> Use devm_kstrdup_const in few places to possibly save a bit of memory.
> Mark some of the structs as const, as they are not modified and used as
> is.
> 
> Amadeusz Sławiński (10):
>   ASoC: Intel: avs: hdaudio: Use devm_kstrdup_const
>   ASoC: Intel: avs: Use devm_kstrdup_const
>   ASoC: Intel: avs: hdaudio: Constify probing_link
>   ASoC: Intel: avs: es8336: Constify card_headset_pins
>   ASoC: Intel: avs: nau8825: Constify card_headset_pins
>   ASoC: Intel: avs: rt274: Constify card_headset_pins
>   ASoC: Intel: avs: rt286: Constify card_headset_pins
>   ASoC: Intel: avs: rt298: Constify card_headset_pins
>   ASoC: Intel: avs: rt5663: Constify card_headset_pins
>   ASoC: Intel: avs: rt5682: Constify card_headset_pins
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: Intel: avs: hdaudio: Use devm_kstrdup_const
        commit: 27aa58180473f81990f35238dc8aec40d34c778d
[02/10] ASoC: Intel: avs: Use devm_kstrdup_const
        commit: 68a71af3aee2b776a0030e1393864c9501997cbb
[03/10] ASoC: Intel: avs: hdaudio: Constify probing_link
        commit: a3c95efc432ddd18882cfab420cbea14937fb950
[04/10] ASoC: Intel: avs: es8336: Constify card_headset_pins
        commit: 2dbe7c809841e645a6b9d6d51801d3c594739d93
[05/10] ASoC: Intel: avs: nau8825: Constify card_headset_pins
        commit: bf400f16a03788ccdb1de1d9bfe9458082f24ef7
[06/10] ASoC: Intel: avs: rt274: Constify card_headset_pins
        commit: 130c953a75cc62dd5c73c295bae14197dce46b85
[07/10] ASoC: Intel: avs: rt286: Constify card_headset_pins
        commit: 682bedc8b0bae52fc5fc95cb3dba6e3d590da653
[08/10] ASoC: Intel: avs: rt298: Constify card_headset_pins
        commit: 33a886eee711298e799f1f52432e2f5e234cd015
[09/10] ASoC: Intel: avs: rt5663: Constify card_headset_pins
        commit: a055674868fa9d36f290dba906a76dd45801a37e
[10/10] ASoC: Intel: avs: rt5682: Constify card_headset_pins
        commit: 5faf65b5d1e36ec0a1eb3ba8ba2a8b7a779575ce

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

