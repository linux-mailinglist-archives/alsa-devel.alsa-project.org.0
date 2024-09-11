Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A19975A0C
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 20:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05B7A82A;
	Wed, 11 Sep 2024 20:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05B7A82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726078229;
	bh=t70OeUTPl2Hdc8vLGhMSBtVwCkdkMR0JsnyjS2GNsAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mFFgMEIiDk6aTMdwwkJLA/bknx7EfDkfzsRMITM75i3OvgOcGfSu7cbMVd+ZdyO3z
	 dWBQKrIIJMQJk6CcBBg46LonbkHwTPUnHd+4VNWUJTVMgHEC9BfTa1UkGxinTFSUWS
	 biQW3RGkJ60qtINrh3D7IdPRIgQM9y4wgzFjUnqY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A850CF80527; Wed, 11 Sep 2024 20:10:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1920EF805AD;
	Wed, 11 Sep 2024 20:10:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A91CFF801F5; Wed, 11 Sep 2024 20:10:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1568CF80027
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 20:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1568CF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q2qvIMzY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DEE25C0778;
	Wed, 11 Sep 2024 18:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC9FC4CEC0;
	Wed, 11 Sep 2024 18:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726078199;
	bh=t70OeUTPl2Hdc8vLGhMSBtVwCkdkMR0JsnyjS2GNsAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q2qvIMzYmdwsOs/n5Y9KRsjyYolmc+I+asb8nY4g+jh9t4K8HMgVQ4c3t02X2UxwW
	 Wx9E5Pb8uTCiXd+NUd/ucIsuB4h3UXgqys2jgIIQh+JHUnuiV7ZXtlU7LMhgXwOO/M
	 5SQzYsOxfWM9rbz+DdmGx0JoiVgorZy3n1u4GbGpiJ8ruUTvhbd8FgACUyftHzh3TR
	 3Dxo1PFFp95CBfspFYF6p0aaaMg8bAsmBivqueyPczALrh2rBhABPcdFnbYKQm0fQq
	 AhYmaHgDzIsDglr/5IafcOx2w7bfIuJ/GpXz1qEKB5oezpA3CU/snUCJwLsm2Gl3ea
	 sFLBOplnrJ42w==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: kernel@sberdevices.ru, oxffffaa@gmail.com, Stable@vger.kernel.org
In-Reply-To: <20240911142425.598631-1-avkrasnov@salutedevices.com>
References: <20240911142425.598631-1-avkrasnov@salutedevices.com>
Subject: Re: [PATCH v1] ASoC: meson: axg-card: fix 'use-after-free'
Message-Id: <172607819595.127216.9881900790170289531.b4-ty@kernel.org>
Date: Wed, 11 Sep 2024 19:09:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: KE2EODNZW6CM6G6RFPKXDESLVAVWRTV2
X-Message-ID-Hash: KE2EODNZW6CM6G6RFPKXDESLVAVWRTV2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KE2EODNZW6CM6G6RFPKXDESLVAVWRTV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 11 Sep 2024 17:24:25 +0300, Arseniy Krasnov wrote:
> Buffer 'card->dai_link' is reallocated in 'meson_card_reallocate_links()',
> so move 'pad' pointer initialization after this function when memory is
> already reallocated.
> 
> Kasan bug report:
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in axg_card_add_link+0x76c/0x9bc
> Read of size 8 at addr ffff000000e8b260 by task modprobe/356
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-card: fix 'use-after-free'
      commit: 4f9a71435953f941969a4f017e2357db62d85a86

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

