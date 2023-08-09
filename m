Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA632776678
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 19:28:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A93F784A;
	Wed,  9 Aug 2023 19:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A93F784A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691602129;
	bh=mLoGnOPHxbVLWsH4NNSzTWx/xU1npGsvnrelkvn0Ex0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SEle408q/zH8F2Vd8BULgrtbQ2Bwd4KhEkAanU78c8/BVijCg2EEJK4nFXnjfwZKN
	 PJMryeo3X3tYZa0+TKO0G/0Q550g0GDKW4J5/byiQdSLLxv7d1Mk2k9c3bGO9GPdJ7
	 MNKp+UPMrXztBlhf4OeGRnMd0NZYfWMWZBcigEzo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CE48F8056F; Wed,  9 Aug 2023 19:27:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBCE0F80568;
	Wed,  9 Aug 2023 19:27:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83685F80557; Wed,  9 Aug 2023 19:27:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7789EF800F4
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 19:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7789EF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dha+cNJG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0DA56632D8;
	Wed,  9 Aug 2023 17:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C29EC433C8;
	Wed,  9 Aug 2023 17:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691602015;
	bh=mLoGnOPHxbVLWsH4NNSzTWx/xU1npGsvnrelkvn0Ex0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dha+cNJGci43s86hLcqg9q2U+5A76NmUIQkZ0J4H8DlXz/TTrHQtNkaHPRyDdRgei
	 uHvaSFa6vyxDaX/BEhoQswvWf1hlofkqAuZwSm5vj6204hCoVAp/9VR3o42d87gsCv
	 xn37MdS16aW2ySMazuJlH9gntJj/bgPnvaNziaXQLuXccj4D5zsjF2/kXaJ9uIzW7a
	 4BWWGeMuzc3kewQleR8FLImBgllS/F6VlTrBTFl1QHZNxQqea3u62umMs7kh5KTfoL
	 8XZPjwys+CQnt68ohziEZffjrSHDfKUe2Jz3qBCRB8E1SW/7mJ6huwCPuYZFU1Q0Jw
	 iyN5EYi0IQaXg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230808164702.21272-1-rf@opensource.cirrus.com>
References: <20230808164702.21272-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/5] ASoC: cs35l56: Bugfixes
Message-Id: <169160201427.157618.11759081939312972339.b4-ty@kernel.org>
Date: Wed, 09 Aug 2023 18:26:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: DXKVHSYP74TXO5OBSTLE3SVWCLEFX3RS
X-Message-ID-Hash: DXKVHSYP74TXO5OBSTLE3SVWCLEFX3RS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DXKVHSYP74TXO5OBSTLE3SVWCLEFX3RS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 08 Aug 2023 17:46:57 +0100, Richard Fitzgerald wrote:
> Miscellaneous bugfixes for the cs35l56 codec driver.
> 
> Richard Fitzgerald (3):
>   ASoC: cs35l56: Avoid uninitialized variable in
>     cs35l56_set_asp_slot_positions()
>   ASoC: cs35l56: Don't rely on GPIOD_OUT_LOW to set RESET initially low
>   ASoC: cs35l56: Wait for control port ready during system-resume
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: cs35l56: Avoid uninitialized variable in cs35l56_set_asp_slot_positions()
      commit: ebd0f7b08e032900e5327962f7da6bed6f37feb6
[2/5] ASoC: cs35l56: Don't rely on GPIOD_OUT_LOW to set RESET initially low
      commit: 853734588dcb1bf4c41a17e4d9df231965e559db
[3/5] ASoC: cs35l56: Wait for control port ready during system-resume
      commit: f5eb9503e80e70c22e3d3f73a5d3c149c132407f
[4/5] ASoC: wm_adsp: Expose the DSP power down actions as wm_adsp_power_down()
      commit: d0a3a6ad0d3b24578f1b3832ad1d7fbdb20f7a20
[5/5] ASoC: cs35l56: Call wm_adsp_power_down() before reloading firmware
      commit: e24ef967c735bf7272099610e422f964c0a4258b

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

