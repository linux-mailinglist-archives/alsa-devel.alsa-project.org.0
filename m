Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A47703176
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 17:23:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AA3A82C;
	Mon, 15 May 2023 17:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AA3A82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684164230;
	bh=IV23AsLNwzuLafgNGOBzEcDmQMycztCu/qSgpLGtNyc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YuewiJYSvbTlefHCxpjovNA3JXZC3J3fAGqIkyKYQKz4fyBMwakBWghCQ6YgN+JHo
	 JLcGtCuIuSkh3bRWeUzm9KkxjQMUPU2qXtAyymVjHuyS0f6ktBwv52YPw2SmFrGCWX
	 8xAfA3UI65K66FTPvaVQkGkfZn6uLuJ7aec31W84=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E32DEF80563; Mon, 15 May 2023 17:22:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E60E0F80549;
	Mon, 15 May 2023 17:22:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A09FF802E8; Mon, 15 May 2023 17:22:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB74BF8016A
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 17:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB74BF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hOwQ53vE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C67F061EF9;
	Mon, 15 May 2023 15:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3CDC4339C;
	Mon, 15 May 2023 15:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684164120;
	bh=IV23AsLNwzuLafgNGOBzEcDmQMycztCu/qSgpLGtNyc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hOwQ53vEjcIEHXAAGk2B4KhBN8Wp+N66F8w2n5/xtxMXRxE5OrLZRAxIeFekq/Hct
	 RXTuj4cFbjNzvhgcqzN5gtLl8znvvkAZ3qZXRrAmHyOrpQuUGZ96rBbde7nBSFvMZy
	 /zeqKHjU7IR1t65jbf0FjZyJYG/vnoPRKzBYsbwkhIgrzZVQhQpg+0rbx5wPTkLwpV
	 j/8cfMA+otARRpIXfF0YLf+4iGKgGUVJjDquusl+6B77gvLA8KEYjCW0dRL5hagRKe
	 NyFDcItKNAe/LhoQQ0VBHYPFB/IjyiVBtNZL80FC3/grNiorJhbU7RvkWIS+GeqIaO
	 /ZG8SCmp8PzWw==
From: Mark Brown <broonie@kernel.org>
To: lee@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, tglx@linutronix.de, maz@kernel.org,
 linus.walleij@linaro.org, vkoul@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 00/10] Add cs42l43 PC focused SoundWire CODEC
Message-Id: <168416411599.413889.14124867507842096231.b4-ty@kernel.org>
Date: Tue, 16 May 2023 00:21:55 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: RGNQFQUFTJ5GQ4AITDYHPYJ674ODDA7F
X-Message-ID-Hash: RGNQFQUFTJ5GQ4AITDYHPYJ674ODDA7F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGNQFQUFTJ5GQ4AITDYHPYJ674ODDA7F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 May 2023 13:28:28 +0100, Charles Keepax wrote:
> This patch chain adds support for the Cirrus Logic cs42l43 PC focused
> SoundWire CODEC. Some supporting work is included in the chain,
> including adding an ASoC control notification helper function and
> adding support for IRQs generated by the in-band SoundWire alert
> mechanism.
> 
> The chain is currently based of v6.4-rc1 because I am not 100% sure
> which tree we want to send everything through. The CODEC support
> has a build dependency on both the SoundWire change and the ASoC
> soc-component change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[02/10] ASoC: soc-component: Add notify control helper function
        commit: ace9ed54bd874f2c63723b13b1747f6463e2587e
[03/10] ASoC: ak4118: Update to use new component control notify helper
        commit: 476d942e50d4f22d8621a18612dd6cfbf0a5d1d9
[04/10] ASoC: wm_adsp: Update to use new component control notify helepr
        commit: 95d06196c83c9dc1b6fd6cda07a1bac54ca2d568

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

